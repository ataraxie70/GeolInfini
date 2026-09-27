-- Seed data initial
-- Plateforme de pilotage de l’apprentissage
-- Cible : SQLite

BEGIN TRANSACTION;

-- ------------------------------------------------------------
-- 1) Utilisateur initial
-- ------------------------------------------------------------
INSERT INTO users (id, username, display_name, email, password_hash, role, is_active, created_at, updated_at)
VALUES
(1, 'oswiser9', 'oswiser9', NULL, NULL, 'owner', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 2) Paramètres système
-- ------------------------------------------------------------
INSERT INTO system_settings (id, setting_key, setting_value, value_type, description, updated_at)
VALUES
(1, 'timezone', 'Africa/Ouagadougou', 'string', 'Fuseau horaire principal', CURRENT_TIMESTAMP),
(2, 'ui_theme', 'dark', 'string', 'Thème visuel par défaut', CURRENT_TIMESTAMP),
(3, 'revision_interval_1', '1', 'integer', 'Révision J+1', CURRENT_TIMESTAMP),
(4, 'revision_interval_2', '7', 'integer', 'Révision J+7', CURRENT_TIMESTAMP),
(5, 'revision_interval_3', '30', 'integer', 'Révision J+30', CURRENT_TIMESTAMP),
(6, 'default_session_type', 'practice_guided', 'string', 'Type de séance par défaut', CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 3) Niveaux pédagogiques
-- ------------------------------------------------------------
INSERT INTO study_levels (id, code, name, description, sort_order)
VALUES
(1, 'FOUNDATION', 'Fondations', 'Comprendre les bases et le vocabulaire du sujet.', 1),
(2, 'GUIDED_PRACTICE', 'Pratique guidée', 'Exécuter sous cadre avec exercices contrôlés.', 2),
(3, 'PROJECT', 'Projets', 'Assembler les notions dans une réalisation concrète.', 3),
(4, 'VALIDATION_REVIEW', 'Validation / Révision', 'Vérifier la maîtrise et consolider les acquis.', 4);

-- ------------------------------------------------------------
-- 4) Types de séance
-- ------------------------------------------------------------
INSERT INTO session_types (id, code, name, description)
VALUES
(1, 'theory', 'Théorie', 'Séance de compréhension et de lecture active'),
(2, 'guided_practice', 'Pratique guidée', 'Séance d’exercices accompagnés'),
(3, 'autonomous_exercise', 'Exercice autonome', 'Séance de travail sans assistance'),
(4, 'review', 'Révision', 'Séance de consolidation des acquis'),
(5, 'test', 'Test', 'Séance d’évaluation'),
(6, 'project', 'Projet', 'Séance dédiée à un projet concret');

-- ------------------------------------------------------------
-- 5) Domaines
-- ------------------------------------------------------------
INSERT INTO domains (id, name, slug, description, sort_order, is_active, created_at, updated_at)
VALUES
(1, 'Développement système', 'developpement-systeme', 'Comprendre le fonctionnement interne des programmes et de la machine.', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Administration système', 'administration-systeme', 'Piloter, diagnostiquer et maintenir un système Linux.', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'DevOps / DevSecOps', 'devops-devsecops', 'Automatiser, déployer, sécuriser et superviser les systèmes.', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 6) Sous-domaines
-- ------------------------------------------------------------
INSERT INTO subdomains (id, domain_id, name, slug, description, sort_order, is_active, created_at, updated_at)
VALUES
-- Domaine 1
(1, 1, 'Architecture machine', 'architecture-machine', 'CPU, mémoire, stockage, exécution, système d’exploitation', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Fondations du C', 'fondations-c', 'Syntaxe, compilation, exécution, structure de projet C', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Mémoire et pointeurs', 'memoire-pointeurs', 'Pile, tas, pointeurs, tableaux, structures, allocation', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 1, 'Fichiers et E/S', 'fichiers-io', 'Lecture, écriture, buffers, fichiers texte et binaires', 4, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 1, 'Processus et exécution', 'processus-execution', 'Processus, signaux, fork, exec, communication', 5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 1, 'Débogage et outillage', 'debugging-outillage', 'gdb, valgrind, warnings, diagnostic d’erreurs', 6, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 1, 'Concurrence et réseau bas niveau', 'concurrence-reseau-bas-niveau', 'Threads, synchronisation, sockets, client/serveur', 7, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
-- Domaine 2
(8, 2, 'Bases Linux', 'bases-linux', 'Shell, arborescence, commandes, utilisateurs, permissions', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 2, 'Services et démarrage', 'services-demarrage', 'systemd, unités, services, démarrage automatique', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 2, 'Stockage', 'stockage', 'Partitions, montage, systèmes de fichiers, sauvegarde', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(11, 2, 'Réseau et diagnostic', 'reseau-diagnostic', 'IP, DNS, ports, routage, dépannage réseau', 4, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 2, 'Journalisation et sécurité', 'journalisation-securite', 'Logs, audit, durcissement, pare-feu, contrôle d’accès', 5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
-- Domaine 3
(13, 3, 'Git et versioning', 'git-versioning', 'Gestion de version, branches, merges, historique', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(14, 3, 'Automatisation', 'automatisation', 'Scripts, tâches répétitives, packaging, orchestration simple', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(15, 3, 'Conteneurs', 'conteneurs', 'Images, conteneurs, volumes, réseaux, composition', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(16, 3, 'CI/CD', 'ci-cd', 'Pipeline, build, tests, déploiement, contrôle qualité', 4, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(17, 3, 'Observabilité et sécurité', 'observabilite-securite', 'Logs, métriques, alertes, secrets, supervision', 5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 7) Sujets initiaux
-- ------------------------------------------------------------
INSERT INTO subjects (id, subdomain_id, study_level_id, title, slug, summary, estimated_minutes, difficulty, priority, status, is_locked, locked_reason, validation_required, created_at, updated_at)
VALUES
-- Domaine 1 : Architecture machine
(1, 1, 1, 'Architecture d’un ordinateur', 'architecture-ordinateur', 'Identifier CPU, mémoire, stockage et périphériques dans le fonctionnement global.', 120, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 1, 'Système d’exploitation et rôle du noyau', 'role-systeme-exploitation-noeud', 'Comprendre la fonction du système d’exploitation et du noyau.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 2, 'Cycle de vie d’un programme', 'cycle-vie-programme', 'Suivre le chemin d’un programme depuis le disque jusqu’à l’exécution.', 90, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Fondations C
(4, 2, 1, 'Syntaxe de base du C', 'syntaxe-base-c', 'Variables, types, fonctions, compilation et exécution.', 180, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 2, 2, 'Compilation et structure d’un projet C', 'compilation-projet-c', 'Compiler un programme proprement et organiser un projet simple.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Mémoire et pointeurs
(6, 3, 1, 'Pointeurs en C', 'pointeurs-c', 'Comprendre adresses, pointeurs, déréférencement et passage indirect.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 3, 2, 'Allocation dynamique', 'allocation-dynamique', 'Utiliser malloc, calloc, realloc et free correctement.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(8, 3, 2, 'Tableaux et structures', 'tableaux-structures', 'Travailler avec tableaux, structures et accès mémoire organisé.', 150, 3, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Fichiers et E/S
(9, 4, 2, 'Lecture et écriture de fichiers en C', 'lecture-ecriture-fichiers-c', 'Lire et écrire des fichiers texte et binaires.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 4, 2, 'Buffers et gestion des erreurs d’E/S', 'buffers-erreurs-io', 'Comprendre buffers, erreurs et retour des fonctions d’E/S.', 120, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Processus
(11, 5, 2, 'Processus et PID', 'processus-pid', 'Comprendre création, identification et état d’un processus.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 5, 2, 'fork, exec et signaux', 'fork-exec-signaux', 'Manipuler le lancement et le contrôle de processus.', 180, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Débogage
(13, 6, 2, 'Débogage avec gdb', 'debugg-gdb', 'Utiliser un débogueur pour observer et corriger un programme.', 120, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(14, 6, 2, 'Détection des fuites mémoire', 'fuites-memoire', 'Repérer et corriger les erreurs mémoire avec des outils adaptés.', 120, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 1 : Concurrence et réseau bas niveau
(15, 7, 3, 'Threads et synchronisation', 'threads-synchronisation', 'Comprendre la concurrence et la protection des ressources partagées.', 240, 5, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(16, 7, 3, 'Sockets TCP client/serveur', 'sockets-tcp-client-serveur', 'Créer une communication réseau simple en C.', 240, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 2 : Bases Linux
(17, 8, 1, 'Shell et navigation Linux', 'shell-navigation-linux', 'Utiliser le terminal, naviguer dans l’arborescence et manipuler les fichiers.', 120, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(18, 8, 1, 'Utilisateurs, groupes et permissions', 'utilisateurs-groupes-permissions', 'Gérer les accès et les droits correctement.', 150, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 2 : Services
(19, 9, 2, 'systemd et gestion des services', 'systemd-services', 'Démarrer, arrêter, activer et diagnostiquer un service.', 150, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 2 : Stockage
(20, 10, 2, 'Partitions, montage et systèmes de fichiers', 'partitions-montage-fs', 'Comprendre le stockage, le montage et l’organisation des volumes.', 180, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 2 : Réseau
(21, 11, 2, 'Réseau de base et diagnostic', 'reseau-base-diagnostic', 'Vérifier une connectivité, identifier un port et diagnostiquer une panne.', 150, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 2 : Sécurité
(22, 12, 2, 'Journalisation et durcissement de base', 'journalisation-durcissement', 'Lire les logs, repérer les incidents et appliquer les premières mesures de sécurité.', 150, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 3 : Git
(23, 13, 1, 'Git fondations', 'git-fondations', 'Créer un dépôt, versionner, brancher et fusionner correctement.', 120, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 3 : Automatisation
(24, 14, 2, 'Scripts shell pour automatiser', 'scripts-shell-automatisation', 'Automatiser des tâches répétitives avec des scripts robustes.', 150, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 3 : Conteneurs
(25, 15, 2, 'Notions de conteneurisation', 'notions-conteneurisation', 'Comprendre image, conteneur, volume et réseau de base.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 3 : CI/CD
(26, 16, 3, 'Pipeline CI/CD local', 'pipeline-cicd-local', 'Mettre en place un enchaînement build-test-déploiement local.', 240, 5, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Domaine 3 : Observabilité et sécurité
(27, 17, 3, 'Logs, métriques et alertes', 'logs-metriques-alertes', 'Construire une lecture claire de l’état d’un système ou d’un service.', 180, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(28, 17, 3, 'Gestion des secrets et contrôle d’accès', 'gestion-secrets-controle-acces', 'Sécuriser les accès et les informations sensibles.', 180, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 8) Dépendances entre sujets
-- ------------------------------------------------------------
INSERT INTO subject_prerequisites (id, subject_id, prerequisite_subject_id, is_required, created_at)
VALUES
(1, 2, 1, 1, CURRENT_TIMESTAMP),
(2, 3, 1, 1, CURRENT_TIMESTAMP),
(3, 3, 2, 1, CURRENT_TIMESTAMP),
(4, 4, 3, 1, CURRENT_TIMESTAMP),
(5, 5, 4, 1, CURRENT_TIMESTAMP),
(6, 6, 4, 1, CURRENT_TIMESTAMP),
(7, 7, 6, 1, CURRENT_TIMESTAMP),
(8, 8, 6, 1, CURRENT_TIMESTAMP),
(9, 9, 4, 1, CURRENT_TIMESTAMP),
(10, 10, 9, 1, CURRENT_TIMESTAMP),
(11, 11, 4, 1, CURRENT_TIMESTAMP),
(12, 12, 11, 1, CURRENT_TIMESTAMP),
(13, 13, 4, 1, CURRENT_TIMESTAMP),
(14, 14, 6, 1, CURRENT_TIMESTAMP),
(15, 15, 12, 1, CURRENT_TIMESTAMP),
(16, 16, 11, 1, CURRENT_TIMESTAMP),
(17, 17, 1, 1, CURRENT_TIMESTAMP),
(18, 18, 17, 1, CURRENT_TIMESTAMP),
(19, 19, 18, 1, CURRENT_TIMESTAMP),
(20, 20, 17, 1, CURRENT_TIMESTAMP),
(21, 21, 17, 1, CURRENT_TIMESTAMP),
(22, 22, 19, 1, CURRENT_TIMESTAMP),
(23, 23, 17, 1, CURRENT_TIMESTAMP),
(24, 24, 23, 1, CURRENT_TIMESTAMP),
(25, 25, 24, 1, CURRENT_TIMESTAMP),
(26, 26, 25, 1, CURRENT_TIMESTAMP),
(27, 27, 25, 1, CURRENT_TIMESTAMP),
(28, 28, 27, 1, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 9) Règles de révision
-- ------------------------------------------------------------
INSERT INTO revision_rules (id, name, days_after_study, days_after_validation, is_active, created_at, updated_at)
VALUES
(1, 'Révision J+1', 1, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Révision J+7', 7, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Révision J+30', 30, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Révision post-validation J+1', NULL, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'Révision post-validation J+7', NULL, 7, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 'Révision post-validation J+30', NULL, 30, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 10) Projets initiaux
-- ------------------------------------------------------------
INSERT INTO projects (id, user_id, name, slug, description, status, started_at, ended_at, created_at, updated_at)
VALUES
(1, 1, 'Mini-shell C', 'mini-shell-c', 'Construire un shell minimal en C pour consolider les pointeurs, processus et exécution.', 'idea', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Plateforme locale de suivi', 'plateforme-locale-suivi', 'Construire la plateforme de pilotage de l’apprentissage avec front, back et base locale.', 'active', CURRENT_TIMESTAMP, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Serveur local durci', 'serveur-local-durci', 'Configurer un serveur local avec journalisation, contrôle d’accès et sauvegarde.', 'idea', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO project_subjects (id, project_id, subject_id, is_required, created_at)
VALUES
(1, 1, 4, 1, CURRENT_TIMESTAMP),
(2, 1, 6, 1, CURRENT_TIMESTAMP),
(3, 1, 11, 1, CURRENT_TIMESTAMP),
(4, 1, 12, 1, CURRENT_TIMESTAMP),
(5, 2, 23, 1, CURRENT_TIMESTAMP),
(6, 2, 24, 1, CURRENT_TIMESTAMP),
(7, 2, 25, 1, CURRENT_TIMESTAMP),
(8, 2, 26, 1, CURRENT_TIMESTAMP),
(9, 3, 18, 1, CURRENT_TIMESTAMP),
(10, 3, 19, 1, CURRENT_TIMESTAMP),
(11, 3, 20, 1, CURRENT_TIMESTAMP),
(12, 3, 22, 1, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 11) Sécurité et notification de base
-- ------------------------------------------------------------
INSERT INTO notifications (id, user_id, type, title, message, related_entity_type, related_entity_id, status, scheduled_at, sent_at, read_at, created_at, updated_at)
VALUES
(1, 1, 'system', 'Démarrage du parcours', 'Les premiers sujets du socle sont prêts.', NULL, NULL, 'pending', CURRENT_TIMESTAMP, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'revision', 'Révision J+1 à prévoir', 'Les sujets récemment étudiés devront être revus selon la règle définie.', NULL, NULL, 'pending', CURRENT_TIMESTAMP, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 12) Journal initial
-- ------------------------------------------------------------
INSERT INTO activity_logs (id, user_id, action_type, entity_type, entity_id, details, created_at)
VALUES
(1, 1, 'seed_import', 'system', NULL, 'Import initial des données pédagogiques de base', CURRENT_TIMESTAMP);

COMMIT;
