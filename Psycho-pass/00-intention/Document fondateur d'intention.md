---
projet: "Psycho-pass"
type: "document-fondateur"
phase: "00-intention"
version: "0.1"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de Psycho-pass, réécrite depuis le corpus hérité, avec le statut de chaque affirmation"
source_du_fond: "99-sources — deux séances des 2026-05-15 et 2026-05-16"
corpus_herite: "Référence, non opposable"
cree_le: 2026-09-09
tags:
  - Psycho-pass
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `Psycho-pass` depuis l'intention. Il ne transforme aucune idée en exigence, ne valide aucun acquis du corpus hérité et ne prend aucune décision.
> Il est **réécrit**, non recopié. Chaque affirmation matérielle porte sa source et son **statut** : fait, hypothèse, principe, possibilité. Ce qui est écarté est nommé et motivé.

---

## 1. Objet et principe de lecture

`Psycho-pass` possédait, avant son entrée dans le coffre, un corpus de 38 fichiers produit en **deux séances** — le 2026-05-15 de 12 h 51 à 18 h 04, puis le 2026-05-16 de 17 h 16 à 18 h 05. Ce corpus va du cahier des charges fonctionnel jusqu'au socle de code, en passant par cinq RFC, deux documents de règles obligatoires, un backlog technique, un jeu de huit consignes de génération et un pack pédagogique de onze documents.

Il a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune de ses affirmations, ne dit nulle part ce qui l'invaliderait, et ne cite ni enquête, ni mesure, ni entretien, ni état de l'art, ni source psychométrique — alors qu'il conçoit un instrument de mesure de l'aptitude cognitive.

La reprise consiste donc à **repartir de l'intention** et à réinstruire la chaîne dans l'ordre, en se servant du corpus comme matériau. Trois règles gouvernent ce qui suit.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Le présent document relève presque entièrement du monde imaginé.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus ne lui confère aucun statut.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

---

## 2. L'intention fondatrice

> **Permettre à une personne de s'entraîner aux épreuves d'aptitude et de culture générale, d'obtenir un score fiable, et de voir sa progression dans le temps.**

Source : `99-sources/prod-docs/cdc/psycho_pass_cahier_des_charges_mvp.md`, points 1 et 2. **Statut : intention** — elle n'a pas à être vraie, elle a à être tenue.

Le corpus décrit six familles d'épreuves psychotechniques — raisonnement logique, numérique et verbal, mémoire, attention, repérage spatial — et dix catégories de culture générale.

### 2.1. Les quatre problèmes revendiqués

Source : même fichier, point 4. **Statut : hypothèses** — le corpus les présente comme des constats, sans aucune source. Elles sont enregistrées `H1` à `H4` au [[Psycho-pass/90-pilotage/Registre des statuts|Registre des statuts]].

| # | Problème énoncé | Ce qui manque pour le tenir |
| --- | --- | --- |
| `H1` | Les ressources d'entraînement sont **dispersées** sur plusieurs sites | Une observation de ce que les candidats emploient réellement |
| `H2` | Les candidats reçoivent **peu de retours sur leurs erreurs** | Idem — et le benchmark rend l'inverse probable |
| `H3` | La difficulté proposée est **mal calibrée** | Une mesure, ou des verbatims de candidats |
| `H4` | Les candidats n'ont **aucune vision claire de leurs progrès** | Idem |

---

## 3. La thèse, énoncée de façon falsifiable

Le corpus n'énonce aucune thèse. Celle qui suit est **reconstruite** à partir des points 2 et 4 du cahier des charges, et signalée comme telle : elle rend discutable ce que le corpus laissait implicite.

> **X** — Ce qui manque au candidat n'est pas le contenu, abondamment disponible, mais un **dispositif qui corrige, calibre et restitue une progression**. Un système qui centralise l'entraînement, corrige immédiatement, ajuste la difficulté et montre l'évolution apporte une valeur qu'un recueil de sujets et un corrigé figé n'apportent pas.
>
> **Le marché agirait comme si non-X** — l'entraînement continuerait de se faire sur des annales en PDF et des corrigés statiques.

**Statut : hypothèse — et déjà partiellement contredite.**

> [!danger] Le second membre de la thèse ne tient pas en l'état
> Le [[Psycho-pass/10-etudes/Benchmark et état de l'art|Benchmark et état de l'art]] établit que le marché **ne se comporte pas** comme si non-X. Une plateforme burkinabè vend depuis janvier 2024 un module psychotechnique en questionnaire à choix multiples, avec corrigés, cours vidéo et sujets, pour 5 000 FCFA par an. Une plateforme française annonce plus de 820 tests avec corrigés détaillés et suivi de progression.
> La thèse reconstruite décrit donc une offre **qui existe déjà**. Elle ne peut pas fonder le projet en l'état : la différence revendiquée doit être cherchée ailleurs, et nommée.

**Condition de fausseté**, à formuler avant toute étude :

> **Si les candidats interrogés déclarent qu'un recueil de sujets corrigés leur suffit, et que ce qui leur manque est le temps de travail et non l'outil, la thèse tombe entièrement.**

---

## 4. Ce que le premier travail d'étude a établi, et qui atteint la conception

Le [[Psycho-pass/10-etudes/Benchmark et état de l'art|Benchmark et état de l'art]] a été conduit le 2026-09-09 sur sources publiques. Il produit trois faits que le corpus ignore.

### 4.1. Le terrain est occupé jusque dans le territoire le plus probable

Au moins quatre plateformes francophones vendent la préparation aux tests psychotechniques, dont une au **Burkina Faso**, active depuis novembre 2021, à environ huit euros par an. Le corpus n'en cite aucune et ne contient aucun état de l'art.

La question du projet n'est donc pas *« ce service manque »*, mais **« il existe et il est bon marché — qu'apporte celui-ci de plus, et qui paierait la différence ? »**. Le dossier n'y répond pas.

### 4.2. L'adaptativité revendiquée exige le public qu'elle est censée produire

Le corpus présente l'ajustement de la difficulté comme la fonction distinctive. Tel qu'il est spécifié — *bonne réponse, la difficulté monte ; mauvaise réponse, elle baisse* — c'est une heuristique de confort qui règle le rythme d'une séance et ne mesure rien.

Un test adaptatif au sens psychométrique exige une banque d'items **calibrés**, et la littérature situe ce besoin entre **250 et 500 réponses par item**. Une banque modeste de 300 items demande ainsi de 75 000 à 150 000 réponses avant que le moteur ne repose sur autre chose qu'un entier saisi à la main.

### 4.3. Les deux publics visés ont des intérêts opposés

Le cahier des charges nomme dans la même liste les **candidats** et les **recruteurs**. Pour le candidat, le gain de score est le service acheté. Pour le recruteur, ce même gain **contamine le signal** qu'il achète — et la littérature établit que le regain au repassage peut refléter l'habileté à passer le test plutôt que l'aptitude mesurée.

Servir les deux revient à vendre à l'un la dégradation de ce qui est vendu à l'autre. C'est un arbitrage structurant, et le corpus ne le voit pas.

### 4.4. La question qui commande le reste

> **Que vend `Psycho-pass` : un gain de score au concours, ou une mesure d'aptitude ?**

| Réponse | Ce que le projet devient | Ce qu'elle impose |
| --- | --- | --- |
| **Un gain de score** | Un produit de préparation, vendu au candidat, en concurrence directe et frontale avec les acteurs relevés | Une différence nommée face à une offre à huit euros par an, et un stock d'items entretenu |
| **Une mesure d'aptitude** | Un instrument, vendu au recruteur ou à l'organisation | Une validation psychométrique, une calibration réelle, et l'abandon de la promesse d'entraînement qui la contredit |

**Le corpus ne pose jamais cette question.** Il additionne les deux et conçoit autour.

---

## 5. Ce que le corpus apporte, et ce qu'il ne prouve pas

### 5.1. La contribution solide

> **Le frontend affiche, le backend décide.**

Source : `99-sources/README-monorepo.md` et `prod-docs/rfc/RFC-001`, point 4.2. **Statut : principe de conception**, enregistré `P1`.

Le score, la difficulté, les permissions et la validation des réponses sont établis côté serveur ; l'interface ne recalcule aucun score critique et ne détient aucune donnée sensible. Ce principe est **motivé**, ce qui est rare dans le corpus : un score consultable est un score qu'un utilisateur peut vouloir falsifier, et un produit d'évaluation dont le résultat se truque ne mesure rien.

S'y ajoutent, de moindre portée : une séparation nette des responsabilités entre les deux applications, un schéma de données cohérent pour le périmètre décrit, et une distinction entre mode d'entraînement — correction immédiate — et mode d'examen — score final seul.

### 5.2. Ce qu'il ne prouve pas

Que quiconque ait ce problème sous cette forme, qu'un acteur ne l'occupe pas déjà, et que la fonction distinctive revendiquée soit atteignable.

### 5.3. Le sujet absent

Le corpus décrit avec précision comment **administrer** des questions. Il ne dit **jamais** d'où viennent les questions, qui les écrit, à quel rythme, ni à quel coût. C'est pourtant le produit : les concurrents relevés ne vendent pas un logiciel, ils vendent un **stock d'items entretenu**. Une plateforme vide fonctionne parfaitement et ne sert à rien.

---

## 6. L'état où le travail s'est arrêté

Quatre faits vérifiés le 2026-09-09, enregistrés `F1` à `F4`.

Le dépôt de code ne porte **aucun commit**. Le code compte **treize fichiers source**, et le backend chargé par l'application expose **un seul contrôleur**, celui de l'état de santé. Les **quatre derniers fichiers écrits** — les modules d'accès aux données et de gestion des utilisateurs, du 2026-05-16 — sont placés à un chemin doublement imbriqué, et le module des utilisateurs n'est importé par aucun module de l'application.

> [!warning] Ce que ce constat dit, et ce qu'il ne dit pas
> **Il dit** que le projet a produit une documentation de conception complète, puis s'est interrompu au premier module métier réel, écrit à un emplacement où l'application ne peut pas le charger.
> **Il ne dit pas** pourquoi. Deux lectures s'opposent et le dossier ne les départage pas. **Défavorable** : une conception abondante qui s'épuise à la première difficulté d'exécution. **Neutre** : une interruption sans rapport avec le projet. Le fait est établi et daté ; son interprétation ne l'est pas, et elle est enregistrée `H6`.

---

## 7. Recouvrements avec les autres projets du coffre

| Projet | Nature du recouvrement | Portée |
| --- | --- | --- |
| `levelup` | Les deux systèmes mesurent une personne, servent des séances et affichent une progression | **Instruit.** Voir [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] : les objets mesurés, les définitions de la preuve et les bénéficiaires diffèrent ; la seule intersection est un domaine générique |
| `synapse`, `infUb`, `checkme` | Ces projets traitent la **preuve** — de compétence, de publication, de statut | **Faible.** `Psycho-pass` produit une **mesure**, non une preuve. Qu'une mesure vaille preuve dépend de la confiance accordée à celui qui mesure, et cette question est l'objet de `synapse`. `Psycho-pass` se tient en amont de la chaîne, non dedans |
| `ecoFab` | Les deux visent, dans leur hypothèse de territoire la plus probable, un public étudiant burkinabè | **À instruire.** Le recouvrement porterait sur le public, non sur l'objet |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## 8. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

Le nom du produit · le territoire · le premier public, et l'arbitrage du point 4.3 entre candidat et recruteur · **ce que le produit vend**, au sens du point 4.4 · le périmètre du produit minimal · **l'origine du contenu** · le degré d'adaptativité réellement visé · le modèle économique · la forme juridique · le *Core Domain* · le découpage en contextes bornés · l'architecture, le modèle de données et la pile technique.

L'architecture, le modèle de données et la pile figurent dans cette liste **bien qu'ils soient écrits en détail dans le corpus et partiellement implémentés** : ils ont été arrêtés en une séance, sans contact avec un candidat, et leur validité dépend d'hypothèses non instruites. La règle `DEC-C-014` pose qu'aucun statut interne à un document ne vaut décision de projet.

---

## 9. Ce que la reprise doit produire, et dans quel ordre

```
INTENTION  (le présent document)
   v
ÉTUDE — le problème existe-t-il, la place est-elle libre, le contenu est-il atteignable ?
   v
CADRAGE STRATÉGIQUE — bénéficiaire, marché initial, position défendable
   v
DDD STRATÉGIQUE — Core Domain, contextes bornés, langage ubiquitaire
   v
DDD TACTIQUE — agrégats, invariants, événements
   v
ARCHITECTURE — décisions, données, sécurité, infrastructure
   v
IMPLÉMENTATION
```

Le corpus a parcouru ce chemin **à l'envers**, du cahier des charges vers le code, en deux séances. La reprise le parcourt dans l'ordre, et son étude doit pouvoir conclure que le projet **ne doit pas être construit**.

---

*Version 0.1 — ouverture de la reprise. Le corpus hérité reste consultable en [[Psycho-pass/99-sources/Sources originales|99-sources]] et n'est opposable en rien.*
