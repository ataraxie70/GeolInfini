# LevelUP

# Livrable 10 — Business Behavior Model

**Référence : LEVELUP-BUS-006**

---

# 1. Objet du document

Le Business Behavior Model décrit le comportement dynamique de l'écosystème métier de LevelUP.

Alors que le **Business Object Model** définit les objets métier et que le **Business Domain Model** définit leur répartition au sein des domaines métier, le présent document formalise la manière dont ces objets évoluent, interagissent et changent d'état tout au long du cycle de création d'une compétence.

Le Business Behavior Model constitue la référence pour :

* les processus métier ;
* les événements métier ;
* les machines à états ;
* les règles de transition ;
* les futurs Domain Events du modèle DDD.

---

# 2. Objectif

Le comportement métier de LevelUP poursuit une seule finalité :

> Transformer progressivement une intention d'apprentissage en compétence démontrée grâce à une succession contrôlée d'états, d'activités, de validations et de décisions.

Chaque évolution est observable.

Chaque décision est justifiée.

Chaque validation est démontrable.

---

# 3. Principes comportementaux

Le comportement métier repose sur les principes suivants.

## 3.1 Toute progression est pilotée

La progression n'est jamais laissée au hasard.

Chaque étape possède :

* un objectif ;
* des critères d'entrée ;
* des critères de sortie.

---

## 3.2 Toute transition possède une justification

Un changement d'état résulte toujours d'un événement métier identifiable.

Aucun état ne change arbitrairement.

---

## 3.3 Les validations reposent sur des preuves

Une compétence n'est jamais considérée comme acquise uniquement parce qu'un parcours est terminé.

Toute validation repose sur :

* des observations ;
* des missions ;
* des preuves ;
* un diagnostic.

---

## 3.4 Les fondations gouvernent la progression

Les compétences fondamentales conditionnent l'accès aux compétences plus avancées.

Le principe « Foundations First » demeure applicable à l'ensemble des domaines.

---

## 3.5 La compétence est maintenue

La validation d'une compétence ne marque pas la fin de son cycle de vie.

Une compétence peut nécessiter :

* un maintien ;
* un renforcement ;
* une réévaluation.

---

# 4. Cycle comportemental global

Le comportement global de LevelUP suit le cycle suivant.

```text
Intention

↓

Choix d'une compétence

↓

Construction du Learning Path

↓

Organisation du Program

↓

Exécution quotidienne

↓

Observation

↓

Mission pratique

↓

Assessment

↓

Diagnostic

↓

Validation

↓

Capability Statement

↓

Maintien de la compétence
```

Chaque étape constitue une transition métier contrôlée.

---

# 5. Cycles de vie des principaux objets métier

## 5.1 Competency

```text
Defined

↓

Available

↓

Selected

↓

In Progress

↓

Foundations Verified

↓

Practice Ready

↓

Assessment Ready

↓

Validated

↓

Maintained

↓

Archived
```

### Règles

* une compétence ne peut être sélectionnée que si ses prérequis sont satisfaits ;
* une compétence ne devient jamais *Validated* sans diagnostic positif ;
* une compétence validée peut revenir en phase de maintien.

---

## 5.2 Learning Path

```text
Designed

↓

Published

↓

Assigned

↓

Running

↓

Completed

↓

Archived
```

---

## 5.3 Program

```text
Draft

↓

Planned

↓

Scheduled

↓

Running

↓

Paused

↓

Completed

↓

Archived
```

---

## 5.4 Activity

```text
Created

↓

Assigned

↓

Started

↓

Completed

↓

Reviewed
```

---

## 5.5 Mission

```text
Designed

↓

Assigned

↓

Running

↓

Submitted

↓

Observed

↓

Evaluated

↓

Closed
```

---

## 5.6 Assessment

```text
Pending

↓

Started

↓

Observed

↓

Diagnosed

↓

Validated

↓

Closed
```

---

# 6. Catalogue des événements métier

## Competency Domain

* DomainRegistered
* CompetencyDefined
* FoundationDefined
* FoundationValidated
* CompetencyUnlocked

---

## Learning Domain

* LearningPathCreated
* LearningPathPublished
* StageCompleted
* MilestoneReached

---

## Organization Domain

* ProgramCreated
* ProgramPlanned
* ScheduleUpdated
* RoutineGenerated

---

## Execution Domain

* ActivityAssigned
* ActivityStarted
* ActivityCompleted
* ProgramPaused
* ProgramResumed

---

## Assessment Domain

* MissionAssigned
* MissionSubmitted
* ObservationRecorded
* AssessmentCompleted
* DiagnosticProduced
* CompetencyValidated
* CapabilityStatementGenerated

---

## Analytics Domain

* ProgressCalculated
* TrendDetected
* RiskDetected
* RecommendationGenerated

---

# 7. Catalogue des commandes métier

Les commandes représentent les intentions adressées au système.

## Competency

* Define Competency
* Select Competency
* Validate Foundation

---

## Learning

* Generate Learning Path
* Add Stage
* Complete Stage

---

## Organization

* Create Program
* Schedule Program
* Update Routine
* Pause Program
* Resume Program

---

## Execution

* Start Activity
* Complete Activity
* Record Progress

---

## Assessment

* Assign Mission
* Submit Mission
* Record Observation
* Produce Diagnostic
* Validate Competency

---

# 8. Invariants comportementaux

Les règles suivantes sont considérées comme invariantes.

## Fondations

Une compétence avancée ne peut être validée tant que les fondations ne sont pas démontrées.

---

## Validation

Une validation nécessite :

* une mission exécutée ;
* des observations ;
* un diagnostic ;
* des preuves suffisantes.

---

## Progression

La progression chronologique ne constitue jamais une preuve de compétence.

---

## Régression pédagogique

Si une faiblesse importante est détectée, le système peut recommander un retour vers une étape antérieure afin de renforcer les fondations.

---

## Discipline

L'interruption prolongée d'un programme peut entraîner une réorganisation du planning sans modifier les compétences déjà acquises.

---

# 9. Comportement décisionnel

À plusieurs moments du cycle de vie, LevelUP prend des décisions métier.

Exemples :

* autoriser le passage à l'étape suivante ;
* recommander une révision ;
* générer une nouvelle mission ;
* adapter le rythme d'apprentissage ;
* suspendre temporairement un programme ;
* déclencher une réévaluation.

Ces décisions sont toujours motivées par des observations et des règles métier.

---

# 10. Vision comportementale globale

Le comportement global de LevelUP peut être résumé ainsi.

```text
Intent
        │
        ▼
Competency Selection
        │
        ▼
Learning Path Generation
        │
        ▼
Program Organization
        │
        ▼
Daily Execution
        │
        ▼
Observations
        │
        ▼
Practical Missions
        │
        ▼
Assessment
        │
        ▼
Diagnostic
        │
        ▼
Validation
        │
        ▼
Capability Statement
        │
        ▼
Competency Maintenance
```

Cette chaîne représente le comportement métier fondamental de LevelUP.

---

# 11. Principes d'architecture

Le comportement métier respecte les principes suivants :

* les événements représentent des faits métier déjà réalisés ;
* les commandes expriment une intention ;
* les décisions sont prises à partir des règles métier ;
* les états représentent la situation courante des objets métier ;
* les transitions sont déclenchées uniquement par des événements valides.

---

# 12. Décisions d'architecture

Les décisions suivantes sont désormais considérées comme structurantes.

* le comportement métier est piloté par les événements et les transitions d'état ;
* chaque objet métier possède un cycle de vie explicite ;
* les validations reposent exclusivement sur des preuves observables ;
* la progression n'est pas une mesure de compétence ;
* les compétences peuvent être maintenues, renforcées ou réévaluées au cours du temps.

---

# 13. Conclusion

Le Business Behavior Model formalise la dynamique métier de LevelUP.

Il complète le Business Domain Model et le Business Object Model en décrivant la manière dont les objets métier évoluent tout au long du cycle de développement d'une compétence.

Ce document constitue la base des futurs modèles DDD : agrégats, événements de domaine, services de domaine, workflows métier et orchestration applicative.
