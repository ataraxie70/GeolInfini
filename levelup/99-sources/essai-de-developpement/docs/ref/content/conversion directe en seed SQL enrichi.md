Voici une **conversion directe en seed SQL enrichi** de ton corpus documentaire vers une table `resources` exploitable par le moteur.

---

# 1) Hypothèse de schéma `resources`

```sql
CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    source_type TEXT,            -- standard, book, manual, doc, roadmap
    source_role TEXT,            -- foundation, deep, system_ref, security, admin_ref, roadmap
    domain TEXT,                 -- C_SYSTEM, SYS_ADMIN, DEVOPS
    subdomain TEXT,
    authority_score FLOAT,       -- 0.0 → 1.0
    difficulty_level INT,        -- 1 → 5
    is_primary_source BOOLEAN,
    is_security_source BOOLEAN,
    is_roadmap_source BOOLEAN,
    edition TEXT,
    url TEXT,
    coverage_notes TEXT
);
```

---

# 2) Seed SQL enrichi

```sql
BEGIN;

-- =========================
-- C SYSTEM PROGRAMMING
-- =========================

INSERT INTO resources (
    id, title, author, source_type, source_role,
    domain, subdomain, authority_score, difficulty_level,
    is_primary_source, is_security_source, is_roadmap_source,
    edition, url, coverage_notes
) VALUES

-- K&R
(1,
 'The C Programming Language',
 'Kernighan & Ritchie',
 'book',
 'foundation',
 'C_SYSTEM',
 'C_LANGUAGE',
 1.0,
 2,
 TRUE,
 FALSE,
 FALSE,
 '2nd Edition',
 NULL,
 'Définition du langage C conforme ANSI, base syntaxe, types, pointeurs, structures'),

-- Delannoy
(2,
 'Le guide complet du langage C',
 'Claude Delannoy',
 'book',
 'deep',
 'C_SYSTEM',
 'C_LANGUAGE',
 0.9,
 3,
 FALSE,
 FALSE,
 FALSE,
 NULL,
 NULL,
 'Analyse approfondie, ambiguïtés, comportements limites, erreurs de compilation'),

-- CS:APP
(3,
 'Computer Systems: A Programmer’s Perspective',
 'Bryant & O’Hallaron',
 'book',
 'system_ref',
 'C_SYSTEM',
 'ARCHITECTURE',
 1.0,
 4,
 TRUE,
 FALSE,
 FALSE,
 '3rd Edition',
 NULL,
 'Compréhension bas niveau: mémoire, CPU, linking, exécution, performance'),

-- Blaess
(4,
 'Développement système sous Linux',
 'Christophe Blaess',
 'book',
 'system_ref',
 'C_SYSTEM',
 'LINUX_API',
 0.95,
 4,
 TRUE,
 FALSE,
 FALSE,
 '5e édition',
 NULL,
 'Appels système, processus, fichiers, signaux, IPC, programmation système Linux'),

-- TLPI
(5,
 'The Linux Programming Interface',
 'Michael Kerrisk',
 'book',
 'system_ref',
 'C_SYSTEM',
 'LINUX_API',
 1.0,
 5,
 TRUE,
 FALSE,
 FALSE,
 NULL,
 'https://man7.org/tlpi/',
 'Référence complète API Linux: syscalls, mémoire, threads, fichiers, réseau'),

-- ANSSI
(6,
 'Guide ANSSI programmation sécurisée en C',
 'ANSSI',
 'standard',
 'security',
 'C_SYSTEM',
 'SECURITY',
 1.0,
 4,
 TRUE,
 TRUE,
 FALSE,
 'v1.2',
 NULL,
 'Règles de programmation sécurisée: mémoire, entrées, overflow, robustesse');

-- =========================
-- SYSTEM ADMINISTRATION
-- =========================

INSERT INTO resources VALUES

(100,
 'UNIX and Linux System Administration Handbook',
 'Nemeth et al.',
 'book',
 'admin_ref',
 'SYS_ADMIN',
 'GENERAL',
 1.0,
 3,
 TRUE,
 FALSE,
 FALSE,
 '5th Edition',
 NULL,
 'Administration complète: installation, réseau, stockage, sécurité, automation'),

(101,
 'Red Hat Enterprise Linux 7 System Administrator Guide',
 'Red Hat',
 'manual',
 'admin_ref',
 'SYS_ADMIN',
 'RHEL',
 0.9,
 3,
 TRUE,
 FALSE,
 FALSE,
 'RHEL 7',
 'https://docs.redhat.com/',
 'Guide pratique: systemd, SELinux, stockage, services, réseau');

-- =========================
-- DEVOPS / DEVSECOPS
-- =========================

INSERT INTO resources VALUES

(200,
 'Socle DevSecOps',
 'Stéphane Robert',
 'roadmap',
 'roadmap',
 'DEVOPS',
 'FUNDAMENTALS',
 0.85,
 2,
 FALSE,
 FALSE,
 TRUE,
 NULL,
 'https://blog.stephane-robert.info/docs/devops/fondamentaux/',
 'Piliers DevOps: culture, flow, sécurité, observabilité'),

(201,
 'Implémenter DevSecOps',
 'Stéphane Robert',
 'roadmap',
 'application',
 'DEVOPS',
 'IMPLEMENTATION',
 0.85,
 3,
 FALSE,
 FALSE,
 TRUE,
 NULL,
 'https://blog.stephane-robert.info/docs/devops/implementation/',
 'Mise en pratique DevSecOps: organisation, CI/CD, métriques'),

(202,
 'Roadmap Homelab',
 'Stéphane Robert',
 'roadmap',
 'roadmap',
 'DEVOPS',
 'INFRASTRUCTURE',
 0.85,
 3,
 FALSE,
 FALSE,
 TRUE,
 NULL,
 'https://blog.stephane-robert.info/docs/homelab/roadmap/',
 'Infrastructure progressive: réseau, cluster, GitOps, sécurité'),

(203,
 'Maturité DevSecOps',
 'Stéphane Robert',
 'roadmap',
 'roadmap',
 'DEVOPS',
 'MATURITY',
 0.9,
 3,
 FALSE,
 FALSE,
 TRUE,
 NULL,
 'https://blog.stephane-robert.info/docs/devops/fondamentaux/maturite-roadmap/',
 'Évaluation et progression de maturité DevSecOps');

COMMIT;
```

---

# 3) Ce que ce seed permet immédiatement

### 1. Filtrage intelligent

```sql
-- toutes les sources système de référence
SELECT * FROM resources
WHERE domain = 'C_SYSTEM'
AND source_role = 'system_ref';
```

### 2. Sécurité ciblée

```sql
SELECT * FROM resources
WHERE is_security_source = TRUE;
```

### 3. Roadmap DevOps

```sql
SELECT * FROM resources
WHERE is_roadmap_source = TRUE;
```

---

# 4) Extension critique (à faire ensuite)

Ajoute une table de liaison :

```sql
CREATE TABLE resource_subjects (
    id SERIAL,
    resource_id INT,
    subject_id INT
);
```

Et :

```sql
CREATE TABLE resource_concepts (
    id SERIAL,
    resource_id INT,
    concept_id INT
);
```

---

# 5) Pourquoi cette structuration est correcte (niveau système)

* séparation **contenu / rôle / domaine**
* distinction claire :

  * langage (K&R)
  * machine (CS:APP)
  * OS (TLPI / Blaess)
  * sécurité (ANSSI)
* DevOps traité comme **système organisationnel**, pas juste outils

---

# 6) Étape suivante recommandée

Maintenant que les ressources sont structurées :

👉 connecter :

```
concept → resource → erreur → recommandation
```
