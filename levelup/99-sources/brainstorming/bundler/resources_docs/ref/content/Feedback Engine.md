Voici le **Feedback Engine** : la couche qui transforme une tentative brute en **diagnostic précis**, **liaison conceptuelle**, et **actions correctives** injectées dans le système.

---

# 1) Rôle du Feedback Engine

Il formalise :

```text
attempt → analyse → classification → mapping concept → action corrective
```

Contrairement au validator (qui donne un score), ici on produit :

* **type d’erreur (taxonomy)**
* **concept impacté**
* **gravité**
* **cause probable**
* **action recommandée (ressource / exercice / révision)**

---

# 2) Taxonomie des erreurs (alignée ANSSI / C bas niveau)

```text
SYNTAX_ERROR
TYPE_ERROR
POINTER_ERROR
MEMORY_ERROR
UNDEFINED_BEHAVIOR
LOGIC_ERROR
SYSTEM_CALL_ERROR
CONCURRENCY_ERROR
SECURITY_ISSUE
PERFORMANCE_ISSUE
```

Ces catégories correspondent à :

* ISO C (undefined behavior, types)
* POSIX (syscalls)
* pratiques ANSSI (sécurité mémoire)

---

# 3) Modèles

```python
# models/feedback.py

from sqlalchemy import Column, BigInteger, Text, Integer, Float, DateTime
from datetime import datetime
from app.core.database import Base

class Feedback(Base):
    __tablename__ = "feedback"

    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger)
    attempt_id = Column(BigInteger)

    error_type = Column(Text)
    concept_id = Column(BigInteger)

    severity = Column(Integer)  # 1 à 5
    confidence = Column(Float)

    root_cause = Column(Text)
    recommendation = Column(Text)

    created_at = Column(DateTime, default=datetime.utcnow)
```

---

# 4) Mapping erreur → concept

```python
# engines/error_mapping.py

ERROR_TO_CONCEPT = {
    "POINTER_ERROR": ["pointers", "memory_model"],
    "MEMORY_ERROR": ["malloc", "free", "heap"],
    "UNDEFINED_BEHAVIOR": ["c_standard", "undefined_behavior"],
    "SYSTEM_CALL_ERROR": ["syscalls", "errno"],
    "CONCURRENCY_ERROR": ["threads", "race_conditions"],
}
```

---

# 5) Engine (analyse)

```python
# engines/feedback_engine.py

class FeedbackEngine:

    def __init__(self, repo):
        self.repo = repo

    def analyze(self, db, user_id: int, attempt, payload: dict):
        """
        payload contient:
        - code (optionnel)
        - output
        - expected_output
        - mistakes (liste brute)
        """

        detected = []

        # 1. Analyse brute (mistakes fournies)
        for m in payload.get("mistakes", []):
            detected.append(self._classify(m))

        # 2. Analyse output vs expected
        if payload.get("output") != payload.get("expected_output"):
            detected.append({
                "type": "LOGIC_ERROR",
                "confidence": 0.7
            })

        # 3. Consolidation
        feedbacks = []
        for d in detected:
            concept_ids = self._map_to_concepts(d["type"])

            for cid in concept_ids:
                feedbacks.append({
                    "error_type": d["type"],
                    "concept_id": cid,
                    "severity": self._severity(d["type"]),
                    "confidence": d["confidence"],
                    "root_cause": self._root_cause(d["type"]),
                    "recommendation": self._recommendation(d["type"])
                })

        return feedbacks
```

---

# 6) Classification

```python
def _classify(self, mistake: str):
    m = mistake.lower()

    if "segfault" in m:
        return {"type": "MEMORY_ERROR", "confidence": 0.95}
    if "null" in m:
        return {"type": "POINTER_ERROR", "confidence": 0.9}
    if "type" in m:
        return {"type": "TYPE_ERROR", "confidence": 0.8}
    if "race" in m:
        return {"type": "CONCURRENCY_ERROR", "confidence": 0.85}

    return {"type": "LOGIC_ERROR", "confidence": 0.6}
```

---

# 7) Mapping concept

```python
def _map_to_concepts(self, error_type):
    return ERROR_TO_CONCEPT.get(error_type, ["general_programming"])
```

---

# 8) Sévérité

```python
def _severity(self, error_type):
    return {
        "MEMORY_ERROR": 5,
        "POINTER_ERROR": 5,
        "UNDEFINED_BEHAVIOR": 5,
        "CONCURRENCY_ERROR": 4,
        "SYSTEM_CALL_ERROR": 4,
        "LOGIC_ERROR": 3,
        "TYPE_ERROR": 2,
    }.get(error_type, 2)
```

---

# 9) Cause racine

```python
def _root_cause(self, error_type):
    return {
        "MEMORY_ERROR": "Invalid memory access or incorrect allocation",
        "POINTER_ERROR": "Incorrect pointer usage or NULL dereference",
        "UNDEFINED_BEHAVIOR": "Violation of C standard rules",
        "LOGIC_ERROR": "Incorrect algorithm or condition",
    }.get(error_type, "Unknown cause")
```

---

# 10) Recommandation

```python
def _recommendation(self, error_type):
    return {
        "MEMORY_ERROR": "Review malloc/free and memory layout",
        "POINTER_ERROR": "Revisit pointer fundamentals",
        "UNDEFINED_BEHAVIOR": "Study C standard behavior rules",
        "LOGIC_ERROR": "Trace execution step-by-step",
    }.get(error_type, "Review related concept")
```

---

# 11) Service (intégration complète)

```python
# services/feedback_service.py

from app.models.feedback import Feedback

class FeedbackService:

    def __init__(self, engine, repo, recommendation_engine):
        self.engine = engine
        self.repo = repo
        self.recommendation = recommendation_engine

    def process_attempt(self, db, user_id, attempt, payload):
        feedbacks = self.engine.analyze(db, user_id, attempt, payload)

        results = []

        for f in feedbacks:
            row = Feedback(
                user_id=user_id,
                attempt_id=attempt.id,
                error_type=f["error_type"],
                concept_id=f["concept_id"],
                severity=f["severity"],
                confidence=f["confidence"],
                root_cause=f["root_cause"],
                recommendation=f["recommendation"]
            )
            db.add(row)
            results.append(row)

        db.commit()

        # Injecter dans moteur de recommandation
        next_action = self.recommendation.recommend(db, user_id)

        return {
            "feedback": [r.error_type for r in results],
            "next_action": next_action
        }
```

---

# 12) API

```python
# api/v1/feedback.py

@router.post("/analyze")
def analyze(attempt_id: int, payload: dict, db: Session = Depends(get_db), user=Depends(get_user)):
    attempt = db.query(ExerciseAttempt).get(attempt_id)
    return feedback_service.process_attempt(db, user.id, attempt, payload)
```

---

# 13) Flux complet intégré

```text
Exercise → Attempt
        ↓
Validator → score
        ↓
FeedbackEngine → erreurs typées
        ↓
Mapping → concepts
        ↓
Stockage Feedback
        ↓
RecommendationEngine
        ↓
Orchestrator
        ↓
Nouvelle action
```

---

# 14) Propriété fondamentale du système

Ce moteur introduit une propriété clé :

```text
Erreur → Concept → Correction → Apprentissage réel
```

Ce n’est plus :

* “j’ai raté”
  mais :
* “j’ai raté à cause de X dans Y, donc je dois faire Z”

---

# 15) Extension critique (niveau expert)

À ajouter ensuite :

### 1. Analyse statique C (clang / gcc)

* détecter UB réel
* warnings → feedback

### 2. Exécution sandbox

* capturer segfault
* capturer errno

### 3. Pattern matching avancé

* AST parsing
* détection fine d’erreurs de logique

---

# 16) Étape suivante

👉 **Knowledge Graph Engine**

Parce que maintenant tu as :

* concepts
* erreurs
* ressources
* progression

Il manque :

```text
relations profondes entre concepts
```

(ex: pointeurs → malloc → heap → syscalls → virtual memory)

C’est ça qui va rendre la plateforme réellement intelligente.
