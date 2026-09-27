# Cahier des charges fonctionnel
## Plateforme de pilotage de l’apprentissage

### Version
Version 1.0

### Objet du document
Ce document définit les besoins fonctionnels de la plateforme de pilotage de l’apprentissage. La plateforme a pour rôle de structurer, suivre, valider et réviser un parcours d’apprentissage centré sur le développement système, l’administration système et DevOps / DevSecOps.

---

## 1. Contexte et justification

L’utilisateur souhaite mettre en place un système personnel de pilotage de l’apprentissage afin de réduire la dispersion, d’augmenter la profondeur de compréhension, et de garantir une progression mesurable.

Le besoin principal est de disposer d’un outil capable de :
- présenter les sujets dans un ordre logique fondé sur les prérequis ;
- enregistrer les séances de travail ;
- valider les acquis ;
- programmer les révisions ;
- suivre la progression globale ;
- signaler les retards et les blocages.

La plateforme doit être conçue pour servir le plan d’apprentissage, et non l’inverse.

---

## 2. Objectifs du projet

### 2.1 Objectif principal
Construire une plateforme de gestion de l’apprentissage permettant d’organiser, suivre et valider un parcours de formation technique structuré.

### 2.2 Objectifs secondaires
- améliorer la discipline d’étude ;
- imposer un ordre d’apprentissage cohérent ;
- rendre la progression visible ;
- réduire l’oubli par un système de révision ;
- relier les notions apprises à des projets concrets.

---

## 3. Périmètre fonctionnel

### 3.1 Inclus
La plateforme doit permettre :
- la gestion des domaines, sous-domaines et sujets ;
- la gestion des prérequis ;
- la planification des séances ;
- l’enregistrement des activités réalisées ;
- la validation des sujets ;
- la planification des révisions ;
- le suivi des projets ;
- l’affichage d’un tableau de bord ;
- l’émission de notifications ;
- l’historisation des actions.

### 3.2 Exclus pour la première version
Ne sont pas obligatoires dans la première version :
- intelligence artificielle intégrée ;
- synchronisation multi-appareils avancée ;
- application mobile native ;
- collaboration multi-utilisateur ;
- messagerie interne complexe ;
- fonctionnalités sociales ;
- analytics avancés.

---

## 4. Utilisateur cible

### 4.1 Utilisateur principal
L’utilisateur principal est une seule personne : l’apprenant qui utilise la plateforme pour piloter son parcours.

### 4.2 Profils d’usage
- **Apprenant** : consulte le plan, exécute les séances, valide les acquis, suit les révisions.
- **Administrateur local** : configure la plateforme, gère les paramètres, structure les données de base.

Dans la première version, ces deux rôles peuvent être assurés par le même utilisateur.

---

## 5. Besoins fonctionnels

### 5.1 Besoin 1 — Organiser les contenus d’apprentissage
La plateforme doit permettre de créer et structurer :
- des domaines ;
- des sous-domaines ;
- des sujets ;
- des prérequis ;
- des séquences d’étude ;
- des niveaux de difficulté.

### 5.2 Besoin 2 — Suivre les séances
La plateforme doit permettre d’enregistrer chaque séance d’apprentissage avec :
- date ;
- durée ;
- sujet traité ;
- type d’activité ;
- résultat ;
- difficulté rencontrée ;
- note de fin.

### 5.3 Besoin 3 — Valider les acquis
La plateforme doit permettre de déclarer qu’un sujet est :
- en cours ;
- à revoir ;
- validé ;
- bloqué.

La validation doit être associée à des preuves minimales.

### 5.4 Besoin 4 — Gérer les révisions
La plateforme doit générer et suivre des révisions à intervalle défini.

### 5.5 Besoin 5 — Suivre les projets
La plateforme doit relier les sujets validés à des projets concrets.

### 5.6 Besoin 6 — Visualiser la progression
La plateforme doit fournir une vue synthétique de l’état global du parcours.

---

## 6. Fonctions attendues

### 6.1 Gestion des domaines
La plateforme doit permettre :
- d’ajouter un domaine ;
- de modifier un domaine ;
- de supprimer un domaine ;
- d’afficher la liste des domaines.

### 6.2 Gestion des sous-domaines
La plateforme doit permettre :
- d’associer un sous-domaine à un domaine ;
- de modifier un sous-domaine ;
- de supprimer un sous-domaine ;
- d’afficher les sous-domaines par domaine.

### 6.3 Gestion des sujets
La plateforme doit permettre :
- d’ajouter un sujet ;
- d’assigner un sujet à un sous-domaine ;
- de définir son niveau ;
- de définir ses prérequis ;
- de consulter son état.

### 6.4 Gestion des prérequis
La plateforme doit permettre :
- de lier un sujet à un ou plusieurs prérequis ;
- de bloquer l’accès logique à un sujet si les prérequis ne sont pas validés ;
- d’indiquer les prérequis manquants.

### 6.5 Gestion des séances
La plateforme doit permettre :
- de planifier une séance ;
- de démarrer une séance ;
- de noter les actions effectuées ;
- de clôturer une séance ;
- de lier la séance à un sujet.

### 6.6 Gestion des validations
La plateforme doit permettre :
- de valider un sujet ;
- de refuser la validation ;
- de remettre un sujet en révision ;
- d’enregistrer les critères de validation.

### 6.7 Gestion des révisions
La plateforme doit permettre :
- de créer une révision automatique après validation ou étude ;
- d’afficher les révisions à venir ;
- de marquer une révision comme effectuée ;
- de hiérarchiser les révisions par priorité.

### 6.8 Gestion des projets
La plateforme doit permettre :
- de créer un projet ;
- de relier un projet à des sujets ;
- de suivre l’avancement ;
- d’enregistrer les livrables ;
- de lier les projets à l’apprentissage.

### 6.9 Tableau de bord
La plateforme doit afficher :
- le nombre de sujets à faire ;
- le nombre de sujets en cours ;
- le nombre de sujets validés ;
- le nombre de sujets à réviser ;
- le nombre de sujets bloqués ;
- la progression globale.

### 6.10 Notifications
La plateforme doit être capable de signaler :
- les séances prévues ;
- les révisions dues ;
- les sujets bloqués ;
- les retards ;
- les validations en attente.

---

## 7. Règles de gestion

### RG1 — Validation stricte
Un sujet ne peut être marqué comme validé que si une preuve minimale de maîtrise est enregistrée.

### RG2 — Ordre des dépendances
Un sujet ne doit pas être traité avant que ses prérequis soient validés, sauf exception manuelle autorisée par l’utilisateur.

### RG3 — Traçabilité obligatoire
Toute séance, validation, correction ou révision doit être historisée.

### RG4 — Révision systématique
Tout sujet important doit être automatiquement ou manuellement programmé pour révision.

### RG5 — État unique
Chaque sujet doit avoir un état principal unique parmi :
- à faire ;
- en cours ;
- à réviser ;
- validé ;
- bloqué.

### RG6 — Cohérence de progression
Un projet ne peut être avancé que si les sujets requis ont été validés.

### RG7 — Discipline du plan
Le système doit mettre en évidence les écarts entre le plan prévu et l’exécution réelle.

---

## 8. Parcours utilisateur attendu

### 8.1 Avant la séance
L’utilisateur consulte la plateforme pour :
- identifier le sujet du jour ;
- vérifier les prérequis ;
- visualiser les révisions dues ;
- connaître l’objectif de la séance.

### 8.2 Pendant la séance
L’utilisateur :
- enregistre les actions réalisées ;
- note les difficultés ;
- ajoute des observations ;
- sauvegarde les résultats partiels.

### 8.3 Après la séance
L’utilisateur :
- clôture la séance ;
- met à jour l’état du sujet ;
- enregistre une validation ou un blocage ;
- génère les révisions futures.

---

## 9. Données à gérer

La plateforme doit gérer au minimum les objets suivants :

- domaine ;
- sous-domaine ;
- sujet ;
- prérequis ;
- séance ;
- validation ;
- révision ;
- projet ;
- notification ;
- journal d’activité.

---

## 10. Exigences de consultation

La plateforme doit permettre de filtrer et consulter :
- les sujets par domaine ;
- les sujets par état ;
- les révisions à venir ;
- les séances passées ;
- les projets en cours ;
- les validations effectuées ;
- les blocages actifs.

---

## 11. Exigences de suivi

La plateforme doit conserver un historique consultable de :
- toutes les séances ;
- toutes les validations ;
- toutes les révisions ;
- tous les changements d’état ;
- toutes les corrections apportées.

---

## 12. Exigences de simplicité

La première version doit être simple, lisible et rapide à utiliser.

Elle doit éviter :
- la surcharge visuelle ;
- les fonctions inutiles ;
- les écrans trop complexes ;
- les interactions trop longues.

L’objectif est de soutenir l’apprentissage, pas de le ralentir.

---

## 13. Exigences techniques fonctionnelles

La plateforme doit fonctionner en priorité en mode local.

Elle doit permettre :
- un usage hors ligne ou réseau local ;
- une base de données locale ;
- une interface web simple ;
- une évolution progressive vers des fonctionnalités plus avancées.

---

## 14. Priorité de réalisation

L’ordre de réalisation fonctionnelle recommandé est le suivant :

1. structure des domaines et sujets ;
2. gestion des prérequis ;
3. enregistrement des séances ;
4. validation ;
5. révision ;
6. tableau de bord ;
7. notifications ;
8. projets ;
9. historique ;
10. amélioration de l’ergonomie.

---

## 15. Critères d’acceptation

La plateforme sera considérée comme fonctionnelle si elle permet de :
- structurer le parcours d’apprentissage ;
- suivre les séances ;
- valider les acquis ;
- programmer les révisions ;
- visualiser la progression ;
- enregistrer l’historique ;
- éviter la dispersion.

---

## 16. Livrables attendus

Les livrables attendus sont :
- un modèle fonctionnel de la plateforme ;
- un schéma de données ;
- une architecture technique cible ;
- une structure de dossiers ;
- une première version MVP ;
- une feuille de route de développement.

---

## 17. Conclusion

Ce cahier des charges fonctionnel définit le socle de la future plateforme de pilotage de l’apprentissage. La priorité est de produire un outil utile, simple, disciplinant et extensible, capable d’accompagner un apprentissage rigoureux dans la durée.

