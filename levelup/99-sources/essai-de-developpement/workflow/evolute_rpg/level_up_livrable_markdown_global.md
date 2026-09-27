# LevelUP — Pack Markdown global

> Ce document regroupe la vision produit, la refonte UI/UX, la base de données PostgreSQL/Prisma, et les règles de migration. Il sert de document de cadrage global pour la suite de l’implémentation.

---

# 1. Vision globale

LevelUP est une plateforme d’apprentissage structurée comme un système RPG. L’utilisateur ne suit pas simplement des cours : il avance dans un parcours verrouillé, débloque des niveaux, reçoit des missions, passe des validations, et consolide ses acquis avant de passer à l’étape suivante.

Le système doit rester :
- motivant,
- discipliné,
- lisible,
- strict sans être agressif,
- orienté maîtrise réelle plutôt qu’activité vide.

---

# 2. Principes pédagogiques

## 2.1 Pas d’XP gratuite

Les points d’expérience ne doivent jamais être distribués au hasard. Ils doivent correspondre à une progression réelle :
- validation d’un topic,
- réussite d’un QCM,
- complétion d’une session,
- réussite d’un mini-projet,
- consolidation d’une notion,
- mission complétée dans les temps.

## 2.2 Niveau = maturité

Un niveau ne représente pas seulement du temps passé. Il représente une maturité suffisante pour aborder l’étape suivante.

Avant de débloquer un niveau, il faut vérifier :
- que les bases sont acquises,
- que les notions précédentes restent disponibles,
- que l’utilisateur peut réutiliser ce qu’il a appris,
- que le niveau supérieur ne repose pas sur une base fragile.

## 2.3 Révision et rétention

Le système doit éviter l’oubli. Les connaissances d’un niveau doivent rester disponibles pour la suite. Le moteur doit donc prévoir :
- des rappels,
- des QCM de consolidation,
- des sessions de révision,
- des exercices de réactivation,
- des retours aux fondamentaux si nécessaire.

---

# 3. Cycle de mission

## 3.1 Définition

Une mission peut être :
- une session d’étude,
- un exercice pratique,
- un QCM,
- un mini-projet,
- un lab,
- une session de révision,
- une tâche de consolidation.

## 3.2 États d’une mission

Une mission doit pouvoir exister sous plusieurs états :
- proposée,
- notifiée,
- en attente d’activation,
- active,
- complétée,
- expirée,
- devenue obligatoire,
- échouée.

## 3.3 Fenêtre d’activation

Quand une mission est notifiée, l’utilisateur dispose d’une fenêtre pour l’activer. Si le délai expire, la mission passe en état obligatoire.

## 3.4 Sanctions progressives

Les pénalités doivent rester mesurées :
- rappel,
- signalement,
- baisse légère de discipline,
- perte modérée d’XP,
- ajout de missions correctives,
- blocage temporaire si la base n’est pas consolidée.

---

# 4. Refonte UI/UX — Learner

## 4.1 Dashboard principal

Le dashboard doit devenir le centre de commande de l’apprenant.

Il doit afficher immédiatement :
- le niveau actuel,
- l’XP total,
- la progression vers le prochain niveau,
- la mission en cours,
- la prochaine mission,
- les verrous actifs,
- les rappels de révision,
- le statut disciplinaire,
- les notifications importantes.

## 4.2 Page parcours

La page parcours doit montrer :
- le parcours choisi,
- la structure des modules,
- les topics,
- les prérequis,
- les zones verrouillées,
- les zones validées,
- les zones à consolider.

## 4.3 Mission Center

Le centre de missions doit être l’espace où l’utilisateur voit :
- les missions en attente,
- les missions obligatoires,
- les délais restants,
- les missions expirées,
- les missions correctives,
- l’urgence des tâches.

## 4.4 Skill Tree

L’arbre de compétences doit représenter visuellement le graphe de progression.

Il doit permettre :
- de voir les branches du parcours,
- de visualiser les noeuds verrouillés ou débloqués,
- de comprendre les prérequis,
- de naviguer dans les modules,
- de situer les zones à renforcer.

## 4.5 QCM / Tests

Le centre de tests doit proposer :
- des QCM de validation,
- des tests de consolidation,
- des quiz de rappel,
- des évaluations de niveau,
- des sessions d’entraînement.

## 4.6 Profil RPG

La page profil doit exposer :
- l’avatar,
- le niveau,
- la classe,
- l’XP,
- les titres,
- les achievements,
- les statistiques,
- l’historique de progression,
- le journal de performance.

## 4.7 Notifications

Les notifications doivent servir de canal de système :
- mission notifiée,
- mission devenue obligatoire,
- niveau débloqué,
- QCM disponible,
- révision demandée,
- pénalité appliquée,
- achievement gagné,
- titre débloqué.

---

# 5. Refonte UI/UX — Admin

## 5.1 Objectif

L’espace admin doit permettre de piloter toute la plateforme sans manipuler la base directement.

## 5.2 Fonctions clés

L’admin doit pouvoir :
- créer et modifier un parcours,
- importer une roadmap,
- structurer des modules et topics,
- définir les prérequis,
- calibrer les seuils XP,
- ajuster les règles de progression,
- définir les pénalités,
- gérer les QCM,
- suivre les utilisateurs,
- superviser les blocages et retards.

## 5.3 Pages principales

### Builder de parcours
Permet de construire ou ajuster la structure d’un parcours.

### Importateur
Permet d’importer du Markdown ou du JSON, puis de prévisualiser la structure avant insertion.

### Calibration
Permet de régler les XP, les seuils, les délais, les pénalités, les règles de verrouillage.

### Supervision
Permet de voir les cohortes, les retards, les blocages, les abandons, les consolidations manquantes.

---

# 6. Design system

## 6.1 Composants standards

Les composants principaux doivent être :
- cartes de progression,
- badges de statut,
- barres d’XP,
- panneaux latéraux,
- timelines,
- tableaux de supervision,
- graphes de compétences,
- modales de confirmation,
- blocs de mission.

## 6.2 États standardisés

L’interface doit afficher clairement les états suivants :
- verrouillé,
- disponible,
- actif,
- validé,
- maîtrisé,
- à réviser,
- obligatoire,
- expiré,
- en alerte.

## 6.3 Lisibilité

Le design doit rester sobre, hiérarchisé et direct. L’objectif n’est pas de surcharger l’utilisateur avec des effets visuels, mais de rendre le système lisible et motivant.

---

# 7. Base de données PostgreSQL / Prisma

## 7.1 Objectif du modèle de données

La base doit stocker :
- les utilisateurs,
- les profils RPG,
- les parcours,
- les modules,
- les topics,
- les prérequis,
- les missions,
- les QCM,
- les sessions,
- les notifications,
- les récompenses,
- les pénalités,
- les journaux d’événements.

## 7.2 Noyaux fonctionnels

### Noyau identité
- User
- UserProfile
- Role
- Preference

### Noyau pédagogique
- Program
- StudyPlan
- Module
- Topic
- TopicPrerequisite
- TopicProgress

### Noyau RPG
- XPLog
- LevelHistory
- Title
- UserTitle
- Achievement
- UserAchievement
- Class
- StatSnapshot

### Noyau missions
- Quest
- UserQuest
- MissionDeadline
- MissionPenalty

### Noyau évaluation
- Quiz
- QuizQuestion
- QuizAttempt
- QuizAnswer
- QuizResult

### Noyau système
- Notification
- SystemEvent
- RevisionReminder
- LockRule
- UnlockRule

---

# 8. Entités recommandées

## 8.1 UserProfile

Doit contenir :
- niveau courant,
- XP total,
- classe,
- titre actif,
- discipline,
- parcours actif,
- progression globale,
- préférence de notification.

## 8.2 TopicProgress

Doit contenir :
- statut du topic,
- date de validation,
- date de maîtrise,
- score de rétention,
- état de révision,
- blocage éventuel.

## 8.3 XPLog

Doit conserver :
- le montant,
- la source,
- la raison,
- le contexte,
- l’horodatage,
- le lien éventuel à une mission ou un quiz.

## 8.4 UserQuest

Doit suivre :
- l’état de la mission,
- la date d’attribution,
- la date d’activation,
- la deadline,
- la date d’expiration,
- le statut obligatoire ou non.

## 8.5 QuizAttempt

Doit stocker :
- le score,
- la durée,
- les réponses,
- la réussite ou l’échec,
- l’impact sur la progression.

## 8.6 Notification

Doit inclure :
- le type,
- la priorité,
- le message,
- les métadonnées,
- l’état lu / non lu,
- le lien de destination.

---

# 9. Migration Prisma

## 9.1 Objectif

La migration doit introduire le nouveau système sans casser l’existant.

## 9.2 Stratégie

- ajouter les nouvelles tables avant de modifier les anciennes,
- conserver les colonnes utiles,
- relier progressivement les nouvelles relations,
- prévoir des scripts de backfill,
- documenter chaque changement,
- tester les contraintes d’intégrité.

## 9.3 Règles

- pas de suppression brutale,
- pas de migration non réversible sans raison,
- pas de rupture des données de progression,
- pas d’incohérence entre front et base.

---

# 10. Cohérence front / back

Le front-end doit refléter exactement les états définis en base.

Exemples :
- un topic verrouillé en base doit être verrouillé dans l’UI,
- une mission obligatoire doit être affichée comme telle,
- une révision demandée doit apparaître dans les notifications,
- un niveau non consolidé doit être visible dans le profil,
- un achievement débloqué doit être visible partout.

L’interface ne doit jamais inventer un état non supporté par la base.
La base ne doit jamais stocker un état impossible à afficher clairement.

---

# 11. Priorités de mise en oeuvre

## Phase 1 — Fondations visuelles et progression
- dashboard,
- sidebar,
- profil RPG,
- barres d’XP,
- états de verrouillage,
- notifications de base.

## Phase 2 — Missions et discipline
- mission center,
- deadlines,
- obligations,
- pénalités,
- rappels,
- journal d’événements.

## Phase 3 — Skill tree et QCM
- arbre de compétences,
- QCM,
- tests de consolidation,
- révision des acquis,
- résultats détaillés.

## Phase 4 — Admin et migration
- builder de parcours,
- importateur,
- calibration,
- supervision,
- migration Prisma,
- harmonisation front / back.

---

# 12. Résultat attendu

À la fin de cette refonte, LevelUP doit fonctionner comme un système complet :
- progression claire,
- missions encadrées,
- verrouillage pédagogique,
- rétention des bases,
- interface immersive mais lisible,
- administration puissante,
- base de données cohérente,
- migration solide et évolutive.

Le système doit donner la sensation d’un parcours maîtrisé, discipliné et vivant.

