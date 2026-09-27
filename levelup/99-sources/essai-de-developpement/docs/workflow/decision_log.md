# LEVELUP — Registre de Suivi des Décisions (Workflow Log)

Ce document enregistre l'ensemble des décisions d'architecture, de conception, d'interfaces et de choix d'environnement prises tout au long de la réalisation du projet **LevelUP**.

---

## 📅 Historique des Décisions

### Décision 001 — Stabilisation Conceptuelle (12 Juin 2026)
* **Objet** : Définition de la vision produit et validation du périmètre MVP.
* **Détail** : Validation du modèle de contrainte intelligente (verrouillage de progression par prérequis, décompte de score de discipline, protocole de reprise résiliente).
* **Document de référence** : [conception_produit.md](file:///home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/conception_produit.md) (copie consolidée locale dans [levelup_dossier_maitre_restructure.md](file:///home/oswiser9/Out-Labs/www/levelUP/workflow/levelup_dossier_maitre_restructure.md)).

### Décision 002 — Identité Visuelle & UX (12 Juin 2026)
* **Objet** : Définition du Design System et des maquettes haute fidélité pour le front-end.
* **Détail** : Adoption du mode sombre Obsidian (`#0B0F19`) avec des accents néons (Cyan pour les actions, Émeraude pour le succès, Orange pour les alertes). Intégration du concepteur de graphe de dépendance pour l'administration et de la jauge de discipline pour l'apprenant.
* **Document de référence** : [charte_graphique_ui.md](file:///home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/charte_graphique_ui.md).

### Décision 003 — Architecture de Données (12 Juin 2026)
* **Objet** : Schéma logique et relationnel de persistance.
* **Détail** : Adoption de PostgreSQL comme base de données principale. Modélisation en tables (utilisateurs, programmes, plans d'études, modules, sujets, prérequis, séances, pénalités, interruptions et logs d'activité) avec contraintes d'intégrité strictes.
* **Document de référence** : [modele_donnees.md](file:///home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/modele_donnees.md).

### Décision 004 — Contrats d'API & Moteurs (12 Juin 2026)
* **Objet** : Endpoints REST et spécification des moteurs d'orchestration.
* **Détail** : Définition des endpoints REST pour l'application et l'administration. Formalisation des algorithmes de planification de séances (parcours du graphe de prérequis), de détection disciplinaire, et de reprise suite à inactivité.
* **Document de référence** : [apis_moteurs.md](file:///home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/apis_moteurs.md).

### Décision 005 — Configuration de l'Environnement de Développement (12 Juin 2026)
* **Objet** : Création d'un environnement de développement conteneurisé (Devcontainer).
* **Détail** : 
  * Création d'un dossier racine `platform/` pour le code source et `workflow/` pour le suivi documentaire.
  * Configuration de `platform/.devcontainer/devcontainer.json`, `platform/.devcontainer/Dockerfile` et `platform/.devcontainer/docker-compose.yml` isolant les technologies de développement (Node.js 20, NestJS CLI, client PostgreSQL, client Redis) et les bases de données/cache (PostgreSQL 15-alpine et Redis 7-alpine) pour ne pas polluer l'hôte.
  * Utilisation d'une image personnalisée `node:20-bookworm-slim` comme base et installation manuelle de tous les outils requis pour un contrôle total (pas d'image préconfigurée devcontainer).
* **Fichiers de référence** :
  * [devcontainer.json](file:///home/oswiser9/Out-Labs/www/levelUP/platform/.devcontainer/devcontainer.json)
  * [docker-compose.yml](file:///home/oswiser9/Out-Labs/www/levelUP/platform/.devcontainer/docker-compose.yml)
  * [Dockerfile](file:///home/oswiser9/Out-Labs/www/levelUP/platform/.devcontainer/Dockerfile)

### Décision 006 — Initialisation Technique (12 Juin 2026)
* **Objet** : Création des structures logicielles réelles (Frontend et Backend).
* **Détail** :
  * **Backend** : Initialisation d'une application NestJS dans `platform/backend` avec TypeScript en mode strict, configurée sous npm.
  * **Frontend** : Initialisation d'une application Next.js 15 dans `platform/frontend` avec l'App Router, TypeScript et une structure CSS pure (sans Tailwind CSS pour préserver la flexibilité graphique de notre Design System).
* **Dossiers de référence** :
  * [backend/](file:///home/oswiser9/Out-Labs/www/levelUP/platform/backend)
  * [frontend/](file:///home/oswiser9/Out-Labs/www/levelUP/platform/frontend)

---

## 📁 Structure Actuelle du Projet

```text
levelup/
├── platform/               <-- Code source de l'application
│   ├── .devcontainer/
│   │   ├── devcontainer.json   <-- Config VS Code
│   │   ├── docker-compose.yml  <-- Services (app, db, redis)
│   │   └── Dockerfile          <-- Image de base personnalisée
│   ├── backend/            <-- Application Backend (NestJS, TS Strict)
│   └── frontend/           <-- Application Frontend (Next.js, TS, Vanilla CSS)
└── workflow/               <-- Registre de suivi et documents de conception
    ├── decision_log.md     <-- Ce fichier
    ├── levelup_backlog_technique.md
    ├── levelup_dossier_maitre_restructure.md
    └── levelup_v1_specification_technique.md
```
