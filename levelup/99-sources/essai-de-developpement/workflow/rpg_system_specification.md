# 🎮 LevelUP — Spécification Consolidée Finale du Système RPG

> **Version** : 2.0.0 — Post-analyse croisée  
> **Date** : 2026-06-19  
> **Statut** : ✅ VALIDÉ — Prêt pour implémentation  
> **Sources** : 11 documents du dossier `evolute_rpg/` + analyse croisée  

---

## 1. Vision & Principes Fondateurs

> **"Apprendre en s'amusant, avec discipline et rigueur."**

LevelUP est un **système de progression encadrée** inspiré des RPG. L'utilisateur avance dans un parcours défini, débloque des paliers, et prouve sa maturité avant de passer au niveau supérieur.

### Règles Fondamentales

1. **XP méritée uniquement** — Pas d'XP pour l'ouverture d'une page, la consultation passive ou un clic sans achèvement
2. **Niveau = maturité** — On passe de niveau parce qu'on a démontré compréhension, rétention et application
3. **Consolidation obligatoire** — Les bases anciennes doivent rester vivantes, pas seulement traversées
4. **Rigueur mesurée** — Rappeler → encadrer → corriger → seulement ensuite sanctionner plus fort
5. **Cohérence front/back** — L'interface ne doit jamais inventer un état non supporté par la base

---

## 2. Les 5 Moteurs

| Moteur | Rôle | Phase | Existant ? |
|:---|:---|:---|:---|
| **Progression Engine** | XP, niveaux composites, verrouillage DAG, stats, classes | Phase 1 | 🔄 Partiel |
| **Mission Engine** | Génération, notification, activation, deadline, obligation, remédiation | Phase 2 | ❌ Nouveau |
| **Assessment Engine** | QCM, tests, exercices, validation de maîtrise | Phase 3 | ❌ Nouveau |
| **Retention Engine** | Rappels espacés, révisions, consolidation, vérification mémoire long terme | Phase 2 | ❌ Nouveau |
| **AI Tutor Engine** | Génération adaptive de contenu, QCM, exercices contextuels | Phase 4 | ❌ Nouveau |

---

## 3. Décisions Architecturales Figées

### D1 — Passage de niveau = composite (XP + Maîtrise + Consolidation)

Le niveau ne dépend PAS uniquement de l'XP. Trois conditions doivent être remplies :

| Condition | Seuil | Vérification |
|:---|:---|:---|
| XP minimum atteint | `(level)² × 100` | `UserProfile.totalXP` |
| Maîtrise du palier courant | >= 70% topics validés dans le palier | Agrégation `UserTopicProgress` |
| Consolidation vérifiée | Aucun topic `needsRevision=true` dans les paliers précédents | `UserTopicProgress.needsRevision` |

Si les conditions ne sont pas remplies → le système propose des missions de remédiation.

### D2 — Mission Engine = extension du modèle Quest

Le modèle Quest/UserQuest supporte le lifecycle complet :
```
proposed → notified → pending_activation → active → completed
                                      ↘ expired → mandatory → failed
```

### D3 — Retention Engine = CRON service

Un `RetentionCronService` tournant quotidiennement :
1. Détecte les topics validés non révisés depuis > 14 jours (configurable)
2. Passe `UserTopicProgress.needsRevision = true`
3. Génère automatiquement une Quest de type `revision`
4. Notifie l'utilisateur

### D4 — Enrichissement de UserTopicProgress (pas de nouvelle table)

5 champs ajoutés : `validatedAt`, `masteredAt`, `retentionScore`, `lastReviewedAt`, `needsRevision`

### D5 — Notifications en BDD + polling (WebSocket en Phase 4)

### D6 — IA Tutor = Phase 4 uniquement, QCM template-based en Phase 3

### D7 — Stats = colonnes dénormalisées recalculées (pas de snapshots)

### D8 — Règles de verrouillage en code (pas de LockRule en base)

---

## 4. Formules de Calcul

### 4.1 XP par Action

| Action | XP base | Multiplicateurs |
|:---|:---|:---|
| Valider un Topic (`validated`) | +50 XP | × difficulté (1.0/1.5/2.0) |
| Maîtriser un Topic (`mastered`) | +25 XP bonus | × 1.0 |
| Compléter une Session (>= durée prévue) | +20 XP | × streak_multiplier |
| Réussir un QCM (>= 80%) | +30 XP | × (score / 100) |
| Streak journalier (3+ jours) | +10 XP/jour | × floor(streak / 7 + 1) |
| Première validation d'un Module | +100 XP bonus | × 1.0 |
| Mission complétée dans les temps | +15 XP bonus | × 1.0 |
| Révision active réussie | +10 XP | × 1.0 |

### 4.2 Multiplicateur de Streak

```
streak_multiplier = 1.0 + min(currentStreak * 0.05, 0.5)
```

### 4.3 Niveau (indicateur XP)

```
level = floor(sqrt(totalXP / 100)) + 1
xp_for_next_level = (level)² × 100
progress_percentage = (totalXP - (level-1)² × 100) / (level² × 100 - (level-1)² × 100) × 100
```

> ⚠️ Le passage effectif est verrouillé par les 3 conditions D1, pas seulement l'XP.

### 4.4 Pénalités XP

| Événement | Perte |
|:---|:---|
| Session manquée (non justifiée) | -20 XP |
| Score discipline < 50 | -5 XP/jour |
| Streak cassé | -10 XP |
| Mission mandatory non complétée | -15 XP |
| Non-consolidation détectée | Verrouillage du palier suivant (pas de perte XP) |

### 4.5 Actions qui NE donnent PAS d'XP

- Ouverture d'une page
- Consultation passive
- Activité sans résultat
- Clic non suivi d'achèvement
- Tentative manifestement insuffisante

---

## 5. Modèle de Données Prisma — Delta Complet

### 5.1 Nouvelles Enums

```prisma
enum QuestStatus {
  proposed
  notified
  pending_activation
  active
  completed
  expired
  mandatory
  failed
}

enum QuestType {
  daily
  weekly
  story
  challenge
  revision
  remediation
  project
}

enum AchievementRarity {
  common
  rare
  epic
  legendary
}
```

### 5.2 Modifications sur Modèles Existants

```diff
 model User {
   // champs existants conservés...
+  profile         UserProfile?
+  quizAttempts    QuizAttempt[]
+  notifications   Notification[]
 }

 model Topic {
   // champs existants conservés...
+  quizzes         Quiz[]
 }

 model UserTopicProgress {
   // champs existants conservés...
+  validatedAt     DateTime?    @map("validated_at") @db.Timestamptz
+  masteredAt      DateTime?    @map("mastered_at") @db.Timestamptz
+  retentionScore  Int          @default(100) @map("retention_score")
+  lastReviewedAt  DateTime?    @map("last_reviewed_at") @db.Timestamptz
+  needsRevision   Boolean      @default(false) @map("needs_revision")
 }
```

### 5.3 Nouveaux Modèles

```prisma
// ═══════════════════════════════════════
// NOYAU RPG
// ═══════════════════════════════════════

model UserProfile {
  id              String   @id @default(uuid()) @db.Uuid
  userId          String   @unique @map("user_id") @db.Uuid
  user            User     @relation(fields: [userId], references: [id], onDelete: Cascade)
  totalXP         Int      @default(0) @map("total_xp")
  level           Int      @default(1)
  className       String   @default("Recrue du Système") @map("class_name")
  classIcon       String   @default("🔰") @map("class_icon")
  primaryPath     String?  @map("primary_path")
  statMemory      Int      @default(10) @map("stat_memory")
  statKernel      Int      @default(10) @map("stat_kernel")
  statNetwork     Int      @default(10) @map("stat_network")
  statOrchestra   Int      @default(10) @map("stat_orchestra")
  statDiscipline  Int      @default(10) @map("stat_discipline")
  bio             String?
  avatarUrl       String?  @map("avatar_url")
  activeTitle     String?  @map("active_title")
  createdAt       DateTime @default(now()) @map("created_at") @db.Timestamptz
  updatedAt       DateTime @default(now()) @updatedAt @map("updated_at") @db.Timestamptz
  achievements    UserAchievement[]
  titles          UserTitle[]
  quests          UserQuest[]
  xpLogs          XPLog[]

  @@map("user_profiles")
}

model Achievement {
  id           String           @id @default(uuid()) @db.Uuid
  code         String           @unique
  name         String
  description  String
  icon         String           @default("🏆")
  category     String
  xpReward     Int              @default(0) @map("xp_reward")
  rarity       AchievementRarity @default(common)
  triggerType  String           @map("trigger_type")
  triggerValue Int              @map("trigger_value")
  triggerMeta  Json?            @map("trigger_meta")
  users        UserAchievement[]

  @@map("achievements")
}

model UserAchievement {
  id            String      @id @default(uuid()) @db.Uuid
  userId        String      @map("user_id") @db.Uuid
  userProfile   UserProfile @relation(fields: [userId], references: [userId], onDelete: Cascade)
  achievementId String      @map("achievement_id") @db.Uuid
  achievement   Achievement @relation(fields: [achievementId], references: [id], onDelete: Cascade)
  unlockedAt    DateTime    @default(now()) @map("unlocked_at") @db.Timestamptz

  @@unique([userId, achievementId])
  @@map("user_achievements")
}

model Title {
  id                 String   @id @default(uuid()) @db.Uuid
  code               String   @unique
  name               String
  description        String
  category           String
  rarity             String   @default("common")
  requireLevel       Int?     @map("require_level")
  requireAchievement String?  @map("require_achievement")
  users              UserTitle[]

  @@map("titles")
}

model UserTitle {
  id          String      @id @default(uuid()) @db.Uuid
  userId      String      @map("user_id") @db.Uuid
  userProfile UserProfile @relation(fields: [userId], references: [userId], onDelete: Cascade)
  titleId     String      @map("title_id") @db.Uuid
  title       Title       @relation(fields: [titleId], references: [id], onDelete: Cascade)
  earnedAt    DateTime    @default(now()) @map("earned_at") @db.Timestamptz

  @@unique([userId, titleId])
  @@map("user_titles")
}

model XPLog {
  id          BigInt      @id @default(autoincrement())
  userId      String      @map("user_id") @db.Uuid
  userProfile UserProfile @relation(fields: [userId], references: [userId], onDelete: Cascade)
  amount      Int
  source      String
  sourceId    String?     @map("source_id") @db.Uuid
  description String
  createdAt   DateTime    @default(now()) @map("created_at") @db.Timestamptz

  @@index([userId])
  @@map("xp_logs")
}

// ═══════════════════════════════════════
// NOYAU MISSIONS
// ═══════════════════════════════════════

model Quest {
  id             String    @id @default(uuid()) @db.Uuid
  code           String    @unique
  name           String
  description    String
  type           QuestType
  xpReward       Int       @map("xp_reward")
  objectiveType  String    @map("objective_type")
  objectiveCount Int       @map("objective_count")
  objectiveMeta  Json?     @map("objective_meta")
  timeLimit      Int?      @map("time_limit")
  repeatInterval String?   @map("repeat_interval")
  users          UserQuest[]

  @@map("quests")
}

model UserQuest {
  id                  String      @id @default(uuid()) @db.Uuid
  userId              String      @map("user_id") @db.Uuid
  userProfile         UserProfile @relation(fields: [userId], references: [userId], onDelete: Cascade)
  questId             String      @map("quest_id") @db.Uuid
  quest               Quest       @relation(fields: [questId], references: [id], onDelete: Cascade)
  progress            Int         @default(0)
  status              QuestStatus @default(proposed)
  notifiedAt          DateTime?   @map("notified_at") @db.Timestamptz
  activationDeadline  DateTime?   @map("activation_deadline") @db.Timestamptz
  completionDeadline  DateTime?   @map("completion_deadline") @db.Timestamptz
  isMandatory         Boolean     @default(false) @map("is_mandatory")
  startedAt           DateTime    @default(now()) @map("started_at") @db.Timestamptz
  completedAt         DateTime?   @map("completed_at") @db.Timestamptz

  @@unique([userId, questId])
  @@map("user_quests")
}

// ═══════════════════════════════════════
// NOYAU ÉVALUATION (QCM)
// ═══════════════════════════════════════

model Quiz {
  id           String         @id @default(uuid()) @db.Uuid
  topicId      String         @map("topic_id") @db.Uuid
  topic        Topic          @relation(fields: [topicId], references: [id], onDelete: Cascade)
  title        String
  description  String?
  passingScore Int            @default(80) @map("passing_score")
  timeLimit    Int?           @map("time_limit")
  questions    QuizQuestion[]
  attempts     QuizAttempt[]

  @@index([topicId])
  @@map("quizzes")
}

model QuizQuestion {
  id           String @id @default(uuid()) @db.Uuid
  quizId       String @map("quiz_id") @db.Uuid
  quiz         Quiz   @relation(fields: [quizId], references: [id], onDelete: Cascade)
  questionText String @map("question_text")
  questionType String @default("multiple_choice") @map("question_type")
  options      Json
  explanation  String?
  points       Int    @default(1)
  order        Int

  @@index([quizId])
  @@map("quiz_questions")
}

model QuizAttempt {
  id          String    @id @default(uuid()) @db.Uuid
  quizId      String    @map("quiz_id") @db.Uuid
  quiz        Quiz      @relation(fields: [quizId], references: [id], onDelete: Cascade)
  userId      String    @map("user_id") @db.Uuid
  user        User      @relation(fields: [userId], references: [id], onDelete: Cascade)
  score       Int
  passed      Boolean
  answers     Json
  startedAt   DateTime  @default(now()) @map("started_at") @db.Timestamptz
  completedAt DateTime? @map("completed_at") @db.Timestamptz

  @@index([quizId, userId])
  @@map("quiz_attempts")
}

// ═══════════════════════════════════════
// NOYAU SYSTÈME
// ═══════════════════════════════════════

model Notification {
  id        String   @id @default(uuid()) @db.Uuid
  userId    String   @map("user_id") @db.Uuid
  user      User     @relation(fields: [userId], references: [id], onDelete: Cascade)
  type      String
  priority  String   @default("normal")
  title     String
  message   String
  icon      String   @default("📢")
  metadata  Json?
  read      Boolean  @default(false)
  linkTo    String?  @map("link_to")
  expiresAt DateTime? @map("expires_at") @db.Timestamptz
  createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz

  @@index([userId, read])
  @@map("notifications")
}
```

---

## 6. Backend — Services & API

### 6.1 Module `rpg` (Phase 1)

**`RPGService`** — Service principal du moteur RPG

| Méthode | Rôle |
|:---|:---|
| `awardXP(event)` | Calcule et attribue l'XP (avec multiplicateurs), met à jour le niveau |
| `checkLevelUp(userId)` | Vérifie les 3 conditions D1 (XP + maîtrise + consolidation) |
| `recalculateStats(userId)` | Recalcule les 5 attributs basés sur `UserTopicProgress` |
| `evaluateClass(userId)` | Détermine la classe par la branche dominante |
| `checkAchievements(userId)` | Vérifie et attribue les achievements débloqués |
| `getFullProfile(userId)` | Retourne le profil RPG complet |

**Endpoints API :**

| Méthode | Route | Description |
|:---|:---|:---|
| `GET` | `/rpg/profile` | Profil RPG complet |
| `GET` | `/rpg/xp-history` | Historique XP paginé |
| `GET` | `/rpg/achievements` | Tous les achievements + statut |
| `GET` | `/rpg/titles` | Titres obtenus + actif |
| `PUT` | `/rpg/title` | Changer le titre actif |
| `GET` | `/rpg/skill-tree` | Arbre de compétences |

### 6.2 Module `notifications` (Phase 1)

| Méthode | Route | Description |
|:---|:---|:---|
| `GET` | `/notifications` | Notifications paginées |
| `GET` | `/notifications/unread-count` | Compteur non-lues |
| `PUT` | `/notifications/:id/read` | Marquer comme lue |
| `PUT` | `/notifications/read-all` | Tout marquer comme lu |

### 6.3 Module `missions` (Phase 2)

| Méthode | Route | Description |
|:---|:---|:---|
| `GET` | `/missions/active` | Missions actives de l'utilisateur |
| `GET` | `/missions/pending` | Missions en attente d'activation |
| `POST` | `/missions/:id/activate` | Activer une mission notifiée |
| `POST` | `/missions/:id/complete` | Marquer comme complétée |
| `GET` | `/missions/history` | Historique des missions |

### 6.4 Module `quiz` (Phase 3)

| Méthode | Route | Description |
|:---|:---|:---|
| `GET` | `/quiz/topic/:topicId` | Quiz disponible pour un topic |
| `POST` | `/quiz/:quizId/attempt` | Soumettre une tentative |
| `GET` | `/quiz/attempts/me` | Historique des tentatives |

### 6.5 Intégration entre Services

```
ProgressionService.validateTopic()
    → RPGService.awardXP(source: "topic_validation")
        → RPGService.checkLevelUp()
        → RPGService.checkAchievements()
        → MissionService.updateProgress("validate_topics", 1)
        → NotificationsService.create(...)

SessionsService.completeSession()
    → RPGService.awardXP(source: "session_complete")
    → MissionService.updateProgress("complete_sessions", 1)

QuizService.submitAttempt() [si passed]
    → RPGService.awardXP(source: "qcm_pass")
    → ProgressionService.validateTopic() [si score >= passing]
    → MissionService.updateProgress("pass_qcm", 1)

RetentionCronService (quotidien)
    → Détecte topics non révisés > 14j
    → UserTopicProgress.needsRevision = true
    → MissionService.createRevisionMission()
    → NotificationsService.create(type: "revision_reminder")

AccountabilityCronService (existant)
    → RPGService.awardXP(source: "penalty", amount: négatif)
```

---

## 7. Frontend — Pages & Navigation

### 7.1 Sidebar RPG

```
┌─────────────────────────────┐
│  ⬡ LevelUP                 │
│  SYSTEM v3.0.0              │
├─────────────────────────────┤
│  [AVATAR]  Username         │
│   Lvl 12   Classe: ...     │
│  ▓▓▓▓▓▓▓░░░ 72% → Lvl 13  │
├─────────────────────────────┤
│  📊 Hub Central             │  /dashboard
│  🌳 Arbre de Compétences   │  /skill-tree (NEW)
│  📚 Catalogue des Parcours │  /curriculum
│  📅 Centre de Missions     │  /missions (NEW)
│  🛡 Discipline & Statut    │  /discipline
│  📝 Centre d'Évaluation    │  /tests (NEW)
│  💻 Terminaux Connectés    │  /devices
│  👤 Profil Système          │  /profile
│  ⚙ Administration          │  /admin (admin only)
├─────────────────────────────┤
│  🚪 Déconnexion             │
└─────────────────────────────┘
```

### 7.2 Dashboard — Centre opérationnel

Doit répondre en 1 seconde à :
1. **Où en suis-je ?** → Niveau, XP, progression
2. **Que dois-je faire ?** → Mission active, prochaine mission
3. **Qu'est-ce qui est verrouillé ?** → Verrous, révisions demandées

### 7.3 Nouvelles Pages

| Route | Nom | Phase |
|:---|:---|:---|
| `/missions` | Mission Center (lifecycle complet) | Phase 2 |
| `/skill-tree` | Arbre de compétences SVG interactif | Phase 3 |
| `/tests` | Centre d'évaluation QCM (examen + entraînement) | Phase 3 |

---

## 8. Achievements & Titres (Seed)

### Achievements (17)

| Code | Nom | Condition | Rareté | XP |
|:---|:---|:---|:---|:---|
| `FIRST_BLOOD` | Première Validation | 1 topic validé | common | +25 |
| `APPRENTICE` | Apprenti du Système | 10 topics validés | common | +50 |
| `JOURNEYMAN` | Compagnon Technique | 25 topics validés | rare | +100 |
| `EXPERT` | Expert Confirmé | 50 topics validés | epic | +200 |
| `MASTER` | Maître Absolu | 100 topics validés | legendary | +500 |
| `MODULE_CLEAR` | Module Achevé | 1 module complet | rare | +150 |
| `PATH_COMPLETE` | Voie Accomplie | 1 parcours complet | legendary | +1000 |
| `STREAK_3` | Flamme Naissante | Streak 3 jours | common | +20 |
| `STREAK_7` | Semaine de Fer | Streak 7 jours | rare | +50 |
| `STREAK_30` | Mois d'Acier | Streak 30 jours | epic | +200 |
| `STREAK_100` | Centurion | Streak 100 jours | legendary | +500 |
| `PERFECT_DP` | Discipline Parfaite | 100 DP pendant 7 jours | epic | +150 |
| `COMEBACK` | Retour en Force | <50 à 100 DP | rare | +75 |
| `FIRST_SESSION` | Première Séance | 1 session complétée | common | +15 |
| `DEEP_WORKER` | Travailleur Profond | Session >= 60min | rare | +50 |
| `FIRST_PASS` | Premier Examen | 1 QCM réussi | common | +20 |
| `PERFECT_SCORE` | Score Parfait | 100% à un QCM | epic | +100 |

### Rangs (par niveau)

| Rang | Niveaux | Couleur |
|:---|:---|:---|
| Fer | 1–4 | `#8B8B8B` |
| Bronze | 5–9 | `#CD7F32` |
| Argent | 10–14 | `#C0C0C0` |
| Or | 15–19 | `#FFD700` |
| Platine | 20–24 | `#00CED1` |
| Diamant | 25–29 | `#B9F2FF` |
| Légende | 30+ | `#FF6B6B` |

### Classes (par spécialisation)

| Branche Dominante | Classe | Icône |
|:---|:---|:---|
| Développement Système | Forgeur de Code | ⚒️ |
| Administration Linux | Gardien du Kernel | 🛡️ |
| Réseau & Télécom | Tisserand de Flux | 🌐 |
| DevOps / DevSecOps | Orchestrateur | ⚡ |
| Équilibré | Polymathe | 🔮 |

---

## 9. Plan d'Implémentation — 4 Phases

### Phase 1 — Fondations RPG (Semaine 1-2)

| Priorité | Tâche |
|:---|:---|
| 🔴 | Migration Prisma : UserProfile, Achievement, UserAchievement, Title, UserTitle, XPLog, Notification + enrichir UserTopicProgress |
| 🔴 | Seed : 17 achievements + 7 titres par défaut |
| 🔴 | RPGService : awardXP, checkLevelUp (composite D1), recalculateStats, evaluateClass, checkAchievements |
| 🔴 | RPGController : GET /rpg/profile, GET /rpg/achievements, GET /rpg/titles, PUT /rpg/title |
| 🔴 | NotificationsService + Controller |
| 🔴 | Intégration ProgressionService → RPGService |
| 🔴 | Intégration SessionsService → RPGService |
| 🟠 | Refonte Sidebar : XP bar, niveau, classe (données réelles) |
| 🟠 | Refonte Dashboard : KPI cards (XP, Niveau, Streak, DP) + achievements récents |
| 🟠 | Notification dropdown v2 (basé sur table Notification) |
| 🟠 | Profil RPG v2 : radar chart stats, inventaire achievements, titres |

### Phase 2 — Missions & Rétention (Semaine 3-4)

| Priorité | Tâche |
|:---|:---|
| 🔴 | Migration Prisma : Quest, UserQuest (lifecycle complet) |
| 🔴 | MissionService : assignation quotidienne, gestion deadlines, passage mandatory |
| 🔴 | CRON missions : daily quests, expiration, mandatory |
| 🔴 | RetentionCronService : détection topics > 14j, flag needsRevision, quests revision |
| 🔴 | Page /missions (Mission Center) : états visuels, urgence, délais |
| 🟠 | Page /notifications dédiée : paginée, filtres, mark-as-read |
| 🟠 | Intégration pénalités → missions correctives |

### Phase 3 — QCM & Skill Tree (Semaine 5-6)

| Priorité | Tâche |
|:---|:---|
| 🔴 | Migration Prisma : Quiz, QuizQuestion, QuizAttempt |
| 🔴 | QuizService : CRUD, soumission, calcul score, impact progression |
| 🔴 | Page /tests : mode examen + mode entraînement |
| 🔴 | Seed QCM par défaut pour les parcours existants |
| 🟠 | Page /skill-tree : SVG interactif avec données réelles |
| 🟠 | Vérification consolidation dans checkLevelUp (condition D1.3) |
| 🟠 | Admin : calibration seuils XP, maîtrise, délais |

### Phase 4 — IA & Polish (Semaine 7+)

| Priorité | Tâche |
|:---|:---|
| 🟡 | AI Proxy (LLM) : génération QCM, exercices |
| 🟡 | Adaptation de difficulté basée sur historique erreurs |
| 🟡 | Admin supervision avancée : cohortes, blocages |
| 🟡 | WebSocket notifications temps réel |
| 🟡 | Responsive mobile |

---

> Ce document est la **référence unique** pour l'implémentation du système RPG LevelUP.
> Il intègre les apports des 11 documents source et les 8 décisions architecturales validées.
