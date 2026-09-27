-- Seed SQL - Concepts + Mapping ressources
-- Prérequis : tables resources, concepts, resource_concepts, subject_prerequisites,
-- concept_prerequisites, concept_mastery, mistakes, weak_points, revision_items
--
-- Hypothèse :
--   resources contient déjà les enregistrements du corpus documentaire
--   domain/subdomain/subject sont déjà seedés

BEGIN TRANSACTION;

-- ============================================================
-- 1) CONCEPTS - Domaine C / Développement système
-- ============================================================

-- Architecture machine
INSERT INTO concepts (id, subject_id, name, description, difficulty, order_index) VALUES
(1, 1, 'CPU', 'Unité centrale de traitement, exécution des instructions', 2, 1),
(2, 1, 'RAM', 'Mémoire volatile utilisée pendant l’exécution', 2, 2),
(3, 1, 'Stockage persistant', 'Disque, SSD, supports non volatils', 2, 3),
(4, 1, 'Bus et transferts', 'Circulation des données entre composants', 3, 4),
(5, 1, 'Cycle fetch-decode-execute', 'Lecture, décodage et exécution d’une instruction', 3, 5),
(6, 2, 'Noyau Linux', 'Composant central du système d’exploitation', 3, 1),
(7, 2, 'Processus système', 'Programmation et contrôle des processus par l’OS', 3, 2),
(8, 2, 'Gestion mémoire par l’OS', 'Allocation, protection et virtualisation mémoire', 4, 3),
(9, 3, 'Compilation', 'Transformation du code source en objet exécutable', 3, 1),
(10, 3, 'Linking', 'Association des objets et bibliothèques', 4, 2),
(11, 3, 'Loader', 'Chargement du programme en mémoire', 3, 3),
(12, 4, 'Types fondamentaux C', 'int, char, float, double, void', 2, 1),
(13, 4, 'Variables et affectation', 'Définition et manipulation de données', 2, 2),
(14, 4, 'Fonctions', 'Organisation du code en unités réutilisables', 2, 3),
(15, 5, 'Flags de compilation', 'Options gcc/clang', 3, 1),
(16, 5, 'Organisation de projet C', 'Sources, headers, build, séparations logiques', 3, 2),
(17, 6, 'Adresse mémoire', 'Localisation d’une donnée en mémoire', 3, 1),
(18, 6, 'Déclaration de pointeur', 'Variable qui contient une adresse', 3, 2),
(19, 6, 'Déréférencement', 'Accès à la valeur pointée', 4, 3),
(20, 6, 'Arithmétique des pointeurs', 'Déplacement selon le type pointé', 4, 4),
(21, 6, 'Pointeur vs tableau', 'Différence de nature et de comportement', 4, 5),
(22, 7, 'malloc', 'Allocation dynamique de mémoire', 4, 1),
(23, 7, 'free', 'Libération de mémoire dynamique', 4, 2),
(24, 7, 'Fragmentation', 'Dispersion des blocs mémoire dans le tas', 5, 3),
(25, 7, 'Dangling pointer', 'Pointeur devenu invalide après libération', 5, 4),
(26, 8, 'Tableaux', 'Séquences de données homogènes', 3, 1),
(27, 8, 'Structures', 'Agrégation de champs hétérogènes', 3, 2),
(28, 8, 'Accès indexé', 'Lecture/écriture par position', 3, 3),
(29, 9, 'FILE*', 'Flux haut niveau de la bibliothèque standard', 4, 1),
(30, 9, 'fopen/fclose', 'Ouverture et fermeture de fichiers', 4, 2),
(31, 9, 'Lecture/écriture de fichiers', 'Manipulation du contenu sur disque', 4, 3),
(32, 10, 'Buffer', 'Zone tampon temporaire', 4, 1),
(33, 10, 'EOF', 'Fin de fichier', 3, 2),
(34, 10, 'Erreur d’E/S', 'Retour d’échec et gestion du flux', 4, 3),
(35, 11, 'PID', 'Identifiant d’un processus', 3, 1),
(36, 11, 'État d’un processus', 'running, sleeping, zombie', 3, 2),
(37, 11, 'Parent/enfant', 'Relation hiérarchique entre processus', 3, 3),
(38, 12, 'fork', 'Création d’un processus enfant', 5, 1),
(39, 12, 'exec', 'Remplacement du programme courant', 5, 2),
(40, 12, 'Signaux', 'Communication asynchrone avec un processus', 5, 3),
(41, 13, 'Breakpoints', 'Points d’arrêt dans le débogueur', 4, 1),
(42, 13, 'Stack trace', 'Pile d’exécution observée', 4, 2),
(43, 13, 'Inspection mémoire', 'Lecture de variables et adresses', 4, 3),
(44, 14, 'Valgrind', 'Détection des erreurs mémoire', 5, 1),
(45, 14, 'Fuite mémoire', 'Mémoire non libérée', 5, 2),
(46, 14, 'Double free', 'Libération répétée d’un bloc', 5, 3),
(47, 15, 'pthread', 'API de threads POSIX', 5, 1),
(48, 15, 'Race condition', 'Concurrence non protégée', 5, 2),
(49, 15, 'Mutex', 'Verrou de synchronisation', 5, 3),
(50, 16, 'socket', 'Point de communication réseau', 5, 1),
(51, 16, 'bind/listen/accept', 'Cycle serveur TCP', 5, 2),
(52, 16, 'Client TCP', 'Connexion à un serveur TCP', 5, 3);

-- ============================================================
-- 2) CONCEPTS - Administration système
-- ============================================================

INSERT INTO concepts (id, subject_id, name, description, difficulty, order_index) VALUES
(101, 17, 'Shell', 'Interface textuelle d’exécution des commandes', 2, 1),
(102, 17, 'Arborescence Linux', 'Organisation hiérarchique du système de fichiers', 2, 2),
(103, 17, 'Commandes fondamentales', 'ls, cd, cp, mv, rm, find, grep', 2, 3),
(104, 18, 'Utilisateurs', 'Comptes locaux et identité', 3, 1),
(105, 18, 'Groupes', 'Regroupement de comptes pour les permissions', 3, 2),
(106, 18, 'Permissions', 'Lecture, écriture, exécution', 3, 3),
(107, 19, 'systemd', 'Gestionnaire de services et d’unités', 4, 1),
(108, 19, 'unit files', 'Définition déclarative d’un service', 4, 2),
(109, 19, 'journalctl', 'Lecture des journaux systemd', 4, 3),
(110, 20, 'Partitions', 'Découpage logique du stockage', 3, 1),
(111, 20, 'Montage', 'Attacher un système de fichiers à l’arbre', 3, 2),
(112, 20, 'fstab', 'Montages persistants au démarrage', 3, 3),
(113, 21, 'Adresse IP', 'Identification réseau d’une machine', 3, 1),
(114, 21, 'DNS', 'Résolution de noms en adresses', 3, 2),
(115, 21, 'Ports et services', 'Association service/port', 3, 3),
(116, 22, 'Logs système', 'Journaux d’activité et d’erreur', 4, 1),
(117, 22, 'Durcissement', 'Réduction de la surface d’attaque', 4, 2),
(118, 22, 'Pare-feu', 'Filtrage du trafic réseau', 4, 3);

-- ============================================================
-- 3) CONCEPTS - DevOps / DevSecOps
-- ============================================================

INSERT INTO concepts (id, subject_id, name, description, difficulty, order_index) VALUES
(201, 23, 'Git repository', 'Dépôt de versionnement', 2, 1),
(202, 23, 'Commit', 'Point d’enregistrement d’un état', 2, 2),
(203, 23, 'Branch', 'Ligne de développement parallèle', 3, 3),
(204, 24, 'Shell scripting', 'Automatisation par scripts', 3, 1),
(205, 24, 'Variables et conditions', 'Contrôle du flux d’un script', 3, 2),
(206, 24, 'Boucles', 'Répétition contrôlée', 3, 3),
(207, 25, 'Image', 'Modèle immuable de conteneur', 4, 1),
(208, 25, 'Conteneur', 'Instance en exécution', 4, 2),
(209, 25, 'Volume', 'Persistance des données hors conteneur', 4, 3),
(210, 26, 'Pipeline CI/CD', 'Chaîne build-test-deploy', 4, 1),
(211, 26, 'Tests automatisés', 'Validation automatique du code', 4, 2),
(212, 26, 'Déploiement', 'Mise en production ou en préproduction', 4, 3),
(213, 27, 'Logs', 'Observation des événements', 4, 1),
(214, 27, 'Métriques', 'Mesure quantifiée du système', 4, 2),
(215, 27, 'Alertes', 'Notifications déclenchées par seuil', 4, 3),
(216, 28, 'Secrets', 'Informations sensibles à protéger', 5, 1),
(217, 28, 'Contrôle d’accès', 'Gestion des droits et identités', 5, 2),
(218, 28, 'Supply chain', 'Chaîne d’approvisionnement logicielle', 5, 3);

-- ============================================================
-- 4) PRÉREQUIS CONCEPTUELS
-- ============================================================

CREATE TABLE IF NOT EXISTS concept_prerequisites (
    id INTEGER PRIMARY KEY,
    concept_id INTEGER NOT NULL,
    prerequisite_concept_id INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO concept_prerequisites (id, concept_id, prerequisite_concept_id) VALUES
-- C system
(1, 5, 1), (2, 5, 2), (3, 9, 12), (4, 10, 9), (5, 11, 10),
(6, 17, 2), (7, 18, 17), (8, 19, 18), (9, 20, 18), (10, 21, 18),
(11, 22, 18), (12, 23, 22), (13, 24, 22), (14, 25, 23),
(15, 29, 22), (16, 30, 29), (17, 31, 30),
(18, 38, 35), (19, 39, 38), (20, 40, 38),
(21, 47, 18), (22, 48, 47), (23, 49, 47),
(24, 50, 31), (25, 51, 50), (26, 52, 51),

-- Admin
(101, 103, 101), (102, 106, 104), (103, 106, 105),
(104, 107, 103), (105, 108, 107), (106, 109, 107),
(107, 111, 110), (108, 112, 111),
(109, 114, 113), (110, 115, 114),
(111, 117, 116), (112, 118, 115),

-- DevOps
(201, 202, 201), (202, 203, 202),
(203, 205, 204), (204, 206, 205),
(205, 208, 207), (206, 209, 208),
(207, 211, 210), (208, 212, 211),
(209, 214, 213), (210, 215, 214),
(211, 217, 216), (212, 218, 217);

-- ============================================================
-- 5) MAPPING RESSOURCE ↔ CONCEPT
-- ============================================================

CREATE TABLE IF NOT EXISTS resource_concepts (
    id INTEGER PRIMARY KEY,
    resource_id INTEGER NOT NULL,
    concept_id INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO resource_concepts (id, resource_id, concept_id) VALUES
-- ------------------------------------------------------------
-- C SYSTEM PROGRAMMING
-- ------------------------------------------------------------
-- K&R / Delannoy / CS:APP / Blaess / TLPI / ANSSI
(1, 1, 12), (2, 1, 13), (3, 1, 14), (4, 1, 17), (5, 1, 18), (6, 1, 19), (7, 1, 26), (8, 1, 27),
(9, 2, 12), (10, 2, 13), (11, 2, 14), (12, 2, 15), (13, 2, 16), (14, 2, 17), (15, 2, 18), (16, 2, 19), (17, 2, 22), (18, 2, 23),
(19, 3, 1), (20, 3, 2), (21, 3, 3), (22, 3, 4), (23, 3, 5), (24, 3, 9), (25, 3, 10), (26, 3, 11), (27, 3, 35), (28, 3, 47), (29, 3, 50),
(30, 4, 6), (31, 4, 7), (32, 4, 8), (33, 4, 29), (34, 4, 30), (35, 4, 31), (36, 4, 35), (37, 4, 38), (38, 4, 39), (39, 4, 40),
(40, 5, 29), (41, 5, 30), (42, 5, 31), (43, 5, 35), (44, 5, 36), (45, 5, 37), (46, 5, 38), (47, 5, 39), (48, 5, 40), (49, 5, 47), (50, 5, 50), (51, 5, 51), (52, 5, 52),
(53, 6, 17), (54, 6, 18), (55, 6, 19), (56, 6, 20), (57, 6, 21), (58, 6, 22), (59, 6, 23), (60, 6, 24), (61, 6, 25);

-- ------------------------------------------------------------
-- ADMINISTRATION SYSTEM
-- ------------------------------------------------------------
INSERT INTO resource_concepts (id, resource_id, concept_id) VALUES
(101, 100, 101), (102, 100, 102), (103, 100, 103), (104, 100, 104), (105, 100, 105), (106, 100, 106),
(107, 100, 107), (108, 100, 108), (109, 100, 109), (110, 100, 110), (111, 100, 111), (112, 100, 112),
(113, 100, 113), (114, 100, 114), (115, 100, 115), (116, 100, 116), (117, 100, 117), (118, 100, 118),
(119, 101, 101), (120, 101, 102), (121, 101, 103), (122, 101, 104), (123, 101, 105), (124, 101, 106),
(125, 101, 107), (126, 101, 108), (127, 101, 109), (128, 101, 110), (129, 101, 111), (130, 101, 112),
(131, 101, 113), (132, 101, 114), (133, 101, 115), (134, 101, 116), (135, 101, 117), (136, 101, 118);

-- ------------------------------------------------------------
-- DEVOPS / DEVSECOPS
-- ------------------------------------------------------------
INSERT INTO resource_concepts (id, resource_id, concept_id) VALUES
(201, 200, 201), (202, 200, 202), (203, 200, 203), (204, 200, 210), (205, 200, 213), (206, 200, 214), (207, 200, 215), (208, 200, 217),
(209, 201, 210), (210, 201, 211), (211, 201, 212), (212, 201, 216), (213, 201, 217), (214, 201, 218),
(215, 202, 205), (216, 202, 206), (217, 202, 207), (218, 202, 208), (219, 202, 209), (220, 202, 216), (221, 202, 217),
(222, 203, 213), (223, 203, 214), (224, 203, 215), (225, 203, 216), (226, 203, 217), (227, 203, 218);

-- ============================================================
-- 6) MAÎTRISE CONCEPTUELLE ET ERREURS
-- ============================================================

CREATE TABLE IF NOT EXISTS concept_mastery (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    concept_id INTEGER NOT NULL,
    mastery_score REAL DEFAULT 0,
    last_seen_at TEXT,
    last_score REAL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mistakes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    concept_id INTEGER,
    mistake_type TEXT NOT NULL,
    description TEXT NOT NULL,
    severity INTEGER DEFAULT 1,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS weak_points (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    concept_id INTEGER NOT NULL,
    severity INTEGER DEFAULT 1,
    last_detected TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS resource_recommendations (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    concept_id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    recommendation_reason TEXT NOT NULL,
    score REAL NOT NULL,
    status TEXT DEFAULT 'pending',
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

COMMIT;
