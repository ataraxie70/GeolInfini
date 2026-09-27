# LEVELUP V1 — SPECIFICATION TECHNIQUE FONCTIONNELLE

## 1. Vision

LevelUP est une plateforme de pilotage de formation orientée discipline, progression et exécution.

Le système doit permettre :

- création de programmes ;
- création de plans d'apprentissage ;
- suivi quotidien ;
- gestion des prérequis ;
- contrôle de progression ;
- gestion des pénalités ;
- replanification automatique ;
- administration centralisée.

---

# 2. Architecture cible

## Frontend

- Next.js
- TypeScript
- Vanilla CSS
- PWA

## Backend

- NestJS
- TypeScript
- REST API
- JWT
- RBAC

## Base de données

- PostgreSQL

## Cache

- Redis

## Jobs

- BullMQ

---

# 3. Domaines métier

## Programme

Conteneur principal.

Exemples :

- Administration Système Linux
- Réseau
- DevOps
- Développement Système

### Attributs

- id
- nom
- description
- statut
- date_creation

---

## Plan

Découpage d'un programme.

### Attributs

- id
- programme_id
- titre
- objectif
- durée_estimee

---

## Module

### Attributs

- id
- plan_id
- nom
- ordre

---

## Sujet

### Attributs

- id
- module_id
- nom
- contenu
- difficulté

---

## Prérequis

Relation graphe orienté.

Sujet A -> Sujet B

---

## Session

Travail effectué.

### Attributs

- date
- durée
- résultat
- validation

---

## Révision

- sujet_id
- date_planifiée
- statut

---

## Pénalité

- raison
- gravité
- points

---

# 4. Etats métier

## Sujet

DRAFT
READY
IN_PROGRESS
COMPLETED
MASTERED

## Session

PLANNED
ACTIVE
DONE
MISSED

## Programme

ACTIVE
PAUSED
ARCHIVED

---

# 5. Rôles

## ADMIN

Contrôle total.

## LEARNER

Exécution des plans.

---

# 6. API V1

## Programmes

GET /programs

POST /programs

GET /programs/{id}

PATCH /programs/{id}

DELETE /programs/{id}

---

## Plans

GET /plans

POST /plans

GET /plans/{id}

PATCH /plans/{id}

---

## Modules

GET /modules

POST /modules

---

## Sujets

GET /topics

POST /topics

PATCH /topics/{id}

---

## Sessions

POST /sessions/start

POST /sessions/end

GET /sessions/history

---

## Pénalités

POST /penalties

GET /penalties

---

# 7. Dashboard Administration

## Gestion Programme

- créer
- modifier
- archiver

## Gestion Plans

- ajouter plan
- importer plan

## Gestion Modules

- ajouter module
- réordonner

## Gestion Sujets

- ajouter sujet
- définir prérequis

## Gestion Utilisateurs

- consultation
- statistiques

---

# 8. Algorithme de replanification

Déclencheurs :

- session manquée
- absence
- pénalité

Actions :

1. identifier tâche manquée
2. calculer priorité
3. rechercher créneau libre
4. replanifier
5. journaliser

---

# 9. MVP obligatoire

Livraison V1 :

- Auth
- Programmes
- Plans
- Modules
- Sujets
- Sessions
- Dashboard admin
- Pénalités
- Historique

---

# 10. Arborescence projet

backend/

  src/

    auth/

    users/

    programs/

    plans/

    modules/

    topics/

    sessions/

    penalties/

    scheduler/

frontend/

  app/

  components/

  features/

database/

  migrations/

docs/

  architecture/

  api/

  domain/

