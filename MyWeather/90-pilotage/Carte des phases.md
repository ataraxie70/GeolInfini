---
projet: "MyWeather"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 3
cree_le: 2026-09-09
tags:
  - MyWeather
  - pilotage
  - phases
---

# Carte des phases

> [!important] Un dossier de phase n'est créé que lorsque la phase s'ouvre réellement
> **Chaque ouverture de phase est une décision à inscrire au journal.**

---

## 1. État des phases

| Phase | Dossier | État | Ce qui conditionne son ouverture |
| --- | --- | --- | --- |
| **Intention** | `00-intention` | **Ouverte** le 2026-09-09 | Entrée du projet au coffre |
| **Études** | `10-etudes` | **Non créée** | L'écriture d'un programme d'études |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | Le dernier jalon de ce programme |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un porteur institutionnel et un canal de distribution arrêtés |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée. **Un socle de code existe déjà hors du coffre ; il ne vaut pas ouverture de cette phase** |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le chemin

```
INTENTION  (ouverte)
   v
ÉTUDE  —  à ouvrir : le programme reste à écrire
   |        trois lots s'imposent avant tout autre, aucun ne demande d'autorisation :
   |          1. le terrain est-il libre ?          -> H6
   |          2. les cinq seuils sont-ils fondés ?  -> H1 à H5
   |          3. l'alerte atteint-elle sa cible ?   -> H7  [peut prononcer l'arrêt]
   +--- JALONS ------> arrêt possible du projet
   v
CADRAGE STRATÉGIQUE
   v
DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

L'ordre est celui du coût croissant. Le premier lot est purement documentaire et peut rendre les deux autres inutiles : si un dispositif existant atteint déjà la population visée dans sa langue et par un canal qu'elle emploie, la question des seuils ne se pose plus.

---

## 3. Ce que le corpus hérité contient, et où il ne va pas

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Contexte du projet, glossaire | `00-intention` | **Repris** dans le document fondateur, avec le statut de chaque affirmation |
| Architecture globale, diagramme de composants | `50-architecture` | Produits avant toute étude, sans dispositif existant recensé |
| Pipeline de données, formes brute et traitée, règles de transformation, contrôles de cohérence, guide de simplification | Entre `40` et `50` | La partie la plus substantielle du corpus. Elle conçoit la **production** de l'alerte sans que sa **distribution** ait été instruite |
| Socle de code — 823 lignes de Python | `60-implementation` | **Sorti du coffre** par `DEC-C-074`. Le tableau de bord annoncé et les trois suites de tests n'existent pas |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-075`. Ces éléments redeviennent exigibles après le dernier jalon du programme d'études, et seront alors réinstruits, non promus.

---

## 4. Renvois

- [[MyWeather/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention, les cinq seuils reclassés, l'écart entre l'annonce et l'état
- [[MyWeather/90-pilotage/Journal des décisions\|Journal des décisions]] — trois décisions de coffre, aucune décision de projet
- [[MyWeather/90-pilotage/Registre des statuts\|Registre des statuts]] — six faits, huit hypothèses, trois principes
- [[MyWeather/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
