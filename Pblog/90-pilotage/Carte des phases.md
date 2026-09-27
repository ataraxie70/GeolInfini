---
projet: "Pblog"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 3
cree_le: 2026-09-09
tags:
  - Pblog
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
| **Études** | `10-etudes` | **Non créée** | Les trois mesures du point 3, puis l'écriture d'un programme d'études |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | Le dernier jalon de ce programme |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un public premier désigné |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée. **Le produit est pourtant construit et publié** | Une architecture décidée et journalisée — voir le point 2 |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le cas particulier de ce projet : un produit existe, et la phase reste fermée

> [!warning] Un produit construit ne franchit aucune phase
> Le site existe : sept pages, un espace d'administration, quatre contenus, un formulaire de contact, huit enregistrements de code, une version construite. Faits `F2` à `F4`.
> **Ouvrir `60-implementation` afficherait comme franchies les cinq phases qui la précèdent, dont aucune ne l'est.** Un produit construit prouve qu'il était possible de le construire ; il ne prouve ni que le problème existe, ni qu'un bénéficiaire le reconnaisse, ni que la position soit défendable.
> Cette fermeture n'est pas une dévalorisation du travail accompli. Elle établit seulement que la chaîne de conception n'a pas été parcourue, et que le produit existant est **un prototype de fait**, non l'aboutissement d'une conception instruite.

---

## 3. Le chemin, et son raccourci propre

```
MESURER CE QUI EXISTE DÉJÀ     <- gratuit, immédiat, sans autorisation
   1. le site est-il lu ?               -> H1
   2. produit-il un contact ?           -> H2
   3. l'entretien est-il soutenable ?   -> H4  [peut prononcer l'arrêt]
   v
INTENTION  (le document fondateur, à reprendre une fois ces mesures faites)
   v
ÉTUDE  —  à ouvrir : le programme reste à écrire, et il partira de mesures réelles
   |
   +--- JALONS ------> arrêt possible du projet
   v
CADRAGE STRATÉGIQUE  ->  DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

> [!important] Une situation unique dans le coffre
> Tous les autres projets doivent **dépenser** pour obtenir leur première preuve — un entretien, un déplacement, un recrutement. Ici, le produit étant publié, une preuve de niveau 1 — un comportement observé — est disponible **immédiatement et gratuitement**.
> C'est l'avantage que la construction a créé, et il n'a pas encore été employé.

---

## 4. Ce que le corpus hérité contient, et où il ne va pas

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Document de cadrage produit du 2026-04-18 | `00-intention` | **Repris** dans le document fondateur, avec le statut de chaque affirmation |
| Dossier de fondation, neuf documents — exploration de la vision, analyse du problème, carte des parties prenantes, contexte stratégique, définition du système, fondation d'architecture, carte des capacités, découverte produit, évaluation d'aptitude | `20-cadrage-strategique` | Produits en quarante-quatre minutes, sans aucune enquête, aucun bénéficiaire interrogé, aucun état de l'art |
| Cycle d'architecture, phase A — vision et transition | `20` à `30` | Idem |
| Phase B — modèle de processus métier, analyse de la chaîne de valeur | `30-ddd-strategique` | Idem |
| Phase C — architecture de données, architecture applicative | `40` à `50` | Idem |
| Phase D — plan d'infrastructure, pile technique | `50-architecture` | Idem |
| Le site construit et publié | `60-implementation` | Voir le point 2 |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-079`. Ces éléments redeviennent exigibles après le dernier jalon du programme d'études, et seront alors réinstruits, non promus.

---

## 5. Renvois

- [[Pblog/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention, le recouvrement, ce qui a été construit
- [[Pblog/90-pilotage/Journal des décisions\|Journal des décisions]] — quatre décisions de coffre, aucune décision de projet
- [[Pblog/90-pilotage/Registre des statuts\|Registre des statuts]] — sept faits, cinq hypothèses, quatre principes
- [[Pblog/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
