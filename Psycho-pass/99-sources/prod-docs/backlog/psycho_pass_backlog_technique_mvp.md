# BACKLOG TECHNIQUE MVP — Psycho-Pass
## Version : 1.0
## Statut : Initial
## Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit le backlog technique MVP (Minimum Viable Product) de Psycho-Pass.

Il sert à :
- structurer le démarrage du développement ;
- organiser les priorités techniques ;
- définir les premiers livrables ;
- planifier les modules essentiels ;
- cadrer les premières itérations du projet.

Le MVP doit permettre de disposer d’une première version fonctionnelle, stable et exploitable de la plateforme.

---

# 2. OBJECTIFS DU MVP

Le MVP doit permettre à un utilisateur de :
- créer un compte ;
- se connecter ;
- choisir un test ;
- passer un test psychotechnique ou de culture générale ;
- recevoir un score ;
- consulter ses résultats ;
- suivre sa progression.

Le MVP doit également permettre à un administrateur de :
- gérer les questions ;
- gérer les catégories ;
- superviser les résultats ;
- administrer la plateforme.

---

# 3. PÉRIMÈTRE DU MVP

## Inclus dans le MVP
- authentification ;
- gestion utilisateur ;
- moteur de test de base ;
- scoring ;
- historique des résultats ;
- tableau de bord ;
- administration minimale ;
- API REST ;
- frontend responsive ;
- environnement Dev Container.

## Exclus du MVP
- IA avancée ;
- recommandations intelligentes complexes ;
- mode multijoueur ;
- mode concours ;
- application mobile native ;
- moteur adaptatif avancé ;
- analytics temps réel complexes ;
- gamification poussée.

---

# 4. ORGANISATION DU BACKLOG

Le backlog est organisé par :
- EPIC ;
- modules ;
- priorité ;
- dépendances ;
- livrables.

Priorités :
- P0 = critique
- P1 = important
- P2 = amélioration
- P3 = futur

---

# 5. EPIC-001 — INITIALISATION DU PROJET

## Priorité
P0

## Objectif
Créer la base technique du projet.

## Tâches

### Infrastructure projet
- Initialisation du monorepo ou structure principale
- Configuration TypeScript
- Configuration lint
- Configuration formatage
- Configuration Git
- Configuration branches
- Création README principal

### Dev Container
- Création du Dev Container
- Installation Node.js
- Configuration outils CLI
- Configuration environnement frontend
- Configuration environnement backend
- Configuration scripts startup

### CI/CD initial
- Build automatique
- Vérification lint
- Vérification tests
- Pipeline initial

## Livrables
- Projet démarrable
- Environnement reproductible
- CI minimale opérationnelle

---

# 6. EPIC-002 — AUTHENTIFICATION ET UTILISATEURS

## Priorité
P0

## Objectif
Permettre la gestion sécurisée des comptes utilisateurs.

## Modules
- Auth
- Users
- Sessions

## Tâches backend
- Création module auth
- Création entité utilisateur
- Hashage mot de passe
- JWT access token
- Refresh token
- Login
- Register
- Logout
- Forgot password
- Reset password
- Guards de sécurité
- Gestion rôles

## Tâches frontend
- Page login
- Page register
- Formulaires validation
- Gestion session
- Gestion token
- Protection routes
- Profil utilisateur

## API
- POST /api/v1/auth/register
- POST /api/v1/auth/login
- POST /api/v1/auth/logout
- GET /api/v1/users/me

## Livrables
- Système d’authentification complet
- Gestion session fonctionnelle
- Protection des routes

---

# 7. EPIC-003 — GESTION DES QUESTIONS

## Priorité
P0

## Objectif
Créer le système de gestion des questions et catégories.

## Modules
- Questions
- Categories
- Admin questions

## Tâches backend
- Entité Question
- Entité Category
- CRUD questions
- CRUD catégories
- Validation données
- Filtrage questions
- Gestion difficulté
- Gestion type de question

## Tâches frontend
- Interface admin questions
- Création question
- Modification question
- Suppression question
- Filtrage
- Recherche

## Types de questions MVP
- QCM
- Vrai/Faux
- Réponse simple

## Livrables
- Gestion complète des questions
- Administration fonctionnelle

---

# 8. EPIC-004 — MOTEUR DE TEST

## Priorité
P0

## Objectif
Permettre l’exécution d’un test utilisateur.

## Modules
- Tests
- Sessions
- Answers

## Tâches backend
- Création session test
- Sélection questions
- Validation réponses
- Sauvegarde réponses
- Gestion timer
- Clôture session
- Calcul score

## Tâches frontend
- Écran de test
- Timer
- Navigation questions
- Soumission réponses
- Progression visuelle
- Fin de test

## Contraintes
- Une session = un utilisateur
- Une réponse liée à une question
- Temps géré proprement

## Livrables
- Test fonctionnel de bout en bout

---

# 9. EPIC-005 — SCORING ET RÉSULTATS

## Priorité
P0

## Objectif
Afficher les résultats et calculer les scores.

## Modules
- Scoring
- Results
- Analytics simples

## Tâches backend
- Calcul score global
- Calcul score catégorie
- Temps moyen
- Historique
- Statistiques simples

## Tâches frontend
- Écran résultats
- Graphiques simples
- Historique utilisateur
- Résumé progression

## Livrables
- Résultats exploitables
- Historique visible

---

# 10. EPIC-006 — TABLEAU DE BORD

## Priorité
P1

## Objectif
Donner une vue claire de l’activité utilisateur.

## Modules
- Dashboard
- User stats

## Tâches frontend
- Dashboard utilisateur
- Résumé progression
- Derniers tests
- Score moyen
- Recommandations simples

## Tâches backend
- API dashboard
- Statistiques utilisateur

## Livrables
- Dashboard utilisateur opérationnel

---

# 11. EPIC-007 — ADMINISTRATION

## Priorité
P1

## Objectif
Créer un panneau d’administration minimal.

## Modules
- Admin
- Moderation
- Monitoring simple

## Tâches backend
- Gestion rôles admin
- API administration
- Logs admin

## Tâches frontend
- Dashboard admin
- Gestion utilisateurs
- Gestion contenu
- Vue statistiques

## Livrables
- Administration minimale exploitable

---

# 12. EPIC-008 — DESIGN SYSTEM ET UI

## Priorité
P1

## Objectif
Créer une interface cohérente et réutilisable.

## Modules
- UI components
- Theme
- Layouts

## Tâches
- Mise en place Tailwind
- Création composants UI
- Layout responsive
- Système de couleurs
- Typographie
- États UI
- Dark mode préparé

## Livrables
- Base UI homogène
- Responsive fonctionnel

---

# 13. EPIC-009 — API ET DOCUMENTATION

## Priorité
P1

## Objectif
Documenter et stabiliser les échanges frontend/backend.

## Tâches
- Swagger/OpenAPI
- Documentation endpoints
- Validation schémas
- Standards réponses
- Gestion erreurs API

## Livrables
- Documentation API exploitable

---

# 14. EPIC-010 — QUALITÉ ET TESTS

## Priorité
P0

## Objectif
Garantir la stabilité minimale du produit.

## Tâches
- Tests unitaires backend
- Tests frontend critiques
- Tests auth
- Tests scoring
- Tests sessions
- Tests API
- Tests E2E principaux

## Outils
- Jest
- Playwright ou équivalent

## Livrables
- Base de tests fonctionnelle

---

# 15. EPIC-011 — BASE DE DONNÉES

## Priorité
P0

## Objectif
Mettre en place le socle de persistance.

## Tâches
- Configuration PostgreSQL
- ORM
- Migrations
- Schéma initial
- Relations principales
- Seeds développement

## Entités principales
- User
- Question
- Category
- TestSession
- Answer
- Result

## Livrables
- Base stable et versionnée

---

# 16. EPIC-012 — OBSERVABILITÉ ET LOGS

## Priorité
P2

## Objectif
Préparer la supervision minimale.

## Tâches
- Logging backend
- Logs erreurs
- Logs admin
- Monitoring simple
- Tracking erreurs frontend

## Livrables
- Logs exploitables

---

# 17. EPIC-013 — DÉPLOIEMENT INITIAL

## Priorité
P1

## Objectif
Préparer le premier environnement de livraison.

## Tâches
- Dockerisation
- Variables environnement
- Build production
- Reverse proxy si nécessaire
- Déploiement staging
- Déploiement production

## Livrables
- Première plateforme déployable

---

# 18. ROADMAP MVP RECOMMANDÉE

## Sprint 1
- Initialisation projet
- Dev Container
- Auth backend
- Auth frontend
- Base PostgreSQL

## Sprint 2
- CRUD questions
- Gestion catégories
- Dashboard minimal
- Design system initial

## Sprint 3
- Moteur de test
- Sessions
- Réponses
- Timer

## Sprint 4
- Scoring
- Résultats
- Historique
- Graphiques simples

## Sprint 5
- Administration
- Tests automatisés
- Stabilisation
- Préparation déploiement

---

# 19. DÉPENDANCES CRITIQUES

## Backend
- NestJS
- PostgreSQL
- Prisma
- JWT

## Frontend
- Next.js
- React
- Tailwind
- shadcn/ui

## Infra
- Docker
- Dev Container
- GitHub Actions ou équivalent

---

# 20. RISQUES TECHNIQUES INITIAUX

## Risques
- Complexité moteur adaptatif futur
- Gestion temps réel
- Performance scoring
- Croissance base questions
- Cohérence frontend/backend

## Réduction des risques
- architecture modulaire ;
- séparation responsabilités ;
- tests précoces ;
- documentation stricte ;
- RFC évolutives.

---

# 21. DÉFINITION DE DONE MVP

Une fonctionnalité est considérée terminée si :
- elle fonctionne ;
- elle respecte les RFC ;
- elle respecte les MUST ;
- elle est testée ;
- elle est documentée si nécessaire ;
- elle passe lint/build/tests.

---

# 22. CRITÈRES DE VALIDATION DU MVP

Le MVP sera considéré comme valide si :
- un utilisateur peut passer un test complet ;
- les scores sont calculés correctement ;
- les résultats sont sauvegardés ;
- l’administration minimale fonctionne ;
- l’environnement est reproductible ;
- la plateforme est stable.

---

# 23. CONCLUSION

Ce backlog technique MVP constitue la première feuille de route opérationnelle de Psycho-Pass.

Il permet :
- de démarrer immédiatement le développement ;
- de structurer les priorités ;
- de répartir les responsabilités ;
- de construire progressivement une plateforme stable et évolutive.

Ce backlog pourra évoluer à mesure de l’avancement du produit et des nouvelles RFC.
