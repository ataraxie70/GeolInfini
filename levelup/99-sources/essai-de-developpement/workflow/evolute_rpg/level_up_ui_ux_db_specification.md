# LevelUP — Spécification UI/UX et Base de Données

> **Objectif** : aligner l’interface utilisateur, l’expérience de progression RPG, l’administration, et le modèle de données PostgreSQL/Prisma sur une architecture cohérente, disciplinée et évolutive.

---

## 1. Finalité du document

Ce document définit la refonte complète de l’expérience LevelUP autour de trois axes :

1. **Front-end Learner** : interface immersive pour l’apprenant, centrée sur la progression, les missions, les verrouillages, les rappels et la montée en puissance.
2. **Front-end Admin** : interface de pilotage pour la création, l’édition, la supervision et la calibration des parcours, missions, niveaux et contenus.
3. **Base de données & migration Prisma** : schéma relationnel adapté au moteur RPG, aux parcours, aux sessions, aux pénalités, aux QCM, aux notifications et aux mécanismes de rétention.

Le but n’est pas seulement de rendre l’interface “plus jolie”, mais de rendre le système **lisible, strict, motivant, et conforme à la philosophie LevelUP**.

---

## 2. Principes directeurs de l’UI/UX

### 2.1 Philosophie générale

L’interface LevelUP doit transmettre une impression de :
- système vivant,
- progression méritée,
- contrôle clair des objectifs,
- rigueur sans brutalité,
- immersion RPG légère mais sérieuse.

L’UX doit éviter les excès suivants :
- surcharge visuelle,
- gamification trop infantilisante,
- récompenses arbitraires,
- navigation confuse,
- informations techniques dispersées.

### 2.2 Règles de conception

- **Un seul objectif principal par écran**.
- **Lisibilité immédiate du statut** : niveau, XP, mission active, verrouillage, rappel.
- **Les actions importantes doivent être visibles sans fouiller**.
- **Les données de progression doivent être comprises en une seconde**.
- **Les états système doivent être explicites** : disponible, verrouillé, obligatoire, expiré, à réviser, validé, maîtrisé.

### 2.3 Ton visuel

L’interface doit combiner :
- sérieux pédagogique,
- identité RPG,
- discrétion sci-fi,
- hiérarchie claire des informations,
- composants modernes et sobres.

Le style recommandé est :
- fond sombre ou neutre selon le thème,
- accents lumineux pour les états de progression,
- cartes hiérarchisées,
- animations légères et fonctionnelles,
- visuels de progression compréhensibles.

---

## 3. Refonte front-end — Vue d’ensemble

### 3.1 Structure globale

Le front-end doit être organisé en trois univers fonctionnels :

#### A. Espace Learner
Destiné à l’utilisateur qui apprend.

Contenu principal :
- dashboard de progression,
- parcours,
- missions,
- sessions,
- QCM,
- skill tree,
- notifications,
- profil RPG,
- historique.

#### B. Espace Admin
Destiné à l’administrateur, au formateur ou au superviseur.

Contenu principal :
- gestion des parcours,
- gestion des modules et topics,
- calibration des niveaux,
- génération / import de roadmaps,
- gestion des missions,
- réglage des pénalités,
- suivi des cohortes,
- supervision des contenus et des progressions.

#### C. Espace Système
Destiné aux mécanismes transverses.

Contenu principal :
- notifications,
- journal d’événements,
- discipline,
- rétention,
- log de progression,
- synchronisation du profil,
- états de verrouillage.

---

## 4. Refonte front-end — Espace Learner

### 4.1 Dashboard principal

Le dashboard ne doit pas être un simple résumé. Il doit être le **centre opérationnel de l’apprenant**.

#### Blocs essentiels
- **Niveau actuel**
- **XP total et progression vers le prochain palier**
- **Mission en cours**
- **Prochaine mission à activer**
- **Verrous actifs**
- **Rappels de révision**
- **Dernières validations**
- **Statut disciplinaire**
- **Dernières notifications**

#### Comportement UX
Le dashboard doit répondre à trois questions immédiatement :
1. Où en suis-je ?
2. Que dois-je faire maintenant ?
3. Qu’est-ce qui est verrouillé ou à consolider ?

### 4.2 Page parcours

La page parcours doit afficher :
- le parcours choisi,
- la structure du parcours,
- la progression par phase,
- les modules,
- les topics,
- les prérequis,
- les états de verrouillage,
- la maturité nécessaire pour passer au niveau suivant.

#### États visuels
- **verrouillé** : grisé + icône cadenas ;
- **disponible** : neutre + appel à l’action ;
- **en cours** : accent discret ;
- **validé** : confirmé ;
- **maîtrisé** : signal fort ;
- **à réviser** : avertissement léger ;
- **obligatoire** : mise en avant plus forte.

### 4.3 Mission Center

C’est l’espace le plus important après le dashboard.

Il doit afficher :
- missions proposées,
- missions notifiées,
- missions expirées,
- missions obligatoires,
- missions de remédiation,
- délais restants,
- niveau d’urgence,
- conséquence d’inaction.

#### Fonctionnement
Une mission doit pouvoir avoir plusieurs états :
- proposée,
- notifiée,
- en attente d’activation,
- active,
- complétée,
- expirée,
- convertie en obligation,
- échouée.

Le design doit permettre de comprendre immédiatement :
- ce qui est urgent,
- ce qui peut être reporté,
- ce qui a été manqué,
- ce qui doit être corrigé.

### 4.4 Skill Tree

Le skill tree doit représenter le graphe de progression du parcours.

#### Caractéristiques UI
- rendu visuel en arbre ou graphe,
- branches par domaine,
- noeuds verrouillés / débloqués / maîtrisés,
- zoom et navigation,
- panneau latéral de détail,
- chemins de progression clairement lisibles.

#### Rôle UX
Le skill tree doit aider l’utilisateur à comprendre :
- où il se situe,
- ce qu’il a validé,
- ce qui manque,
- ce qui doit être consolidé,
- comment les niveaux se connectent.

### 4.5 QCM / Tests

Le centre de tests doit proposer :
- QCM de validation,
- tests de consolidation,
- quiz de rappel,
- évaluations de niveau,
- session d’entraînement,
- session d’examen.

#### Comportements attendus
- timer optionnel,
- question par question ou mode global,
- score final,
- analyse des erreurs,
- lien vers remédiation,
- recalcul de maturité.

### 4.6 Profil RPG

La page profil doit donner une lecture claire de l’état de progression.

#### Sections utiles
- avatar / identité,
- niveau,
- classe / spécialisation,
- XP et progression,
- titres actifs,
- stats,
- achievements,
- historique de missions,
- journal d’évolution,
- progression disciplinaire.

### 4.7 Notifications

Les notifications doivent devenir un vrai système de commande.

#### Types prioritaires
- mission notifiée,
- mission devenue obligatoire,
- validation de niveau,
- rappel de révision,
- pénalité appliquée,
- QCM disponible,
- niveau verrouillé,
- titre débloqué,
- achievement débloqué.

---

## 5. Refonte front-end — Espace Admin

### 5.1 Objectif de l’espace Admin

L’admin doit pouvoir piloter le système sans manipuler directement la base.

L’interface doit permettre de :
- créer et éditer un parcours,
- importer une roadmap,
- configurer les paliers,
- définir les modules et topics,
- ajuster les missions,
- calibrer les seuils XP,
- gérer les pénalités,
- superviser les utilisateurs,
- visualiser les points de friction.

### 5.2 Pages Admin essentielles

#### A. Builder de parcours
Permet de :
- créer un parcours,
- structurer les modules,
- lier les prérequis,
- définir la progression,
- rattacher les compétences cibles.

#### B. Importateur
Permet de :
- importer du Markdown LevelUP,
- importer du JSON structuré,
- prévisualiser le parsing,
- corriger les correspondances,
- valider avant insertion.

#### C. Calibration des règles
Permet de :
- régler les XP par type d’action,
- définir les seuils de niveau,
- fixer les seuils de maîtrise,
- régler les délais de mission,
- définir les pénalités,
- définir les règles de consolidation.

#### D. Console de supervision
Permet de :
- voir l’état des cohortes,
- identifier les apprenants en blocage,
- voir les niveaux non consolidés,
- détecter les abandons,
- repérer les révisions manquantes,
- analyser les parcours par engagement.

### 5.3 UX Admin

L’espace Admin doit être :
- dense mais lisible,
- rapide,
- orienté actions,
- sans décoration inutile,
- avec de fortes capacités de tri, filtre et recherche.

---

## 6. Architecture design system

### 6.1 Composants de base

- cards de progression,
- badges de statut,
- barres d’XP,
- indicateurs de niveau,
- panneaux latéraux,
- modales de confirmation,
- timeline d’événements,
- tableaux administratifs,
- graphes de compétence,
- blocs de mission.

### 6.2 États visuels à standardiser

Le design system doit normaliser les états suivants :
- actif,
- inactif,
- disponible,
- verrouillé,
- obligatoire,
- expiré,
- validé,
- maîtrisé,
- en révision,
- en alerte,
- en surcharge,
- à corriger.

### 6.3 Accessibilité

La refonte doit intégrer :
- contrastes suffisants,
- navigation clavier,
- lecture claire des badges,
- hiérarchie typographique nette,
- feedbacks non ambigus,
- affichage responsive.

---

## 7. Base de données — Principes de structuration

### 7.1 Objectif de la base

La base doit soutenir :
- la progression RPG,
- les parcours multi-niveaux,
- les missions temporisées,
- les pénalités,
- les QCM,
- la rétention,
- l’IA tutor,
- l’administration,
- les notifications,
- l’historique complet des actions.

### 7.2 Choix technique

- **PostgreSQL** comme base relationnelle principale.
- **Prisma** comme ORM et couche de migration.
- **Migrations versionnées** pour garder un historique propre.
- **Relations explicites** pour la progression, les contenus, les logs et les événements.

### 7.3 Principes de modélisation

La base doit être pensée autour de quatre noyaux :

1. **Noyau identitaire**
   - utilisateur,
   - profil,
   - rôle,
   - préférences,
   - état d’activation.

2. **Noyau pédagogique**
   - parcours,
   - modules,
   - topics,
   - prérequis,
   - QCM,
   - sessions,
   - missions.

3. **Noyau RPG**
   - XP,
   - niveaux,
   - titres,
   - achievements,
   - classes,
   - stats,
   - discipline,
   - pénalités.

4. **Noyau système**
   - notifications,
   - journaux d’événements,
   - tentatives,
   - activité,
   - historique,
   - synchronisation.

---

## 8. Schéma logique recommandé

### 8.1 Entités principales

#### Utilisateur / Profil
- User
- UserProfile
- UserRole
- UserPreference

#### Parcours pédagogique
- Program
- StudyPlan
- Module
- Topic
- TopicPrerequisite
- TopicProgress

#### RPG
- XPLog
- LevelHistory
- UserTitle
- Title
- Achievement
- UserAchievement
- UserClass
- StatSnapshot

#### Missions
- Quest
- UserQuest
- MissionNotification
- MissionDeadline
- MissionPenalty

#### Évaluations
- Quiz
- QuizQuestion
- QuizAttempt
- QuizAnswer
- QuizResult

#### Système
- Notification
- SystemEvent
- RevisionReminder
- LockRule
- UnlockRule

---

## 9. Modèles de données recommandés

### 9.1 UserProfile

Doit contenir :
- niveau actuel,
- XP total,
- classe,
- titre actif,
- stats,
- discipline,
- parcours actif,
- progression globale,
- préférences de notification.

### 9.2 TopicProgress

Doit suivre :
- statut du topic,
- date de validation,
- date de maîtrise,
- score de rappel,
- statut de révision,
- blocage éventuel,
- source de progression.

### 9.3 XPLog

Doit conserver chaque variation d’XP :
- gain,
- pénalité,
- bonus,
- source,
- contexte,
- horodatage.

### 9.4 UserQuest

Doit suivre :
- état de la mission,
- date d’attribution,
- deadline,
- date d’activation,
- date d’expiration,
- statut obligatoire ou non,
- résultat.

### 9.5 QuizAttempt

Doit enregistrer :
- score,
- temps,
- réponses,
- réussite ou échec,
- erreurs,
- impact sur la progression.

### 9.6 Notification

Doit contenir :
- type,
- priorité,
- message,
- métadonnées,
- état lu / non lu,
- lien cible,
- expiration éventuelle.

---

## 10. Migration Prisma — stratégie

### 10.1 Objectif

La migration doit introduire le nouveau système sans casser l’existant.

### 10.2 Approche

- ajouter les nouvelles tables en premier,
- relier progressivement les nouvelles relations,
- préserver les données existantes,
- migrer les profils v1 vers le profil RPG v2,
- tester les contraintes de verrouillage,
- valider les relations cascade / restrict.

### 10.3 Règles de migration

- éviter les suppressions brutales ;
- privilégier les ajouts incrémentaux ;
- conserver les anciennes colonnes si elles sont encore utiles ;
- créer des scripts de backfill si nécessaire ;
- documenter chaque changement de schéma.

---

## 11. Front-end et base de données — cohérence attendue

Le front-end doit refléter exactement les structures de données.

Exemples :
- un état “verrouillé” dans l’UI doit correspondre à une règle explicite en base ;
- une mission “obligatoire” doit être persistée comme telle ;
- un niveau “non consolidé” doit être lisible dans le profil ;
- un rappel de révision doit être traçable dans les événements ;
- un achievement débloqué doit apparaître partout de manière cohérente.

L’interface ne doit jamais inventer un état qui n’existe pas dans la base.
La base ne doit jamais stocker un état qui ne peut pas être rendu clairement dans l’interface.

---

## 12. Priorités de livraison

### Phase A — UI/UX fondation
- refonte dashboard,
- refonte sidebar,
- cartes de progression,
- notifications,
- profil RPG,
- lisibilité globale.

### Phase B — Admin fonctionnel
- builder de parcours,
- importateur,
- calibration,
- supervision,
- vue cohortes.

### Phase C — Schéma base de données
- nouveaux modèles,
- relations,
- logs,
- missions,
- évaluation,
- journal système.

### Phase D — Migration et intégration
- migration Prisma,
- backfill,
- harmonisation front/back,
- tests d’intégrité.

---

## 13. Résultat attendu

À la fin de cette refonte, LevelUP doit être capable de :
- guider un apprenant avec une progression lisible,
- verrouiller les niveaux de manière juste,
- imposer des missions avec deadlines,
- retenir les acquis,
- corriger les lacunes,
- visualiser clairement le parcours,
- offrir à l’admin un pilotage total,
- stocker toute la logique de progression dans une base solide et évolutive.

Le système doit donner le sentiment d’un **parcours maîtrisé**, pas d’une simple plateforme de contenu.

