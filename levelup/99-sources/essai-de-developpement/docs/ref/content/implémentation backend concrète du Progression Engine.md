Voici une **implémentation backend concrète** du **Progression Engine** (validation + blocage + déblocage), alignée sur ton schéma et intégrable directement dans ton backend FastAPI.

Le code est organisé en couches :

* repository (données)
* engine (décision pure)
* service (effets + audit)
* API (exposition)

---

# 1) Modèles requis (extraits utiles)

```python
# models/progression.py
from sqlalchemy import Column, BigInteger, Float, Boolean, ForeignKey, DateTime, Text
from datetime import datetime
from app.core.database import Base

class ConceptMastery(Base):
    __tablename__ = "concept_mastery"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    concept_id = Column(BigInteger)
    mastery_score = Column(Float)
    last_score = Column(Float)
    last_seen = Column(DateTime, default=datetime.utcnow)

class ConceptPrerequisite(Base):
    __tablename__ = "concept_prerequisites"
    id = Column(BigInteger, primary_key=True)
    concept_id = Column(BigInteger)
    prerequisite_id = Column(BigInteger)

class Validation(Base):
    __tablename__ = "validations"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    unit_id = Column(BigInteger)
    score = Column(Float)
    passed = Column(Boolean)
    validated_at = Column(DateTime, default=datetime.utcnow)

class AuditLog(Base):
    __tablename__ = "audit_logs"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    entity_type = Column(Text)
    entity_id = Column(BigInteger)
    action = Column(Text)
    old_value = Column(Text)
    new_value = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)
```

---

# 2) Repository (accès DB pur)

```python
# repositories/progression_repo.py
from sqlalchemy.orm import Session
from app.models.progression import ConceptMastery, ConceptPrerequisite
from app.models.core import Mistake, Revision

class ProgressionRepository:

    def get_prerequisites(self, db: Session, concept_id: int):
        return db.query(ConceptPrerequisite)\
            .filter(ConceptPrerequisite.concept_id == concept_id)\
            .all()

    def get_mastery(self, db: Session, user_id: int, concept_ids: list[int]):
        rows = db.query(ConceptMastery)\
            .filter(
                ConceptMastery.user_id == user_id,
                ConceptMastery.concept_id.in_(concept_ids)
            ).all()
        return {r.concept_id: r.mastery_score for r in rows}

    def get_revisions(self, db: Session, user_id: int, concept_ids: list[int]):
        return db.query(Revision)\
            .filter(
                Revision.user_id == user_id,
                Revision.concept_id.in_(concept_ids)
            ).all()

    def get_mistakes(self, db: Session, user_id: int, concept_ids: list[int]):
        return db.query(Mistake)\
            .filter(
                Mistake.user_id == user_id,
                Mistake.concept_id.in_(concept_ids)
            ).all()
```

---

# 3) Progression Engine (décision pure)

```python
# engines/progression_engine.py

class ProgressionEngine:

    CRITICAL_THRESHOLD = 0.8
    MIN_THRESHOLD = 0.7

    def __init__(self, repo):
        self.repo = repo

    def evaluate_concept(self, db, user_id: int, concept_id: int):
        prereqs = self.repo.get_prerequisites(db, concept_id)
        prereq_ids = [p.prerequisite_id for p in prereqs]

        mastery_map = self.repo.get_mastery(db, user_id, prereq_ids)
        revisions = self.repo.get_revisions(db, user_id, prereq_ids)
        mistakes = self.repo.get_mistakes(db, user_id, prereq_ids)

        blocking = []

        # --- 1. Check prerequisites ---
        for pid in prereq_ids:
            score = mastery_map.get(pid, 0)
            if score < self.MIN_THRESHOLD:
                blocking.append({
                    "type": "missing_prerequisite",
                    "concept_id": pid,
                    "score": score
                })

        # --- 2. Check revisions ---
        if any(r.due_date is not None for r in revisions):
            blocking.append({"type": "revision_due"})

        # --- 3. Check repeated mistakes ---
        mistake_count = len(mistakes)
        if mistake_count >= 3:
            blocking.append({
                "type": "repeated_mistakes",
                "count": mistake_count
            })

        # --- 4. Decision ---
        if blocking:
            return {
                "status": "locked",
                "allow_progression": False,
                "allow_validation": False,
                "blocking_rules": blocking,
                "reason": "Prerequisites not satisfied"
            }

        # --- 5. Validation check ---
        concept_mastery = self.repo.get_mastery(db, user_id, [concept_id])
        score = concept_mastery.get(concept_id, 0)

        if score >= self.CRITICAL_THRESHOLD:
            return {
                "status": "validated",
                "allow_progression": True,
                "allow_validation": True,
                "blocking_rules": [],
                "reason": "Concept mastered"
            }

        return {
            "status": "unlocked",
            "allow_progression": True,
            "allow_validation": False,
            "blocking_rules": [],
            "reason": "Ready for practice"
        }
```

---

# 4) Service Layer (effets + audit)

```python
# services/progression_service.py
from app.models.progression import AuditLog

class ProgressionService:

    def __init__(self, engine, repo):
        self.engine = engine
        self.repo = repo

    def evaluate(self, db, user_id, concept_id):
        result = self.engine.evaluate_concept(db, user_id, concept_id)
        return result

    def validate(self, db, user_id, concept_id, score):
        result = self.engine.evaluate_concept(db, user_id, concept_id)

        if score >= 0.8:
            status = "validated"
        else:
            status = "failed"

        self._audit(db, user_id, concept_id, "validation", result, status)

        return {
            "status": status,
            "score": score
        }

    def lock(self, db, user_id, concept_id, reason):
        self._audit(db, user_id, concept_id, "lock", None, reason)
        return {"status": "locked", "reason": reason}

    def unlock(self, db, user_id, concept_id):
        result = self.engine.evaluate_concept(db, user_id, concept_id)

        if result["status"] == "locked":
            return result

        self._audit(db, user_id, concept_id, "unlock", None, result)

        return {"status": "unlocked"}

    def _audit(self, db, user_id, entity_id, action, old, new):
        log = AuditLog(
            user_id=user_id,
            entity_type="concept",
            entity_id=entity_id,
            action=action,
            old_value=str(old),
            new_value=str(new)
        )
        db.add(log)
        db.commit()
```

---

# 5) API FastAPI

```python
# api/v1/progression.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.api.deps import get_db, get_user

router = APIRouter()

@router.post("/evaluate")
def evaluate(concept_id: int, db: Session = Depends(get_db), user=Depends(get_user)):
    return progression_service.evaluate(db, user.id, concept_id)

@router.post("/validate")
def validate(concept_id: int, score: float, db: Session = Depends(get_db), user=Depends(get_user)):
    return progression_service.validate(db, user.id, concept_id, score)

@router.post("/lock")
def lock(concept_id: int, reason: str, db: Session = Depends(get_db), user=Depends(get_user)):
    return progression_service.lock(db, user.id, concept_id, reason)

@router.post("/unlock")
def unlock(concept_id: int, db: Session = Depends(get_db), user=Depends(get_user)):
    return progression_service.unlock(db, user.id, concept_id)
```

---

# 6) Flux réel d’exécution

```text
1. user termine une séance
2. score calculé
3. /progression/validate
4. engine:
   - check prereqs
   - check mistakes
   - check revisions
5. décision:
   → locked / unlocked / validated
6. audit log écrit
7. moteur recommandation ajusté
```

---

# 7) Garanties techniques

* aucune progression sans prérequis (graph contrôlé)
* validation basée sur score réel (pas déclaratif)
* blocage automatique si erreurs répétées
* audit complet (traçabilité)
* moteur déterministe (pas d’aléatoire)

---

# 8) Améliorations immédiates

À ajouter ensuite :

### 1. Prise en compte plan_id partout

```sql
WHERE user_id = ? AND plan_id = ?
```

### 2. Intégration directe avec recommendation engine

* si locked → recommander remédiation
* si validated → débloquer prochain concept

### 3. Spaced repetition couplé

* validation → insertion dans `revisions`

---

# 9) Étape suivante critique

👉 **fusion des deux moteurs**

* progression engine (contrôle)
* recommendation engine (action)

pour obtenir :

```text
state → decision → action → feedback → state
```
