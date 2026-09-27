---
projet: "SellComputing"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 3
cree_le: 2026-09-09
tags:
  - SellComputing
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
| **Études** | `10-etudes` | **Non créée** | **Trancher l'échelle du projet**, puis écrire un programme d'études |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | Le dernier jalon de ce programme |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un bénéficiaire nommé et un marché initial désigné |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le préalable, qui précède le chemin

```
TRANCHER L'ÉCHELLE
   trois objets sont sur la table, et ils n'ont ni le même bénéficiaire,
   ni le même payeur, ni le même mode de preuve :
     - un site de vente conseillée
     - une entreprise sous cadre TOGAF
     - une méthodologie générale d'architecture
   critère : lequel des trois a un acheteur ?
   v
INTENTION
   v
ÉTUDE  —  à ouvrir : le programme reste à écrire
   |        questions obligatoires : les trois peurs existent-elles (H1-H3),
   |        le questionnaire vaut-il mieux qu'un vendeur (H4),
   |        qui occupe déjà le terrain (H5),
   |        à quelle marge l'approvisionnement est-il possible (H7)
   +--- JALONS ------> arrêt possible du projet
   v
CADRAGE STRATÉGIQUE  ->  DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

---

## 3. Ce que le corpus hérité contient, et où il ne va pas

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Vision, personas, proposition de valeur, principes d'entreprise | `20-cadrage-strategique` | Produits sans aucune enquête, aucun concurrent cité, aucun public interrogé |
| Modèle de domaine, modèle conceptuel d'entreprise | `30-ddd-strategique` | Produits avant toute mesure, et sur un objet dont l'échelle a changé deux fois depuis |
| Modèle de données, deux versions du schéma entité-relation | `40-ddd-tactique` | Un modèle de données n'est pas un modèle de domaine, et aucun invariant n'est énoncé |
| Architecture applicative, cahier des charges technique, contrats d'interface, exigences non fonctionnelles | `50-architecture` | Ils règlent l'exécution d'un produit dont l'objet n'est pas établi |
| Backlog technique exécutable, feuille de route du produit minimal | `60-implementation` | Idem |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-072`. Ces éléments redeviennent exigibles après le dernier jalon du programme d'études, et seront alors réinstruits, non promus.

---

## 4. Renvois

- [[SellComputing/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention, les trois objets, l'escalade datée
- [[SellComputing/90-pilotage/Journal des décisions\|Journal des décisions]] — trois décisions de coffre, aucune décision de projet
- [[SellComputing/90-pilotage/Registre des statuts\|Registre des statuts]] — six faits, sept hypothèses, trois principes
- [[SellComputing/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
