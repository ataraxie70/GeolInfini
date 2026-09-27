# Program Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-PROGRAM-001

---

# 1. Objet

Le **Program Context** est le Bounded Context responsable de l'instanciation des Learning Blueprints pour un apprenant donné.

Il transforme un modèle d'apprentissage générique en un **Programme Personnel** tenant compte des objectifs, des contraintes, du rythme et des choix de l'utilisateur.

Le Program Context constitue le point d'entrée de l'expérience d'apprentissage de chaque apprenant.

---

# 2. Mission

Construire, organiser et maintenir des programmes d'apprentissage personnalisés permettant à chaque apprenant d'atteindre une compétence démontrable en suivant un parcours adapté à son contexte.

Le Program Context assure la traduction des modèles pédagogiques en un plan d'exécution individuel.

---

# 3. Position dans l'écosystème

Le Program Context appartient à l'**Execution Layer**.

Il constitue la frontière entre le référentiel partagé de LevelUP et l'espace personnel de chaque utilisateur.

Il consomme les Learning Blueprints publiés par le Learning Context et produit des Programmes Personnels.

---

# 4. Vision métier

Un Learning Blueprint décrit une manière d'apprendre.

Un Programme Personnel décrit **comment une personne donnée suivra ce parcours**.

Deux utilisateurs peuvent suivre le même Learning Blueprint tout en disposant de programmes totalement différents.

Le programme est une instanciation personnalisée d'un modèle pédagogique.

---

# 5. Responsabilités

Le Program Context est responsable de :

* créer un Programme Personnel ;
* sélectionner un Learning Blueprint ;
* personnaliser le rythme d'apprentissage ;
* définir les objectifs personnels ;
* organiser les étapes du programme ;
* planifier les séquences d'apprentissage ;
* gérer les adaptations du programme ;
* suspendre ou reprendre un programme ;
* gérer plusieurs programmes simultanément ;
* maintenir la cohérence globale du parcours personnel.

Il n'est jamais responsable :

* des connaissances ;
* des compétences ;
* de la conception pédagogique ;
* de l'exécution quotidienne des activités ;
* de l'évaluation des acquis.

---

# 6. Ubiquitous Language

## Personal Program

Programme d'apprentissage propre à un utilisateur.

---

## Program Blueprint

Instance personnalisée d'un Learning Blueprint.

---

## Program Stage

Déclinaison personnelle d'une étape pédagogique.

---

## Program Goal

Objectif personnel poursuivi dans le cadre d'un programme.

---

## Learning Pace

Rythme d'apprentissage choisi ou calculé pour un programme.

---

## Program Status

État courant du programme.

Exemples :

* Draft
* Active
* Paused
* Completed
* Abandoned
* Archived

---

## Adaptation

Modification locale du programme sans altérer le Learning Blueprint d'origine.

---

# 7. Modèle métier

```text
Learning Blueprint
        │
        ▼
Program
        │
        ├── Goals
        ├── Learning Pace
        ├── Program Stages
        │       │
        │       ├── Planned Modules
        │       ├── Planned Units
        │       └── Planned Milestones
        │
        ├── Constraints
        └── Metadata
```

Le Program Context ne modifie jamais le Learning Blueprint.

Il en crée une instance personnalisée.

---

# 8. Principes métier

## Principe 1 — Le référentiel est immuable

La personnalisation ne modifie jamais les modèles officiels.

---

## Principe 2 — Un programme appartient à un seul utilisateur

Chaque programme possède un propriétaire unique.

---

## Principe 3 — Plusieurs programmes peuvent coexister

Un utilisateur peut suivre simultanément plusieurs compétences.

---

## Principe 4 — Le rythme est adaptable

Le programme s'adapte aux contraintes de l'apprenant sans modifier les objectifs de compétence.

---

## Principe 5 — La personnalisation respecte les dépendances

Aucune adaptation ne peut violer les prérequis définis dans le Learning Blueprint.

---

# 9. Cycle de vie

```text
Draft
    ↓
Planned
    ↓
Active
    ↓
Paused
    ↓
Completed
    ↓
Archived
```

---

# 10. Agrégats

## Aggregate Root

### Program

Le Program constitue la racine d'agrégat.

Toutes les décisions relatives au parcours personnel transitent par lui.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Program
* Program Goal
* Program Stage
* Planned Module
* Planned Unit
* Learning Pace
* Constraint
* Adaptation

---

# 12. Value Objects

Les principaux Value Objects sont :

* ProgramId
* LearnerId
* GoalIdentifier
* PlannedDuration
* WeeklyWorkload
* AvailableTime
* ProgramStatus
* StartDate
* TargetDate

---

# 13. Domain Services

Les principaux services métier sont :

* Program Builder
* Personalization Engine
* Planning Service
* Adaptation Manager
* Program Scheduler
* Program Version Manager

---

# 14. Domain Events

Les principaux événements métier sont :

* ProgramCreated
* ProgramActivated
* ProgramPaused
* ProgramResumed
* ProgramAdapted
* GoalReached
* ProgramCompleted
* ProgramArchived

---

# 15. Invariants

Le Program Context garantit notamment les invariants suivants :

* chaque programme est basé sur un Learning Blueprint publié ;
* chaque programme possède un propriétaire unique ;
* les dépendances pédagogiques sont respectées ;
* les adaptations ne modifient jamais le référentiel officiel ;
* un programme actif possède au moins un objectif explicite.

---

# 16. Interfaces exposées

Le Program Context expose notamment les capacités suivantes :

* créer un programme ;
* consulter un programme ;
* adapter un rythme d'apprentissage ;
* suspendre un programme ;
* reprendre un programme ;
* clôturer un programme ;
* consulter les objectifs d'un programme.

---

# 17. Relations avec les autres Contexts

## Learning Context

Fournit les Learning Blueprints servant de base aux programmes.

---

## Activity Context

Consomme les Programmes afin de produire les activités quotidiennes.

---

## Assessment Context

Déclenche les évaluations prévues dans le programme.

---

## Progress Context

Observe la progression réalisée dans chaque programme.

---

## Analytics Context

Analyse les performances globales des programmes et les adaptations les plus fréquentes.

---

# 18. Décisions architecturales

Le Program Context est le premier contexte entièrement centré sur l'apprenant.

Il ne produit aucun contenu pédagogique et ne modifie jamais le référentiel officiel.

Il représente la traduction opérationnelle d'un Learning Blueprint dans le contexte personnel d'un utilisateur.

Les adaptations réalisées au sein d'un programme demeurent locales et n'ont aucun impact sur les modèles de référence publiés par LevelUP.

Le Program Context constitue ainsi la source de vérité concernant l'organisation personnelle des parcours d'apprentissage dans l'Execution Layer.
