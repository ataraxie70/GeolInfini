# Sources de référence et roadmap de contenu
## Plateforme d’apprentissage — Développement système, administration système, DevOps / DevSecOps

## 1. Objectif du document

Ce document sert de base documentaire pour alimenter la plateforme avec des sources de référence, des sujets cibles et une hiérarchie de contenu plus exhaustive.

Le but n’est pas seulement de lister des livres. Le but est de définir, pour chaque source :
- son rôle pédagogique ;
- les sujets incontournables qu’elle doit alimenter ;
- le niveau de profondeur attendu ;
- la place qu’elle occupe dans la roadmap globale.

---

## 2. Principe de classification des sources

Chaque source doit être classée selon son rôle réel dans le parcours :

- **Source normative** : texte de référence qui définit le comportement ou les règles (standard, RFC, documentation officielle).
- **Source de fondation** : ouvrage de base qui structure la compréhension.
- **Source d’approfondissement** : ouvrage ou documentation qui développe les détails et les cas limites.
- **Source d’application** : guide orienté usage opérationnel, administration ou mise en œuvre.
- **Source d’orientation** : roadmap, parcours ou plan de progression.

---

## 3. Références pour le domaine Développement système en C

### 3.1 The C Programming Language — Kernighan & Ritchie
**Rôle** : source fondatrice du langage C.

**Pourquoi elle compte**
Le second édition décrit C tel que défini par la norme ANSI et précise les aspects du langage restés machine-dépendants. La première et la deuxième édition ont joué un rôle central dans la formalisation et la diffusion du langage. ([colorcomputerarchive.com](https://colorcomputerarchive.com/repo/Documents/Books/The%20C%20Programming%20Language%20%28Kernighan%20Ritchie%29.pdf?utm_source=chatgpt.com))

**Sujets cibles incontournables**
- syntaxe du langage C ;
- types et expressions ;
- fonctions ;
- tableaux ;
- pointeurs ;
- structures ;
- gestion des chaînes ;
- bibliothèques standard ;
- dépendances entre langage et machine.

**Usage dans la plateforme**
- fondation du socle C ;
- validation des bases ;
- référence courte et stricte pour les règles du langage.

---

### 3.2 Le guide complet du langage C — Claude Delannoy
**Rôle** : source d’approfondissement du langage C.

**Pourquoi elle compte**
La description du livre le présente comme un manuel pour étudiants avancés et développeurs, qui décortique le langage, clarifie ses ambiguïtés et analyse le comportement des compilateurs lorsque la syntaxe est incorrecte. ([booksellers.ca](https://www.booksellers.ca/books/le-guide-complet-du-langage-c-claude-delannoy-9782212679229.html))

**Sujets cibles incontournables**
- ambiguïtés du langage ;
- comportements limites ;
- erreurs de syntaxe ;
- comportement des compilateurs ;
- différences C et C++ ;
- cas exceptionnels ;
- pièges de lecture et d’implémentation.

**Usage dans la plateforme**
- source d’analyse fine ;
- source pour les sujets difficiles ou ambigus ;
- source de consolidation pour les bugs conceptuels.

---

### 3.3 Développement système sous Linux — Christophe Blaess
**Rôle** : source de liaison entre C et système Linux.

**Pourquoi elle compte**
L’ouvrage est présenté par son auteur comme une référence complète du développement système sous Linux, avec exemples remis à jour dans la cinquième édition. Le site de Blaess indique aussi que les exemples sources sont disponibles publiquement. ([blaess.fr](https://www.blaess.fr/christophe/livres/programmation-systeme-sous-linux/))

**Sujets cibles incontournables**
- appels système ;
- processus ;
- fichiers ;
- signaux ;
- IPC ;
- programmation système Linux ;
- exemples C orientés OS ;
- interaction avec le noyau.

**Usage dans la plateforme**
- colonne vertébrale du domaine Développement système ;
- source pour les sujets intermédiaires et avancés ;
- pont direct entre C et Linux.

---

### 3.4 Computer Systems: A Programmer’s Perspective — Bryant & O’Hallaron
**Rôle** : source de compréhension “sous le capot”.

**Pourquoi elle compte**
La page officielle du livre le positionne comme un texte pour comprendre ce qui se passe “under the hood” d’un système informatique. ([pearson.com](https://www.pearson.com/en-us/subject-catalog/p/computer-systems-a-programmers-perspective/P200000003479/9780138105396?srsltid=AfmBOoo_RAJ5Tw0mby_RFdrM0h0-H6SFqE0l8N01nbXnuqor1F8vs38C&utm_source=chatgpt.com))

**Sujets cibles incontournables**
- représentation des données ;
- arithmétique machine ;
- mémoire ;
- compilation ;
- linking ;
- exécution ;
- cache ;
- performance ;
- processus ;
- threads ;
- réseau de base.

**Usage dans la plateforme**
- source d’arrière-plan pour relier code et machine ;
- utile pour architecture machine, mémoire, performances et exécution.

---

### 3.5 The Linux Programming Interface — Michael Kerrisk
**Rôle** : source de référence système Linux/UNIX.

**Pourquoi elle compte**
TLPI est présenté par man7 comme un guide et une référence détaillée pour la programmation système Linux et UNIX. Le site maintenu par Kerrisk publie aussi le code source des exemples du livre. ([man7.org](https://man7.org/tlpi/?utm_source=chatgpt.com))

**Sujets cibles incontournables**
- architecture des API Linux ;
- fichiers et I/O ;
- processus ;
- signaux ;
- mémoire ;
- threads ;
- sockets ;
- permissions ;
- supervision ;
- bonnes pratiques système.

**Usage dans la plateforme**
- référence principale pour les sujets système précis ;
- excellente base pour l’annotation des sujets, ressources et exercices.

---

### 3.6 ANSSI — Guide des règles de programmation pour le développement sécurisé de logiciels en langage C
**Rôle** : source normative de sécurité en C.

**Pourquoi elle compte**
Le document ANSSI est un guide dédié au développement sécurisé en C et constitue une référence pertinente pour construire des règles de codage sûres. ([blog.stephane-robert.info](https://blog.stephane-robert.info/docs/))

**Sujets cibles incontournables**
- gestion sûre de la mémoire ;
- validation des entrées ;
- prévention des dépassements ;
- robustesse des types ;
- erreurs de programmation sécuritaire ;
- règles de codage défensif.

**Usage dans la plateforme**
- source de sécurité pour les sujets C ;
- indispensable pour les validations avancées ;
- utile pour les exercices de correction de bugs.

---

## 4. Références pour l’administration système

### 4.1 UNIX and Linux System Administration Handbook, Fifth Edition
**Rôle** : guide de référence global pour l’administration système.

**Pourquoi elle compte**
La fiche officielle du livre le présente comme le guide définitif pour installer, configurer et maintenir un système UNIX ou Linux, y compris dans les infrastructures cloud et virtualisées. ([admin.com](https://www.admin.com/))

**Sujets cibles incontournables**
- installation système ;
- configuration ;
- maintenance ;
- stockage ;
- réseau ;
- automation ;
- configuration source code ;
- sécurité ;
- gestion d’infrastructure moderne.

**Usage dans la plateforme**
- base d’orientation pour le domaine administration système ;
- source de sujets opérationnels et de checklists.

---

### 4.2 Red Hat Enterprise Linux 7 System Administrator’s Guide
**Rôle** : guide d’application distribué et concret.

**Pourquoi elle compte**
La documentation Red Hat indique que ce guide couvre le déploiement, la configuration et l’administration de RHEL 7, et s’adresse à des administrateurs ayant une compréhension de base du système. ([docs.redhat.com](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/system_administrators_guide/index))

**Sujets cibles incontournables**
- services ;
- stockage ;
- réseau ;
- journalisation ;
- SELinux ;
- systemd ;
- administration réseau ;
- pratiques de distribution.

**Usage dans la plateforme**
- utile pour l’administration concrète ;
- à utiliser comme source de validation opérationnelle ;
- à contextualiser comme guide RHEL 7, donc distribution-spécifique.

---

## 5. Références pour DevOps / DevSecOps

### 5.1 Socle DevSecOps — Stéphane Robert
**Rôle** : source d’orientation et de structuration.

**Pourquoi elle compte**
La page “Socle DevSecOps” organise le parcours autour de blocs de compétences et recommande de suivre les quatre piliers dans l’ordre, en commençant par la culture DevOps. Elle présente aussi une carte “Maturité et Roadmap” pour construire une progression mesurable. ([blog.stephane-robert.info](https://blog.stephane-robert.info/docs/devops/fondamentaux/))

**Sujets cibles incontournables**
- culture DevOps ;
- flow ;
- sécurité intégrée ;
- fiabilité ;
- métriques DORA ;
- observabilité ;
- outils DevOps ;
- maturité et roadmap.

**Usage dans la plateforme**
- source d’orientation pour la roadmap globale DevOps/DevSecOps ;
- base de découpage des compétences ;
- matrice de progression par piliers.

---

### 5.2 Implémenter DevSecOps : le parcours complet
**Rôle** : source de mise en pratique.

**Pourquoi elle compte**
La page décrit un parcours en 5 parties progressives, avec prérequis et durée estimée, orienté vers l’implémentation concrète du DevSecOps. Elle précise qu’il s’agit d’un niveau opérationnel, après les fondamentaux. ([blog.stephane-robert.info](https://blog.stephane-robert.info/docs/devops/implementation/))

**Sujets cibles incontournables**
- évaluation de la maturité ;
- organisation des équipes ;
- formation ;
- métriques ;
- livraison continue ;
- mise en œuvre concrète ;
- pratiques opérationnelles.

**Usage dans la plateforme**
- source de progression après les fondamentaux ;
- utile pour transformer la théorie en activités de terrain.

---

### 5.3 Roadmap Homelab : des fondations au GitOps
**Rôle** : roadmap d’architecture progressive.

**Pourquoi elle compte**
La roadmap présente quatre phases : fondations réseau, nœud admin de confiance, cluster applicatif, industrialisation et supply chain. Elle insiste sur la dépendance entre phases et sur le fait de ne pas sauter d’étapes. ([blog.stephane-robert.info](https://blog.stephane-robert.info/docs/homelab/roadmap/))

**Sujets cibles incontournables**
- réseau de base ;
- accès distant ;
- DNS ;
- identité ;
- secrets ;
- cluster ;
- GitOps ;
- supply chain ;
- images durcies ;
- signatures ;
- SBOM ;
- politiques.

**Usage dans la plateforme**
- roadmap d’architecture d’infrastructure ;
- excellente base pour les sujets homelab et plateforme locale.

---

### 5.4 Maturité et Roadmap DevSecOps
**Rôle** : source de diagnostic et de progression.

**Pourquoi elle compte**
La page explique que l’objectif n’est pas d’atteindre un niveau maximum abstrait, mais de progresser de façon mesurable vers des objectifs métier. ([blog.stephane-robert.info](https://blog.stephane-robert.info/docs/devops/fondamentaux/maturite-roadmap/?utm_source=chatgpt.com))

**Sujets cibles incontournables**
- évaluation de maturité ;
- priorisation ;
- amélioration progressive ;
- mesure des progrès ;
- adaptation au contexte.

**Usage dans la plateforme**
- utile pour le moteur de recommandation ;
- utile pour bloquer ou ouvrir des parcours selon la maturité réelle.

---

## 6. Comment exploiter ces sources dans la plateforme

Chaque source doit alimenter trois couches :

### 6.1 Couche “roadmap”
Elle définit l’ordre global des sujets.

### 6.2 Couche “sujets”
Elle découpe la roadmap en unités pédagogiques exploitables.

### 6.3 Couche “validation”
Elle transforme la lecture en preuve de maîtrise.

---

## 7. Liste des sujets incontournables à extraire

### Développement système en C
- modèle mémoire ;
- pointeurs ;
- allocation ;
- erreurs mémoire ;
- I/O ;
- processus ;
- signaux ;
- threads ;
- sockets ;
- compilation ;
- linking ;
- debug ;
- sécurité du C.

### Administration système
- utilisateurs et permissions ;
- services ;
- logs ;
- stockage ;
- réseau ;
- systemd ;
- sécurité ;
- maintenance ;
- sauvegarde ;
- diagnostic.

### DevOps / DevSecOps
- culture DevOps ;
- CI/CD ;
- observabilité ;
- conteneurs ;
- GitOps ;
- identités ;
- secrets ;
- politiques ;
- supply chain ;
- maturité et amélioration continue.

---

## 8. Recommandation de structure en base

Pour chaque source, ajouter au minimum :

- `source_type`
- `source_role`
- `domain`
- `subdomain`
- `subject`
- `target_concepts`
- `authority_score`
- `scope_notes`
- `edition_or_version`
- `is_primary_source`
- `is_security_source`
- `is_roadmap_source`

---

## 9. Priorité d’intégration

Ordre recommandé dans la plateforme :

1. **C et systèmes** : K&R, Delannoy, Blaess, CS:APP, TLPI, ANSSI.
2. **Administration système** : UNIX and Linux System Administration Handbook, Red Hat.
3. **DevOps / DevSecOps** : Stéphane Robert, puis les outils et documentations officielles associées.

---

## 10. Conclusion

Ce corpus de sources peut servir de base documentaire solide à la plateforme.

Il permet :
- de rendre le plan plus objectif ;
- de cibler les sujets incontournables ;
- de réduire la dispersion ;
- de renforcer la qualité des validations ;
- de relier la roadmap à des sources fiables et exploitables.

Le prochain pas logique est de transformer ce document en **seed data structuré** pour la table `resources`, avec un champ supplémentaire de rôle documentaire et un lien vers les concepts ciblés.

