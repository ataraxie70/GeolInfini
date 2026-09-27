# Competency Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-COMPETENCY-001

---

# 1. Objet

Le **Competency Context** est le Bounded Context chargé de gérer le référentiel officiel des compétences de LevelUP.

Il constitue la source de vérité concernant les compétences, leurs fondations, leurs objectifs, leurs dépendances, leurs critères de validation et leurs possibilités d'évolution.

Il ne gère ni les utilisateurs, ni les parcours individuels, ni la progression.

Il gère exclusivement le patrimoine de compétences de LevelUP.

---

# 2. Mission

Fournir un référentiel cohérent, structuré, versionné et évolutif permettant aux autres contextes de construire des parcours conduisant vers des compétences réelles.

Le Competency Context garantit que chaque compétence disponible dans LevelUP respecte les principes définis par le **Reference Model Engineering Framework (RMEF)**.

---

# 3. Position dans l'écosystème

Le Competency Context appartient à la couche **Reference Layer**.

Il ne contient aucune donnée propre à un utilisateur.

Il publie les modèles de référence qui seront utilisés par les autres Bounded Contexts.

Il constitue l'une des principales sources de vérité du système.

---

# 4. Responsabilités

Le Competency Context est responsable de :

* gérer les domaines de compétences ;
* gérer les modèles de référence (Reference Models) ;
* gérer les Competency Blueprints ;
* gérer les fondations ;
* gérer les objectifs de compétence ;
* gérer les résultats attendus ;
* gérer les prérequis conceptuels ;
* gérer les dépendances entre compétences ;
* gérer les chemins d'évolution ;
* gérer le versionnement des modèles ;
* publier les modèles validés ;
* archiver les modèles obsolètes.

Il n'est jamais responsable :

* de la progression d'un utilisateur ;
* des programmes personnels ;
* des activités quotidiennes ;
* des évaluations individuelles ;
* des missions exécutées.

---

# 5. Vision métier

Dans LevelUP, une compétence est un actif métier.

Elle constitue une représentation officielle d'une capacité démontrable dans un domaine donné.

Le Competency Context garantit que cette représentation reste stable, cohérente et indépendante des parcours individuels.

---

# 6. Ubiquitous Language

## Domain

Ensemble reconnu de pratiques conduisant vers une ou plusieurs compétences.

---

## Competency

Capacité opérationnelle démontrable dans un contexte réel.

---

## Competency Blueprint

Structure conceptuelle décrivant une compétence selon les principes du RMEF.

---

## Reference Model

Version officielle publiée d'un Competency Blueprint.

---

## Foundation

Connaissance fondamentale indispensable à l'acquisition d'une compétence.

---

## Learning Objective

Objectif pédagogique décrivant un acquis attendu.

---

## Expected Outcome

Capacité observable attendue à l'issue de la compétence.

---

## Validation Criterion

Condition permettant de considérer une compétence comme démontrée.

---

## Evolution Path

Relation entre une compétence et ses prolongements naturels.

---

# 7. Modèle métier

Le Competency Context organise les connaissances selon la structure suivante.

```text
Domain
    │
    ├── Competency Blueprint
    │       │
    │       ├── Foundations
    │       ├── Knowledge Areas
    │       ├── Learning Objectives
    │       ├── Expected Outcomes
    │       ├── Validation Criteria
    │       ├── Evolution Paths
    │       └── Metadata
    │
    └── Reference Model
```

Le Reference Model constitue la publication officielle d'un Competency Blueprint.

---

# 8. Principes métier

Le Competency Context applique les règles suivantes.

* Une compétence possède une finalité clairement définie.
* Une compétence repose sur des fondations explicites.
* Les dépendances conceptuelles sont documentées.
* Une compétence possède des critères de validation.
* Une compétence décrit des capacités observables.
* Une compétence peut évoluer vers d'autres compétences.
* Toute compétence appartient à un domaine reconnu.
* Les modèles suivent les principes du RMEF.

---

# 9. Cycle de vie d'un modèle

Chaque modèle suit le cycle suivant.

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
Reference Standard
    ↓
Deprecated
    ↓
Archived
```

---

# 10. Agrégats

## Aggregate Root

### Competency Blueprint

Le Competency Blueprint constitue la racine d'agrégat.

Toutes les modifications passent par lui.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Competency Blueprint
* Foundation
* Knowledge Area
* Learning Objective
* Expected Outcome
* Validation Criterion
* Evolution Path
* Reference Model

---

# 12. Value Objects

Les principaux Value Objects sont :

* CompetencyId
* DomainId
* BlueprintVersion
* DifficultyLevel
* MasteryLevel
* EstimatedDuration
* Priority
* OutcomeDescription

---

# 13. Domain Services

Les principaux services métier sont :

* Blueprint Builder
* Blueprint Validator
* Dependency Analyzer
* Evolution Planner
* Version Manager
* Publication Manager

---

# 14. Domain Events

Les principaux événements métier sont :

* CompetencyCreated
* BlueprintUpdated
* FoundationAdded
* ValidationCriterionAdded
* BlueprintValidated
* ReferenceModelPublished
* ReferenceModelDeprecated
* ReferenceModelArchived

---

# 15. Invariants

Le Competency Context garantit notamment les invariants suivants :

* un Blueprint appartient à un seul domaine ;
* un Blueprint possède au moins une fondation ;
* un Blueprint possède une finalité explicite ;
* un Blueprint possède au moins un résultat attendu ;
* un Blueprint possède des critères de validation ;
* un Reference Model provient toujours d'un Blueprint ;
* une version publiée est immuable.

---

# 16. Interfaces exposées

Le Competency Context expose notamment les capacités suivantes :

* rechercher un domaine ;
* consulter une compétence ;
* obtenir les fondations ;
* obtenir les prérequis ;
* consulter les objectifs ;
* consulter les critères de validation ;
* consulter les chemins d'évolution ;
* obtenir la version officielle d'un modèle.

Les autres contextes n'accèdent jamais directement aux structures internes.

---

# 17. Relations avec les autres Contexts

## Learning Context

Consomme les Reference Models afin de construire les Learning Blueprints.

---

## Knowledge Context

Associe des ressources et des contenus aux éléments du modèle.

---

## Assessment Context

Utilise les critères de validation et les résultats attendus.

---

## Program Context

Instancie des Learning Blueprints dans des programmes personnels.

---

## Progress Context

Observe la progression d'un utilisateur vers une compétence.

---

## Analytics Context

Analyse l'utilisation et l'efficacité des modèles.

---

# 18. Décisions architecturales

Le Competency Context ne décrit jamais les utilisateurs.

Il ne contient aucune progression individuelle.

Il ne gère aucune activité.

Il ne gère aucune mission personnelle.

Il représente exclusivement le patrimoine officiel des compétences de LevelUP.

Toutes les évolutions du référentiel doivent respecter les principes établis par le **Reference Model Engineering Framework (RMEF)**.

Le Competency Context constitue ainsi le cœur du **Reference Layer** et la principale source de vérité concernant les compétences dans l'écosystème LevelUP.
