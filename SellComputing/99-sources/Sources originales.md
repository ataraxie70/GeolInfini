---
projet: "SellComputing"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — aucun document n'est opposable"
empreinte: "463bb8aaca41f470020d43f2a0739e00d15ea84f2a16256db996d399b51c42ed"
cree_le: 2026-09-09
tags:
  - SellComputing
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `SellComputing` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-072` au [[SellComputing/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Emplacement | Fichiers | Nature |
| --- | --- | --- |
| `analyse_cumuler/` | 25 | **Premier moment.** Le corpus détaillé du site de vente conseillée, plus sa condensation en douze documents numérotés, plus un fichier Word de livrables |
| `analyse_conception_objectif/` | 15 | **Deuxième moment.** Le dossier *Part I — Enterprise Foundation* de **Project Atlas**, en anglais, sous cadre TOGAF, plus son archive du 2026-08-10 |
| `Knowledge-Centric Enterprise Architecture (KCEA)/` | 1 | **Troisième moment.** La proposition de séparer une méthodologie générale du projet lui-même |
| `analyse_cumuler.zip` | 1 | Archive du premier ensemble |
| **Total** | **42** | **423 Ko** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
463bb8aaca41f470020d43f2a0739e00d15ea84f2a16256db996d399b51c42ed
```

**Deux fichiers d'échange d'éditeur `.kate-swp` ont été sortis du coffre** avant ce calcul — `DEC-C-071`. Ce sont des artefacts temporaires, non des documents ; ils sont conservés hors du coffre et n'ont pas été détruits.

---

## 2. Chronologie — trois moments, et non trois versions

> **C'est le seul corpus hérité du coffre à ne pas avoir été produit en une séance.** Il s'étale sur deux mois.

| Moment | Fenêtre | Ce qui y est produit | Nom employé |
| --- | --- | --- | --- |
| **1** | **2026-06-10**, 12 h 46 → 18 h 24 | Le corpus détaillé : positionnement, cahier des charges, modèle de domaine, deux versions du schéma entité-relation, architecture applicative, spécification des interfaces, cahier des charges technique, backlog technique, dossier consolidé | *Sell Computing*, *cell computing* |
| **1 bis** | **2026-06-10**, 18 h 24 → 19 h 18 | La **condensation** du précédent en douze documents numérotés de `00_INDEX` à `11_MVP_ROADMAP` | Idem |
| **2** | **2026-07-01**, 16 h 52 → 21 h 22 | Le dossier de fondation d'entreprise sous cadre TOGAF : charte, énoncé du problème, vision, mission, identité, modèle conceptuel, modèle de décision, principes, proposition de valeur, parties prenantes, contexte, hypothèses et contraintes, modèle de connaissance | ***Project Atlas*** |
| **3** | **2026-07-01**, 21 h 39 | La proposition de séparer une **méthodologie générale d'architecture** du projet, ce dernier devenant un cas d'étude | *KCEA* |
| **4** | **2026-08-10**, 21 h 23 | Archivage du deuxième ensemble | — |

### 2.1. L'escalade de périmètre, datée à la minute

Les trois moments **ne traitent pas le même objet** : un site de vente conseillée, puis une entreprise, puis une méthode applicable à *« toute entreprise dont la connaissance est l'actif principal »*.

La dernière bascule est écrite **dix-sept minutes** après l'achèvement du dossier de fondation d'entreprise — 21 h 22, puis 21 h 39.

> [!danger] L'ambition croît, la preuve ne croît pas
> Aucun des trois ensembles ne cite un entretien, une mesure, un état de l'art ou un concurrent. Le corpus change trois fois d'échelle en trois semaines **sans qu'aucun élément nouveau ne l'y conduise**.
> Deux lectures restent ouvertes, et le dossier ne les départage pas : une conception qui monte en généralité faute de contact avec le terrain, ou une intuition d'architecture qui se dégage d'un cas particulier. Le fait est daté ; son interprétation ne l'est pas.

### 2.2. Un numéro manque dans la série de fondation

Le dossier *Part I — Enterprise Foundation* est numéroté de `00` à `11`, puis saute à `13`. **Le document `12` n'existe pas dans l'archive.** Rien n'indique s'il a été écrit puis retiré, ou jamais écrit.

---

## 3. La condensation n'est pas une copie, et elle coûte

**Aucun doublon strict** n'existe dans les 42 fichiers : la comparaison par empreinte, fichier à fichier, le confirme. Les redondances apparentes sont des **condensations**.

| Sujet | Version détaillée | Version normalisée | Rapport |
| --- | --- | --- | --- |
| Modèle de domaine | 7 396 octets | 2 683 octets | **2,8 fois plus court** |
| Architecture applicative | 7 924 octets | 2 418 octets | **3,3 fois plus court** |
| Modèle de données | 8 804 octets | 3 665 octets | **2,4 fois plus court** |

L'index de la série normalisée recommande de la lire seule, et dans son ordre.

> [!warning] Règle de citation propre à ce dossier
> Toute reprise du corpus doit indiquer **si elle cite la version détaillée ou la version normalisée**, car elles ne disent pas la même chose avec la même précision. Une citation qui ne le dit pas est trompeuse.

---

## 4. Ce que le corpus établit, et ce qu'il ne prouve pas

**Établi** : une conception détaillée existe, à trois échelles. Un positionnement clair et cohérent — vendre un besoin et une recommandation expliquée plutôt qu'une marque et une fiche technique. Un modèle de domaine, un modèle de données en deux versions, une architecture applicative, des contrats d'interface, un backlog technique exécutable.

**Non prouvé** : que les trois peurs revendiquées existent chez un acheteur réel, qu'un questionnaire vaille mieux qu'un vendeur en boutique, qu'un acteur n'occupe pas déjà le terrain.

**Absent** : l'approvisionnement. Le corpus conçoit une plateforme de vente sans jamais dire qui vend, où, à quel stock, à quelle marge et avec quelle garantie. Pour un commerce de matériel informatique, c'est la question qui décide de la viabilité avant toute autre.

---

## 5. Règles de ce dossier

1. **Rien ne s'édite ici.**
2. **Le corpus n'est pas opposable.** Y trouver un modèle de domaine, une architecture ou une feuille de route ne rend rien décidé.
3. **Toute citation porte son chemin, son moment et sa version** — détaillée ou normalisée. Les trois moments ne traitent pas le même objet ; citer sans dire lequel parle rend la citation fausse.
4. **Les trois ensembles ne sont pas fusionnés.** Les réorganiser effacerait l'escalade de périmètre que leur séparation rend visible, laquelle est un fait du dossier.
