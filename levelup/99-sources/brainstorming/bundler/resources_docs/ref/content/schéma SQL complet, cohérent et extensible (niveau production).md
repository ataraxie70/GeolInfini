Voici un **schéma SQL complet, cohérent et extensible (niveau production)** pour supporter :

* multi-plans (apprentissage, école, projet…)
* granularité fine (unités, concepts, ressources)
* moteur de séances
* suivi de progression
* erreurs + recommandations
* révisions
* traçabilité

Conçu pour **PostgreSQL** (types, contraintes, index).

---

# 1) ENUMS (contrôle strict des états)

```sql
CREATE TYPE plan_type AS ENUM (
    'learning', 'schedule', 'project', 'habit', 'custom'
);

CREATE TYPE unit_type AS ENUM (
    'subject', 'module', 'class', 'task', 'custom'
);

CREATE TYPE session_type AS ENUM (
    'study', 'practice', 'review', 'class', 'project', 'task'
);

CREATE TYPE session_status AS ENUM (
    'planned', 'ongoing', 'completed', 'cancelled', 'deleted'
);

CREATE TYPE difficulty_level AS ENUM (
    '1','2','3','4','5'
);
```

---

# 2) CORE — UTILISATEUR

```sql
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

# 3) PLANS (cœur du système)

```sql
CREATE TABLE plans (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    plan_type plan_type NOT NULL,
    goal TEXT,
    start_date DATE,
    end_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_plans_user ON plans(user_id);
```

---

# 4) UNITS (abstraction universelle)

```sql
CREATE TABLE units (
    id BIGSERIAL PRIMARY KEY,
    plan_id BIGINT REFERENCES plans(id) ON DELETE CASCADE,
    parent_id BIGINT REFERENCES units(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    unit_type unit_type NOT NULL,
    order_index INT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_units_plan ON units(plan_id);
CREATE INDEX idx_units_parent ON units(parent_id);
```

👉 Permet :

* hiérarchie (module → sujet → sous-sujet)
* flexibilité totale

---

# 5) CONCEPTS (uniquement learning)

```sql
CREATE TABLE concepts (
    id BIGSERIAL PRIMARY KEY,
    unit_id BIGINT REFERENCES units(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    difficulty difficulty_level,
    order_index INT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_concepts_unit ON concepts(unit_id);
```

---

# 6) PRÉREQUIS (graphe orienté)

```sql
CREATE TABLE concept_prerequisites (
    id BIGSERIAL PRIMARY KEY,
    concept_id BIGINT REFERENCES concepts(id) ON DELETE CASCADE,
    prerequisite_id BIGINT REFERENCES concepts(id) ON DELETE CASCADE,
    UNIQUE(concept_id, prerequisite_id)
);
```

---

# 7) RESSOURCES

```sql
CREATE TABLE resources (
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    source_type TEXT,
    source_role TEXT,
    url TEXT,
    authority_score FLOAT CHECK (authority_score >= 0 AND authority_score <= 1),
    difficulty difficulty_level,
    is_primary BOOLEAN DEFAULT FALSE,
    is_security BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

# 8) MAPPING CONCEPT ↔ RESSOURCE

```sql
CREATE TABLE resource_concepts (
    id BIGSERIAL PRIMARY KEY,
    resource_id BIGINT REFERENCES resources(id) ON DELETE CASCADE,
    concept_id BIGINT REFERENCES concepts(id) ON DELETE CASCADE,
    UNIQUE(resource_id, concept_id)
);

CREATE INDEX idx_rc_concept ON resource_concepts(concept_id);
```

---

# 9) SESSIONS (moteur d’exécution)

```sql
CREATE TABLE sessions (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    plan_id BIGINT REFERENCES plans(id) ON DELETE CASCADE,
    unit_id BIGINT REFERENCES units(id),
    session_type session_type NOT NULL,
    status session_status DEFAULT 'planned',
    scheduled_at TIMESTAMP,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    duration_minutes INT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_sessions_user ON sessions(user_id);
CREATE INDEX idx_sessions_plan ON sessions(plan_id);
CREATE INDEX idx_sessions_status ON sessions(status);
```

---

# 10) MAÎTRISE DES CONCEPTS

```sql
CREATE TABLE concept_mastery (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    concept_id BIGINT REFERENCES concepts(id) ON DELETE CASCADE,
    mastery_score FLOAT DEFAULT 0,
    last_seen TIMESTAMP,
    last_score FLOAT,
    UNIQUE(user_id, concept_id)
);
```

---

# 11) ERREURS

```sql
CREATE TABLE mistakes (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    session_id BIGINT REFERENCES sessions(id) ON DELETE SET NULL,
    concept_id BIGINT REFERENCES concepts(id),
    description TEXT,
    severity INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_mistakes_user ON mistakes(user_id);
```

---

# 12) POINTS FAIBLES (dérivé)

```sql
CREATE TABLE weak_points (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    concept_id BIGINT REFERENCES concepts(id),
    severity INT,
    last_detected TIMESTAMP,
    UNIQUE(user_id, concept_id)
);
```

---

# 13) RÉVISIONS (spaced repetition)

```sql
CREATE TABLE revisions (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    concept_id BIGINT REFERENCES concepts(id),
    due_date TIMESTAMP,
    interval_days INT,
    ease_factor FLOAT DEFAULT 2.5,
    last_review TIMESTAMP,
    UNIQUE(user_id, concept_id)
);

CREATE INDEX idx_revisions_due ON revisions(due_date);
```

---

# 14) RECOMMANDATIONS

```sql
CREATE TABLE resource_recommendations (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    concept_id BIGINT REFERENCES concepts(id),
    resource_id BIGINT REFERENCES resources(id),
    score FLOAT,
    reason TEXT,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

# 15) VALIDATIONS

```sql
CREATE TABLE validations (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    unit_id BIGINT REFERENCES units(id),
    score FLOAT,
    passed BOOLEAN,
    validated_at TIMESTAMP DEFAULT NOW()
);
```

---

# 16) AUDIT / HISTORIQUE (critique)

```sql
CREATE TABLE audit_logs (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    entity_type TEXT,
    entity_id BIGINT,
    action TEXT,
    old_value JSONB,
    new_value JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

# 17) RÈGLES SYSTÈME IMPORTANTES

## 1. Soft delete

Ne jamais supprimer :

```sql
status = 'deleted'
```

---

## 2. Contraintes implicites

* une session `completed` doit avoir `ended_at`
* une session `ongoing` doit avoir `started_at`
* `concept_mastery` doit être unique par user/concept

---

## 3. Index critiques

* sessions(user_id, status)
* revisions(due_date)
* resource_concepts(concept_id)

---

# 18) Architecture logique finale

```text
Plan
 ├── Units (hiérarchie)
 │    └── Concepts (si learning)
 │         └── Resources
 │
 ├── Sessions (exécution)
 │    ├── Mistakes
 │    ├── Notes
 │    └── Updates
 │
 ├── Mastery
 ├── Revisions
 └── Recommendations
```

---

# 19) Pourquoi ce schéma est solide

* découplage complet **contenu / exécution / analyse**
* extensible à tout type de plan
* compatible moteur de recommandation
* supporte graphe de connaissances
* supporte tracking utilisateur précis

---

# 20) Prochaine étape logique

Implémenter :

👉 **moteur de décision backend**

qui calcule :

```text
erreurs → concepts faibles → ressources → prochaine séance
