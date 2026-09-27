# Activity Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-ACTIVITY-001

---

# 1. Objet

Le **Activity Context** est le Bounded Context responsable de la planification, de l'organisation et du suivi des activités concrètes exécutées par un apprenant dans le cadre d'un Programme Personnel.

Il transforme un programme d'apprentissage en une suite d'actions réalisables.

Il constitue le niveau d'exécution quotidien de LevelUP.

---

# 2. Mission

Organiser les activités nécessaires à l'acquisition progressive d'une compétence en traduisant les objectifs d'un programme en tâches d'apprentissage concrètes, planifiées et observables.

Le Activity Context garantit que chaque action réalisée contribue directement à la progression vers une compétence démontrable.

---

# 3. Position dans l'écosystème

Le Activity Context appartient à l'**Execution Layer**.

Il consomme les Programmes Personnels produits par le Program Context.

Il fournit au Progress Context les informations nécessaires à l'observation de la progression réelle.

---

# 4. Vision métier

Une compétence n'est jamais acquise par la simple existence d'un programme.

Elle résulte d'une succession d'actions exécutées avec discipline, régularité et rigueur.

Le rôle du Activity Context est de transformer un plan d'apprentissage en travail concret.

Chaque activité possède une intention pédagogique et une contribution explicite au programme.

---

# 5. Responsabilités

Le Activity Context est responsable de :

* générer les activités d'un programme ;
* organiser les sessions de travail ;
* planifier les missions ;
* planifier les révisions ;
* planifier les consolidations ;
* gérer les routines d'apprentissage ;
* ordonnancer les activités ;
* suivre l'exécution des activités ;
* enregistrer les résultats d'exécution ;
* gérer les reports et replanifications.

Il n'est jamais responsable :

* de la définition des compétences ;
* de la conception pédagogique ;
* de la personnalisation des programmes ;
* de l'évaluation des compétences ;
* de la mesure globale de la progression.

---

# 6. Ubiquitous Language

## Activity

Unité d'exécution représentant une action concrète à réaliser.

Une activité est toujours exécutable.

---

## Learning Session

Période de travail consacrée à une ou plusieurs activités.

---

## Mission

Activité pratique destinée à mettre en œuvre des connaissances ou des compétences dans une situation concrète.

Une mission peut servir de préparation ou de validation intermédiaire.

---

## Review Activity

Activité dédiée à la révision de connaissances précédemment étudiées.

---

## Consolidation Activity

Activité destinée à renforcer durablement les acquis avant la poursuite du parcours.

---

## Routine

Ensemble récurrent d'activités planifiées selon une fréquence donnée.

---

## Activity Queue

Ordonnancement des activités à réaliser.

Elle représente le travail restant d'un programme.

---

## Activity Outcome

Résultat observé à l'issue d'une activité.

Il décrit l'exécution de l'activité, sans conclure sur la maîtrise de la compétence.

---

# 7. Modèle métier

```text
Program
      │
      ▼
Activity Plan
      │
      ├── Activity Queue
      │
      ├── Learning Sessions
      │       │
      │       ├── Activities
      │       ├── Missions
      │       ├── Reviews
      │       └── Consolidations
      │
      └── Activity History
```

Le Activity Plan constitue l'organisation opérationnelle d'un Programme Personnel.

---

# 8. Principes métier

## Principe 1 — Une activité possède toujours une finalité

Aucune activité n'est créée sans contribuer à un objectif du programme.

---

## Principe 2 — Une activité est observable

Chaque activité possède un état, une date, un résultat et une durée d'exécution.

---

## Principe 3 — Les activités respectent le programme

Leur organisation ne peut pas contourner les dépendances définies par le Program Context.

---

## Principe 4 — La pratique est privilégiée

Lorsque cela est pertinent, les activités favorisent la mise en application plutôt que la simple consommation de ressources.

---

## Principe 5 — La discipline est structurée

Le système favorise la régularité par l'organisation de routines, de sessions et de jalons d'exécution.

---

# 9. Cycle de vie

Chaque activité suit le cycle suivant.

```text
Planned
    ↓
Scheduled
    ↓
Ready
    ↓
In Progress
    ↓
Completed
    ↓
Reviewed
```

Des états alternatifs peuvent exister :

* Cancelled
* Skipped
* Postponed

---

# 10. Agrégats

## Aggregate Root

### Activity Plan

L'Activity Plan constitue la racine d'agrégat.

Il garantit la cohérence de toutes les activités d'un programme.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Activity Plan
* Activity
* Learning Session
* Mission
* Review Activity
* Consolidation Activity
* Routine
* Activity Queue
* Activity Outcome

---

# 12. Value Objects

Les principaux Value Objects sont :

* ActivityId
* SessionId
* PlannedDuration
* ActualDuration
* ScheduledDate
* ActivityStatus
* ActivityPriority
* CompletionState
* ExecutionNotes

---

# 13. Domain Services

Les principaux services métier sont :

* Activity Planner
* Session Scheduler
* Routine Manager
* Mission Generator
* Review Planner
* Consolidation Planner
* Activity Rescheduler

---

# 14. Domain Events

Les principaux événements métier sont :

* ActivityCreated
* ActivityScheduled
* ActivityStarted
* ActivityCompleted
* ActivityPostponed
* MissionGenerated
* ReviewPlanned
* RoutineCreated
* SessionCompleted

---

# 15. Invariants

Le Activity Context garantit notamment les invariants suivants :

* chaque activité appartient à un seul programme ;
* chaque activité poursuit un objectif explicite ;
* une activité possède un état unique à un instant donné ;
* une activité terminée conserve son historique ;
* les activités respectent les dépendances du programme ;
* les reports ne modifient pas le Learning Blueprint.

---

# 16. Interfaces exposées

Le Activity Context expose notamment les capacités suivantes :

* consulter les activités planifiées ;
* démarrer une activité ;
* terminer une activité ;
* reporter une activité ;
* consulter les sessions de travail ;
* consulter les missions ;
* consulter les révisions ;
* consulter les routines ;
* enregistrer un résultat d'exécution.

---

# 17. Relations avec les autres Contexts

## Program Context

Fournit les Programmes Personnels servant de base à la planification des activités.

---

## Assessment Context

Réutilise certaines missions ou activités comme support d'évaluation.

---

## Progress Context

Observe les résultats des activités afin de mesurer la progression réelle.

---

## Analytics Context

Analyse les habitudes d'exécution, les charges de travail et les taux de réalisation.

---

# 18. Décisions architecturales

Le Activity Context représente l'exécution quotidienne du parcours d'apprentissage.

Il ne définit ni les compétences, ni les connaissances, ni les stratégies pédagogiques.

Il orchestre les actions concrètes réalisées par l'apprenant.

Les activités constituent la plus petite unité opérationnelle observable de LevelUP.

Toute mesure de progression, toute validation de compétence ou toute analyse comportementale s'appuie sur les informations produites par ce contexte.

Le Activity Context constitue ainsi la source de vérité concernant l'exécution des programmes personnels dans l'Execution Layer.
