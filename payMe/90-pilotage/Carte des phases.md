---
projet: "payMe"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 4
cree_le: 2026-09-09
tags:
  - payMe
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
| **Études** | `10-etudes` | **Ouverte** le 2026-09-09 — `DEC-C-069` | Le corpus hérité **est** une étude ; refuser d'ouvrir la phase ignorerait un travail qui lui appartient |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | **Jalon 3** du programme d'études |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un segment initial désigné et un modèle économique arrêté |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le chemin, et sa contrainte de calendrier

```
INTENTION
   v
ÉTUDE  —  vague 0 : taxonomie du retrait (L0), état de connexion (L1)
   |        SEIZE HEURES  —  À CONDUIRE AVANT LE 30 SEPTEMBRE 2026
   |
   +--- JALON 1 -----> arrêt possible du projet
   |                   question unique : le retrait subi par absence d'acceptation
   |                   représente-t-il au moins un quart des retraits ?
   v
ÉTUDE  —  vague 1 : éligibilité (L2), rétention (L3), régime réglementaire (L4)
   |
   +--- JALON 2 -----> arrêt si la valeur ne reste pas dans le circuit
   v
ÉTUDE  —  vague 2 : actif (L5), payeur (L6)
   |
   +--- JALON 3 -----> ouverture du cadrage stratégique
   v
CADRAGE STRATÉGIQUE  ->  DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

> [!danger] Le seul projet du coffre dont le calendrier soit contraint de l'extérieur
> Le **30 septembre 2026**, la connexion à la plateforme régionale de paiements instantanés devient obligatoire pour les banques, les émetteurs de monnaie électronique et les établissements de paiement.
> La cause `A` du retrait subi — *« la personne est sur un autre opérateur »* — disparaît à cette date. **Une mesure conduite avant et une mesure conduite après ne répondent pas à la même question.**

---

## 3. Ce que le corpus hérité contient, et où il va

Contrairement aux autres projets du coffre, le corpus de `payMe` **ne déborde pas** sur les phases aval.

| Élément du corpus | Phase concernée | Traitement |
| --- | --- | --- |
| Étude stratégique de déconstruction du secteur | `10-etudes` | **Reprise** dans le programme d'études : ses faits sont reportés au registre des statuts, ses hypothèses deviennent des lots |
| Addendum de correction | `10-etudes` | Idem. Sa correction sur l'expérience déléguée aux participants est le fait `F3` |
| Révision du plan de preuve | `10-etudes` | Idem. Sa taxonomie du retrait devient l'instrument du lot `L0` |

Aucun document du corpus ne relève de `20` à `60`. **C'est le seul corpus hérité du coffre dont ce soit le cas.**

---

## 4. Renvois

- [[payMe/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention abandonnée, la correction, la position qui survit
- [[payMe/10-etudes/Programme d'études\|Programme d'études]] — sept lots, trois jalons, l'échéance du 30 septembre
- [[payMe/90-pilotage/Journal des décisions\|Journal des décisions]] — trois décisions de coffre, aucune décision de projet
- [[payMe/90-pilotage/Registre des statuts\|Registre des statuts]] — huit faits sourcés, cinq hypothèses avec critère de mort
- [[payMe/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
