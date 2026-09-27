# Knowledge Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-KNOWLEDGE-001

---

# 1. Objet

Le **Knowledge Context** est le Bounded Context responsable de la gestion du patrimoine de connaissances de LevelUP.

Il constitue la source officielle des concepts, principes, définitions, règles, relations et ressources qui composent les différents domaines de connaissance.

Il ne décrit pas les compétences.

Il ne décrit pas les parcours d'apprentissage.

Il organise uniquement la connaissance.

---

# 2. Mission

Construire, organiser, maintenir et faire évoluer un référentiel de connaissances structuré, cohérent et réutilisable servant de fondation à l'ensemble des modèles de référence de LevelUP.

Le Knowledge Context garantit que chaque élément de connaissance possède une définition claire, une place dans l'architecture des connaissances et des relations explicites avec les autres éléments du référentiel.

---

# 3. Position dans l'écosystème

Le Knowledge Context appartient au **Reference Layer**.

Il constitue le niveau le plus fondamental du patrimoine intellectuel de LevelUP.

Tous les autres contextes du référentiel consomment les connaissances qu'il expose.

Aucun utilisateur n'interagit directement avec ce contexte dans le cadre de sa progression personnelle.

---

# 4. Responsabilités

Le Knowledge Context est responsable de :

* gérer les concepts ;
* gérer les notions ;
* gérer les principes ;
* gérer les définitions ;
* gérer le glossaire métier ;
* gérer les taxonomies ;
* gérer les classifications ;
* gérer les relations entre concepts ;
* gérer les dépendances conceptuelles ;
* associer les ressources de référence ;
* maintenir la cohérence du patrimoine de connaissances ;
* versionner les éléments de connaissance.

Il n'est jamais responsable :

* des compétences ;
* des parcours ;
* des programmes ;
* des évaluations ;
* de la progression d'un utilisateur.

---

# 5. Vision métier

Une connaissance constitue une unité réutilisable du patrimoine intellectuel de LevelUP.

Elle possède une existence indépendante.

Elle peut être utilisée simultanément par plusieurs compétences, plusieurs modèles de référence et plusieurs parcours d'apprentissage.

La connaissance est un actif partagé.

---

# 6. Ubiquitous Language

## Knowledge Element

Unité élémentaire de connaissance.

Elle représente une notion clairement identifiable.

---

## Concept

Idée fondamentale décrivant un objet, un mécanisme ou un principe.

Exemples :

* inode
* Processus
* Widget
* Variable
* Algorithme
* Équation

---

## Principle

Règle générale expliquant le fonctionnement d'un système ou d'un domaine.

---

## Definition

Description officielle d'un concept.

---

## Knowledge Relation

Lien logique reliant plusieurs éléments de connaissance.

Exemples :

* dépend de ;
* explique ;
* utilise ;
* complète ;
* spécialise ;
* généralise.

---

## Knowledge Category

Famille permettant de classifier les éléments du référentiel.

---

## Reference Resource

Livre, documentation, vidéo, article, laboratoire ou toute autre ressource permettant d'approfondir une connaissance.

La ressource n'est pas la connaissance.

Elle constitue un support d'apprentissage.

---

# 7. Modèle métier

Le patrimoine de connaissances est organisé selon la structure suivante.

```text
Knowledge Domain
        │
        ├── Knowledge Category
        │
        ├── Knowledge Element
        │       │
        │       ├── Definition
        │       ├── Principles
        │       ├── Relations
        │       ├── References
        │       ├── Examples
        │       └── Metadata
        │
        └── Taxonomy
```

Les éléments de connaissance constituent un réseau et non une simple liste de chapitres.

---

# 8. Principes métier

Le Knowledge Context applique les règles suivantes.

* Une connaissance possède une définition officielle.
* Une connaissance peut être reliée à plusieurs autres connaissances.
* Une connaissance est indépendante des compétences qui l'utilisent.
* Une connaissance peut être utilisée dans plusieurs domaines.
* Les ressources documentaires sont associées à la connaissance mais ne la définissent pas.
* Les connaissances sont organisées sous forme de réseau conceptuel.

---

# 9. Cycle de vie

Chaque élément de connaissance suit le cycle suivant.

```text
Draft
    ↓
Reviewed
    ↓
Validated
    ↓
Published
    ↓
Deprecated
    ↓
Archived
```

---

# 10. Agrégats

## Aggregate Root

### Knowledge Element

Chaque élément de connaissance constitue la racine de son propre agrégat.

Toutes les modifications passent par lui.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Knowledge Element
* Definition
* Principle
* Example
* Knowledge Relation
* Knowledge Category
* Taxonomy
* Reference Resource

---

# 12. Value Objects

Les principaux Value Objects sont :

* KnowledgeId
* ConceptName
* DefinitionText
* RelationType
* KnowledgeLevel
* Difficulty
* VersionIdentifier
* SourceReference

---

# 13. Domain Services

Les principaux services métier sont :

* Knowledge Catalog Manager
* Knowledge Validator
* Relation Manager
* Taxonomy Manager
* Reference Manager
* Knowledge Publisher

---

# 14. Domain Events

Les principaux événements métier sont :

* KnowledgeCreated
* DefinitionUpdated
* RelationAdded
* ResourceLinked
* KnowledgeValidated
* KnowledgePublished
* KnowledgeDeprecated
* KnowledgeArchived

---

# 15. Invariants

Le Knowledge Context garantit notamment les invariants suivants :

* chaque élément possède une définition officielle ;
* un élément appartient à une catégorie ;
* les relations possèdent un type explicite ;
* les ressources sont toujours rattachées à un élément de connaissance ;
* une version publiée est immuable.

---

# 16. Interfaces exposées

Le Knowledge Context expose notamment les capacités suivantes :

* rechercher un concept ;
* consulter une définition ;
* consulter les relations d'un concept ;
* consulter les principes associés ;
* accéder aux ressources de référence ;
* parcourir une taxonomie ;
* rechercher des connaissances liées.

Les consommateurs accèdent exclusivement aux interfaces publiques du contexte.

---

# 17. Relations avec les autres Contexts

## Competency Context

Réutilise les éléments de connaissance pour construire les modèles de compétences.

---

## Learning Context

Organise les connaissances dans une progression pédagogique.

---

## Assessment Context

Associe certaines connaissances aux critères d'évaluation.

---

## Analytics Context

Analyse les connaissances les plus utilisées et les relations les plus consultées.

---

# 18. Décisions architecturales

Le Knowledge Context représente le patrimoine conceptuel de LevelUP.

Il ne mesure jamais la progression.

Il ne valide jamais une compétence.

Il ne construit jamais un parcours.

Il fournit les briques fondamentales utilisées par les autres contextes du Reference Layer.

Toute évolution de ce patrimoine doit préserver la cohérence des relations conceptuelles, la stabilité des définitions et la réutilisabilité des connaissances dans l'ensemble de l'écosystème.

Le Knowledge Context constitue ainsi la source de vérité concernant les connaissances de LevelUP, tandis que le Competency Context est la source de vérité concernant les compétences construites à partir de ces connaissances.
