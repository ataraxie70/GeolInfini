---
projet: "INPC-BF"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 6
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - INPC-BF
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
| `F1` | **Le corpus est incomplet.** Il déclare onze documents de fondation conceptuelle et l'archive en contient huit. Manquent la **charte fondatrice**, le **référentiel conceptuel** et la **taxonomie** | Comparaison entre l'énumération portée par `ddd_strategique_bounded_contexts.md` et le contenu de l'archive |
| `F2` | Les trois documents absents sont cités **17, 33 et 34 fois** respectivement par les documents présents | Comptage des occurrences sur les quatorze fichiers |
| `F3` | Les horodatages des quatorze fichiers portent **tous la même valeur**, 2026-08-07 à 14 h 13. La chronologie interne du corpus n'est pas établissable par les dates | Relevé des dates de modification après extraction |
| `F4` | Le corpus contient **son propre audit critique**, qui relève **six manques structurels** : gouvernance non définie comme concept, consentement et savoirs restreints absents, propriété intellectuelle sous-spécifiée, standards d'interopérabilité non mentionnés, cadre juridique burkinabè absent, pérennité concrète non traitée | Lecture de `INPC-BF_audit_vision.md`, point 3 |
| `F5` | **Trois des six manques ont reçu une réponse dans le corpus** : une charte de gouvernance et d'éthique, un contexte borné *Consentement et Droits*, un contexte borné *Accès*, et une charte d'ancrage institutionnel | Présence et contenu des documents correspondants |
| `F6` | **Les référentiels internationaux nommés par l'audit n'apparaissent dans aucun document du corpus** — ni le consentement libre, préalable et éclairé, ni CIDOC-CRM, ni Dublin Core, ni la Convention UNESCO de 2003. Ils ne figurent que dans l'audit lui-même | Recherche sur les quatorze fichiers ; deux occurrences au total, toutes dans l'audit |

> [!important] Ce que `F4` à `F6` établissent ensemble
> Le corpus s'est audité, a **répondu à la moitié de son audit**, et a laissé l'autre moitié sans suite. La partie non traitée n'est pas la moins importante : elle porte sur l'alignement avec les institutions patrimoniales existantes, qui est **l'objectif affiché du projet** — que la taxonomie soit utilisable par un musée, une université ou un laboratoire indépendamment de la plateforme.

---

## 2. Hypothèses — à instruire

Le corpus n'énonce aucune hypothèse comme telle. Celles qui suivent sont **formées par la reprise** en lisant ce que le corpus tient pour acquis.

| # | Hypothèse | Ce qui l'invaliderait |
| --- | --- | --- |
| `H1` | Les détenteurs de savoir **veulent** que leur savoir soit documenté par une infrastructure nationale | Que les détenteurs interrogés refusent la documentation, ou n'acceptent qu'une documentation qu'ils contrôlent entièrement |
| `H2` | Une **autorité de validation** peut être constituée et acceptée à la fois par l'institution académique et par l'autorité coutumière | Que les deux légitimités se révèlent inconciliables sur un cas réel de contradiction entre détenteurs |
| `H3` | Le principe d'**ouverture** est conciliable avec l'existence de savoirs initiatiques, sacrés ou réservés, au moyen de niveaux d'accès | Qu'une communauté refuse le principe même de l'enregistrement d'un savoir réservé, quel que soit son niveau d'accès |
| `H4` | Un dispositif conçu pour durer des décennies peut être porté **au-delà de ses fondateurs** | Qu'aucun rattachement institutionnel ne soit obtenu |

> [!warning] `H3` est la question la plus lourde, et l'audit du corpus la pose sans la trancher
> Le principe d'ouverture — *« le patrimoine appartient à tous »* — entre en tension avec le fait qu'un détenteur peut vouloir documenter un savoir **pour la pérennité sans le rendre consultable**. Cette tension touche la légitimité du projet auprès de ceux dont il dépend, et elle ne se résout pas par la modélisation : elle se tranche avec les communautés concernées, sur le terrain.

---

## 3. Principes de conception — assumés, non prouvés

| # | Principe | Origine |
| --- | --- | --- |
| `P1` | **Séparation stricte du patrimoine et de la technologie** — le corpus tient cette discipline sur ses onze documents de fondation, sans jamais nommer un outil, un format ou une technologie | Constatée sur l'ensemble du corpus ; l'audit la relève comme le point le plus important du dossier |
| `P2` | **Non-suppression et coexistence des variantes** — les versions ne s'écrasent pas, elles coexistent | Référentiel conceptuel, cité par les documents présents |
| `P3` | Le cycle de vie d'une connaissance est **sans fin** : identifier, collecter, qualifier, documenter, valider, conserver, publier, enrichir, archiver | Idem |
| `P4` | La **gouvernance précède l'ontologie** — la question de savoir qui a le droit de faire quoi se tranche avant que les relations ne soient formalisées pour des décennies | `charte_gouvernance_ethique.md`, préambule |

`P4` est un principe d'ordre, et il est juste : une relation *« est validé par »* posée sans processus de validation derrière elle est une relation vide.

---

## 4. Possibilités — ouvertes, jamais sélectionnées

**Rattachement institutionnel** — ministère de la Culture, institut national, structure indépendante adossée à l'État. L'audit pose la question ; la charte d'ancrage institutionnel y répond, et sa réponse n'est **pas une décision**.

**Composition de l'autorité de validation** — conseil scientifique national, référents par communauté, royaume ou chefferie, hiérarchie à deux niveaux académique et coutumier. Trois formules énumérées par l'audit, aucune arrêtée.

**Alignement international** — CIDOC-CRM, Dublin Core, les cinq domaines de la Convention UNESCO de 2003, FRBR/RDA. Recommandés par l'audit, absents du corpus.

---

## 5. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[INPC-BF/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 2 — `DEC-C-065` et `DEC-C-066` | Idem |
