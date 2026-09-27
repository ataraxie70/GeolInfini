# Feuille de route prioritaire

## Objectif

Faire de LevelUP un MVP local fiable pour piloter l'apprentissage avec discipline:
- pre-requis respectes ;
- seances tracees ;
- validations strictes ;
- revisions automatiques ;
- vue immediate sur la progression.

## Etat de depart

Le projet couvre deja le coeur du MVP:
- backend FastAPI + SQLAlchemy + SQLite ;
- frontend React/Vite relie a l'API ;
- logique de blocage par pre-requis ;
- validations avec preuve minimale ;
- revisions automatiques ;
- tableau de bord simple.

Les manques principaux sont:
- environnement backend fragile ;
- absence de tests ;
- absence de documentation operative ;
- UI encore tres orientee saisie brute ;
- modules projets / notifications / historique non implementes.

## Priorite 0 — Stabilisation technique

But: rendre le projet executable et predicible.

Travaux:
- fiabiliser le chemin de la base SQLite ;
- corriger la venv backend ;
- documenter les commandes de lancement ;
- figer la version Python cible ;
- nettoyer les artefacts ambigus.

Definition de fini:
- backend demarre sans ambiguite ;
- la meme base est utilisee quel que soit le dossier de lancement ;
- frontend build sans erreur ;
- procedure locale simple et reproductible.

## Priorite 1 — Verrouiller le coeur metier

But: garantir que la discipline pedagogique est robuste.

Travaux:
- ajouter des tests sur les pre-requis bloquants ;
- tester les transitions de statuts des sujets ;
- tester la validation stricte ;
- tester la creation automatique des revisions 24h / 7j / 30j ;
- tester les cas de retard et completion des revisions.

Definition de fini:
- les regles critiques sont protegees par tests ;
- aucune regression silencieuse sur les statuts ;
- le dashboard reflete correctement les etats reels.

## Priorite 2 — Completer le flux operatoire MVP

But: couvrir tout le cycle reel d'une seance.

Travaux:
- exposer dans le frontend la cloture de seance ;
- exposer la completion de revision ;
- permettre de filtrer par statut, sous-domaine et blocage ;
- afficher clairement les sujets bloques et pourquoi ;
- montrer les sessions recentes et les ecarts entre prevu et realise.

Definition de fini:
- un utilisateur peut creer, executer, cloturer, valider puis reviser sans sortir de l'UI ;
- les blocages sont visibles ;
- les actions prioritaires sont evidentes.

## Priorite 3 — Historique et tracabilite

But: coller davantage au cahier des charges sans gonfler trop vite le scope.

Travaux:
- introduire un journal d'activite minimal ;
- historiser les changements d'etat importants ;
- conserver les notes de seance de maniere plus structuree ;
- preparer un export simple JSON ou CSV.

Definition de fini:
- on peut reconstituer ce qui a ete fait ;
- les changements critiques laissent une trace ;
- l'historique devient consultable.

## Priorite 4 — Module projet

But: relier apprentissage et production concrete.

Travaux:
- modeles `projects` et `project_subjects` ;
- CRUD projet minimal ;
- liaison sujets requis ↔ projet ;
- blocage d'avancement si sujets requis non valides.

Definition de fini:
- un projet peut servir de sortie concrete du parcours ;
- les dependances pedagogiques restent respectees.

## Priorite 5 — Notifications locales

But: rappeler sans complexifier l'architecture.

Travaux:
- badges et alertes dans l'interface ;
- surfacer revisions dues, retards et validations a finaliser ;
- preparer une couche d'extension pour notifications navigateur plus tard.

Definition de fini:
- les urgences sont visibles sans action manuelle ;
- aucune dependance externe n'est necessaire.

## Ordre de mise en oeuvre recommande

1. stabilisation technique ;
2. tests du coeur metier ;
3. completion du flux operatoire MVP ;
4. historique minimal ;
5. module projet ;
6. notifications locales ;
7. ergonomie avancee et raffinements visuels.

## Risques a traiter en premier

- venv backend incoherente entre Python 3.13 et 3.14 ;
- absence totale de tests ;
- base SQLite dependante du dossier de lancement ;
- ecart entre endpoints backend disponibles et UI exposee ;
- absence de contexte projet persistant dans `docs/`.
