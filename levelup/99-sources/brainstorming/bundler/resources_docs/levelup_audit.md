# LEVELUP --- Audit Technique & État du Projet

## 1. Vue d'ensemble

Le projet présente une architecture cohérente orientée **plateforme
d'apprentissage adaptatif**, avec séparation claire :

-   **Référentiel (docs / specs)** → très riche et avancé
-   **Backend (FastAPI)** → partiellement implémenté avec logique métier
    réelle
-   **Contenu pédagogique & seeds SQL** → fortement développé

------------------------------------------------------------------------

## 2. État global

### ✔️ Ce qui est FAIT (solide)

#### Architecture & conception

-   Cahier des charges fonctionnel complet
-   Architecture technique détaillée
-   Schéma de base de données avancé (niveau production)
-   Design système global validé (orchestrateur + engines)

#### Backend (implémentation réelle)

-   API FastAPI structurée (domain-driven)
-   Endpoints existants :
    -   domains / subdomains
    -   subjects
    -   sessions
    -   validations
    -   recommendations
    -   orchestrator
    -   session_execution
-   Sérialisation + utils présents
-   Logique métier non triviale déjà implémentée

#### Engines (concept + partiel code)

-   Progression Engine (lock/unlock)
-   Recommendation Engine
-   Session Execution Engine
-   Orchestrateur central (présent côté API)

#### Données & contenu

-   Seed SQL massif
-   Structuration pédagogique complète
-   Roadmaps systèmes (C, DevOps, etc.)

------------------------------------------------------------------------

### ⚙️ EN COURS (partiellement implémenté)

#### Cohérence des engines

-   Les composants existent mais :
    -   couplage encore faible
    -   orchestration probablement incomplète en runtime réel

#### Persistence / DB

-   SQLite présent (`levelup.db`)
-   Pas de preuve de migration (Alembic absent)
-   Pas de versioning du schéma

#### Validation & progression

-   Endpoints présents
-   Mais règles métier probablement :
    -   non centralisées
    -   non formalisées comme moteur déterministe strict

#### Recommendation Engine

-   Endpoint présent
-   Mais manque probable :
    -   scoring formel
    -   modèle explicite (graph ou poids)

------------------------------------------------------------------------

### ⚠️ CE QUI S'ÉCARTE des objectifs initiaux

#### 1. Absence de noyau formel (core engine unifié)

Les specs décrivent : \> un orchestrateur central déterministe

Mais dans le code : - logique dispersée dans plusieurs endpoints - pas
de **state machine globale explicite**

#### 2. Manque de séparation stricte

Idéal (selon specs) : - Core (logique pure) - API (interface HTTP)

Actuel : - logique métier mélangée avec API FastAPI

#### 3. Pas de modèle computationnel explicite

Exemples manquants : - graphe de progression formel - modèle de
dépendance des concepts - système de scoring mathématisé

#### 4. Infrastructure absente

-   pas de Docker
-   pas de CI/CD
-   pas de monitoring
-   pas de cache (Redis)

------------------------------------------------------------------------

## 3. Diagnostic technique

### Niveau actuel

Projet ≈ **70% conception / 45% implémentation réelle**

### Risque principal

> Explosion de complexité sans noyau formel central

------------------------------------------------------------------------

## 4. Plan d'avancement (structuré)

## Phase 1 --- Stabilisation du CORE (PRIORITÉ ABSOLUE)

### Objectif

Créer un **moteur central déterministe**

#### À faire

-   Implémenter un module :

```{=html}
<!-- -->
```
    core/
     ├── state_machine.py
     ├── progression_graph.py
     ├── validation_rules.py
     ├── recommendation_model.py
     └── orchestrator.py

#### Exigences

-   aucune dépendance FastAPI
-   fonctions pures
-   testable indépendamment

------------------------------------------------------------------------

## Phase 2 --- Formalisation mathématique

### Progression

-   graphe dirigé (DAG)
-   unlock = condition logique formelle

### Recommendation

-   score = f(maîtrise, difficulté, priorité)

------------------------------------------------------------------------

## Phase 3 --- Refactor API

-   API devient simple wrapper :

```{=html}
<!-- -->
```
    HTTP → Core Engine → Response

------------------------------------------------------------------------

## Phase 4 --- Base de données (production)

-   PostgreSQL
-   Alembic (migrations)
-   Normalisation stricte

------------------------------------------------------------------------

## Phase 5 --- Infrastructure

-   Docker
-   Redis (cache sessions + reco)
-   Worker async (Celery / RQ)

------------------------------------------------------------------------

## Phase 6 --- Frontend

-   React structuré (déjà spécifié)
-   Connexion API stable

------------------------------------------------------------------------

## 5. Conclusion

Le projet est :

-   **Extrêmement avancé conceptuellement**
-   **Partiellement implémenté correctement**
-   Mais manque un élément critique :

> un noyau computationnel formel central

C'est le point de bascule entre : - prototype complexe - système robuste
industriel
