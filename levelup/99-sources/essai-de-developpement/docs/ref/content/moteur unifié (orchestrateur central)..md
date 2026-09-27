Voici le **moteur unifié (orchestrateur central)**.
Il relie explicitement :

```text
Progression (vérité d’état) → Décision → Recommandation → Action → Feedback → Mise à jour
```

Ce n’est **pas un simple service** : c’est le **cerveau du système**.

---

# 1) Rôle de l’orchestrateur

Il coordonne :

* `ProgressionEngine` → contrôle (lock/unlock/validate)
* `RecommendationEngine` → quoi faire
* `SessionService` → exécution
* `Audit` → traçabilité

---

# 2) Structure

```text
engines/
 ├── progression_engine.py
 ├── recommendation_engine.py
 └── orchestrator.py   ← ICI
```

---

# 3) Modèle de sortie unifié

```python
# engines/contracts.py

from dataclasses import dataclass
from typing import Optional

@dataclass
class OrchestratorDecision:
    action_type: str
    concept_id: Optional[int]
    unit_id: Optional[int]
    resource_id: Optional[int]
    session_type: str

    status: str
    reason: str

    priority_score: float
    confidence_score: float

    next_step: str
```

---

# 4) Orchestrateur central

```python
# engines/orchestrator.py

from app.engines.contracts import OrchestratorDecision


class Orchestrator:

    def __init__(self, progression_engine, recommendation_engine, repo):
        self.progression = progression_engine
        self.recommendation = recommendation_engine
        self.repo = repo

    def decide_next(self, db, user_id: int, plan_id: int):
        """
        Point d'entrée principal du système.
        """

        # --- 1. récupérer état global ---
        current_concept = self._get_current_concept(db, user_id, plan_id)

        # --- 2. vérifier progression (vérité) ---
        prog = self.progression.evaluate_concept(
            db, user_id, current_concept
        )

        # --- 3. CAS 1 : BLOQUÉ ---
        if prog["status"] == "locked":
            return self._handle_blocked(db, user_id, prog)

        # --- 4. CAS 2 : VALIDÉ ---
        if prog["status"] == "validated":
            return self._handle_validated(db, user_id, plan_id, current_concept)

        # --- 5. CAS 3 : EN PROGRESSION ---
        return self._handle_progression(db, user_id, plan_id, current_concept)
```

---

# 5) Gestion des cas

## 5.1 Bloqué

```python
def _handle_blocked(self, db, user_id, prog):
    """
    Priorité absolue : corriger blocage
    """

    recommendation = self.recommendation.recommend(db, user_id)

    return OrchestratorDecision(
        action_type="remediation",
        concept_id=recommendation.get("concept_id"),
        resource_id=recommendation.get("resource_id"),
        unit_id=None,
        session_type="practice",

        status="blocked",
        reason=prog["reason"],

        priority_score=100,
        confidence_score=0.95,

        next_step="Fix prerequisite or mistake"
    )
```

---

## 5.2 Validé → unlock suivant

```python
def _handle_validated(self, db, user_id, plan_id, concept_id):
    """
    Débloque la suite logique
    """

    next_concept = self._get_next_concept(db, plan_id, concept_id)

    if not next_concept:
        return OrchestratorDecision(
            action_type="complete_plan",
            concept_id=None,
            unit_id=None,
            resource_id=None,
            session_type="none",

            status="completed",
            reason="Plan completed",

            priority_score=100,
            confidence_score=1.0,

            next_step="Start new plan"
        )

    # vérifier si le prochain est unlockable
    prog = self.progression.evaluate_concept(
        db, user_id, next_concept
    )

    if prog["status"] == "locked":
        return self._handle_blocked(db, user_id, prog)

    return OrchestratorDecision(
        action_type="progression",
        concept_id=next_concept,
        unit_id=None,
        resource_id=None,
        session_type="study",

        status="unlocked",
        reason="Next concept available",

        priority_score=90,
        confidence_score=0.9,

        next_step="Start next concept"
    )
```

---

## 5.3 Progression normale

```python
def _handle_progression(self, db, user_id, plan_id, concept_id):
    """
    Choix dynamique : study / practice / review
    """

    recommendation = self.recommendation.recommend(db, user_id)

    return OrchestratorDecision(
        action_type=recommendation["recommended_action_type"],
        concept_id=recommendation.get("concept_id"),
        resource_id=recommendation.get("resource_id"),
        unit_id=None,
        session_type=recommendation.get("session_type", "study"),

        status="in_progress",
        reason=recommendation["reason"],

        priority_score=recommendation["priority_score"],
        confidence_score=recommendation["confidence_score"],

        next_step="Execute recommended action"
    )
```

---

# 6) Fonctions internes

```python
def _get_current_concept(self, db, user_id, plan_id):
    """
    Simplification : dernier concept travaillé
    """
    session = self.repo.get_last_session(db, user_id, plan_id)
    return session.concept_id if session else self.repo.get_first_concept(plan_id)


def _get_next_concept(self, db, plan_id, current_concept):
    return self.repo.get_next_concept(plan_id, current_concept)
```

---

# 7) Endpoint FastAPI

```python
# api/v1/orchestrator.py

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.api.deps import get_db, get_user

router = APIRouter()

@router.get("/next")
def next_action(plan_id: int, db: Session = Depends(get_db), user=Depends(get_user)):
    return orchestrator.decide_next(db, user.id, plan_id)
```

---

# 8) Cycle complet réel

```text
User → /orchestrator/next
        ↓
ProgressionEngine
    → locked ? → remediation
    → validated ? → unlock next
    → else → continue
        ↓
RecommendationEngine
        ↓
OrchestratorDecision
        ↓
Frontend (action)
        ↓
Session
        ↓
Feedback (mistakes, score)
        ↓
Update mastery + revisions
        ↓
NEXT LOOP
```

---

# 9) Invariants système (critique)

### 1. Source de vérité

```text
ProgressionEngine décide l’état
```

### 2. Action

```text
RecommendationEngine propose l’action
```

### 3. Orchestrateur

```text
fait le lien et tranche
```

---

# 10) Ce que tu as construit

Un système qui :

* empêche l’apprentissage superficiel
* impose les prérequis (comme un compilateur impose la syntaxe)
* adapte dynamiquement les actions
* garde une trace complète
* reste déterministe

---

# 11) Prochaine étape critique

👉 **Session Execution Engine**

C’est lui qui transforme :

```text
decision → séance réelle → résultat mesurable
```

Avec :

* timer
* scoring automatique
* capture d’erreurs
* update mastery
