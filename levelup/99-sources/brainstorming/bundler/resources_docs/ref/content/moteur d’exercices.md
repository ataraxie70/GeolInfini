Voici le **moteur d’exercices** : génération, sélection, validation et correction de séance.

---

# 1) Rôle du moteur

Il transforme :

```text
concept → exercice → tentative → score → correction → mise à jour
```

Il doit :

* choisir le bon exercice selon le niveau réel ;
* éviter les répétitions inutiles ;
* générer une difficulté adaptée ;
* valider automatiquement ce qui peut l’être ;
* enregistrer les échecs pour alimenter la progression et la recommandation.

---

# 2) Modèles minimaux

```python
# models/exercise.py
from sqlalchemy import Column, BigInteger, Text, Integer, Float, Boolean, ForeignKey, DateTime
from datetime import datetime
from app.core.database import Base

class Exercise(Base):
    __tablename__ = "exercises"
    id = Column(BigInteger, primary_key=True)
    concept_id = Column(BigInteger, ForeignKey("concepts.id"), nullable=False)
    type = Column(Text, nullable=False)  # guided, autonomous, challenge
    title = Column(Text, nullable=False)
    description = Column(Text)
    expected_output = Column(Text)
    difficulty = Column(Integer, default=1)
    solution_reference = Column(Text)
    active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class ExerciseAttempt(Base):
    __tablename__ = "exercise_attempts"
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger, nullable=False)
    exercise_id = Column(BigInteger, ForeignKey("exercises.id"), nullable=False)
    session_id = Column(BigInteger, nullable=True)
    score = Column(Float, default=0.0)
    passed = Column(Boolean, default=False)
    feedback = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)
```

---

# 3) Repository

```python
# repositories/exercise_repo.py
from sqlalchemy.orm import Session
from app.models.exercise import Exercise, ExerciseAttempt
from app.models.core import Mistake, ConceptMastery

class ExerciseRepository:
    def get_by_concept(self, db: Session, concept_id: int):
        return db.query(Exercise).filter(
            Exercise.concept_id == concept_id,
            Exercise.active == True
        ).all()

    def get_by_type(self, db: Session, concept_id: int, ex_type: str):
        return db.query(Exercise).filter(
            Exercise.concept_id == concept_id,
            Exercise.type == ex_type,
            Exercise.active == True
        ).all()

    def get_recent_attempts(self, db: Session, user_id: int, concept_id: int, limit: int = 5):
        return db.query(ExerciseAttempt).join(Exercise).filter(
            ExerciseAttempt.user_id == user_id,
            Exercise.concept_id == concept_id
        ).order_by(ExerciseAttempt.created_at.desc()).limit(limit).all()

    def get_mastery(self, db: Session, user_id: int, concept_id: int):
        return db.query(ConceptMastery).filter(
            ConceptMastery.user_id == user_id,
            ConceptMastery.concept_id == concept_id
        ).first()

    def get_recent_mistakes(self, db: Session, user_id: int, concept_id: int, limit: int = 10):
        return db.query(Mistake).filter(
            Mistake.user_id == user_id,
            Mistake.concept_id == concept_id
        ).order_by(Mistake.created_at.desc()).limit(limit).all()

    def create_attempt(self, db: Session, attempt: ExerciseAttempt):
        db.add(attempt)
        db.commit()
        db.refresh(attempt)
        return attempt
```

---

# 4) Forme de sortie du moteur

```python
# engines/exercise_contracts.py
from dataclasses import dataclass
from typing import Optional, List

@dataclass
class ExerciseRecommendation:
    exercise_id: int
    concept_id: int
    exercise_type: str
    difficulty: int
    reason: str
    expected_mode: str   # guided, autonomous, challenge
    estimated_minutes: int
```

---

# 5) Moteur de génération / sélection

```python
# engines/exercise_engine.py
from typing import Optional
from app.engines.exercise_contracts import ExerciseRecommendation

class ExerciseEngine:
    """
    Moteur déterministe :
    - choisit le type d'exercice selon la maîtrise, les erreurs et le contexte
    - évite la répétition excessive
    - renvoie un exercice concret
    """

    def __init__(self, repo):
        self.repo = repo

    def recommend_exercise(self, db, user_id: int, concept_id: int):
        mastery = self.repo.get_mastery(db, user_id, concept_id)
        mastery_score = mastery.mastery_score if mastery else 0.0

        recent_mistakes = self.repo.get_recent_mistakes(db, user_id, concept_id)
        recent_attempts = self.repo.get_recent_attempts(db, user_id, concept_id)

        mistake_count = len(recent_mistakes)
        repeat_count = len(recent_attempts)

        # 1) Choix du mode selon le niveau réel
        if mastery_score < 0.55 or mistake_count >= 3:
            mode = "guided"
            target_difficulty = 1 if mastery_score < 0.35 else 2
            reason = "Low mastery or repeated mistakes"
        elif mastery_score < 0.80:
            mode = "autonomous"
            target_difficulty = 2 if mistake_count == 0 else 3
            reason = "Intermediate mastery, need consolidation"
        else:
            mode = "challenge"
            target_difficulty = 4
            reason = "Strong mastery, push deeper"

        # 2) Récupérer les exercices du type choisi
        exercises = self.repo.get_by_type(db, concept_id, mode)

        # 3) Si aucun exercice du type exact, fallback
        if not exercises:
            exercises = self.repo.get_by_concept(db, concept_id)

        if not exercises:
            return {
                "status": "no_exercise_found",
                "reason": "No exercise available for this concept"
            }

        # 4) Scoring simple et déterministe
        chosen = self._pick_best(exercises, target_difficulty, repeat_count)

        return ExerciseRecommendation(
            exercise_id=chosen.id,
            concept_id=concept_id,
            exercise_type=chosen.type,
            difficulty=chosen.difficulty,
            reason=reason,
            expected_mode=mode,
            estimated_minutes=self._estimate_minutes(chosen, mastery_score)
        )

    def _pick_best(self, exercises, target_difficulty: int, repeat_count: int):
        """
        Score = proximité difficulté cible + pénalité répétition.
        """
        best = None
        best_score = None

        for ex in exercises:
            difficulty_gap = abs((ex.difficulty or 1) - target_difficulty)
            repeat_penalty = 2 if repeat_count >= 3 else 0

            score = (10 - difficulty_gap) - repeat_penalty

            if best is None or score > best_score:
                best = ex
                best_score = score

        return best

    def _estimate_minutes(self, exercise, mastery_score: float):
        base = 20 + (exercise.difficulty or 1) * 10
        if mastery_score < 0.5:
            base += 15
        return base
```

---

# 6) Validateur d’exercice

Le validateur prend la tentative et décide si l’exercice est :

* réussi,
* partiellement réussi,
* raté.

```python
# engines/exercise_validator.py

class ExerciseValidator:

    def validate(self, exercise, payload: dict):
        """
        payload attendu:
        - score: float 0..1
        - output: str | None
        - expected_output: str | None
        - mistakes: list[str]
        """
        score = float(payload.get("score", 0.0))
        output = payload.get("output")
        expected = payload.get("expected_output")
        mistakes = payload.get("mistakes", [])

        # Validation déterministe
        passed = score >= 0.80

        feedback = self._build_feedback(score, output, expected, mistakes)

        return {
            "passed": passed,
            "score": score,
            "feedback": feedback,
            "mistakes": mistakes
        }

    def _build_feedback(self, score, output, expected, mistakes):
        if score >= 0.90:
            return "Strong success. Concept is stable."
        if score >= 0.80:
            return "Accepted. Minor consolidation needed."
        if score >= 0.60:
            return "Partial success. Review weak points."
        return "Failed. Rebuild the concept from the primary source."
```

---

# 7) Service d’exécution

Ce service relie :

* le moteur d’exercices
* le validateur
* la persistance
* la progression

```python
# services/exercise_service.py
from datetime import datetime
from app.models.exercise import ExerciseAttempt
from app.models.core import Mistake

class ExerciseService:

    def __init__(self, exercise_engine, validator, repo, progression_service):
        self.engine = exercise_engine
        self.validator = validator
        self.repo = repo
        self.progression = progression_service

    def recommend(self, db, user_id: int, concept_id: int):
        return self.engine.recommend_exercise(db, user_id, concept_id)

    def submit_attempt(self, db, user_id: int, exercise_id: int, session_id: int, payload: dict):
        exercise = db.query(self.repo.ExerciseModel).get(exercise_id)
        result = self.validator.validate(exercise, payload)

        attempt = ExerciseAttempt(
            user_id=user_id,
            exercise_id=exercise_id,
            session_id=session_id,
            score=result["score"],
            passed=result["passed"],
            feedback=result["feedback"]
        )
        self.repo.create_attempt(db, attempt)

        # Enregistrer les erreurs
        for m in result["mistakes"]:
            db.add(Mistake(
                user_id=user_id,
                session_id=session_id,
                concept_id=exercise.concept_id,
                description=m,
                severity=1
            ))

        db.commit()

        # Mise à jour progression
        progression = self.progression.evaluate_concept(db, user_id, exercise.concept_id)

        return {
            "attempt_id": attempt.id,
            "passed": result["passed"],
            "score": result["score"],
            "feedback": result["feedback"],
            "progression": progression
        }
```

---

# 8) API FastAPI

```python
# api/v1/exercises.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.api.deps import get_db, get_user

router = APIRouter()

@router.get("/recommend")
def recommend_exercise(concept_id: int, db: Session = Depends(get_db), user=Depends(get_user)):
    return exercise_service.recommend(db, user.id, concept_id)

@router.post("/submit")
def submit_exercise(exercise_id: int, session_id: int, payload: dict, db: Session = Depends(get_db), user=Depends(get_user)):
    return exercise_service.submit_attempt(db, user.id, exercise_id, session_id, payload)
```

---

# 9) Cycle complet du moteur d’exercices

```text
1. orchestrator décide qu’un concept doit être travaillé
2. exercise engine choisit le type d’exercice
3. UI affiche l’exercice
4. user soumet une tentative
5. validator calcule score + feedback
6. session service enregistre tentative + erreurs
7. progression engine met à jour l’état
8. recommendation engine ajuste la suite
```

---

# 10) Règles de sélection

## Si maîtrise faible

* exercice guidé
* difficulté basse
* feedback précis

## Si maîtrise moyenne

* exercice autonome
* difficulté intermédiaire
* consolidation

## Si maîtrise forte

* challenge
* mini-projet
* transfert de compétence

---

# 11) Ce qu’il faut ajouter ensuite

Pour rendre le moteur plus solide, il faut encore :

1. **`exercise_steps`**
   pour décomposer un exercice en sous-étapes.

2. **`exercise_tests`**
   pour valider automatiquement certains exercices.

3. **`exercise_hints`**
   pour fournir des aides progressives.

4. **`exercise_categories`**
   pour séparer :

   * lecture
   * code
   * debug
   * diagnostic
   * projet

---

# 12) Extension recommandée des tables

```sql
CREATE TABLE exercise_steps (
    id BIGSERIAL PRIMARY KEY,
    exercise_id BIGINT REFERENCES exercises(id) ON DELETE CASCADE,
    step_index INT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    expected_result TEXT
);

CREATE TABLE exercise_tests (
    id BIGSERIAL PRIMARY KEY,
    exercise_id BIGINT REFERENCES exercises(id) ON DELETE CASCADE,
    test_name TEXT NOT NULL,
    input TEXT,
    expected_output TEXT
);

CREATE TABLE exercise_hints (
    id BIGSERIAL PRIMARY KEY,
    exercise_id BIGINT REFERENCES exercises(id) ON DELETE CASCADE,
    hint_index INT NOT NULL,
    content TEXT NOT NULL
);
```

---

# 13) Étape logique suivante

Le moteur d’exercices est en place.
La suite utile est de construire le **feedback engine** :

* analyser la tentative,
* détecter le type d’erreur,
* relier l’erreur au concept,
* proposer la bonne ressource,
* renvoyer la correction adaptée.
