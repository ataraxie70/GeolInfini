# LevelUP — Feuille de Route Technique & Implémentation

**Version :** 1.0  
**Statut :** Strict Engineering Guide  
**Axiome Pivot :** *Foundation First* (Construire les dépendances dans l'ordre de leur antériorité logique)  

---

## 1. Vue d'Ensemble des Phases d'Implémentation

Pour implémenter LevelUP de manière robuste, le développement suit la séquence stricte des couches techniques :

```text
 ┌────────────────────────────────────────────────────────────────────────┐
 │                    PHASE 4 : CORE API & SERVICES                       │
 │      (Logique métier Rust, NATS listeners, Projections Read Models)    │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼
 ┌────────────────────────────────────────────────────────────────────────┐
 │                    PHASE 3 : POLITIQUES & SERVICES EXTERNES            │
 │      (Règles Rego OPA, AI Broker Python, Serveurs MCP)                 │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼
 ┌────────────────────────────────────────────────────────────────────────┐
 │                    PHASE 2 : PERSISTANCE & SCHÉMAS                     │
 │      (Migrations Postgres SQLx, Scripts Cypher Neo4j)                  │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼
 ┌────────────────────────────────────────────────────────────────────────┐
 │                    PHASE 1 : SHARED KERNEL & TESTS                     │
 │      (Parseur URN, Chiffrement Preuves, Tests unitaires Rust)          │
 └────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Phase 1 : Implémentation du Shared Kernel & Tests Unitaires

*   **Dépendances requises :** Aucune (bibliothèque pure).
*   **Objectifs :** Figer le socle de types et assurer la sécurité cryptographique des preuves.

### Tâche 1.1 — Robustesse du Parseur URN
*   **Fichier cible :** `shared/shared-kernel/src/lib.rs`
*   **Action :** Étendre l'implémentation du type `Urn` pour classifier le type de ressource :
    *   `urn:levelup:competency:<domaine>:<id>` ➔ `UrnType::Competency`
    *   `urn:levelup:knowledge:<domaine>:<id>` ➔ `UrnType::Knowledge`
    *   `urn:levelup:activity:<type>:<id>` ➔ `UrnType::Activity`
*   **Validation :** Regex de parsing stricte et méthodes d'extraction de segment (`domain()`, `entity_id()`).

### Tâche 1.2 — Cryptographie des Preuves (Evidence Verification)
*   **Fichier cible :** `shared/shared-kernel/src/lib.rs` (module `crypto`)
*   **Action :** Implémenter la fonction de signature et de validation d'une `Evidence` :
    *   Hachage SHA-256 de la charge utile (`learner_id` + `resource_urn` + `verified_at`).
    *   Fonction de vérification de signature utilisant une clé publique factice ou asymétrique (ED25519 ou RSA).

### Tâche 1.3 — Banc de Tests Unitaires
*   **Fichier cible :** `shared/shared-kernel/tests/kernel_tests.rs`
*   **Action :** Rédiger des tests unitaires complets couvrant :
    *   Les URNs valides et les cas d'erreur de formats.
    *   La falsification de signature de preuves (doit échouer).
    *   La sérialisation/désérialisation JSON des structures `Evidence` et `Metadata`.

---

## 3. Phase 2 : Persistance & Schémas (PostgreSQL & Neo4j)

*   **Dépendances requises :** Phase 1 terminée.
*   **Objectifs :** Structurer les bases de données et valider les accès.

### Tâche 2.1 — Configuration SQLx & Migrations (PostgreSQL)
*   **Action :** Initialiser SQLx dans `services/core-api/` :
    *   Créer le dossier `services/core-api/migrations/`.
    *   Y placer le fichier de migration `20260704000000_init_schema.sql` contenant les structures DDL définies dans notre Data Architecture.
*   **Validation :** Exécuter `sqlx database setup` dans le devcontainer pour valider le schéma.

### Tâche 2.2 — Contraintes & Indexation Graph (Neo4j)
*   **Action :** Créer le script `infrastructure/neo4j/seed.cypher` :
    *   Déclarer les contraintes d'unicité (ex: `CREATE CONSTRAINT FOR (c:Competency) REQUIRE c.id IS UNIQUE`).
    *   Insérer un graphe de compétences de test (ex: 3 compétences Linux hiérarchisées).

---

## 4. Phase 3 : Moteurs d'Autorisation (Rego) & IA (Python Broker)

*   **Dépendances requises :** Phase 2 terminée.
*   **Objectifs :** Valider les politiques d'accès et le tuteur IA socratique.

### Tâche 3.1 — Règles d'Accès Rego (Open Policy Agent)
*   **Action :** Créer le répertoire `infrastructure/authorization/` :
    *   Rédiger `policies.rego` :
        *   Règle par défaut : `default allow = false`.
        *   Règle 1 : Un utilisateur ne peut lire que son propre Portfolio ou celui des membres de son workspace s'il possède le rôle `Educator`.
        *   Règle 2 : L'écriture d'évaluations est restreinte aux `Educators`.

### Tâche 3.2 — POC AI Coach & Guardrails
*   **Action :** Créer `/services/ai-broker/` :
    *   Script d'orchestration LLM avec injection de prompt maïeutique.
    *   Implémenter le script de filtrage de sortie Regex interdisant les blocs de code en sortie.

---

## 5. Phase 4 : Logique Métier Rust (Core API)

*   **Dépendances requises :** Phase 1 à 3 terminées.
*   **Objectifs :** Coder la logique transactionnelle des Aggregate Roots.

### Tâche 4.1 — Implémentation de l'Aggregate Root `AssessmentSession`
*   **Action :** Écrire le code Rust modélisant la machine à états de la session d'évaluation (Open ➔ Submitted ➔ Closed / Failed).
*   **Validation :** Invariant interdisant la validation sans critères tous cochés.
