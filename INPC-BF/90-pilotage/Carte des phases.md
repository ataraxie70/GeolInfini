---
projet: "INPC-BF"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 3
cree_le: 2026-09-09
tags:
  - INPC-BF
  - pilotage
  - phases
---

# Carte des phases

> [!important] Un dossier de phase n'est créé que lorsque la phase s'ouvre réellement
> Les phases aval sont décrites ici, mais leurs dossiers n'existent pas. **Chaque ouverture de phase est une décision à inscrire au journal.**

---

## 1. État des phases

| Phase | Dossier | État | Ce qui conditionne son ouverture |
| --- | --- | --- | --- |
| **Intention** | `00-intention` | **Ouverte** le 2026-09-09, **sous réserve d'incomplétude** | Entrée du projet au coffre |
| **Études** | `10-etudes` | **Non créée** | Le préalable du point 2, puis l'écriture d'un programme d'études |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | Le dernier jalon de ce programme |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Une autorité de validation constituée et un rattachement institutionnel arrêté |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le préalable, qui précède le chemin

```
RETROUVER OU RECONSTITUER LES TROIS DOCUMENTS ABSENTS
   charte fondatrice · référentiel conceptuel · taxonomie
   |
   +--- s'ils sont retrouvés -----> reprendre le document d'intention sur sources directes
   |
   +--- s'ils sont introuvables --> leur reconstitution devient le premier lot d'étude,
                                    conduite en sachant qu'elle réinvente au lieu de restituer
   v
INTENTION
   v
ÉTUDE  —  à ouvrir : le programme reste à écrire
   |        questions obligatoires : les détenteurs veulent-ils être documentés (H1),
   |        deux légitimités de validation sont-elles conciliables (H2),
   |        l'ouverture est-elle conciliable avec les savoirs réservés (H3),
   |        le dispositif survit-il à ses fondateurs (H4)
   +--- JALONS ------> arrêt ou changement de nature du projet
   v
CADRAGE STRATÉGIQUE  ->  DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

---

## 3. Ce que le corpus hérité contient, et où il ne va pas

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Charte de gouvernance et d'éthique, charte d'ancrage institutionnel | `20-cadrage-strategique` | Elles répondent à trois des six manques de l'audit sans qu'aucune enquête ne les fonde. La composition de l'autorité de validation reste énumérée, non arrêtée |
| Ontologie en six parties | `30-ddd-strategique` | Elle formalise les relations entre des objets définis par un **référentiel conceptuel absent du corpus** |
| Cartographie stratégique en contextes bornés | `30-ddd-strategique` | Produite sur ce même socle incomplet |
| Quatre modèles tactiques — patrimoine et connaissance, gouvernance et validation, consentement et droits, accès | `40-ddd-tactique` | Ils modélisent des règles qui n'ont jamais été confrontées à une communauté détentrice |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-066`. Ces éléments redeviennent exigibles après le dernier jalon du programme d'études, et seront alors réinstruits, non promus.

---

## 4. Renvois

- [[INPC-BF/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention reconstituable, et la réserve d'incomplétude
- [[INPC-BF/90-pilotage/Journal des décisions\|Journal des décisions]] — deux décisions de coffre, aucune décision de projet
- [[INPC-BF/90-pilotage/Registre des statuts\|Registre des statuts]] — six faits, quatre hypothèses, quatre principes
- [[INPC-BF/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact, empreinté, incomplet
