# Assessment Context Specification

**Version :** 1.0 (Draft)
**Statut :** Strategic Bounded Context
**Catégorie :** Domain Architecture
**Code :** LEVELUP-CTX-ASSESSMENT-001

---

# 1. Objet

Le **Assessment Context** est le Bounded Context responsable de l'évaluation et de la validation officielle des connaissances, des savoir-faire et des compétences dans l'écosystème LevelUP.

Il détermine, à partir de preuves observables et de critères explicites, si une compétence est effectivement démontrée.

Le Assessment Context ne mesure pas la progression.

Il ne planifie pas l'apprentissage.

Il prend une décision métier fondée sur des preuves.

---

# 2. Mission

Fournir un processus d'évaluation rigoureux, objectif et traçable permettant de déterminer si un apprenant possède réellement les connaissances, les capacités d'application et l'autonomie attendues pour une compétence donnée.

La mission du Assessment Context est de garantir la crédibilité des compétences reconnues par LevelUP.

---

# 3. Position dans l'écosystème

Le Assessment Context appartient à l'Execution Layer.

Il exploite :

* les critères de compétence définis par le Competency Context ;
* les preuves produites par le Activity Context ;
* les observations du Progress Context.

Il produit des décisions officielles de validation.

---

# 4. Vision métier

Une compétence n'est jamais présumée.

Elle est démontrée.

La validation d'une compétence repose sur un ensemble cohérent de preuves couvrant plusieurs dimensions complémentaires :

* compréhension ;
* application ;
* autonomie ;
* qualité d'exécution ;
* capacité de justification.

Le résultat d'une évaluation est une décision métier, et non une simple note.

---

# 5. Responsabilités

Le Assessment Context est responsable de :

* définir les modèles d'évaluation ;
* organiser les sessions d'évaluation ;
* collecter les preuves ;
* observer les performances ;
* appliquer les critères d'évaluation ;
* produire un verdict de compétence ;
* conserver l'historique des évaluations ;
* garantir la traçabilité des décisions.

Il n'est jamais responsable :

* de créer les compétences ;
* de planifier les parcours ;
* de mesurer la progression continue ;
* de gérer les activités quotidiennes.

---

# 6. Ubiquitous Language

## Assessment Blueprint

Modèle officiel décrivant comment une compétence doit être évaluée.

---

## Assessment Session

Session durant laquelle un ou plusieurs éléments sont évalués.

---

## Assessment Criterion

Critère permettant d'observer un aspect précis de la compétence.

---

## Rubric

Grille décrivant les niveaux de performance attendus pour chaque critère.

---

## Evidence

Preuve utilisée pour appuyer une décision d'évaluation.

Une preuve peut être :

* théorique ;
* pratique ;
* comportementale.

---

## Observation

Constat effectué pendant une évaluation.

Une observation décrit un fait.

Elle ne constitue pas à elle seule une décision.

---

## Assessment Verdict

Décision officielle produite par le contexte.

---

## Competency Validation

Reconnaissance officielle qu'une compétence est démontrée conformément aux exigences du modèle de référence.

---

# 7. Modèle métier

```text
Competency Blueprint
        │
        ▼
Assessment Blueprint
        │
        ├── Assessment Criteria
        ├── Rubrics
        ├── Assessment Sessions
        │       │
        │       ├── Observations
        │       ├── Evidence
        │       └── Verdict
        │
        └── Validation History
```

Le modèle d'évaluation est indépendant des programmes et des activités.

---

# 8. Types de preuves

## Knowledge Evidence

Preuves démontrant la compréhension des concepts, principes, mécanismes et raisonnements.

---

## Practical Evidence

Preuves démontrant la capacité à réaliser une tâche ou une mission.

---

## Behavioral Evidence

Preuves démontrant les comportements attendus :

* autonomie ;
* rigueur ;
* méthode ;
* qualité ;
* justification des décisions.

---

# 9. Niveaux de démonstration

Une compétence peut être évaluée selon les niveaux suivants.

```text
Not Demonstrated

↓

Partially Demonstrated

↓

Demonstrated Under Guidance

↓

Demonstrated Independently

↓

Consistently Demonstrated
```

Ces niveaux représentent une décision métier.

Ils ne constituent pas une note.

---

# 10. Principes métier

## Principe 1 — Aucune compétence sans preuves

Toute validation repose sur des preuves observables.

---

## Principe 2 — Les critères sont explicites

Chaque décision est justifiée par des critères connus.

---

## Principe 3 — Les observations sont traçables

Chaque verdict peut être expliqué.

---

## Principe 4 — La compréhension est aussi importante que l'exécution

Une tâche réussie sans compréhension des principes ne suffit pas.

---

## Principe 5 — L'autonomie est indispensable

Une compétence réellement acquise doit pouvoir être mobilisée sans assistance excessive.

---

## Principe 6 — Les décisions sont reproductibles

Deux évaluateurs appliquant le même modèle doivent parvenir à une décision cohérente.

---

# 11. Cycle de vie

Chaque évaluation suit le cycle suivant.

```text
Planned
      ↓
Prepared
      ↓
Running
      ↓
Evidence Collected
      ↓
Reviewed
      ↓
Verdict Issued
      ↓
Archived
```

---

# 12. Agrégats

## Aggregate Root

### Assessment

L'Assessment constitue la racine d'agrégat.

Toutes les preuves et décisions lui sont rattachées.

---

# 13. Entités

Le contexte contient notamment les entités suivantes :

* Assessment
* Assessment Blueprint
* Assessment Session
* Assessment Criterion
* Rubric
* Evidence
* Observation
* Assessment Verdict
* Competency Validation

---

# 14. Value Objects

Les principaux Value Objects sont :

* AssessmentId
* CriterionIdentifier
* RubricLevel
* ObservationNote
* EvidenceIdentifier
* VerdictStatus
* ConfidenceLevel
* ValidationDate

---

# 15. Domain Services

Les principaux services métier sont :

* Assessment Planner
* Evidence Collector
* Rubric Evaluator
* Competency Validator
* Verdict Generator
* Validation Registry

---

# 16. Domain Events

Les principaux événements métier sont :

* AssessmentCreated
* AssessmentStarted
* EvidenceCollected
* ObservationRecorded
* AssessmentCompleted
* VerdictIssued
* CompetencyValidated
* ValidationRevoked

---

# 17. Invariants

Le Assessment Context garantit notamment que :

* chaque évaluation est associée à un Assessment Blueprint ;
* chaque verdict repose sur des preuves identifiées ;
* chaque preuve est traçable ;
* les critères appliqués sont ceux publiés par le Competency Context ;
* une validation officielle est historisée ;
* une décision peut être réexaminée si le modèle d'évaluation évolue.

---

# 18. Interfaces exposées

Le Assessment Context expose notamment les capacités suivantes :

* créer une session d'évaluation ;
* consulter un modèle d'évaluation ;
* enregistrer des preuves ;
* enregistrer des observations ;
* produire un verdict ;
* consulter l'historique des validations ;
* vérifier le statut d'une compétence.

---

# 19. Relations avec les autres Contexts

## Competency Context

Fournit les critères de compétence et les attentes officielles.

---

## Activity Context

Fournit les preuves produites lors des missions et des activités.

---

## Progress Context

Fournit l'historique de progression et les observations utiles à l'évaluation.

---

## Program Context

Déclenche certaines évaluations prévues dans un programme.

---

## Analytics Context

Analyse la qualité, la cohérence et l'efficacité des modèles d'évaluation.

---

# 20. Décisions architecturales

Le Assessment Context constitue la source de vérité concernant la validation officielle des compétences dans LevelUP.

Il distingue clairement :

* la progression observée ;
* la démonstration de compétence ;
* la décision de validation.

Les évaluations reposent sur un ensemble de preuves couvrant la compréhension, l'application et l'autonomie.

Le contexte ne produit pas de notes comme finalité métier.

Il produit des décisions argumentées, traçables et reproductibles, fondées sur des critères publiés et des preuves observables.

Cette approche garantit que les compétences reconnues par LevelUP conservent une valeur réelle et correspondent à une capacité effectivement démontrée dans un contexte proche de la pratique.
