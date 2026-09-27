# LEVELUP — Dossier Maître de Conception Produit & Technique (Consolidé)

Ce document unique constitue la source de vérité absolue pour l'implémentation de la plateforme **LevelUP**. Il regroupe la vision produit, les besoins fonctionnels, la charte graphique et spécifications d'interface, le modèle de données relationnel, ainsi que les spécifications des API et des moteurs métier algorithmiques.

---

## SOMMAIRE
1. [Vision & Philosophie du Produit](#1-vision--philosophie-du-produit)
2. [Analyse Détaillée des Besoins](#2-analyse-détaille-des-besoins)
3. [Charte Graphique & Spécifications UI/UX](#3-charte-graphique--spécifications-uiux)
4. [Modèle de Données & Schéma SQL](#4-modèle-de-données--schéma-sql)
5. [Contrats d'API & Moteurs Métier](#5-contrats-dapi--moteurs-métier)

---

## 1. Vision & Philosophie du Produit

### 1.1 Le Problème
L'auto-apprentissage souffre d'un taux d'abandon extrêmement élevé dû à :
1. **La dispersion** : L'apprenant saute de sujet en sujet sans maîtriser les bases.
2. **Le manque de discipline** : Pas de contrainte temporelle ou d'engagement réel.
3. **La mauvaise gestion des interruptions** : Après un arrêt de quelques jours, l'apprenant perd le fil, se décourage et abandonne.

### 1.2 La Solution : Le Système de Contrainte Intelligente
LevelUP répond à cela en automatisant le rôle d'un tuteur rigoureux :
* **Un chemin, pas de raccourcis** : Le système verrouille les sujets tant que leurs prérequis ne sont pas maîtrisés.
* **Engagement temporel** : Des séances d'apprentissage quotidiennes sont générées. Tout manquement entraîne une pénalité.
* **Résilience intégrée** : En cas d'interruption prolongée, le système applique un protocole de reprise pour réengager l'apprenant de manière cohérente (séances de révision et décalage intelligent).
* **Traçabilité totale** : Toutes les actions sont inscrites dans un journal d'activité non modifiable.

---

## 2. Analyse Détaillée des Besoins

### 2.1 Hiérarchie Pédagogique
* **Programme** : Niveau macro (ex. : *DevOps & Infrastructure Cloud*).
* **Plan d'Étude** : Déclinaison temporelle et pédagogique du programme.
* **Module** : Regroupement thématique au sein d'un plan.
* **Sujet (Topic)** : Unité d'apprentissage atomique (ex. : *Gestion des volumes Docker*).
* **Ressources** : Cours, vidéos, livres, classés comme *Primaire* ou *Secondaire*.

### 2.2 Le Graphe de Dépendances (Prérequis)
Un sujet $B$ peut dépendre de prérequis $A_1, A_2$. Le système empêche l'accès au sujet $B$ tant que $A_1$ et $A_2$ ne sont pas validés.

### 2.3 Système Disciplinaire et Pénalités
Si une séance planifiée passe en `missed`, le moteur disciplinaire se déclenche, retire des points de discipline et applique un impact sur le planning.

---

## 3. Charte Graphique & Spécifications UI/UX

### 3.1 Design System
* **Fond Principal** : `#0B0F19` (Obsidian)
* **Fond Cartes/Sidebar** : `#121824`
* **Texte Primaire** : `#F8FAFC`
* **Accents** : Cyan (`#06B6D4`), Émeraude (`#10B981` pour la validation), Orange (`#F97316` pour les alertes/pénalités).
* **Typographie** : `Inter` pour le corps de texte, `Space Grotesk` ou `JetBrains Mono` pour les données et scores.

### 3.2 Dashboard Apprenant (Daily Focus)
Centré sur la séance du jour (`Start Session`), avec affichage du score de discipline dynamique et graphique hebdomadaire d'apprentissage.

### 3.3 Panel d'Administration (Curriculum Builder)
Concepteur de graphe de dépendance interactif reliant visuellement les sujets, gestionnaire de bascules pour les règles de pénalité et grille de statistiques des apprenants.

---

## 4. Modèle de Données & Schéma SQL (PostgreSQL)

```sql
CREATE TYPE user_role AS ENUM ('admin', 'learner');
CREATE TYPE program_status AS ENUM ('active', 'paused', 'archived');
CREATE TYPE study_plan_status AS ENUM ('draft', 'active', 'paused', 'completed', 'archived');
CREATE TYPE topic_status AS ENUM ('locked', 'available', 'in_progress', 'validated', 'mastered');
CREATE TYPE session_status AS ENUM ('planned', 'active', 'done', 'missed', 'postponed', 'interrupted', 'resumed', 'cancelled');
CREATE TYPE penalty_severity AS ENUM ('low', 'medium', 'high');

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role user_role NOT NULL DEFAULT 'learner',
    discipline_score INT NOT NULL DEFAULT 100 CHECK (discipline_score BETWEEN 0 AND 100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status program_status NOT NULL DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

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

CREATE TABLE modules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    study_plan_id UUID NOT NULL REFERENCES study_plans(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    sequence_order INT NOT NULL CHECK (sequence_order >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (study_plan_id, sequence_order)
);

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

CREATE TABLE prerequisites (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    required_topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE RESTRICT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CHECK (topic_id <> required_topic_id),
    UNIQUE (topic_id, required_topic_id)
);

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

CREATE TABLE penalties (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    reason TEXT NOT NULL,
    severity penalty_severity NOT NULL DEFAULT 'low',
    discipline_points INT NOT NULL CHECK (discipline_points >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interruptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    study_plan_id UUID NOT NULL REFERENCES study_plans(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE,
    questionnaire_response JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE activity_logs (
    id BIGSERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    action_type VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

---

## 5. Contrats d'API & Moteurs Métier

### 5.1 Endpoints Majeurs
* `POST /api/v1/auth/login` : Connexion et récupération du token JWT.
* `POST /api/v1/sessions/start` : Démarrage de la séance d'étude du jour.
* `POST /api/v1/sessions/:id/end` : Clôture de la séance d'étude (`done|interrupted`).
* `POST /api/v1/admin/penalties/waive` : Dispense accordée par l'administrateur.

### 5.2 Logique des Algorithmes
1. **Planification (Scheduling)** : Sélectionne les sujets déverrouillés en parcourant le graphe orienté (tous les prérequis doivent être validés) et prend le sujet ayant le plus petit ordre logique dans le plan.
2. **Discipline** : Un cron quotidien détecte les séances non clôturées à temps, les passe en `missed`, applique un retrait de points sur la discipline de l'utilisateur, et met le plan en pause si 3 échecs consécutifs sont constatés.
3. **Reprise (Recovery)** : À la réouverture d'un plan suspendu, le moteur demande un questionnaire de reprise, décale les dates de sessions futures du nombre de jours d'inactivité, et injecte des sessions de révisions légères sur les premiers jours.