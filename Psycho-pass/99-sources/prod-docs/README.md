# Psycho-Pass

Plateforme web d’évaluation psychotechnique et de culture générale.

Ce dépôt sert de base technique au projet. La documentation fonctionnelle, technique et normative est déjà posée dans :
- `cdc/` : cahier des charges et documentation de cadrage ;
- `rfc/` : décisions d’architecture et de stack ;
- `must/` : règles obligatoires de développement ;
- `backlog/` : backlog technique initial du MVP ;
- `process/` : déroulement sécurisé du développement et checkpoints de validation.

En cas de conflit documentaire, l’ordre de priorité est :
1. `must/`
2. `rfc/`
3. `backlog/`
4. `cdc/`
5. `prompt-pack/`

## Démarrage attendu dans le Dev Container

Le Dev Container est l’environnement de référence de l’équipe. Il doit permettre à chaque contributeur de démarrer avec les mêmes versions d’outils, les mêmes règles et le même niveau de qualité.

Au moment où le code applicatif sera initialisé, l’environnement devra fournir au minimum :
- TypeScript partout ;
- Next.js pour le frontend ;
- NestJS pour le backend ;
- PostgreSQL comme base de données ;
- Prisma pour l’accès aux données et les migrations ;
- Tailwind CSS pour le styling ;
- shadcn/ui ou équivalent validé ;
- Zod et/ou class-validator pour la validation ;
- Vitest/Jest pour les tests ;
- Playwright pour l’E2E ;
- ESLint, Prettier, Husky et lint-staged pour la qualité de code.

## Règles de lecture du projet

La règle métier est simple :

> **Le frontend affiche, le backend décide.**

Conséquences :
- le frontend ne recalcule pas les scores critiques ;
- la difficulté, le scoring et les permissions sont décidés côté serveur ;
- les données sensibles ne doivent jamais être confiées à la logique client seule.

## Périmètre MVP

Le MVP doit permettre :
- création de compte et connexion ;
- passage de tests psychotechniques et de culture générale ;
- chronométrage ;
- correction automatique ;
- score global et score par catégorie ;
- historique des résultats ;
- tableau de bord utilisateur ;
- administration minimale des questions, catégories et résultats ;
- API REST versionnée.

Fonctionnalités hors MVP :
- IA avancée ;
- recommandations complexes ;
- multijoueur ;
- concours ;
- application mobile native ;
- analytics temps réel avancés ;
- gamification poussée.

## Architecture cible

La cible validée par la documentation est la suivante :

```text
Frontend  -> Next.js / React / TypeScript
Backend   -> NestJS / TypeScript
Database  -> PostgreSQL
ORM       -> Prisma
API       -> REST JSON /api/v1
```

Composants complémentaires recommandés :
- Redis pour le cache, le rate limiting et les traitements asynchrones ;
- BullMQ pour les files de traitement ;
- Sentry pour l’observabilité ;
- GitHub Actions pour la CI/CD.

## Structure de travail recommandée

L’organisation fonctionnelle du code doit rester lisible et séparée par domaines.

Structure cible conseillée :

```text
src/
├── app/ ou pages/
├── components/
├── features/
├── hooks/
├── lib/
├── services/
├── stores/
├── types/
└── utils/
```

Pour le backend :

```text
src/
├── auth/
├── users/
├── questions/
├── tests/
├── adaptive-engine/
├── scoring/
├── results/
├── admin/
├── analytics/
├── common/
├── config/
└── database/
```

## Conventions obligatoires

### Nommage
- fichiers en `kebab-case` ;
- composants React en `PascalCase` ;
- variables et fonctions en `camelCase` ;
- tables PostgreSQL au pluriel ;
- colonnes SQL en `snake_case`.

### Git
Branches recommandées :
- `main`
- `dev`
- `feature/...`
- `fix/...`
- `chore/...`
- `hotfix/...`

Commits recommandés :
- `feat: ajout du moteur adaptatif`
- `fix: correction du calcul de score`
- `docs: mise à jour du RFC`
- `refactor: simplification du service de test`

### Qualité
- TypeScript strict autant que possible ;
- pas de `any` sans justification ;
- fonctions courtes et à responsabilité unique ;
- code testé sur les zones critiques ;
- formatage et lint obligatoires avant fusion.

## Sécurité minimale

Les exigences non négociables sont les suivantes :
- mots de passe jamais stockés en clair ;
- jetons signés et expirables ;
- contrôle des droits côté backend ;
- validation des entrées côté serveur ;
- secrets uniquement via variables d’environnement ;
- logs sans secrets ;
- aucune donnée critique exposée inutilement au frontend.

## API de référence

Base commune :

```text
/api/v1/
```

Exemples d’endpoints de départ :
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/auth/refresh`
- `GET /api/v1/users/me`
- `GET /api/v1/tests`
- `POST /api/v1/tests/start`
- `POST /api/v1/tests/:id/answer`
- `POST /api/v1/tests/:id/finish`
- `GET /api/v1/results/:id`

## Variables d’environnement à prévoir

Le dépôt n’étant pas encore scaffoldé, les noms exacts pourront être alignés avec l’implémentation, mais les besoins minimaux sont :

- connexion à la base PostgreSQL ;
- secrets JWT ;
- configuration du backend ;
- configuration du frontend ;
- URL de l’API ;
- éventuelles intégrations CI/CD et monitoring.

Un fichier `.env.example` doit être maintenu dès que le squelette applicatif existe.

## Démarrage local dans le Dev Container

1. Ouvrir le dossier du projet dans le Dev Container.
2. Vérifier que les versions des outils sont celles attendues par l’image.
3. Installer les dépendances une fois le squelette applicatif créé.
4. Renseigner les variables d’environnement locales.
5. Lancer la base de données et les migrations.
6. Démarrer le backend puis le frontend.
7. Vérifier les tests et le lint avant toute PR.

## Ordre de travail conseillé

Pour éviter les ambiguïtés, l’équipe peut suivre cet ordre :

1. figer la structure du dépôt ;
2. générer le squelette frontend/backend ;
3. brancher PostgreSQL et Prisma ;
4. implémenter auth et utilisateurs ;
5. poser le socle tests/questions/résultats ;
6. intégrer scoring et historique ;
7. ajouter l’admin ;
8. renforcer la qualité, la sécurité et l’observabilité.

## Références internes

Avant toute modification structurante, consulter :
- `rfc/RFC-001 — Vision Technique et Architecture Globale.md`
- `rfc/psycho_pass_rfc_002_stack_complete.md`
- `rfc/psycho_pass_rfc_003_backend_core_engine.md`
- `rfc/psycho_pass_rfc_004_frontend_architecture_design_system.md`
- `rfc/psycho_pass_rfc_005_api_procedure_devcontainer.md`
- `must/psycho_pass_must_001_conventions_developpement.md`
- `must/psycho_pass_must_002_securite_qualite.md`

## Règle de fond

Quand une décision n’est pas explicitement écrite dans la documentation, elle ne doit pas être devinée. Elle doit être tranchée dans un RFC avant implémentation.
