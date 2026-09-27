# Psycho-Pass — Pack pédagogique complet

Ce dossier est un guide d’apprentissage et d’exécution pour un développeur junior qui découvre le projet Psycho-Pass.

## Ce que contient ce pack

- une lecture guidée du projet ;
- un lexique des termes techniques ;
- la stack et le rôle de chaque brique ;
- les conventions de travail ;
- le chemin de production du code ;
- le fonctionnement du backend ;
- le fonctionnement du frontend ;
- la base de données et Prisma ;
- les tests, la qualité et la sécurité ;
- le déploiement et l’exploitation ;
- des checklists et exercices de montée en niveau.

## Comment lire ce pack

Ordre conseillé :

1. `00_README_INDEX.md`
2. `01_lexique_du_projet.md`
3. `02_vision_densemble_et_objectifs.md`
4. `03_stack_outillage_et_conventions.md`
5. `04_arborescence_recommandee_et_flux_de_travail.md`
6. `05_base_de_donnees_prisma_postgresql.md`
7. `06_backend_nestjs_pas_a_pas.md`
8. `07_frontend_nextjs_pas_a_pas.md`
9. `08_tests_qualite_securite_et_ci_cd.md`
10. `09_deploiement_exploitation_et_livraison.md`
11. `10_checklists_exercices_et_rituels_equipe.md`

## Objectif de niveau

À la fin de cette lecture, un développeur junior doit pouvoir :
- comprendre le vocabulaire du projet ;
- expliquer l’architecture globale ;
- coder une fonctionnalité simple sans casser les conventions ;
- savoir où mettre la logique métier ;
- savoir comment tester ;
- savoir comment préparer une livraison ;
- savoir ce qui doit rester côté backend ;
- savoir ce qui doit rester côté frontend.

## Philosophie générale

Le principe clé du projet est simple :

**le frontend affiche, le backend décide.**

Cela signifie :
- le frontend gère l’interface, l’expérience et la navigation ;
- le backend gère les règles métier, la sécurité et les calculs critiques ;
- la base de données stocke la vérité persistée ;
- les tests protègent la stabilité du produit ;
- la CI empêche de livrer du code fragile ;
- le déploiement doit être reproductible.

## Rappel d’usage

Ce pack est un support pédagogique et opérationnel.
Il ne remplace pas les RFC et les documents de cadrage du dépôt.
Il les transforme en parcours d’apprentissage concret.
