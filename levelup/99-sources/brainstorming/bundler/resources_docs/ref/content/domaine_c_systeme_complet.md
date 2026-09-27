# Domaine : Développement Système en C (Niveau Expert)

## 1. Vision du domaine

Objectif : maîtriser l’exécution d’un programme du code source jusqu’au CPU.

Inclut :
- modèle mémoire réel
- interaction avec le noyau
- gestion des erreurs système
- compréhension du coût machine (CPU / RAM / syscalls)

Langage socle : C (ISO/IEC 9899)

---

## 2. Roadmap complète

### Phase 1 — Architecture machine

#### Sujet 1 : Architecture d’un ordinateur

**Concepts**
- CPU (ALU, registres, pipeline)
- RAM vs stockage
- bus mémoire
- hiérarchie cache (L1/L2/L3)
- instruction cycle

**Ressources**
- Computer Systems: A Programmer's Perspective
- Intel Architecture Manuals

**Exercices**
- expliquer le cycle fetch-decode-execute
- comparer RAM vs cache
- tracer l’exécution d’une instruction simple

**Validation**
- expliquer sans support le rôle du CPU
- dessiner le flux d’exécution

---

### Phase 2 — Compilation et exécution

#### Sujet 2 : Cycle de vie d’un programme C

**Concepts**
- compilation (gcc)
- preprocessing
- linking
- ELF format
- loader

**Ressources**
- man gcc
- Linkers and Loaders

**Exercices**
- compiler avec flags (-Wall -Wextra)
- analyser un binaire avec `file` et `ldd`

**Validation**
- expliquer chaque étape
- identifier une erreur de compilation vs linking

---

### Phase 3 — Fondations du langage C

#### Sujet 3 : Types et mémoire

**Concepts**
- types primitifs
- taille en mémoire
- alignement
- stack frame

**Exercices**
- afficher sizeof()
- analyser layout mémoire

**Validation**
- expliquer stack vs heap

---

### Phase 4 — Pointeurs (cœur du système)

#### Sujet 4 : Pointeurs

**Concepts**
- adresse mémoire
- & et *
- déréférencement
- arithmétique pointeur
- aliasing
- UB (undefined behavior)

**Ressources**
- ISO C standard (sections pointer semantics)

**Exercices**
- swap avec pointeurs
- parcours tableau
- bug segmentation fault à corriger

**Validation**
- écrire fonction sans erreur mémoire
- expliquer un crash

---

### Phase 5 — Allocation dynamique

#### Sujet 5 : Heap management

**Concepts**
- malloc / free
- fragmentation
- double free
- dangling pointer

**Ressources**
- man malloc
- glibc malloc internals

**Exercices**
- implémenter structure dynamique
- provoquer fuite mémoire
- corriger avec valgrind

**Validation**
- analyser fuite mémoire

---

### Phase 6 — Entrées / Sorties

#### Sujet 6 : I/O en C

**Concepts**
- FILE*
- buffering
- read/write syscalls
- file descriptors

**Ressources**
- man read, write

**Exercices**
- lire fichier ligne par ligne
- écrire fichier binaire

**Validation**
- expliquer différence stdio vs syscalls

---

### Phase 7 — Processus et OS

#### Sujet 7 : Processus

**Concepts**
- PID
- fork
- exec
- wait
- zombie process

**Ressources**
- man fork, exec

**Exercices**
- créer processus enfant
- exécuter commande externe

**Validation**
- expliquer fork()

---

### Phase 8 — Signaux et contrôle

#### Sujet 8 : Signaux

**Concepts**
- SIGINT
- handlers
- async behavior

**Exercices**
- intercepter CTRL+C

**Validation**
- expliquer signal handling

---

### Phase 9 — Debugging

#### Sujet 9 : Debugging

**Concepts**
- breakpoints
- stack trace
- memory inspection

**Outils**
- gdb
- valgrind

**Exercices**
- corriger crash

**Validation**
- localiser bug mémoire

---

### Phase 10 — Concurrence

#### Sujet 10 : Threads

**Concepts**
- pthread
- race condition
- mutex

**Exercices**
- programme multi-thread

**Validation**
- corriger race condition

---

### Phase 11 — Réseau bas niveau

#### Sujet 11 : Sockets

**Concepts**
- TCP
- socket()
- bind()
- listen()
- accept()

**Exercices**
- client serveur simple

**Validation**
- expliquer handshake TCP

---

## 3. Projet final (obligatoire)

### Mini-shell en C

**Fonctionnalités**
- exécuter commandes
- gérer fork/exec
- gérer signaux
- redirection I/O

**Sujets requis**
- pointeurs
- processus
- I/O
- debugging

---

## 4. Règles de validation du domaine

Un sujet est maîtrisé si :
- explicable sans support
- implémentable sans aide
- debugable en autonomie

---

## 5. Règle stricte

Si tu ne peux pas :
- expliquer
- coder
- corriger

→ le sujet n’est pas maîtrisé

---

## 6. Extension future

Après validation complète :

### Rust

Objectif :
- comparer avec C
- comprendre ownership
- éviter erreurs mémoire

---

## 7. Résultat attendu

À la fin :

Tu dois être capable de :
- lire du code système
- écrire des outils bas niveau
- comprendre les erreurs système
- manipuler la mémoire sans erreur
- diagnostiquer un programme en profondeur

