# Psycho-Pass — Dossier de documentation initiale

## 0. Objectif de ce document
Ce document définit la base documentaire nécessaire pour démarrer proprement le projet Psycho-Pass comme un vrai produit logiciel.

L’objectif est de poser :
- les documents de référence (RFC) ;
- les règles obligatoires de développement (MUST) ;
- la stack technique complète ;
- les conventions de code ;
- les principes backend et frontend ;
- la structure de travail pour une équipe de développement.

---

# 1. Hiérarchie documentaire recommandée

Pour démarrer le projet proprement, la documentation doit être organisée en 4 blocs.

## 1.1 Bloc A — Vision produit
Contient :
- vision du projet ;
- objectifs business ;
- périmètre MVP ;
- personas ;
- parcours utilisateur ;
- règles fonctionnelles globales.

## 1.2 Bloc B — RFC (Reference / Request for Comments)
Contient les décisions structurantes du projet.

Exemples :
- RFC-001 : Vision technique et architecture globale
- RFC-002 : Stack frontend
- RFC-003 : Stack backend
- RFC-004 : Modèle de données
- RFC-005 : Système de scoring
- RFC-006 : Moteur adaptatif
- RFC-007 : Système d’authentification
- RFC-008 : Design system UI/UX
- RFC-009 : Conventions de code et nommage
- RFC-010 : Sécurité et déploiement

## 1.3 Bloc C — MUST
Contient les règles non négociables.

Exemples :
- architecture obligatoire ;
- standards de code ;
- gestion des erreurs ;
- sécurité ;
- conventions de commits ;
- règles de validation ;
- structure des dossiers.

## 1.4 Bloc D — Spécifications d’implémentation
Contient :
- schéma des dossiers ;
- contrats API ;
- composants frontend ;
- services backend ;
- règles métier ;
- états d’interface ;
- logging ;
- tests.

---

# 2. Suite logique du projet

La suite logique, à ce stade, est la suivante :

## Étape 1 — Valider la stack complète
Choisir définitivement :
- frontend ;
- backend ;
- base de données ;
- authentification ;
- hébergement ;
- outils de test ;
- outils de CI/CD.

## Étape 2 — Écrire les RFC de fondation
Avant de coder, il faut figer les décisions majeures.

## Étape 3 — Écrire les MUST de développement
Les règles obligatoires doivent être définies avant toute implémentation.

## Étape 4 — Définir l’architecture backend
Le backend doit devenir le moteur principal du produit.

## Étape 5 — Définir l’architecture frontend
Le frontend doit être pensé comme une interface d’évaluation rapide, claire et très structurée.

## Étape 6 — Préparer le backlog technique
Découper le projet en tickets de développement.

## Étape 7 — Démarrer le socle technique
Mettre en place :
- repository ;
- structure des dossiers ;
- lint ;
- tests ;
- auth ;
- base API ;
- design system.

---

# 3. RFC à produire en priorité

## RFC-001 — Vision technique et architecture globale
### Contenu
- objectifs du système ;
- séparation frontend/backend ;
- flux des données ;
- logique de scaling ;
- choix API ;
- logique monorepo ou multi-repo.

### Décisions attendues
- architecture choisie ;
- type d’app ;
- type de base de données ;
- stratégie de déploiement.

---

## RFC-002 — Stack technique complète
### Contenu
- frontend ;
- backend ;
- base de données ;
- ORM ;
- auth ;
- stockage ;
- analytics ;
- cache ;
- tests ;
- CI/CD.

### Décisions attendues
- stack officielle du projet ;
- outils validés ;
- outils interdits ;
- dépendances critiques.

---

## RFC-003 — Backend core engine
### Contenu
- moteur de test ;
- moteur adaptatif ;
- scoring ;
- règles métier ;
- orchestration ;
- gestion des sessions ;
- journalisation.

### Décisions attendues
- structure des services ;
- workflow de test ;
- calcul des scores ;
- gestion des erreurs.

---

## RFC-004 — Frontend architecture et design system
### Contenu
- structure des pages ;
- navigation ;
- composants ;
- thème ;
- couleurs ;
- typographie ;
- espacements ;
- comportements interactifs.

### Décisions attendues
- layout principal ;
- règles UI ;
- composants réutilisables ;
- états visuels.

---

## RFC-005 — Modèle de données
### Contenu
- utilisateurs ;
- tests ;
- questions ;
- réponses ;
- catégories ;
- résultats ;
- progression.

### Décisions attendues
- schéma relationnel ;
- clés ;
- index ;
- contraintes ;
- audit.

---

## RFC-006 — Sécurité et conformité
### Contenu
- hash des mots de passe ;
- protection des API ;
- rôle utilisateur/admin ;
- logs ;
- limitation des abus ;
- sauvegardes.

---

## RFC-007 — Qualité, tests et livraison
### Contenu
- tests unitaires ;
- tests d’intégration ;
- tests E2E ;
- critères de validation ;
- déploiement ;
- rollback.

---

# 4. MUST de développement

Les MUST sont les règles obligatoires à respecter par toute l’équipe.

## 4.1 MUST généraux
- Le code doit être lisible et maintenable.
- Les conventions doivent être identiques sur tout le projet.
- Toute fonctionnalité doit être documentée.
- Aucun composant ne doit être codé sans responsabilité claire.
- Toute décision majeure doit être validée par RFC.

---

## 4.2 MUST de nommage

### Fichiers
- utiliser du kebab-case pour les fichiers non composants ;
- utiliser du PascalCase pour les composants React ;
- éviter les noms ambigus.

### Variables et fonctions
- utiliser camelCase ;
- noms explicites ;
- pas d’abréviations inutiles.

### Composants
- un composant = une responsabilité principale ;
- nom en PascalCase ;
- export clair.

### Base de données
- noms de tables au pluriel ;
- colonnes en snake_case si PostgreSQL ;
- clés étrangères explicites.

---

## 4.3 MUST d’architecture
- Séparer la logique métier de l’interface.
- Le backend doit être le seul arbitre des règles métier.
- Le frontend ne doit jamais recalculer des données sensibles.
- Les services doivent être découplés.
- Les composants UI doivent rester réutilisables.

---

## 4.4 MUST de sécurité
- Les mots de passe doivent être hashés.
- Les secrets ne doivent jamais être dans le code.
- Les endpoints sensibles doivent être protégés.
- Les permissions doivent être contrôlées par rôle.
- Les entrées utilisateur doivent être validées.

---

## 4.5 MUST de qualité
- Lint obligatoire.
- Formatage automatique obligatoire.
- Tests sur les modules critiques.
- Gestion des erreurs standardisée.
- Logs structurés.

---

## 4.6 MUST Git / collaboration
- Une branche par fonctionnalité.
- Commits clairs et atomiques.
- Pull request obligatoire pour fusion.
- Aucun push direct sur la branche principale.
- Convention de commit standardisée.

---

# 5. Convention de développement recommandée

## 5.1 Convention de branches
- `main` : production
- `dev` : intégration
- `feature/...` : nouvelles fonctionnalités
- `fix/...` : corrections
- `chore/...` : maintenance

## 5.2 Convention de commits
Format conseillé :
- `feat:` nouvelle fonctionnalité
- `fix:` correction
- `refactor:` refonte interne
- `docs:` documentation
- `test:` tests
- `chore:` maintenance

## 5.3 Convention de dossiers
Exemple attendu :
- `src/components`
- `src/pages`
- `src/features`
- `src/services`
- `src/lib`
- `src/hooks`
- `src/styles`
- `src/utils`

---

# 6. Backend — rôle et responsabilité

Le backend est le cerveau de la plateforme.

## 6.1 Fonctions principales
- authentifier les utilisateurs ;
- gérer les sessions ;
- fournir les questions ;
- contrôler le chronomètre logique ;
- calculer le score ;
- gérer l’adaptativité ;
- stocker les résultats ;
- exposer une API sécurisée.

## 6.2 Services backend attendus
- AuthService
- UserService
- QuestionService
- TestService
- ScoreService
- AdaptiveEngineService
- ResultService
- AdminService
- AnalyticsService

## 6.3 Règle majeure
Le backend doit contenir toute la logique métier critique.
Le frontend affiche, le backend décide.

---

# 7. Frontend — rôle et responsabilité

Le frontend doit offrir une interface claire, rapide et rassurante.

## 7.1 Objectifs UI/UX
- navigation simple ;
- lisibilité maximale ;
- hiérarchie visuelle claire ;
- interactions immédiates ;
- compatibilité mobile.

## 7.2 Architecture frontend attendue
- pages ;
- layouts ;
- composants réutilisables ;
- système de design tokens ;
- gestion des états ;
- gestion des erreurs ;
- loading states.

## 7.3 Structure d’écran
- accueil ;
- authentification ;
- dashboard ;
- sélection de test ;
- écran question ;
- fin de test ;
- résultats ;
- admin.

## 7.4 UI system attendu
- couleurs cohérentes ;
- typographies constantes ;
- espacements réguliers ;
- boutons lisibles ;
- cartes homogènes ;
- feedback visuel immédiat.

---

# 8. Stack complète recommandée à valider

## 8.1 Frontend
- Next.js
- React
- TypeScript
- Tailwind CSS
- shadcn/ui ou équivalent

## 8.2 Backend
- Node.js
- NestJS
- TypeScript

## 8.3 Base de données
- PostgreSQL

## 8.4 ORM
- Prisma ou équivalent

## 8.5 Authentification
- JWT
- option OAuth plus tard

## 8.6 Tests
- Vitest ou Jest
- Playwright ou Cypress

## 8.7 Qualité
- ESLint
- Prettier
- Husky / lint-staged

## 8.8 CI/CD
- GitHub Actions

## 8.9 Hébergement
- Vercel pour le frontend
- Railway / Render / VPS pour le backend

---

# 9. Documents à produire juste après celui-ci

Ordre conseillé :

1. RFC-001 — Vision technique et architecture globale
2. RFC-002 — Stack technique complète
3. RFC-003 — Backend core engine
4. RFC-004 — Frontend architecture et design system
5. RFC-005 — Modèle de données
6. MUST-001 — Conventions de développement
7. MUST-002 — Sécurité et qualité
8. Spécification API initiale
9. Spécification UI/UX initiale
10. Backlog technique MVP

---

# 10. Conclusion

La meilleure suite logique pour Psycho-Pass est de figer maintenant les fondations techniques avant de coder.

Le bon ordre est :
- vision technique ;
- stack ;
- backend ;
- frontend ;
- règles MUST ;
- modèle de données ;
- puis backlog et développement.

Ce document sert de socle d’organisation pour démarrer le projet de manière professionnelle et stable.
