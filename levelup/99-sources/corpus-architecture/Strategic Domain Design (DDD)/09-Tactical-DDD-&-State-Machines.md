# LevelUP — Tactical DDD & State Machines Specification

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Domain Layer  
**Code :** LEVELUP-DOM-TACTICAL-009  

---

# 1. Conception des Agrégats (Aggregate Design)

Afin de structurer l'implémentation logicielle, les concepts métiers fondamentaux sont modélisés sous forme d'agrégats DDD avec des frontières transactionnelles claires et des invariants stricts.

```text
       [ API Client / Command ]
                  │
                  ▼
   ┌──────────────────────────────┐
   │        AGGREGATE ROOT        │ ➔ Valide les invariants et règles métiers
   │   (ex: AssessmentSession)    │
   └──────────────┬───────────────┘
                  │ ➔ modifie l'état interne
                  ▼
   ┌──────────────────────────────┐
   │     INTERNAL ENTITIES        │
   │  (ex: AssessmentAttempt)     │
   └──────────────────────────────┘
                  │ ➔ émet
                  ▼
   ┌──────────────────────────────┐
   │         DOMAIN EVENT         │
   │  (ex: AssessmentCompleted)   │
   └──────────────────────────────┘
```

---

## 1.1 Agrégat : Competency (Contexte Competency)
Représente la structure d'une compétence dans le référentiel de référence.
*   **Aggregate Root :** `Competency`
*   **Entités internes :** `CompetencyPrerequisite`
*   **Value Objects :** 
    *   `CompetencyId` (URN canonique - ex: `urn:levelup:competency:linux:bash`)
    *   `MasteryScale` (Niveaux attendus : Initié, Praticien, Maître)
*   **Invariants transactionnels :**
    1.  *Anti-cyclicité :* Une compétence ne peut pas être configurée comme prérequise d'elle-même, directement ou par transitivité.
    2.  *Échelle cohérente :* L'échelle de maîtrise doit comporter au moins un niveau d'évaluation valide.
*   **Méthodes d'action (Behavior) :**
    *   `addPrerequisite(CompetencyId prereqId)`
    *   `removePrerequisite(CompetencyId prereqId)`
    *   `defineMasteryCriteria(MasteryScale scale)`

---

## 1.2 Agrégat : AssessmentSession (Contexte Assessment)
Gère le cycle de vie d'une évaluation formelle.
*   **Aggregate Root :** `AssessmentSession`
*   **Entités internes :** `AssessmentAttempt`
*   **Value Objects :**
    *   `SessionId` (UUIDv4)
    *   `CompetencyId` (URN de la compétence ciblée)
    *   `LearnerId` (UUIDv4 anonyme)
    *   `ReviewCriteria` (Liste de critères évaluables binaires)
    *   `AssessmentStatus` (États du cycle de vie)
*   **Invariants transactionnels :**
    1.  *Soumission bornée :* Aucune preuve (`Evidence`) ne peut être rattachée ou soumise si l'état de la session n'est pas `Open` ou si le délai de temps est expiré.
    2.  *Complétude de décision :* Une décision de validation ne peut être enregistrée que si l'ensemble des `ReviewCriteria` a été explicitement noté (Vrai/Faux).
*   **Méthodes d'action (Behavior) :**
    *   `initialize(LearnerId learner, CompetencyId competency, ReviewCriteria criteria)`
    *   `submitEvidence(Evidence evidence)`
    *   `evaluateCriteria(CriteriaId criteria, bool isSatisfied)`
    *   `closeSession(EvaluatorId evaluator, string feedback)`

---

## 1.3 Agrégat : LearnerProgress (Contexte Progress)
Calcule et suit l'estimation de maîtrise de l'apprenant.
*   **Aggregate Root :** `LearnerProgress` (Unique par couple `LearnerId` + `WorkspaceId`)
*   **Entités internes :** `CompetencyProgress`
*   **Value Objects :**
    *   `LearnerId` (UUIDv4 anonyme)
    *   `WorkspaceId` (UUIDv4)
    *   `MasteryEstimation` (Probabilité de maîtrise estimée de 0.0 à 1.0)
    *   `ProgressConfidence` (Niveau de fiabilité basé sur la fraîcheur des preuves)
*   **Invariants transactionnels :**
    1.  *Source authentique :* Le score de `MasteryEstimation` ne peut être modifié que lors de la réception d'événements de complétion d'activités ou de sessions d'évaluation.
    2.  *Décroissance de fraîcheur (Decay Rule) :* Si aucune activité n'est enregistrée pour une compétence pendant une période de rétention définie, la confiance (`ProgressConfidence`) doit être dépréciée par calcul.
*   **Méthodes d'action (Behavior) :**
    *   `applyEvidenceValidation(CompetencyId competency, ConfidenceLevel confidence)`
    *   `applyActivityCompletion(CompetencyId competency, ActivityType type)`
    *   `applyTimeDecay(TimeSpan age)`

---

## 1.4 Agrégat : PersonalProgram (Contexte Program)
Représente le parcours de l'apprenant en cours d'exécution.
*   **Aggregate Root :** `PersonalProgram`
*   **Entités internes :** `PersonalPathNode` (étapes ou étapes de cours)
*   **Value Objects :**
    *   `ProgramId` (UUIDv4)
    *   `BlueprintId` (URN du modèle d'origine)
    *   `ProgramStatus` (Draft, Active, Completed, Paused)
*   **Invariants transactionnels :**
    1.  *Verrouillage de départ :* Un programme ne peut pas passer à l'état `Active` si les nœuds initiaux de dépendance ne sont pas alignés.
*   **Méthodes d'action (Behavior) :**
    *   `enroll(BlueprintId blueprint)`
    *   `activate()`
    *   `markNodeCompleted(NodeId nodeId)`

---

# 2. Machines à États (State Machines)

Le cycle de vie des principaux processus de LevelUP est régi par des transitions d'états strictes, déclenchées par des Commandes et produisant des Événements de Domaine.

## 2.1 Cycle de vie de l'Instance d'Activité (ActivityInstance)

```text
   [ Command: Create ]
            │
            ▼
       ┌─────────┐
       │ Created │
       └────┬────┘
            │ Command: Start
            ▼
       ┌─────────┐   Command: Pause    ┌────────┐
       │ Active  ├────────────────────►│ Paused │
       └────┬────┘◄────────────────────┴────┬───┘
            │        Command: Resume        │
            ├───────────────────────────────┤ Command: Cancel
            │                               ▼
            │ Command: Complete        ┌───────────┐
            ▼                          │ Cancelled │
       ┌───────────┐                   └───────────┘
       │ Completed │ ➔ émet ActivityCompleted
       └───────────┘
```

*   **États :**
    *   `Created` (Créée mais non démarrée).
    *   `Active` (En cours d'exécution).
    *   `Paused` (Suspendue temporairement).
    *   `Cancelled` (Abandonnée).
    *   `Completed` (Terminée avec succès).

---

## 2.2 Cycle de vie de la Session d'Évaluation (AssessmentSession)

```text
   [ Command: Initialize ]
            │
            ▼
        ┌──────┐
        │ Open │
        └──┬───┘
           │ Command: SubmitEvidence
           ▼
     ┌───────────┐
     │ Submitted │
     └─────┬─────┘
           │ Command: Evaluate
           ▼
     ┌───────────┐   Command: Confirm (Succès)   ┌────────┐
     │ Evaluated ├──────────────────────────────►│ Closed │ ➔ émet CompetencyValidated
     └─────┬─────┘                               └────────┘
           │
           ├────────────────────────────────────┐ Command: Confirm (Échec)
           │                                    ▼
           │                               ┌────────┐
           │                               │ Failed │ ➔ émet ValidationFailed
           │                               └────────┘
           ▼ Command: Time Expired (Délai dépassé)
     ┌───────────┐
     │  Expired  │ ➔ émet AssessmentExpired
     └───────────┘
```

*   **États :**
    *   `Open` (Créée, en attente de preuves).
    *   `Submitted` (Preuves fournies, en cours de relecture).
    *   `Evaluated` (Critères cochés, décision en attente de signature).
    *   `Closed` (Session validée avec succès, compétence acquise).
    *   `Failed` (Session close sur un échec).
    *   `Expired` (Temps limite d'examen dépassé sans dépôt).

---

## 2.3 Cycle de vie du Défi entre pairs (PeerChallenge)

```text
   [ Command: Offer ]
            │
            ▼
       ┌──────────┐
       │ Offered  │
       └────┬─────┘
            ├──────────────────────┬──────────────────────┐
            │ Command: Accept      │ Command: Decline     │ Timeout (Acceptation)
            ▼                      ▼                      ▼
       ┌──────────┐          ┌──────────┐           ┌─────────┐
       │  Active  │          │ Declined │           │ Expired │ ➔ émet ChallengeExpired
       └────┬─────┘          └──────────┘           └─────────┘
            │
            ├─────────────────────────────────────┐ Timeout (Exécution)
            ▼ Target reached within delay         ▼ Target missed
       ┌───────────┐                         ┌────────┐
       │ Succeeded │ ➔ émet ChallengeSucceeded│ Failed │ ➔ émet ChallengeFailed
       └───────────┘                         └────────┘
```

*   **États :**
    *   `Offered` (Défi proposé par un pair).
    *   `Declined` (Défi refusé par le destinataire).
    *   `Expired` (Délai d'acceptation dépassé).
    *   `Active` (Défi accepté, chronomètre actif).
    *   `Succeeded` (Objectif validé dans les temps).
    *   `Failed` (Temps écoulé sans réussite de la cible).
