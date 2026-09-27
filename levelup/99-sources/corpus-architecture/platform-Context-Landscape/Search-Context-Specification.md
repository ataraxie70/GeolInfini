# Search Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-SEARCH-001

---

# 1. Objet

Le **Search Context** est le Bounded Context responsable de l'indexation, de la recherche et de la découverte des objets métiers publiés par les différents contextes de LevelUP.

Il fournit un point d'accès unifié permettant d'explorer les connaissances, compétences, parcours, ressources, programmes, activités et autres objets de la plateforme.

Le Search Context ne possède pas les données métiers.

Il indexe les représentations publiées par leurs contextes propriétaires.

---

# 2. Mission

Permettre aux utilisateurs et aux services de découvrir rapidement et intelligemment les objets pertinents de l'écosystème LevelUP en exploitant leurs relations, leurs métadonnées et leur contexte pédagogique.

---

# 3. Position dans l'écosystème

Le Search Context appartient à la **Platform Services Layer**.

Il consomme les informations publiées par les autres Bounded Contexts et fournit des capacités de recherche transversales.

---

# 4. Vision métier

La recherche ne consiste pas uniquement à retrouver un objet connu.

Elle permet également de découvrir des connaissances, des compétences, des parcours et des ressources liés à un objectif d'apprentissage.

Le Search Context favorise la navigation dans l'écosystème pédagogique de LevelUP plutôt qu'une simple recherche textuelle.

---

# 5. Responsabilités

Le Search Context est responsable de :

* indexer les objets publiés par les autres contextes ;
* maintenir un index de recherche cohérent ;
* fournir des capacités de recherche unifiées ;
* permettre la découverte d'objets liés ;
* exploiter les métadonnées et les relations métier ;
* classer les résultats selon leur pertinence.

Il n'est jamais responsable :

* de créer ou modifier les objets métiers ;
* de définir les relations métier ;
* de produire des recommandations pédagogiques ;
* de gérer les droits d'accès.

---

# 6. Ubiquitous Language

## Search Index

Représentation indexée d'un objet métier.

---

## Search Document

Projection d'un objet métier destinée à la recherche.

---

## Discovery

Processus permettant d'explorer des objets liés à une recherche.

---

## Search Query

Expression formulée par un utilisateur ou un service.

---

## Search Result

Objet retourné par une recherche.

---

## Search Facet

Critère permettant de filtrer ou d'affiner les résultats.

---

## Search Scope

Périmètre couvert par une recherche.

---

## Relevance Score

Score de pertinence attribué à un résultat.

---

# 7. Objets indexés

Le Search Context peut indexer notamment :

* connaissances ;
* compétences ;
* domaines ;
* modèles de référence ;
* parcours ;
* programmes ;
* activités ;
* ressources pédagogiques ;
* évaluations ;
* portfolios ;
* certifications.

---

# 8. Capacités de recherche

Le Search Context permet notamment :

* la recherche plein texte ;
* la recherche sémantique ;
* la recherche par compétence ;
* la recherche par connaissance ;
* la recherche par domaine ;
* la recherche par objectif ;
* la recherche par niveau ;
* la recherche par prérequis ;
* la recherche par type de ressource ;
* la navigation par relations.

---

# 9. Modèle métier

```text
Bounded Contexts
        │
        ▼
Published Search Documents
        │
        ▼
Search Index
        │
        ├── Full-text Search
        ├── Semantic Search
        ├── Faceted Search
        ├── Discovery Engine
        │
        ▼
Search Results
```

---

# 10. Principes métier

## Principe 1 — Les données restent chez leur propriétaire

Le Search Context n'est jamais propriétaire des objets qu'il indexe.

---

## Principe 2 — L'index est une projection

Les documents indexés sont des représentations destinées à la recherche.

---

## Principe 3 — La découverte est aussi importante que la recherche

Le Search Context favorise l'exploration des relations entre les objets.

---

## Principe 4 — Les résultats sont contextualisés

La pertinence d'un résultat dépend du contexte de recherche et des métadonnées disponibles.

---

## Principe 5 — L'index est continuellement synchronisé

Toute évolution d'un objet publié doit être répercutée dans l'index.

---

# 11. Agrégats

## Aggregate Root

### Search Index

Le Search Index constitue la racine d'agrégat du contexte.

---

# 12. Entités

Le contexte contient notamment :

* Search Index
* Search Document
* Search Query
* Search Result
* Search Facet
* Search Scope

---

# 13. Value Objects

Les principaux Value Objects sont :

* SearchDocumentId
* SearchScore
* SearchFilter
* SearchCriteria
* SearchCategory
* SearchHighlight
* SearchMetadata

---

# 14. Domain Services

Les principaux services métier sont :

* Index Manager
* Search Engine
* Discovery Engine
* Ranking Service
* Query Parser
* Facet Builder

---

# 15. Domain Events

Les principaux événements métier sont :

* DocumentIndexed
* DocumentUpdated
* DocumentRemoved
* SearchExecuted
* SearchCompleted
* IndexRebuilt

---

# 16. Invariants

Le Search Context garantit notamment que :

* chaque document indexé possède un propriétaire métier ;
* l'index est synchronisé avec les objets publiés ;
* les résultats sont reproductibles pour une même requête et un même état de l'index ;
* les métadonnées de recherche sont cohérentes avec les objets d'origine ;
* les objets supprimés ou dépréciés sont retirés ou marqués dans l'index selon les règles de gouvernance.

---

# 17. Interfaces exposées

Le Search Context expose notamment les capacités suivantes :

* rechercher des objets ;
* explorer les relations entre objets ;
* filtrer les résultats ;
* naviguer par facettes ;
* consulter les objets associés ;
* rechercher par objectif d'apprentissage ;
* effectuer des recherches sémantiques.

---

# 18. Relations avec les autres Contexts

## Knowledge Context

Publie les connaissances indexables.

---

## Competency Context

Publie les compétences et leurs relations.

---

## Learning Context

Publie les parcours d'apprentissage.

---

## Resource Catalog Context

Publie les ressources pédagogiques.

---

## Recommendation Context

Peut utiliser les capacités de recherche pour identifier les ressources et objets les plus adaptés à une recommandation.

---

## Portfolio Context

Publie les réalisations et preuves pouvant être découvertes.

---

## Certification Context

Publie les certifications disponibles et leurs critères.

---

# 19. Décisions architecturales

Le Search Context constitue la capacité de découverte unifiée de LevelUP.

Il repose sur le principe que chaque Bounded Context reste propriétaire de ses données et publie une projection dédiée à l'indexation.

Cette architecture garantit une recherche transversale, cohérente et évolutive tout en préservant les frontières des différents contextes métier.

Le Search Context permet ainsi aux utilisateurs et aux services de naviguer dans l'ensemble de l'écosystème pédagogique sans rompre les principes du Domain-Driven Design.
