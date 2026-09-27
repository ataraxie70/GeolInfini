Voici le **Session Execution Engine** : la couche qui transforme une décision abstraite en **exécution réelle mesurable**, puis met à jour le système.

---

# 1) Rôle du Session Execution Engine

Il fait le lien :

```text
OrchestratorDecision → Session → Travail réel → Résultat → Update système
```

Il gère :

* démarrage de séance
* suivi (temps, contenu)
* fin de séance
* scoring
* détection d’erreurs
* mise à jour :

  * mastery
  * mistakes
  * revisions
  * progression

---

# 2) Architecture

```text
services/
 └── session_execution_service.py

engines/
 └── session_engine.py
```

---

# 3) Modèle Session étendu

```python
# models/session.py
from sqlalchemy import Column, BigInteger, Text, Integer, DateTime
from datetime import datetime
from app.core.database import Base

class Session(Base):
    __tablename__ = "sessions"

    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    plan_id = Column(BigInteger)
    concept_id = Column(BigInteger)

    session_type = Column(Text)
    status = Column(Text)

    started_at = Column(DateTime)
    ended_at = Column(DateTime)

    duration_minutes = Column(Integer)
    score = Column(Integer)
    notes = Column(Text)
```

---

# 4) Engine (logique pure)

```python
# engines/session_engine.py

class SessionEngine:

    def start(self, decision, user_id, plan_id):
        return {
            "user_id": user_id,
            "plan_id": plan_id,
            "concept_id": decision.concept_id,
            "session_type": decision.session_type,
            "status": "ongoing"
        }

    def end(self, session, input_data):
        """
        input_data:
        - correct_answers
        - total_questions
        - mistakes (list)
        """

        score = self._compute_score(
            input_data["correct_answers"],
            input_data["total_questions"]
        )

        return {
            "status": "completed",
            "score": score,
            "duration_minutes": input_data.get("duration"),
            "mistakes": input_data.get("mistakes", [])
        }

    def _compute_score(self, correct, total):
        if total == 0:
            return 0
        return correct / total
```

---

# 5) Service (orchestration + DB + update système)

```python
# services/session_execution_service.py

from datetime import datetime
from app.models.session import Session
from app.models.core import Mistake
from app.models.progression import ConceptMastery
from app.models.progression import AuditLog


class SessionExecutionService:

    def __init__(self, session_engine, progression_engine):
        self.engine = session_engine
        self.progression = progression_engine

    # --- START SESSION ---
    def start_session(self, db, user_id, plan_id, decision):
        data = self.engine.start(decision, user_id, plan_id)

        session = Session(
            user_id=data["user_id"],
            plan_id=data["plan_id"],
            concept_id=data["concept_id"],
            session_type=data["session_type"],
            status="ongoing",
            started_at=datetime.utcnow()
        )

        db.add(session)
        db.commit()
        db.refresh(session)

        return session

    # --- END SESSION ---
    def end_session(self, db, session_id, input_data):
        session = db.query(Session).get(session_id)

        result = self.engine.end(session, input_data)

        session.status = result["status"]
        session.score = result["score"]
        session.duration_minutes = result["duration_minutes"]
        session.ended_at = datetime.utcnow()

        # --- UPDATE MASTERY ---
        self._update_mastery(
            db,
            session.user_id,
            session.concept_id,
            session.score
        )

        # --- RECORD MISTAKES ---
        self._record_mistakes(
            db,
            session.user_id,
            session.id,
            session.concept_id,
            result["mistakes"]
        )

        # --- SCHEDULE REVISION ---
        self._schedule_revision(
            db,
            session.user_id,
            session.concept_id,
            session.score
        )

        # --- PROGRESSION CHECK ---
        progression_result = self.progression.evaluate_concept(
            db,
            session.user_id,
            session.concept_id
        )

        # --- AUDIT ---
        self._audit(db, session, result, progression_result)

        db.commit()

        return {
            "session": session.id,
            "score": session.score,
            "progression": progression_result
        }
```

---

# 6) Mise à jour du mastery

```python
def _update_mastery(self, db, user_id, concept_id, score):
    row = db.query(ConceptMastery)\
        .filter_by(user_id=user_id, concept_id=concept_id)\
        .first()

    if not row:
        row = ConceptMastery(
            user_id=user_id,
            concept_id=concept_id,
            mastery_score=score,
            last_score=score
        )
        db.add(row)
    else:
        # moyenne pondérée
        row.mastery_score = (row.mastery_score * 0.7) + (score * 0.3)
        row.last_score = score

    db.flush()
```

---

# 7) Enregistrement des erreurs

```python
def _record_mistakes(self, db, user_id, session_id, concept_id, mistakes):
    for m in mistakes:
        db.add(Mistake(
            user_id=user_id,
            session_id=session_id,
            concept_id=concept_id,
            description=m,
            severity=1
        ))
```

---

# 8) Révision (spaced repetition simplifié)

```python
from datetime import timedelta

def _schedule_revision(self, db, user_id, concept_id, score):
    from app.models.core import Revision

    if score >= 0.8:
        interval = 3
    elif score >= 0.6:
        interval = 1
    else:
        interval = 0  # immédiat

    revision = Revision(
        user_id=user_id,
        concept_id=concept_id,
        due_date=datetime.utcnow() + timedelta(days=interval)
    )

    db.add(revision)
```

---

# 9) Audit

```python
def _audit(self, db, session, result, progression):
    db.add(AuditLog(
        user_id=session.user_id,
        entity_type="session",
        entity_id=session.id,
        action="completed",
        old_value="ongoing",
        new_value=str({
            "score": result["score"],
            "progression": progression
        })
    ))
```

---

# 10) API FastAPI

```python
# api/v1/sessions.py

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.api.deps import get_db, get_user

router = APIRouter()

@router.post("/start")
def start(plan_id: int, db: Session = Depends(get_db), user=Depends(get_user)):
    decision = orchestrator.decide_next(db, user.id, plan_id)
    return session_service.start_session(db, user.id, plan_id, decision)


@router.post("/end")
def end(session_id: int, payload: dict, db: Session = Depends(get_db), user=Depends(get_user)):
    return session_service.end_session(db, session_id, payload)
```

---

# 11) Cycle complet final

```text
1. /orchestrator/next
2. → décision

3. /sessions/start
4. → session ouverte

5. utilisateur travaille

6. /sessions/end
7. → score
8. → erreurs
9. → update mastery
10. → update revision
11. → progression check

12. retour orchestrator
```

---

# 12) Garanties système

* chaque séance produit un **résultat mesurable**
* progression basée sur données réelles (score + erreurs)
* révision automatique
* boucle fermée (feedback → décision)
* aucune progression fictive

---

# 13) Étape suivante (très importante)

👉 **moteur d’exercices (exercise generator + validator)**

Car actuellement :

* tu as le moteur
* mais pas encore le contenu actif d’entraînement

C’est lui qui transforme :

```text
concept → exercice → correction automatique → score fiable
```
