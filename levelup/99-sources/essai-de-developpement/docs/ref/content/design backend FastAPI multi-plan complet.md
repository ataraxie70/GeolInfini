Voici un **design backend FastAPI multi-plan complet**, structuré comme un système d’exécution (et non un simple CRUD), avec :

* architecture claire
* séparation stricte des responsabilités
* moteur de décision (séances + recommandations)
* logique déterministe (pas heuristique floue)

---

# 1) Architecture globale

## 1.1 Structure des dossiers

```text
app/
├── main.py
├── core/
│   ├── config.py
│   ├── security.py
│   └── database.py
│
├── models/            # ORM (SQLAlchemy)
├── schemas/           # Pydantic (validation)
├── repositories/      # accès DB pur (no logic)
├── services/          # logique métier
├── engines/           # moteur décisionnel (clé)
├── api/               # routes FastAPI
│   ├── deps.py
│   ├── v1/
│       ├── plans.py
│       ├── units.py
│       ├── sessions.py
│       ├── concepts.py
│       ├── recommendations.py
│       ├── revisions.py
│       └── dashboard.py
```

---

# 2) Principe clé

### ❌ erreur classique

Mettre toute la logique dans les routes

### ✅ ici

* `repositories` → SQL pur
* `services` → logique métier simple
* `engines` → logique intelligente (décision)

---

# 3) Core système

## 3.1 Database

```python
# core/database.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine("postgresql://...")
SessionLocal = sessionmaker(bind=engine)
```

---

# 4) Repositories (accès DB)

Exemple :

```python
# repositories/session_repo.py
class SessionRepository:

    def get_user_sessions(self, db, user_id):
        return db.query(Session).filter(Session.user_id == user_id).all()

    def create(self, db, session):
        db.add(session)
        db.commit()
        db.refresh(session)
        return session
```

👉 aucune logique ici

---

# 5) Services (logique métier simple)

```python
# services/session_service.py

class SessionService:

    def __init__(self, repo):
        self.repo = repo

    def create_session(self, db, user_id, data):
        session = Session(
            user_id=user_id,
            plan_id=data.plan_id,
            unit_id=data.unit_id,
            session_type=data.session_type,
            status="planned"
        )
        return self.repo.create(db, session)
```

---

# 6) MOTEUR (partie critique)

C’est ici que tout se joue.

---

# 6.1 Engine principal

```python
# engines/learning_engine.py

class LearningEngine:

    def __init__(self, repos):
        self.repos = repos

    def compute_next_session(self, db, user_id, plan_id):
        # 1. récupérer état
        weak = self.repos.weak_points.get(user_id)
        revisions = self.repos.revisions.get_due(user_id)
        current_units = self.repos.units.get_active(plan_id)

        # 2. priorité absolue : révision
        if revisions:
            return self._build_revision_session(revisions[0])

        # 3. priorité 2 : faiblesse
        if weak:
            return self._build_recovery_session(weak[0])

        # 4. sinon progression normale
        return self._build_progression_session(current_units)
```

---

## 6.2 Génération de séance

```python
def _build_revision_session(self, revision):
    return {
        "type": "review",
        "concept_id": revision.concept_id,
        "priority": 1
    }

def _build_recovery_session(self, weak_point):
    return {
        "type": "practice",
        "concept_id": weak_point.concept_id,
        "priority": 2
    }

def _build_progression_session(self, units):
    return {
        "type": "study",
        "unit_id": units[0].id,
        "priority": 3
    }
```

---

# 7) Moteur de recommandation

## 7.1 Principe

```text
erreur → concept → ressources → tri
```

---

## 7.2 Implémentation

```python
# engines/recommendation_engine.py

class RecommendationEngine:

    def recommend(self, db, user_id):
        mistakes = self._get_recent_mistakes(db, user_id)

        concepts = [m.concept_id for m in mistakes]

        resources = self._get_resources(concepts)

        scored = self._score(resources, mistakes)

        return sorted(scored, key=lambda x: x["score"], reverse=True)
```

---

## 7.3 Score (important)

```python
def _score(self, resources, mistakes):
    result = []

    for r in resources:
        score = 0

        if r.is_primary:
            score += 2

        if r.is_security:
            score += 1

        score += r.authority_score

        result.append({
            "resource": r,
            "score": score
        })

    return result
```

---

# 8) API FastAPI

## 8.1 Dépendance DB

```python
# api/deps.py
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
```

---

## 8.2 Plans

```python
# api/v1/plans.py

@router.post("/")
def create_plan(data: PlanCreate, db=Depends(get_db), user=Depends(get_user)):
    return plan_service.create(db, user.id, data)
```

---

## 8.3 Sessions

```python
# api/v1/sessions.py

@router.post("/next")
def next_session(plan_id: int, db=Depends(get_db), user=Depends(get_user)):
    return engine.compute_next_session(db, user.id, plan_id)
```

---

## 8.4 Recommandations

```python
# api/v1/recommendations.py

@router.get("/")
def get_recommendations(db=Depends(get_db), user=Depends(get_user)):
    return recommendation_engine.recommend(db, user.id)
```

---

# 9) Cycle complet (important)

## 9.1 Flux réel

```text
1. user lance /next-session
2. engine décide :
    - révision ?
    - faiblesse ?
    - progression ?
3. session créée
4. user travaille
5. fin session → erreurs enregistrées
6. update mastery
7. schedule révision
8. moteur recalcul
```

---

# 10) Règles système

## 10.1 Priorité

```text
Révision > Faiblesse > Progression
```

---

## 10.2 Cohérence

* pas de séance sans unit
* pas de recommandation sans concept
* pas de progression sans prérequis validé

---

## 10.3 Isolation multi-plan

```python
WHERE plan_id = X
```

toujours présent

---

# 11) Extension importante

Tu peux ajouter :

## Fatigue / charge

```python
if sessions_today > 5:
    reduce difficulty
```

## Adaptation dynamique

```python
if repeated_failures:
    downgrade level
```

---

# 12) Ce que tu as maintenant

Un backend qui :

* n’est pas CRUD
* prend des décisions
* s’adapte à l’utilisateur
* supporte plusieurs types de plans
* reste déterministe (contrôlable)

---

# 13) Prochaine étape logique

Deux options pertinentes :

### 1. Implémentation concrète

* SQLAlchemy models complets
* routes prêtes à lancer

### 2. Frontend connecté

* React + API
* dashboard intelligent

---
