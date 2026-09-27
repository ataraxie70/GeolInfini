# LevelUP — Data & Knowledge Graph Architecture

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Data Layer  
**Code :** LEVELUP-DAT-POLYGLOT-001  

---

# 1. Architecture de Persistance Polyglotte (Polyglot Persistence)

Pour répondre aux contraintes du modèle métier de LevelUP (respect de la hiérarchie des compétences, rapidité d'affichage du tableau de bord et sécurité cryptographique de l'audit), le stockage est scindé en trois moteurs de données complémentaires :

1.  **Graph Database (Neo4j) :** Dédiée aux structures de prérequis de compétences (DAG) et aux taxonomies de connaissances.
2.  **Relational Database (PostgreSQL) :** Dédiée aux données transactionnelles d'exécution (programmes, plannings, sessions d'évaluation, utilisateurs, métadonnées).
3.  **Immutable Ledger (WORM / Postgres Partition) :** Journal d'audit et historique des preuves.

```text
                  ┌───────────────────────────────┐
                  │      COMMAND API / WRITE      │
                  └──────────────┬────────────────┘
                                 ▼
         ┌───────────────────────┴───────────────────────┐
         ▼ (Structure & Graphes)                         ▼ (Transactions & États)
 ┌──────────────┐                                ┌──────────────┐
 │    Neo4j     │                                │  PostgreSQL  │
 └──────────────┘                                └──────┬───────┘
                                                        │
                                                        ▼ (Events de domaines)
                                                 ┌──────────────┐
                                                 │ Read Models  │ ➔ (Dénormalisés)
                                                 └──────────────┘
```

---

# 2. Modèle de Graphe Pédagogique (Knowledge Graph — Neo4j)

Le graphe pédagogique gère l'immutabilité et les relations de prérequis pédagogiques de LevelUP.

## 2.1 Schéma des Nœuds (Nodes)
*   `(:CompetencyDomain {id: String, name: String, code: String})` : Domaines métier (ex: *Sciences*, *Informatique*).
*   `(:Competency {id: String, name: String, description: String, confidenceThreshold: String})` : Compétences (ex: `urn:levelup:competency:linux:bash`).
*   `(:KnowledgeUnit {id: String, title: String, difficulty: String})` : Notions de connaissances unitaires.

## 2.2 Schéma des Relations (Relationships)
*   `(:CompetencyDomain) -[:HAS_COMPETENCY]-> (:Competency)`
*   `(:Competency) -[:REQUIRES_COMPETENCY]-> (:Competency)` : Relation de prérequis (DAG).
*   `(:Competency) -[:REQUIRES_KNOWLEDGE]-> (:KnowledgeUnit)` : Connaissances requises pour la compétence.
*   `(:KnowledgeUnit) -[:PREREQUISITE_OF]-> (:KnowledgeUnit)` : Graphe de dépendances théoriques.

## 2.3 Exemple de Requête Cypher (Validation de prérequis)
Vérifie si tous les prérequis d'une compétence cible sont validés pour un apprenant :
```cypher
MATCH (target:Competency {id: $targetCompetencyId})-[:REQUIRES_COMPETENCY*1..]->(pre:Competency)
RETURN pre.id AS PrerequisiteId
```

---

# 3. Schéma Relationnel Opérationnel (PostgreSQL)

Le schéma physique ci-dessous modélise la persistance transactionnelle des tables.

```sql
-- Table des comptes utilisateurs (Identity Context)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    mfa_secret VARCHAR(128),
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table des profils (Cloisonnement nominatif, RGPD)
CREATE TABLE user_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    learner_id UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(), -- ID anonymisé circulant
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table des workspaces (Workspace Context)
CREATE TABLE workspaces (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    type VARCHAR(32) NOT NULL, -- 'PERSONAL', 'SHARED', 'COMMUNITY'
    owner_id UUID REFERENCES users(id),
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table des inscriptions d'espaces
CREATE TABLE workspace_enrollments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id UUID REFERENCES workspaces(id) ON DELETE CASCADE,
    learner_id UUID NOT NULL, -- Référence anonyme
    role VARCHAR(32) NOT NULL, -- 'ADMIN', 'EDUCATOR', 'LEARNER'
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE',
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table des programmes d'exécution personnels (Program Context)
CREATE TABLE personal_programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id UUID REFERENCES workspaces(id) ON DELETE CASCADE,
    learner_id UUID NOT NULL,
    blueprint_id VARCHAR(255) NOT NULL, -- URN de parcours
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table des instances d'activités quotidiennes (Activity Context)
CREATE TABLE activity_instances (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    program_id UUID REFERENCES personal_programs(id) ON DELETE CASCADE,
    workspace_id UUID REFERENCES workspaces(id),
    learner_id UUID NOT NULL,
    activity_id VARCHAR(255) NOT NULL, -- URN d'activité
    status VARCHAR(32) NOT NULL DEFAULT 'CREATED', -- 'ACTIVE', 'PAUSED', 'COMPLETED'
    started_at TIMESTAMP WITH TIME ZONE,
    completed_at TIMESTAMP WITH TIME ZONE
);

-- Table des sessions d'évaluation (Assessment Context)
CREATE TABLE assessment_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id UUID REFERENCES workspaces(id),
    learner_id UUID NOT NULL,
    competency_id VARCHAR(255) NOT NULL, -- URN compétence
    status VARCHAR(32) NOT NULL DEFAULT 'OPEN', -- 'SUBMITTED', 'CLOSED', 'EXPIRED'
    started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP WITH TIME ZONE,
    score NUMERIC(3, 2),
    feedback TEXT
);

-- Table des preuves physiques (Portfolio Context - Append Only)
CREATE TABLE evidences (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID REFERENCES assessment_sessions(id) ON DELETE SET NULL,
    workspace_id UUID REFERENCES workspaces(id),
    learner_id UUID NOT NULL,
    resource_urn VARCHAR(255) NOT NULL,
    confidence_level VARCHAR(32) NOT NULL, -- 'LOW', 'MEDIUM', 'HIGH', 'MAX'
    signature TEXT NOT NULL, -- Empreinte SHA-256 + Signature cryptographique
    verified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

---

# 4. CQRS Read Models (Projections de Lecture)

Pour garantir des performances d'affichage de type "sub-seconde" sans requêter les graphes ou effectuer des jointures SQL complexes lors de la navigation, des tables dénormalisées optimisées pour la lecture sont maintenues à jour par des gestionnaires de projections.

## 4.1 Modèle de Lecture : read_learner_progress (Tableau de bord de maîtrise)
Alimente la vue d'ensemble des compétences de l'apprenant.

```sql
CREATE TABLE read_learner_progress (
    learner_id UUID NOT NULL,
    workspace_id UUID NOT NULL,
    competency_id VARCHAR(255) NOT NULL,
    mastery_estimation NUMERIC(3, 2) NOT NULL, -- Calcul Progress Context (0.00 à 1.00)
    progress_confidence VARCHAR(32) NOT NULL, -- 'LOW', 'MEDIUM', 'HIGH', 'MAX'
    last_updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (learner_id, workspace_id, competency_id)
);
```
*   **Mise à jour :** Écoute les événements d'intégration `EvidenceVerified` (incrémente le score et la confiance) et les horloges de dégradation temporelle `ProgressDecayed` (déprécie la confiance).

## 4.2 Modèle de Lecture : read_daily_routines (Indicateurs de discipline)
Alimente le widget d'assiduité.

```sql
CREATE TABLE read_daily_routines (
    learner_id UUID NOT NULL,
    workspace_id UUID NOT NULL,
    streak_count INTEGER NOT NULL DEFAULT 0,
    discipline_score INTEGER NOT NULL DEFAULT 100, -- Pourcentage (0 à 100)
    next_scheduled_activity_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (learner_id, workspace_id)
);
```
*   **Mise à jour :** Écoute les événements d'intégration `ActivityCompleted` (incrémente le streak) et `RoutineMissed` (met à jour le score de discipline et réinitialise le streak).
