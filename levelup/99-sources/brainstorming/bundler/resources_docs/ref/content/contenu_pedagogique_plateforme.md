# Contenu pédagogique de la plateforme
## Roadmaps, prérequis et sujets par domaine

## 1. Objet

Ce document définit le contenu que la plateforme doit stocker et exploiter pour alimenter le parcours d’apprentissage.

La plateforme ne doit pas seulement gérer des écrans ou des séances. Elle doit aussi contenir une **structure de connaissance exploitable**, organisée par :
- domaine ;
- sous-domaine ;
- roadmap ;
- prérequis ;
- sujets ;
- exercices ;
- projets ;
- validations ;
- révisions.

---

## 2. Principe central

Chaque domaine doit être construit comme une chaîne logique :

**Vision du domaine → roadmap → sous-domaines → sujets → prérequis → exercices → mini-projets → validation**

Sans cette chaîne, la plateforme risque de devenir un simple planning vide.

---

## 3. Structure du contenu par domaine

Chaque domaine doit contenir les objets suivants :

### 3.1 Métadonnées du domaine
- nom du domaine ;
- description ;
- objectif général ;
- niveau cible ;
- rôle dans le parcours ;
- ordre dans la progression globale.

### 3.2 Roadmap du domaine
La roadmap est la carte d’apprentissage du domaine.
Elle doit contenir :
- phases ;
- sous-domaines ;
- ordre d’étude ;
- dépendances ;
- durée estimée ;
- niveau de maîtrise attendu ;
- validation finale.

### 3.3 Répertoire de sujets
Chaque sujet doit contenir :
- titre ;
- description ;
- objectif pédagogique ;
- prérequis ;
- durée estimée ;
- niveau de difficulté ;
- type d’activité ;
- type d’évaluation ;
- statut.

### 3.4 Banque d’exercices
Chaque sujet doit pouvoir avoir :
- un exercice guidé ;
- un exercice autonome ;
- un exercice de révision ;
- un exercice surprise ou de consolidation.

### 3.5 Banque de projets
Chaque domaine doit contenir des mini-projets qui consolident les notions apprises.

### 3.6 Banque de révision
Les sujets importants doivent être révisables selon :
- J+1 ;
- J+7 ;
- J+30 ;
- révision au besoin.

---

## 4. Modèle de roadmap

Une roadmap doit être découpée en 4 couches :

### Couche 1 — Fondations
Elle contient les bases nécessaires pour comprendre le domaine.

### Couche 2 — Pratique guidée
Elle contient les premiers exercices contrôlés.

### Couche 3 — Projets
Elle contient les réalisations concrètes.

### Couche 4 — Validation
Elle contient les tests, reprises et consolidations.

---

## 5. Modèle de sujet

Chaque sujet doit suivre une fiche standard.

### Structure type d’un sujet
- `title`
- `domain`
- `subdomain`
- `objective`
- `summary`
- `prerequisites`
- `estimated_minutes`
- `difficulty`
- `level`
- `practice_type`
- `validation_criteria`
- `revision_intervals`
- `linked_project`
- `status`

### Exemple
Sujet : **Pointeurs en C**
- objectif : comprendre l’adresse mémoire et le passage par référence indirecte ;
- prérequis : variables, types, mémoire, tableaux ;
- exercice : manipuler un tableau via pointeur ;
- validation : expliquer un pointeur et corriger un bug simple.

---

## 6. Domaine 1 — Développement système

C’est le domaine principal.
Le langage socle est **C**.
Rust intervient plus tard comme extension.

### 6.1 Objectif du domaine
Comprendre le fonctionnement interne des programmes et de la machine :
- mémoire ;
- fichiers ;
- processus ;
- appels système ;
- concurrence ;
- compilation ;
- diagnostic ;
- interaction bas niveau avec le système.

### 6.2 Roadmap du domaine

#### Phase A — Fondations machine
Sujets :
- architecture d’un ordinateur ;
- CPU ;
- mémoire ;
- stockage ;
- système d’exploitation ;
- exécution d’un programme.

#### Phase B — Fondations C
Sujets :
- syntaxe de base ;
- types ;
- variables ;
- fonctions ;
- compilation ;
- exécution ;
- erreurs ;
- organisation d’un projet C.

#### Phase C — Mémoire et pointeurs
Sujets :
- pile ;
- tas ;
- pointeurs ;
- tableaux ;
- structures ;
- allocation dynamique ;
- fuite mémoire ;
- validité des adresses.

#### Phase D — Fichiers et E/S
Sujets :
- lecture ;
- écriture ;
- buffers ;
- fichiers texte ;
- fichiers binaires ;
- erreurs d’E/S ;
- gestion des permissions.

#### Phase E — Processus et exécution
Sujets :
- processus ;
- PID ;
- fork ;
- exec ;
- signaux ;
- communication de base ;
- surveillance de processus.

#### Phase F — Débogage et outillage
Sujets :
- compilation avec warnings ;
- gdb ;
- valgrind ;
- logs ;
- diagnostic d’erreurs.

#### Phase G — Concurrence et réseau de base
Sujets :
- threads ;
- synchronisation ;
- mutex ;
- sockets ;
- client/serveur simple.

#### Phase H — Validation avancée
Sujets :
- mini-outils système ;
- manipulateurs de fichiers ;
- utilitaires CLI ;
- projet final du domaine.

### 6.3 Pré requis majeurs du domaine
- architecture machine ;
- terminal et Linux ;
- commandes de base ;
- notions de fichiers et permissions.

### 6.4 Projets possibles
- utilitaire de consultation de fichier ;
- mini-shell simplifié ;
- outil de statistiques sur fichiers ;
- lecteur de logs ;
- outil de surveillance de processus.

---

## 7. Domaine 2 — Administration système

### 7.1 Objectif du domaine
Savoir piloter, diagnostiquer et maintenir un système Linux.

### 7.2 Roadmap du domaine

#### Phase A — Bases Linux
Sujets :
- arborescence Linux ;
- shell ;
- commandes fondamentales ;
- utilisateurs ;
- groupes ;
- permissions.

#### Phase B — Services et démarrage
Sujets :
- systemd ;
- services ;
- unités ;
- démarrage ;
- activation automatique.

#### Phase C — Stockage
Sujets :
- partitions ;
- montage ;
- systèmes de fichiers ;
- quotas ;
- sauvegarde.

#### Phase D — Réseau
Sujets :
- IP ;
- DNS ;
- ports ;
- routage ;
- diagnostic réseau.

#### Phase E — Journalisation et diagnostic
Sujets :
- logs système ;
- journald ;
- erreurs ;
- dépannage ;
- surveillance.

#### Phase F — Sécurité de base
Sujets :
- pare-feu ;
- accès ;
- durcissement ;
- bonnes pratiques ;
- droits minimums.

### 7.3 Pré requis majeurs du domaine
- terminal ;
- système de fichiers ;
- permissions ;
- processus.

### 7.4 Projets possibles
- configuration d’un serveur local ;
- script de sauvegarde ;
- audit utilisateur ;
- supervision simple ;
- plan de restauration.

---

## 8. Domaine 3 — DevOps / DevSecOps

### 8.1 Objectif du domaine
Mettre en place l’automatisation, le déploiement, la sécurité et la reproductibilité.

### 8.2 Roadmap du domaine

#### Phase A — Versioning
Sujets :
- Git ;
- branches ;
- commits ;
- merges ;
- stratégies de travail.

#### Phase B — Automatisation
Sujets :
- scripts shell ;
- scripts d’installation ;
- tâches répétitives ;
- packaging ;
- orchestration simple.

#### Phase C — Conteneurs
Sujets :
- images ;
- conteneurs ;
- volumes ;
- réseaux ;
- composition.

#### Phase D — CI/CD
Sujets :
- pipeline ;
- tests automatisés ;
- build ;
- déploiement ;
- contrôle qualité.

#### Phase E — Sécurité
Sujets :
- secrets ;
- permissions ;
- durcissement ;
- contrôle d’accès ;
- journalisation.

#### Phase F — Observabilité
Sujets :
- logs ;
- métriques ;
- alertes ;
- état d’un service ;
- supervision.

### 8.3 Pré requis majeurs du domaine
- Linux ;
- shell ;
- Git ;
- notions réseau ;
- compréhension des services.

### 8.4 Projets possibles
- pipeline local de test ;
- déploiement local d’une application ;
- automatisation de sauvegarde ;
- journalisation centralisée ;
- durcissement d’un service local.

---

## 9. Structure de remplissage par domaine

Chaque domaine doit être alimenté selon ce cycle :

1. **Définir la vision du domaine**
2. **Construire la roadmap**
3. **Lister les sous-domaines**
4. **Créer les sujets dans l’ordre des dépendances**
5. **Associer les prérequis**
6. **Associer les exercices**
7. **Associer les mini-projets**
8. **Définir les critères de validation**
9. **Planifier les révisions**
10. **Maintenir et enrichir progressivement**

---

## 10. Format de fiche pour un sujet

### Exemple de structure de donnée
- Identifiant
- Domaine
- Sous-domaine
- Titre
- Objectif
- Prérequis
- Niveau
- Difficulté
- Durée estimée
- Ressource principale
- Exercice guidé
- Exercice autonome
- Critères de validation
- Dates de révision
- Statut
- Projet lié

---

## 11. Ordre d’alimentation recommandé

Pour éviter l’éparpillement, les sujets doivent être créés dans cet ordre :

### 11.1 D’abord le socle commun
- architecture machine ;
- terminal ;
- Linux ;
- fichiers ;
- permissions ;
- réseau de base ;
- Git.

### 11.2 Ensuite le domaine principal
- C ;
- mémoire ;
- pointeurs ;
- E/S ;
- processus ;
- débogage.

### 11.3 Puis l’administration système
- services ;
- stockage ;
- diagnostics ;
- sécurité.

### 11.4 Ensuite DevOps / DevSecOps
- automatisation ;
- conteneurs ;
- CI/CD ;
- supervision ;
- sécurité.

### 11.5 Enfin Rust
Rust doit être ajouté seulement après stabilité du socle C.

---

## 12. Règle d’équilibre

La base de données pédagogique ne doit pas être remplie uniquement de titres.

Chaque sujet doit avoir au minimum :
- un objectif clair ;
- un prérequis ;
- une activité pratique ;
- un critère de validation ;
- une échéance de révision.

---

## 13. Ce que la plateforme doit savoir faire avec ces données

La plateforme doit pouvoir :
- choisir le prochain sujet logique ;
- bloquer un sujet dont les prérequis manquent ;
- proposer une révision ;
- afficher la roadmap du domaine ;
- relier un sujet à un projet ;
- calculer la progression ;
- détecter les lacunes ;
- maintenir la cohérence de l’ensemble.

---

## 14. Conclusion

La vraie valeur de la plateforme viendra de la qualité du contenu pédagogique stocké.

Il faut donc construire une base de données de connaissance, pas seulement une liste de cours.

La logique correcte est :
- roadmap claire ;
- sujets dépendants ;
- exercices alignés ;
- projets concrets ;
- révision systématique ;
- validation stricte.

