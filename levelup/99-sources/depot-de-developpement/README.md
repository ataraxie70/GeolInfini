# LevelUP — Development Codebase

**Version :** 1.0.0-alpha  
**Statut :** Initial Bootstrapping  
**Environnement :** Sandbox de Développement  

---

## 1. Description du Projet

Ce répertoire héberge le code source de l'écosystème **LevelUP**, isolé de la documentation de conception et d'architecture. L'architecture logicielle repose sur le couplage de microservices Rust hautes performances pour le backend, d'un broker d'événements asynchrones NATS, et d'interfaces clients modernes.

---

## 2. Stack Technologique Validée

*   **Backend Services (Microservices) :** **Rust** (Cargo Workspace).
    *   *Core API :* Gestion de l'apprentissage (Execution layer : Progress, Program, Assessment, Activity).
    *   *Platform API :* Services transversaux (Scheduling, Gamification, Notifications).
*   **Frontend Web Client :** **React** + **TypeScript** + **Vite** (Dark mode sleek, glassmorphism, responsive).
*   **Frontend Mobile Client :** **Flutter** (Dart) pour applications multiplateformes natives.
*   **Bases de Données (Persistance) :**
    *   *PostgreSQL :* Base de données transactionnelle et relationnelle.
    *   *Neo4j :* Base de données de graphe pour le patrimoine pédagogique (DAG des compétences).
    *   *Redis :* Cache et sessions de tuteur IA.
*   **Bus de Messages :** **NATS JetStream** pour les événements asynchrones CQRS.

---

## 3. Structure du Répertoire

```text
/levelUP_development/
├── Cargo.toml                  # Workspace Cargo Root (Rust)
├── shared/
│   └── shared-kernel/          # Bibliothèque de types fondamentaux partagés
├── services/
│   ├── core-api/               # Service principal d'exécution d'apprentissage
│   ├── platform-api/           # Service Platform (Gamification, routines)
│   └── ai-broker/              # Tuteur IA socratique et MCP
├── clients/
│   ├── web/                    # Client web React + TypeScript
│   └── mobile/                 # Client mobile Flutter
└── infrastructure/
    └── docker-compose.yml      # Base de données et bus d'événements locaux
```

---

## 4. Démarrage de l'Infrastructure Locale

Pour démarrer les bases de données (PostgreSQL, Neo4j, Redis) et le bus d'événements (NATS JetStream) en local, rendez-vous dans le répertoire `infrastructure/` et lancez :

```bash
docker compose up -d
```
