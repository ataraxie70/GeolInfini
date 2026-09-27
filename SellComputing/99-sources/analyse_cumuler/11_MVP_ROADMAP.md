# 11 — Feuille de route MVP

## 1. Principe de séquencement

Le séquencement doit respecter l’ordre suivant :

1. cadrage ;
2. modèle métier ;
3. modèle de données ;
4. architecture applicative ;
5. UX/UI ;
6. API ;
7. sécurité ;
8. implémentation MVP.

## 2. MVP cible

### Fonctionnalités indispensables

- accueil ;
- questionnaire de recommandation ;
- résultats recommandés ;
- catalogue ;
- fiche produit ;
- comparaison ;
- filtres ;
- reconditionné ;
- demande de maintenance ;
- contenu conseil ;
- authentification ;
- administration minimale.

### Fonctionnalités reportées

- notifications complexes ;
- analytics avancé ;
- personnalisation fine ;
- automatisation marketing ;
- extension mobile native.

## 3. Ordre d’implémentation

| Phase | Contenu |
|---|---|
| Phase 1 | domaine, données, auth, catalogue minimal |
| Phase 2 | recommandation, comparaison, filtrage |
| Phase 3 | reconditionné, maintenance, contenus |
| Phase 4 | administration, audit, observabilité |
| Phase 5 | durcissement sécurité, optimisation, extension |

## 4. Livrables avant codage

- vision consolidée ;
- périmètre validé ;
- DDD ;
- ERD ;
- architecture applicative ;
- UX/UI ;
- API ;
- exigences non fonctionnelles ;
- backlog MVP.

## 5. Découpage de livraison

### Lot A — socle

- authentification ;
- structure projet ;
- base de données ;
- catalogue.

### Lot B — valeur métier

- moteur de recommandation ;
- comparaison ;
- filtres.

### Lot C — confiance

- reconditionné ;
- contenus ;
- maintenance.

### Lot D — opération

- administration ;
- audit ;
- supervision ;
- sauvegarde.

## 6. Définition de prêt-à-coder

Le dossier est prêt pour le codage lorsque :

- le périmètre est figé ;
- les entités sont stabilisées ;
- les frontières de contexte sont définies ;
- les endpoints sont contractés ;
- les invariants sont écrits ;
- les cas d’erreur sont définis ;
- les priorités MVP sont établies.

## 7. Point final

Le projet peut alors être traduit en implémentation sans ambiguïté majeure.
