# Lexique du projet Psycho-Pass

Ce fichier explique les mots que tu vas voir tout le temps dans le projet.

## 1. Architecture

L’architecture, c’est l’organisation globale du système.
Elle répond à la question : **qui fait quoi ?**

Exemple :
- le frontend affiche les écrans ;
- le backend applique les règles ;
- la base de données stocke les données ;
- la CI vérifie que tout fonctionne ;
- le Dev Container fournit l’environnement de travail.

## 2. Frontend

Le frontend est la partie visible par l’utilisateur.
Dans ce projet, il est construit avec Next.js.

Il gère :
- les pages ;
- les formulaires ;
- les boutons ;
- la navigation ;
- l’affichage des erreurs ;
- l’expérience utilisateur.

Il ne doit pas décider de la logique critique.

## 3. Backend

Le backend est la partie serveur.
Dans ce projet, il est construit avec NestJS.

Il gère :
- l’authentification ;
- les règles métier ;
- les permissions ;
- les calculs de score ;
- la persistance des données ;
- les réponses de l’API.

## 4. Base de données

La base de données est l’endroit où les informations sont enregistrées de manière durable.
Dans ce projet, on utilise PostgreSQL avec Prisma.

Elle contient par exemple :
- les utilisateurs ;
- les sessions de test ;
- les réponses ;
- les scores ;
- les catégories ;
- l’historique.

## 5. API

API signifie **Application Programming Interface**.
C’est le contrat entre le frontend et le backend.

Dans le projet :
- le backend expose des endpoints ;
- le frontend appelle ces endpoints ;
- les données échangées sont au format JSON.

Exemple :
- `GET /api/v1/tests`
- `POST /api/v1/auth/login`

## 6. Endpoint

Un endpoint est une URL d’API précise.
Chaque endpoint a une fonction précise.

Exemple :
- récupérer une liste ;
- créer une ressource ;
- démarrer une session ;
- soumettre une réponse.

## 7. DTO

DTO signifie **Data Transfer Object**.
C’est la forme de données utilisée pour envoyer ou recevoir des informations.

Un DTO sert à :
- valider l’entrée ;
- limiter les champs acceptés ;
- clarifier le contrat d’API.

## 8. Service

Un service contient la logique métier.
Dans NestJS, c’est souvent lui qui fait le travail principal.

Exemple :
- calculer un score ;
- vérifier un mot de passe ;
- créer une session ;
- enregistrer une réponse.

## 9. Controller

Le controller reçoit la requête HTTP et appelle le service.
Il ne doit pas contenir trop de logique métier.

Règle simple :
- le controller reçoit ;
- le service décide ;
- le repository ou Prisma persiste.

## 10. ORM

ORM signifie **Object-Relational Mapping**.
C’est un outil qui permet de manipuler la base de données avec du code plutôt qu’avec du SQL brut partout.

Dans ce projet, l’ORM est Prisma.

## 11. Migration

Une migration est une évolution versionnée du schéma de base de données.
Elle sert à :
- créer une table ;
- modifier une colonne ;
- ajouter un index ;
- supprimer proprement une structure.

## 12. Seed

Le seed est un jeu de données initiales.
Il sert à remplir la base avec des données utiles pour développer ou tester.

Exemple :
- un compte admin ;
- quelques catégories ;
- quelques questions de départ.

## 13. RBAC

RBAC signifie **Role-Based Access Control**.
C’est la gestion des droits par rôle.

Exemple :
- user ;
- admin.

Le rôle détermine ce que l’utilisateur a le droit de faire.

## 14. JWT

JWT signifie **JSON Web Token**.
C’est un jeton signé utilisé pour authentifier un utilisateur.

Il permet de prouver qu’un utilisateur est connecté sans renvoyer son mot de passe à chaque requête.

## 15. Refresh token

Le refresh token permet de renouveler la session utilisateur sans redemander une connexion complète trop souvent.

## 16. Guard

Un guard est un mécanisme de protection côté backend.
Il vérifie si la requête a le droit d’accéder à une route.

## 17. Validation

La validation consiste à vérifier qu’une donnée reçue est correcte avant de l’utiliser.

Exemples :
- le format d’un email ;
- la longueur d’un mot de passe ;
- la présence d’un champ obligatoire.

## 18. Score critique

Un score critique est une information importante qui ne doit pas être recalculée au hasard côté client.
Dans ce projet, les scores doivent être calculés côté backend.

## 19. MVP

MVP signifie **Minimum Viable Product**.
C’est la première version utile du produit, avec le minimum de fonctions nécessaires.

## 20. Dev Container

Le Dev Container est un environnement de développement isolé.
Il permet à toute l’équipe d’avoir la même base technique.

## 21. CI/CD

CI/CD signifie :
- **CI** = Continuous Integration ;
- **CD** = Continuous Delivery / Deployment.

La CI vérifie le code automatiquement.
Le CD prépare ou exécute le déploiement.

## 22. Test unitaire

Un test unitaire vérifie une petite partie du code en isolation.

## 23. Test d’intégration

Un test d’intégration vérifie que plusieurs briques fonctionnent ensemble.

## 24. Test E2E

E2E signifie **End to End**.
Le test simule un vrai utilisateur du début à la fin.

## 25. Convention

Une convention est une règle de forme ou d’organisation que toute l’équipe suit pour rester cohérente.

## 26. Refactor

Refactoriser signifie réorganiser le code sans changer son comportement visible.

## 27. Dette technique

La dette technique, c’est le coût futur d’une solution trop rapide ou mal structurée.

## 28. Source of truth

La source of truth est l’endroit qui fait foi.
Dans ce projet :
- le backend est la source de vérité métier ;
- la base est la source de vérité persistée.

## 29. Versionnage d’API

Le versionnage d’API permet de faire évoluer l’API sans casser les anciens clients.

Exemple :
- `/api/v1`
- plus tard `/api/v2`

## 30. Audit

L’audit consiste à garder une trace de certaines actions sensibles.

Exemple :
- modification d’un rôle ;
- suppression d’une question ;
- changement d’un score.

## Résumé à retenir

Si tu débutes, retiens cette phrase :

**le frontend montre, le backend décide, la base mémorise.**
