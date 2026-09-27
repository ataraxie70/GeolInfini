# Systems Programming and Infrastructure Mastery Path

> **8 étapes · 40 cours**  
> Généré depuis le système d'apprentissage formel — [systeme_apprentissage_developpement_systeme2.md]

---

## Progression globale

| Étape | Titre | Cours | Statut |
|-------|-------|-------|--------|
| 1 | Architecture Système et Fondations Matérielles | 5 | ⬜ |
| 2 | Programmation Système en Langage C | 5 | ⬜ |
| 3 | Interaction Système et Gestion des Processus | 5 | ⬜ |
| 4 | Administration Système Linux | 5 | ⬜ |
| 5 | Réseautage Système et Diagnostic | 5 | ⬜ |
| 6 | Automatisation et DevOps pour le Système | 5 | ⬜ |
| 7 | Introduction à Rust pour la Sécurité Mémoire | 5 | ⬜ |
| 8 | Projet Final et Validation de Compétences | 5 | ⬜ |

> **Statut :** ⬜ À faire · 🔄 En cours · 🔁 À revoir · ✅ Validé

---

## Step 1 — Architecture Système et Fondations Matérielles

> **Objectif :** Comprendre le terrain — de la machine physique au démarrage du système.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Architecture des Ordinateurs et Fonctionnement des Processeurs | ⬜ |
| 2 | Gestion de la Mémoire Vive et Hiérarchie des Stockages | ⬜ |
| 3 | Fondamentaux du Noyau Linux et Appels Système | ⬜ |
| 4 | Principes de Fonctionnement du BIOS et de l'UEFI | ⬜ |
| 5 | Cycle de Vie d'un Programme de la Compilation à l'Exécution | ⬜ |

**Évaluation :**
- [ ] Expliquer le chemin d'un programme depuis le disque jusqu'à l'exécution
- [ ] Décrire le rôle du système d'exploitation

---

## Step 2 — Programmation Système en Langage C

> **Objectif :** Poser la fondation de bas niveau — maîtriser C comme outil principal du parcours.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Syntaxe Fondamentale et Gestion des Types en C | ⬜ |
| 2 | Manipulation Avancée des Pointeurs et Adressage Mémoire | ⬜ |
| 3 | Gestion de la Pile et du Tas pour l'Allocation Dynamique | ⬜ |
| 4 | Structures de Données et Manipulation de la Mémoire | ⬜ |
| 5 | Techniques de Débogage et Analyse de Code avec GDB | ⬜ |

**Évaluation :**
- [ ] Écrire un programme C simple, compiler et corriger une erreur
- [ ] Expliquer un pointeur et repérer un bug mémoire
- [ ] Manipuler des structures simples en C

---

## Step 3 — Interaction Système et Gestion des Processus

> **Objectif :** Comprendre l'exécution dynamique — fichiers, processus, signaux, concurrence.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Manipulation des Fichiers et Flux d'Entrées Sorties | ⬜ |
| 2 | Gestion des Processus via les Appels Système POSIX | ⬜ |
| 3 | Mécanismes de Signalisation et Communication Inter-processus | ⬜ |
| 4 | Programmation Concurrente et Gestion des Verrous | ⬜ |
| 5 | Observation des Performances Système avec Outils Bas Niveau | ⬜ |

**Évaluation :**
- [ ] Écrire un programme C qui lit et écrit un fichier
- [ ] Expliquer la différence entre bibliothèque et appel système
- [ ] Identifier un processus, lire son état, envoyer un signal

---

## Step 4 — Administration Système Linux

> **Objectif :** Prendre la main sur la machine — utilisateurs, services, logs, stockage.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Gestion Avancée des Utilisateurs et des Groupes | ⬜ |
| 2 | Configuration et Maintenance des Services Système avec Systemd | ⬜ |
| 3 | Analyse et Rotation des Journaux Système | ⬜ |
| 4 | Gestion du Stockage et Montage des Systèmes de Fichiers | ⬜ |
| 5 | Durcissement et Sécurité des Permissions Système | ⬜ |

**Évaluation :**
- [ ] Créer un compte et modifier un droit
- [ ] Consulter un journal
- [ ] Diagnostiquer un service arrêté

---

## Step 5 — Réseautage Système et Diagnostic

> **Objectif :** Comprendre les échanges machine à machine — IP, DNS, trafic, pare-feu.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Architecture du Protocole TCP/IP et Couches Réseau | ⬜ |
| 2 | Configuration des Interfaces et Routage Système | ⬜ |
| 3 | Résolution de Noms et Infrastructure DNS | ⬜ |
| 4 | Analyse de Trafic et Diagnostic de Connectivité Réseau | ⬜ |
| 5 | Exposition Sécurisée des Services et Pare-feu | ⬜ |

**Évaluation :**
- [ ] Vérifier une connexion et expliquer le rôle d'un port
- [ ] Diagnostiquer une panne réseau simple

---

## Step 6 — Automatisation et DevOps pour le Système

> **Objectif :** Réduire les tâches répétitives — scripting, Git, conteneurs, CI/CD.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Automatisation Système avec Shell Scripting Avancé | ⬜ |
| 2 | Gestion de Version et Workflow avec Git | ⬜ |
| 3 | Conteneurisation des Applications avec Docker | ⬜ |
| 4 | Orchestration de Déploiement et Environnements Isolés | ⬜ |
| 5 | Mise en Place de Pipelines CI/CD pour Projets Systèmes | ⬜ |

**Évaluation :**
- [ ] Écrire un script utilitaire et automatiser une tâche d'administration
- [ ] Créer un dépôt et versionner un projet
- [ ] Lancer une application dans un conteneur

---

## Step 7 — Introduction à Rust pour la Sécurité Mémoire

> **Objectif :** Étendre le socle C — comparer, sécuriser, renforcer la discipline de conception.  
> ⚠️ **Prérequis** : Steps 1 à 3 entièrement validés (pointeurs, mémoire dynamique, processus, débogage).

| # | Cours | Statut |
|---|-------|--------|
| 1 | Introduction à la Gestion de la Mémoire par l'Ownership | ⬜ |
| 2 | Typage Fort et Sûreté Mémoire en Rust | ⬜ |
| 3 | Comparaison des Abstractions Rust versus C | ⬜ |
| 4 | Développement de Modules Systèmes Sécurisés en Rust | ⬜ |
| 5 | Intégration de Rust dans les Projets C Existants | ⬜ |

**Évaluation :**
- [ ] Expliquer le modèle d'ownership et le comparer à C
- [ ] Écrire un module système simple en Rust
- [ ] Intégrer du code Rust dans un projet C existant

---

## Step 8 — Projet Final et Validation de Compétences

> **Objectif :** Consolider et prouver la maîtrise — concevoir, déployer, auditer, documenter.

| # | Cours | Statut |
|---|-------|--------|
| 1 | Conception d'un Utilitaire Système en C | ⬜ |
| 2 | Implémentation d'un Service Linux Déployé en Conteneur | ⬜ |
| 3 | Audit de Sécurité et Durcissement d'une Infrastructure | ⬜ |
| 4 | Restitution Technique et Documentation de Projet | ⬜ |
| 5 | Simulation de Diagnostic et Correction d'Incidents en Temps Réel | ⬜ |

**Évaluation :**
- [ ] Reprendre un ancien exercice sans aide
- [ ] Expliquer plusieurs notions enchaînées
- [ ] Corriger une erreur et livrer un mini-projet final

---

## Rappel — Règle de validation (4 conditions)

Un cours est **validé** seulement si :

1. ✅ **Explication** — le sujet peut être expliqué sans support
2. ✅ **Reproduction** — le sujet peut être refait de manière autonome
3. ✅ **Application** — le sujet peut être adapté à un cas nouveau
4. ✅ **Correction** — les erreurs peuvent être identifiées et corrigées sans aide

> Si une seule condition échoue → statut **🔁 À revoir**

---

## Révisions espacées

| Délai | Action |
|-------|--------|
| +24h | Première révision après validation |
| +7j  | Deuxième révision |
| +30j | Troisième révision — confirmation de maîtrise |
