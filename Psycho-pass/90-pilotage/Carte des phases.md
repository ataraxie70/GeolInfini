---
projet: "Psycho-pass"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 4
cree_le: 2026-09-09
tags:
  - Psycho-pass
  - pilotage
  - phases
---

# Carte des phases

Le projet parcourt la chaîne de conception dans l'ordre. Le corpus hérité l'a parcourue à l'envers, du cahier des charges vers le code, en deux séances.

> [!important] Un dossier de phase n'est créé que lorsque la phase s'ouvre réellement
> Les phases aval sont décrites ici, mais leurs dossiers n'existent pas. Un dossier `60-implementation` créé d'avance afficherait la construction comme acquise alors qu'elle ne l'est pas. **Chaque ouverture de phase est une décision à inscrire au journal.**

---

## 1. État des phases

| Phase | Dossier | État | Ce qui conditionne son ouverture |
| --- | --- | --- | --- |
| **Intention** | `00-intention` | **Ouverte** le 2026-09-09 | Entrée du projet au coffre |
| **Études** | `10-etudes` | **Ouverte** le 2026-09-09 — `DEC-C-060` | Existence d'un document d'intention |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | **Jalon 3** du programme d'études |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un bénéficiaire nommé et un marché initial désigné |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 — `DEC-C-059` | Existence d'un corpus antérieur |

---

## 2. Le chemin, et les points où il peut s'interrompre

```
INTENTION
   v
ÉTUDE  —  vague 0 : arrêt du travail, cimetière, origine du contenu
   |
   +--- JALON 1 -----> arrêt possible du projet
   |
ÉTUDE  —  vague 1 : bénéficiaire, usage réel, coût de l'adaptativité
   |
   +--- JALON 2 -----> reformulation de l'intention si la différence ne tient pas
   |
ÉTUDE  —  vague 2 : actif, payeur, relation à levelup, nom
   |
   +--- JALON 3 -----> ouverture du cadrage stratégique
   v
CADRAGE STRATÉGIQUE
   v
DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

Le jalon 1 est atteignable en trois à quatre semaines, sans aucune dépense de terrain. C'est le point le moins cher du programme, et celui qui décide le plus.

---

## 3. Ce que le corpus hérité contient, et où il ne va pas

Le corpus porte des éléments qui relèveraient des phases `30` à `60`. Ils ne les ouvrent pas.

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Cinq RFC, dont l'architecture globale et le moteur de test | `50-architecture` | Produits avant toute étude, sans état de l'art ni source psychométrique |
| Schéma de données Prisma, six modèles | `40-ddd-tactique` | Un modèle de données n'est pas un modèle de domaine, et aucun invariant n'est énoncé |
| Deux documents de règles obligatoires, backlog technique | `60-implementation` | Ils règlent l'exécution d'un produit dont l'objet n'est pas établi |
| Treize fichiers source, dépôt sans commit | `60-implementation` | Le travail s'est arrêté au premier module métier — faits `F2` à `F4` |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-059`. Verser ces éléments en phases aval afficherait comme acquis un chemin que le projet n'a pas parcouru. Ils redeviennent exigibles **après le jalon 3**, et seront alors réinstruits, non promus.

---

## 4. Renvois

- [[Psycho-pass/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention, la thèse et son démenti partiel, ce qui n'est pas décidé
- [[Psycho-pass/10-etudes/Benchmark et état de l'art\|Benchmark et état de l'art]] — le lot préalable, conduit
- [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] — les dix lots, les trois jalons, l'ordre de renoncement
- [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] — l'analyse du recouvrement
- [[Psycho-pass/90-pilotage/Journal des décisions\|Journal des décisions]] — les cinq décisions de coffre, et l'absence de décision de projet
- [[Psycho-pass/90-pilotage/Registre des statuts\|Registre des statuts]] — les douze faits, les six hypothèses, les trois principes
- [[Psycho-pass/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
