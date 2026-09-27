# Vision d’ensemble et objectifs du projet

## 1. Le projet en une phrase

Psycho-Pass est une plateforme web qui permet à des utilisateurs de passer des tests, de répondre à des questions, de recevoir un score calculé de manière fiable, et à des administrateurs de gérer le contenu.

## 2. Ce que le projet doit résoudre

Le projet doit permettre :
- de créer un compte ;
- de se connecter ;
- de lancer un test ;
- de répondre à des questions ;
- de calculer un score ;
- de consulter un résultat ;
- de conserver l’historique ;
- d’administrer le contenu.

## 3. Pourquoi l’architecture doit être stricte

Un test, un score et un historique sont des données sensibles.
Si le frontend calcule tout seul, un utilisateur pourrait tricher ou obtenir un résultat incohérent.

C’est pour cela que :
- l’interface ne décide pas ;
- le backend contrôle ;
- la base de données persiste ;
- les tests sécurisent ;
- la CI empêche les régressions.

## 4. Les grands blocs du système

### Frontend
Le frontend est l’interface utilisateur.
Il sert à guider, afficher et collecter des actions.

### Backend
Le backend applique la logique métier.
C’est lui qui vérifie, calcule, protège et orchestre.

### Base de données
La base stocke les informations de manière durable.

### Outillage
L’outillage comprend :
- linter ;
- formatter ;
- tests ;
- hooks Git ;
- pipeline CI ;
- Docker ;
- Dev Container.

## 5. Le MVP

Le MVP est la première version utile.

Pour Psycho-Pass, le MVP comprend :
- auth ;
- gestion des utilisateurs ;
- test de base ;
- gestion des questions ;
- calcul du score ;
- historique ;
- administration minimale ;
- qualité minimale ;
- déploiement reproductible.

## 6. Ce qui n’est pas le MVP

Au début, il ne faut pas se disperser.
On évite :
- l’intelligence artificielle complexe ;
- les dashboards trop avancés ;
- les animations excessives ;
- les microservices inutiles ;
- les optimisations prématurées ;
- les surcouches techniques sans besoin réel.

## 7. Bonne pratique de pensée produit

Quand tu ajoutes une fonctionnalité, pose toujours ces questions :
- est-ce utile au MVP ?
- qui en a besoin ?
- où la logique doit-elle vivre ?
- faut-il la tester ?
- faut-il la documenter ?
- faut-il l’auditer ?

## 8. Cycle de vie d’une fonctionnalité

Une fonctionnalité passe par ces étapes :
1. besoin ;
2. cadrage ;
3. schéma de données ;
4. endpoint ;
5. logique métier ;
6. interface ;
7. test ;
8. revue ;
9. livraison.

## 9. Ce qu’un junior doit comprendre

Un junior ne doit pas juste “faire marcher” le code.
Il doit comprendre :
- pourquoi une décision existe ;
- où mettre le code ;
- comment éviter les erreurs ;
- comment vérifier son travail ;
- comment livrer proprement.

## 10. Résumé opérationnel

Le projet est simple dans sa logique mais exigeant dans son exécution :

- le backend est la vérité ;
- le frontend est l’expérience ;
- la base est la mémoire ;
- les tests sont le filet de sécurité ;
- la CI est le garde-fou ;
- la documentation est la mémoire de l’équipe.
