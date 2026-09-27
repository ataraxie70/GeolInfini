---
projet: "Psycho-pass"
type: "analyse-de-recouvrement"
phase: "10-etudes"
objet: "Psycho-pass doit-il être considéré comme une plateforme indépendante de levelup, ou comme une part de celle-ci"
monde: "Monde imaginé — comparaison de deux corpus de conception, aucun terrain"
niveau_de_preuve: "1 sur les énoncés comparés ; 4 sur les conséquences"
statut: "Analyse close — aucune décision de projet"
date: 2026-09-09
tags:
  - Psycho-pass
  - levelup
  - etudes
  - recouvrement
---

# Relation à levelup

Analyse conduite au moment de l'entrée de `Psycho-pass` dans le coffre, avant toute modélisation, parce que deux projets qui se recouvrent doivent être départagés **avant** que l'un ou l'autre ne modélise son noyau.

---

## 1. Réponse en une phrase

> **Les deux projets ne mesurent pas le même objet, n'ont pas la même définition de la preuve, et ne servent pas le même bénéficiaire ; leur seule intersection réelle est un composant technique que la doctrine du coffre range parmi les domaines génériques, c'est-à-dire précisément ceux qui ne justifient jamais de réunir deux projets.**

Cette réponse est une **analyse**, non une décision. Ce qu'elle autorise et ce qu'elle n'autorise pas est délimité au point 7.

---

## 2. Ce que chaque projet mesure

| | `levelup` | `Psycho-pass` |
| --- | --- | --- |
| **Objet déclaré** | Rendre visible, mesurable et durable la **progression réelle** d'un individu, dans n'importe quel domaine de connaissance ou de pratique | Évaluer et entraîner l'**aptitude psychotechnique** et la culture générale, avec score, chronomètre et historique |
| **Grandeur mesurée** | Une **compétence acquise** dans un domaine — programmation, droit, menuiserie | Une **aptitude cognitive** — raisonnement logique, numérique, verbal, mémoire, attention, repérage spatial — et un stock de connaissances |
| **Nature de cette grandeur** | Acquise, cumulative, spécifique à un domaine | Traitée en psychométrie comme relativement **stable** et transversale |
| **Horizon** | La durée — la progression est un processus, jamais un état atteint | L'instant — la performance d'une séance chronométrée |
| **Bénéficiaire** | Non désigné ; sept publics possibles, aucun sélectionné | Non désigné ; six publics possibles, dont deux aux intérêts opposés |
| **Ce que le système produit** | Une représentation honnête d'un état de maîtrise | Un score, un rang, une estimation de niveau |

---

## 3. Le test décisif — la règle de preuve de `levelup` exclut le questionnaire à choix multiples

`levelup` ne se contente pas d'affirmer qu'une compétence se prouve. Il en donne une définition opératoire, et c'est la seule du dossier : l'instrument que le porteur a construit pour lui-même pose qu'une notion est validée lorsqu'il sait **l'expliquer, la reproduire, l'appliquer et la corriger, sans aide**.

La règle en quatre conditions, appliquée à ce que produit `Psycho-pass`, donne le relevé suivant.

| Condition de `levelup` | Ce qu'un questionnaire à choix multiples chronométré en établit |
| --- | --- |
| **Expliquer** | Rien. Aucune réponse n'est justifiée ; le format ne le permet pas |
| **Reproduire** | Rien, hors régime de **reconnaissance** : l'option correcte est présente parmi les autres, et la reconnaître n'est pas la produire |
| **Appliquer** | **Partiellement.** Un problème de raisonnement numérique exige une application réelle. C'est la seule des quatre conditions que le format sert |
| **Corriger** | Rien. Le corrigé est fourni au candidat ; le candidat ne corrige rien |

Une condition sur quatre, et partiellement.

Trois axiomes de `levelup` en tirent la conséquence, sans avoir été écrits pour ce cas :

- `A7` — *une tâche réalisée ne constitue pas une preuve de compétence* ;
- `A8` — *une compétence n'est reconnue qu'à partir de preuves observables* ;
- `A9` — *les mécanismes de jeu sont des représentations, non des preuves*.

> [!danger] Sous sa propre doctrine, `levelup` classerait un score `Psycho-pass` en représentation, jamais en preuve
> Ce n'est pas une objection extérieure : c'est `levelup` qui se l'oppose à lui-même. Faire de `Psycho-pass` un module de `levelup` contraindrait `levelup` à admettre comme preuve exactement ce que son principe le plus structurant définit comme n'en étant pas une.
> Le coût n'est pas d'organisation, il est **doctrinal**. Le principe *« le système ne doit jamais donner l'illusion d'une maîtrise inexistante »* est la contribution intellectuelle la plus solide du corpus de `levelup`. Le contredire pour absorber un module reviendrait à céder l'actif pour gagner la fonctionnalité.

---

## 4. Le second écart — la progression que `Psycho-pass` mesure est celle dont le sens est le plus contesté

`levelup` existe pour mesurer une **progression réelle**, et se distingue explicitement des outils qui affichent une progression flatteuse.

Or le fait `F11` du [[Psycho-pass/90-pilotage/Registre des statuts|Registre des statuts]] établit ceci : le regain de score au repassage d'un test d'aptitude cognitive est réel et mesuré — **d = 0,26** sans préparation, **d = 0,64** avec préparation — mais la littérature pose explicitement que ce gain peut refléter l'**habileté à passer le test** plutôt que l'aptitude que le test prétend mesurer.

> **`Psycho-pass` mesure donc précisément la grandeur dont la progression est la plus susceptible d'être un artefact de la mesure elle-même.**

C'est le contraire exact de ce que `levelup` cherche. Un module qui ferait monter une courbe sans que rien ne progresse en dessous est la définition même de ce que `levelup` refuse d'afficher.

Ce constat ne condamne pas `Psycho-pass` : pour un candidat qui vise un concours, le gain de score **est** le service rendu, et il est légitime. Il condamne seulement la lecture qui ferait de ce gain une preuve de progression.

---

## 5. Le point où les deux projets se touchent réellement

Le recouvrement existe, et il est technique. Les deux projets ont besoin :

- d'une **banque d'items** avec catégories et niveaux de difficulté ;
- d'un **moteur de séance** — servir, chronométrer, enregistrer une réponse ;
- d'un **moteur de score** appliquant des règles côté serveur ;
- d'un **historique** par personne, et de sa restitution.

C'est un composant réel, et il serait construit deux fois si les deux projets aboutissaient. Mais sa nature commande la conclusion.

> [!important] Ce composant est un domaine générique, pas un cœur de domaine
> Le pipeline méthodologique du coffre pose que le *Core Domain* est le seul lieu où se construit une position défendable, et que les **domaines génériques ou support ne méritent jamais cet effort** : ils s'achètent, s'externalisent, ou se traitent au plus simple.
> Un moteur de questionnaire chronométré et scoré est un domaine générique : il existe sur étagère, il ne défend rien, et personne ne choisit une plateforme parce que son chronomètre est meilleur.
> **Deux projets dont les cœurs de domaine sont disjoints et qui ne partagent qu'un domaine générique sont deux projets.** Réunir sur un domaine générique, c'est réunir sur ce qui ne compte pas.

Un second point de contact mérite d'être nommé pour être écarté. Le coffre porte déjà plusieurs projets dont la **preuve** est le cœur — `synapse`, `infUb`, `checkme`, et `levelup` par son axiome `A8`. `Psycho-pass` ne rejoint pas ce groupe : il produit une **mesure**, non une preuve. Qu'une mesure vaille preuve dépend de la confiance accordée à celui qui mesure, et cette question-là est l'objet de `synapse`. `Psycho-pass` se tient donc **en amont** de la chaîne de preuve, non dedans.

---

## 6. Les trois relations possibles, et ce que chacune coûte

Aucune n'est sélectionnée. Elles sont énumérées pour que la question reste instruite plutôt que tranchée par défaut.

| Relation | Ce qu'elle suppose | Ce qu'elle coûte | Réversibilité |
| --- | --- | --- | --- |
| **Deux produits sans lien** | Que les publics et les cœurs de domaine restent disjoints, ce que les points 2 à 4 rendent probable | La reconstruction du composant générique du point 5, dans le seul cas où les deux aboutissent | Élevée |
| **Deux produits, un composant partagé** | Que les deux projets atteignent la conception, et que le composant soit spécifié une fois pour deux usages | Une coordination entre deux projets dont **aucun n'a franchi son premier jalon** — coût certain, bénéfice conditionnel | Moyenne |
| **Un seul produit, `Psycho-pass` en module de `levelup`** | Que `levelup` admette le score de questionnaire au rang de preuve | La contradiction doctrinale du point 3, et l'artefact de mesure du point 4. Le principe cédé est celui que le corpus de `levelup` a de plus solide | **Faible** — un noyau modélisé ne se sépare pas à bas coût |

L'ordre de ce tableau est celui du coût croissant et de la réversibilité décroissante. Il n'est pas un classement de préférence.

---

## 7. Ce qui est tranché, et ce qui ne l'est pas

> [!warning] Une décision de rangement n'est pas une décision de produit
> **Tranché — `DEC-C-061`.** `Psycho-pass` est rangé comme un projet distinct : dossier propre, journal propre, programme d'études propre. Cette décision porte sur l'organisation documentaire et sur elle seule. Elle est prise parce que ranger séparément est réversible, et parce qu'un rangement commun imposerait au lecteur la thèse de l'unité des deux projets — thèse qu'aucun travail n'a établie.
>
> **Non tranché.** Que les deux **produits** doivent rester séparés, partager un composant ou fusionner. C'est une décision de projet, elle engage deux projets à la fois, et **aucun des deux n'a franchi son premier jalon**. La trancher aujourd'hui répéterait exactement le vice que la reprise des deux corpus a pour objet de corriger : décider avant d'avoir instruit.
>
> Le présent document est donc une **analyse orientée**, pas un arbitrage. Elle penche, elle dit pourquoi, et elle laisse la décision au jalon qui aura le droit de la prendre.

---

## 8. Ce qui trancherait la question

Le lot `L8` du [[Psycho-pass/10-etudes/Programme d'études|Programme d'études]] porte cette instruction, conjointement avec `levelup`. Il repose sur trois questions, et l'ordre importe.

1. **Le bénéficiaire est-il le même ?** Si la personne qui prépare un concours et la personne qui construit une compétence durable sont deux personnes, la question est close et la réponse est *deux produits*. C'est la question la moins chère, et elle décide le plus.
2. **`levelup` accepte-t-il de réviser `A8` ?** S'il maintient sa règle en quatre conditions, l'absorption est fermée par construction. S'il l'assouplit, il doit dire ce qu'il accepte de perdre, et l'inscrire à son journal.
3. **Le composant générique justifie-t-il une spécification commune ?** Question de dernier rang : elle ne se pose que si les deux projets atteignent la conception, et sa réponse ne change pas le nombre de produits.

**Condition d'invalidation de la présente analyse, pré-enregistrée** :

> Si les entretiens du lot `L3` établissent que les personnes visées par `Psycho-pass` et celles visées par `levelup` sont **les mêmes personnes**, décrivant **le même besoin** dans les mêmes termes, alors les points 2 à 4 deviennent des différences de vocabulaire et non de nature, et la présente analyse tombe.

---

## 9. Portée sur le portefeuille

Ce recouvrement est porté à [[Cartographie du portefeuille]]. Il rejoint celui de `levelup` avec `synapse`, qui demeure lui aussi ouvert, et qui doit être tranché **avant** que `levelup` ne modélise son noyau — car les deux questions portent sur le même axiome `A8`, et une réponse donnée à l'une contraint l'autre.
