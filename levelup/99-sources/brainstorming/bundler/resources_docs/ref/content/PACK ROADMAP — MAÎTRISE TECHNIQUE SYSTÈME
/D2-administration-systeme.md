# D2 — ADMINISTRATION SYSTÈME LINUX
## Roadmap de maîtrise — De la ligne de commande au système durci

> **Domaine secondaire.** Soutient et complète le développement système.
> Environnement cible : Linux (Fedora/RHEL family + Debian/Ubuntu).

---

## Table des matières

1. [Shell, terminal & environnement de travail](#1-shell-terminal--environnement-de-travail)
2. [Système de fichiers Linux](#2-système-de-fichiers-linux)
3. [Utilisateurs, groupes & permissions](#3-utilisateurs-groupes--permissions)
4. [Gestion des services — systemd](#4-gestion-des-services--systemd)
5. [Logs & surveillance système](#5-logs--surveillance-système)
6. [Stockage, partitions & LVM](#6-stockage-partitions--lvm)
7. [Réseau — configuration & diagnostic](#7-réseau--configuration--diagnostic)
8. [Sécurité système — durcissement](#8-sécurité-système--durcissement)

---

## 1. Shell, terminal & environnement de travail

### Prérequis
- Savoir démarrer une machine Linux

### 1.1 Le shell — concepts fondamentaux
**Grands points :**
- Définition : programme interpréteur de commandes entre l'utilisateur et le noyau
- Shells courants : `bash` (focus), `zsh`, `sh` (POSIX)
- Shell interactif vs shell de script vs shell de connexion (login shell)
- Fichiers de configuration : `.bashrc`, `.bash_profile`, `.profile`, `/etc/profile`, `/etc/bash.bashrc`
- Variables d'environnement : `PATH`, `HOME`, `USER`, `SHELL`, `LANG`, `PS1`
- `export` : rendre une variable disponible aux sous-processus
- Prompt customization : `PS1`, codes de couleur ANSI
- History : `~/.bash_history`, `HISTSIZE`, `HISTFILESIZE`, `HISTCONTROL`, `Ctrl+R`

**Sous-points :**
- Ordre de recherche d'une commande : alias → function → builtin → `$PATH`
- `type <cmd>` : identifier la nature d'une commande
- `which` vs `command -v` : différences
- Subshell vs shell courant : `(cmd)` vs `{ cmd; }`
- `source` / `.` : exécuter un fichier dans le shell courant

**Critères de maîtrise N4 :**
- [ ] Expliquer pourquoi `export VAR=val` est nécessaire pour les sous-processus
- [ ] Reconstruire un `PATH` cassé sans redémarrer la session
- [ ] Identifier si une commande est un builtin, un alias ou un binaire externe

---

### 1.2 Commandes fondamentales
**Grands points :**

**Navigation & fichiers :**
- `ls` : `-l`, `-a`, `-h`, `-R`, `-t`, `-S` — comprendre toutes les colonnes
- `cd`, `pwd` — chemins absolus vs relatifs, `cd -`, `cd ~`
- `cp` : `-r`, `-p` (préserver attributs), `-u` (update)
- `mv`, `rm` : `-r`, `-f` — pièges du `rm -rf`
- `mkdir` : `-p` (parents), `mkdir -p a/b/c`
- `find` : `-name`, `-type`, `-size`, `-mtime`, `-user`, `-perm`, `-exec`
- `locate` / `updatedb`

**Lecture & recherche dans les fichiers :**
- `cat`, `less`, `more`, `head`, `tail` : `-n`, `-f` (tail -f pour les logs)
- `grep` : `-r`, `-n`, `-i`, `-v`, `-E` (regex étendue), `-l`, `-c`, `-A`, `-B`, `-C`
- `awk` : syntaxe de base, `$1`..`$NF`, `NR`, `BEGIN/END`, pattern matching
- `sed` : substitution `s/pattern/replacement/g`, suppression, insertion
- `cut` : `-d` (délimiteur), `-f` (champs)
- `sort` : `-n`, `-r`, `-k`, `-u`
- `uniq` : `-c`, `-d`
- `wc` : `-l`, `-w`, `-c`
- `tr` : traduction de caractères
- `diff` : comparaison de fichiers, format unified (`-u`)

**Redirections & pipes :**
- Stdout (`>`), stderr (`2>`), both (`&>` ou `2>&1`)
- Append (`>>`)
- Stdin (`<`), here-document (`<<EOF`)
- Pipe (`|`) : chaîne de traitements
- `tee` : lire stdin et écrire vers stdout + fichier
- Process substitution : `<(cmd)` et `>(cmd)`

**Critères de maîtrise N4 :**
- [ ] Extraire les 10 IP les plus fréquentes d'un log Apache avec `awk/sort/uniq`
- [ ] Trouver tous les fichiers modifiés dans les 24h appartenant à un utilisateur donné
- [ ] Remplacer une chaîne dans 50 fichiers en une commande `find + sed`

---

### 1.3 Gestion des processus depuis le shell
**Grands points :**
- `ps` : `-aux`, `-ef`, `-p <pid>`, `-u <user>` — colonnes à connaître
- `top` / `htop` : lecture interactive, tri, kill depuis l'interface
- `kill` : `-9` (SIGKILL), `-15` (SIGTERM), `-HUP` — différences
- `killall`, `pkill`, `pgrep`
- `nice` / `renice` : priorité de scheduling (valeurs -20 à +19)
- Jobs en arrière-plan : `&`, `jobs`, `fg`, `bg`, `nohup`, `disown`
- `Ctrl+C` (SIGINT), `Ctrl+Z` (SIGTSTP), `Ctrl+D` (EOF)

**Critères de maîtrise N4 :**
- [ ] Lancer un processus en arrière-plan, le détacher du terminal et vérifier qu'il tourne
- [ ] Identifier le processus consommant le plus de mémoire et l'arrêter proprement
- [ ] Changer la priorité d'un processus existant sans le relancer

---

**Sources — Shell & commandes :**
| Ressource | Type | Lien |
|-----------|------|------|
| GNU Bash Manual | Officielle | https://www.gnu.org/software/bash/manual/ |
| Advanced Bash Scripting Guide | Guide complet | https://tldp.org/LDP/abs/html/ |
| *The Linux Command Line* (Shotts) | Livre libre | https://linuxcommand.org/tlcl.php |
| `man bash` | Man page | Local |
| explainshell.com | Outil d'analyse | https://explainshell.com |

---

## 2. Système de fichiers Linux

### Prérequis
- Section 1 (navigation shell)

### 2.1 Hiérarchie FHS (Filesystem Hierarchy Standard)
**Grands points :**
- Standard FHS : organisation canonique Linux
- Répertoires essentiels et leur rôle :
  - `/` : racine
  - `/bin`, `/sbin`, `/usr/bin`, `/usr/sbin` : binaires (et évolution vers `/usr/bin` unifié)
  - `/etc` : configuration système
  - `/var` : données variables (logs, spool, mail)
  - `/tmp`, `/run` : temporaires (en RAM)
  - `/home` : répertoires utilisateurs
  - `/root` : home de root
  - `/proc` : interface noyau (pseudo-filesystem)
  - `/sys` : information matériel et paramètres noyau
  - `/dev` : fichiers de périphériques
  - `/mnt`, `/media` : points de montage
  - `/boot` : noyau, initramfs, GRUB
  - `/lib`, `/lib64`, `/usr/lib` : bibliothèques partagées
  - `/opt` : logiciels tiers
  - `/srv` : données de services
  - `/usr` : ressources partagées en lecture seule

**Critères de maîtrise N4 :**
- [ ] Localiser sans hésitation le fichier de configuration de n'importe quel service
- [ ] Expliquer pourquoi des données dynamiques vont dans `/var` et non `/etc`
- [ ] Identifier ce qu'on trouve dans `/proc/cpuinfo`, `/proc/meminfo`, `/proc/net/dev`

---

### 2.2 Types de fichiers & inodes
**Grands points :**
- Types : régulier (`-`), répertoire (`d`), lien symbolique (`l`), socket (`s`), pipe (`p`), block device (`b`), character device (`c`)
- Inode : métadonnées + pointeurs vers blocs de données — numéro unique par FS
- `stat` : afficher les métadonnées complètes d'un fichier
- Lien dur : partage d'inode — même contenu, deux entrées de répertoire
- Lien symbolique : fichier contenant un chemin — peut être cassé
- Différences pratiques : liens durs et FS boundaries, liens symboliques et chemins relatifs

**Sous-points :**
- `df -i` : utilisation des inodes (peut être saturé avant l'espace disque)
- Fichiers supprimés mais encore ouverts : inode maintenu jusqu'à fermeture des fd
- Device files : major/minor numbers, `mknod`
- Sparse files : trous dans un fichier — `ls -lh` vs `du -h`

**Critères de maîtrise N4 :**
- [ ] Créer un lien dur, modifier le fichier source, observer les deux entrées
- [ ] Trouver un processus qui garde ouvert un fichier supprimé avec `lsof`
- [ ] Expliquer pourquoi un lien dur ne peut pas traverser une frontière de FS

---

### 2.3 Systèmes de fichiers — types & opérations
**Grands points :**
- Types courants : `ext4` (par défaut), `xfs` (RHEL), `btrfs`, `tmpfs`, `vfat`, `ntfs`
- Caractéristiques : journalisation, performance, limites de taille/fichier
- `mkfs.ext4`, `mkfs.xfs` : création de FS
- `mount` / `umount` : montage et démontage
- `/etc/fstab` : montages persistants — format, options, champs
- `findmnt` : arbre des montages actifs
- `mount --bind` : bind mount — répertoire monté en second point
- `fsck` : vérification et réparation d'un FS
- `tune2fs` : ajustement des paramètres ext2/3/4
- `xfs_info`, `xfs_repair`

**Sous-points :**
- Options de montage communes : `noexec`, `nosuid`, `nodev`, `ro`, `relatime`
- `tmpfs` : FS en RAM — `/tmp`, `/run`, `/dev/shm`
- `overlayfs` : couches superposées — base de Docker
- `loop device` : monter une image disque comme un FS
- `autofs` : montage à la demande

**Critères de maîtrise N4 :**
- [ ] Créer une partition, la formater en ext4 et l'ajouter à `/etc/fstab`
- [ ] Identifier le FS d'un point de montage et ses options actives avec `findmnt`
- [ ] Faire un fsck sur un volume démonté et interpréter le rapport

---

**Sources — Système de fichiers :**
| Ressource | Type | Lien |
|-----------|------|------|
| Filesystem Hierarchy Standard | Standard officiel | https://refspecs.linuxfoundation.org/fhs.shtml |
| ext4 documentation (kernel) | Officielle | https://www.kernel.org/doc/html/latest/filesystems/ext4/ |
| XFS documentation | Officielle | https://xfs.wiki.kernel.org |
| `man 5 fstab` | Man page | Local |
| *How Linux Works* (Ward) | Livre | Biblio |

---

## 3. Utilisateurs, groupes & permissions

### Prérequis
- Section 2 (système de fichiers)

### 3.1 Utilisateurs & groupes
**Grands points :**
- `/etc/passwd` : format, champs (login, UID, GID, home, shell)
- `/etc/shadow` : mots de passe hachés — format, champs de vieillissement
- `/etc/group` : groupes et membres
- `/etc/gshadow` : mots de passe de groupes
- UIDs : root (0), système (1–999), utilisateurs (≥1000)
- `useradd`, `usermod`, `userdel` — options importantes
- `groupadd`, `groupmod`, `groupdel`
- `passwd` : changer un mot de passe
- `id` : UID, GID et groupes d'un utilisateur
- `who`, `w`, `last`, `lastlog` : utilisateurs connectés et historique
- `su` vs `sudo` : différences, cas d'usage

**Sous-points :**
- `/etc/skel` : template du répertoire home
- UID/GID en dehors des plages standard : impact sur la sécurité
- `nologin` et `false` comme shell : comptes de service
- PAM (Pluggable Authentication Modules) : cadre d'authentification
- `getent passwd` : lire les databases NSS (fichiers locaux + LDAP/NIS)

**Critères de maîtrise N4 :**
- [ ] Créer un compte de service sans home, sans login, dans un groupe dédié
- [ ] Lire `/etc/shadow` et identifier les champs de politique de mot de passe
- [ ] Ajouter un utilisateur à un groupe supplémentaire sans le retirer des autres

---

### 3.2 Permissions Unix classiques
**Grands points :**
- Modèle DAC (Discretionary Access Control)
- Triplet owner/group/others × read/write/execute
- Lecture de `ls -l` : type + permissions + nlinks + owner + group + size + date + name
- `chmod` : notation octale (`644`, `755`, `700`) et symbolique (`u+x`, `g-w`, `o=r`)
- `chown` : changer propriétaire et/ou groupe
- `chgrp`
- Permissions sur les répertoires : `r` = lister, `w` = créer/supprimer, `x` = traverser
- `umask` : masque de création de fichier — valeurs courantes

**Sous-points :**
- Bit SUID (`4---`) : exécution avec les droits du propriétaire (ex: `passwd`)
- Bit SGID (`2---`) sur fichier : exécution avec les droits du groupe
- Bit SGID sur répertoire : nouveaux fichiers héritent du groupe du répertoire
- Sticky bit (`1---`) sur répertoire : seul le propriétaire peut supprimer son fichier (ex: `/tmp`)
- ACL POSIX : `getfacl`, `setfacl` — permissions fines au-delà du triplet
- `chattr` et `lsattr` : attributs étendus ext2/3/4 (immutable, append-only)

**Critères de maîtrise N4 :**
- [ ] Calculer les permissions finales d'un fichier en tenant compte du umask
- [ ] Configurer un répertoire partagé entre deux utilisateurs avec SGID + permissions correctes
- [ ] Trouver tous les fichiers SUID sur le système et évaluer le risque

---

### 3.3 sudo & élévation de privilèges
**Grands points :**
- `/etc/sudoers` : format, règles, `NOPASSWD`, `!` (négation)
- `visudo` : édition sécurisée du sudoers
- `/etc/sudoers.d/` : fichiers de configuration additionnels
- Aliases dans sudoers : `User_Alias`, `Cmnd_Alias`, `Host_Alias`
- `sudo -l` : lister les commandes autorisées pour l'utilisateur courant
- Logs sudo : `/var/log/auth.log` ou `journalctl _COMM=sudo`
- `pkexec` : alternative PolicyKit pour les apps graphiques

**Critères de maîtrise N4 :**
- [ ] Configurer un utilisateur pour exécuter seulement deux commandes spécifiques sans mot de passe
- [ ] Lire les logs sudo et identifier une tentative d'abus
- [ ] Expliquer pourquoi `sudo -i` est différent de `sudo su -`

---

**Sources — Utilisateurs & permissions :**
| Ressource | Type | Lien |
|-----------|------|------|
| `man 5 passwd`, `man 5 shadow`, `man 5 sudoers` | Man pages | Local |
| Linux PAM documentation | Officielle | https://www.linux-pam.org/Linux-PAM-html/ |
| *Linux System Administration* (Adelstein & Lubanovic) | Livre | Biblio |
| RHEL 9 Managing users documentation | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9 |

---

## 4. Gestion des services — systemd

### Prérequis
- Section 3 (utilisateurs & permissions)

### 4.1 Architecture de systemd
**Grands points :**
- PID 1 : responsabilités d'init — démarrage des services, supervision, gestion des signaux
- Units : types — `service`, `socket`, `target`, `timer`, `path`, `mount`, `device`, `slice`
- Targets : analogues des runlevels — `multi-user.target`, `graphical.target`, `rescue.target`, `emergency.target`
- Dépendances : `Wants=`, `Requires=`, `After=`, `Before=`, `Conflicts=`
- Répertoires de configuration : `/lib/systemd/system/` (dist), `/etc/systemd/system/` (admin), `/run/systemd/system/` (runtime)
- Priorité : `/etc/systemd/system/` > `/run/systemd/system/` > `/lib/systemd/system/`

**Critères de maîtrise N4 :**
- [ ] Expliquer la différence entre `Wants=` et `Requires=` avec un exemple concret
- [ ] Identifier le target par défaut et changer le target de boot
- [ ] Dessiner l'arbre de dépendances de `sshd.service`

---

### 4.2 systemctl — gestion des services
**Grands points :**
- `systemctl start/stop/restart/reload <unit>` : gestion en live
- `systemctl enable/disable <unit>` : activation au démarrage (crée/supprime les symlinks)
- `systemctl status <unit>` : état, PID, logs récents, code de retour
- `systemctl is-active / is-enabled / is-failed`
- `systemctl list-units` : liste toutes les units actives
- `systemctl list-unit-files` : liste toutes les units et leur état d'activation
- `systemctl daemon-reload` : recharger après modification d'un fichier unit
- `systemctl mask/unmask` : désactivation totale (empêche tout démarrage)
- `systemctl isolate <target>` : basculer vers un target
- `systemctl poweroff`, `reboot`, `halt`, `emergency`
- `systemd-analyze` : temps de démarrage, `blame`, `critical-chain`

**Critères de maîtrise N4 :**
- [ ] Différencier `reload` vs `restart` et savoir quand choisir l'un ou l'autre
- [ ] Diagnostiquer un service en échec avec `systemctl status` + `journalctl`
- [ ] Identifier les 5 services les plus lents au démarrage avec `systemd-analyze blame`

---

### 4.3 Écrire une unit systemd
**Grands points :**
- Structure d'un fichier `.service` : sections `[Unit]`, `[Service]`, `[Install]`
- `[Unit]` : `Description=`, `After=`, `Wants=`, `Requires=`
- `[Service]` :
  - `Type=` : `simple`, `forking`, `notify`, `oneshot`, `idle`
  - `ExecStart=`, `ExecStop=`, `ExecReload=`
  - `Restart=` : `always`, `on-failure`, `on-abnormal`
  - `RestartSec=`, `StartLimitInterval=`, `StartLimitBurst=`
  - `User=`, `Group=` : exécution sous un compte dédié
  - `WorkingDirectory=`, `Environment=`, `EnvironmentFile=`
  - `StandardOutput=`, `StandardError=`
  - Hardening : `ProtectSystem=`, `PrivateTmp=`, `NoNewPrivileges=`, `ReadOnlyPaths=`
- `[Install]` : `WantedBy=multi-user.target`
- Drop-in files : `systemctl edit <unit>` — override partiel sans copier l'original

**Critères de maîtrise N4 :**
- [ ] Écrire une unit `.service` pour un serveur custom en C avec restart automatique
- [ ] Ajouter un drop-in pour surcharger `Restart=` sans modifier l'unit originale
- [ ] Créer une unit `timer` qui remplace un job cron

---

### 4.4 Timers systemd & cron
**Grands points :**
- `cron` classique : `/etc/crontab`, `/etc/cron.d/`, `crontab -e`
- Syntaxe cron : `minute heure jour mois jour_semaine commande`
- `anacron` : exécution des jobs manqués (machines non allumées 24h/24)
- Timers systemd : `.timer` + `.service` associé
- `OnCalendar=` : syntaxe — `daily`, `weekly`, `Mon *-*-* 09:00:00`
- `OnBootSec=`, `OnUnitActiveSec=` : timers relatifs
- `Persistent=true` : équivalent anacron

**Critères de maîtrise N4 :**
- [ ] Migrer un job cron quotidien vers un timer systemd
- [ ] Vérifier l'heure de prochain déclenchement d'un timer avec `systemctl list-timers`

---

**Sources — systemd :**
| Ressource | Type | Lien |
|-----------|------|------|
| systemd man pages (freedesktop) | Officielle | https://www.freedesktop.org/software/systemd/man/ |
| `man systemd.service`, `man systemd.timer` | Man pages | Local |
| RHEL 9 systemd Guide | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_basic_system_settings/ |
| *How Linux Works* (Ward) ch. 6 | Livre | Biblio |

---

## 5. Logs & surveillance système

### Prérequis
- Section 4 (systemd)

### 5.1 journald — système de logs systemd
**Grands points :**
- Architecture : journald collecte stdout/stderr des services, messages kernel, syslog
- `journalctl` : interface de lecture
  - Sans filtre : tous les logs depuis le boot courant
  - `-u <unit>` : logs d'un service
  - `-f` : mode follow (tail)
  - `-n <N>` : N dernières lignes
  - `-b` : depuis le boot courant (`-b -1` : boot précédent)
  - `--since "2h ago"`, `--until "2024-01-01 12:00"`
  - `-p err` : par priorité (emerg, alert, crit, err, warning, notice, info, debug)
  - `_PID=`, `_UID=`, `_COMM=` : filtres par champs
  - `-o json` : sortie JSON pour traitement
  - `-x` : messages augmentés avec documentation
- `/etc/systemd/journald.conf` : configuration — taille max, persistance
- `journalctl --vacuum-size=500M` : nettoyage

**Critères de maîtrise N4 :**
- [ ] Extraire toutes les erreurs SSH des 3 derniers jours en JSON
- [ ] Diagnostiquer pourquoi un service a redémarré 3 fois avec `journalctl -u service -b`

---

### 5.2 Syslog classique
**Grands points :**
- `rsyslog` : daemon syslog — lecture de `/etc/rsyslog.conf`
- Format syslog : facility.severity (ex: `auth.err`)
- Facilities : `auth`, `cron`, `daemon`, `kern`, `mail`, `user`, `local0-7`
- Severities : `emerg`, `alert`, `crit`, `err`, `warning`, `notice`, `info`, `debug`
- Fichiers de log courants : `/var/log/syslog` ou `/var/log/messages`, `/var/log/auth.log`, `/var/log/kern.log`
- `logger` : envoyer un message syslog depuis le shell
- `logrotate` : rotation automatique des logs — `/etc/logrotate.conf`, `/etc/logrotate.d/`

**Critères de maîtrise N4 :**
- [ ] Configurer rsyslog pour envoyer les erreurs `auth` vers un fichier dédié
- [ ] Configurer logrotate pour compresser et archiver des logs custom
- [ ] Envoyer un message de test dans syslog avec `logger` et le retrouver

---

### 5.3 Surveillance des ressources
**Grands points :**
- CPU : `top`, `htop`, `mpstat`, `sar -u`
- Mémoire : `free -h`, `vmstat`, `sar -r`, `/proc/meminfo`
- Disque I/O : `iostat`, `iotop`, `sar -b`, `dstat`
- Réseau : `netstat -tuln`, `ss -tuln`, `iftop`, `sar -n DEV`
- Charge système : load average (`uptime`, `w`) — signification des 1/5/15 minutes
- `sar` (System Activity Reporter) : outil historique complet
- `/proc` interfaces : `/proc/loadavg`, `/proc/vmstat`, `/proc/diskstats`

**Sous-points :**
- `watch -n 1 <cmd>` : exécuter une commande à intervalles
- `atop` : vue combinée toutes ressources avec historique

**Critères de maîtrise N4 :**
- [ ] Diagnostiquer un système lent : identifier si c'est CPU, RAM, ou I/O le goulot
- [ ] Interpréter un load average de 8.0 sur un système à 4 cœurs
- [ ] Trouver le processus à l'origine d'une utilisation I/O disque intense avec `iotop`

---

**Sources — Logs & monitoring :**
| Ressource | Type | Lien |
|-----------|------|------|
| `man journalctl`, `man journald.conf` | Man pages | Local |
| rsyslog documentation | Officielle | https://www.rsyslog.com/doc/ |
| sysstat documentation (`sar`, `iostat`) | Officielle | http://sebastien.godard.pagesperso-orange.fr |
| `man 5 logrotate.conf` | Man page | Local |

---

## 6. Stockage, partitions & LVM

### Prérequis
- Section 2 (systèmes de fichiers)

### 6.1 Disques & partitions
**Grands points :**
- Dénomination : `/dev/sda`, `/dev/nvme0n1`, `/dev/vda` — conventions
- Types de tables de partitions : MBR (max 4 primaires, 2 TB) vs GPT (128 partitions, 8 ZiB)
- `fdisk` : partitionnement MBR/GPT interactif
- `gdisk` : partitionnement GPT
- `parted` : outil moderne, scriptable
- `lsblk` : arbre des périphériques de blocs
- `blkid` : UUID et type de FS d'un périphérique
- Partitions spéciales : boot, EFI, swap

**Sous-points :**
- Types de partitions GUID courants (EFI, Linux FS, swap, LVM)
- `dd` : copie bas niveau bit-à-bit — sauvegarde/restauration, benchmark I/O
- SMART : `smartctl -a /dev/sda` — état de santé d'un disque

**Critères de maîtrise N4 :**
- [ ] Créer une table GPT, plusieurs partitions, formater et monter depuis `/etc/fstab`
- [ ] Expliquer pourquoi il faut utiliser l'UUID plutôt que `/dev/sda1` dans fstab
- [ ] Lire un rapport SMART et identifier les indicateurs de défaillance imminente

---

### 6.2 LVM — Logical Volume Manager
**Grands points :**
- Architecture LVM :
  - PV (Physical Volume) : disque/partition avec métadonnées LVM
  - VG (Volume Group) : pool de PVs
  - LV (Logical Volume) : partition logique dans un VG
- Commandes PV : `pvcreate`, `pvdisplay`, `pvscan`, `pvremove`
- Commandes VG : `vgcreate`, `vgdisplay`, `vgextend`, `vgreduce`, `vgscan`
- Commandes LV : `lvcreate -L <size>`, `lvdisplay`, `lvextend`, `lvreduce`, `lvscan`, `lvremove`
- Redimensionner un LV en live : `lvextend + resize2fs` (ext4) ou `xfs_growfs` (xfs)
- Snapshots LVM : `lvcreate -s` — sauvegarde cohérente
- Thin provisioning : allocation à la demande

**Critères de maîtrise N4 :**
- [ ] Créer un PV, un VG, deux LVs, les formater et les monter
- [ ] Étendre un LV et le FS associé sans démonter le volume (ext4 et xfs)
- [ ] Créer un snapshot LVM avant une mise à jour critique

---

### 6.3 RAID logiciel & chiffrement
**Grands points :**
- `mdadm` : RAID logiciel Linux
  - RAID 0 (striping), RAID 1 (mirroring), RAID 5, RAID 6, RAID 10
  - `mdadm --create`, `--detail`, `--fail`, `--remove`, `--add`
  - `/etc/mdadm/mdadm.conf`
- LUKS : chiffrement de bloc avec `cryptsetup`
  - `cryptsetup luksFormat`, `luksOpen`, `luksClose`
  - `/etc/crypttab` : déchiffrement au boot
  - Combinaison LUKS + LVM

**Critères de maîtrise N4 :**
- [ ] Créer un RAID 1 avec deux disques virtuels et simuler une défaillance
- [ ] Chiffrer une partition avec LUKS et la monter automatiquement au boot

---

**Sources — Stockage & LVM :**
| Ressource | Type | Lien |
|-----------|------|------|
| LVM2 Resource Page | Officielle | https://sourceware.org/lvm2/ |
| `man 8 lvcreate`, `man 8 vgcreate` | Man pages | Local |
| mdadm documentation | Officielle | https://raid.wiki.kernel.org |
| RHEL 9 Storage Guide | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_storage_devices/ |
| `man cryptsetup` | Man page | Local |

---

## 7. Réseau — configuration & diagnostic

### Prérequis
- Section 3 (utilisateurs)
- Notions de base : IP, masque, gateway

### 7.1 Configuration réseau
**Grands points :**
- Interfaces : `lo`, `eth0`/`enp3s0` (Ethernet), `wlan0`/`wlp2s0` (WiFi)
- Nommage predictable des interfaces : règles udev
- Outils modernes vs anciens :
  - `ip` (iproute2) : `ip addr`, `ip link`, `ip route`, `ip neigh` — **outil actuel**
  - `ifconfig`, `route` : obsolètes mais encore présents
- `ip addr add/del/show`
- `ip link set <iface> up/down`
- `ip route add/del default via <gw>`
- NetworkManager : `nmcli`, `nmtui` — gestion des connexions
- Configuration statique : fichiers `/etc/NetworkManager/system-connections/` (NM) ou `/etc/sysconfig/network-scripts/` (RHEL legacy)
- DNS : `/etc/resolv.conf`, `systemd-resolved`, `nmcli con mod <name> ipv4.dns <ip>`
- `/etc/hosts` : résolution locale

**Sous-points :**
- `ethtool` : informations et configuration de la carte réseau
- Bonding/Teaming : agrégation de liens (active-backup, balance-rr)
- VLAN : `ip link add link eth0 name eth0.100 type vlan id 100`
- Namespace réseau : isolation réseau de processus — base des conteneurs

**Critères de maîtrise N4 :**
- [ ] Configurer une interface avec IP statique, gateway et DNS avec `nmcli`
- [ ] Ajouter une route statique persistante et vérifier sa présence après reboot
- [ ] Reconfigurer le DNS sans NetworkManager (via `resolv.conf` ou `systemd-resolved`)

---

### 7.2 Diagnostic réseau
**Grands points :**
- Couche par couche : physique → liaison → réseau → transport → application
- `ping` : test ICMP — TTL, latence, perte de paquets
- `traceroute` / `tracepath` : chemin jusqu'à la destination
- `nmap` : scan de ports — `-sS` (SYN scan), `-sV` (versions), `-p`, `-A`
- `ss` : sockets actifs — remplace `netstat`. `ss -tuln`, `ss -tp`
- `netstat -tuln` : ports en écoute
- `tcpdump` : capture de paquets — `-i <iface>`, `-n`, port filters, `host` filters
- `wireshark` / `tshark` : analyse de captures
- `curl -v` / `wget` : test HTTP
- `dig`, `host`, `nslookup` : résolution DNS

**Sous-points :**
- `mtr` : `ping` + `traceroute` en continu
- `iperf3` : mesure de débit
- `nc` (netcat) : outil polyvalent TCP/UDP — test de connectivité, transfer
- `/proc/net/` : informations réseau exposées par le noyau
- ARP : `arp -a`, `ip neigh`

**Critères de maîtrise N4 :**
- [ ] Diagnostiquer une panne de connectivité en 5 étapes (couche par couche)
- [ ] Capturer le handshake TCP d'une connexion SSH avec `tcpdump`
- [ ] Trouver quel processus écoute sur un port donné avec `ss`

---

### 7.3 Firewall — nftables & firewalld
**Grands points :**
- Architecture Netfilter : hooks dans le noyau (PREROUTING, INPUT, FORWARD, OUTPUT, POSTROUTING)
- `iptables` : outil historique — tables (filter, nat, mangle), chains, règles
- `nftables` : successeur d'iptables — syntaxe unifiée
- `firewalld` : gestionnaire de haut niveau pour RHEL/Fedora
  - Zones : `public`, `trusted`, `dmz`, `internal`, `drop`
  - `firewall-cmd --zone=public --add-port=80/tcp --permanent`
  - `firewall-cmd --reload`
  - Services prédéfinis : `ssh`, `http`, `https`
- Politique par défaut : DROP vs REJECT — différences
- Règles de base : autoriser, bloquer, NAT (masquerade, DNAT)

**Critères de maîtrise N4 :**
- [ ] Configurer firewalld pour autoriser HTTP/HTTPS depuis toutes les sources et SSH depuis un sous-réseau seulement
- [ ] Convertir une règle iptables en règle nftables équivalente
- [ ] Vérifier l'ensemble des règles actives et identifier une règle manquante

---

**Sources — Réseau :**
| Ressource | Type | Lien |
|-----------|------|------|
| iproute2 documentation | Officielle | https://baturin.org/docs/iproute2/ |
| `man 8 ip`, `man 8 ss` | Man pages | Local |
| nftables wiki | Officielle | https://wiki.nftables.org |
| firewalld documentation | Officielle | https://firewalld.org/documentation/ |
| RHEL 9 Networking Guide | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/ |
| *Linux Networking Cookbook* (Schroder) | Livre | Biblio |

---

## 8. Sécurité système — durcissement

### Prérequis
- Sections 3, 4, 7 (permissions, services, réseau)

### 8.1 SELinux
**Grands points :**
- Modèle MAC (Mandatory Access Control) : politique imposée par l'administrateur
- Modes : `enforcing`, `permissive`, `disabled`
- `getenforce` / `setenforce 0|1`
- `/etc/selinux/config` : mode persistant
- Contextes SELinux : `user:role:type:level` — `ls -Z`, `ps -Z`, `id -Z`
- Politiques : targeted (focus sur les démons réseau), mls
- `restorecon` : rétablir le contexte d'un fichier
- `chcon` : changer le contexte (non persistant)
- `semanage fcontext` : règle persistante
- AVC denials : `ausearch -m avc -ts recent`, `audit2allow`
- `setsebool` : activer/désactiver un booléen de politique
- `semanage port` : autoriser un démon à écouter sur un port non standard

**Critères de maîtrise N4 :**
- [ ] Diagnostiquer et corriger un refus SELinux sur un serveur web custom
- [ ] Créer une règle fcontext persistante pour un répertoire de données non standard
- [ ] Autoriser un service à écouter sur un port non standard avec `semanage port`

---

### 8.2 SSH — configuration sécurisée
**Grands points :**
- `sshd_config` : fichier de configuration serveur (`/etc/ssh/sshd_config`)
- Options essentielles :
  - `Port` : changer le port par défaut
  - `PermitRootLogin no`
  - `PasswordAuthentication no`
  - `PubkeyAuthentication yes`
  - `AllowUsers`, `AllowGroups`
  - `MaxAuthTries`, `LoginGraceTime`
  - `ClientAliveInterval`, `ClientAliveCountMax`
- Génération de clés : `ssh-keygen -t ed25519 -C "comment"`
- `ssh-copy-id` / `~/.ssh/authorized_keys`
- `~/.ssh/config` : configuration client (hôtes, identités, ProxyJump)
- `ssh-agent`, `ssh-add` : gestion des clés en mémoire
- Port forwarding : `-L` (local), `-R` (remote), `-D` (dynamic SOCKS)
- `sshfs` : monter un répertoire distant via SSH

**Critères de maîtrise N4 :**
- [ ] Configurer un serveur SSH sans mot de passe, clés Ed25519 uniquement, root interdit
- [ ] Mettre en place un bastion SSH avec `ProxyJump`
- [ ] Configurer `fail2ban` pour bloquer les tentatives de brute-force SSH

---

### 8.3 Durcissement général du système
**Grands points :**
- Principe du moindre privilège : chaque service avec son compte, ses permissions minimales
- Mises à jour de sécurité : `dnf update --security` (RHEL), `unattended-upgrades` (Debian)
- Désactivation des services inutiles : `systemctl disable --now <service>`
- `aide` / `tripwire` : détection d'intégrité des fichiers (FIM)
- `auditd` : journalisation d'audit du noyau — `auditctl`, `ausearch`, `aureport`
- Règles d'audit : surveiller les accès fichiers, les escalades de privilèges, les accès réseau
- Limites de ressources : `/etc/security/limits.conf`, `ulimit`
- Kernel hardening : `sysctl` — `net.ipv4.ip_forward`, `kernel.randomize_va_space`, `fs.suid_dumpable`
- `/etc/sysctl.conf` et `/etc/sysctl.d/` : paramètres noyau persistants

**Sous-points :**
- `CIS Benchmark Linux` : référentiel de durcissement
- `OpenSCAP` / `scap-security-guide` : audit automatique de conformité
- Chroot et namespaces : isolation de services
- `fail2ban` : bannissement IP automatique

**Critères de maîtrise N4 :**
- [ ] Appliquer les 10 mesures de durcissement CIS Benchmark niveau 1
- [ ] Configurer auditd pour logguer toutes les commandes exécutées avec sudo
- [ ] Identifier les services inutiles sur un système fraîchement installé et les désactiver

---

**Sources — Sécurité système :**
| Ressource | Type | Lien |
|-----------|------|------|
| RHEL 9 Security Hardening Guide | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/security_hardening/ |
| SELinux User's and Administrator's Guide (RHEL) | Officielle | https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/ |
| CIS Benchmark for Linux | Référentiel | https://www.cisecurity.org/benchmark/red_hat_linux |
| OpenSCAP / SCAP Security Guide | Outil audit | https://www.open-scap.org |
| *The Practice of System and Network Administration* (Limoncelli) | Livre | Biblio |
| `man auditctl`, `man ausearch` | Man pages | Local |
| fail2ban documentation | Officielle | https://github.com/fail2ban/fail2ban |
