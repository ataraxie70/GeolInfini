---
projet: "MyWeather"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — aucun document n'est opposable"
empreinte: "95c3a78f213b99c3548a709214b5febf7feeffb0200e310d138924a28edba2c4"
cree_le: 2026-09-09
tags:
  - MyWeather
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `MyWeather` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-075` au [[MyWeather/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Emplacement | Fichiers | Nature |
| --- | --- | --- |
| `work_lab/` | 13 | **La documentation de conception.** Vue d'ensemble — contexte, glossaire —, architecture — architecture globale, diagramme de composants —, et **flux de données** en six documents |
| `prompts/` | 8 | Consignes d'agents de développement, réparties en quatre rôles : planificateur, exécutant, relecteur, routeur. Chaque rôle porte une consigne système et un gabarit |
| `README.md` | 1 | Fichier d'accueil du dépôt — décrit l'architecture **cible**, non l'état réel |
| `CLAUDE.md` | 1 | Fiche de projet destinée à un agent de développement |
| **Total** | **24** | **219 Ko** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
95c3a78f213b99c3548a709214b5febf7feeffb0200e310d138924a28edba2c4
```

Le code applicatif, les fichiers de dépendances, l'infrastructure de conteneurs et la configuration de supervision ont été **déplacés hors du coffre** vers `Incubo/_hors-coffre/myweather/`, sans suppression — `DEC-C-074`. Le comptage avant et après établit la conservation : **61 fichiers de part et d'autre**.

---

## 2. Chronologie

Le corpus a été produit en **deux séances contiguës** : le **2026-04-20** à partir de 20 h 26, et le **2026-04-21** jusqu'à 16 h 29.

---

## 3. Où se trouve la substance du corpus

La répartition du volume est révélatrice, et elle ne correspond pas à ce que le fichier d'accueil met en avant.

| Groupe | Volume | Part |
| --- | --- | --- |
| **Flux de données** — forme brute, forme traitée, règles de transformation, contrôles de cohérence, guide de simplification du langage, pipeline | **~90 Ko** | Plus de la moitié |
| Architecture — architecture globale, diagramme de composants | ~26 Ko | |
| Vue d'ensemble — contexte, glossaire | ~11 Ko | |
| Navigation et consignes d'agents | ~31 Ko | |

Le document le plus volumineux est le **pipeline de données**, à 42 Ko ; le deuxième, les **contrôles de cohérence**, à 22 Ko.

> [!important] Le document le plus original du corpus est le plus petit de ce groupe
> `work_lab/02-data-flow/simple-language.md`, 12 Ko, pose une règle que le reste du dossier n'énonce nulle part : *« un citoyen ordinaire ne doit pas avoir besoin de dictionnaire pour comprendre la météo »*, et en tire une table de conversion à trois niveaux de lecture.
> C'est la seule partie du corpus qui traite un problème que la donnée seule ne résout pas.

---

## 4. Ce que le corpus établit, et ce qu'il ne prouve pas

**Établi** : un flux de données conçu avec soin, du format brut au format publiable, avec ses règles de transformation et ses contrôles de cohérence. Une architecture applicative cohérente. Un principe de simplification du langage, opérationnalisé par une table de conversion.

**Non prouvé** : que les cinq seuils d'alerte soient les bons, qu'aucun dispositif n'occupe déjà le terrain, que l'alerte atteigne la personne menacée, et qu'une personne avertie puisse agir.

> [!danger] Aucune source n'est citée, et l'objet du projet rend cette absence coûteuse
> Ni source météorologique pour les seuils, ni source sanitaire, ni source agronomique, ni dispositif d'alerte existant, ni référence pour les ordres de grandeur du contexte — population, découpage administratif, plages de température.
> Un seuil d'alerte non sourcé n'est pas une imprécision documentaire : **un seuil trop haut laisse passer un événement dangereux, un seuil trop bas produit des alertes que la population cesse d'écouter.** Les deux erreurs se paient en vies humaines dans le domaine visé.

---

## 5. Le fichier d'accueil décrit une cible, pas un état

> [!warning] Ce que le fichier d'accueil annonce et qui n'existait pas au 2026-09-09
> Il décrit une interface de programmation, des services, des tâches de fond, un tableau de bord React, une infrastructure de conteneurs, une supervision et une suite de tests unitaires, d'intégration et de bout en bout.
>
> | Élément annoncé | État constaté |
> | --- | --- |
> | Code applicatif | **823 lignes de Python** sur 22 fichiers |
> | Tableau de bord React | **Un fichier de dépendances.** Les cinq dossiers de sources sont vides |
> | Trois suites de tests | **Les trois dossiers sont vides** |
>
> Cet écart n'établit aucune mauvaise foi : un fichier d'accueil rédigé au début d'un projet décrit couramment la cible. Il impose seulement de **ne jamais lire ce document comme un état**, et il est consigné à ce titre — faits `F3` à `F5`.

---

## 6. Règles de ce dossier

1. **Rien ne s'édite ici.**
2. **Le corpus n'est pas opposable.** Y trouver une architecture, un pipeline de données ou des seuils chiffrés ne rend rien décidé.
3. **Toute citation porte son chemin.**
4. **Aucun seuil du corpus ne se reprend sans sa mention de statut.** Les cinq seuils sont des hypothèses non sourcées ; les citer sans le dire les promouvrait silencieusement en faits, ce que la règle 2 du coffre proscrit.
