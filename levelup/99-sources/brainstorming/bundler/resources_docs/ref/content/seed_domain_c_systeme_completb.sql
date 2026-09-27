-- Seed SQL - Domaine C / Développement système
-- Cible : SQLite
-- Remarque : ce seed suppose que les tables suivantes existent :
-- domains, subdomains, study_levels, session_types, subjects,
-- subject_prerequisites, concepts, resources, exercises,
-- validation_criteria, revision_rules, projects, project_subjects,
-- revision_items, activity_logs

BEGIN TRANSACTION;

-- ------------------------------------------------------------
-- 1) Domaine
-- ------------------------------------------------------------
INSERT INTO domains (id, name, slug, description, sort_order, is_active, created_at, updated_at)
VALUES
(1, 'Développement système', 'developpement-systeme', 'Comprendre le fonctionnement interne des programmes et de la machine.', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 2) Niveaux pédagogiques
-- ------------------------------------------------------------
INSERT INTO study_levels (id, code, name, description, sort_order)
VALUES
(1, 'FOUNDATION', 'Fondations', 'Comprendre les bases et le vocabulaire du sujet.', 1),
(2, 'GUIDED_PRACTICE', 'Pratique guidée', 'Exécuter sous cadre avec exercices contrôlés.', 2),
(3, 'PROJECT', 'Projets', 'Assembler les notions dans une réalisation concrète.', 3),
(4, 'VALIDATION_REVIEW', 'Validation / Révision', 'Vérifier la maîtrise et consolider les acquis.', 4);

-- ------------------------------------------------------------
-- 3) Types de séance
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
-- 4) Sous-domaines
-- ------------------------------------------------------------
INSERT INTO subdomains (id, domain_id, name, slug, description, sort_order, is_active, created_at, updated_at)
VALUES
(1, 1, 'Architecture machine', 'architecture-machine', 'CPU, mémoire, stockage, exécution, système d’exploitation', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Fondations du C', 'fondations-c', 'Syntaxe, compilation, exécution, structure de projet C', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Mémoire et pointeurs', 'memoire-pointeurs', 'Pile, tas, pointeurs, tableaux, structures, allocation', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 1, 'Fichiers et E/S', 'fichiers-io', 'Lecture, écriture, buffers, fichiers texte et binaires', 4, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 1, 'Processus et exécution', 'processus-execution', 'Processus, signaux, fork, exec, communication', 5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 1, 'Débogage et outillage', 'debugging-outillage', 'gdb, valgrind, warnings, diagnostic d’erreurs', 6, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 1, 'Concurrence et réseau bas niveau', 'concurrence-reseau-bas-niveau', 'Threads, synchronisation, sockets, client/serveur', 7, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 5) Sujets
-- ------------------------------------------------------------
INSERT INTO subjects (id, subdomain_id, study_level_id, title, slug, summary, estimated_minutes, difficulty, priority, status, is_locked, locked_reason, validation_required, created_at, updated_at)
VALUES
(1, 1, 1, 'Architecture d’un ordinateur', 'architecture-ordinateur', 'Identifier CPU, mémoire, stockage et périphériques dans le fonctionnement global.', 120, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 1, 'Système d’exploitation et rôle du noyau', 'role-systeme-exploitation-noeud', 'Comprendre la fonction du système d’exploitation et du noyau.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 2, 'Cycle de vie d’un programme', 'cycle-vie-programme', 'Suivre le chemin d’un programme depuis le disque jusqu’à l’exécution.', 90, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 2, 1, 'Syntaxe de base du C', 'syntaxe-base-c', 'Variables, types, fonctions, compilation et exécution.', 180, 2, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 2, 2, 'Compilation et structure d’un projet C', 'compilation-projet-c', 'Compiler un programme proprement et organiser un projet simple.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 3, 1, 'Pointeurs en C', 'pointeurs-c', 'Comprendre adresses, pointeurs, déréférencement et passage indirect.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 3, 2, 'Allocation dynamique', 'allocation-dynamique', 'Utiliser malloc, calloc, realloc et free correctement.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(8, 3, 2, 'Tableaux et structures', 'tableaux-structures', 'Travailler avec tableaux, structures et accès mémoire organisé.', 150, 3, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 4, 2, 'Lecture et écriture de fichiers en C', 'lecture-ecriture-fichiers-c', 'Lire et écrire des fichiers texte et binaires.', 180, 4, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 4, 2, 'Buffers et gestion des erreurs d’E/S', 'buffers-erreurs-io', 'Comprendre buffers, erreurs et retour des fonctions d’E/S.', 120, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(11, 5, 2, 'Processus et PID', 'processus-pid', 'Comprendre création, identification et état d’un processus.', 120, 3, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 5, 2, 'fork, exec et signaux', 'fork-exec-signaux', 'Manipuler le lancement et le contrôle de processus.', 180, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(13, 6, 2, 'Débogage avec gdb', 'debugg-gdb', 'Utiliser un débogueur pour observer et corriger un programme.', 120, 4, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(14, 6, 2, 'Détection des fuites mémoire', 'fuites-memoire', 'Repérer et corriger les erreurs mémoire avec des outils adaptés.', 120, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(15, 7, 3, 'Threads et synchronisation', 'threads-synchronisation', 'Comprendre la concurrence et la protection des ressources partagées.', 240, 5, 4, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(16, 7, 3, 'Sockets TCP client/serveur', 'sockets-tcp-client-serveur', 'Créer une communication réseau simple en C.', 240, 5, 5, 'to_do', 0, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 6) Dépendances entre sujets
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
(16, 16, 11, 1, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 7) Concepts pédagogiques
-- ------------------------------------------------------------
INSERT INTO concepts (id, subject_id, name, description, difficulty, order_index)
VALUES
-- Sujet 1
(1, 1, 'CPU', 'Unité centrale de traitement et exécution d’instructions', 2, 1),
(2, 1, 'RAM', 'Mémoire volatile utilisée pendant l’exécution', 2, 2),
(3, 1, 'Stockage', 'Support persistant des programmes et données', 2, 3),
(4, 1, 'Bus', 'Canaux de circulation des données et signaux', 3, 4),
(5, 1, 'Cycle d’instruction', 'Fetch, decode, execute', 3, 5),
-- Sujet 2
(6, 2, 'Noyau', 'Cœur du système d’exploitation', 3, 1),
(7, 2, 'Gestion des processus', 'Organisation de l’exécution des programmes', 3, 2),
(8, 2, 'Gestion mémoire', 'Allocation et protection mémoire par l’OS', 4, 3),
-- Sujet 3
(9, 3, 'Compilation', 'Transformation du code source en binaire', 3, 1),
(10, 3, 'Linking', 'Association des objets compilés', 4, 2),
(11, 3, 'Loader', 'Chargement du programme en mémoire', 3, 3),
-- Sujet 4
(12, 4, 'Types de base', 'int, char, float, double', 2, 1),
(13, 4, 'Variables', 'Nom associé à une zone mémoire', 2, 2),
(14, 4, 'Fonctions', 'Regroupement logique d’instructions', 2, 3),
-- Sujet 5
(15, 5, 'Flags de compilation', 'Options du compilateur', 3, 1),
(16, 5, 'Organisation des fichiers', 'Séparation source / headers / build', 3, 2),
-- Sujet 6
(17, 6, 'Adresse mémoire', 'Localisation d’une donnée en mémoire', 3, 1),
(18, 6, 'Déclaration de pointeur', 'Variable contenant une adresse', 3, 2),
(19, 6, 'Déréférencement', 'Accès à la donnée pointée', 4, 3),
(20, 6, 'Arithmétique des pointeurs', 'Déplacement selon le type pointé', 4, 4),
(21, 6, 'Pointeur vs tableau', 'Différence de nature et de comportement', 4, 5),
-- Sujet 7
(22, 7, 'malloc', 'Allocation dynamique', 4, 1),
(23, 7, 'free', 'Libération de mémoire', 4, 2),
(24, 7, 'Fragmentation', 'Dispersion des blocs mémoire', 5, 3),
(25, 7, 'Dangling pointer', 'Pointeur devenu invalide', 5, 4),
-- Sujet 8
(26, 8, 'Tableau', 'Séquence de données homogènes', 3, 1),
(27, 8, 'Structure', 'Agrégation de champs de types différents', 3, 2),
(28, 8, 'Accès indexé', 'Accès par position', 3, 3),
-- Sujet 9
(29, 9, 'FILE*', 'Flux haut niveau de la bibliothèque standard', 4, 1),
(30, 9, 'fopen/fclose', 'Ouverture et fermeture de fichiers', 4, 2),
(31, 9, 'Lecture/écriture', 'Manipulation du contenu', 4, 3),
-- Sujet 10
(32, 10, 'Buffer', 'Zone tampon temporaire', 4, 1),
(33, 10, 'EOF', 'Fin de fichier', 3, 2),
(34, 10, 'Erreurs d’E/S', 'Retours d’échec et gestion', 4, 3),
-- Sujet 11
(35, 11, 'PID', 'Identifiant de processus', 3, 1),
(36, 11, 'État d’un processus', 'running, sleeping, zombie', 3, 2),
(37, 11, 'Parent/enfant', 'Relation hiérarchique entre processus', 3, 3),
-- Sujet 12
(38, 12, 'fork', 'Création d’un processus enfant', 5, 1),
(39, 12, 'exec', 'Remplacement du programme courant', 5, 2),
(40, 12, 'Signaux', 'Communication asynchrone avec le processus', 5, 3),
-- Sujet 13
(41, 13, 'Breakpoints', 'Points d’arrêt', 4, 1),
(42, 13, 'Stack trace', 'Pile d’exécution observée', 4, 2),
(43, 13, 'Inspection mémoire', 'Lecture de variables et adresses', 4, 3),
-- Sujet 14
(44, 14, 'Valgrind', 'Détection des erreurs mémoire', 5, 1),
(45, 14, 'Fuite mémoire', 'Mémoire non libérée', 5, 2),
(46, 14, 'Double free', 'Libération répétée d’un bloc', 5, 3),
-- Sujet 15
(47, 15, 'pthread', 'API de threads POSIX', 5, 1),
(48, 15, 'Race condition', 'Concurrence non protégée', 5, 2),
(49, 15, 'Mutex', 'Verrou de synchronisation', 5, 3),
-- Sujet 16
(50, 16, 'socket', 'Point de communication réseau', 5, 1),
(51, 16, 'bind/listen/accept', 'Cycle serveur TCP', 5, 2),
(52, 16, 'Client TCP', 'Connexion à un serveur', 5, 3);

-- ------------------------------------------------------------
-- 8) Ressources primaires
-- ------------------------------------------------------------
INSERT INTO resources (id, subject_id, type, title, author, reference, url, is_primary_source)
VALUES
(1, 1, 'book', 'Computer Systems: A Programmer’s Perspective', 'Randal E. Bryant, David R. O’Hallaron', 'CSAPP', NULL, 1),
(2, 1, 'manual', 'Intel 64 and IA-32 Architectures Software Developer’s Manual', 'Intel', 'Intel SDM', NULL, 1),
(3, 2, 'manual', 'man uname / man proc / man syscalls', 'Linux man-pages', 'man-pages project', NULL, 1),
(4, 3, 'manual', 'gcc documentation', 'GNU Project', 'gcc docs', NULL, 1),
(5, 4, 'standard', 'ISO/IEC 9899', 'ISO', 'C Standard', NULL, 1),
(6, 5, 'manual', 'man gcc / man make', 'GNU Project', 'gcc/make manuals', NULL, 1),
(7, 6, 'manual', 'man pointer related C documentation', 'Linux man-pages', 'C pointer semantics', NULL, 1),
(8, 7, 'manual', 'man malloc / man free', 'GNU Project', 'glibc malloc', NULL, 1),
(9, 9, 'manual', 'man fopen / man fread / man fwrite', 'Linux man-pages', 'stdio docs', NULL, 1),
(10, 11, 'manual', 'man fork / man wait / man execve', 'Linux man-pages', 'process docs', NULL, 1),
(11, 13, 'manual', 'gdb manual', 'GNU Project', 'gdb docs', NULL, 1),
(12, 14, 'manual', 'Valgrind User Manual', 'Valgrind Project', 'Valgrind docs', NULL, 1),
(13, 15, 'manual', 'POSIX Threads Programming', 'The Open Group', 'pthread docs', NULL, 1),
(14, 16, 'manual', 'man socket / man bind / man listen / man accept', 'Linux man-pages', 'socket docs', NULL, 1);

-- ------------------------------------------------------------
-- 9) Exercices
-- ------------------------------------------------------------
INSERT INTO exercises (id, subject_id, type, title, description, expected_output, difficulty, solution_reference)
VALUES
(1, 1, 'guided', 'Draw the execution chain', 'Trace CPU, RAM and storage interaction on paper or in notes', 'A correct diagram of the execution path', 2, NULL),
(2, 1, 'autonomous', 'Compare RAM and cache', 'Write a short comparison with at least 5 distinctions', 'A structured comparison', 3, NULL),
(3, 2, 'guided', 'Explain the kernel role', 'Describe what the OS kernel does in execution, memory and process control', 'Clear explanation with examples', 3, NULL),
(4, 3, 'guided', 'Compile and inspect a binary', 'Compile a simple C program and inspect the executable with file and ldd', 'Successful build and binary inspection', 3, NULL),
(5, 4, 'guided', 'Write a basic C program', 'Declare variables, use functions, compile and run', 'Program compiles and prints expected output', 2, NULL),
(6, 4, 'autonomous', 'Type and sizeof exploration', 'Check memory sizes of basic types and write observations', 'Documented results', 2, NULL),
(7, 6, 'guided', 'Pointer swap', 'Write a swap function using pointers', 'Values are exchanged correctly', 4, NULL),
(8, 6, 'autonomous', 'Traverse an array with pointers', 'Use only pointer arithmetic to iterate through an array', 'Array is traversed without index syntax', 4, NULL),
(9, 7, 'guided', 'Dynamic array management', 'Allocate, fill, resize and free a dynamic array', 'No memory leaks', 4, NULL),
(10, 7, 'challenge', 'Fix a leak', 'Repair a small program leaking memory and validate with Valgrind', 'Leak removed and validated', 5, NULL),
(11, 9, 'guided', 'Read a text file', 'Open a file and read it line by line', 'Content displayed correctly', 4, NULL),
(12, 10, 'guided', 'Handle I/O errors', 'Check return values and detect EOF/error situations', 'Correct error handling path', 4, NULL),
(13, 11, 'guided', 'Identify a process', 'Use system tools to find PID, parent and state', 'Process identified and described', 3, NULL),
(14, 12, 'challenge', 'Fork and exec chain', 'Create a child process and launch a command', 'Parent and child behave correctly', 5, NULL),
(15, 13, 'guided', 'Use breakpoints in gdb', 'Stop on a function and inspect variables', 'Variables inspected and understood', 4, NULL),
(16, 14, 'challenge', 'Detect memory faults', 'Run a faulty program and identify memory errors', 'Faults diagnosed and corrected', 5, NULL),
(17, 15, 'challenge', 'Protect a shared counter', 'Implement a multithreaded counter with mutex protection', 'No race condition', 5, NULL),
(18, 16, 'challenge', 'TCP echo server', 'Build a simple TCP echo server and client', 'Client/server exchange data successfully', 5, NULL);

-- ------------------------------------------------------------
-- 10) Critères de validation
-- ------------------------------------------------------------
INSERT INTO validation_criteria (id, subject_id, type, description, required_score)
VALUES
(1, 1, 'explain', 'Expliquer CPU, RAM et stockage sans support', 80),
(2, 1, 'diagram', 'Dessiner le cycle d’instruction', 80),
(3, 2, 'explain', 'Expliquer le noyau, les processus et la mémoire', 80),
(4, 3, 'explain', 'Décrire compilation, linking et loading', 80),
(5, 4, 'code', 'Écrire un programme C simple sans aide', 80),
(6, 5, 'code', 'Compiler et organiser un projet C simple', 80),
(7, 6, 'code', 'Écrire et expliquer un programme manipulant des pointeurs', 85),
(8, 7, 'debug', 'Gérer malloc/free sans fuite ni double free', 85),
(9, 8, 'code', 'Déclarer et utiliser tableaux et structures proprement', 80),
(10, 9, 'code', 'Lire et écrire un fichier sans erreur', 85),
(11, 10, 'debug', 'Gérer correctement les retours d’E/S et EOF', 85),
(12, 11, 'explain', 'Expliquer PID, état et hiérarchie des processus', 80),
(13, 12, 'code', 'Créer un fork/exec correct avec signaux', 90),
(14, 13, 'debug', 'Utiliser gdb pour isoler une erreur', 85),
(15, 14, 'debug', 'Identifier et corriger une fuite mémoire', 90),
(16, 15, 'code', 'Sécuriser un accès partagé avec mutex', 90),
(17, 16, 'code', 'Construire un client/serveur TCP simple', 90);

-- ------------------------------------------------------------
-- 11) Règles de révision
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
-- 12) Projets associés
-- ------------------------------------------------------------
INSERT INTO projects (id, user_id, name, slug, description, status, started_at, ended_at, created_at, updated_at)
VALUES
(1, 1, 'Mini-shell C', 'mini-shell-c', 'Construire un shell minimal en C pour consolider les pointeurs, processus et exécution.', 'idea', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Outil d’analyse mémoire', 'outil-analyse-memoire', 'Créer un outil CLI pour détecter erreurs mémoire et résumer les diagnostics.', 'idea', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Serveur TCP minimal', 'serveur-tcp-minimal', 'Construire un petit serveur TCP et son client en C.', 'idea', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO project_subjects (id, project_id, subject_id, is_required, created_at)
VALUES
(1, 1, 4, 1, CURRENT_TIMESTAMP),
(2, 1, 6, 1, CURRENT_TIMESTAMP),
(3, 1, 11, 1, CURRENT_TIMESTAMP),
(4, 1, 12, 1, CURRENT_TIMESTAMP),
(5, 1, 13, 1, CURRENT_TIMESTAMP),
(6, 2, 6, 1, CURRENT_TIMESTAMP),
(7, 2, 7, 1, CURRENT_TIMESTAMP),
(8, 2, 14, 1, CURRENT_TIMESTAMP),
(9, 3, 11, 1, CURRENT_TIMESTAMP),
(10, 3, 12, 1, CURRENT_TIMESTAMP),
(11, 3, 15, 1, CURRENT_TIMESTAMP),
(12, 3, 16, 1, CURRENT_TIMESTAMP);

-- ------------------------------------------------------------
-- 13) Révisions initiales générées pour les sujets de base
-- ------------------------------------------------------------
INSERT INTO revision_items (id, subject_id, next_review_date, interval_days, ease_factor, repetition_count, last_score)
VALUES
(1, 1, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(2, 1, DATE('now', '+7 day'), 7, 2.5, 0, NULL),
(3, 1, DATE('now', '+30 day'), 30, 2.5, 0, NULL),
(4, 4, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(5, 4, DATE('now', '+7 day'), 7, 2.5, 0, NULL),
(6, 6, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(7, 6, DATE('now', '+7 day'), 7, 2.5, 0, NULL),
(8, 7, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(9, 9, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(10, 11, DATE('now', '+1 day'), 1, 2.5, 0, NULL),
(11, 13, DATE('now', '+1 day'), 1, 2.5, 0, NULL);

-- ------------------------------------------------------------
-- 14) Journal initial
-- ------------------------------------------------------------
INSERT INTO activity_logs (id, user_id, action_type, entity_type, entity_id, details, created_at)
VALUES
(1, 1, 'seed_import', 'domain', 1, 'Import initial du domaine Développement système en C', CURRENT_TIMESTAMP);


-- ------------------------------------------------------------
-- 15) Resource <-> Concept Mapping
-- ------------------------------------------------------------
-- Table cible: resource_concepts(resource_id, concept_id)

INSERT INTO resource_concepts (resource_id, concept_id) VALUES

-- Architecture
(1001, 1), (1001, 5),
(1002, 1), (1002, 2), (1002, 5),

-- OS / syscalls
(1003, 6), (1003, 7),
(1004, 6), (1004, 8),

-- Compilation
(1005, 9), (1005, 10),
(1006, 10), (1006, 11),

-- C standard
(1007, 12), (1007, 13), (1007, 14),
(1008, 12), (1008, 14),

-- Pointers
(1009, 17), (1009, 18), (1009, 19), (1009, 20),
(1010, 17), (1010, 19),

-- Memory
(1011, 22), (1011, 23),
(1012, 24), (1012, 25),

-- I/O
(1013, 29), (1013, 30),
(1014, 31),
(1015, 31),

-- Processes
(1016, 38),
(1017, 39),
(1018, 35),

-- Debugging
(1019, 41), (1019, 42), (1019, 43),

-- Threads
(1020, 47), (1020, 49),
(1021, 48),

-- Networking
(1022, 50), (1022, 51),
(1023, 50);

COMMIT;
