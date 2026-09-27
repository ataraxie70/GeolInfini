# MUST-001 — Conventions de développement
## Projet : Psycho-Pass
### Statut : Obligatoire
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit les règles de développement obligatoires du projet Psycho-Pass.

Il s’applique à l’ensemble de l’équipe technique et couvre :
- la convention de nommage ;
- l’organisation du code ;
- la structure des dossiers ;
- les règles Git ;
- les standards de qualité ;
- les pratiques de revue ;
- les conventions de documentation ;
- les règles de collaboration.

Ce document a un caractère contraignant. Toute exception doit être validée explicitement.

---

# 2. PRINCIPES GÉNÉRAUX

## 2.1 Clarté
Le code doit être lisible sans effort inutile.

## 2.2 Cohérence
Les mêmes règles doivent être appliquées partout dans le projet.

## 2.3 Simplicité
Chaque fichier, composant ou service doit avoir une responsabilité claire.

## 2.4 Maintenabilité
Le code doit pouvoir être compris, modifié et testé facilement.

## 2.5 Prévisibilité
Les conventions doivent permettre à tout membre de l’équipe de retrouver rapidement la logique du projet.

---

# 3. CONVENTIONS DE NOMMAGE

## 3.1 Règles générales
- Les noms doivent être explicites.
- Les abréviations doivent être évitées sauf si elles sont standardisées.
- Un nom doit décrire la responsabilité réelle de l’élément.
- Les noms doivent être cohérents entre frontend, backend et base de données.

---

## 3.2 Fichiers

### Règles
- Utiliser **kebab-case** pour les fichiers standards.
- Utiliser **PascalCase** pour les composants React.
- Utiliser des suffixes explicites lorsque nécessaire.

### Exemples
- `user-profile.ts`
- `test-engine.service.ts`
- `question-card.tsx`
- `ResultSummary.tsx`

### Interdictions
- noms génériques comme `test1.ts`, `newfile.ts`, `tmp.ts`
- noms ambigus comme `data.ts`, `helper.ts` sans contexte

---

## 3.3 Variables

### Règles
- Utiliser **camelCase**.
- Les variables doivent exprimer une intention claire.
- Les booléens doivent être formulés comme des états : `isLoading`, `hasError`, `canSubmit`.

### Exemples
- `userScore`
- `selectedCategory`
- `timeRemaining`
- `hasCompletedTest`

---

## 3.4 Fonctions

### Règles
- Utiliser **camelCase**.
- Le nom de la fonction doit exprimer une action.
- Une fonction doit idéalement faire une seule chose.

### Exemples
- `calculateFinalScore()`
- `createTestSession()`
- `validateAnswer()`
- `fetchUserResults()`

---

## 3.5 Composants React

### Règles
- Utiliser **PascalCase**.
- Le composant doit avoir une responsabilité principale.
- Le nom doit être descriptif.

### Exemples
- `QuestionCard`
- `TestTimer`
- `ResultPanel`
- `ProgressSummary`

---

## 3.6 Classes et services backend

### Règles
- Utiliser **PascalCase**.
- Les services doivent porter un nom métier clair.
- Les contrôleurs, services et modules doivent être alignés sur le même domaine.

### Exemples
- `AuthService`
- `TestService`
- `AdaptiveEngineService`
- `ScoringService`

---

## 3.7 Base de données

### Tables
- Utiliser des noms au pluriel.
- Les noms doivent représenter un ensemble d’objets.

### Exemples
- `users`
- `questions`
- `tests`
- `results`
- `categories`

### Colonnes
- Utiliser **snake_case** si PostgreSQL est adopté.

### Exemples
- `created_at`
- `updated_at`
- `user_id`
- `question_id`

---

# 4. STRUCTURE DE DOSSIERS

## 4.1 Frontend
Structure recommandée :

```text
src/
 ├── app/
 ├── components/
 ├── features/
 ├── hooks/
 ├── lib/
 ├── services/
 ├── stores/
 ├── styles/
 ├── types/
 └── utils/
```

## 4.2 Backend
Structure recommandée :

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

## 4.3 Règles de structure
- Un dossier doit représenter un domaine métier ou technique clair.
- Les fichiers utilitaires ne doivent pas devenir un fourre-tout.
- Les composants communs doivent être isolés.
- Les règles de séparation doivent être strictes.

---

# 5. CONVENTIONS DE CODE

## 5.1 TypeScript
- TypeScript est obligatoire.
- Les types doivent être explicites lorsque la lisibilité l’exige.
- Les types `any` doivent être évités.
- Les fonctions critiques doivent être typées.

## 5.2 Fonctions
- Une fonction = une responsabilité principale.
- Les fonctions longues doivent être découpées.
- Les effets de bord doivent être limités.

## 5.3 Composants
- Un composant doit rester centré sur une tâche visuelle ou interactive.
- La logique complexe doit être déplacée dans des hooks ou services.

## 5.4 Services
- Un service doit encapsuler une logique métier ou technique cohérente.
- Les services doivent être testables indépendamment.

---

# 6. RÈGLES GIT

## 6.1 Branches
Branches recommandées :
- `main` : production
- `dev` : intégration
- `feature/...` : nouvelle fonctionnalité
- `fix/...` : correction
- `chore/...` : maintenance
- `hotfix/...` : correction urgente

## 6.2 Commits
Format recommandé :

```text
feat: ajout du moteur adaptatif
fix: correction du calcul de score
docs: mise à jour du RFC
refactor: simplification du service de test
```

## 6.3 Règles de commit
- Un commit doit correspondre à une intention claire.
- Les commits doivent être petits et lisibles.
- Les commits vagues sont interdits.
- Les messages de type `update`, `misc`, `test` sans contexte sont interdits.

## 6.4 Pull requests
- Toute fusion passe par une PR.
- Une PR doit être relue avant fusion.
- Les changements non documentés ne doivent pas être fusionnés.

---

# 7. REVUE DE CODE

## 7.1 Principes
Chaque revue doit vérifier :
- la conformité aux RFC ;
- la conformité aux MUST ;
- la lisibilité du code ;
- la sécurité ;
- les tests associés ;
- l’impact fonctionnel.

## 7.2 Critères de rejet
Une PR peut être rejetée si :
- elle introduit une dette technique inutile ;
- elle ne respecte pas les conventions ;
- elle casse la séparation des responsabilités ;
- elle manque de tests sur une zone critique ;
- elle introduit des dépendances non validées.

---

# 8. DOCUMENTATION OBLIGATOIRE

## 8.1 Ce qui doit être documenté
- toute décision d’architecture ;
- toute API publique ;
- toute règle métier sensible ;
- tout comportement non évident ;
- toute dépendance critique.

## 8.2 Où documenter
- RFC pour les décisions structurantes ;
- README pour le démarrage ;
- commentaires de code uniquement si nécessaire ;
- Swagger pour l’API ;
- dossier technique interne pour les règles détaillées.

---

# 9. RÈGLES DE QUALITÉ

## MUST
- Lint obligatoire.
- Formatage automatique obligatoire.
- Aucune erreur TypeScript ignorée sans justification.
- Les tests critiques doivent être ajoutés avec toute fonctionnalité sensible.
- Le code mort doit être supprimé.
- Les duplications inutiles doivent être évitées.

---

# 10. RÈGLES DE NOMMAGE DES API

## Endpoints
- Les endpoints doivent être cohérents avec les ressources métiers.
- Utiliser des noms au pluriel pour les collections.
- Garder une structure logique par version.

### Exemples
- `GET /api/v1/tests`
- `POST /api/v1/tests/start`
- `POST /api/v1/tests/:id/answer`
- `GET /api/v1/results/:id`

## Variables de payload
- Les payloads doivent être explicites.
- Les noms doivent éviter toute ambiguïté.

---

# 11. CONVENTIONS POUR LES INTERFACES

## UI
- Les composants doivent être nommés selon leur rôle.
- Les pages doivent être organisées par fonction.
- Les classes utilitaires doivent rester lisibles.
- Les états visuels doivent être cohérents.

## Exemple
- `QuestionCard`
- `TestHeader`
- `ResultSummary`
- `DashboardStats`

---

# 12. RÈGLES DE SÉPARATION DES RESPONSABILITÉS

## Interdictions
- Mélanger logique métier et affichage dans le même bloc sans nécessité.
- Mélanger accès API et rendu UI dans des composants trop volumineux.
- Placer des règles métier critiques dans le frontend.
- Mélanger modules sans frontière claire.

## Obligations
- Le frontend gère l’expérience.
- Le backend gère la logique.
- La base de données gère la persistance.
- Les utilitaires restent limités et spécialisés.

---

# 13. EXEMPLES DE BONNES PRATIQUES

## Bon exemple
- Un composant `QuestionCard` affiche une question.
- Un hook `useTestTimer()` gère le temps.
- Un service `TestService` orchestre la session.
- Un service `ScoringService` calcule les scores.

## Mauvais exemple
- Un composant unique qui affiche, calcule, enregistre et décide de la logique métier.

---

# 14. CHECKLIST OBLIGATOIRE AVANT MERGE

Avant toute fusion, vérifier :
- conformité au RFC concerné ;
- respect des MUST ;
- nommage correct ;
- tests ajoutés ou mis à jour ;
- lint et formatage passés ;
- absence de logique critique dupliquée ;
- documentation mise à jour si nécessaire.

---

# 15. CRITÈRES DE CONFORMITÉ

Le projet est conforme à ce MUST si :
- les conventions sont homogènes ;
- les fichiers sont lisibles et prévisibles ;
- la collaboration est structurée ;
- les PR sont exploitables rapidement ;
- la dette technique reste contrôlée.

---

# 16. CONCLUSION

Ce document fixe les conventions de développement obligatoires de Psycho-Pass.

Il doit être appliqué dès le premier commit afin de garantir :
- une base de code propre ;
- une collaboration efficace ;
- une maintenance durable ;
- une évolution maîtrisée du projet.

Toute dérogation doit être explicitement validée et documentée.

