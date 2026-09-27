# Architecture globale

## 1. Positionnement
L’architecture cible suit une logique de **monolithe modulaire propre**, avec séparation stricte des responsabilités.

## 2. Couches
- API / exposition ;
- application / orchestration ;
- domaine / règles métier ;
- infrastructure / stockage / I/O ;
- observabilité / logs / audit ;
- sécurité / contrôle d’accès.

## 3. Stack technique consolidée
- Frontend : React + TypeScript + Vite ;
- Backend : FastAPI + Python ;
- ORM : SQLAlchemy ;
- Migrations : Alembic ;
- Base de données : SQLite en première version, PostgreSQL ensuite ;
- Conteneurisation : Docker ;
- CI/CD : GitHub Actions ;
- Observabilité : logs structurés, métriques, alerting ;
- Cache / file d’attente : Redis si nécessaire.

## 4. Principes de conception
- pas de logique métier dans la couche API ;
- pas d’accès direct à la base hors repository ;
- moteur décisionnel séparé des effets ;
- service d’exécution séparé du calcul ;
- traçabilité avant optimisation ;
- testabilité avant sophistication.

## 5. Frontières d’isolement
- couche UI isolée des règles métier ;
- couche domaine indépendante du framework ;
- moteur de progression indépendant de l’interface ;
- moteur de recommandation indépendant du stockage ;
- données et logique séparées.
