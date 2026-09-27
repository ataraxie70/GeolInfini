# Resource Catalog Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-RESOURCE-CATALOG-001

---

# 1. Objet

Le **Resource Catalog Context** est le Bounded Context responsable du référencement, de la qualification, de l'organisation et de la gestion des ressources pédagogiques utilisées dans l'écosystème LevelUP.

Il constitue le référentiel officiel des ressources pouvant être mobilisées par les parcours d'apprentissage, les activités, les recommandations et les évaluations.

Le Resource Catalog ne définit pas les parcours d'apprentissage.

Il fournit les ressources qui permettent de les mettre en œuvre.

---

# 2. Mission

Référencer, qualifier et organiser les ressources pédagogiques afin de garantir leur cohérence avec les modèles de référence, leur qualité et leur réutilisabilité dans l'ensemble de la plateforme.

---

# 3. Position dans l'écosystème

Le Resource Catalog Context appartient à la **Platform Services Layer**.

Il fournit des ressources aux différents contextes sans intervenir dans leurs décisions métier.

---

# 4. Vision métier

Une ressource pédagogique est un moyen d'acquérir ou de consolider une connaissance ou une compétence.

Le catalogue ne cherche pas à accumuler des contenus.

Il cherche à proposer des ressources adaptées, qualifiées et alignées avec les modèles de référence de LevelUP.

Les ressources peuvent être internes ou externes à la plateforme.

---

# 5. Responsabilités

Le Resource Catalog Context est responsable de :

* référencer les ressources pédagogiques ;
* qualifier les ressources selon des critères pédagogiques ;
* classifier les ressources ;
* gérer les métadonnées ;
* maintenir les versions ;
* suivre le cycle de vie des ressources ;
* établir les liens entre ressources, connaissances et compétences ;
* fournir les ressources aux autres contextes.

Il n'est jamais responsable :

* de définir les compétences ;
* de concevoir les parcours ;
* de produire des recommandations ;
* de mesurer la progression ;
* de valider les compétences.

---

# 6. Ubiquitous Language

## Learning Resource

Ressource pédagogique pouvant être utilisée dans un parcours d'apprentissage.

---

## Resource Catalog

Référentiel central des ressources pédagogiques.

---

## Resource Provider

Organisation ou auteur publiant une ressource.

---

## Resource Classification

Classification pédagogique d'une ressource.

---

## Resource Metadata

Ensemble des informations décrivant une ressource.

---

## Resource Quality

Niveau de qualité attribué à une ressource selon les critères de LevelUP.

---

## Resource Version

Version d'une ressource référencée.

---

## Resource Collection

Ensemble cohérent de ressources regroupées selon un objectif pédagogique.

---

# 7. Types de ressources

Le catalogue peut référencer notamment :

* cours ;
* livres ;
* vidéos ;
* articles ;
* documentations officielles ;
* laboratoires ;
* exercices ;
* projets ;
* jeux de données ;
* études de cas ;
* dépôts Git ;
* références normatives ;
* podcasts ;
* conférences ;
* ateliers ;
* outils logiciels.

---

# 8. Métadonnées pédagogiques

Chaque ressource possède notamment :

* un identifiant ;
* un titre ;
* un auteur ou fournisseur ;
* un type ;
* une langue ;
* une version ;
* un niveau ;
* une durée estimée ;
* des prérequis ;
* les connaissances couvertes ;
* les compétences couvertes ;
* les objectifs pédagogiques ;
* le modèle de référence associé ;
* un niveau de qualité ;
* son statut de validation.

---

# 9. Modèle métier

```text
Learning Resource
        │
        ├── Metadata
        ├── Classification
        ├── Version
        ├── Quality
        ├── Coverage
        └── Provider
```

---

# 10. Principes métier

## Principe 1 — Les ressources servent les modèles

Les ressources sont sélectionnées pour servir les modèles de référence, jamais l'inverse.

---

## Principe 2 — Les ressources sont qualifiées

Toute ressource est évaluée selon des critères explicites avant d'être recommandée.

---

## Principe 3 — Les ressources sont indépendantes de leur fournisseur

Le catalogue peut référencer des ressources internes comme externes.

---

## Principe 4 — Les ressources sont versionnées

Les évolutions sont historisées afin de garantir la reproductibilité des parcours.

---

## Principe 5 — Les métadonnées sont obligatoires

Une ressource ne peut être intégrée au catalogue sans métadonnées suffisantes.

---

# 11. Agrégats

## Aggregate Root

### Learning Resource

La Learning Resource constitue la racine d'agrégat.

---

# 12. Entités

Le contexte contient notamment :

* Learning Resource
* Resource Provider
* Resource Version
* Resource Classification
* Resource Collection
* Resource Review

---

# 13. Value Objects

Les principaux Value Objects sont :

* ResourceId
* ResourceType
* ResourceLevel
* ResourceLanguage
* ResourceQuality
* CoverageDescriptor
* EstimatedDuration
* VersionIdentifier

---

# 14. Domain Services

Les principaux services métier sont :

* Resource Catalog Service
* Resource Classifier
* Metadata Manager
* Resource Validator
* Version Manager
* Quality Evaluator

---

# 15. Domain Events

Les principaux événements métier sont :

* ResourceRegistered
* ResourceUpdated
* ResourceValidated
* ResourceDeprecated
* ResourceVersionPublished
* MetadataUpdated

---

# 16. Invariants

Le Resource Catalog Context garantit notamment que :

* chaque ressource possède des métadonnées complètes ;
* chaque ressource est versionnée ;
* les relations avec les connaissances et les compétences sont explicites ;
* une ressource dépréciée reste historisée ;
* la qualité pédagogique est traçable.

---

# 17. Interfaces exposées

Le Resource Catalog Context expose notamment les capacités suivantes :

* rechercher des ressources ;
* consulter une ressource ;
* consulter les métadonnées ;
* consulter les versions ;
* filtrer les ressources ;
* enregistrer une nouvelle ressource ;
* qualifier une ressource.

---

# 18. Relations avec les autres Contexts

## Knowledge Context

Associe les ressources aux connaissances.

---

## Competency Context

Associe les ressources aux compétences.

---

## Learning Context

Sélectionne les ressources pour construire les Learning Blueprints.

---

## Recommendation Context

Demande des ressources adaptées aux recommandations produites.

---

## Search Context

Indexe le catalogue afin de permettre une recherche unifiée.

---

## Analytics Context

Analyse l'utilisation, la qualité et l'efficacité des ressources.

---

# 19. Décisions architecturales

Le Resource Catalog Context constitue la source de vérité concernant les ressources pédagogiques de LevelUP.

Il sépare clairement la gestion des ressources de la conception des parcours et des décisions pédagogiques.

Les ressources sont qualifiées, versionnées et reliées aux connaissances, aux compétences et aux modèles de référence.

Cette séparation garantit la réutilisabilité des ressources, l'évolutivité du catalogue et la cohérence de l'ensemble de l'écosystème pédagogique.
