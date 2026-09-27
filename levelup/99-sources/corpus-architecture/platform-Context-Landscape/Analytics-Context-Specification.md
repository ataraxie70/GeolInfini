# Analytics Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-ANALYTICS-001

---

# 1. Objet

Le **Analytics Context** est le Bounded Context responsable de la collecte, de l'analyse et de l'interprétation des données produites par l'ensemble de la plateforme LevelUP.

Il transforme les événements métier en informations exploitables afin d'améliorer les parcours d'apprentissage, les modèles de référence, les recommandations et le pilotage de la plateforme.

Le Analytics Context n'intervient jamais dans les décisions métier des autres contextes.

---

# 2. Mission

Observer le fonctionnement de la plateforme et analyser les données issues des parcours d'apprentissage afin de produire des indicateurs, des tendances, des analyses et des recommandations destinés à améliorer continuellement l'écosystème LevelUP.

---

# 3. Position dans l'écosystème

Le Analytics Context appartient à la **Platform Services Layer**.

Il consomme les événements provenant des Core Domains.

Il fournit des analyses aux autres services de la plateforme sans modifier leur logique métier.

---

# 4. Vision métier

Chaque interaction réalisée dans LevelUP constitue une source potentielle d'apprentissage.

L'analyse ne vise pas uniquement à mesurer des performances.

Elle cherche à comprendre :

* comment les apprenants progressent ;
* où apparaissent les difficultés ;
* quels modèles pédagogiques produisent les meilleurs résultats ;
* quelles compétences sont les plus difficiles à acquérir ;
* quelles adaptations améliorent réellement les apprentissages.

Le Analytics Context transforme ces observations en connaissances exploitables.

---

# 5. Responsabilités

Le Analytics Context est responsable de :

* collecter les événements métier ;
* consolider les données d'observation ;
* produire des indicateurs ;
* identifier des tendances ;
* analyser les comportements d'apprentissage ;
* mesurer l'efficacité des modèles pédagogiques ;
* fournir des données aux autres services analytiques ;
* historiser les analyses.

Il n'est jamais responsable :

* de modifier un parcours ;
* de valider une compétence ;
* de personnaliser un programme ;
* de prendre des décisions pédagogiques.

---

# 6. Ubiquitous Language

## Analytics Event

Événement métier exploitable à des fins d'analyse.

---

## Indicator

Mesure calculée à partir d'un ensemble d'observations.

---

## Metric

Valeur quantitative représentant une caractéristique mesurable.

---

## Trend

Évolution observable dans le temps.

---

## Learning Insight

Information issue de l'analyse permettant de mieux comprendre un phénomène d'apprentissage.

---

## Analytics Report

Rapport regroupant plusieurs analyses.

---

## Dashboard

Vue synthétique des indicateurs.

---

# 7. Modèle métier

```text
Core Contexts
      │
      ▼
Analytics Event Stream
      │
      ▼
Analytics Engine
      │
      ├── Metrics
      ├── Indicators
      ├── Trends
      ├── Insights
      └── Reports
```

---

# 8. Sources de données

Le Analytics Context exploite notamment les données provenant des contextes suivants :

* Knowledge Context
* Competency Context
* Learning Context
* Program Context
* Activity Context
* Progress Context
* Assessment Context

Chaque contexte demeure propriétaire de ses données.

Le Analytics Context ne conserve que les informations nécessaires à l'analyse.

---

# 9. Principes métier

## Principe 1 — Les analyses sont non intrusives

L'analyse ne modifie jamais les données métiers.

---

## Principe 2 — Les données sont contextualisées

Une métrique n'a de sens qu'au regard de son contexte.

---

## Principe 3 — Les analyses sont explicables

Tout indicateur doit pouvoir être relié aux données qui l'ont produit.

---

## Principe 4 — Les analyses servent l'amélioration

La finalité n'est pas le contrôle, mais l'amélioration continue des parcours, des modèles et de la plateforme.

---

## Principe 5 — La confidentialité est préservée

Les analyses respectent les règles de confidentialité et de gouvernance définies par la plateforme.

---

# 10. Agrégats

## Aggregate Root

### Analytics Workspace

Regroupe les analyses, indicateurs et rapports produits pour un périmètre donné.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Analytics Workspace
* Analytics Event
* Indicator
* Metric
* Trend
* Insight
* Analytics Report
* Dashboard

---

# 12. Value Objects

Les principaux Value Objects sont :

* MetricIdentifier
* IndicatorValue
* ObservationPeriod
* TrendDirection
* ConfidenceLevel
* ReportPeriod
* DashboardIdentifier

---

# 13. Domain Services

Les principaux services métier sont :

* Event Collector
* Metrics Calculator
* Trend Analyzer
* Insight Generator
* Dashboard Builder
* Report Generator

---

# 14. Domain Events

Les principaux événements métier sont :

* AnalyticsEventCollected
* MetricCalculated
* IndicatorUpdated
* TrendDetected
* InsightGenerated
* ReportPublished

---

# 15. Invariants

Le Analytics Context garantit notamment que :

* toute analyse repose sur des données traçables ;
* les indicateurs sont reproductibles ;
* les rapports sont historisés ;
* aucune donnée métier n'est modifiée par une analyse ;
* chaque indicateur possède une définition explicite.

---

# 16. Interfaces exposées

Le Analytics Context expose notamment les capacités suivantes :

* consulter des tableaux de bord ;
* consulter des rapports analytiques ;
* obtenir des indicateurs ;
* obtenir des tendances ;
* exporter des analyses ;
* fournir des données aux autres services de la plateforme.

---

# 17. Relations avec les autres Contexts

## Core Domains

Consomment les analyses afin d'améliorer les modèles et les parcours.

---

## Recommendation Context

Exploite les analyses pour produire des recommandations adaptées.

---

## Governance Layer

Utilise certains indicateurs pour le pilotage de la plateforme.

---

# 18. Décisions architecturales

Le Analytics Context constitue la capacité d'observation globale de LevelUP.

Il ne participe jamais directement aux décisions métier.

Il produit des informations destinées à améliorer continuellement la plateforme, les modèles de référence et l'expérience d'apprentissage.

Toutes les analyses sont fondées sur des événements métier traçables et des méthodes de calcul explicites.

Le Analytics Context représente ainsi la source de vérité concernant l'analyse des données de fonctionnement de la plateforme.
