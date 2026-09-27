# D3 — DEVOPS / DEVSECOPS
## Roadmap de maîtrise — Automatisation → Infrastructure → Sécurité continue

> **Domaine d'appui.** S'appuie sur D1 et D2. Ne pas commencer avant d'avoir une base solide en D1 (C + processus) et D2 (administration + réseau).

---

## Table des matières

1. [Shell scripting & automatisation](#1-shell-scripting--automatisation)
2. [Git & gestion de version](#2-git--gestion-de-version)
3. [Conteneurs — Docker & Podman](#3-conteneurs--docker--podman)
4. [CI/CD — Intégration et déploiement continus](#4-cicd--intégration-et-déploiement-continus)
5. [Infrastructure as Code (IaC)](#5-infrastructure-as-code-iac)
6. [Monitoring & observabilité](#6-monitoring--observabilité)
7. [Sécurité DevSecOps](#7-sécurité-devsecops)

---

## 1. Shell scripting & automatisation

### Prérequis
- Section D2.1 (shell & commandes fondamentales)
- Notions de base : variables, redirections, pipes

### 1.1 Bases du scripting Bash
**Grands points :**
- Shebang : `#!/usr/bin/env bash` — pourquoi pas `#!/bin/bash` seul
- `set -e` (exit on error), `set -u` (unbound variable = error), `set -o pipefail`, `set -x` (debug trace)
- Bonne pratique : toujours commencer par `set -euo pipefail`
- Variables : déclaration, lecture, guillemets `"$var"` vs `$var` — importance du quoting
- Variables spéciales : `$0` (nom script), `$1...$N` (arguments), `$#` (nb args), `$@` (tous args), `$?` (code retour), `$$` (PID courant), `$!` (PID dernier background)
- Substitution de commandes : `$(cmd)` (préféré) vs `` `cmd` ``
- Arithmétique : `$(( expr ))`, `let`, `(( ))`
- `readonly` et `local` dans les fonctions

**Critères de maîtrise N4 :**
- [ ] Expliquer la différence entre `"$@"` et `"$*"` avec des arguments contenant des espaces
- [ ] Trouver et corriger 3 bugs liés au quoting dans un script fourni
- [ ] Réécrire un script sans `set -e` pour qu'il gère les erreurs manuellement

---

### 1.2 Structures de contrôle & fonctions
**Grands points :**
- `if/elif/else/fi` : tests avec `[[ ]]` (Bash) vs `[ ]` (POSIX)
- Tests de fichiers : `-f`, `-d`, `-e`, `-r`, `-w`, `-x`, `-s`, `-L`
- Tests de chaînes : `-z`, `-n`, `==`, `!=`, `=~` (regex)
- Tests numériques : `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge`
- `case/esac` : patterns avec `*`, `?`, `[a-z]`
- Boucles : `for item in list`, `for ((i=0; i<N; i++))`, `while read line`, `until`
- `break N`, `continue N` : sortie de boucles imbriquées
- Fonctions : `function name {}` ou `name() {}`, passage d'arguments, `return`
- `local` : variables locales à la fonction — essentiel pour éviter les effets de bord

**Sous-points :**
- `read -r line` vs `read line` : importance du `-r` pour le backslash
- `IFS` (Internal Field Separator) : impact sur `read` et les boucles `for`
- Tableaux : `arr=(a b c)`, `${arr[@]}`, `${arr[0]}`, `${#arr[@]}`
- Tableaux associatifs : `declare -A`, `${dict[key]}`

**Critères de maîtrise N4 :**
- [ ] Écrire une fonction réutilisable de logging avec niveaux (DEBUG/INFO/WARN/ERROR)
- [ ] Parcourir un fichier CSV ligne par ligne avec `while IFS=',' read` correctement
- [ ] Implémenter un menu interactif avec `case` et validation de saisie

---

### 1.3 Scripts d'administration & bonnes pratiques
**Grands points :**
- Gestion des erreurs : `trap ERR`, `trap EXIT` — cleanup garanti
- Usage de `mktemp` pour les fichiers temporaires
- Verrouillage : `flock` — éviter les exécutions parallèles
- Arguments : `getopts` pour les options courtes, `getopt` pour les longues
- Validation : vérifier les prérequis au début (commandes, fichiers, permissions)
- Idempotence : un script relancé plusieurs fois ne doit pas casser le système
- Logs de script : rediriger vers syslog avec `logger` ou vers un fichier dédié
- Sécurité : ne pas stocker de mots de passe en clair, utiliser des fichiers de secrets

**Exercices pratiques :**
- Script de sauvegarde avec rotation
- Script de déploiement avec rollback
- Script de monitoring avec alertes
- Script d'inventaire système (CPU, RAM, disque, OS, noyau)

**Critères de maîtrise N4 :**
- [ ] Écrire un script de backup idempotent avec `trap EXIT` pour le cleanup
- [ ] Implémenter `getopts` pour un script avec 4 options et un argument positionnel
- [ ] Écrire un script de déploiement qui rollback automatiquement en cas d'erreur

---

### 1.4 Automatisation avec Make & autres outils
**Grands points :**
- `Makefile` pour l'automatisation de tâches (pas seulement la compilation)
- Cibles `.PHONY`, dépendances, variables, `$@`, `$<`, `$^`
- `Taskfile` (YAML) : alternative moderne à Make
- `xargs` : construction et exécution de commandes en batch
- `parallel` (GNU) : exécution parallèle de commandes
- `expect` : automatisation de programmes interactifs (SSH, FTP)
- `heredoc` dans les scripts

**Critères de maîtrise N4 :**
- [ ] Créer un Makefile qui sert de runner de tâches pour un projet (build, test, deploy, clean)
- [ ] Utiliser `xargs -P4` pour paralléliser le traitement de 1000 fichiers

---

**Sources — Shell scripting :**
| Ressource | Type | Lien |
|-----------|------|------|
| GNU Bash Manual | Officielle | https://www.gnu.org/software/bash/manual/ |
| *The Art of Shell Scripting* — TLDP | Guide libre | https://tldp.org/LDP/abs/html/ |
| ShellCheck | Outil d'analyse statique | https://www.shellcheck.net |
| Google Shell Style Guide | Bonne pratique | https://google.github.io/styleguide/shellguide.html |
| `man bash` | Man page | Local |

---

## 2. Git & gestion de version

### Prérequis
- Utilisation basique d'un terminal

### 2.1 Concepts fondamentaux de Git
**Grands points :**
- Modèle de données Git : blobs, trees, commits, refs — tout est un hash SHA-1
- Les 3 états : Working directory → Staging area (index) → Repository
- `git init`, `git clone`
- `git add` : staging — `-p` pour un staging interactif par hunks
- `git commit` : `-m`, `--amend`
- `git status`, `git diff`, `git diff --staged`
- `git log` : `--oneline`, `--graph`, `--all`, `--follow`, `-p`, `--stat`
- `git show <commit>` : détail d'un commit
- `.gitignore` : patterns, hiérarchie, `.gitignore` global

**Sous-points :**
- Structure de `.git/` : `HEAD`, `ORIG_HEAD`, `index`, `objects/`, `refs/`
- Hash SHA-1 et intégrité des données
- `git cat-file -p <hash>` : inspecter un objet Git brut
- `git fsck` : vérification de l'intégrité du dépôt

**Critères de maîtrise N4 :**
- [ ] Expliquer ce que Git stocke réellement lors d'un `git commit` (pas juste un diff)
- [ ] Retrouver le hash d'un commit d'il y a 2 semaines qui a modifié un fichier précis
- [ ] Créer un `.gitignore` complet pour un projet C (objets, exécutables, libs)

---

### 2.2 Branches & fusion
**Grands points :**
- Branches : pointeurs légers vers des commits — `git branch`, `git checkout -b`, `git switch -c`
- `HEAD` : pointeur vers la branche courante (ou commit en detached HEAD)
- `git merge` : `--no-ff` (preserve merge commit), `--ff-only`, `--squash`
- Conflits de merge : identification, résolution manuelle, `git add`, `git merge --continue`
- `git rebase` : linéarisation de l'historique — `rebase -i` (interactif)
- Rebase interactif : `pick`, `squash`, `fixup`, `reword`, `drop`, `edit`
- `git cherry-pick` : appliquer un commit spécifique sur une autre branche
- `git stash` : mise de côté temporaire — `push`, `pop`, `list`, `apply`, `drop`

**Sous-points :**
- Merge vs rebase : quand utiliser l'un ou l'autre
- `git reflog` : historique de toutes les opérations — filet de sécurité
- `ORIG_HEAD` : point de retour après un merge ou rebase

**Critères de maîtrise N4 :**
- [ ] Résoudre un conflit de merge à 3 voies (ours, theirs, base) sans outil graphique
- [ ] Réécrire l'historique des 5 derniers commits avec `rebase -i` (squash + reword)
- [ ] Récupérer un commit perdu après un `git reset --hard` avec `reflog`

---

### 2.3 Collaboration & workflows
**Grands points :**
- Remote : `git remote add`, `git fetch`, `git pull` (= fetch + merge), `git push`
- `git pull --rebase` : récupérer + rebaser — préserve un historique linéaire
- `origin` vs `upstream` : conventions de nommage
- Tags : `git tag -a v1.0 -m "..."` — annotés vs légers
- Workflows courants :
  - **GitHub Flow** : `main` + feature branches + PR
  - **Gitflow** : `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`
  - **Trunk-based development** : commits directs sur `main` + feature flags
- Pull Request / Merge Request : convention, review, checks obligatoires
- `git bisect` : recherche dichotomique d'un commit introduisant un bug

**Sous-points :**
- Signed commits : `git commit -S` avec GPG
- `git worktree` : plusieurs working directories sur le même dépôt
- Submodules : `git submodule` — dépendances de dépôts
- `.git/hooks/` : pre-commit, commit-msg, pre-push

**Critères de maîtrise N4 :**
- [ ] Trouver le commit exact qui a introduit un bug avec `git bisect run <test-script>`
- [ ] Configurer un hook pre-commit qui lance `shellcheck` et `clang-format`
- [ ] Migrer un dépôt de Gitflow vers Trunk-Based Development

---

### 2.4 Gestion avancée de l'historique
**Grands points :**
- `git reset` : `--soft` (garde le staging), `--mixed` (vide le staging), `--hard` (vide tout)
- `git revert` : annulation propre avec nouveau commit — utilisé sur `main`
- `git clean -fd` : supprimer les fichiers non-trackés
- `git archive` : exporter sans `.git/`
- `git shortlog` : résumé des contributions par auteur
- `git blame` : `q`, `-L` (plage de lignes), `--ignore-rev`

**Critères de maîtrise N4 :**
- [ ] Expliquer quand utiliser `revert` vs `reset` et les risques de chacun sur une branche partagée
- [ ] Annuler proprement un merge commit déjà pushé

---

**Sources — Git :**
| Ressource | Type | Lien |
|-----------|------|------|
| *Pro Git* (Chacon & Straub) | Livre officiel libre | https://git-scm.com/book/en/v2 |
| Git Documentation officielle | Officielle | https://git-scm.com/docs |
| Atlassian Git Tutorials | Guides | https://www.atlassian.com/git/tutorials |
| *Git Internals* (Chacon) | Approfondissement | https://github.com/pluralsight/git-internals-pdf |
| `man git-rebase`, `man git-bisect` | Man pages | Local |

---

## 3. Conteneurs — Docker & Podman

### Prérequis
- D2 : système de fichiers, utilisateurs, réseau de base
- D1 : processus, espace d'adressage, appels système (concept de namespaces)

### 3.1 Concepts fondamentaux des conteneurs
**Grands points :**
- Différence VM vs conteneur : namespaces + cgroups vs hyperviseur + OS complet
- Namespaces Linux : `pid`, `net`, `mnt`, `uts`, `ipc`, `user`, `cgroup` — ce qu'ils isolent
- Cgroups v2 : limitation des ressources (CPU, mémoire, I/O)
- OverlayFS : système de couches — base de l'image Docker
- Container runtime : runc (bas niveau), containerd, Docker daemon
- OCI (Open Container Initiative) : standard image + runtime
- Registries : Docker Hub, Quay.io, registries privés, GHCR

**Critères de maîtrise N4 :**
- [ ] Expliquer pourquoi un conteneur n'est pas une VM en 3 concepts clés
- [ ] Créer un conteneur manuellement avec `unshare` et `chroot` pour comprendre les namespaces
- [ ] Expliquer ce qu'est une couche OverlayFS dans une image Docker

---

### 3.2 Docker — usage pratique
**Grands points :**
- Cycle de vie : image → conteneur → running → stopped → removed
- `docker pull`, `docker push`
- `docker run` : `-d` (detached), `-it` (interactif), `-p` (ports), `-v` (volumes), `--name`, `--rm`, `--env`, `--network`
- `docker ps` : `-a` (tous), `-q` (IDs seulement)
- `docker exec -it <container> bash` : shell dans un conteneur en cours
- `docker logs <container>` : `-f`, `--tail`
- `docker stop`, `docker kill`, `docker rm`
- `docker images`, `docker rmi`, `docker image prune`
- `docker inspect` : JSON complet des métadonnées
- `docker stats` : ressources consommées en temps réel
- `docker cp` : copier des fichiers entre hôte et conteneur

**Sous-points :**
- Différence entre `docker stop` (SIGTERM + grace period) et `docker kill` (SIGKILL)
- Volumes nommés vs bind mounts vs tmpfs : cas d'usage
- `docker system prune` : nettoyage général
- Port mapping : `0.0.0.0:8080:80/tcp` — accès depuis l'extérieur vs `127.0.0.1:8080:80`

**Critères de maîtrise N4 :**
- [ ] Lancer une application avec persistance de données et variables d'environnement
- [ ] Inspecter un conteneur en cours pour trouver sa config réseau, ses volumes, son PID
- [ ] Expliquer pourquoi les données dans un conteneur sans volume sont perdues à la suppression

---

### 3.3 Dockerfile — construction d'images
**Grands points :**
- Instructions Dockerfile :
  - `FROM` : image de base — `FROM scratch` pour images minimales
  - `RUN` : exécuter commandes à la construction
  - `COPY` vs `ADD` : différences, préférer `COPY`
  - `WORKDIR` : répertoire de travail
  - `ENV` : variables d'environnement dans l'image
  - `ARG` : variables de construction (`docker build --build-arg`)
  - `EXPOSE` : documentation des ports (non contraignant)
  - `ENTRYPOINT` vs `CMD` : différences et combinaisons
  - `USER` : exécuter en tant qu'utilisateur non-root
  - `HEALTHCHECK` : vérification de santé
  - `LABEL` : métadonnées
- Multi-stage builds : `FROM base AS builder` → `FROM runtime` + `COPY --from=builder`
- Optimisation des couches : grouper les `RUN`, ordonner pour maximiser le cache
- `.dockerignore` : exclure les fichiers inutiles du contexte de build

**Sous-points :**
- Format exec vs shell pour `CMD`/`ENTRYPOINT` : `["cmd", "arg"]` vs `cmd arg`
- PID 1 dans un conteneur : problèmes avec les signaux — `tini` ou `--init`
- `docker build --no-cache`, `--target`, `--platform`
- BuildKit : mode de build moderne — `DOCKER_BUILDKIT=1`

**Critères de maîtrise N4 :**
- [ ] Écrire un Dockerfile multi-stage pour une application C (build + runtime minimal)
- [ ] Réduire la taille d'une image de 500 MB à moins de 50 MB avec les bonnes techniques
- [ ] Identifier et corriger 5 mauvaises pratiques dans un Dockerfile fourni

---

### 3.4 Docker Compose
**Grands points :**
- `docker-compose.yml` / `compose.yaml` : définition de stacks multi-services
- Version du format : `compose spec` (actuel)
- Services, réseaux, volumes dans Compose
- `image:` vs `build:` pour un service
- `depends_on:` avec conditions : `service_healthy`, `service_started`
- `environment:` et `env_file:`
- `volumes:` : named volumes, bind mounts
- `ports:`, `expose:`
- `restart:` : `no`, `always`, `on-failure`, `unless-stopped`
- `networks:` : isolation et communication inter-services
- `healthcheck:` au niveau service

**Commandes :**
- `docker compose up -d`, `down`, `ps`, `logs -f`, `exec`, `build`, `pull`
- `docker compose up --build` : rebuild avant démarrage
- `docker compose scale <service>=N`

**Critères de maîtrise N4 :**
- [ ] Écrire un stack Compose : app web + base de données + reverse proxy nginx
- [ ] Configurer les healthchecks pour que l'app attende que la DB soit prête
- [ ] Migrer une application `docker run` manuelle vers un `compose.yaml` complet

---

### 3.5 Podman — alternative rootless
**Grands points :**
- Différences Podman vs Docker : daemonless, rootless par défaut, compatible CLI
- `podman run`, `podman build`, `podman ps` — commandes identiques à Docker
- Pods : `podman pod create`, `podman pod start`
- Rootless : UID mapping, userns, implications de sécurité
- `podman generate systemd` : générer une unit systemd pour un conteneur
- `podman play kube` : déployer depuis un fichier YAML Kubernetes
- `skopeo` : inspection et copie d'images entre registries sans démon

**Critères de maîtrise N4 :**
- [ ] Lancer un serveur web en mode rootless avec Podman et vérifier l'absence de root
- [ ] Générer et activer une unit systemd depuis un conteneur Podman

---

**Sources — Conteneurs :**
| Ressource | Type | Lien |
|-----------|------|------|
| Docker Documentation officielle | Officielle | https://docs.docker.com |
| OCI Spec | Standard | https://opencontainers.org |
| Podman Documentation | Officielle | https://docs.podman.io |
| *Docker Deep Dive* (Poulton) | Livre | Biblio |
| Linux namespaces man pages | Officielle | `man 7 namespaces` |
| cgroups v2 documentation | Kernel | https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html |

---

## 4. CI/CD — Intégration et déploiement continus

### Prérequis
- Section 2 (Git)
- Section 3 (conteneurs)

### 4.1 Principes du CI/CD
**Grands points :**
- CI (Continuous Integration) : tester chaque commit automatiquement
- CD (Continuous Delivery) : artefact toujours prêt à déployer
- CD (Continuous Deployment) : déploiement automatique en production
- Pipeline : enchaînement de stages (build → test → package → deploy)
- Artefacts : binaires, images Docker, paquets — versionner et archiver
- Environnements : dev, staging, production — isolation et promotion
- Idempotence : un pipeline relancé doit produire le même résultat
- Fail fast : arrêter tôt en cas d'erreur

**Critères de maîtrise N4 :**
- [ ] Définir la différence entre Continuous Delivery et Continuous Deployment
- [ ] Dessiner un pipeline CI/CD complet pour un projet C avec tests
- [ ] Expliquer ce qu'un pipeline garantit qu'un déploiement manuel ne peut pas garantir

---

### 4.2 GitHub Actions
**Grands points :**
- Structure : `.github/workflows/<name>.yml`
- Événements déclencheurs : `push`, `pull_request`, `schedule`, `workflow_dispatch`, `release`
- `jobs` : unités d'exécution parallèle ou séquentielle
- `steps` : séquence d'actions dans un job
- `runs-on` : OS du runner (`ubuntu-latest`, `self-hosted`)
- `uses` : réutilisation d'actions (`actions/checkout@v4`, `actions/setup-node@v4`)
- `run` : commandes shell
- `env` : variables d'environnement — niveaux workflow, job, step
- `secrets` : `${{ secrets.MY_SECRET }}` — ne jamais logguer
- `needs` : dépendances entre jobs
- `if` : conditions d'exécution (`on: push: branches: [main]`, `if: github.ref == 'refs/heads/main'`)
- Cache : `actions/cache` pour accélérer les builds
- Matrix : `strategy.matrix` pour tester sur plusieurs configs
- Artifacts : `actions/upload-artifact`, `actions/download-artifact`

**Critères de maîtrise N4 :**
- [ ] Écrire un workflow qui compile un projet C, lance les tests et publie l'artefact
- [ ] Configurer une matrix pour tester sur Ubuntu 22.04 et 24.04 et Fedora
- [ ] Utiliser un secret GitHub Actions pour déployer via SSH sans exposer la clé

---

### 4.3 GitLab CI/CD (notions)
**Grands points :**
- `.gitlab-ci.yml` : fichier de pipeline
- Stages, jobs, scripts
- Variables CI/CD : prédéfinies (`CI_COMMIT_SHA`, `CI_REGISTRY_IMAGE`) et personnalisées
- Cache et artefacts
- Environments et déploiements
- Runners : shared, specific, Docker executor
- Auto DevOps

**Critères de maîtrise N4 :**
- [ ] Convertir un workflow GitHub Actions basique en pipeline GitLab CI équivalent
- [ ] Configurer un pipeline avec déploiement conditionnel sur `main` seulement

---

### 4.4 Stratégies de déploiement
**Grands points :**
- Blue/Green deployment : deux environnements identiques, bascule instantanée
- Rolling deployment : remplacement progressif des instances
- Canary deployment : déploiement à un sous-ensemble d'utilisateurs
- Feature flags : activation de fonctionnalités sans redéploiement
- Rollback : stratégies et automatisation
- Health checks et readiness/liveness probes
- Zero-downtime deployment : prérequis et patterns

**Critères de maîtrise N4 :**
- [ ] Implémenter un déploiement blue/green avec nginx comme load balancer
- [ ] Configurer un rollback automatique basé sur un health check qui échoue

---

**Sources — CI/CD :**
| Ressource | Type | Lien |
|-----------|------|------|
| GitHub Actions Documentation | Officielle | https://docs.github.com/en/actions |
| GitLab CI/CD Documentation | Officielle | https://docs.gitlab.com/ee/ci/ |
| *Continuous Delivery* (Humble & Farley) | Livre de référence | Biblio |
| *The DevOps Handbook* (Kim, Humble, Debois, Willis) | Livre | Biblio |

---

## 5. Infrastructure as Code (IaC)

### Prérequis
- D2 complet (administration système)
- Section 3 (conteneurs)

### 5.1 Ansible — automatisation de configuration
**Grands points :**
- Architecture : control node → managed nodes via SSH, sans agent
- Inventaire : statique (`/etc/ansible/hosts`, `inventory.ini`) et dynamique
- Format inventaire : groupes, variables, sous-groupes
- `ansible` (ad-hoc) vs `ansible-playbook`
- Modules essentiels : `command`, `shell`, `copy`, `template`, `file`, `user`, `group`, `service`, `package`, `apt`, `dnf`, `yum`
- Playbook : YAML — `hosts`, `become`, `tasks`, `vars`, `handlers`
- `become: yes` + `become_user` : élévation de privilèges
- Variables : `vars`, `vars_files`, `host_vars/`, `group_vars/`, `register`
- Templates Jinja2 : `{{ variable }}`, `{% if %}`, `{% for %}`
- Handlers : actions déclenchées sur `notify` — redémarrage de services
- Tags : exécution sélective de tâches
- Roles : structure réutilisable — `tasks/`, `handlers/`, `templates/`, `defaults/`, `vars/`
- `ansible-vault` : chiffrement des secrets
- Idempotence : vérifier avec `--check` (dry run)

**Critères de maîtrise N4 :**
- [ ] Écrire un playbook qui configure un serveur web complet (nginx + app + SSL) de zéro
- [ ] Créer un rôle Ansible réutilisable pour la création d'utilisateurs
- [ ] Identifier et corriger un playbook non-idempotent

---

### 5.2 Terraform — infrastructure déclarative
**Grands points :**
- HashiCorp Configuration Language (HCL) : syntaxe de base
- Providers : AWS, GCP, Azure, Docker, libvirt (local)
- Resources : blocs de création d'infrastructure
- Data sources : lecture d'infrastructure existante
- Variables : `variable`, `locals`, `output`
- State : `terraform.tfstate` — source de vérité — **ne jamais modifier manuellement**
- Remote state : S3, GCS, Terraform Cloud
- Commandes : `terraform init`, `plan`, `apply`, `destroy`, `show`, `import`, `refresh`
- Modules : réutilisation de configurations — locaux et publics (Terraform Registry)
- Workspace : `terraform workspace` — environnements multiples

**Sous-points :**
- `terraform plan` : prévisualisation obligatoire avant `apply`
- State locking : éviter les modifications concurrentes
- `terraform import` : importer des ressources existantes dans le state
- Dépendances implicites (`references`) vs explicites (`depends_on`)

**Critères de maîtrise N4 :**
- [ ] Créer une infrastructure locale avec Terraform + provider Docker (réseau + conteneurs)
- [ ] Expliquer les risques d'un `terraform apply` sans `plan` préalable
- [ ] Moduler un projet Terraform en 3 modules réutilisables

---

**Sources — IaC :**
| Ressource | Type | Lien |
|-----------|------|------|
| Ansible Documentation | Officielle | https://docs.ansible.com |
| Terraform Documentation | Officielle | https://developer.hashicorp.com/terraform/docs |
| *Ansible for DevOps* (Geerling) | Livre | https://www.ansiblefordevops.com |
| *Terraform: Up & Running* (Brikman) | Livre | Biblio |
| Ansible Galaxy | Rôles communautaires | https://galaxy.ansible.com |

---

## 6. Monitoring & observabilité

### Prérequis
- D2.5 (logs système)
- Section 3 (conteneurs)

### 6.1 Les trois piliers de l'observabilité
**Grands points :**
- **Métriques** : données numériques agrégées dans le temps (CPU %, requêtes/s, latence p99)
- **Logs** : événements textuels horodatés — structurés (JSON) vs non-structurés
- **Traces** : suivi d'une requête à travers plusieurs services (distributed tracing)
- Différences entre monitoring (alertes) et observabilité (exploration)
- SLI/SLO/SLA : indicateurs, objectifs et accords de niveau de service
- Error budget : marge de tolérance aux pannes

**Critères de maîtrise N4 :**
- [ ] Différencier une métrique, un log et une trace avec un exemple concret dans un système web
- [ ] Définir un SLO pertinent pour un API (disponibilité + latence) et calculer son error budget mensuel

---

### 6.2 Prometheus & Grafana
**Grands points :**
- Prometheus : collecte de métriques par scraping HTTP (`/metrics`)
- Modèle de données : métrique + labels + valeur + timestamp
- Types de métriques : counter, gauge, histogram, summary
- `prometheus.yml` : configuration des scrape configs
- PromQL : langage de requête — `rate()`, `irate()`, `increase()`, `sum by()`, `avg_over_time()`
- Alertmanager : routing, grouping, inhibition, silences, receivers
- Exporters : `node_exporter` (system), `blackbox_exporter` (probes), exporters custom
- Grafana : dashboards, datasources, panels, alerting
- Dashboards JSON : import/export, dashboards communautaires (grafana.com/dashboards)

**Critères de maîtrise N4 :**
- [ ] Déployer Prometheus + node_exporter + Grafana avec Docker Compose
- [ ] Écrire une requête PromQL qui calcule le taux d'erreur 5xx d'un serveur web
- [ ] Configurer une alerte qui se déclenche quand le disque est rempli à 85%

---

### 6.3 Stack ELK / EFK — logs centralisés
**Grands points :**
- Elasticsearch : stockage et indexation des logs
- Logstash / Fluentd : collecte et transformation
- Kibana : visualisation et exploration
- Beats (Filebeat, Metricbeat) : agents légers de collecte
- Index patterns, Discover, Visualize, Dashboard dans Kibana
- Pipelines de traitement : parsing des logs, enrichissement, filtrage
- Rotation et rétention des index

**Critères de maîtrise N4 :**
- [ ] Déployer un stack EFK minimal avec Docker Compose et y envoyer des logs applicatifs
- [ ] Créer un dashboard Kibana pour suivre les erreurs 500 d'un serveur web

---

**Sources — Monitoring :**
| Ressource | Type | Lien |
|-----------|------|------|
| Prometheus Documentation | Officielle | https://prometheus.io/docs/ |
| Grafana Documentation | Officielle | https://grafana.com/docs/ |
| Elasticsearch Documentation | Officielle | https://www.elastic.co/guide/en/elasticsearch/reference/ |
| *Site Reliability Engineering* (Google) | Livre libre | https://sre.google/sre-book/table-of-contents/ |
| *Observability Engineering* (Majors, Fong-Jones, Miranda) | Livre | Biblio |

---

## 7. Sécurité DevSecOps

### Prérequis
- D2.8 (sécurité système)
- Sections 2, 3, 4 (Git, conteneurs, CI/CD)

### 7.1 Principe Shift Left — sécurité dès le développement
**Grands points :**
- Shift left : intégrer la sécurité le plus tôt possible dans le cycle
- Threat modeling : STRIDE (Spoofing, Tampering, Repudiation, Info disclosure, DoS, Elevation)
- Secure coding practices : validation des entrées, gestion des secrets, principe du moindre privilège
- OWASP Top 10 : connaître les 10 vulnérabilités les plus critiques du web
- Supply chain security : dépendances, SBOMs (Software Bill of Materials)

**Critères de maîtrise N4 :**
- [ ] Faire un threat model simplifié (STRIDE) d'une API REST avec authentification
- [ ] Identifier 3 des 10 vulnérabilités OWASP dans un code fourni

---

### 7.2 Analyse de code & dépendances
**Grands points :**
- SAST (Static Application Security Testing) :
  - `cppcheck` : analyse statique C
  - `clang-tidy` + `clang-analyzer` : analyse avancée C/C++
  - `semgrep` : règles de sécurité multi-langages
  - `bandit` (Python), `gosec` (Go)
- DAST (Dynamic Application Security Testing) : tests en boîte noire sur une app en cours
- SCA (Software Composition Analysis) : audit des dépendances
  - `cargo audit` (Rust)
  - Snyk, Trivy (pour les conteneurs)
- `trivy image <image>` : scan de vulnérabilités d'une image Docker
- `grype` : autre scanner d'images et SBOMs
- SBOM : `syft` pour générer, `grype` pour scanner

**Critères de maîtrise N4 :**
- [ ] Intégrer `trivy` dans un pipeline CI/CD qui échoue si une CVE critique est détectée
- [ ] Générer un SBOM pour une image Docker et identifier ses dépendances
- [ ] Corriger les findings de `cppcheck` sur un programme C fourni

---

### 7.3 Sécurité des secrets
**Grands points :**
- Règle absolue : ne jamais committer de secret dans Git
- `git-secrets` / `trufflehog` / `gitleaks` : détection de secrets dans les dépôts
- `.gitignore` pour les fichiers de secrets locaux
- Gestion des secrets :
  - Fichiers `.env` hors du dépôt (`.env.example` committé, `.env` ignoré)
  - Variables d'environnement CI/CD (GitHub Secrets, GitLab CI Variables)
  - HashiCorp Vault : gestion centralisée des secrets, rotation
  - `age` / `sops` : chiffrement de fichiers de configuration
- Rotation des secrets : automatisation, durée de vie limitée
- Least privilege pour les tokens : scopes minimaux, expiration courte

**Critères de maîtrise N4 :**
- [ ] Scanner un dépôt Git avec `gitleaks` et identifier un secret dans l'historique
- [ ] Configurer `sops` pour chiffrer un fichier de secrets avec une clé age
- [ ] Mettre en place un workflow CI/CD qui lit les secrets depuis les variables d'environnement du CI

---

### 7.4 Sécurité des conteneurs
**Grands points :**
- Images de base : préférer les images minimales (Alpine, distroless, scratch)
- Utilisateurs non-root dans les conteneurs : `USER` dans le Dockerfile
- Lecture seule du FS : `--read-only` + `tmpfs` pour les répertoires d'écriture
- Capabilities Linux : `--cap-drop=ALL --cap-add=NET_BIND_SERVICE` — principe du moindre privilège
- `seccomp` : profils de filtrage des syscalls
- AppArmor / SELinux profiles pour les conteneurs
- Scan d'images : Trivy, Grype — intégration registre
- Docker Content Trust (DCT) : signature d'images
- Rootless Docker / Podman : réduction de la surface d'attaque
- Réseau : isolation des conteneurs, pas d'exposition inutile de ports

**Critères de maîtrise N4 :**
- [ ] Auditer une image Docker existante et appliquer 5 mesures de durcissement
- [ ] Configurer un conteneur avec `--cap-drop=ALL` et identifier les capabilities à rajouter
- [ ] Créer un profil seccomp qui bloque les syscalls non-nécessaires pour une app web

---

### 7.5 Conformité & audit continu
**Grands points :**
- InSpec (Chef) / Goss : tests d'infrastructure as code
- OpenSCAP : audit de conformité automatisé (RHEL/Fedora)
- Compliance as Code : DISA STIG, CIS Benchmark
- Audit trail : `auditd` + SIEM
- Vulnerability management : CVE tracking, patch management automatisé
- Dependabot / Renovate : mises à jour automatiques des dépendances

**Critères de maîtrise N4 :**
- [ ] Écrire des tests InSpec qui vérifient la conformité de base d'un serveur
- [ ] Configurer Dependabot pour créer des PRs automatiques de mise à jour

---

**Sources — DevSecOps :**
| Ressource | Type | Lien |
|-----------|------|------|
| OWASP Top 10 | Référentiel officiel | https://owasp.org/www-project-top-ten/ |
| OWASP DevSecOps Guideline | Guide officiel | https://owasp.org/www-project-devsecops-guideline/ |
| Trivy documentation | Officielle | https://trivy.dev/latest/ |
| HashiCorp Vault documentation | Officielle | https://developer.hashicorp.com/vault/docs |
| *Hacking: The Art of Exploitation* (Erickson) | Référence sécurité | Biblio |
| NIST SSDF (Secure Software Development Framework) | Standard | https://csrc.nist.gov/Projects/ssdf |
| *DevSecOps* (Falco & Bird) | Livre | Biblio |
| gitleaks documentation | Outil | https://github.com/gitleaks/gitleaks |
| CIS Docker Benchmark | Référentiel | https://www.cisecurity.org/benchmark/docker |
