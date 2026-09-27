# LevelUP — Modèle de Données & Schéma SQL (PostgreSQL)

Ce document décrit le modèle de données relationnel de **LevelUP**, ses contraintes d'intégrité référentielle, ses indexes et les scripts SQL d'initialisation (seeds) requis pour un démarrage local.

---

## 1. Schéma SQL DDL (PostgreSQL)

Voici les scripts de création des tables, types énumérés et contraintes d'intégrité en respectant le standard PostgreSQL.

```sql
-- =========================================================================
-- 1. TYPES ÉNUMÉRÉS (ENUMS)
-- =========================================================================

CREATE TYPE user_role AS ENUM ('admin', 'learner');
CREATE TYPE program_status AS ENUM ('active', 'paused', 'archived');
CREATE TYPE study_plan_status AS ENUM ('draft', 'active', 'paused', 'completed', 'archived');
CREATE TYPE topic_status AS ENUM ('locked', 'available', 'in_progress', 'validated', 'mastered');
CREATE TYPE session_status AS ENUM ('planned', 'active', 'done', 'missed', 'postponed', 'interrupted', 'resumed', 'cancelled');
CREATE TYPE penalty_severity AS ENUM ('low', 'medium', 'high');

-- =========================================================================
-- 2. TABLES
-- =========================================================================

-- Utilisateurs
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role user_role NOT NULL DEFAULT 'learner',
    discipline_score INT NOT NULL DEFAULT 100 CHECK (discipline_score BETWEEN 0 AND 100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Programmes
CREATE TABLE programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status program_status NOT NULL DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Plans d'étude
CREATE TABLE study_plans (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    program_id UUID NOT NULL REFERENCES programs(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    objective TEXT,
    estimated_duration_days INT NOT NULL CHECK (estimated_duration_days > 0),
    status study_plan_status NOT NULL DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Modules
CREATE TABLE modules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    study_plan_id UUID NOT NULL REFERENCES study_plans(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    sequence_order INT NOT NULL CHECK (sequence_order >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (study_plan_id, sequence_order) -- Empêche deux modules d'avoir le même ordre dans un plan
);

-- Sujets (Topics)
CREATE TABLE topics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    module_id UUID NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    content TEXT,
    difficulty VARCHAR(50) NOT NULL,
    status topic_status NOT NULL DEFAULT 'locked',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Prérequis (Graphe orienté de dépendance)
CREATE TABLE prerequisites (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    required_topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE RESTRICT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CHECK (topic_id <> required_topic_id), -- Pas de boucle sur lui-même
    UNIQUE (topic_id, required_topic_id) -- Pas de doublon de relation
);

-- Séances (Sessions de travail)
CREATE TABLE sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    planned_date DATE NOT NULL,
    duration_minutes INT NOT NULL CHECK (duration_minutes >= 0),
    status session_status NOT NULL DEFAULT 'planned',
    result_notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Pénalités (Discipline)
CREATE TABLE penalties (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    reason TEXT NOT NULL,
    severity penalty_severity NOT NULL DEFAULT 'low',
    discipline_points INT NOT NULL CHECK (discipline_points >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Interruptions & Protocoles de reprise
CREATE TABLE interruptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    study_plan_id UUID NOT NULL REFERENCES study_plans(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE,
    questionnaire_response JSONB, -- Stockage flexible du contexte de reprise
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date IS NULL OR end_date >= start_date)
);

-- Journal d'activité (Audit Trail - Append Only)
CREATE TABLE activity_logs (
    id BIGSERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    action_type VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    metadata JSONB, -- Détails de la modification (ex: anciennes/nouvelles valeurs)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Paramètres généraux du système
CREATE TABLE system_settings (
    key VARCHAR(100) PRIMARY KEY,
    value VARCHAR(255) NOT NULL,
    description TEXT,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

---

## 2. Optimisation & Indexation

Pour garantir de hautes performances lors de la croissance du volume de données, les indexes suivants sont recommandés :

```sql
-- Accélérer la recherche de prérequis pour déverrouiller un sujet
CREATE INDEX idx_prerequisites_topic ON prerequisites(topic_id);
CREATE INDEX idx_prerequisites_required ON prerequisites(required_topic_id);

-- Optimiser la récupération des séances du jour pour un utilisateur
CREATE INDEX idx_sessions_user_date ON sessions(user_id, planned_date);

-- Suivi de l'historique d'audit
CREATE INDEX idx_activity_logs_created_at ON activity_logs(created_at DESC);
```

---

## 3. Données de Test & Initialisation (Seeds)

Voici un script SQL pour pré-remplir la base de données avec un programme type d'**Administration Système & Docker** et définir ses prérequis logiques.

```sql
-- 1. Insertion d'un utilisateur de test (learner et admin)
INSERT INTO users (id, email, password_hash, role, discipline_score) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'learner@levelup.io', '$2b$12$ExampleHash1...', 'learner', 100),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'admin@levelup.io', '$2b$12$ExampleHash2...', 'admin', 100);

-- 2. Insertion d'un programme d'études
INSERT INTO programs (id, name, description, status) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Administration Linux & DevOps', 'Maîtriser les bases du système GNU/Linux, le scripting Bash, Docker et les pipelines de CI/CD.', 'active');

-- 3. Insertion d'un plan d'études
INSERT INTO study_plans (id, program_id, title, objective, estimated_duration_days, status) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Cursus Fondamentaux Cloud - 90 jours', 'Devenir autonome sur l administration serveur et le packaging applicatif.', 90, 'active');

-- 4. Insertion des modules
INSERT INTO modules (id, study_plan_id, name, sequence_order) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Module 1 : Bases de Linux et CLI', 1),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Module 2 : Conteneurisation avec Docker', 2);

-- 5. Insertion des sujets (Topics)
INSERT INTO topics (id, module_id, name, content, difficulty, status) VALUES
-- Module 1
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Navigation dans le système de fichiers', 'Apprendre ls, cd, pwd, mkdir...', 'Facile', 'available'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Permissions et Propriétaires (chmod/chown)', 'Comprendre les rwx et les utilisateurs.', 'Moyen', 'locked'),
-- Module 2
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'Introduction aux Conteneurs', 'Qu est-ce qu un conteneur face à une machine virtuelle.', 'Facile', 'locked'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'Volumes Docker et Persistance', 'Comment persister les données de conteneurs.', 'Moyen', 'locked');

-- 6. Définition des prérequis
INSERT INTO prerequisites (topic_id, required_topic_id) VALUES
-- chmod/chown a besoin de la Navigation CLI
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a01'),
-- Intro Conteneurs a besoin des bases Linux (Permissions)
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02'),
-- Les volumes Docker ont besoin de l intro aux conteneurs
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03');

-- 7. Paramètres par défaut
INSERT INTO system_settings (key, value, description) VALUES
('missed_session_penalty_points', '10', 'Nombre de points retirés du score de discipline pour une session manquée.'),
('consecutive_missed_threshold_lock', '3', 'Nombre de jours ratés d affilée déclenchant le blocage et protocole de reprise.');
```
