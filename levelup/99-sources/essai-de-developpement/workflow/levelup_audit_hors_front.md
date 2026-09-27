# LevelUP — Audit technique hors front / UI-UX

## Périmètre
Audit concentré sur :
- architecture backend,
- qualité du schéma de données,
- sécurité,
- tests et qualité d’exécution,
- industrialisation / déploiement,
- maintenabilité.

Le front n’est pas traité ici, sauf quand son absence ou sa non-structuration impacte l’architecture globale.

---

## 1) Résumé exécutif

Le projet a une base fonctionnelle intéressante :
- backend NestJS modulaire,
- Prisma + PostgreSQL,
- Redis,
- cron / queues,
- moteur RPG / progression / quêtes / quiz / recommandations.

Mais plusieurs points réduisent fortement la robustesse globale :
1. **Le front n’existe pratiquement pas dans le dépôt source** : on trouve un package Next.js, mais pas de code applicatif exploitable.
2. **Le backend est trop permissif sur la sécurité** : CORS ouvert, authentification via token dans l’URL possible, journalisation d’informations sensibles.
3. **La qualité typée est insuffisante** : beaucoup de `any`, peu de DTO réellement stricts, logique métier dispersée.
4. **La couverture de tests est faible et déséquilibrée** : peu de specs actives, beaucoup de fichiers `.disabled`.
5. **Le projet manque d’une séparation stricte entre domaine, orchestration, persistance et transport HTTP**.
6. **Le build n’est pas reproductible dans l’état de l’archive fournie** : la commande `npm run build` échoue à cause d’un artefact Prisma manquant dans `node_modules`.

---

## 2) Ce qui est solide

### 2.1 Architecture générale
Le backend est découpé en modules métier :
- users, auth, discipline,
- sessions, progression, quiz, quests,
- recommendations, notifications, rpg,
- activity logs, interruptions, system settings.

C’est une bonne direction : le découpage par domaine évite un seul gros contrôleur monolithique.

### 2.2 Schéma de données
Le schéma Prisma est riche et cohérent avec la vision produit :
- users, profile, XP, achievements, titles, quests,
- sessions, penalties, rewards, interruptions,
- topics, modules, study plans, prerequisites,
- quizzes, attempts, resources, exercises, mistakes.

Le modèle de progression par graphe est pertinent.

### 2.3 Logique métier
On voit une vraie intention de produit :
- progression verrouillée par prérequis,
- discipline score,
- sessions planifiées / actives / terminées,
- récompenses et pénalités,
- moteur de recommandation,
- moteur RPG.

Le fond fonctionnel est bon.

---

## 3) Points critiques hors front

## 3.1 Le dépôt ne contient pas l’application front exploitable
Dans `apps/frontend`, on trouve essentiellement :
- `package.json`,
- `README.md`.

Il n’y a pas de code applicatif Next.js visible dans l’arborescence inspectée.  
Conséquence :
- impossible de valider la vraie intégration API ↔ UI,
- impossible d’auditer la structure de navigation,
- impossible d’auditer le SSR/CSR, les états, l’accessibilité, ou les performances du rendu,
- le projet est, en pratique, backend-centric dans cette archive.

### Recommandation
Reconstituer ou versionner :
- `app/`,
- composants UI,
- services API front,
- hooks,
- gestion d’état,
- layouts,
- styles,
- tests front.

Sans cela, la couche produit reste incomplète.

---

## 4) Sécurité

### 4.1 CORS ouvert globalement
Dans `apps/backend/src/main.ts` :
```ts
app.enableCors();
```

C’est trop large pour une production.  
Risques :
- exposition inutile à des origines non contrôlées,
- surface d’attaque élargie,
- comportements non souhaités si des endpoints sensibles sont appelés depuis un navigateur.

### Recommandation
Restreindre à des origines explicites selon l’environnement :
- développement,
- staging,
- production.

---

### 4.2 Logging d’informations sensibles au démarrage
Toujours dans `main.ts` :
```ts
console.log('DATABASE_URL inside NestJS:', process.env.DATABASE_URL);
```

C’est une mauvaise pratique.  
Même si la variable n’est pas toujours affichée dans les logs finaux, elle ne doit jamais être journalisée.

### Recommandation
Supprimer tout log d’environnement sensible :
- `DATABASE_URL`,
- secrets JWT,
- clés API,
- URL internes.

---

### 4.3 Authentification via token dans l’URL
Dans `jwt.strategy.ts`, le token peut être extrait depuis :
- `Authorization: Bearer`,
- **ou la query string** `?token=`.

C’est risqué.  
Les tokens dans l’URL peuvent fuiter via :
- logs proxy,
- historique navigateur,
- referer,
- capture d’écran,
- traces système.

### Recommandation
N’autoriser que le header `Authorization: Bearer`.  
Supprimer l’extraction depuis la query string.

---

### 4.4 Logout par blacklist de token brut
Le logout met en blacklist la valeur brute du token dans Redis.

Limites :
- dépendance forte à la forme exacte du token,
- coût mémoire,
- gestion de révocation partielle,
- stratégie peu évolutive si refresh tokens ou rotation sont ajoutés.

### Recommandation
Passer à une stratégie plus robuste :
- access token court,
- refresh token distinct,
- rotation,
- jti / session id,
- révocation par identifiant de session plutôt que par chaîne brute.

---

### 4.5 Contrôles d’accès encore trop dispersés
Les guards existent, mais l’approche reste fragile car beaucoup de contrôleurs utilisent `req: any` et dépendent de conventions implicites.

### Recommandation
Introduire :
- décorateur `@CurrentUser()`,
- types de requête authentifiée,
- guards + politiques centralisées,
- scopes explicites par route.

---

## 5) Qualité de typage et dette technique

### 5.1 Usage massif de `any`
On retrouve `any` dans de nombreux fichiers :
- contrôleurs,
- services,
- parser de roadmap,
- quiz,
- rpg,
- notifications,
- sessions,
- imports.

Conséquences :
- perte de sécurité statique,
- refactoring risqué,
- bugs cachés jusqu’à l’exécution,
- API moins explicite.

### Recommandation
Remplacer par :
- DTO typés,
- interfaces métier,
- types Prisma ciblés,
- wrappers de validation,
- types de réponse bien définis.

---

### 5.2 Logique métier et parsing trop permissifs
`roadmap-parser.ts` accepte des formes très variées de données et retourne des structures non typées.

C’est utile pour importer vite, mais dangereux à long terme :
- validations incomplètes,
- comportement ambigu,
- normalisation implicite difficile à maintenir.

### Recommandation
Séparer :
- parsing brut,
- validation du payload,
- normalisation,
- mapping vers entités métiers.

---

### 5.3 Couplage service / persistance / transformation
Plusieurs services font à la fois :
- accès Prisma,
- orchestration métier,
- mapping de réponse,
- logique de calcul.

### Recommandation
Introduire des couches :
- repository / data access,
- domain service,
- application service,
- mappers.

Cela réduira la complexité et le coût des futures évolutions.

---

## 6) Base de données / Prisma

### 6.1 Schéma riche mais encore hétérogène
Le modèle couvre beaucoup de sous-domaines, ce qui est bien, mais plusieurs champs métier restent en `String` libre :
- `difficulty`,
- `severity`,
- `priority`,
- `objectiveType`,
- `questionType`,
- `category`,
- `rarity`,
- parfois des états métier déjà structurés ailleurs en enum.

### Risque
Ces chaînes libres peuvent diverger :
- orthographes différentes,
- valeurs non valides,
- règles de calcul fragiles,
- requêtes et filtres moins fiables.

### Recommandation
Convertir progressivement en :
- enums Prisma,
- ou tables de référence.

---

### 6.2 Entités nombreuses, mais gouvernance de schéma à durcir
Le schéma est riche, mais il doit être protégé par :
- contraintes cohérentes,
- index sur les chemins de lecture fréquents,
- valeurs par défaut documentées,
- migrations vérifiées.

### Recommandation
Faire un audit des requêtes les plus fréquentes et aligner les index dessus.

---

### 6.3 Relations importantes déjà bien posées
Points positifs :
- cascade sur beaucoup de dépendances,
- index présents sur plusieurs clés étrangères,
- unique constraints sur les liens many-to-many métier,
- `UserProfile`, `UserAchievement`, `UserTitle`, `UserQuest` bien structurés.

Le modèle est sain dans son intention.

---

## 7) Tests et qualité logicielle

### 7.1 Couverture trop faible
Dans le backend :
- 5 suites de tests actives,
- 15 tests au total,
- 19 fichiers de spec désactivés (`*.disabled`).

C’est trop peu pour un produit avec :
- auth,
- progression,
- quêtes,
- quiz,
- recommandations,
- cron,
- queue,
- RPG.

### Risque
Régressions silencieuses à chaque évolution.

### Recommandation
Réactiver progressivement les tests désactivés et compléter avec :
- tests unitaires de services,
- tests d’intégration sur Prisma,
- tests e2e sur auth / progression / quiz / sessions,
- tests de non-régression sur les calculs métier.

---

### 7.2 Tests trop centrés sur la logique, pas assez sur les contrats
Les tests visibles couvrent surtout des services.  
Il manque plus de contrats stables :
- format de réponse,
- erreurs HTTP,
- permissions,
- cas limites,
- migrations de données.

### Recommandation
Ajouter des tests contractuels sur les endpoints publics majeurs.

---

## 8) Build / reproductibilité / industrialisation

### 8.1 Build non reproductible dans l’archive fournie
La commande :
```bash
npm run build
```
échoue dans le backend avec une erreur liée à un fichier Prisma manquant dans `node_modules`.

### Interprétation
Dans l’état livré, le projet n’est pas entièrement reproductible sans régénération propre des dépendances.

### Recommandation
- nettoyer les dépendances fournies,
- reconstruire `node_modules` depuis `package-lock.json`,
- vérifier que les scripts ne dépendent pas d’artefacts incomplets,
- faire tourner `npm ci` dans un environnement propre.

---

### 8.2 Absence de vraie racine de monorepo
Le projet a plusieurs apps, mais on ne voit pas de racine de workspace claire avec :
- scripts coordonnés,
- règles partagées,
- exécution unifiée,
- versionnement homogène des outils.

### Recommandation
Mettre en place :
- `npm workspaces` ou équivalent,
- scripts root `build/test/lint/dev`,
- conventions partagées,
- configuration commune TypeScript / ESLint / Prettier.

---

### 8.3 CI présente mais partiellement illusionniste
Le workflow GitHub Actions existe et couvre backend, frontend et agent CLI.  
Mais l’absence de code front réel et la fragilité de l’environnement rendent ce pipeline moins utile qu’il n’y paraît.

### Recommandation
Faire correspondre le pipeline à des artefacts effectivement présents et validés.

---

## 9) Refactorings prioritaires

### Priorité 1 — Sécurité
- retirer le token dans la query string,
- restreindre CORS,
- supprimer les logs sensibles,
- ajouter une vraie politique de session / révocation,
- sécuriser les DTO d’auth.

### Priorité 2 — Typage
- remplacer une grande partie des `any`,
- typer les contrôleurs,
- typer le parser de roadmap,
- typer les réponses API.

### Priorité 3 — Architecture
- séparer application / domaine / persistance,
- introduire des repositories,
- extraire les calculateurs métier dans des services purs.

### Priorité 4 — Tests
- réactiver les specs désactivées,
- monter la couverture sur auth, progression, quiz, sessions, quêtes,
- ajouter des tests d’intégration.

### Priorité 5 — Industrialisation
- rendre le build reproductible,
- clarifier la racine de monorepo,
- fiabiliser la CI,
- documenter les commandes d’exploitation réelles.

---

## 10) Points à refactorer en premier dans le code

1. `apps/backend/src/main.ts`
   - supprimer le log de `DATABASE_URL`,
   - restreindre CORS,
   - préparer un bootstrap propre par environnement.

2. `apps/backend/src/auth/jwt.strategy.ts`
   - supprimer le token en query string,
   - typer proprement `request` et `payload`,
   - centraliser la validation.

3. `apps/backend/src/users/users.controller.ts`
   - remplacer `req: any` par un type utilisateur authentifié.

4. `apps/backend/src/modules/programs/roadmap-parser.ts`
   - créer des types d’import,
   - séparer parsing et normalisation,
   - valider les entrées.

5. `apps/backend/src/modules/quiz/quiz.service.ts`
   - extraire les générateurs AI,
   - typer les questions,
   - découper la logique par sous-domaines.

6. `apps/backend/src/modules/rpg/rpg.service.ts`
   - réduire la taille du service,
   - extraire les calculs purs,
   - isoler les effets de bord Prisma.

7. `apps/backend/src/modules/notifications/*`
   - définir un contrat de notification strict,
   - éviter le `Subject<any>`.

---

## 11) Conclusion

Le projet a une vraie direction produit et une architecture métier déjà riche.  
Le principal chantier n’est pas d’ajouter encore plus de fonctionnalités, mais de **stabiliser le socle** :

- sécurité,
- typage,
- tests,
- structure des couches,
- reproductibilité du build,
- présence réelle du front source.

Sans cette consolidation, chaque nouvelle fonctionnalité augmentera fortement la dette technique.
