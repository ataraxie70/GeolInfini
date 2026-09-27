# LEVELUP — Rapport d'audit, vision et plan d'execution

Date d'audit : 2026-06-12  
Perimetre audite : documentation `workflow`, backend NestJS/Prisma, frontend Next.js, devcontainer, scripts et controles locaux.

---

## 1. Synthese executive

LevelUP a une vision produit claire et differenciante : devenir une plateforme d'apprentissage personnel qui impose un chemin de progression, controle les prerequis, detecte les ecarts, applique des penalites et permet une reprise structuree apres interruption.

L'etat actuel du projet est cependant tres initial cote implementation. La documentation est nettement plus avancee que le code. Le backend et le frontend sont encore majoritairement des squelettes generes. Le schema Prisma reprend une partie importante du modele cible, mais il n'est pas valide avec la version Prisma installee, aucune migration n'existe et aucune API metier n'est exposee.

Verdict : le projet est en phase de cadrage technique avance, pas encore en phase MVP executable.

### Niveau de maturite estime

| Axe | Etat | Maturite |
| --- | --- | --- |
| Vision produit | Bonne base, coherent autour de la contrainte intelligente | 70% |
| Backlog fonctionnel | Large et exploitable, mais a resserrer pour le MVP | 60% |
| Architecture cible | Bonne intention, couches identifiees | 45% |
| Modele de donnees | Schema Prisma present mais invalide et incomplet | 35% |
| Backend | Scaffold NestJS, pas de modules metier | 10% |
| Frontend | Template Next.js par defaut | 5% |
| Tests | Tests triviaux uniquement | 10% |
| Environnement | Devcontainer defini, mais config DB incoherente | 35% |
| Qualite executable | Builds backend et frontend non verts | 15% |

---

## 2. Vision fixee

### Vision courte

LevelUP est un systeme de pilotage d'apprentissage par contrainte intelligente : il transforme un programme de formation en sequence executable, verrouille les raccourcis, suit les sessions quotidiennes, sanctionne les ecarts et organise la reprise.

### Probleme principal

L'apprenant autonome abandonne souvent parce que le parcours est flou, parce qu'il peut contourner les bases, parce qu'aucune consequence n'existe en cas de manquement et parce qu'une interruption casse la dynamique.

### Promesse produit

Chaque jour, l'apprenant sait exactement quoi faire, pourquoi il y a acces ou non, comment valider son travail, et comment reprendre sans perdre le fil apres une interruption.

### Experience cible MVP

1. L'administrateur cree un programme, un plan, des modules, des sujets et des prerequis.
2. L'apprenant voit sa session du jour.
3. Le systeme bloque les sujets dont les prerequis ne sont pas valides.
4. L'apprenant demarre puis cloture une session.
5. Une session terminee peut valider un sujet et debloquer la suite.
6. Une session manquee produit un evenement disciplinaire et une penalite historisee.
7. Une interruption declenche un protocole de reprise et un recalcul du planning.
8. Les actions critiques sont visibles dans un journal d'activite.

### Non-negociables

- Un plan appartient a un seul programme.
- Un sujet verrouille ne doit jamais etre accessible seulement parce que le frontend l'affiche.
- Une session ne doit jamais etre cloturee sans etat final.
- Une penalite doit toujours etre rattachee a un evenement source.
- Une interruption doit conserver un contexte de reprise.
- Toute action administrative critique doit etre historisee.

---

## 3. Etat reel du projet

### Documentation

Points solides :

- Le dossier maitre formalise le probleme, la solution et les moteurs metier.
- Le backlog technique identifie les domaines, epics, priorites et criteres de sortie V1.
- Le registre de decisions trace les choix initiaux du 12 juin 2026.

Points a corriger :

- Certains choix divergent : la specification cible mentionne Tailwind/PWA, alors que le registre decide Vanilla CSS.
- Les etats ne sont pas totalement harmonises : `TopicStatus` contient `mastered` dans le schema, tandis que le backlog recommande `archived`.
- Les endpoints sont de granularite differente selon les documents : `/programs` dans la specification V1, `/api/v1/...` dans le dossier maitre.
- Le schema minimal du backlog liste `completions`, `revisions`, `admin_actions`, `attachments` et `settings`, mais Prisma n'implemente aujourd'hui que `SystemSetting` parmi ces extensions.

### Backend

Etat actuel :

- Application NestJS creee.
- `AppModule` ne declare que `AppController` et `AppService`.
- Le controleur expose uniquement `GET /` avec `Hello World!`.
- `PrismaService` existe, mais n'est pas enregistre dans `AppModule`.
- Aucun module metier n'existe pour `programs`, `plans`, `modules`, `topics`, `sessions`, `penalties`, `interruptions` ou `activity_logs`.
- Le backend ecoute par defaut sur `3000`, ce qui entre en conflit avec le frontend et contredit la documentation qui annonce `3001`.

Blocages constates :

- `npm run build` echoue : `@prisma/client` n'exporte pas `PrismaClient` dans l'etat actuel.
- `npm run lint` echoue sur Prisma et signale aussi `bootstrap()` non attendu dans `main.ts`.
- Les tests passent uniquement parce qu'ils couvrent le `Hello World`.

### Base de donnees et Prisma

Points solides :

- Le schema Prisma modelise les entites majeures : `User`, `Program`, `StudyPlan`, `Module`, `Topic`, `Prerequisite`, `Session`, `Penalty`, `Interruption`, `ActivityLog`, `SystemSetting`.
- Les relations principales sont presentes.
- Les enums metier sont formalisees.

Blocages :

- `npx prisma validate` echoue avec Prisma 7 : `url = env("DATABASE_URL")` n'est plus accepte dans le schema.
- Aucune migration Prisma n'existe.
- Aucun seed de demonstration n'existe.
- Le fichier `.env` backend pointe vers une URL `prisma+postgres://localhost:51213`, alors que le devcontainer declare PostgreSQL via `postgresql://levelup_user:...@db:5432/levelup_db`.
- Les contraintes SQL documentees ne sont pas toutes enforcees par Prisma/migrations : bornes du score discipline, durees positives, prevention d'un prerequis reflexif, coherence `end_date >= start_date`.

### Frontend

Etat actuel :

- Application Next.js creee.
- Page d'accueil encore au template `create-next-app`.
- Metadata encore generiques : `Create Next App`.
- Aucune interface LevelUP n'existe.
- Aucune integration API n'existe.
- Aucun dashboard apprenant/admin n'existe.

Blocage constate :

- `npm run build` echoue dans l'environnement actuel car `next/font/google` tente de recuperer `Geist` et `Geist Mono` depuis Google Fonts, ce qui ne fonctionne pas sans acces reseau.

### Infrastructure

Points solides :

- Devcontainer defini avec Node.js 20, PostgreSQL 15 et Redis 7.
- Makefile disponible pour piloter Docker Compose et entrer manuellement dans le conteneur si besoin.
- Ports attendus declares : frontend `3000`, backend `3001`, PostgreSQL `5432`, Redis `6379`.
- Separation d'environnement voulue : l'hote sert uniquement a piloter Docker et le devcontainer, pas a executer le projet.

Points a corriger :

- Le backend ecoute actuellement sur `3000`.
- Redis est declare mais aucun job BullMQ n'est implemente.
- Le depot Git n'est pas fonctionnel depuis ce workspace : `.git` est un dossier vide ou non initialise, et `git status` echoue.
- Il n'y a pas de CI visible.

Regle d'execution a appliquer :

- Les commandes projet doivent etre executees strictement depuis le terminal du devcontainer : `npm`, `npx`, `npm install`, `npm run build`, `npm run lint`, `npm test`, Prisma, NestJS, Next.js, migrations, seeds, backend, frontend, jobs et acces base.
- Les commandes autorisees sur l'hote sont limitees au pilotage de l'environnement isole : Docker, Docker Compose, ouverture/rebuild du Dev Container, inspection des conteneurs et logs d'infrastructure.
- PostgreSQL et Redis doivent rester les services du `docker-compose.yml`; aucune base locale hote ne doit devenir dependance du projet.
- Les controles locaux listes plus bas representent l'etat observe pendant l'audit. Ils doivent etre rejoues dans le devcontainer apres stabilisation pour devenir la reference officielle.

---

## 4. Resultats des controles locaux

| Commande | Resultat | Interpretation |
| --- | --- | --- |
| `npm test` dans `platform/backend` | OK | 1 test passe, mais test trivial `Hello World` |
| `npm run build` dans `platform/backend` | ECHEC | Prisma client non resolu / schema incompatible |
| `npx prisma validate` dans `platform/backend` | ECHEC | Schema Prisma incompatible Prisma 7 (`datasource.url`) |
| `npm run lint` dans `platform/backend` | ECHEC | Erreurs Prisma + warning `no-floating-promises` |
| `npm run lint` dans `platform/frontend` | OK | Aucun probleme ESLint visible sur le template |
| `npm run build` dans `platform/frontend` | ECHEC | Fonts Google inaccessibles pendant le build |
| `git status --short` a la racine | ECHEC | Workspace non reconnu comme depot Git |

### Mise a jour Phase 0 — Devcontainer stabilise

Apres correction de l'environnement, les controles projet ont ete rejoues dans le devcontainer. Depuis cette session d'agent, `docker compose exec` a uniquement servi a simuler le terminal integre VS Code du conteneur; le workflow documente pour un developpeur reste l'execution directe des commandes depuis le terminal Dev Container.

| Controle dans le devcontainer | Resultat |
| --- | --- |
| `cd /workspace/backend && npm install` | OK, dependances installees dans le volume Docker backend |
| `cd /workspace/frontend && npm install` | OK, dependances installees dans le volume Docker frontend |
| `cd /workspace/backend && npx prisma validate` | OK |
| `cd /workspace/backend && npm run build` | OK |
| `cd /workspace/backend && npm run lint` | OK |
| `cd /workspace/backend && npm test` | OK |
| `cd /workspace/frontend && npm run lint` | OK |
| `cd /workspace/frontend && npm run build` | OK |

Environnement confirme :

- Terminal conteneur : `/workspace`, utilisateur `root`.
- Node.js : `v20.20.2`.
- npm : `10.8.2`.
- Prisma CLI et Client : `7.8.0`.
- PostgreSQL et Redis restent internes au reseau Docker, sans publication de ports hote.
- `backend/node_modules` et `frontend/node_modules` sont montes comme volumes Docker dedies.

---

## 5. Ecarts principaux entre vision et implementation

### Ecart 1 — Produit metier non encore implemente

La vision parle de sessions, progression, penalites et reprise. Le code expose uniquement une route `Hello World`.

Decision : le socle technique est maintenant stabilise dans le devcontainer; le prochain chantier doit etre un premier flux metier vertical.

### Ecart 2 — Modele de donnees avance mais non migre

Le schema Prisma est le meilleur actif technique actuel. Il est maintenant valide avec Prisma 7, mais aucune migration ni seed n'existe encore.

Decision : faire de la migration initiale et des seeds le premier chantier P0 avant d'ajouter des APIs metier.

### Ecart 3 — MVP trop large pour l'etat actuel

Le backlog couvre deja progression, session, penalite, reprise, revision, administration et audit. Tout est pertinent, mais pas livrable en une seule vague.

Decision : livrer un MVP vertical minimal : programme -> plan -> module -> sujet -> prerequis -> session du jour -> validation -> audit.

### Ecart 4 — Frontend sans signal produit

L'interface ne montre pas encore la marque, la discipline, la session du jour ou l'administration.

Decision : remplacer rapidement le template par une interface statique LevelUP, puis brancher progressivement les APIs.

### Ecart 5 — Contrats API non figes

Les documents listent des endpoints, mais il n'y a ni OpenAPI, ni DTO, ni conventions d'erreur, ni versionnement implemente.

Decision : creer les contrats avant les controllers, au moins pour le perimetre P0.

---

## 6. Objectifs produit et techniques

### Objectif O1 — Socle executable stable

Le projet doit pouvoir etre lance, linté, buildé et teste sans erreur, exclusivement depuis le devcontainer.

Critere de sortie :

- Backend : `npm run build`, `npm run lint`, `npm test` verts dans le devcontainer.
- Prisma : `npx prisma validate` vert dans le devcontainer.
- Frontend : `npm run lint`, `npm run build` verts dans le devcontainer.
- Ports : frontend `3000`, backend `3001`, exposes depuis les conteneurs.
- Aucune commande projet ne depend d'un Node, npm, npx, Prisma, NestJS ou Next.js installe sur l'hote.

### Objectif O2 — Verite metier persistable

Le modele de donnees doit permettre de reconstruire l'etat d'un programme, d'un plan, d'un sujet, d'une session, d'une penalite et d'une interruption.

Critere de sortie :

- Migration initiale creee.
- Seed minimal present.
- Contraintes critiques couvertes par DB, logique domaine ou tests.

### Objectif O3 — Administration minimale

L'administrateur doit pouvoir construire le curriculum de base.

Critere de sortie :

- CRUD programmes.
- CRUD plans.
- CRUD modules.
- CRUD sujets.
- Gestion des prerequis.
- Journalisation des actions critiques.

### Objectif O4 — Progression controlee

Le systeme doit calculer si un sujet est verrouille, disponible, en cours ou valide.

Critere de sortie :

- Validation d'un sujet.
- Deblocage automatique des dependants eligibles.
- Raison de verrouillage exposee par API.
- Tests sur graphes simples et graphes avec plusieurs prerequis.

### Objectif O5 — Execution quotidienne

Le systeme doit transformer un plan en session executable.

Critere de sortie :

- Generation d'une session du jour.
- Demarrage de session.
- Cloture `done`, `missed`, `interrupted`.
- Historique des sessions.

### Objectif O6 — Discipline et reprise

Le systeme doit detecter les manquements et relancer l'apprenant apres interruption.

Critere de sortie :

- Penalite creee apres session manquee.
- Score discipline mis a jour.
- Interruption creee avec contexte.
- Reprise avec recalcul minimal du planning.

---

## 7. Plan d'execution recommande

### Phase 0 — Stabilisation technique

Duree estimee : 0,5 a 1 jour.

Principe obligatoire :

- L'hote ne doit executer que Docker, Docker Compose et les commandes qui ouvrent, reconstruisent ou arretent le devcontainer.
- Toutes les commandes projet doivent s'executer directement dans le terminal du devcontainer : installation des dependances, `npm`, `npx`, Prisma, migrations, seeds, backend, frontend, tests, lint et build.
- La base de donnees et Redis utilises par le projet doivent etre ceux du `docker-compose.yml`, pas des services installes sur la machine hote.
- Les dependances `node_modules` doivent etre isolees dans des volumes Docker du devcontainer, pas installees comme outillage global de l'hote.
- Les README et scripts doivent rendre cette separation explicite pour eviter toute pollution de l'hote.

Actions :

- Corriger l'etat Git ou reinitialiser proprement le depot.
- Fixer la version effective de Node : Node 20 dans le devcontainer comme seule version projet; l'eventuelle version Node de l'hote ne doit pas etre utilisee.
- Ajouter une procedure de lancement standard : ouvrir `platform/` dans VS Code, lancer `Dev Containers: Reopen in Container`, puis executer les commandes applicatives directement depuis le terminal integre du conteneur.
- Verifier que `npm install`, `npm run build`, `npm run lint`, `npm test`, `npx prisma validate`, les migrations et les seeds fonctionnent depuis le conteneur.
- Corriger le port backend par defaut vers `3001`.
- Corriger `main.ts` pour traiter explicitement la promesse `bootstrap()`.
- Aligner `.env`, `docker-compose.yml` et `prisma.config.ts` sur les noms reseau Docker (`db`, `redis`) et non sur `localhost` hote.
- Adapter Prisma 7 ou revenir volontairement a une version Prisma compatible avec le schema actuel.
- Supprimer la dependance de build a Google Fonts, ou utiliser des fonts locales/systemes.

Livrables :

- Builds backend/frontend verts dans le devcontainer.
- Lint backend/frontend vert dans le devcontainer.
- `prisma validate` vert dans le devcontainer.
- Procedure documentee pour executer les commandes projet directement depuis le terminal du devcontainer, sans utiliser les installations de l'hote.
- Documentation de lancement local mise a jour.

### Phase 1 — Modele de donnees et migrations

Duree estimee : 1 a 2 jours.

Actions :

- Finaliser les enums et transitions autorisees.
- Arbitrer `mastered` vs `archived` pour les sujets.
- Ajouter ou repousser explicitement `completions`, `revisions`, `admin_actions`, `attachments`.
- Creer la migration initiale.
- Ajouter un seed : 1 admin, 1 learner, 1 programme, 1 plan, 2 modules, 5 sujets, prerequis simples.
- Ajouter tests d'integrite de schema si l'outillage le permet.

Livrables :

- `prisma/migrations/...`.
- Script `db:migrate`, `db:seed`, `db:reset` dans `package.json`.
- Donnees de demonstration coherentes.

### Phase 2 — API administration P0

Duree estimee : 3 a 5 jours.

Actions :

- Creer les modules NestJS : `programs`, `study-plans`, `modules`, `topics`, `prerequisites`, `activity-logs`.
- Definir DTOs et validation d'entree.
- Exposer CRUD minimal.
- Ajouter conventions d'erreur : `400`, `404`, `409`.
- Journaliser creation, modification, suppression logique ou archivage.
- Ajouter tests unitaires et e2e des endpoints principaux.

Livrables :

- API permettant de construire un curriculum complet.
- Tests e2e sur creation programme -> plan -> module -> sujet -> prerequis.

### Phase 3 — Moteur de progression

Duree estimee : 3 a 5 jours.

Actions :

- Implementer service domaine `ProgressionService`.
- Calculer les sujets disponibles selon prerequis valides.
- Valider un sujet.
- Debloquer les sujets dependants eligibles.
- Retourner la raison de verrouillage.
- Couvrir les graphes de prerequis par tests.

Livrables :

- Endpoint de validation de sujet.
- Endpoint de progression par plan.
- Tests metier sur prerequis simples, multiples et blocage.

### Phase 4 — Moteur de sessions

Duree estimee : 4 a 6 jours.

Actions :

- Implementer generation de session du jour.
- Ajouter `POST /sessions/start`.
- Ajouter `POST /sessions/:id/end`.
- Gerer `done`, `missed`, `interrupted`.
- Enregistrer notes/resultats.
- Exposer historique.

Livrables :

- Parcours apprenant minimal utilisable.
- Tests e2e : session du jour -> start -> end -> sujet valide.

### Phase 5 — Discipline, penalites et reprise

Duree estimee : 4 a 6 jours.

Actions :

- Implementer detection des sessions manquees.
- Creer penalites et ajuster le score discipline.
- Ajouter journalisation systematique.
- Creer interruptions avec snapshot minimal.
- Implementer reprise simple : decalage des sessions futures + revision legere.
- Brancher Redis/BullMQ seulement si un job recurrent est vraiment necessaire a ce stade.

Livrables :

- Penalites historisees.
- Reprise minimale testee.
- Tests sur 3 echecs consecutifs si cette regle reste retenue.

### Phase 6 — Frontend MVP

Duree estimee : 5 a 8 jours.

Actions :

- Remplacer le template Next par l'identite LevelUP.
- Creer layout app : navigation, vue apprenant, vue admin.
- Dashboard apprenant : session du jour, score discipline, progression.
- Dashboard admin : CRUD programme/plan/module/sujet/prerequis.
- Gestion des etats de chargement, erreurs et formulaires.
- Brancher client API type-safe minimal.

Livrables :

- Premiere experience produit visible.
- Admin capable de creer un programme complet depuis l'UI.
- Apprenant capable de lancer/cloturer une session.

### Phase 7 — Durcissement V1

Duree estimee : 3 a 5 jours.

Actions :

- Ajouter authentification JWT minimale et roles `admin` / `learner`.
- Ajouter RBAC sur endpoints admin.
- Ajouter tests de non-regression critiques.
- Ajouter CI : install, lint, build, test.
- Nettoyer documentation : README, contrats API, plan de release.

Livrables :

- Release candidate V1.
- Critere de sortie V1 verifiable.

---

## 8. Backlog P0 propose

1. Restaurer un depot Git fonctionnel.
2. Aligner Node, ports et variables d'environnement.
3. Corriger compatibilite Prisma.
4. Corriger builds backend/frontend.
5. Creer migration initiale.
6. Creer seed minimal.
7. Creer module `Programs`.
8. Creer module `StudyPlans`.
9. Creer module `Modules`.
10. Creer module `Topics`.
11. Creer module `Prerequisites`.
12. Ajouter `ActivityLogService`.
13. Implementer validation des prerequis.
14. Implementer validation de sujet.
15. Implementer session du jour.
16. Implementer start/end session.
17. Implementer premiere penalite sur session manquee.
18. Remplacer template frontend par dashboard LevelUP statique.
19. Brancher dashboard admin sur APIs P0.
20. Brancher dashboard apprenant sur session du jour.

---

## 9. Risques et parades

### Risque R1 — Derive de perimetre

Le produit peut facilement absorber trop de fonctionnalites : PWA, IA, statistiques avancees, graphe interactif, multi-utilisateur complet.

Parade : interdire P1/P2 tant que le parcours vertical P0 n'est pas vert.

### Risque R2 — Prisma bloque le developpement

La version Prisma installee impose des conventions qui ne sont pas encore integrees.

Parade : decision explicite sous 1 jour : adapter le projet a Prisma 7 ou pinner une version plus stable pour demarrer.

### Risque R3 — Logique metier dispersee

Si les prerequis, penalites et reprises sont codes directement dans les controllers ou le frontend, le produit deviendra fragile.

Parade : services domaine testes hors HTTP, controllers minces.

### Risque R4 — Frontend construit avant API stable

Une UI trop avancee avant les contrats API risque de produire des donnees fictives difficiles a remplacer.

Parade : UI statique courte pour donner la direction, puis integration par flux P0.

### Risque R5 — Audit incomplet

La promesse produit inclut une tracabilite totale. Sans audit des le debut, il faudra retrofitter les actions critiques.

Parade : creer `ActivityLogService` des les premiers CRUD admin.

### Risque R6 — Pollution de l'hote et resultats non reproductibles

Si `npm`, `npx`, Prisma, le backend ou le frontend sont executes sur l'hote, les resultats dependront des versions installees localement et pourront diverger du devcontainer.

Parade : l'hote pilote uniquement Docker et l'ouverture du devcontainer. Toutes les commandes projet passent par le terminal du devcontainer, et la documentation doit montrer cette convention comme chemin unique.

---

## 10. Definition of Done V1

La V1 est acceptable quand :

- Un administrateur peut creer un programme complet depuis l'interface.
- Un plan est rattache a un seul programme.
- Des modules et sujets peuvent etre ordonnes.
- Des prerequis peuvent verrouiller un sujet.
- L'apprenant voit une session du jour.
- L'apprenant peut demarrer et cloturer une session.
- Une validation de sujet debloque correctement la suite.
- Une session manquee genere une penalite historisee.
- Une interruption peut etre reprise sans perdre le contexte.
- Les actions critiques sont journalisees.
- Backend et frontend buildent sans erreur dans le devcontainer.
- Les tests couvrent les flux critiques du MVP.

---

## 11. Prochaine action recommandee

Commencer par la Phase 0. Tant que la base technique n'est pas verte, toute fonctionnalite ajoutee risque d'augmenter la dette et de masquer les vrais blocages.

Ordre immediat :

1. Ouvrir `platform/` dans VS Code.
2. Lancer `Dev Containers: Reopen in Container` puis utiliser le terminal integre du conteneur.
3. Corriger Prisma et le build backend dans le devcontainer.
4. Corriger le build frontend sans dependance reseau dans le devcontainer.
5. Aligner le port backend sur `3001`.
6. Creer la migration initiale et le seed.
7. Implementer le premier vertical slice : creation programme -> plan -> module -> sujet.
