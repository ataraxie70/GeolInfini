# 🔬 LevelUP — Analyse Croisée des Spécifications RPG

> **Objectif** : Croiser les 11 documents du dossier `evolute_rpg/`, identifier les convergences, résoudre les divergences, et figer les décisions architecturales avant de coder quoi que ce soit.

---

## 📚 Inventaire des Sources

| # | Document | Rôle | Lignes |
|:--|:---|:---|:---|
| 1 | [level_up_specification_rpg_corrigee.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/level_up_specification_rpg_corrigee.md) | **Vision produit & philosophie pédagogique** — Document directeur | 467 |
| 2 | [level_up_livrable_markdown_global.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/level_up_livrable_markdown_global.md) | **Pack global** — UI/UX + DB + migration | 470 |
| 3 | [level_up_ui_ux_db_specification.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/level_up_ui_ux_db_specification.md) | **Spécification détaillée** UI/UX Learner + Admin + DB | 635 |
| 4 | [rpg_system_specification.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/rpg_system_specification.md) | **Spécification technique** — Prisma, API, formules, achievements | 951 |
| 5 | [01-learner-ui-spec.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/01-learner-ui-spec.md) | Résumé UI Learner | 64 |
| 6 | [02-admin-ui-spec.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/02-admin-ui-spec.md) | Résumé UI Admin | 40 |
| 7 | [03-progression-engine.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/03-progression-engine.md) | Moteur de progression — Mastery + Discipline + Consolidation | 55 |
| 8 | [04-mission-engine.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/04-mission-engine.md) | Moteur de missions — Lifecycle & deadlines | 32 |
| 9 | [05-prisma-architecture.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/05-prisma-architecture.md) | Architecture DB — 6 noyaux de données | 60 |
| 10 | [06-ai-tutor-engine.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/evolute_rpg/levelup_pack/06-ai-tutor-engine.md) | Moteur IA — Introduction progressive | 34 |
| 11 | [rpg_system_specification.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/rpg_system_specification.md) (workflow root) | Spécification initiale générée (doublon partiel du #4) | ~950 |

---

## ✅ Convergences Unanimes (Décisions déjà figées)

Tous les documents convergent sur ces points fondamentaux :

### 1. Philosophie : "XP méritée, pas XP vide"
> *"On ne récompense pas l'activité vide. On récompense la maîtrise réelle."* — Doc #1, §2

**Règle figée** : L'XP n'est accordée que pour une action démontrant une progression réelle (validation, QCM réussi, session complétée, mission dans les temps). Jamais pour l'ouverture d'une page, la consultation passive ou un clic sans achèvement.

### 2. Architecture : 5 Moteurs
Tous les documents identifient 5 moteurs principaux :

| Moteur | Rôle | Déjà existant ? |
|:---|:---|:---|
| **Progression Engine** | XP, niveaux, verrouillage DAG, stats | 🔄 Partiellement (DAG existant, XP/niveaux à ajouter) |
| **Mission Engine** | Génération, notification, activation, deadline, obligation | ❌ Nouveau |
| **Assessment Engine** | QCM, tests, exercices, validation de maîtrise | ❌ Nouveau |
| **Retention Engine** | Rappels espacés, révisions, consolidation | ❌ Nouveau |
| **AI Tutor Engine** | Génération adaptive de contenu, QCM, exercices | ❌ Nouveau (Phase 4) |

### 3. Phasage : 4 Phases progressives
| Phase | Focus | Tous d'accord |
|:---|:---|:---|
| **Phase 1** | Noyau de progression (XP, niveaux, états, migration Prisma, UI fondation) | ✅ |
| **Phase 2** | Missions & discipline (deadlines, obligations, pénalités, rappels) | ✅ |
| **Phase 3** | QCM, Skill Tree, révision, consolidation | ✅ |
| **Phase 4** | IA Tutor progressive | ✅ |

### 4. UI/UX : Pages & navigation
Consensus sur la structure de navigation :
- Dashboard = centre opérationnel
- Mission Center (nouveau)
- Skill Tree (nouveau)
- Centre de Tests/QCM (nouveau)
- Profil RPG enrichi
- Notifications système
- Admin : Builder, Importateur, Calibration, Supervision

### 5. Migration : Approche incrémentale
> *"Ajouter les nouvelles tables avant de modifier les anciennes. Pas de suppression brutale."* — Doc #2, §9.2

---

## ⚠️ Divergences & Incohérences à Résoudre

### DIVERGENCE 1 : Mastery Score vs XP pur pour le passage de niveau

**Doc #1 (spec corrigée)** et **Doc #7 (progression-engine)** sont catégoriques :

> *"Le passage à un niveau supérieur ne dépend pas uniquement d'un total d'XP."* — Doc #1, §7.1
> *"Un niveau n'est débloqué que si : le seuil d'XP est atteint **ET** le score de maîtrise est suffisant **ET** la rétention est suffisante."* — Doc #7

**Doc #4 (rpg_system_specification)** utilise une formule purement basée sur l'XP :
```
level = floor(sqrt(totalXP / 100)) + 1
```

**⚡ Décision proposée** : Adopter le modèle hybride des docs #1/#7. Le niveau est un **composite** :
- Condition 1 : Seuil d'XP atteint
- Condition 2 : Score de maîtrise >= seuil (% de topics validés/maîtrisés dans le palier courant)
- Condition 3 : Consolidation vérifiée (pas de topics "à réviser" dans les niveaux précédents)

Le `level` calculé dans `UserProfile` reste un indicateur, mais le **passage effectif** est verrouillé par ces 3 conditions.

---

### DIVERGENCE 2 : Retention Engine — absent de la spec technique

**Docs #1, #2, #3, #7** insistent fortement sur un **système de rétention** :
> *"Les connaissances d'un niveau doivent rester disponibles pour la suite."* — Doc #2, §2.3
> *"Rappels espacés, missions de réactivation, mini-tests de révision, exercices de transfert, retours aux fondamentaux."* — Doc #1, §8.1

**Doc #4 (spec technique)** n'implémente aucun mécanisme de rétention. Pas de `RevisionReminder`, pas de `retentionScore`, pas de `LockRule` dans le schéma Prisma.

**⚡ Décision proposée** : Ajouter au schéma Prisma :
- Champ `retentionScore` (0-100) sur `UserTopicProgress`
- Champ `lastReviewedAt` sur `UserTopicProgress`
- Modèle `RevisionReminder` pour planifier les rappels espacés
- Logique dans le `Retention Engine` (CRON) qui :
  - Détecte les topics validés non révisés depuis X jours
  - Génère des missions de type "revision" automatiquement
  - Peut verrouiller temporairement un palier si la rétention tombe sous un seuil

---

### DIVERGENCE 3 : Mission Engine vs Quest System

**Docs #1, #2, #3, #7, #8** parlent de **missions** avec un lifecycle complet :
```
Generated -> Notified -> Available -> Activated -> Completed
                    \-> Expired -> Mandatory
```

Avec des propriétés spécifiques :
- **Fenêtre d'activation** (délai pour commencer)
- **Deadline** (date limite)
- **Obligation** (si non activée à temps, elle devient obligatoire)
- **Types** : Study, Quiz, Revision, Project, Emergency

**Doc #4 (spec technique)** utilise un modèle **Quest** plus simple (daily/weekly/story/challenge) sans fenêtre d'activation, sans état "mandatory", sans missions correctives.

**⚡ Décision proposée** : Fusionner les deux concepts. Le modèle `Quest` dans Prisma doit supporter TOUS les états du Mission Engine :

```
États : proposed | notified | pending_activation | active | completed | expired | mandatory | failed
```

Champs supplémentaires à ajouter au modèle `UserQuest` :
- `notifiedAt` : date de notification
- `activationDeadline` : date limite pour activer
- `completionDeadline` : date limite pour compléter
- `isMandatory` : boolean (passe à true si activationDeadline dépassée)
- `penaltyApplied` : boolean

---

### DIVERGENCE 4 : Tables manquantes dans le schéma Prisma technique

Le **Doc #9 (05-prisma-architecture)** liste 6 noyaux avec des entités qui n'existent PAS dans le schéma Prisma du Doc #4 :

| Entité listée dans Doc #9 | Présente dans Doc #4 ? | Nécessaire ? |
|:---|:---|:---|
| `LevelHistory` | ❌ | ✅ Oui — tracer les changements de niveau |
| `StatSnapshot` | ❌ | 🟡 Optionnel — les stats sont recalculables |
| `MissionDeadline` | ❌ | ❌ → Intégrer dans `UserQuest` |
| `MissionPenalty` | ❌ | ❌ → Utiliser `Penalty` existant |
| `QuizAnswer` | ❌ | ❌ → Stocké dans `QuizAttempt.answers` (JSON) |
| `QuizResult` | ❌ | ❌ → Calculé à la volée |
| `SystemEvent` | ❌ | ✅ Oui — journal d'événements système |
| `RevisionReminder` | ❌ | ✅ Oui — rappels de rétention |
| `LockRule` / `UnlockRule` | ❌ | 🟡 Optionnel — peut être en config JSON |
| `UserPreference` | ❌ | ✅ Oui — préférences de notification |
| `Class` (table dédiée) | ❌ (c'est un string) | ❌ → Garder comme string calculé |

---

### DIVERGENCE 5 : TopicProgress — champs manquants

**Doc #7 (progression-engine)** et **Doc #3 (UI/UX DB spec)** demandent des champs sur TopicProgress que la spec technique n'a pas :

| Champ demandé | Doc source | Présent dans schema.prisma ? |
|:---|:---|:---|
| `validatedAt` (date de validation) | Doc #3, §9.2 | ❌ — Seulement `updatedAt` |
| `masteredAt` (date de maîtrise) | Doc #3, §9.2 | ❌ |
| `retentionScore` (0-100) | Doc #3, §9.2 | ❌ |
| `lastReviewedAt` | Doc #3, §9.2 | ❌ |
| `needsRevision` (boolean) | Doc #3, §9.2 | ❌ |

**⚡ Décision proposée** : Enrichir `UserTopicProgress` avec ces 5 champs.

---

### DIVERGENCE 6 : Ordre des phases Admin

**Docs #1, #7** mettent l'Admin en Phase 4.
**Doc #3** met l'Admin en Phase B (juste après les fondations UI).

**⚡ Décision proposée** : L'admin fonctionnel existe DÉJÀ (page `/admin` avec builder, importateur). On ne refait pas l'admin en phase 1. Les améliorations admin (calibration, supervision) arrivent en Phase 3-4.

---

## 🏗️ Décisions Architecturales à Figer

Voici les 8 décisions qui doivent être validées avant toute implémentation :

### D1 — Passage de niveau = composite (pas XP seule)

| Condition | Seuil | Source de vérification |
|:---|:---|:---|
| XP minimum atteint | `level² × 100` | `UserProfile.totalXP` |
| Maîtrise du palier courant | >= 70% topics validés dans le palier | `UserTopicProgress` agrégé |
| Consolidation vérifiée | Pas de topics `needs_revision` dans les paliers précédents | `UserTopicProgress.needsRevision` |

Si les 3 conditions ne sont pas remplies → le système propose des missions de remédiation au lieu de passer automatiquement.

### D2 — Mission Engine = extension du modèle Quest

Le modèle `Quest`/`UserQuest` dans Prisma supporte le lifecycle complet :
```
proposed → notified → pending_activation → active → completed
                                      ↘ expired → mandatory → failed
```

Pas de table séparée pour les deadlines ou les pénalités de mission (intégré dans `UserQuest`).

### D3 — Retention Engine = nouveau CRON service

Un `RetentionCronService` tournant quotidiennement :
1. Identifie les topics validés non révisés depuis > 14 jours (configurable)
2. Passe `UserTopicProgress.needsRevision = true`
3. Génère automatiquement une `Quest` de type `revision`
4. Notifie l'utilisateur

### D4 — Enrichissement de UserTopicProgress (pas de nouvelle table)

On enrichit la table existante plutôt que de créer un nouveau modèle :
```prisma
model UserTopicProgress {
  // existant...
  status        TopicStatus
  updatedAt     DateTime
  
  // AJOUTS
  validatedAt     DateTime?
  masteredAt      DateTime?
  retentionScore  Int        @default(100)
  lastReviewedAt  DateTime?
  needsRevision   Boolean    @default(false)
}
```

### D5 — Notifications en BDD (pas WebSocket en Phase 1)

Phase 1 : Les notifications sont persistées en BDD (`Notification`), le frontend fait du polling classique.
Phase 4 : Migration vers WebSocket/SSE pour le temps réel.

### D6 — IA Tutor = Phase 4 uniquement

Aucune intégration IA avant que les 3 premiers moteurs soient stables. En Phase 3, les QCM sont template-based (seed pré-rempli), pas générés par IA.

### D7 — Stats = colonnes dénormalisées recalculées (pas de snapshots)

Les stats (`statMemory`, `statKernel`, etc.) sont des colonnes sur `UserProfile` recalculées par `RPGService.recalculateStats()` après chaque validation. Pas de table `StatSnapshot` (trop de complexité pour peu de valeur en Phase 1).

### D8 — Pas de `LockRule` / `UnlockRule` en base

Les règles de verrouillage sont codées en dur dans le `ProgressionService`. La flexibilité admin pour ces règles viendra en Phase 4 si nécessaire.

---

## 📐 Schéma Prisma Consolidé Final

Voici le delta exact à appliquer sur le [schema.prisma](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/prisma/schema.prisma) existant, intégrant les apports de TOUS les documents :

### Nouvelles enums

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
  revision      // Doc #1 — mission de rétention
  remediation   // Doc #1 — mission corrective
  project       // Doc #8 — Project Mission
}

enum NotificationType {
  xp_gain
  level_up
  achievement
  title
  quest_assigned
  quest_expired
  quest_mandatory
  penalty
  revision_reminder
  system
}

enum AchievementRarity {
  common
  rare
  epic
  legendary
}
```

### Modifications sur modèles existants

```diff
 model UserTopicProgress {
   // existant
+  validatedAt     DateTime?    @map("validated_at") @db.Timestamptz
+  masteredAt      DateTime?    @map("mastered_at") @db.Timestamptz
+  retentionScore  Int          @default(100) @map("retention_score")
+  lastReviewedAt  DateTime?    @map("last_reviewed_at") @db.Timestamptz
+  needsRevision   Boolean      @default(false) @map("needs_revision")
 }

 model User {
+  profile         UserProfile?
+  quizAttempts    QuizAttempt[]
+  notifications   Notification[]
 }

 model Topic {
+  quizzes         Quiz[]
 }
```

### Nouveaux modèles

Les modèles de la spec technique (Doc #4) restent valides, avec ces ajustements :

**`UserQuest`** — enrichi pour le Mission Engine :

```prisma
model UserQuest {
  id                  String      @id @default(uuid()) @db.Uuid
  userId              String      @map("user_id") @db.Uuid
  userProfile         UserProfile @relation(fields: [userId], references: [userId], onDelete: Cascade)
  questId             String      @map("quest_id") @db.Uuid
  quest               Quest       @relation(fields: [questId], references: [id], onDelete: Cascade)
  progress            Int         @default(0)
  status              QuestStatus @default(proposed)
  
  // Mission Engine fields (Doc #1, #8)
  notifiedAt          DateTime?   @map("notified_at") @db.Timestamptz
  activationDeadline  DateTime?   @map("activation_deadline") @db.Timestamptz
  completionDeadline  DateTime?   @map("completion_deadline") @db.Timestamptz
  isMandatory         Boolean     @default(false) @map("is_mandatory")
  
  startedAt           DateTime    @default(now()) @map("started_at") @db.Timestamptz
  completedAt         DateTime?   @map("completed_at") @db.Timestamptz
  
  @@unique([userId, questId])
  @@map("user_quests")
}
```

**`Notification`** — enrichie avec priorité et lien (Doc #3) :

```prisma
model Notification {
  id          String           @id @default(uuid()) @db.Uuid
  userId      String           @map("user_id") @db.Uuid
  user        User             @relation(fields: [userId], references: [id], onDelete: Cascade)
  type        NotificationType
  priority    String           @default("normal") // "low", "normal", "high", "urgent"
  title       String
  message     String
  icon        String           @default("📢")
  metadata    Json?
  read        Boolean          @default(false)
  linkTo      String?          @map("link_to") // ex: "/quests", "/tests/quiz-id"
  expiresAt   DateTime?        @map("expires_at") @db.Timestamptz
  createdAt   DateTime         @default(now()) @map("created_at") @db.Timestamptz
  
  @@index([userId, read])
  @@map("notifications")
}
```

Les autres modèles (`UserProfile`, `Achievement`, `UserAchievement`, `Title`, `UserTitle`, `Quest`, `XPLog`, `Quiz`, `QuizQuestion`, `QuizAttempt`) restent conformes au Doc #4.

---

## 📋 Plan d'Implémentation Révisé

Aligné sur la vision corrigée (Doc #1) et les ajustements identifiés :

### Phase 1 — Fondations (Semaine 1-2)

**Objectif** : La mécanique XP/Niveaux/Stats fonctionne en backend, l'UI montre les vrais données.

| Priorité | Tâche | Détail |
|:---|:---|:---|
| 🔴 | Migration Prisma | Ajout de `UserProfile`, `Achievement`, `UserAchievement`, `Title`, `UserTitle`, `XPLog`, `Notification`. Enrichissement de `UserTopicProgress`. |
| 🔴 | `RPGService` | Calcul XP, gestion niveaux (composite), recalcul stats, check achievements |
| 🔴 | `NotificationsService` | CRUD notifications, compteur non-lues |
| 🔴 | Intégration `ProgressionService` → `RPGService` | Appel `awardXP()` après chaque `validateTopic()` |
| 🟠 | Seed Achievements + Titres | 17 achievements + 7 titres par défaut |
| 🟠 | Refonte Sidebar (XP bar, niveau) | Données réelles depuis `/rpg/profile` |
| 🟠 | Refonte Dashboard (KPI cards) | XP, Niveau, Streak, DP depuis les vrais endpoints |
| 🟠 | Notification dropdown v2 | Basé sur table `Notification` |

### Phase 2 — Missions & Discipline (Semaine 3-4)

**Objectif** : Le système impose des missions avec deadlines et génère des rappels.

| Priorité | Tâche | Détail |
|:---|:---|:---|
| 🔴 | Migration Prisma (Quest, UserQuest) | Avec le lifecycle complet (proposed → mandatory → failed) |
| 🔴 | `MissionService` (= QuestsService étendu) | Assignation quotidienne, gestion deadlines, passage en mandatory |
| 🔴 | CRON missions quotidien | Assigne daily quests, expire les anciennes, passe en mandatory |
| 🔴 | Page `/missions` (Mission Center) | États visuels, urgence, délais |
| 🟠 | `RetentionCronService` | Détection topics non révisés, flag `needsRevision`, génère missions revision |
| 🟠 | Page `/notifications` dédiée | Liste paginée, filtres, mark-as-read |
| 🟠 | Intégration pénalités → missions correctives | Si mission mandatory non complétée → génère mission corrective |

### Phase 3 — QCM, Skill Tree & Consolidation (Semaine 5-6)

**Objectif** : L'utilisateur peut passer des QCM et visualiser sa progression.

| Priorité | Tâche | Détail |
|:---|:---|:---|
| 🔴 | Migration Prisma (Quiz, QuizQuestion, QuizAttempt) | Modèle de test complet |
| 🔴 | `QuizService` | CRUD quiz, soumission tentative, calcul score, impact progression |
| 🔴 | Page `/tests` | Mode examen + mode entraînement |
| 🔴 | Seed QCM par défaut | Banque de questions pour les parcours existants |
| 🟠 | Page `/skill-tree` | SVG interactif avec données réelles |
| 🟠 | Vérification consolidation pour passage de niveau | `RPGService` vérifie `needsRevision` avant level-up |
| 🟠 | Admin : calibration des seuils | XP par action, seuils de maîtrise, délais |

### Phase 4 — IA & Admin Avancé (Semaine 7+)

| Priorité | Tâche | Détail |
|:---|:---|:---|
| 🟡 | IA Proxy (LLM) | Génération QCM, exercices, explications |
| 🟡 | Adaptation de difficulté | Basée sur l'historique d'erreurs |
| 🟡 | Admin supervision avancée | Cohortes, blocages, taux consolidation |
| 🟡 | WebSocket notifications temps réel | Remplacement du polling |
| 🟡 | Responsive mobile | Adaptation pour usage mobile |

---

## 🎯 Résumé des Décisions à Valider

| # | Décision | Statut |
|:---|:---|:---|
| D1 | Passage de niveau = XP + Maîtrise + Consolidation (pas XP seule) | ⏳ À valider |
| D2 | Mission Engine = extension du modèle Quest (lifecycle complet) | ⏳ À valider |
| D3 | Retention Engine = CRON service avec `needsRevision` sur `UserTopicProgress` | ⏳ À valider |
| D4 | Enrichir `UserTopicProgress` (5 champs) plutôt que nouvelle table | ⏳ À valider |
| D5 | Notifications en BDD + polling (WebSocket en Phase 4) | ⏳ À valider |
| D6 | IA Tutor = Phase 4 uniquement, QCM template-based en Phase 3 | ⏳ À valider |
| D7 | Stats = colonnes dénormalisées recalculées (pas de snapshots) | ⏳ À valider |
| D8 | Règles de verrouillage en code (pas de `LockRule` en base) | ⏳ À valider |

---

> **Prochaine étape** : Valide ces décisions (ou corrige-les), et je fige le document final consolidé avant de lancer la Phase 1.
