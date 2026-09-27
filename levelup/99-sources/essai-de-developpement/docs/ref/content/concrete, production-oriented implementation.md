Below is a **concrete, production-oriented implementation** of the recommendation engine for your FastAPI backend. It follows the schema and rules you defined, keeps logic deterministic, and is structured for testability.

---

# 1) SQLAlchemy Models (minimal subset used by engine)

```python
# models/core.py
from sqlalchemy import Column, BigInteger, Float, Text, Integer, ForeignKey, DateTime, Boolean
from sqlalchemy.orm import relationship
from datetime import datetime
from app.core.database import Base

class Concept(Base):
    __tablename__ = "concepts"
    id = Column(BigInteger, primary_key=True)
    unit_id = Column(BigInteger)
    name = Column(Text)
    difficulty = Column(Integer)

class Resource(Base):
    __tablename__ = "resources"
    id = Column(BigInteger, primary_key=True)
    title = Column(Text)
    authority_score = Column(Float)
    is_primary = Column(Boolean)
    difficulty = Column(Integer)

class ResourceConcept(Base):
    __tablename__ = "resource_concepts"
    id = Column(BigInteger, primary_key=True)
    resource_id = Column(BigInteger, ForeignKey("resources.id"))
    concept_id = Column(BigInteger, ForeignKey("concepts.id"))

class Mistake(Base):
    __tablename__ = "mistakes"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    concept_id = Column(BigInteger)
    severity = Column(Integer)
    created_at = Column(DateTime, default=datetime.utcnow)

class Revision(Base):
    __tablename__ = "revisions"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    concept_id = Column(BigInteger)
    due_date = Column(DateTime)

class WeakPoint(Base):
    __tablename__ = "weak_points"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    concept_id = Column(BigInteger)
    severity = Column(Integer)
```

---

# 2) Repository Layer (pure queries)

```python
# repositories/recommendation_repo.py
from sqlalchemy.orm import Session
from datetime import datetime
from app.models.core import Mistake, Revision, WeakPoint, Resource, ResourceConcept

class RecommendationRepository:

    def get_recent_mistakes(self, db: Session, user_id: int, limit=20):
        return db.query(Mistake)\
            .filter(Mistake.user_id == user_id)\
            .order_by(Mistake.created_at.desc())\
            .limit(limit)\
            .all()

    def get_due_revisions(self, db: Session, user_id: int):
        return db.query(Revision)\
            .filter(
                Revision.user_id == user_id,
                Revision.due_date <= datetime.utcnow()
            ).all()

    def get_weak_points(self, db: Session, user_id: int):
        return db.query(WeakPoint)\
            .filter(WeakPoint.user_id == user_id)\
            .order_by(WeakPoint.severity.desc())\
            .all()

    def get_resources_for_concepts(self, db: Session, concept_ids: list[int]):
        return db.query(Resource)\
            .join(ResourceConcept, Resource.id == ResourceConcept.resource_id)\
            .filter(ResourceConcept.concept_id.in_(concept_ids))\
            .all()
```

---

# 3) Candidate Model (internal, not DB)

```python
# engines/candidates.py
from dataclasses import dataclass
from typing import Optional

@dataclass
class Candidate:
    action_type: str
    concept_id: Optional[int] = None
    resource_id: Optional[int] = None
    unit_id: Optional[int] = None
    session_type: Optional[str] = None

    priority_score: float = 0.0
    confidence_score: float = 0.0
    reason: str = ""
```

---

# 4) Scoring Engine

```python
# engines/scoring.py

def compute_priority(candidate, context):
    score = 0

    # urgency
    if candidate.action_type == "revision":
        score += 40

    # weakness
    if context["weak_map"].get(candidate.concept_id):
        score += context["weak_map"][candidate.concept_id] * 5

    # mistake severity
    if context["mistake_map"].get(candidate.concept_id):
        score += context["mistake_map"][candidate.concept_id] * 4

    # resource authority
    if candidate.resource_id:
        resource = context["resource_map"].get(candidate.resource_id)
        if resource:
            score += (resource.authority_score or 0) * 10
            if resource.is_primary:
                score += 5

    # redundancy penalty
    if candidate.resource_id in context["recent_resources"]:
        score -= 15

    return score


def compute_confidence(candidate):
    if candidate.action_type == "revision":
        return 0.95
    if candidate.action_type == "remediation":
        return 0.9
    return 0.75
```

---

# 5) Recommendation Engine (core)

```python
# engines/recommendation_engine.py
from app.engines.candidates import Candidate
from app.engines.scoring import compute_priority, compute_confidence

class RecommendationEngine:

    def __init__(self, repo):
        self.repo = repo

    def recommend(self, db, user_id: int):
        # --- 1. Load data ---
        mistakes = self.repo.get_recent_mistakes(db, user_id)
        revisions = self.repo.get_due_revisions(db, user_id)
        weak_points = self.repo.get_weak_points(db, user_id)

        # --- 2. Build context maps ---
        mistake_map = {}
        for m in mistakes:
            mistake_map[m.concept_id] = max(
                mistake_map.get(m.concept_id, 0),
                m.severity
            )

        weak_map = {w.concept_id: w.severity for w in weak_points}

        concept_ids = list(set(
            [m.concept_id for m in mistakes] +
            [w.concept_id for w in weak_points]
        ))

        resources = self.repo.get_resources_for_concepts(db, concept_ids)

        resource_map = {r.id: r for r in resources}

        context = {
            "mistake_map": mistake_map,
            "weak_map": weak_map,
            "resource_map": resource_map,
            "recent_resources": set()  # can be extended
        }

        candidates = []

        # --- 3. Revision candidates ---
        for rev in revisions:
            candidates.append(Candidate(
                action_type="revision",
                concept_id=rev.concept_id,
                session_type="review",
                reason="Revision due"
            ))

        # --- 4. Weak points ---
        for w in weak_points:
            candidates.append(Candidate(
                action_type="remediation",
                concept_id=w.concept_id,
                session_type="practice",
                reason="Weak concept detected"
            ))

        # --- 5. Mistake-based resources ---
        for concept_id in mistake_map.keys():
            for r in resources:
                candidates.append(Candidate(
                    action_type="resource",
                    concept_id=concept_id,
                    resource_id=r.id,
                    session_type="study",
                    reason="Error-driven recommendation"
                ))

        # --- 6. Fallback ---
        if not candidates:
            return {
                "action": "progression",
                "reason": "No weaknesses detected"
            }

        # --- 7. Score ---
        for c in candidates:
            c.priority_score = compute_priority(c, context)
            c.confidence_score = compute_confidence(c)

        # --- 8. Sort ---
        candidates.sort(
            key=lambda x: (x.priority_score, x.confidence_score),
            reverse=True
        )

        best = candidates[0]

        return {
            "recommended_action_type": best.action_type,
            "concept_id": best.concept_id,
            "resource_id": best.resource_id,
            "session_type": best.session_type,
            "priority_score": best.priority_score,
            "confidence_score": best.confidence_score,
            "reason": best.reason
        }
```

---

# 6) FastAPI Endpoint

```python
# api/v1/recommendations.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.api.deps import get_db, get_user
from app.repositories.recommendation_repo import RecommendationRepository
from app.engines.recommendation_engine import RecommendationEngine

router = APIRouter()

repo = RecommendationRepository()
engine = RecommendationEngine(repo)

@router.get("/next")
def recommend_next(db: Session = Depends(get_db), user=Depends(get_user)):
    return engine.recommend(db, user.id)
```

---

# 7) Execution Flow (real system behavior)

```text
User → /recommend/next
        ↓
Repository → DB queries
        ↓
Engine:
    - build context
    - generate candidates
    - score
    - select best
        ↓
Return structured decision
```

---

# 8) What this implementation guarantees

* deterministic decisions (no randomness)
* priority-based behavior
* resource-aware recommendations
* direct link: error → concept → resource
* extensible scoring (add fatigue, time, etc.)
* clean separation (DB / logic / engine)

---

# 9) Immediate improvements (next step)

To reach a stronger system:

1. Add **plan_id filtering everywhere**
2. Add **concept prerequisites blocking**
3. Add **revision scheduling update after session**
4. Add **audit_logs write inside engine**
5. Cache resource mappings (performance)

---
