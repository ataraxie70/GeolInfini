# Versioning Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-VERSIONING-001

---

# 1. Objet

Le **Versioning Context** (à ne pas confondre avec le *Versioning Shared Kernel* qui définit les structures et types communs de versionnement) est le Bounded Context de la couche Governance Layer responsable du stockage, du catalogage, de la comparaison sémantique et de l'orchestration des migrations de programmes lors de l'évolution des modèles de référence de LevelUP.

Il matérialise opérationnellement la gouvernance du cycle de vie des compétences et des parcours d'apprentissage.

---

# 2. Mission

Fournir un registre centralisé des versions de modèles pédagogiques, un moteur de comparaison de versions (diff) et un orchestrateur de migration capable de mettre à niveau de manière sécurisée les programmes actifs des apprenants en appliquant les règles de compatibilité sémantique.

---

# 3. Position dans l'écosystème

Le Versioning Context appartient à la **Governance Layer**.

Il enregistre l'immatriculation de chaque version officielle publiée par les contextes de conception (**Competency Context** et **Learning Context**) et pilote l'exécution des mises à niveau au sein du **Program Context** (espace personnel d'exécution).

---

# 4. Vision métier

L'amélioration continue (RMEF) implique des évolutions régulières du référentiel. Cependant, modifier la structure d'une compétence en cours d'apprentissage peut décourager l'apprenant ou corrompre ses preuves acquises. Fidèle aux valeurs de *Rigueur* et de *Discipline*, le Versioning Context garantit :
1.  **L'immatriculation cryptographique :** Chaque version de modèle pédagogique possède une signature SHA-256 unique de sa structure. Aucune modification "silencieuse" n'est possible.
2.  **L'évaluation de l'impact (Diff) :** Le système calcule sémantiquement l'impact des modifications (Patch, Mineur, Majeur) pour avertir les concepteurs des ruptures de compatibilité.
3.  **La préservation des acquis (Equivalence Maps) :** Lors d'une transition majeure de version, le système s'appuie sur des tables d'équivalences de compétences validées pour garantir qu'aucune preuve d'apprentissage légitime n'est perdue.

---

# 5. Responsabilités

Le Versioning Context est responsable de :

*   gérer le registre des versions immuables de modèles (`Model Version Records`) ;
*   calculer les différences sémantiques entre deux versions d'un même modèle (Semantic Diff Engine) ;
*   gérer les tables de correspondance et de conversion d'acquis (`Equivalence Maps`) ;
*   orchestrer les tâches asynchrones de mise à niveau de masse des programmes des apprenants (`Migration Jobs`) ;
*   gérer le cycle de transition des états de modèles (Draft ➔ Published ➔ Deprecated ➔ Archived).

Il n'est jamais responsable :
*   de concevoir les compétences ou parcours (responsabilité des `Competency` et `Learning Contexts`) ;
*   de modifier directement les données d'activités quotidiennes (responsabilité du `Activity Context`).

---

# 6. Ubiquitous Language

## Model Version Record
Enregistrement officiel d'une version de modèle pédagogique (Reference Model, Learning Blueprint) contenant son code sémantique de version, son statut et l'empreinte SHA-256 de sa structure.

## Model Diff
Rapport d'analyse identifiant les ajouts, suppressions et modifications structurelles entre deux versions (ex: ajout d'une unité, suppression d'un prérequis).

## Equivalence Map
Table de conversion approuvée par les concepteurs traduisant les validations de compétences et connaissances d'une ancienne version vers une nouvelle version (ex: la compétence `linux:bash-v1` équivaut à `linux:scripting-v2`).

## Migration Job
Tâche système asynchrone gérant la mise à niveau progressive d'un lot de programmes d'apprenants (`Personal Programs`) vers une nouvelle version du modèle de référence.

---

# 7. Modèle métier

```text
Competency/Learning Contexts ──► publient ──┐
                                            ▼
                               [ Model Version Record ] (SHA-256)
                                            │
                                            ▼
                                 [ Semantic Diff Engine ] ➔ Évalue le type d'impact
                                            │
                             ┌──────────────┴──────────────┐
                             ▼ (Si Majeur / Breaking)      ▼ (Si Patch / Mineur)
                    [ Equivalence Map ]               Mise à niveau transparente
                             │
                             ▼
                     [ Migration Job ] ➔ Applique aux apprenants
```

---

# 8. Principes métier

## Principe 1 — Immutabilité des enregistrements de versions
Une version enregistrée dans le registre avec le statut de publication est définitive et en lecture seule.

## Principe 2 — Consentement pour le changement majeur
Les programmes des apprenants ne subissent jamais de mise à niveau vers une version majeure (rupture de compatibilité) sans une validation explicite de l'apprenant, qui accepte les termes de la `EquivalenceMap`.

## Principe 3 — Non-altération des preuves physiques
La migration d'un programme vers une nouvelle version adapte sa progression logique, mais ne détruit jamais l'historique physique des preuves d'apprentissage (`Evidences`) accumulées dans son Portfolio.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **ModelVersionRecord :** Racine d'agrégat modélisant l'immatriculation d'un modèle et l'ensemble de ses versions historiques publiées.
*   **MigrationJob :** Racine d'agrégat planifiant et supervisant l'exécution asynchrone des mises à jour des programmes utilisateurs.

## 9.2 Entités
*   **EquivalenceMap :** Table de correspondance sémantique des validations.

## 9.3 Value Objects
*   **RecordId / JobId :** Identifiants uniques.
*   **VersionString :** Chaîne de caractères SemVer canonique.
*   **DiffReport :** Détail sémantique des écarts de structures.
*   **MigrationStatus :** États du job (`Pending`, `Running`, `Completed`, `Failed`).

## 9.4 Domain Services
*   **SemanticDiffEngine :** Moteur comparant les structures de graphes de compétences pour qualifier l'impact de la modification (PATCH, MINOR, MAJOR).
*   **MigrationOrchestrator :** Service coordonnant la mise à niveau des instances de programmes au sein du Program Context.

## 9.5 Domain Events
*   **ModelVersionRegistered :** Enregistrement d'une nouvelle version de modèle.
*   **EquivalenceMapDefined :** Publication d'une table d'équivalences de migration.
*   **MigrationJobScheduled :** Planification d'un job de migration.
*   **ProgramMigrated :** Mise à niveau réussie d'un programme d'apprenant unitaire.
*   **ModelVersionArchived :** Retrait définitif d'une version de modèle du système.

---

# 10. Invariants

1.  Un `MigrationJob` portant sur une transition de version majeure exige l'association d'une `EquivalenceMap` validée pour ce couple de versions.
2.  L'empreinte cryptographique (`SHA-256`) calculée sur la structure d'un modèle doit correspondre à celle enregistrée dans le `ModelVersionRecord` pour considérer le modèle comme intègre.
3.  Une version de modèle marquée comme `Archived` ne peut pas être sélectionnée comme cible pour une nouvelle inscription de programme personnel.

---

# 11. Relations avec les autres Bounded Contexts

*   **Competency & Learning Contexts :** Envoient les définitions de modèles et de structures de parcours pour enregistrement et diff.
*   **Program Context :** Reçoit les ordres de mise à niveau de versions et de recalcul des progressions lors de l'exécution du `MigrationJob`.
*   **Audit Context :** Enregistre la traçabilité des exécutions de migrations de masse et d'immatriculation de versions.

---

# 12. Décisions architecturales

Le Versioning Context fait office de régulateur de cycle de vie. Les diffs sémantiques de modèles s'exécutent en mémoire via des comparaisons d'arbres ou de graphes (Directed Acyclic Graphs - DAG). 

Le traitement asynchrone des `MigrationJobs` est géré par une file de tâches d'arrière-plan (message queue), évitant tout ralentissement ou timeout des serveurs d'API web lors de la mise à niveau de milliers d'apprenants.
