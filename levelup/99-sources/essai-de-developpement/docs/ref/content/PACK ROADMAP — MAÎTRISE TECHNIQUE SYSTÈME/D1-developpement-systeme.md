# D1 — DÉVELOPPEMENT SYSTÈME
## Roadmap de maîtrise — C → Bas niveau → Rust

> **Domaine principal.** Priorité maximale.
> Langage central : **C**. Rust intervient après validation complète du socle C.

---

## Table des matières

1. [Architecture machine & système d'exploitation](#1-architecture-machine--système-dexploitation)
2. [Bases du langage C](#2-bases-du-langage-c)
3. [Mémoire, pointeurs & allocation dynamique](#3-mémoire-pointeurs--allocation-dynamique)
4. [Entrées/Sorties, fichiers & appels système](#4-entréessorties-fichiers--appels-système)
5. [Processus, signaux & IPC](#5-processus-signaux--ipc)
6. [Sockets & communication réseau bas niveau](#6-sockets--communication-réseau-bas-niveau)
7. [Débogage, profiling & outils système](#7-débogage-profiling--outils-système)
8. [Rust — Extension après C validé](#8-rust--extension-après-c-validé)

---

## 1. Architecture machine & système d'exploitation

### Prérequis
- Aucun (point d'entrée absolu)

### 1.1 Architecture du processeur (CPU)
**Grands points :**
- Cycle fetch-decode-execute
- Registres : usage général, registre d'instruction (IP/PC), registre de flags
- Modes d'exécution : mode noyau (ring 0) vs mode utilisateur (ring 3)
- Jeux d'instructions : x86-64 (focus pratique)
- Pipeline d'instructions : notion de latence, de throughput
- Interruptions matérielles et software (IRQ, exceptions)
- Cache CPU : L1/L2/L3 — localité spatiale et temporelle
- Architecture multi-cœur : notion de cohérence de cache

**Sous-points à connaître :**
- Différence entre architecture CISC (x86) et RISC (ARM)
- Notion de word size (32 bits vs 64 bits)
- Endianness : little-endian vs big-endian — impact sur les structures C
- Rôle de la MMU (Memory Management Unit)

**Critères de maîtrise N4 :**
- [ ] Tracer le chemin d'une instruction machine depuis le fetch jusqu'au writeback
- [ ] Expliquer pourquoi une lecture L1 cache est ~4 cycles et une lecture RAM est ~200 cycles
- [ ] Identifier le mode d'exécution d'un processus Linux et expliquer la frontière user/kernel

---

### 1.2 Organisation de la mémoire physique et virtuelle
**Grands points :**
- RAM : organisation en octets, adressage linéaire
- Mémoire virtuelle : pages, page tables, TLB
- Espace d'adressage d'un processus : segments (text, data, BSS, heap, stack)
- Pagination et segmentation
- Swap et mémoire virtuelle excessive
- NUMA (Non-Uniform Memory Access) — notion de base

**Sous-points :**
- Taille d'une page standard : 4 KB (et hugepages)
- Traduction d'adresse virtuelle → physique
- Notion de page fault : minor vs major
- Protection mémoire par page (R/W/X bits)

**Critères de maîtrise N4 :**
- [ ] Dessiner l'espace d'adressage virtuel d'un processus Linux 64 bits
- [ ] Expliquer ce qui se passe lors d'un accès à une adresse non mappée
- [ ] Lire `/proc/<pid>/maps` et identifier chaque région mémoire

---

### 1.3 Système d'exploitation — rôle et structure
**Grands points :**
- Définition d'un OS : abstraction du matériel, gestion des ressources
- Noyau monolithique vs micro-noyau (Linux = monolithique modulaire)
- Appels système : interface entre espace utilisateur et noyau
- Ordonnanceur (scheduler) : préemption, quantum de temps
- Gestion des interruptions
- Couches : matériel → noyau → bibliothèques système → applications

**Sous-points :**
- Syscall table Linux (numéros d'appels système)
- Notion de contexte de commutation (context switch) et son coût
- Types de noyaux : Linux, BSD, Windows NT
- Rôle de glibc comme interface de bas niveau au noyau

**Critères de maîtrise N4 :**
- [ ] Expliquer exactement ce qui se passe quand un programme appelle `write()`
- [ ] Différencier une bibliothèque système (`libc`) d'un appel système
- [ ] Identifier le syscall number de `read`, `write`, `fork` sur x86-64

---

### 1.4 BIOS/UEFI et démarrage
**Grands points :**
- Séquence de boot : BIOS/UEFI → bootloader → noyau → init
- Rôle du bootloader (GRUB2)
- Initramfs / initrd
- Processus init / systemd (PID 1)
- Niveaux de boot (runlevels) et targets systemd

**Critères de maîtrise N4 :**
- [ ] Décrire les 6 étapes du démarrage d'un système Linux
- [ ] Modifier un paramètre kernel au boot depuis GRUB
- [ ] Identifier le PID 1 et ses responsabilités

---

**Sources — Architecture & OS :**
| Ressource | Type | Lien |
|-----------|------|------|
| *Computer Systems: A Programmer's Perspective* (Bryant & O'Hallaron) | Livre référence | Biblio |
| *Operating Systems: Three Easy Pieces* (Arpaci-Dusseau) | Livre libre | https://ostep.org |
| Linux Kernel Documentation | Officielle | https://www.kernel.org/doc/html/latest/ |
| Intel® 64 and IA-32 Architectures Software Developer Manuals | Officielle | https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html |
| The Linux Programming Interface (TLPI) — Kerrisk | Livre référence | Biblio |

---

## 2. Bases du langage C

### Prérequis
- Architecture machine (section 1)
- Savoir utiliser un terminal Linux de base

### 2.1 Environnement de compilation
**Grands points :**
- Chaîne de compilation : préprocesseur → compilateur → assembleur → éditeur de liens
- GCC vs Clang : différences pratiques
- Fichiers : `.c`, `.h`, `.o`, `.a`, `.so`
- Compilation séparée et linking
- Options gcc essentielles : `-Wall -Wextra -g -O2 -std=c11`
- Makefile : règles, variables, dépendances, phony targets
- `ar` pour créer des archives statiques (`.a`)

**Sous-points :**
- Étape du préprocesseur : `#include`, `#define`, `#ifdef`
- Fichier objet `.o` : sections `.text`, `.data`, `.bss`
- Linking statique vs dynamique
- `ldd` pour inspecter les dépendances dynamiques
- `nm` et `objdump` pour inspecter les symboles

**Critères de maîtrise N4 :**
- [ ] Compiler un programme multi-fichiers avec un Makefile correct
- [ ] Expliquer la différence entre `-c` (compiler) et sans `-c` (compiler + linker)
- [ ] Identifier l'étape où une erreur de déclaration vs de définition est détectée

---

### 2.2 Types, variables & opérateurs
**Grands points :**
- Types fondamentaux : `char`, `short`, `int`, `long`, `long long` — tailles réelles sur x86-64
- Signés vs non-signés : règles de conversion implicite et pièges
- Types précis : `<stdint.h>` — `int8_t`, `uint32_t`, `int64_t`...
- `size_t` et `ssize_t` : pourquoi les utiliser
- Opérateurs arithmétiques, logiques, bitwise, ternaires
- Précédence des opérateurs — règles et pièges
- Portée (scope) et durée de vie des variables
- Classes de stockage : `auto`, `static`, `extern`, `register`
- `const` et `volatile`

**Sous-points :**
- Overflow d'entier signé = comportement indéfini en C
- Promotion entière implicite dans les expressions
- Différence `sizeof` opérateur vs fonction — évaluation à la compilation
- `_Bool` et `<stdbool.h>`

**Critères de maîtrise N4 :**
- [ ] Prédire la taille de chaque type de base sur x86-64 sans consulter de doc
- [ ] Identifier un bug de conversion implicite signé/non-signé dans du code existant
- [ ] Écrire une expression bitwise correcte pour tester/setter/clearer un bit

---

### 2.3 Structures de contrôle
**Grands points :**
- `if / else if / else` — court-circuit des conditions
- `switch / case / default / break` — chute (fallthrough) et ses usages
- Boucles : `while`, `do while`, `for`
- `break`, `continue`, `goto` — usages légitimes de `goto` en C (gestion d'erreurs)
- Fonctions : déclaration, définition, prototype, valeur de retour

**Sous-points :**
- Différence entre déclaration et définition de fonction
- Passage par valeur vs simulation de passage par référence via pointeurs
- Récursivité : stack frame, stack overflow
- Fonctions variadiques (`va_list`, `va_start`, `va_arg`, `va_end`)

**Critères de maîtrise N4 :**
- [ ] Réécrire une boucle `while` en `for` et vice-versa
- [ ] Implémenter une gestion d'erreurs propre avec `goto cleanup`
- [ ] Implémenter et déboguer une fonction récursive (tri, parcours d'arbre)

---

### 2.4 Tableaux & chaînes de caractères
**Grands points :**
- Tableaux statiques : déclaration, initialisation, accès par indice
- Relation tableau-pointeur : `arr[i]` ≡ `*(arr + i)`
- Tableaux multidimensionnels : stockage row-major
- Chaînes : tableau de `char` terminé par `\0`
- Fonctions de `<string.h>` : `strlen`, `strcpy`, `strncpy`, `strcat`, `strcmp`, `memcpy`, `memset`
- Pièges classiques : off-by-one, buffer overflow, chaîne sans `\0`

**Sous-points :**
- Différence entre `char str[] = "abc"` et `char *str = "abc"`
- Chaînes littérales en mémoire lecture seule
- `strtok` et ses limitations (non-réentrant)
- Alternatives sûres : `strlcpy`, `snprintf`

**Critères de maîtrise N4 :**
- [ ] Implémenter `strlen`, `strcpy`, `strrev` manuellement
- [ ] Identifier et corriger un buffer overflow dans du code fourni
- [ ] Manipuler des tableaux 2D en mémoire et comprendre le layout

---

### 2.5 Structures, unions & énumérations
**Grands points :**
- `struct` : définition, initialisation, accès par `.` et `->`
- Padding et alignement mémoire dans les structures
- `__attribute__((packed))` — quand et pourquoi
- `union` : superposition de types — usage en parsing de protocoles
- `enum` : valeurs entières nommées
- `typedef` pour les structures
- Structures imbriquées et pointeurs vers structures

**Sous-points :**
- Calculer la taille réelle d'une struct avec padding
- Structures auto-référentielles (listes chaînées)
- Bit fields dans les structures
- Passing de structs par valeur vs par pointeur — coût mémoire

**Critères de maîtrise N4 :**
- [ ] Prédire la taille d'une struct avec et sans `__attribute__((packed))`
- [ ] Implémenter une liste chaînée simple (add, remove, traverse)
- [ ] Utiliser une union pour interpréter un entier 32 bits comme 4 octets

---

**Sources — Langage C :**
| Ressource | Type | Lien |
|-----------|------|------|
| *The C Programming Language* (K&R, 2e éd.) | Livre fondateur | Biblio |
| *C Programming: A Modern Approach* (K.N. King) | Livre approfondi | Biblio |
| ISO C11 Standard (N1570 draft) | Standard officiel | https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf |
| GCC Manual | Officielle | https://gcc.gnu.org/onlinedocs/ |
| cppreference.com — C reference | Référence en ligne | https://en.cppreference.com/w/c |
| *21st Century C* (Ben Klemens) | Livre moderne | Biblio |

---

## 3. Mémoire, pointeurs & allocation dynamique

### Prérequis
- Section 1 (architecture mémoire)
- Section 2 complète (bases C)

### 3.1 Pointeurs — fondamentaux
**Grands points :**
- Définition : variable contenant une adresse mémoire
- Déclaration, déréférencement, prise d'adresse (`&`, `*`)
- Arithmétique de pointeurs : `ptr + n` déplace de `n * sizeof(*ptr)` octets
- Pointeurs nuls : `NULL` — vérification obligatoire avant déréférencement
- Pointeurs `const` : `const int *p` vs `int * const p` vs `const int * const p`
- Pointeurs vers pointeurs (`int **`)
- Pointeurs de fonctions : syntaxe, déclaration, appel

**Sous-points :**
- Différence entre `int *a, b` et `int *a, *b`
- Pointeurs `void *` : usage, casts
- `restrict` keyword : optimisation compilateur
- Aliasing strict (strict aliasing rule) : comportement indéfini à éviter

**Critères de maîtrise N4 :**
- [ ] Implémenter `swap(int *a, int *b)` correctement
- [ ] Écrire une fonction de tri qui prend un comparateur comme pointeur de fonction
- [ ] Décrire ce que fait `int (*fp)(int, char *)` sans hésitation

---

### 3.2 Gestion de la mémoire dynamique
**Grands points :**
- `malloc`, `calloc`, `realloc`, `free` — comportements et différences
- Erreurs classiques : use-after-free, double-free, memory leak, buffer overflow heap
- Alignement mémoire et `aligned_alloc`
- Fragmentation mémoire : interne vs externe
- Implémentation d'un allocateur simple (buddy system, slab — notion)
- Règle : toute allocation a un propriétaire responsable de la libération

**Sous-points :**
- `malloc` retourne `NULL` en cas d'échec — vérification obligatoire
- `realloc` peut déplacer le bloc — invalidation des anciens pointeurs
- `calloc` initialise à zéro, `malloc` non
- Outils de détection : Valgrind, AddressSanitizer (`-fsanitize=address`)

**Critères de maîtrise N4 :**
- [ ] Implémenter un allocateur de pool simple (fixed-size block allocator)
- [ ] Trouver et corriger 3 types de bugs mémoire différents dans du code fourni
- [ ] Expliquer comment Valgrind détecte un use-after-free

---

### 3.3 Organisation mémoire d'un processus
**Grands points :**
- Segments : `.text` (code), `.data` (initialisé), `.bss` (non-initialisé), `heap`, `stack`
- Stack : croissance descendante, stack frames, registre `RSP`
- Heap : gestion via `brk/sbrk` (ancienne) et `mmap` (moderne)
- Limites : `ulimit -s` pour la taille de stack
- Variables locales sur stack vs `static` en `.data/.bss`

**Sous-points :**
- Stack overflow : causes et détection
- `alloca` : allocation sur la stack — dangers
- Layout ASLR (Address Space Layout Randomization) — impact sur le debug
- `/proc/<pid>/maps` pour visualiser l'espace mémoire d'un processus en live

**Critères de maîtrise N4 :**
- [ ] Lire et interpréter `/proc/self/maps` depuis un programme C
- [ ] Écrire un programme qui illustre la différence stack vs heap vs static
- [ ] Provoquer volontairement un stack overflow et l'expliquer

---

### 3.4 Structures de données en C
**Grands points :**
- Tableau dynamique (vector) : implémentation avec realloc
- Liste chaînée simple et doublement chaînée
- Pile (stack) et file (queue) : implémentations tableau et liste
- Table de hachage : structure, fonction de hachage, gestion des collisions (chaining, open addressing)
- Arbre binaire : insertion, recherche, parcours (in/pre/post-order)
- Arbre binaire de recherche (BST)

**Sous-points :**
- Complexité algorithmique : O(1), O(log n), O(n) — impact sur les choix
- Sentinel node pattern pour simplifier les cas limites
- Gestion de la mémoire dans les structures (qui libère quoi)

**Critères de maîtrise N4 :**
- [ ] Implémenter un tableau dynamique générique avec `void *` et `size_t element_size`
- [ ] Implémenter une table de hachage avec gestion de collisions par chaining
- [ ] Implémenter un BST avec insertion, suppression et les 3 parcours

---

**Sources — Mémoire & pointeurs :**
| Ressource | Type | Lien |
|-----------|------|------|
| *Understanding and Using C Pointers* (Reese) | Livre dédié | Biblio |
| Valgrind Documentation | Officielle | https://valgrind.org/docs/manual/ |
| GCC AddressSanitizer | Officielle | https://github.com/google/sanitizers/wiki/AddressSanitizer |
| *Expert C Programming* (Van der Linden) | Livre avancé | Biblio |
| Linux `proc` man pages | Man pages | `man 5 proc` |

---

## 4. Entrées/Sorties, fichiers & appels système

### Prérequis
- Section 3 (mémoire et pointeurs)

### 4.1 Appels système — interface noyau
**Grands points :**
- Mécanisme : instruction `syscall` (x86-64), transition user → kernel
- Table des syscalls Linux x86-64 — numéros essentiels
- Numéros principaux : `read(0)`, `write(1)`, `open(2)`, `close(3)`, `stat(4)`, `mmap(9)`, `brk(12)`, `fork(57)`, `execve(59)`, `exit(60)`
- `errno` : code d'erreur retourné, `perror()`, `strerror()`
- `strace` : traçage des syscalls d'un processus en live

**Sous-points :**
- Différence entre glibc wrapper et syscall brut (`syscall()` en C)
- Interruption de syscall par signal (`EINTR`) et redémarrage
- `EAGAIN` / `EWOULDBLOCK` en mode non-bloquant
- Man pages section 2 (syscalls) vs section 3 (libc)

**Critères de maîtrise N4 :**
- [ ] Écrire un `write` hello world en utilisant `syscall()` directement sans libc
- [ ] Tracer les syscalls de `ls` avec `strace` et identifier chaque groupe
- [ ] Gérer correctement `EINTR` dans une boucle de lecture

---

### 4.2 Descripteurs de fichiers & I/O bas niveau (POSIX)
**Grands points :**
- Descripteur de fichier (fd) : entier, table de fd par processus
- fd standards : 0 (stdin), 1 (stdout), 2 (stderr)
- `open()` : flags (`O_RDONLY`, `O_WRONLY`, `O_RDWR`, `O_CREAT`, `O_TRUNC`, `O_APPEND`, `O_NONBLOCK`)
- `read()`, `write()` : sémantique exacte, partial reads/writes
- `close()` : libération du fd
- `lseek()` : déplacement dans un fichier (`SEEK_SET`, `SEEK_CUR`, `SEEK_END`)
- `dup()`, `dup2()` : duplication de descripteurs (redirection de flux)
- `fcntl()` : manipulation de flags d'un fd ouvert

**Sous-points :**
- Partial read : `read()` peut retourner moins que demandé — boucle obligatoire
- `O_SYNC` / `O_DSYNC` pour les écritures synchrones
- `fsync()` et `fdatasync()` pour forcer l'écriture sur disque
- `/proc/<pid>/fd/` : liste des fd ouverts d'un processus

**Critères de maîtrise N4 :**
- [ ] Copier un fichier avec `open/read/write/close` sans utiliser `<stdio.h>`
- [ ] Implémenter la redirection de stdout vers un fichier avec `dup2`
- [ ] Écrire une fonction de lecture robuste qui gère les partial reads et `EINTR`

---

### 4.3 I/O haut niveau — bibliothèque standard C (stdio)
**Grands points :**
- `FILE *` : structure de flux bufferisé
- `fopen()`, `fclose()`, `fread()`, `fwrite()`
- `fprintf()`, `fscanf()`, `fgets()`, `fputs()`
- Types de buffering : non-bufferisé (`_IONBF`), ligne (`_IOLBF`), bloc (`_IOFBF`)
- `fflush()` : vider le buffer
- `setvbuf()` : configurer le buffering
- `fseek()`, `ftell()`, `rewind()`
- `fileno()` : obtenir le fd sous-jacent d'un `FILE *`

**Sous-points :**
- Différence entre `printf` (bufferisé) et `write` (non-bufferisé)
- Comportement du buffering sur un terminal vs un pipe vs un fichier
- Gestion des erreurs : `feof()`, `ferror()`, `clearerr()`
- Format strings : spécificateurs `%d`, `%s`, `%p`, `%zu`, `%ld`

**Critères de maîtrise N4 :**
- [ ] Expliquer pourquoi `printf("foo")` peut ne pas s'afficher avant `exit()` sans `fflush`
- [ ] Implémenter un parser de fichier CSV ligne par ligne avec `fgets`
- [ ] Comparer les performances de `fwrite` (bufferisé) vs `write` (non-bufferisé) sur un grand fichier

---

### 4.4 Fichiers spéciaux & système de fichiers VFS
**Grands points :**
- Types de fichiers Linux : régulier, répertoire, lien symbolique, lien dur, pipe, socket, device
- `stat()` / `fstat()` / `lstat()` : métadonnées d'un fichier
- Structure `struct stat` : `st_mode`, `st_size`, `st_ino`, `st_uid`, `st_gid`, `st_mtime`
- Inodes : identifiant de fichier indépendant du nom
- Liens durs vs liens symboliques : différences de sémantique
- Répertoires : `opendir()`, `readdir()`, `closedir()`
- `mkdir()`, `rmdir()`, `rename()`, `unlink()`

**Sous-points :**
- VFS (Virtual File System) : abstraction unifiée des FS dans Linux
- `/proc` et `/sys` : pseudo-filesystems — accès au noyau via fichiers
- `mmap()` : mapping de fichier en mémoire — zero-copy I/O
- `sendfile()` : transfert entre fd sans copie en user space

**Critères de maîtrise N4 :**
- [ ] Écrire un `ls -la` simplifié en C avec `opendir/readdir/stat`
- [ ] Mapper un fichier en mémoire avec `mmap` et le modifier
- [ ] Distinguer un lien dur d'un lien symbolique par leur comportement sur `stat`

---

**Sources — I/O & Syscalls :**
| Ressource | Type | Lien |
|-----------|------|------|
| *The Linux Programming Interface* (Kerrisk) | Référence absolue | Biblio / https://man7.org/tlpi/ |
| Linux man pages section 2 | Officielle | `man 2 read`, `man 2 open`, etc. |
| Linux man pages section 3 | Officielle | `man 3 fopen`, etc. |
| Linux Syscall Table x86-64 | Référence | https://syscalls.mebeim.net/?table=x86/64/x64/latest |
| `strace` documentation | Outil | https://strace.io |
| *Advanced Programming in the UNIX Environment* (Stevens) | Référence POSIX | Biblio |

---

## 5. Processus, signaux & IPC

### Prérequis
- Section 4 (syscalls, fichiers)

### 5.1 Processus — cycle de vie
**Grands points :**
- PID, PPID, UID, GID : identifiants d'un processus
- `fork()` : création d'un processus enfant — duplication de l'espace mémoire (COW)
- `exec*()` : remplacement de l'image du processus — famille `execl`, `execv`, `execvp`, `execve`
- `wait()` / `waitpid()` : attente de terminaison d'un enfant, code de retour
- Processus zombie : enfant terminé dont le parent n'a pas appelé `wait`
- Processus orphelin : enfant dont le parent est mort — adopté par PID 1
- `exit()` vs `_exit()` : flushing des buffers stdio vs non
- `getpid()`, `getppid()`, `getuid()`, `getgid()`

**Sous-points :**
- Copy-On-Write (COW) : pages partagées jusqu'à la première écriture
- `vfork()` : variante légère de `fork` pour `exec` immédiat
- Groupes de processus et sessions (`setsid()`, `setpgid()`)
- Démon (daemon) : processus de fond — processus de création
- `prctl()` : contrôle de comportement du processus

**Critères de maîtrise N4 :**
- [ ] Écrire un shell minimaliste qui exécute des commandes avec `fork/exec/wait`
- [ ] Expliquer exactement ce que retourne `fork()` dans chaque processus
- [ ] Créer un démon correctement (double fork, `setsid`, fermeture des fd)

---

### 5.2 Signaux
**Grands points :**
- Définition : notification asynchrone envoyée à un processus
- Signaux standards POSIX : `SIGTERM`, `SIGKILL`, `SIGINT`, `SIGCHLD`, `SIGSEGV`, `SIGFPE`, `SIGPIPE`, `SIGUSR1`, `SIGUSR2`, `SIGHUP`
- `signal()` vs `sigaction()` : pourquoi préférer `sigaction`
- Structure `struct sigaction` : `sa_handler`, `sa_sigaction`, `sa_mask`, `sa_flags`
- Masquage des signaux : `sigprocmask()`, `sigemptyset()`, `sigaddset()`
- `kill()` : envoi de signal à un PID
- Signaux non-masquables : `SIGKILL`, `SIGSTOP`
- Signal handlers : restrictions (async-signal-safe functions)

**Sous-points :**
- Liste des fonctions async-signal-safe (man 7 signal-safety)
- `self-pipe trick` : rendre les signaux compatibles avec `select/poll`
- `signalfd()` : réception de signaux comme lecture sur un fd
- `SA_RESTART` flag : redémarrage automatique des syscalls interrompus
- `sigwaitinfo()` / `sigtimedwait()` : attente synchrone de signaux

**Critères de maîtrise N4 :**
- [ ] Implémenter un handler `SIGCHLD` qui reçoit correctement tous les enfants
- [ ] Écrire une gestion propre de `SIGTERM` pour un démon (cleanup + exit)
- [ ] Expliquer pourquoi appeler `printf` dans un signal handler est dangereux

---

### 5.3 IPC — Communication inter-processus
**Grands points :**

**Pipes :**
- Pipe anonyme : `pipe()` — communication unidirectionnelle parent→enfant
- FIFO (pipe nommé) : `mkfifo()` — entre processus non liés
- Sémantique : bloquant par défaut, `O_NONBLOCK` pour non-bloquant

**Sockets Unix :**
- `AF_UNIX` / `AF_LOCAL` : communication locale haute performance
- Types : `SOCK_STREAM` (TCP-like) et `SOCK_DGRAM` (UDP-like)
- Création, binding, listen, accept, connect

**Mémoire partagée :**
- POSIX : `shm_open()`, `mmap()`, `shm_unlink()`
- Accès concurrent : nécessite synchronisation

**Sémaphores :**
- POSIX : `sem_open()`, `sem_wait()`, `sem_post()`, `sem_close()`
- Sémaphores nommés vs anonymes

**Files de messages (message queues) :**
- POSIX : `mq_open()`, `mq_send()`, `mq_receive()`

**Sous-points :**
- Comparaison des mécanismes IPC : débit, latence, cas d'usage
- Nettoyage des ressources IPC POSIX : toujours appeler `unlink`
- Synchronisation avec `pthread_mutex` en mémoire partagée

**Critères de maîtrise N4 :**
- [ ] Implémenter un producteur-consommateur avec pipe et deux processus
- [ ] Implémenter une communication bidirectionnelle avec socket Unix
- [ ] Implémenter un segment de mémoire partagée avec mutex POSIX

---

### 5.4 Threads POSIX (pthreads)
**Grands points :**
- Thread vs processus : espace mémoire partagé, moins de coût de création
- `pthread_create()`, `pthread_join()`, `pthread_detach()`
- `pthread_self()` : identifiant du thread courant
- Mutex : `pthread_mutex_init`, `pthread_mutex_lock`, `pthread_mutex_unlock`, `pthread_mutex_destroy`
- Variables de condition : `pthread_cond_wait`, `pthread_cond_signal`, `pthread_cond_broadcast`
- Thread-local storage : `__thread` keyword, `pthread_key_create`
- Deadlock : définition, conditions nécessaires, prévention

**Sous-points :**
- `pthread_once()` : initialisation unique thread-safe
- `pthread_attr_t` : configuration de thread (taille de stack)
- Read-Write locks : `pthread_rwlock_t`
- Spin locks : `pthread_spinlock_t` — quand les utiliser
- Atomic operations : `<stdatomic.h>` en C11

**Critères de maîtrise N4 :**
- [ ] Implémenter un producteur-consommateur avec mutex + variable de condition
- [ ] Démontrer et corriger un data race avec ThreadSanitizer (`-fsanitize=thread`)
- [ ] Implémenter un thread pool simple

---

**Sources — Processus, signaux, IPC :**
| Ressource | Type | Lien |
|-----------|------|------|
| *The Linux Programming Interface* (Kerrisk) ch. 24–48 | Référence | Biblio |
| POSIX.1-2017 Standard | Standard officiel | https://pubs.opengroup.org/onlinepubs/9699919799/ |
| Linux man pages : `man 2 fork`, `man 7 signal`, `man 7 pipe` | Officielle | En ligne ou local |
| *Advanced Programming in the UNIX Environment* (Stevens & Rago) | Référence | Biblio |
| *Programming with POSIX Threads* (Butenhof) | Livre dédié | Biblio |

---

## 6. Sockets & communication réseau bas niveau

### Prérequis
- Section 5 (processus, IPC)
- Notions de base réseau (couches TCP/IP)

### 6.1 Sockets BSD — API POSIX
**Grands points :**
- Modèle client-serveur : rôles, flux d'appels
- `socket()` : création — domaine (`AF_INET`, `AF_INET6`, `AF_UNIX`), type (`SOCK_STREAM`, `SOCK_DGRAM`, `SOCK_RAW`), protocole
- `bind()` : association adresse + port
- `listen()` : mise en attente de connexions (backlog)
- `accept()` : acceptation d'une connexion entrante — nouveau fd
- `connect()` : initiation d'une connexion côté client
- `send()` / `recv()` et `read()` / `write()` sur sockets
- `close()` vs `shutdown()` : différences importantes

**Sous-points :**
- `SO_REUSEADDR` : réutilisation rapide d'un port après redémarrage
- `SO_KEEPALIVE` : détection de connexions mortes
- `TCP_NODELAY` : désactivation de Nagle algorithm
- `getaddrinfo()` / `freeaddrinfo()` : résolution de noms portable IPv4/IPv6
- `inet_pton()`, `inet_ntop()` : conversion adresses texte↔binaire
- Structure `sockaddr_in`, `sockaddr_in6`, `sockaddr_storage`
- Byte order : `htonl()`, `htons()`, `ntohl()`, `ntohs()`

**Critères de maîtrise N4 :**
- [ ] Implémenter un serveur TCP echo en C (multi-connexions séquentielles)
- [ ] Implémenter un client TCP qui se reconnecte automatiquement
- [ ] Expliquer la différence entre `close()` et `shutdown(SHUT_WR)` sur un socket TCP

---

### 6.2 I/O multiplexée
**Grands points :**
- Problème : gérer plusieurs fd simultanément sans threads
- `select()` : portable, limité à 1024 fd (`FD_SETSIZE`)
- `poll()` : pas de limite de fd, interface plus claire
- `epoll()` : Linux uniquement, O(1) pour N connexions, `edge-triggered` vs `level-triggered`
- `epoll_create1()`, `epoll_ctl()`, `epoll_wait()`
- Pattern reactor : event loop autour d'`epoll`

**Sous-points :**
- `select` vs `poll` vs `epoll` : comparaison de complexité et de cas d'usage
- Edge-triggered (ET) vs Level-triggered (LT) : différences et précautions
- Sockets non-bloquants avec `O_NONBLOCK` : gestion de `EAGAIN`
- `eventfd()`, `timerfd_create()` : fd pour événements et timers

**Critères de maîtrise N4 :**
- [ ] Implémenter un serveur multi-clients avec `epoll` en edge-triggered
- [ ] Implémenter un event loop capable de gérer timers et connexions simultanément
- [ ] Migrer un serveur `select` en `epoll` et mesurer la différence de charge

---

### 6.3 UDP et protocoles bas niveau
**Grands points :**
- `SOCK_DGRAM` : sans connexion, sans garantie d'ordre
- `sendto()`, `recvfrom()` : envoi/réception avec adresse explicite
- `connect()` sur UDP : socket "connecté" (adresse par défaut)
- Gestion des tailles de datagrammes
- Raw sockets (`SOCK_RAW`) : accès direct IP/ICMP — nécessite `CAP_NET_RAW`

**Critères de maîtrise N4 :**
- [ ] Implémenter un serveur/client UDP avec gestion de perte de paquets (timeout + retry)
- [ ] Construire et envoyer un paquet ICMP Echo avec un raw socket

---

**Sources — Sockets :**
| Ressource | Type | Lien |
|-----------|------|------|
| *Unix Network Programming Vol. 1* (Stevens, Fenner, Rudoff) | Référence absolue | Biblio |
| Linux man pages : `man 2 socket`, `man 7 tcp`, `man 7 epoll` | Officielle | Local ou https://man7.org |
| Beej's Guide to Network Programming | Guide pratique libre | https://beej.us/guide/bgnet/ |
| RFC 793 (TCP) | Standard IETF | https://datatracker.ietf.org/doc/html/rfc793 |
| RFC 768 (UDP) | Standard IETF | https://datatracker.ietf.org/doc/html/rfc768 |

---

## 7. Débogage, profiling & outils système

### Prérequis
- Sections 2–6 (pratique de C avec du code à déboguer)

### 7.1 GDB — débogueur GNU
**Grands points :**
- Compilation avec symboles de debug : `-g`, `-g3`
- Commandes fondamentales : `run`, `break`, `next`, `step`, `continue`, `finish`, `quit`
- Inspection : `print`, `display`, `x` (examine memory), `info registers`, `info locals`
- Breakpoints conditionnels, watchpoints
- Backtrace : `bt`, `frame`, `up`, `down`
- Multi-thread debugging : `info threads`, `thread <n>`
- TUI mode : interface semi-graphique dans le terminal
- Core dumps : analyser un crash post-mortem

**Sous-points :**
- `.gdbinit` : configuration au démarrage
- `pwndbg` / `peda` : extensions GDB pour l'analyse bas niveau
- Remote debugging avec `gdbserver`
- Debugging de processus attaché : `gdb -p <pid>`

**Critères de maîtrise N4 :**
- [ ] Déboguer un segfault en trouvant la ligne exacte et la cause avec GDB
- [ ] Analyser un core dump et reconstruire l'état du programme au moment du crash
- [ ] Poser un watchpoint sur une variable et observer sa modification

---

### 7.2 Valgrind & sanitizers
**Grands points :**
- Valgrind Memcheck : détection de leaks, invalid reads/writes, use-after-free
- Interprétation des rapports Valgrind : stack traces, types d'erreurs
- AddressSanitizer (ASan) : `-fsanitize=address` — plus rapide que Valgrind
- UndefinedBehaviorSanitizer (UBSan) : `-fsanitize=undefined`
- ThreadSanitizer (TSan) : `-fsanitize=thread` — data races
- MemorySanitizer (MSan) : lectures de mémoire non-initialisée

**Critères de maîtrise N4 :**
- [ ] Corriger tous les warnings Valgrind d'un programme C donné
- [ ] Utiliser UBSan pour détecter un integer overflow
- [ ] Comparer le résultat de Valgrind et ASan sur le même bug

---

### 7.3 Profiling & performance
**Grands points :**
- `gprof` : profiling basé instrumentation
- `perf` : profiling basé échantillonnage — `perf stat`, `perf record`, `perf report`
- Flamegraphs : visualisation des hotspots
- `time` et `clock_gettime()` : mesures de temps en C
- Benchmarking : éviter les pièges (optimisation du compilateur, warmup, statistiques)

**Sous-points :**
- `cachegrind` (Valgrind) : simulation de cache
- `massif` (Valgrind) : profiling de la heap
- Notion de cycles vs temps réel (`CLOCK_MONOTONIC`)

**Critères de maîtrise N4 :**
- [ ] Identifier le hotspot d'un programme avec `perf report`
- [ ] Optimiser une boucle critique après analyse de cache miss avec `cachegrind`
- [ ] Écrire un microbenchmark C correct (sans que le compilateur ne l'optimise entièrement)

---

### 7.4 Outils d'analyse système
**Grands points :**
- `strace` : traçage des syscalls — `-e`, `-p`, `-f`, `-o`
- `ltrace` : traçage des appels de bibliothèques partagées
- `lsof` : liste des fichiers ouverts par les processus
- `pmap` : carte mémoire d'un processus
- `nm` : symboles d'un fichier objet
- `objdump -d` : désassemblage
- `readelf` : inspection des sections ELF

**Critères de maîtrise N4 :**
- [ ] Diagnostiquer une fuite de fd avec `lsof` et `strace`
- [ ] Identifier quelle bibliothèque charge une dépendance avec `strace` + `ltrace`
- [ ] Désassembler une fonction C et retrouver la logique en assembleur

---

**Sources — Débogage & outils :**
| Ressource | Type | Lien |
|-----------|------|------|
| GDB Documentation | Officielle | https://sourceware.org/gdb/documentation/ |
| Valgrind User Manual | Officielle | https://valgrind.org/docs/manual/manual.html |
| `perf` wiki Linux | Officielle | https://perf.wiki.kernel.org |
| AddressSanitizer GitHub | Officielle | https://github.com/google/sanitizers |
| Brendan Gregg — Systems Performance | Référence perf | https://www.brendangregg.com/systems-performance.html |

---

## 8. Rust — Extension après C validé

### Prérequis absolus (validation complète en C)
- [ ] Variables, types, fonctions (Section 2)
- [ ] Compilation et Makefile (Section 2.1)
- [ ] Pointeurs et arithmétique de pointeurs (Section 3.1)
- [ ] Allocation dynamique (Section 3.2)
- [ ] Structures (Section 2.5)
- [ ] Fichiers et I/O (Section 4)
- [ ] Processus de base (Section 5.1)
- [ ] Débogage de base avec GDB (Section 7.1)

**Si l'un de ces items n'est pas coché → revenir à C avant d'ouvrir Rust.**

---

### 8.1 Fondamentaux Rust
**Grands points :**
- Installation : `rustup`, `cargo`, toolchain stable
- Structure d'un projet Cargo : `Cargo.toml`, `src/main.rs`, `src/lib.rs`
- Types scalaires : entiers (`i8..i128`, `u8..u128`), flottants, booléen, char
- Types composites : tuples, arrays, slices
- Variables : immuables par défaut (`let`), mutables (`let mut`)
- Inférence de types
- Fonctions : syntaxe, valeur de retour implicite (expression finale)
- Structures de contrôle : `if`, `loop`, `while`, `for..in`
- `match` : pattern matching exhaustif
- Modules et visibilité : `mod`, `pub`, `use`

**Critères de maîtrise N4 :**
- [ ] Créer un projet Cargo, écrire une bibliothèque et un binaire qui l'utilise
- [ ] Implémenter une fonction récursive (fibonacci) et la compiler sans warnings
- [ ] Utiliser `match` pour déstructurer un enum avec données

---

### 8.2 Ownership, Borrowing & Lifetimes
**Grands points :**
- Règles d'ownership : chaque valeur a un unique owner, drop quand owner sort de portée
- `Move` vs `Copy` : types primitifs sont Copy, heap types sont Move
- `Clone` : copie explicite profonde
- Références : `&T` (immutable), `&mut T` (mutable)
- Règles du borrow checker : plusieurs `&T` OU un seul `&mut T` à la fois
- Lifetimes : annotations `'a` — quand requises, comment les lire
- `String` vs `&str` : owned vs borrowed — comparaison avec C `char*`/`malloc`
- `Vec<T>` vs slice `&[T]`

**Sous-points :**
- Relation avec C : ownership = discipline de libération mémoire rendue formelle
- Dangling pointers impossibles à la compilation en Rust
- `Box<T>` : heap allocation — analogue de `malloc` + ownership
- `Rc<T>` et `Arc<T>` : comptage de références
- `RefCell<T>` : borrow checking à l'exécution

**Critères de maîtrise N4 :**
- [ ] Expliquer chaque erreur du borrow checker dans 5 programmes invalides donnés
- [ ] Implémenter une liste chaînée avec `Box<T>` et comparer avec C
- [ ] Annoter les lifetimes d'une fonction prenant deux `&str` et retournant un `&str`

---

### 8.3 Gestion d'erreurs en Rust
**Grands points :**
- `Option<T>` : valeur optionnelle (`Some(T)` / `None`) — remplace `NULL`
- `Result<T, E>` : valeur ou erreur (`Ok(T)` / `Err(E)`) — remplace code retour
- `?` operator : propagation d'erreur — analogue de vérification manuelle en C
- `unwrap()`, `expect()` : panic sur `None`/`Err` — usage dans les tests uniquement
- Définir ses propres types d'erreur avec `enum`
- `thiserror` et `anyhow` crates : gestion d'erreurs en pratique

**Critères de maîtrise N4 :**
- [ ] Réécrire en Rust une fonction C qui utilise `errno` et valeur de retour
- [ ] Implémenter une chaîne de traitements avec `?` sans aucun `unwrap` en production

---

### 8.4 Traits & génériques
**Grands points :**
- Traits : définition d'interfaces (`trait Display`, `trait Debug`, `trait Clone`)
- Implémentation de traits : `impl Trait for Type`
- Traits bounds sur les génériques : `fn foo<T: Display + Clone>(x: T)`
- Traits standards essentiels : `Debug`, `Display`, `Clone`, `Copy`, `PartialEq`, `PartialOrd`, `Iterator`
- `impl Trait` en paramètre et en retour
- Trait objects (`dyn Trait`) : dispatch dynamique — coût par rapport au dispatch statique

**Critères de maîtrise N4 :**
- [ ] Implémenter le trait `Iterator` pour une structure custom
- [ ] Expliquer la différence entre `<T: Trait>` (monomorphisation) et `dyn Trait` (vtable)

---

### 8.5 Concurrence & unsafe
**Grands points :**
- Threads avec `std::thread::spawn` — ownership des données envoyées
- `Arc<Mutex<T>>` : partage de données entre threads
- Channels : `std::sync::mpsc` — communication par message (analogue de pipes)
- `Send` et `Sync` traits : garanties de thread-safety du compilateur
- `unsafe` block : quand et pourquoi — FFI avec C, opérations bas niveau
- `extern "C"` : interface avec des bibliothèques C

**Critères de maîtrise N4 :**
- [ ] Implémenter un producteur-consommateur avec `Arc<Mutex<VecDeque<T>>>` et threads
- [ ] Appeler une fonction C depuis Rust avec `extern "C"` (FFI basique)
- [ ] Expliquer pourquoi Rust garantit l'absence de data races à la compilation

---

### 8.6 Comparaison C ↔ Rust sur des cas concrets
**Exercices de comparaison :**
- Copier un fichier : C (`open/read/write`) ↔ Rust (`std::fs`)
- Liste chaînée : C (pointeurs) ↔ Rust (`Box<T>` + ownership)
- Gestion d'erreurs : C (errno + valeur retour) ↔ Rust (`Result<T, E>`)
- Buffer de réseau : C (malloc + longueur) ↔ Rust (`Vec<u8>` + slices)
- Thread-safe counter : C (pthread_mutex) ↔ Rust (`Arc<Mutex<u64>>`)

**Critères de maîtrise N4 :**
- [ ] Pour chaque paire, identifier ce que Rust garantit que C ne peut pas garantir
- [ ] Identifier les cas où C reste préférable à Rust (performance pure, ABI, kernel code)

---

**Sources — Rust :**
| Ressource | Type | Lien |
|-----------|------|------|
| *The Rust Programming Language* (Brown & Klabnik) | Référence officielle | https://doc.rust-lang.org/book/ |
| *Rustonomicon* | Référence unsafe | https://doc.rust-lang.org/nomicon/ |
| Rust Standard Library Docs | Officielle | https://doc.rust-lang.org/std/ |
| *Programming Rust* (Blandy, Orendorff) | Livre approfondi | Biblio |
| Rust by Example | Tutoriel officiel | https://doc.rust-lang.org/rust-by-example/ |
| crates.io | Écosystème | https://crates.io |
| Rustlings (exercices) | Pratique guidée | https://github.com/rust-lang/rustlings |

---

## Récapitulatif — Critères d'entrée vers Rust

Cocher tous avant de commencer la section 8 :

- [ ] Écrire, compiler et déboguer un programme C multi-fichiers avec Makefile
- [ ] Implémenter une liste chaînée, un arbre BST et une table de hachage en C
- [ ] Gérer malloc/free sans leaks (validé par Valgrind)
- [ ] Écrire un serveur TCP multi-clients avec epoll
- [ ] Créer un processus enfant avec fork/exec/wait
- [ ] Utiliser IPC (pipe, shared memory, socket Unix)
- [ ] Déboguer avec GDB et résoudre un segfault
