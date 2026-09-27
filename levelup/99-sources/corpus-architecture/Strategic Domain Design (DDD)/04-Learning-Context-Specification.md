# Learning Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-LEARNING-001

---

# 1. Objet

Le **Learning Context** est le Bounded Context responsable de la conception et de l'organisation des parcours d'apprentissage à partir des modèles de compétences publiés par le Competency Context.

Il transforme un **Reference Model** en une progression pédagogique structurée, cohérente et adaptée aux principes de LevelUP.

Il ne produit pas les connaissances.

Il ne définit pas les compétences.

Il organise leur apprentissage.

---

# 2. Mission

Construire des **Learning Blueprints** permettant de guider un apprenant vers une compétence démontrable en respectant :

* les fondations ;
* les dépendances conceptuelles ;
* la progression graduelle ;
* la consolidation des acquis ;
* la discipline ;
* la rigueur ;
* la validation progressive.

---

# 3. Position dans l'écosystème

Le Learning Context appartient au **Reference Layer**.

Il constitue la passerelle entre le référentiel officiel des compétences et les programmes personnalisés des utilisateurs.

Il fournit des modèles d'apprentissage réutilisables qui seront instanciés par le Program Context.

---

# 4. Vision métier

Une compétence ne constitue pas un parcours.

Elle décrit uniquement une capacité à atteindre.

Le rôle du Learning Context est de répondre à la question :

> **Comment cette compétence peut-elle être acquise de manière progressive, structurée et démontrable ?**

Le résultat de cette transformation est un **Learning Blueprint**.

---

# 5. Responsabilités

Le Learning Context est responsable de :

* construire les Learning Blueprints ;
* organiser les étapes d'apprentissage ;
* définir les séquences pédagogiques ;
* structurer les modules ;
* organiser les unités d'apprentissage ;
* planifier les consolidations ;
* définir les jalons de progression ;
* planifier les validations intermédiaires ;
* estimer les charges de travail ;
* définir plusieurs stratégies pédagogiques lorsqu'elles existent ;
* maintenir la cohérence pédagogique du parcours.

Il n'est jamais responsable :

* des utilisateurs ;
* des programmes personnels ;
* de la progression réelle ;
* des activités quotidiennes ;
* des résultats individuels.

---

# 6. Ubiquitous Language

## Learning Blueprint

Organisation pédagogique officielle d'un modèle de compétence.

Il décrit comment une compétence doit être progressivement acquise.

---

## Learning Strategy

Approche pédagogique utilisée pour construire un Learning Blueprint.

Exemples :

* Foundations First
* Project Driven
* Theory First
* Practice Driven
* Intensive
* Progressive

Une stratégie est une manière d'organiser l'apprentissage, non une compétence.

---

## Learning Stage

Grande étape du parcours.

Elle représente un objectif pédagogique majeur.

---

## Learning Module

Ensemble cohérent d'unités d'apprentissage poursuivant un objectif commun.

---

## Learning Unit

Plus petite unité pédagogique organisée.

Elle correspond à une notion ou à un ensemble réduit de notions pouvant être étudiées comme un tout.

---

## Milestone

Point de contrôle important marquant une progression significative dans le parcours.

---

## Consolidation

Phase destinée à renforcer les acquis avant la poursuite de la progression.

---

## Review Session

Séance planifiée de révision destinée à limiter l'oubli et à renforcer la mémorisation.

---

# 7. Modèle métier

Le Learning Context organise les parcours selon la structure suivante.

```text
Reference Model
        │
        ▼
Learning Blueprint
        │
        ├── Learning Strategy
        ├── Learning Stages
        │       │
        │       ├── Learning Modules
        │       │       │
        │       │       ├── Learning Units
        │       │       ├── Review Sessions
        │       │       ├── Consolidations
        │       │       └── Milestones
        │       │
        │       └── Stage Validation
        │
        └── Blueprint Metadata
```

Le Learning Blueprint est une traduction pédagogique d'un Reference Model.

---

# 8. Principes métier

Le Learning Context applique les principes suivants.

## Principe 1 — Les fondations d'abord

Les notions fondamentales sont toujours introduites avant les spécialisations.

---

## Principe 2 — Une progression maîtrisable

Chaque étape poursuit un objectif atteignable.

Le parcours évite les ruptures brutales de difficulté.

---

## Principe 3 — Les dépendances sont respectées

Une unité ne peut apparaître que lorsque les prérequis sont acquis.

---

## Principe 4 — La consolidation est obligatoire

Chaque progression importante est suivie d'une consolidation.

---

## Principe 5 — Les validations sont progressives

Les acquis sont régulièrement observés avant d'autoriser la poursuite du parcours.

---

## Principe 6 — Les stratégies sont interchangeables

Plusieurs Learning Blueprints peuvent exister pour une même compétence.

Ils poursuivent le même objectif mais organisent différemment l'apprentissage.

---

# 9. Cycle de vie

Chaque Learning Blueprint suit le cycle suivant.

```text
Draft
    ↓
Prototype
    ↓
Experimental
    ↓
Community Review
    ↓
Validated
    ↓
Recommended
    ↓
Reference Learning Blueprint
    ↓
Deprecated
    ↓
Archived
```

---

# 10. Agrégats

## Aggregate Root

### Learning Blueprint

Le Learning Blueprint constitue la racine d'agrégat.

Toutes les modifications de l'organisation pédagogique transitent par lui.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Learning Blueprint
* Learning Strategy
* Learning Stage
* Learning Module
* Learning Unit
* Milestone
* Consolidation
* Review Session
* Stage Validation

---

# 12. Value Objects

Les principaux Value Objects sont :

* BlueprintIdentifier
* StrategyIdentifier
* StageIdentifier
* ModuleIdentifier
* UnitIdentifier
* EstimatedDuration
* DifficultyLevel
* Workload
* SequenceOrder
* CompletionCriteria

---

# 13. Domain Services

Les principaux services métier sont :

* Learning Blueprint Builder
* Progression Planner
* Dependency Resolver
* Consolidation Planner
* Review Scheduler
* Learning Strategy Manager
* Blueprint Publisher

---

# 14. Domain Events

Les principaux événements métier sont :

* LearningBlueprintCreated
* StrategyApplied
* StageAdded
* ModuleAdded
* ConsolidationScheduled
* ReviewScheduled
* MilestoneDefined
* BlueprintPublished
* BlueprintDeprecated

---

# 15. Invariants

Le Learning Context garantit notamment les invariants suivants :

* chaque Learning Blueprint est basé sur un Reference Model publié ;
* une stratégie pédagogique est explicitement définie ;
* les dépendances conceptuelles sont respectées ;
* chaque étape possède un objectif pédagogique ;
* les consolidations sont intégrées au parcours ;
* les validations intermédiaires sont définies ;
* une version publiée est immuable.

---

# 16. Interfaces exposées

Le Learning Context expose notamment les capacités suivantes :

* consulter les Learning Blueprints disponibles ;
* consulter les stratégies pédagogiques ;
* récupérer les étapes d'un parcours ;
* obtenir les modules d'une étape ;
* consulter les unités d'apprentissage ;
* récupérer les consolidations ;
* récupérer les jalons ;
* consulter les validations intermédiaires.

Les consommateurs n'accèdent jamais directement aux structures internes.

---

# 17. Relations avec les autres Contexts

## Knowledge Context

Fournit les éléments de connaissance utilisés dans les unités d'apprentissage.

---

## Competency Context

Fournit les Reference Models servant de base aux Learning Blueprints.

---

## Program Context

Instancie un Learning Blueprint pour créer un programme personnel adapté à un utilisateur.

---

## Assessment Context

Réutilise les validations prévues dans le Learning Blueprint pour construire les évaluations.

---

## Progress Context

Observe la progression réelle d'un utilisateur à travers un Learning Blueprint.

---

## Analytics Context

Analyse l'efficacité comparative des stratégies pédagogiques et des organisations de parcours.

---

# 18. Décisions architecturales

Le Learning Context ne décrit jamais un apprenant.

Il ne contient aucune donnée de progression individuelle.

Il ne gère aucune activité quotidienne.

Il définit uniquement des modèles d'apprentissage réutilisables.

Plusieurs Learning Blueprints peuvent coexister pour une même compétence afin de répondre à différents profils, contraintes ou stratégies pédagogiques.

L'approche pédagogique de LevelUP est considérée comme évolutive. Les Learning Blueprints constituent des propositions construites selon les principes du Reference Model Engineering Framework (RMEF), destinées à être expérimentées, évaluées et améliorées grâce aux observations, aux retours des utilisateurs et aux données collectées.

Le Learning Context constitue ainsi la source de vérité concernant l'organisation pédagogique des compétences dans l'écosystème LevelUP.
