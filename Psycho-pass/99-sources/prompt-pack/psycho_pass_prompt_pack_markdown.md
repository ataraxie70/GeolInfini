# Psycho-Pass — Pack de Prompts Stricts

## Objectif du document

Ce document sert de base opérationnelle pour démarrer le développement du projet Psycho-Pass dans le Dev Container sans ambiguïté.

Le pack est conçu pour :

- cadrer les décisions techniques ;
- éviter les dérives d’architecture ;
- accélérer le développement ;
- maintenir une cohérence backend/frontend ;
- faciliter le travail d’équipe ;
- produire un MVP robuste avant toute optimisation.

---

# Ordre de développement recommandé

Le projet doit être développé dans cet ordre exact :

1. Infrastructure & Monorepo
2. Base de données & Prisma
3. Authentification & Utilisateurs
4. Moteur métier du test
5. Frontend MVP
6. Administration minimale
7. Tests, CI/CD et qualité

Ne pas inverser cet ordre.

---

# Sprint 0 — Infrastructure & Dev Container

## Objectif

Rendre le projet immédiatement exécutable dans le Dev Container.

## Prompt

```text
Tu es un assistant de développement senior. Tu travailles sur le projet Psycho-Pass.

Contraintes non négociables :
- TypeScript partout.
- Frontend : Next.js.
- Backend : NestJS.
- Base de données : PostgreSQL.
- ORM : Prisma.
- Styling : Tailwind CSS.
- UI : shadcn/ui ou équivalent validé.
- Validation : Zod et/ou class-validator.
- Tests : Vitest/Jest + Playwright.
- Qualité : ESLint, Prettier, Husky, lint-staged.
- API : REST JSON versionnée sous /api/v1.
- Le frontend affiche, le backend décide.
- Aucun calcul critique côté client.
- Aucune donnée sensible dans le frontend si elle doit rester serveur.

Ta première tâche :
1. Proposer l’arborescence complète du dépôt.
2. Définir les commandes de démarrage, test, lint, format, migration, seed.
3. Décrire les variables d’environnement nécessaires.
4. Identifier les fichiers à créer en premier pour rendre le Dev Container opérationnel.
5. Configurer Docker/Dev Container.
6. Configurer les scripts package.json.
7. Configurer ESLint, Prettier et Husky.
8. Configurer Prisma et PostgreSQL.
9. Ne pas écrire de logique métier applicative.

Format de réponse attendu :
- arborescence
- fichiers à créer
- scripts
- variables d’environnement
- ordre d’exécution
- points de vigilance
```

## Critères de validation

- Le projet démarre avec une seule commande.
- Le Dev Container fonctionne.
- Le backend répond.
- Le frontend démarre.
- Prisma se connecte.
- Les scripts lint/test/build fonctionnent.
- Aucun code métier n’est encore présent.

---

# Sprint 1 — Base de données & Prisma

## Objectif

Créer le socle de données du MVP.

## Prompt

```text
Construis le modèle de données initial du projet Psycho-Pass.

Contraintes :
- Prisma + PostgreSQL.
- Nommage SQL en snake_case.
- Tables au pluriel.
- UUID partout.
- Soft delete si pertinent.
- Timestamps standards.
- Prévoir les relations et l’historique.

Le modèle doit permettre :
- authentification ;
- rôles ;
- utilisateurs ;
- catégories ;
- tests ;
- questions ;
- réponses possibles ;
- sessions de test ;
- réponses utilisateur ;
- scoring ;
- historique ;
- audit minimal.

À produire :
1. Le schéma Prisma complet.
2. Les relations.
3. Les contraintes.
4. Les index.
5. Les migrations.
6. Les données de seed.
7. Les champs sensibles.
8. Les choix techniques importants.

Interdictions :
- Pas de simplification qui casse l’historique.
- Pas de logique métier dans Prisma.
```

## Critères de validation

- Les migrations passent.
- Le seed fonctionne.
- Les relations sont cohérentes.
- Les modèles couvrent le MVP.
- Aucun champ critique ne manque.

---

# Sprint 2 — Authentification & Utilisateurs

## Objectif

Mettre en place un socle sécurisé.

## Prompt

```text
Implémente le socle Auth + Users du projet Psycho-Pass.

Contraintes :
- NestJS.
- REST versionnée.
- JWT signés et expirables.
- Refresh token.
- Hash sécurisé des mots de passe.
- Validation stricte.
- RBAC minimal : user/admin.
- Guards NestJS.
- DTOs stricts.
- Gestion propre des erreurs.

Endpoints minimum :
- register
- login
- refresh
- logout
- me
- update profile

À produire :
1. Modules NestJS.
2. DTOs.
3. Guards.
4. Stratégies.
5. Services.
6. Contrôleurs.
7. Tests unitaires.
8. Gestion des erreurs.
9. Documentation API minimale.

Interdictions :
- Pas de logique d’auth dans le frontend.
- Pas de mot de passe en clair.
- Pas de bypass de rôle.
```

## Critères de validation

- Auth complète fonctionnelle.
- RBAC fonctionnel.
- Tokens valides.
- Refresh opérationnel.
- Routes protégées.
- Tests passent.

---

# Sprint 3 — Moteur métier Psycho-Pass

## Objectif

Créer le cœur fonctionnel du produit.

## Prompt

```text
Implémente le cœur métier du MVP Psycho-Pass.

Fonctions à couvrir :
- démarrer un test ;
- charger les questions ;
- enregistrer une réponse ;
- gérer le temps ;
- terminer une session ;
- corriger automatiquement ;
- calculer score global et score par catégorie ;
- enregistrer l’historique ;
- exposer les résultats.

Contraintes :
- Le backend décide.
- Le score est calculé uniquement côté serveur.
- Les réponses doivent être validées.
- Les sessions doivent être traçables.
- Les résultats doivent être persistés.
- Les endpoints doivent être REST et versionnés.

À produire :
1. Services NestJS.
2. Endpoints REST.
3. DTOs.
4. Validation.
5. Règles métier.
6. Calcul du score.
7. Historique.
8. Tests unitaires.
9. Cas limites.

Interdictions :
- Pas de calcul critique dans le frontend.
- Pas de logique métier dupliquée.
```

## Critères de validation

- Un utilisateur peut passer un test.
- Les réponses sont enregistrées.
- Le score est correct.
- L’historique fonctionne.
- Les cas d’erreur sont gérés.

---

# Sprint 4 — Frontend MVP

## Objectif

Construire une interface exploitable rapidement.

## Prompt

```text
Construis le frontend MVP du projet Psycho-Pass.

Contraintes :
- Next.js + TypeScript.
- Tailwind CSS.
- UI simple et lisible.
- Accessibilité minimale.
- Composants réutilisables.
- Respect strict du contrat API.
- Gestion propre des états de chargement et erreurs.

Pages minimum :
- accueil
- connexion
- inscription
- dashboard
- liste des tests
- passation de test
- résultats
- historique

À produire :
1. Architecture frontend.
2. Layouts.
3. Composants.
4. Hooks/services API.
5. Gestion d’état.
6. Protection des routes.
7. Gestion auth côté client.
8. Pages MVP.

Interdictions :
- Pas de logique métier critique.
- Pas de score calculé côté client.
- Pas de dépendances inutiles.
```

## Critères de validation

- Navigation fluide.
- Auth frontend opérationnelle.
- Appels API stables.
- Écrans MVP terminés.
- UX cohérente.

---

# Sprint 5 — Administration minimale

## Objectif

Permettre la gestion du contenu.

## Prompt

```text
Implémente l’administration minimale du projet Psycho-Pass.

Fonctions :
- gestion des catégories ;
- gestion des tests ;
- gestion des questions ;
- gestion des réponses possibles ;
- consultation des résultats.

Contraintes :
- accès admin uniquement ;
- validation stricte ;
- audit des actions sensibles ;
- API REST claire.

À produire :
1. Endpoints admin.
2. Pages admin.
3. Formulaires CRUD.
4. Permissions.
5. Audit minimal.
6. Tests de sécurité.

Interdictions :
- Pas de fonctionnalités hors MVP.
- Pas de bypass RBAC.
```

## Critères de validation

- CRUD fonctionnel.
- Permissions respectées.
- Historique admin minimal.
- Backend sécurisé.

---

# Sprint 6 — Qualité, Tests et CI/CD

## Objectif

Industrialiser le projet.

## Prompt

```text
Mets en place l’outillage qualité du projet Psycho-Pass.

Objectifs :
- lint ;
- format ;
- tests unitaires ;
- tests d’intégration ;
- tests E2E ;
- hooks Git ;
- pipeline CI/CD.

Contraintes :
- tout doit fonctionner dans le Dev Container ;
- les scripts doivent être reproductibles ;
- la CI doit bloquer les régressions ;
- les tests doivent couvrir les zones critiques.

À produire :
1. Scripts package.json.
2. Config lint/format.
3. Husky.
4. lint-staged.
5. Pipeline CI.
6. Setup Playwright.
7. Stratégie de tests.
8. Documentation développeur.

Interdictions :
- Pas d’outillage inutile.
- Pas de pipeline fragile.
```

## Critères de validation

- CI passe.
- Tests exécutables.
- Hooks Git fonctionnels.
- Build stable.
- Déploiement prêt.

---

# Règles globales du projet

## Backend

- Toute logique métier critique doit vivre dans le backend.
- Tous les inputs doivent être validés.
- Les erreurs doivent être standardisées.
- Les routes doivent être versionnées.
- Les services doivent être découplés.
- Les secrets ne doivent jamais être commités.

## Frontend

- Le frontend ne décide pas.
- Aucun score critique calculé localement.
- Les appels API doivent être centralisés.
- Les composants doivent être réutilisables.
- Les états loading/error doivent être gérés.

## Base de données

- UUID partout.
- Relations explicites.
- Migrations obligatoires.
- Pas de modification manuelle de schéma en production.

## Git

Branches recommandées :

- main
- develop
- feature/*
- fix/*
- hotfix/*

Commits recommandés :

- feat:
- fix:
- refactor:
- docs:
- test:
- chore:

---

# Checklist de démarrage équipe

## Avant de coder

- Lire le README.
- Lire les RFC.
- Démarrer le Dev Container.
- Vérifier les variables d’environnement.
- Vérifier Prisma.
- Vérifier les scripts.

## Avant chaque PR

- lint OK
- tests OK
- build OK
- migrations vérifiées
- pas de secret commité
- review personnelle effectuée

---

# Définition du MVP

Le MVP est considéré terminé lorsque :

- un utilisateur peut créer un compte ;
- un utilisateur peut se connecter ;
- un utilisateur peut passer un test ;
- les réponses sont enregistrées ;
- le score est calculé côté backend ;
- l’historique fonctionne ;
- un admin peut gérer les questions ;
- les tests critiques existent ;
- la CI fonctionne.

---

# Interdictions globales

- Pas de logique métier critique côté frontend.
- Pas de bypass sécurité.
- Pas de dépendances inutiles.
- Pas de TODO permanents.
- Pas de endpoints non versionnés.
- Pas de secrets dans Git.
- Pas de code mort.
- Pas de duplication massive.

---

# Résultat attendu

À la fin de ces sprints, l’équipe doit disposer :

- d’un backend NestJS propre ;
- d’un frontend Next.js stable ;
- d’un moteur de test fonctionnel ;
- d’une administration minimale ;
- d’une base de données robuste ;
- d’une CI exploitable ;
- d’un projet maintenable.

