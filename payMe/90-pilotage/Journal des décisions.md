---
projet: "payMe"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 5
cree_le: 2026-09-09
tags:
  - payMe
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

La séquence `DEC-C-` est **unique et continue sur tout le coffre**. Une décision dont la portée excède ce projet s'inscrit au [[Journal des décisions du coffre]].

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-09.** Sont notamment suspendus : le nom du produit, le premier segment, le périmètre du produit minimal, le modèle économique, le régime réglementaire visé, la forme juridique, l'architecture et la pile technique.
>
> **Le corpus ne prétend d'ailleurs à aucune décision.** Il présente sa position comme *« v1.0 proposée à tester »*, il classe ses affirmations en fait, hypothèse, analyse et inconnu, et l'un de ses deux documents ultérieurs a pour seul objet de corriger une surestimation du premier. C'est le seul corpus hérité du coffre qui n'ait jamais franchi la règle `DEC-C-014`.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-067 — Mise en conformité aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet adopte la structure et les conventions du coffre sous le nom de code **`payMe`**, casse d'origine, conformément à `DEC-C-002`. Les trois documents rejoignent `99-sources`. |
| **Nom de produit** | **Non décidé.** Le corpus emploie *« infrastructure de paiement du quotidien »* puis *« infrastructure d'encaissement et de trésorerie du commerce de proximité »*. Ce sont des positions, pas des noms. |
| **Phases ouvertes** | `00-intention`, `10-etudes`, `90-pilotage`, `99-sources`. |
| **Point de rédaction traité** | Le corpus emploie une notation par étoiles pleines et vides — de `★★★★★` à `★★★☆☆` — pour classer trois actifs candidats, **sans légende**. Les notes de travail du projet n'emploient pas cette notation : elles nomment le rang et son motif. La source n'est pas modifiée. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-068 — Le corpus hérité est une référence, pour un motif qui lui est propre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 3 documents produits avant l'entrée dans le coffre sont versés en `99-sources` comme **matériau de référence**, non opposables. |
| **Motif, et il diffère de tous les autres projets** | Ce corpus **n'est pas en défaut de méthode**. Chaque affirmation y porte une étiquette — fait, hypothèse, analyse, inconnu —, les faits citent des sources officielles nommées et datées, les hypothèses portent un **critère de mort explicite**, et l'auteur écrit que son objet *« ne cherche pas à valider l'intention fondatrice, il cherche à la casser »*. Le corpus se corrige lui-même deux fois. |
| **Ce qui fonde tout de même la non-opposabilité** | **Aucun jalon n'a été franchi**, et toutes les preuves du dossier sont documentaires. Aucun commerçant, aucun payeur n'a été interrogé. Une position formulée *« à tester »* reste une position à tester, quelle que soit la qualité du raisonnement qui la produit. |
| **Fait de chronologie** | Les trois documents sont datés du **1er septembre 2026** pour l'étude et son addendum, et portent une révision ultérieure du plan de preuve. Les horodatages de fichier indiquent un dépôt au coffre le **2026-09-09 à 14 h 55**, postérieur à la rédaction. |
| **Conséquence directe** | Les dossiers `20` à `60` **ne sont pas ouverts**. En revanche, `10-etudes` l'est — voir `DEC-C-069`. |
| **Ce qui est retenu** | La **méthode d'étiquetage des affirmations** et la pratique du **critère de mort**, reprises au registre des statuts et au programme d'études. Elles coïncident avec les règles `D3` et `DEC-C-014` du coffre, formulées indépendamment. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |

### DEC-C-069 — Ouverture de la phase `10-etudes`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | La phase `10-etudes` est ouverte. Le [[payMe/10-etudes/Programme d'études\|Programme d'études]] V0.1 y est versé : il reprend le plan de preuve du corpus et le met en forme conforme aux règles `D2` et `D3` du coffre. |
| **Motif de l'ouverture, alors que les autres projets ne l'obtiennent pas** | Le corpus de `payMe` **est une étude**, et non une conception. Il instruit un cadre réglementaire, relève des acteurs, chiffre des flux, réfute son propre actif candidat et écrit un plan de preuve avec critères de mort. Refuser d'ouvrir la phase reviendrait à ignorer un travail qui appartient précisément à cette phase. Ce qui est repris n'est pas le corpus lui-même — non opposable — mais **un programme réécrit qui s'en inspire**. |
| **Ce que le programme ajoute au corpus** | L'ordre des lots et leur coût, les jalons, l'**ordre de renoncement**, le lot **actif** et le lot **payeur** exigés par la règle `D2`, et l'inscription explicite de la contrainte de calendrier du 30 septembre 2026 comme condition de validité de la mesure. |
| **Contrainte extérieure inscrite** | Le **2026-09-30**, la connexion à la plateforme régionale de paiements instantanés devient obligatoire pour les banques, les émetteurs de monnaie électronique et les établissements de paiement. Le lot `L0` doit être conduit **avant** cette date : la même mesure ne répond pas à la même question de part et d'autre. |
| **Seuils** | Les conditions d'invalidation sont **pré-enregistrées** lot par lot, conformément à la règle `D3`. Celles héritées du corpus sont reprises **sans être assouplies**. |
| **Portée** | Protocole d'investigation. **Aucune décision de projet n'est prise.** |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

### DEC-C-080 — Ouverture de la vague 0 et pré-enregistrement du protocole

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | La **vague 0** du [[payMe/10-etudes/Programme d'études\|Programme d'études]] est ouverte. Le lot `L1` est **conduit** ; le lot `L0` est **pré-enregistré** par le [[payMe/10-etudes/Protocole de la vague 0\|Protocole de la vague 0]] V1.0, et sa collecte reste à conduire. |
| **Motif de l'ordre** | Le programme place `L0` en premier parce qu'il décide le plus. Mais `L1` est documentaire, ne dépend d'aucune autorisation, et **conditionne l'interprétation de `L0`** : la question posée aux personnes interrogées n'a pas le même sens selon ce que la plateforme couvre au moment de l'entretien. `L1` a donc été conduit d'abord, et son résultat est intégré au protocole de `L0` **avant** que celui-ci ne soit gelé. |
| **Ce que `L1` a établi** | La composition burkinabè au 2 avril 2026 est **confirmée à la source primaire** : neuf institutions, six banques, un seul émetteur de monnaie électronique. Une **liste plus récente existe, arrêtée au 31 juillet 2026**, dont le contenu n'a pas pu être obtenu. Et l'absence de Wave repose en partie sur un **conflit de modèle économique**, ce qui affaiblit l'hypothèse d'une disparition uniforme de la cause `A` au 30 septembre. Faits `F9` à `F12`. |
| **Effet sur l'instrument, décidé avant la collecte** | Lorsque la cause `A` est codée, **l'opérateur concerné est relevé**. Sans cette précision, la mesure ne distingue pas une cause `A` qui va disparaître d'une cause `A` qui va persister. Le seuil 8.2 du protocole en tire les conséquences, et il est pré-enregistré. |
| **Seuils** | Pré-enregistrés au point 8 du protocole, conformément à la règle `D3`. **Le seuil principal est celui du corpus, repris sans assouplissement** : si la cause `B` représente moins de 25 % des retraits codés, la lecture « contrainte » est infirmée et la position du corpus tombe. |
| **Gel du protocole** | Le protocole est **non modifiable à compter du premier entretien**. Toute difficulté imposant une modification se consigne comme une révision datée ici même, et les entretiens déjà conduits sont traités séparément. |
| **Contrainte de calendrier** | La collecte doit être achevée **avant le 2026-09-30**. Les entretiens conduits après cette date sont datés, séparés et comptés à part. |
| **Réserve inscrite** | L'échéance du 30 septembre résulte d'un report annoncé le 25 juin 2026, dans une série de six reports en dix-huit mois. **Rien n'établit qu'elle sera tenue**, et le protocole ne suppose rien à ce sujet. |
| **Portée** | Protocole d'investigation. **Aucune décision de projet n'est prise**, et aucun résultat de ce lot n'en autorisera une : l'issue s'inscrit au jalon 1. |
| **Réversibilité** | Élevée avant la collecte, **nulle après** — un protocole gelé ne se réécrit pas. |
| **Statut** | Active |

### DEC-C-081 — Constater la modification du corpus en séance, réparer un original et réviser l'ordre de la vague 0

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Objet** | Le corpus de `99-sources` a été **modifié pendant la séance de travail**, entre 21 h 08 et 21 h 13, alors que les notes de la vague 0 étaient en cours de rédaction. Trois faits distincts sont constatés, et chacun appelle un traitement propre. |

#### Fait 1 — un document a été ajouté au corpus

Une **note de faisabilité technique** sur la couche d'autorisation et l'initiation de paiement pour compte de tiers a été versée à `99-sources` le 2026-09-09 à 21 h 08. Le corpus passe de **trois à quatre documents**.

Cette note n'est pas un complément marginal : elle pose une question qu'aucun des trois autres documents ne posait — *un tiers peut-il initier un débit sur le compte d'un payeur qu'il ne détient pas ?* — et elle **réordonne explicitement le plan** à son point 8.

#### Fait 2 — l'addendum a été restauré dans sa version d'origine

`etude-strategique-v1-addendum.md` est passé de 16 708 à 16 684 octets à 21 h 09. La différence de **24 octets** correspond exactement au rétablissement de **quatre signes paragraphe** qu'une passe antérieure avait remplacés par le mot `point`.

**Le fichier en place est donc l'original.** C'est la bonne version : la règle 1 du dossier `99-sources` pose que rien ne s'y édite.

> [!note] Ce que ce fait révèle sur une passe antérieure
> La décision `DEC-C-052` avait retiré le signe paragraphe de tout le coffre. À cette date, les documents de `payMe` **n'étaient pas encore en `99-sources`** : ils résidaient à la racine du dossier de projet, et la passe les a traités comme des notes de travail ordinaires.
> Le traitement était défendable au moment où il a eu lieu ; il ne le serait plus aujourd'hui. La restauration des originaux est donc **une correction, non une régression**, et elle est enregistrée comme telle.

#### Fait 3 — un original a été déposé sous un nom accidentel, et il est remis en place

Un fichier nommé **`Index du coffre.md`** est apparu à la racine du dossier `payMe`, contenant en réalité **l'original de la révision du plan de preuve**, signes paragraphe compris.

| Contrôle conduit | Résultat |
| --- | --- |
| Le fichier égaré est-il l'original de `06-revision-plan-preuve-v1.1.md` ? | **Oui.** Après substitution des deux signes paragraphe, les deux textes sont **caractère pour caractère identiques** |
| Le nom collisionne-t-il avec une note du coffre ? | **Oui.** `Index du coffre` est le nom de l'index à la racine du coffre — exactement le piège que la convention de lien en chemin complet a pour objet d'éviter |

**Décision.** L'original reprend sa place sous le nom `99-sources/06-revision-plan-preuve-v1.1.md`. La version dont le signe paragraphe avait été retiré est **déplacée hors du coffre**, vers `Incubo/_hors-coffre/payme-versions-modifiees/`, **sans être détruite**.

#### Conséquences inscrites

| # | Conséquence |
| --- | --- |
| 1 | **L'empreinte du corpus change.** Elle passe de `bec71fb6…` à **`43de11ae…`**, sur **quatre documents** au lieu de trois. L'ancienne est conservée au registre de provenance comme trace de l'état antérieur |
| 2 | **Le programme d'études passe en V0.2.** Un lot `L7` — faisabilité technique — est créé et prend le **premier rang** de la vague 0 |
| 3 | **Le jalon 1 rend désormais sur deux questions** au lieu d'une : la constructibilité d'abord, le marché ensuite |
| 4 | **Le protocole du lot `L0` n'est pas modifié.** Son rang change, ses seuils et ses instruments demeurent tels que pré-enregistrés. Aucun entretien n'ayant été conduit, la règle `D3` n'est pas enfreinte |

#### Motif de la révision de l'ordre

Le programme V0.1 plaçait `L0` en tête parce qu'il décide de l'existence du marché. La note de faisabilité établit qu'une question **antérieure** existe — la constructibilité —, qu'elle est **binaire**, et qu'elle se mesure sur un environnement de test **gratuit** en deux à trois jours, contre seize heures de collecte pour `L0`.

**Le lot le moins cher qui décide le plus passe en premier.** C'est la règle du programme, et elle désigne `L7`.

| Champ | Valeur |
| --- | --- |
| **Portée** | Rangement, provenance et protocole d'investigation. **Aucune décision de projet n'est prise.** |
| **Réversibilité** | Élevée. Aucun fichier n'est détruit ; la version modifiée est conservée hors du coffre |
| **Statut** | Active |
