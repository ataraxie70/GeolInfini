# Schéma de base de données complet
## Plateforme de pilotage de l’apprentissage

### 1. Objectif

Ce schéma définit la structure de stockage de la plateforme. Il doit permettre de gérer :
- les domaines et sujets d’apprentissage ;
- les prérequis ;
- les séances ;
- les exercices ;
- les validations ;
- les révisions ;
- les projets ;
- les notifications ;
- les historiques d’activité ;
- les paramètres système.

Le schéma est pensé pour **SQLite en première version**, tout en restant compatible avec une migration future vers PostgreSQL.

---

## 2. Principes de modélisation

### 2.1 Normalisation
Le modèle doit éviter les duplications inutiles et séparer correctement :
- les contenus d’apprentissage ;
- le suivi d’exécution ;
- les validations ;
- les rappels ;
- les journaux.

### 2.2 Traçabilité
Toute action importante doit pouvoir être historisée.

### 2.3 Extensibilité
Le modèle doit permettre d’ajouter :
- de nouveaux domaines ;
- de nouveaux types de séances ;
- des règles de progression plus fines ;
- des projets plus complexes ;
- des canaux de notification supplémentaires.

### 2.4 Cohérence
Chaque sujet ne doit avoir qu’un état principal à un instant donné.

---

## 3. Entités principales

Le modèle repose sur les entités suivantes :

1. `users`
2. `domains`
3. `subdomains`
4. `subjects`
5. `subject_prerequisites`
6. `study_levels`
7. `session_types`
8. `learning_sessions`
9. `session_subjects`
10. `session_notes`
11. `validations`
12. `validation_items`
13. `revision_rules`
14. `revisions`
15. `projects`
16. `project_subjects`
17. `project_milestones`
18. `notifications`
19. `activity_logs`
20. `system_settings`
21. `attachments`

---

## 4. Description détaillée des tables

## 4.1 users
Cette table gère l’utilisateur de la plateforme.

### Champs
- `id` : identifiant unique.
- `username` : nom d’utilisateur.
- `display_name` : nom affiché.
- `email` : adresse email optionnelle.
- `password_hash` : mot de passe chiffré si authentification locale.
- `role` : rôle applicatif.
- `is_active` : état du compte.
- `created_at` : date de création.
- `updated_at` : date de mise à jour.

### Rôle
Même si l’usage initial est personnel, cette table prépare l’évolution vers une gestion plus structurée.

---

## 4.2 domains
Représente les grands domaines d’apprentissage.

### Champs
- `id`
- `name`
- `slug`
- `description`
- `sort_order`
- `is_active`
- `created_at`
- `updated_at`

### Exemples
- Développement système
- Administration système
- DevOps / DevSecOps

---

## 4.3 subdomains
Sous-division d’un domaine.

### Champs
- `id`
- `domain_id` (FK)
- `name`
- `slug`
- `description`
- `sort_order`
- `is_active`
- `created_at`
- `updated_at`

### Exemple
Pour le domaine Développement système :
- architecture machine ;
- mémoire ;
- fichiers ;
- processus ;
- appels système ;
- concurrence ;
- réseau bas niveau.

---

## 4.4 study_levels
Niveaux de progression pédagogique.

### Champs
- `id`
- `code`
- `name`
- `description`
- `sort_order`

### Valeurs suggérées
- `FOUNDATION`
- `GUIDED_PRACTICE`
- `PROJECT`
- `VALIDATION_REVIEW`

---

## 4.5 subjects
Sujet individuel d’apprentissage.

### Champs
- `id`
- `subdomain_id` (FK)
- `study_level_id` (FK)
- `title`
- `slug`
- `summary`
- `estimated_minutes`
- `difficulty` (1 à 5)
- `priority` (1 à 5)
- `status`
- `is_locked`
- `locked_reason`
- `validation_required`
- `created_at`
- `updated_at`

### Statuts possibles
- `to_do`
- `in_progress`
- `to_review`
- `validated`
- `blocked`

---

## 4.6 subject_prerequisites
Table de liaison entre sujets et prérequis.

### Champs
- `id`
- `subject_id` (FK)
- `prerequisite_subject_id` (FK)
- `is_required`
- `created_at`

### Rôle
Permet de dire qu’un sujet dépend d’un ou plusieurs autres sujets.

### Exemple
Avant `malloc()` en C, il faut comprendre les pointeurs et les bases mémoire.

---

## 4.7 session_types
Type de séance.

### Champs
- `id`
- `code`
- `name`
- `description`

### Valeurs possibles
- théorie
- pratique guidée
- exercice autonome
- révision
- test
- projet

---

## 4.8 learning_sessions
Séance d’apprentissage.

### Champs
- `id`
- `user_id` (FK)
- `session_type_id` (FK)
- `started_at`
- `ended_at`
- `planned_minutes`
- `actual_minutes`
- `main_objective`
- `result_status`
- `difficulty_level`
- `notes`
- `created_at`
- `updated_at`

### Statuts possibles
- `planned`
- `ongoing`
- `completed`
- `abandoned`

---

## 4.9 session_subjects
Association entre séance et sujet.

### Champs
- `id`
- `session_id` (FK)
- `subject_id` (FK)
- `focus_ratio` (optionnel)
- `created_at`

### Rôle
Une séance peut couvrir un sujet principal et éventuellement un sujet secondaire.

---

## 4.10 session_notes
Notes détaillées prises pendant ou après une séance.

### Champs
- `id`
- `session_id` (FK)
- `subject_id` (FK, nullable)
- `note_type`
- `content`
- `created_at`
- `updated_at`

### Types possibles
- résumé
- erreur
- correction
- idée
- rappel
- observation

---

## 4.11 validations
Validation d’un sujet.

### Champs
- `id`
- `user_id` (FK)
- `subject_id` (FK)
- `session_id` (FK, nullable)
- `status`
- `validated_at`
- `review_due_at`
- `score`
- `remarks`
- `created_at`
- `updated_at`

### Statuts possibles
- `validated`
- `rejected`
- `pending`
- `partial`

---

## 4.12 validation_items
Critères de validation détaillés.

### Champs
- `id`
- `validation_id` (FK)
- `criterion_code`
- `criterion_label`
- `is_passed`
- `remarks`
- `created_at`

### Critères de base
- expliquer sans support ;
- reproduire seul ;
- réappliquer dans un cas nouveau ;
- corriger une erreur ;
- produire un résumé.

---

## 4.13 revision_rules
Règles de génération des révisions.

### Champs
- `id`
- `name`
- `days_after_study`
- `days_after_validation`
- `is_active`
- `created_at`
- `updated_at`

### Exemples
- 1 jour
- 7 jours
- 30 jours

---

## 4.14 revisions
Révision programmée ou effectuée.

### Champs
- `id`
- `user_id` (FK)
- `subject_id` (FK)
- `validation_id` (FK, nullable)
- `revision_rule_id` (FK, nullable)
- `due_at`
- `completed_at`
- `status`
- `priority`
- `notes`
- `created_at`
- `updated_at`

### Statuts possibles
- `pending`
- `done`
- `overdue`
- `cancelled`

---

## 4.15 projects
Projet concret lié à l’apprentissage.

### Champs
- `id`
- `user_id` (FK)
- `name`
- `slug`
- `description`
- `status`
- `started_at`
- `ended_at`
- `created_at`
- `updated_at`

### Statuts possibles
- `idea`
- `active`
- `paused`
- `completed`
- `archived`

---

## 4.16 project_subjects
Lien entre projet et sujets requis.

### Champs
- `id`
- `project_id` (FK)
- `subject_id` (FK)
- `is_required`
- `created_at`

### Rôle
Permet d’indiquer quels sujets doivent être validés pour avancer dans un projet.

---

## 4.17 project_milestones
Étapes du projet.

### Champs
- `id`
- `project_id` (FK)
- `title`
- `description`
- `status`
- `due_at`
- `completed_at`
- `created_at`
- `updated_at`

---

## 4.18 notifications
Rappels et alertes.

### Champs
- `id`
- `user_id` (FK)
- `type`
- `title`
- `message`
- `related_entity_type`
- `related_entity_id`
- `status`
- `scheduled_at`
- `sent_at`
- `read_at`
- `created_at`
- `updated_at`

### Types possibles
- séance ;
- révision ;
- validation ;
- blocage ;
- projet ;
- système.

---

## 4.19 activity_logs
Journal d’activité général.

### Champs
- `id`
- `user_id` (FK)
- `action_type`
- `entity_type`
- `entity_id`
- `details`
- `created_at`

### Exemples d’actions
- création ;
- modification ;
- suppression ;
- validation ;
- révision ;
- clôture ;
- blocage.

---

## 4.20 system_settings
Paramètres globaux de la plateforme.

### Champs
- `id`
- `setting_key`
- `setting_value`
- `value_type`
- `description`
- `updated_at`

### Exemples
- langue ;
- fuseau horaire ;
- durée de révision ;
- fréquence de sauvegarde ;
- mode sombre ;
- seuil de progression.

---

## 4.21 attachments
Fichiers liés aux séances, validations ou projets.

### Champs
- `id`
- `user_id` (FK)
- `entity_type`
- `entity_id`
- `file_name`
- `file_path`
- `mime_type`
- `file_size`
- `created_at`

### Rôle
Permet d’associer :
- captures ;
- documents ;
- exports ;
- schémas ;
- fichiers de projet.

---

## 5. Relations principales

### 5.1 Structure hiérarchique
- `domains` 1 → N `subdomains`
- `subdomains` 1 → N `subjects`
- `subjects` N ↔ N `subjects` via `subject_prerequisites`

### 5.2 Suivi pédagogique
- `learning_sessions` 1 → N `session_notes`
- `learning_sessions` N ↔ N `subjects` via `session_subjects`
- `subjects` 1 → N `validations`
- `validations` 1 → N `validation_items`
- `subjects` 1 → N `revisions`

### 5.3 Projets
- `projects` N ↔ N `subjects` via `project_subjects`
- `projects` 1 → N `project_milestones`

### 5.4 Traçabilité
- `users` 1 → N `activity_logs`
- `users` 1 → N `notifications`
- `users` 1 → N `attachments`

---

## 6. Contraintes de cohérence

### 6.1 Unicité
- un `slug` doit être unique dans son contexte logique ;
- un sujet ne doit pas être dupliqué dans un même sous-domaine ;
- une règle de révision ne doit pas avoir le même nom deux fois.

### 6.2 Référentiel des statuts
Les statuts doivent rester limités et contrôlés pour éviter les incohérences.

### 6.3 Intégrité référentielle
Toute suppression d’entité liée à des enfants doit être gérée par règle explicite :
- interdiction ;
- cascade contrôlée ;
- archivage.

### 6.4 Historisation
Les éléments importants ne doivent pas être supprimés brutalement s’ils ont une valeur de trace. L’archivage est préférable à l’effacement.

---

## 7. Index recommandés

### Index essentiels
- `domains.slug`
- `subdomains.domain_id`
- `subjects.subdomain_id`
- `subjects.status`
- `subject_prerequisites.subject_id`
- `learning_sessions.user_id`
- `learning_sessions.started_at`
- `validations.subject_id`
- `validations.validated_at`
- `revisions.subject_id`
- `revisions.due_at`
- `projects.status`
- `notifications.status`
- `activity_logs.created_at`

---

## 8. Schéma relationnel synthétique

```text
users
  ├── learning_sessions
  ├── validations
  ├── revisions
  ├── projects
  ├── notifications
  ├── activity_logs
  └── attachments

domains
  └── subdomains
        └── subjects
              ├── subject_prerequisites (auto-référence sujets)
              ├── learning_sessions via session_subjects
              ├── validations
              ├── revisions
              └── project_subjects

learning_sessions
  ├── session_subjects
  └── session_notes

validations
  └── validation_items

projects
  ├── project_subjects
  └── project_milestones

revision_rules
  └── revisions
```

---

## 9. Version MVP recommandée

Pour la première version utile, seules les tables suivantes sont strictement nécessaires :
- `users`
- `domains`
- `subdomains`
- `subjects`
- `subject_prerequisites`
- `study_levels`
- `session_types`
- `learning_sessions`
- `session_subjects`
- `session_notes`
- `validations`
- `validation_items`
- `revision_rules`
- `revisions`
- `projects`
- `project_subjects`
- `notifications`
- `activity_logs`
- `system_settings`

Les tables `project_milestones` et `attachments` peuvent être ajoutées ensuite si le besoin se confirme.

---

## 10. Recommandation finale

Le schéma est volontairement structuré autour de la discipline pédagogique :
- contenu ;
- dépendance ;
- séance ;
- validation ;
- révision ;
- projet ;
- historique.

C’est cette chaîne qui doit rester stable. Toute extension future doit s’y greffer sans casser la logique centrale.

