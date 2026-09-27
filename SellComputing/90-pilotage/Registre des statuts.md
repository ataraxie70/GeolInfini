---
projet: "SellComputing"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 6
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - SellComputing
  - pilotage
  - statuts
---

# Registre des statuts

Table de référence de tout ce que le projet affirme. Une affirmation absente de ce registre n'a **aucun statut**.

| Statut | Sens | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Position de conception assumée | Se respecte ou s'abandonne explicitement |
| **Possibilité** | Trajectoire ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au journal | Engage |

---

## 1. Faits — établis et vérifiables

Tous vérifiés le 2026-09-09 par inspection directe du corpus.

| # | Fait | Comment il a été établi |
| --- | --- | --- |
| `F1` | Le corpus a été produit en **trois moments sur deux mois** : le 2026-06-10 de 12 h 46 à 19 h 18, le 2026-07-01 de 16 h 52 à 21 h 39, et le 2026-08-10 à 21 h 23 pour l'archivage. **Seul corpus hérité du coffre à ne pas avoir été produit en une séance** | Horodatages, relevés fichier par fichier |
| `F2` | **Trois noms coexistent** — *Sell Computing* dans l'index documentaire, *cell computing* dans les noms de fichiers, *Project Atlas* dans le dossier de fondation d'entreprise — et le corpus ne signale nulle part qu'il en change | Lecture des trois ensembles |
| `F3` | **Les trois moments ne traitent pas le même objet** : un site de vente conseillée, puis une entreprise sous cadre TOGAF phase 0, puis une méthodologie générale d'architecture dont le commerce devient un cas d'étude | Comparaison des objets déclarés |
| `F4` | La bascule vers la méthodologie générale est écrite **dix-sept minutes** après l'achèvement du dossier de fondation d'entreprise — 21 h 22, puis 21 h 39 | Horodatages |
| `F5` | La **série normalisée** de douze documents du 10 juin est **trois à quatre fois plus courte** que les documents qu'elle normalise : le modèle de domaine passe de 7 396 à 2 683 octets, l'architecture applicative de 7 924 à 2 418 octets. Son index recommande pourtant de la lire seule | Comparaison des tailles et des contenus |
| `F6` | **Aucun doublon strict** dans les 42 fichiers. Les redondances apparentes sont des **condensations**, non des copies | Comparaison par empreinte SHA-256, fichier à fichier |

> [!danger] Ce que `F1`, `F3` et `F4` établissent ensemble
> Le projet a changé **trois fois d'échelle en trois semaines**, et **aucune preuve nouvelle n'accompagne ces changements** : les trois ensembles ne citent ni entretien, ni mesure, ni concurrent.
> Une échelle qui croît sans preuve qui croît est le signe qu'une conception tourne sur elle-même. **Le fait est daté et vérifiable ; son interprétation ne l'est pas** — une seconde lecture reste ouverte, celle d'une ambition qui se précise. Le dossier ne les départage pas.

---

## 2. Hypothèses — à instruire

Le corpus n'énonce aucune hypothèse comme telle. Celles qui suivent sont **formées par la reprise** en lisant ce qu'il tient pour acquis.

| # | Hypothèse | Origine dans le corpus | Ce qui l'invaliderait |
| --- | --- | --- | --- |
| `H1` | L'acheteur a **peur de mal choisir** son matériel informatique | Positionnement du projet, point 1 | Que les acheteurs interrogés décrivent un achat rapide et sans anxiété |
| `H2` | L'acheteur a **peur du reconditionné** | Idem | Idem |
| `H3` | L'acheteur a **peur de payer pour une marque** au lieu d'acheter de la performance | Idem | Idem |
| `H4` | Un **questionnaire de six à dix questions** produit une recommandation qu'un acheteur juge meilleure que l'avis d'un vendeur en boutique | Fonctionnalité A du corpus | Que les acheteurs préfèrent un interlocuteur humain, ce que la vente de matériel informatique rend plausible |
| `H5` | Une plateforme de **conseil** se distingue durablement d'un comparateur de prix ou d'un catalogue enrichi | Positionnement | Qu'un comparateur existant fournisse déjà la recommandation expliquée |
| `H6` | Le projet a **une échelle unique** : le site de vente, l'entreprise et la méthodologie sont trois vues d'un même objet | Implicite dans le corpus, jamais énoncé | Qu'ils n'aient ni le même bénéficiaire, ni le même payeur, ni le même mode de preuve — ce que la reprise tient pour probable |

> [!warning] `H6` est le préalable, et il n'est pas de second rang
> Un programme d'études ne peut pas porter les trois objets à la fois. Tant que `H6` n'est pas tranchée, tout lot écrit vise une cible indéterminée.

**Sujet absent du corpus, et porté ici comme hypothèse à instruire :**

| # | Hypothèse | Pourquoi elle manque au dossier |
| --- | --- | --- |
| `H7` | Le projet peut **s'approvisionner** en matériel informatique à une marge soutenable | Le corpus conçoit une plateforme de vente sans jamais aborder l'approvisionnement, le stock, la marge ni la garantie |

---

## 3. Principes de conception — assumés, non prouvés

| # | Principe | Origine |
| --- | --- | --- |
| `P1` | **Vendre un besoin, un niveau de performance et une recommandation expliquée** — non une marque, une fiche technique ou une promotion | Positionnement, point 2 |
| `P2` | Le site fonctionne d'abord comme un **assistant de décision**, puis comme une boutique | Idem |
| `P3` | La recommandation est **expliquée** : l'acheteur doit comprendre pourquoi une machine lui est proposée | Promesse du corpus |

Ces trois principes sont cohérents entre eux et avec les trois peurs revendiquées. **C'est la partie la plus solide du dossier**, et elle tient en une page du premier moment.

---

## 4. Possibilités — ouvertes, jamais sélectionnées

**Échelle du projet** — site de vente conseillée · entreprise sous cadre TOGAF · méthodologie générale d'architecture avec le commerce pour cas d'étude. Trois possibilités, aucune sélectionnée.

**Usages visés par le questionnaire** — bureautique, programmation, jeu vidéo, montage vidéo, étudiant. Cinq profils énumérés dans le corpus, aucun désigné comme premier.

**Périmètre produit** — ordinateurs, accessoires audio, services techniques. Trois lignes énoncées par l'index documentaire, aucune priorisée.

---

## 5. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[SellComputing/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 3 — `DEC-C-070` à `DEC-C-072` | Idem |
