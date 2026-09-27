# Progress Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-PROGRESS-001

---

# 1. Objet

Le **Progress Context** est le Bounded Context responsable de l'observation, de l'analyse et de la représentation de la progression réelle d'un apprenant.

Il collecte les preuves produites tout au long du parcours afin d'estimer le niveau de maîtrise des connaissances et des compétences.

Le Progress Context n'accorde jamais de validation officielle.

Il produit une représentation continue de l'évolution de l'apprenant.

---

# 2. Mission

Observer la progression réelle d'un apprenant en analysant les activités exécutées, les missions réalisées, les consolidations, les révisions et les résultats d'évaluation afin de déterminer l'état de maîtrise des connaissances et des compétences.

---

# 3. Position dans l'écosystème

Le Progress Context appartient à l'Execution Layer.

Il reçoit des informations provenant principalement de l'Activity Context et de l'Assessment Context.

Il fournit une vision consolidée de l'évolution de l'apprenant.

---

# 4. Vision métier

La progression n'est pas le nombre d'activités réalisées.

La progression représente l'évolution observable de la maîtrise.

Le Progress Context cherche à répondre à la question :

> **Quel est le niveau réel de maîtrise atteint par l'apprenant à cet instant ?**

---

# 5. Responsabilités

Le Progress Context est responsable de :

* observer les preuves d'apprentissage ;
* estimer le niveau de maîtrise ;
* suivre l'évolution des connaissances ;
* suivre l'évolution des compétences ;
* détecter les régressions ;
* détecter les lacunes persistantes ;
* identifier les fondations insuffisamment consolidées ;
* proposer des consolidations ou des révisions ;
* maintenir l'historique de progression.

Il n'est jamais responsable :

* de planifier les activités ;
* de créer les programmes ;
* de définir les compétences ;
* de valider officiellement une compétence.

---

# 6. Ubiquitous Language

## Progress Record

Enregistrement de l'évolution d'un apprenant.

---

## Learning Evidence

Élément observable démontrant une progression.

Exemples :

* activité réalisée ;
* mission terminée ;
* révision effectuée ;
* consolidation réussie ;
* observation d'évaluation.

---

## Mastery State

État courant de maîtrise d'une connaissance ou d'une compétence.

---

## Mastery Dimension

Dimension spécifique observée.

Exemples :

* compréhension ;
* application ;
* autonomie ;
* stabilité ;
* rigueur.

---

## Progress Snapshot

Photographie de la progression à un instant donné.

---

## Regression

Perte observable de maîtrise nécessitant une action corrective.

---

# 7. Modèle métier

```text
Learning Evidence
        │
        ▼
Progress Engine
        │
        ├── Mastery States
        ├── Progress Records
        ├── Snapshots
        ├── Regression Detection
        └── Recommendations
```

---

# 8. Principes métier

## Principe 1 — Les preuves avant les métriques

Toute estimation repose sur des preuves observables.

---

## Principe 2 — La maîtrise est multidimensionnelle

Une compétence est évaluée selon plusieurs dimensions complémentaires.

---

## Principe 3 — La progression est continue

Elle évolue tout au long du parcours.

---

## Principe 4 — Les régressions sont naturelles

Une perte de maîtrise est un phénomène normal qui doit être détecté et traité.

---

## Principe 5 — Les fondations sont prioritaires

Une faiblesse sur les fondations peut entraîner une révision avant la poursuite du parcours.

---

# 9. Cycle de vie

```text
Observation
      ↓
Analysis
      ↓
Mastery Update
      ↓
Recommendation
      ↓
Historical Snapshot
```

---

# 10. Agrégats

## Aggregate Root

### Progress Record

Chaque Progress Record constitue la racine d'agrégat représentant l'état de progression d'un apprenant.

---

# 11. Entités

* Progress Record
* Learning Evidence
* Mastery State
* Progress Snapshot
* Recommendation
* Regression Report

---

# 12. Value Objects

* ProgressId
* EvidenceId
* MasteryLevel
* MasteryDimension
* ObservationDate
* ConfidenceLevel
* RecommendationType

---

# 13. Domain Services

* Progress Analyzer
* Mastery Estimator
* Regression Detector
* Recommendation Engine
* Progress Historian

---

# 14. Domain Events

* EvidenceCollected
* ProgressUpdated
* MasteryImproved
* RegressionDetected
* RecommendationGenerated
* SnapshotCreated

---

# 15. Invariants

Le Progress Context garantit notamment que :

* toute estimation repose sur des preuves observables ;
* chaque Progress Record appartient à un seul apprenant ;
* les observations sont historisées ;
* aucune compétence n'est déclarée acquise par ce contexte ;
* les recommandations n'altèrent jamais les données d'observation.

---

# 16. Interfaces exposées

Le Progress Context expose notamment les capacités suivantes :

* consulter la progression globale ;
* consulter la maîtrise d'une compétence ;
* consulter la maîtrise d'une connaissance ;
* consulter les dimensions de maîtrise ;
* consulter les recommandations ;
* consulter l'historique de progression.

---

# 17. Relations avec les autres Contexts

## Activity Context

Fournit les preuves d'exécution des activités.

---

## Assessment Context

Fournit les observations issues des évaluations.

---

## Program Context

Consomme les recommandations afin d'adapter le parcours si nécessaire.

---

## Analytics Context

Analyse les tendances de progression et les modèles d'apprentissage.

---

# 18. Décisions architecturales

Le Progress Context constitue la source de vérité concernant l'évolution observée des apprenants.

Il ne remplace jamais une évaluation officielle.

Son rôle est d'offrir une représentation fidèle, continue et multidimensionnelle de la maîtrise acquise au fil du temps.

Les décisions de validation restent exclusivement de la responsabilité du Assessment Context.
