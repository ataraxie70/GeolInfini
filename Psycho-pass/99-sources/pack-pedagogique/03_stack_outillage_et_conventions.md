# Stack, outillage et conventions

## 1. Stack retenue

Le projet repose sur cette stack principale :

- **Frontend** : Next.js + TypeScript
- **Backend** : NestJS + TypeScript
- **Base de données** : PostgreSQL
- **ORM** : Prisma
- **Styling** : Tailwind CSS
- **UI** : shadcn/ui ou composants équivalents validés
- **Validation** : Zod et/ou class-validator
- **Tests** : Vitest/Jest + Playwright
- **Qualité** : ESLint, Prettier, Husky, lint-staged
- **Environnement** : Docker + Dev Container
- **API** : REST JSON versionnée

## 2. Pourquoi cette stack

### Next.js
Permet de construire rapidement une interface moderne avec routing, rendu serveur possible, et intégration TypeScript.

### NestJS
Apporte une architecture structurée pour le backend, avec controllers, services, modules, guards et validation.

### PostgreSQL
Base relationnelle robuste, adaptée aux relations entre utilisateurs, tests, réponses et scores.

### Prisma
Simplifie l’accès à la base de données et rend le schéma lisible.

### Tailwind CSS
Permet d’aller vite sur l’interface avec des classes utilitaires cohérentes.

### shadcn/ui
Fournit une base de composants propre et moderne pour construire vite sans réinventer chaque bouton.

### ESLint et Prettier
Garantissent une qualité de code lisible et uniforme.

### Husky et lint-staged
Empêchent d’envoyer du code non conforme dans Git.

### Playwright
Permet de tester le parcours utilisateur de bout en bout.

## 3. Ce que fait chaque outil

### TypeScript
Ajoute du typage au JavaScript pour réduire les erreurs.

### Docker
Permet d’exécuter le projet dans un environnement contrôlé.

### Dev Container
Fournit un environnement identique à tous les développeurs.

### Prisma
Gère le schéma, les migrations et l’accès aux données.

### NestJS
Structure la logique backend.

### Next.js
Structure la partie frontend.

## 4. Conventions globales de code

### Nommage
- variables et fonctions : `camelCase`
- classes : `PascalCase`
- fichiers : cohérents et explicites
- dossiers : explicites, sans abréviations obscures

### Organisation
- un fichier = une responsabilité claire
- un module = un domaine métier logique
- un service = une logique métier
- un controller = un point d’entrée HTTP
- un composant = une pièce d’UI réutilisable

### Comportement
- pas de logique cachée ;
- pas de duplication inutile ;
- pas de code magique ;
- pas de “quick fix” sans suivi.

## 5. Conventions API

L’API doit être :
- versionnée ;
- cohérente ;
- orientée ressources ;
- simple à lire ;
- documentable ;
- stable.

Base commune :
`/api/v1`

Exemples :
- `GET /api/v1/tests`
- `POST /api/v1/auth/login`
- `POST /api/v1/sessions/:id/answers`

## 6. Conventions Git

Branches recommandées :
- `main`
- `develop`
- `feature/*`
- `fix/*`
- `hotfix/*`

Commits recommandés :
- `feat:`
- `fix:`
- `refactor:`
- `test:`
- `docs:`
- `chore:`

## 7. Conventions de revue de code

Avant de valider une PR, vérifier :
- le code est lisible ;
- les tests passent ;
- la logique est au bon endroit ;
- la sécurité n’est pas affaiblie ;
- le code suit les conventions ;
- le besoin est couvert sans surconception.

## 8. Ce qu’un junior doit retenir

Si tu débutes, ne cherche pas à tout inventer.
Retiens ce cadre simple :

- TypeScript pour la fiabilité ;
- Next.js pour le frontend ;
- NestJS pour le backend ;
- PostgreSQL pour la persistance ;
- Prisma pour l’accès aux données ;
- Tailwind pour le style ;
- tests pour la confiance ;
- CI pour la discipline ;
- conventions pour l’équipe.
