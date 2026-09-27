# Système d’apprentissage formel

## 1. Finalité

Ce système a pour but de construire une maîtrise durable et vérifiable dans trois domaines ordonnés par priorité :

1. **Domaine principal : Développement système**
2. **Domaine secondaire : Administration système**
3. **Domaine d’appui : DevOps / DevSecOps**

Le principe central est simple : **un sujet n’est acquis que s’il peut être expliqué, reproduit, réappliqué et corrigé sans assistance immédiate**.

---

## 2. Règles exactes du système

### 2.1 Règle de maîtrise
Un sujet est considéré comme validé seulement si les 4 conditions suivantes sont remplies :

- **Explication** : le sujet peut être expliqué clairement, sans support.
- **Reproduction** : le sujet peut être refait de manière autonome.
- **Application** : le sujet peut être adapté à un cas nouveau mais proche.
- **Correction** : les erreurs peuvent être identifiées et corrigées sans aide immédiate.

Si une seule condition échoue, le sujet reste en cours.

### 2.2 Règle de dépendance
L’ordre d’étude suit les prérequis, pas les envies du moment.

Avant d’aborder un sujet, il faut vérifier :

- les bases nécessaires sont acquises ;
- les dépendances conceptuelles sont identifiées ;
- un exercice court de contrôle est réussi.

### 2.3 Règle de profondeur
Le but n’est pas de survoler beaucoup de thèmes. Le but est de **descendre assez profondément** pour que la compréhension soit stable.

### 2.4 Règle de clôture
Un sujet ne doit pas rester ouvert indéfiniment.

Il est clôturé lorsque :

- le contenu est compris ;
- un exercice a été réalisé ;
- une restitution écrite a été produite ;
- une validation a été enregistrée.

### 2.5 Règle de révision
Toute notion importante doit être revue à intervalles réguliers :

- **24 heures** après l’étude ;
- **7 jours** après ;
- **30 jours** après.

---

## 3. Niveau de maîtrise attendu

Chaque notion doit être franchie selon 4 niveaux.

### Niveau 1 — Fondations
Objectif : comprendre le vocabulaire, les idées et les mécanismes de base.

Livrables attendus :
- notes courtes ;
- schémas ;
- définitions ;
- exemples simples.

### Niveau 2 — Pratique guidée
Objectif : exécuter sous cadre.

Livrables attendus :
- exercices ;
- scripts ;
- manipulations ;
- corrections.

### Niveau 3 — Projets
Objectif : assembler plusieurs notions dans un résultat réel.

Livrables attendus :
- mini-projet ;
- documentation ;
- tests ;
- version fonctionnelle.

### Niveau 4 — Validation / Révision
Objectif : prouver l’autonomie.

Livrables attendus :
- explication orale ou écrite ;
- reproduction sans aide ;
- résolution d’un cas nouveau ;
- reprise d’un ancien sujet.

---

## 4. Méthode de progression

### 4.1 Chaîne obligatoire
Chaque sujet suit la même chaîne :

**Découverte → Compréhension → Pratique guidée → Exercice autonome → Validation → Révision**

### 4.2 Critère d’avancement
Tu ne passes au sujet suivant que si le sujet actuel a produit :

- une note claire ;
- un exercice réussi ;
- une correction comprise ;
- une validation minimale.

### 4.3 Critère d’échec
Un sujet est considéré comme non acquis si :

- il n’est pas expliqué clairement ;
- il ne peut pas être reproduit ;
- l’exercice échoue sans correction maîtrisée ;
- le sujet est oublié trop vite.

---

## 5. Structure de suivi

### 5.1 Journal d’apprentissage
Chaque séance doit laisser une trace dans un journal unique.

Champs obligatoires :
- date ;
- domaine ;
- sujet ;
- niveau ;
- durée réelle ;
- ce qui a été appris ;
- difficulté rencontrée ;
- erreur commise ;
- correction appliquée ;
- date de révision prévue ;
- statut : en cours / validé / à reprendre.

### 5.2 Fiche de validation
Chaque sujet validé reçoit une fiche contenant :

- nom du sujet ;
- prérequis ;
- résumé en 5 à 10 lignes ;
- exercice réalisé ;
- résultat ;
- point faible ;
- point acquis ;
- date de reprise future.

### 5.3 Tableau de progression
Le tableau de progression doit contenir 4 colonnes :

- **À faire**
- **En cours**
- **À revoir**
- **Validé**

Aucun sujet ne doit rester sans statut.

---

## 6. Calendrier hebdomadaire

Le rythme recommandé est une semaine structurée autour de 6 jours utiles et 1 jour de révision légère.

### Répartition générale
- **Jour 1** : compréhension
- **Jour 2** : pratique guidée
- **Jour 3** : consolidation
- **Jour 4** : nouveau sujet lié
- **Jour 5** : exercice autonome
- **Jour 6** : test et correction
- **Jour 7** : révision légère et bilan

### Règle horaire
Chaque séance doit respecter 3 blocs :

1. **Bloc théorique** — apprendre le fond.
2. **Bloc pratique** — exécuter.
3. **Bloc restitution** — expliquer et noter.

### Répartition conseillée par séance
- 40 % théorie utile
- 40 % pratique
- 20 % restitution / correction

---

## 7. Organisation quotidienne

Chaque séance suit la même structure.

### Phase A — Mise en route
- relire la séance précédente ;
- rappeler le but du jour ;
- noter les prérequis.

### Phase B — Apprentissage
- lecture ciblée ;
- observation ;
- schéma mental ;
- prise de notes courte.

### Phase C — Exercice
- manipulation ;
- code ;
- lab ;
- résolution de problème.

### Phase D — Restitution
- expliquer le sujet sans support ;
- écrire un résumé ;
- noter les erreurs.

### Phase E — Fermeture
- décider si le sujet est acquis, à revoir, ou à reprendre.

---

## 8. Socle technique du parcours

Le langage principal du parcours est **C**.

Rust n’est pas le point de départ. Rust est placé plus tard comme extension conceptuelle et pratique, une fois le socle C stabilisé.

### Raison du choix de C
C impose de travailler directement sur :
- les pointeurs ;
- la mémoire ;
- les tableaux ;
- les structures ;
- les buffers ;
- les appels système ;
- la compréhension du coût réel des opérations.

C est adapté au développement système parce qu’il expose la machine avec peu d’intermédiaires.

### Rôle de Rust
Rust intervient après consolidation de C pour :
- comparer une autre manière de gérer la mémoire ;
- étudier la sûreté mémoire ;
- voir des abstractions plus strictes ;
- renforcer la discipline de conception.

### Critère d’entrée vers Rust
Rust ne doit être abordé qu’après avoir validé en C :
- types et fonctions ;
- compilation ;
- pointeurs ;
- allocation dynamique ;
- structures ;
- fichiers ;
- processus ;
- débogage de base.

---

## 9. Plan d’étude concret — version 12 semaines

La version 12 semaines est la version de base. Elle permet d’avancer avec profondeur et régularité.

### Semaine 1 — Architecture machine et environnement de travail
**Objectif** : comprendre le terrain.

Sujets :
- architecture d’un ordinateur ;
- rôle du CPU, de la mémoire, du stockage ;
- BIOS/UEFI ;
- système d’exploitation ;
- installation et organisation de l’environnement de travail.

Évaluation :
- expliquer le chemin d’un programme depuis le disque jusqu’à l’exécution ;
- décrire le rôle du système d’exploitation.

### Semaine 2 — Shell, terminal et système de fichiers
**Objectif** : savoir manipuler le système.

Sujets :
- terminal ;
- commandes de base ;
- arborescence Linux ;
- chemins absolus et relatifs ;
- permissions ;
- liens ;
- redirections.

Évaluation :
- naviguer, créer, déplacer, rechercher, filtrer ;
- expliquer la logique des permissions.

### Semaine 3 — Programmation système en C : bases du langage
**Objectif** : poser la fondation de bas niveau.

Sujets :
- C comme langage principal ;
- variables, types, fonctions ;
- compilation ;
- exécution ;
- erreurs ;
- lecture du manuel et documentation ;
- place de Rust comme extension ultérieure.

Évaluation :
- écrire un programme C simple ;
- compiler ;
- corriger une erreur.

### Semaine 4 — Mémoire, pointeurs et données en C
**Objectif** : comprendre ce qui se passe sous le capot.

Sujets :
- mémoire vive ;
- pile et tas ;
- adressage ;
- pointeurs ;
- allocation dynamique ;
- structures ;
- copies et aliasing.

Évaluation :
- expliquer un pointeur ;
- repérer un bug mémoire ;
- manipuler des structures simples en C.

### Semaine 5 — Fichiers, E/S et appels système
**Objectif** : interagir avec le système.

Sujets :
- fichiers ;
- lecture/écriture ;
- buffers ;
- entrées/sorties ;
- appels système ;
- permissions et erreurs.

Évaluation :
- écrire un programme C qui lit et écrit un fichier ;
- expliquer la différence entre bibliothèque et appel système.

### Semaine 6 — Processus, signaux et exécution
**Objectif** : comprendre l’exécution dynamique.

Sujets :
- processus ;
- PID ;
- parent / enfant ;
- signaux ;
- exécution concurrente de base ;
- observation avec les outils système.

Évaluation :
- identifier un processus ;
- lire son état ;
- envoyer un signal ;
- expliquer ce qu’est un processus.

### Semaine 7 — Administration système de base
**Objectif** : prendre la main sur la machine.

Sujets :
- utilisateurs ;
- groupes ;
- permissions avancées ;
- services ;
- logs ;
- stockage ;
- montage.

Évaluation :
- créer un compte ;
- modifier un droit ;
- consulter un journal ;
- diagnostiquer un service arrêté.

### Semaine 8 — Réseau de base et diagnostic
**Objectif** : comprendre les échanges machine à machine.

Sujets :
- IP ;
- ports ;
- DNS ;
- routage simple ;
- test de connectivité ;
- dépannage réseau.

Évaluation :
- vérifier une connexion ;
- expliquer le rôle d’un port ;
- diagnostiquer une panne simple.

### Semaine 9 — Script, automatisation et reproductibilité
**Objectif** : réduire les tâches répétitives.

Sujets :
- shell scripting ;
- variables ;
- conditions ;
- boucles ;
- arguments ;
- automatisation simple.

Évaluation :
- écrire un script utilitaire ;
- automatiser une tâche d’administration ;
- documenter le script.

### Semaine 10 — Git et gestion de version
**Objectif** : suivre l’évolution du travail.

Sujets :
- dépôt ;
- commit ;
- branche ;
- merge ;
- historique ;
- bonnes pratiques.

Évaluation :
- créer un dépôt ;
- versionner un projet ;
- corriger un historique simple.

### Semaine 11 — Conteneurs, déploiement et DevOps
**Objectif** : emballer et livrer proprement.

Sujets :
- image ;
- conteneur ;
- environnement ;
- déploiement local ;
- configuration ;
- séparation des responsabilités.

Évaluation :
- lancer une application dans un conteneur ;
- comprendre la différence image / conteneur ;
- préparer un déploiement local.

### Semaine 12 — Sécurité, validation et projet final
**Objectif** : consolider et prouver la maîtrise.

Sujets :
- sécurité minimale ;
- permissions ;
- exposition des services ;
- durcissement de base ;
- revue générale ;
- projet final.

Évaluation :
- reprendre un ancien exercice sans aide ;
- expliquer plusieurs notions enchaînées ;
- corriger une erreur ;
- livrer un mini-projet final.

---

## 10. Plan d’étude compressé — version 8 semaines

La version 8 semaines est une compression du plan précédent. Elle garde la même logique, mais regroupe certains sujets.

### Semaine 1
- architecture machine ;
- OS ;
- terminal ;
- filesystem.

### Semaine 2
- langage C ;
- compilation ;
- mémoire ;
- fonctions ;
- types.

### Semaine 3
- fichiers ;
- E/S ;
- appels système ;
- erreurs.

### Semaine 4
- processus ;
- signaux ;
- réseaux de base ;
- diagnostic.

### Semaine 5
- administration système ;
- permissions ;
- services ;
- logs ;
- stockage.

### Semaine 6
- scripting ;
- automatisation ;
- Git ;
- versioning.

### Semaine 7
- conteneurs ;
- déploiement ;
- bases DevOps ;
- sécurité minimale.

### Semaine 8
- révision complète ;
- mini-projet ;
- tests ;
- validation finale.

---

## 11. Évaluations obligatoires

### 11.1 Évaluation quotidienne
Chaque jour, répondre à 3 questions :

- Qu’est-ce que j’ai compris ?
- Qu’est-ce que je peux refaire ?
- Qu’est-ce qui reste flou ?

### 11.2 Évaluation hebdomadaire
Chaque fin de semaine, produire :

- 1 résumé structuré ;
- 1 exercice réussi ;
- 1 erreur corrigée ;
- 1 révision d’un ancien sujet.

### 11.3 Évaluation mensuelle
Chaque mois, valider :

- les sujets réellement acquis ;
- les sujets à reprendre ;
- les points faibles récurrents ;
- les priorités du mois suivant.

---

## 12. Règles de progression

### Passer au sujet suivant uniquement si :
- la base théorique est comprise ;
- la pratique guidée a été effectuée ;
- un exercice autonome a été réussi ;
- une restitution claire a été faite.

### Revenir en arrière si :
- la compréhension est fragile ;
- la reproduction échoue ;
- l’explication est confuse ;
- la notion est oubliée trop vite.

### Ne pas cumuler trop d’objectifs
Un excès de sujets affaiblit la maîtrise.

Règle :
- 1 sujet principal ;
- 1 sujet secondaire lié ;
- 1 sujet de révision.

---

## 13. Structure minimale de la plateforme de suivi

La plateforme n’est utile que si elle sert le système précédent.

### Modules minimaux
- calendrier ;
- liste des sujets ;
- fiches de validation ;
- journal de séance ;
- alertes de révision ;
- état de progression.

### Priorité technique
La plateforme ne doit pas être complexe au départ.

Ordre conseillé :
1. cahier de suivi simple ;
2. tableau de progression ;
3. rappels automatiques ;
4. puis seulement la plateforme complète.

---

## 14. Intégration de Rust après C

Rust ne doit pas être placé au début du parcours. Il devient utile après la consolidation du C.

### Moment d’introduction
Rust ne doit être étudié qu’après validation des bases suivantes :
- variables et types en C ;
- compilation et exécution ;
- pointeurs ;
- mémoire dynamique ;
- structures ;
- fichiers ;
- processus ;
- débogage d’erreurs courantes.

### Rôle de Rust dans le parcours
Rust sert ensuite à :
- comparer une autre manière de gérer la mémoire ;
- comprendre les abstractions modernes ;
- étudier la sûreté mémoire ;
- renforcer la discipline de conception.

### Ordre recommandé après le socle C
1. consolider C ;
2. terminer les bases systèmes ;
3. introduire Rust sur des projets ciblés ;
4. comparer les deux modèles sur des cas concrets.

### Principe de progression
Rust ne remplace pas C dans ce plan. Rust s’ajoute à C comme extension conceptuelle et pratique, une fois que le socle bas niveau est solide.

---

## 15. Règle finale

Le système est bon seulement s’il produit trois effets :

- une compréhension solide ;
- une pratique répétable ;
- une progression visible.

Si un bloc ne produit pas ces trois effets, il doit être corrigé ou supprimé.

