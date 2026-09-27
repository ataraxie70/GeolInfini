---
projet: "payMe"
type: "programme-d-etudes"
phase: "10-etudes"
version: "0.2"
statut: "Vague 0 ouverte et révisée — L1 conduit, L7 à conduire en premier, L0 pré-enregistré"
objet: "Ce qu'il faut établir avant toute conception, dans quel ordre, et à quelles conditions le projet s'arrête"
lots: 8
jalons: 3
echeance_externe: 2026-09-30
cree_le: 2026-09-09
tags:
  - payMe
  - etudes
  - programme
---

# Programme d'études

Protocole d'investigation. Il reprend le plan de preuve du corpus hérité et le met en forme conforme aux règles du coffre. **Il peut conclure que le projet ne doit pas être construit.**

> [!important] Trois règles opposables, issues de la [[Doctrine du coffre]]
> **`D1`** — Une dépendance que le porteur ne signe pas lui-même est une cible, jamais une condition d'existence. **`payMe` est en écart partiel** : le lot `L4` l'instruit.
> **`D2`** — Tout programme porte un lot **actif** et un lot **payeur**. Ce sont `L5` et `L6`.
> **`D3`** — Les conditions d'invalidation sont **pré-enregistrées**, lot par lot, et ne se réécrivent pas après avoir vu le résultat. Le corpus hérité les appelle *critères de mort* ; elles sont reprises sans être assouplies.

---

## 1. Ce qui est déjà conduit, et ce qui ne l'est pas

> [!warning] L'étude documentaire est faite ; le terrain ne l'est pas
> Le corpus hérité a conduit un travail documentaire substantiel et sourcé : cadre réglementaire, liste officielle des participants connectés, statistiques de flux, précédents régionaux, réfutation de l'actif candidat initial, test de survie économique.
> **Aucun commerçant, aucun payeur n'a été interrogé.** Toutes les preuves du dossier sont de niveau documentaire. Le présent programme porte donc essentiellement sur le terrain, et son premier lot est celui que le corpus n'a pas pu conduire.

L'échelle de preuve employée est celle du coffre : le **niveau 1** est le plus fort — une transaction, un engagement coûteux — et le **niveau 4** le plus faible — une assertion sans source. Elle est inverse de l'échelle `[N0]`–`[N4]` des notes de cadrage stratégique ; toute reprise d'un registre à l'autre doit dire laquelle est employée.

---

## 2. La contrainte de calendrier, et elle est extérieure

> [!danger] Le 30 septembre 2026 change la nature de la question
> À cette date, la connexion à la plateforme régionale de paiements instantanés devient obligatoire pour les banques, les émetteurs de monnaie électronique et les établissements de paiement de l'Union.
> Le corpus établit que la **cause A** du retrait subi — *« la personne est sur un autre opérateur »* — est précisément ce que cette échéance supprime, gratuitement. Si l'essentiel des retraits subis relève de la cause A, le marché de `payMe` **se referme à cette date**. S'il relève de la **cause B** — *« le commerçant n'accepte pas »* —, il s'ouvre, et il s'ouvre d'autant plus que le rail devient gratuit.
> **Une mesure conduite avant le 30 septembre et une mesure conduite après ne répondent pas à la même question.** Le lot `L0` doit être conduit avant.

---

## 3. Vague 0 — révisée le 2026-09-09

> [!danger] Le rang d'un lot ne suit pas son numéro
> Les numéros de lots suivent **l'ordre dans lequel ils ont été écrits**. Leur rang suit **l'ordre dans lequel ils doivent être exécutés**. Depuis la révision du 2026-09-09, les deux ne coïncident plus.
> **Le tableau ci-dessous fait foi sur l'ordre.** Un lot ne se lance pas parce qu'il porte un petit numéro.

| Rang | Lot | Coût | Ce que le lot tranche | État |
| --- | --- | --- | --- | --- |
| **1** | **`L7` — Faisabilité technique** | **Nul, 2 à 3 jours** | **Le produit décrit est-il constructible par un tiers ?** Binaire | **À conduire** |
| **2** | `L1` — État de connexion | Une demi-journée | Ce que la plateforme couvre, et ce qu'il advient à l'échéance | **Conduit le 2026-09-09** |
| **3** | `L0` — Taxonomie du retrait | 16 heures | **Le marché existe-t-il ?** Le retrait est-il subi ou choisi | **Pré-enregistré**, collecte à conduire |

### Pourquoi cet ordre a changé

Le programme V0.1 plaçait `L0` en tête, parce qu'il décide de l'existence du marché. La révision le place en troisième, et le motif est le suivant.

Le corpus a été **augmenté le 2026-09-09 d'une note de faisabilité technique** qui pose une question que ni l'étude, ni l'addendum, ni la révision du plan de preuve ne posaient : **un tiers peut-il initier un débit sur le compte d'un payeur qu'il ne détient pas ?**

C'est la question de la **constructibilité**, et elle précède celle du marché. Un marché établi ne sert à rien si le produit ne peut pas être bâti ; l'inverse n'est pas vrai. Et surtout, la mesurer coûte **deux à trois jours et rien d'autre**, contre seize heures de terrain et dix semaines de délai pour `L0`.

> **Le lot le moins cher qui décide le plus passe en premier.** C'est la règle du programme, et elle désigne désormais `L7`.

### `L7` — Faisabilité technique de l'initiation par un tiers

| Champ | Contenu |
| --- | --- |
| **Question** | Un participant peut-il initier une opération de paiement pour le compte d'un client **qu'il ne détient pas**, et le payeur peut-il s'authentifier **dans l'application du tiers** ? |
| **Origine** | Note de faisabilité technique versée au corpus le 2026-09-09, points 3 à 5 |
| **Terrain** | L'environnement de test annoncé par le portail développeur de la plateforme. **Gratuit.** Aucune autorisation, aucun partenaire, aucun capital |
| **Méthode** | Cinq épreuves successives, dans cet ordre. **Test 0** — l'accès au bac à sable est-il libre ou réservé aux participants agréés, une demi-heure. **Test 1** — cartographie exhaustive des points d'entrée, classés côté bénéficiaire, côté payeur et autorisation, deux à trois heures. **Test 1 bis** — un canal non-data est-il prévu, et un participant peut-il l'exposer. **Test 2** — dérouler un paiement de bout en bout et identifier le point exact où le payeur s'authentifie, une journée. **Test 3** — ce que le code à lire permanent transporte, et si le bénéficiaire peut rapprocher un paiement d'une vente, deux à trois heures. **Test 4** — confirmer qu'aucun point d'entrée ne concerne les cartes, une heure |
| **Niveau de preuve visé** | **1** — un comportement observé du système lui-même, non une déclaration |
| **Coût** | Nul. Deux à trois jours de travail |

#### Seuils pré-enregistrés du lot `L7`

Écrits avant toute épreuve, conformément à la règle `D3`. Le résultat du **Test 2** commande, et il n'a que trois issues.

| Issue du Test 2 | Ce qu'elle établit | Conséquence pré-écrite |
| --- | --- | --- |
| **Cas 1** — le payeur s'authentifie dans l'application du tiers | Le modèle visé est disponible | **Le produit est constructible tel qu'il est décrit.** La question redevient stratégique, et `L0` s'ouvre |
| **Cas 2** — le payeur s'authentifie chez son teneur de compte, par redirection ou notification | La promesse d'un geste unique tombe | **Le produit doit être repensé.** Deux options, aucune neutre : accepter le rebond vers l'application tierce et renoncer à la promesse, ou détenir soi-même le compte du payeur et changer de métier |
| **Cas 3** — aucune initiation par un tiers n'est prévue | La position d'initiateur tiers n'existe pas sur cette plateforme | **Le projet se reformule côté bénéficiaire** — acceptation marchande, outils, crédit. C'est ce que l'étude v1.0 concluait déjà, mais **pour une raison technique et non économique** |

| Issue du Test 0 | Conséquence pré-écrite |
| --- | --- |
| Accès libre | Les tests se conduisent seuls. Poursuivre |
| **Accès réservé aux participants agréés** | **Le mémo de partenariat devient le chemin critique immédiat.** Rien ne peut être testé sans un participant, et tout le plan se réordonne à nouveau |

> [!important] Le cas 3 ne tue pas le projet
> Il le renvoie vers la position que l'étude v1.0 identifiait déjà comme la seule défendable. **Deux analyses indépendantes convergeraient alors par deux chemins différents** — l'une économique, l'autre technique. Ce serait un signal fort, et il devrait être écrit comme tel.

### Ce que la note de faisabilité ajoute au-delà de la faisabilité

Deux éléments qui n'appartiennent pas au lot `L7` mais qui sont portés au registre.

**La couverture réelle du canal.** La règle de conception revendiquée — *« le plus proche possible du paiement en espèces »* — a une conséquence que la description du produit abandonne : les espèces n'exigent rien de l'infrastructure de l'autre partie. Or le modèle décrit exige du payeur un téléphone intelligent, une connexion au moment de l'achat et une application installée. **L'accès à Internet au Burkina Faso est de 25,7 %** — fait `F14`. Un canal non-data avait été prévu par le document fondateur v0.1 et n'a plus été mentionné depuis. C'est l'objet du Test 1 *bis*.

**La règle de sécurité issue d'un incident observé.** Un identifiant de réception — publiable, permanent, affichable — ne doit **jamais** participer à un parcours de débit. Une cérémonie de sortie exige possession, secret et canal distinct. Cette règle est portée comme principe de conception `P4` au [[payMe/90-pilotage/Registre des statuts|Registre des statuts]], sans qu'aucun acteur ne soit nommé.

---

## 3 bis. Le lot `L0` — seize heures qui tranchent le marché

### `L0` — La taxonomie du retrait

| Champ | Contenu |
| --- | --- |
| **Question** | Le retrait d'espèces est-il **subi** ou **choisi** ? |
| **Pourquoi ce lot décide de tout** | Sur chaque franc entré en monnaie électronique, 0,98 ressort en espèces. Deux lectures s'opposent : préférence pour l'espèce, ou absence d'aval. **Aucune statistique publique ne les départage** — un rapport de banque centrale compte des retraits, il n'enregistre pas leur cause |
| **Méthode** | **Douze entretiens, environ seize heures.** Huit **payeurs** — utilisateurs actifs de monnaie électronique, zone urbaine, douze minutes chacun. Quatre **commerçants**, dont au moins deux ayant essayé puis abandonné, vingt-cinq minutes chacun |
| **La question centrale, à ne jamais reformuler** | *« Si la personne — ou le commerçant — avait pu recevoir directement sur son compte, auriez-vous retiré quand même ? »* Elle sépare le subi du choisi en une phrase |
| **Taxonomie à coder** | **Retrait subi** — `A` bénéficiaire inatteignable, `B` **point d'acceptation absent**, `C` obligation externe. **Retrait choisi** — `D` préférence de possession, `E` défiance envers le compte, `F` crainte des frais ou du blocage |
| **Coût** | Seize heures, sans budget d'enquête. Le protocole est exécutable dans une file d'attente ou une station-service |
| **Niveau de preuve visé** | 2 sur les déclarations, 1 sur le dernier retrait effectivement décrit |
| **Enregistrement** | Verbatims bruts conservés intégralement, séparés de toute synthèse. Double codage à sept jours d'intervalle, **comptage explicite des infirmations** |
| **Seuil pré-enregistré** | Si la cause **`B`** représente **moins de 25 %** des retraits codés, le marché revendiqué n'existe pas sous la forme décrite, et la position du point 7 de l'addendum tombe. Si la cause **`A`** domine, le marché se referme au 30 septembre 2026 sans que le projet y soit pour rien |
| **Échéance** | **Avant le 2026-09-30.** Passée cette date, la mesure ne répond plus à la même question |

### `L1` — Vérification de l'état de connexion

| Champ | Contenu |
| --- | --- |
| **Question** | La liste officielle des participants connectés a-t-elle changé depuis le 2 avril 2026, et qu'advient-il au 30 septembre ? |
| **Fait de départ** | Neuf institutions connectées au Burkina Faso, dont six banques et **un seul émetteur de monnaie électronique**. Wave, Moov Money, Telecel Money, Coris Money et Sank Money n'y figurent pas |
| **Méthode** | Relevé documentaire sur les publications officielles. Aucune autorisation |
| **Coût** | Une demi-journée |
| **Niveau de preuve visé** | 1 — publication officielle |
| **Seuil pré-enregistré** | Si les trois émetteurs absents se connectent effectivement au 30 septembre, la cause `A` disparaît et **seule la cause `B` peut porter le projet**. Le résultat de `L0` devient alors l'unique fondement |

### Jalon 1 — le premier point d'arrêt possible

**Révisé le 2026-09-09.** Il rend désormais sur **deux** questions, dans cet ordre, et la première conditionne la seconde.

| # | Question | Lot | Réponse défavorable |
| --- | --- | --- | --- |
| **1** | **Le produit décrit est-il constructible par un tiers ?** | `L7` | Le cas 3 ne l'arrête pas, mais le **reformule côté bénéficiaire**, et `L0` change alors d'objet |
| **2** | **Le retrait subi par absence d'acceptation représente-t-il au moins un quart des retraits ?** | `L0` | Une réponse négative **arrête le projet** |

La deuxième question ne se pose utilement qu'après la première : si le produit doit être reformulé côté bénéficiaire, la taxonomie du retrait reste pertinente mais son seuil ne commande plus la même décision.

Une réponse favorable aux deux n'ouvre pas la conception : elle ouvre la vague 1.

---

## 4. Vague 1 — l'éligibilité, la rétention, le consentement

Les trois hypothèses du plan de preuve du corpus, reprises avec leurs critères de mort inchangés.

### `L2` — Éligibilité et acceptation

| Champ | Contenu |
| --- | --- |
| **Hypothèse** | Un commerçant informel acceptera et maintiendra un encaissement numérique si le coût fixe est nul, le règlement instantané, et l'inscription possible sans registre du commerce ni identifiant fiscal |
| **Méthode** | 50 commerçants, trois zones contrastées — marché central, quartier périphérique, axe commerçant —, huit semaines |
| **Mesure** | Taux d'activation, rétention à quatre et huit semaines, transactions par jour |
| **Critère de mort** | **Moins de 40 % encore actifs à huit semaines** |
| **Préalable bloquant** | Établir ce que la réglementation d'identification de la clientèle autorise réellement pour un compte marchand de faible valeur. **Sans cette réponse, le lot n'est pas testable** |

### `L3` — Rétention du numérique, l'hypothèse décisive

| Champ | Contenu |
| --- | --- |
| **Hypothèse** | Sur la cohorte de `L2`, plus de 25 % de la valeur encaissée reste dans le circuit numérique à sept jours |
| **Mesure** | Part de la valeur restée numérique, ratio de sortie en espèces à quarante-huit heures, destination des sorties |
| **Critère de mort** | **Part restée numérique inférieure à 10 %** |
| **Portée** | C'est l'hypothèse qui décide de tout. Si elle tombe, il n'y a pas d'actif à construire dans ce pays à ce stade. Le référentiel national actuel étant d'environ 2 %, tout résultat au-dessus de 10 % constitue déjà une information majeure |

### `L4` — Le régime réglementaire et la dépendance

| Champ | Contenu |
| --- | --- |
| **Question** | Sous quel régime `payMe` peut-il opérer, et cette dépendance conditionne-t-elle son existence ? |
| **Pourquoi ce lot est obligatoire** | Règle `D1`. La position revendiquée est celle d'un tiers **sans compte propre et sans flottant**, ce qui allège la dépendance sans la supprimer : l'accès au rail suppose un participant agréé |
| **Méthode** | Obtenir une réponse écrite de la Banque centrale ou d'un participant agréé sur trois points : la tarification côté bénéficiaire commerçant, l'identification minimale exigée d'un compte marchand, et le régime applicable à l'octroi de crédit par un établissement de paiement |
| **Seuil pré-enregistré** | Si aucune des trois réponses n'est obtenue par écrit en huit semaines, la dépendance est classée **non maîtrisée** et le périmètre doit être réduit à ce qui ne l'exige pas |

### Jalon 2 — le commerçant et la rétention

Il rend sur deux questions : **le commerçant adopte-t-il ?** et **la valeur reste-t-elle ?** Une réponse négative à la seconde arrête le projet.

---

## 5. Vague 2 — l'actif et le payeur

### `L5` — L'actif : ce qui se creuse à l'usage

| Champ | Contenu |
| --- | --- |
| **Question** | Qu'est-ce que le produit accumule qui le rende plus difficile à déloger à mesure qu'il sert ? |
| **Pourquoi ce lot est obligatoire** | Règle `D2` |
| **Candidat principal, hérité du corpus** | Le **graphe transactionnel du commerce informel** : l'historique de flux vérifié de commerçants sans états financiers, sans identifiant fiscal et sans garantie bancaire. Il ne s'obtient qu'en ayant réellement encaissé pour eux pendant des années, et sa valeur croît de façon non linéaire avec la durée et la densité |
| **Second candidat** | La **vue consolidée du participant**, que personne d'autre ne peut voir puisque chaque opérateur ne voit que son propre compte. Le corpus la fonde sur une raison **structurelle** — le conflit d'intérêt d'un opérateur — et non sur une simple antériorité |
| **Test de composition** | L'avantage se **creuse-t-il** à chaque usage, ou est-il seulement acquis ? Un avantage qui ne se creuse pas est une avance, et une avance se rattrape |
| **Seuil pré-enregistré** | L'actif n'est retenu que si le lot `L3` établit qu'une part mesurable de la valeur reste numérique. Un graphe transactionnel construit sur des flux qui ressortent en espèces à quarante-huit heures n'enregistre rien d'exploitable |

### `L6` — Le payeur : qui paie, combien, contre quelle preuve

| Champ | Contenu |
| --- | --- |
| **Hypothèse** | Au moins 15 % des commerçants retenus acceptent un service payant au-dessus du paiement gratuit — avance de trésorerie, crédit de stock, outil de suivi |
| **Pourquoi ce lot est obligatoire** | Règle `D2`. Le corpus établit par ailleurs que **le paiement seul ne finance rien** : le rail étant gratuit, le revenu doit venir d'ailleurs |
| **Méthode** | Aucune question d'intention. Proposition d'une avance de trésorerie plafonnée, adossée au volume observé sur six semaines |
| **Niveau de preuve exigé** | **1** — une transaction ou un engagement coûteux. Une déclaration d'intention de payer ne vaut rien à ce lot |
| **Critère de mort** | **Moins de 5 %** |

### Jalon 3 — l'ouverture du cadrage stratégique

Il rend sur : le produit a-t-il un actif qui se creuse, et un payeur établi par une trace d'engagement ? Une réponse favorable ouvre `20-cadrage-strategique`. **La création de ce dossier est elle-même une décision à journaliser.**

---

## 6. Livrables de fin de programme

Repris du corpus, sans modification de fond.

1. Réponse écrite de la Banque centrale ou d'un participant agréé sur les trois points du lot `L4`.
2. Cohorte de 50 commerçants instrumentée, avec la part de valeur restée numérique effectivement mesurée.
3. Un partenaire agréé engagé par lettre d'intention.
4. **Décision documentée de poursuite ou d'arrêt**, avec le résultat de chaque critère de mort.

---

## 7. Ordre de renoncement

| Rang | Lot | Motif |
| --- | --- | --- |
| 1 | `L5` — l'actif | Son absence interdit de revendiquer une position, elle n'interdit pas de conclure |
| 2 | `L2` — l'éligibilité | Absorbable par un échantillon réduit, en perdant en représentativité |
| — | **`L7`, `L0`, `L1`, `L3`, `L4`, `L6`** | **Jamais abandonnés.** Ils portent la constructibilité, la nature du marché, l'échéance, la rétention, la dépendance réglementaire et le payeur |

Deux lots ne s'abandonnent sous aucune contrainte. **`L7`**, parce qu'il coûte deux à trois jours et décide si le produit peut exister : tout ce qui le précéderait serait dépensé à l'aveugle. Et **`L0`**, parce que sans lui la cohorte de `L2` serait recrutée sur un marché dont l'existence n'est pas établie.

---

## 8. Ce que ce programme ne fait pas

Il ne conçoit rien et n'ouvre aucune phase aval. **Chaque seuil est écrit avant d'être mesuré** ; un seuil réécrit après coup annule le lot qui le porte.

Il ne reprend pas à son compte la position défendable formulée par le corpus — *« le seul acteur neutre du paiement quotidien burkinabè »*. Cette formulation est une **proposition à tester**, elle est enregistrée comme telle au [[payMe/90-pilotage/Registre des statuts|Registre des statuts]], et aucun lot ne la présuppose.

---

*Version 0.2 — huit lots, trois jalons. Révisée le 2026-09-09 : le lot `L7` prend le premier rang de la vague 0, et le jalon 1 rend désormais sur deux questions. Aucune décision de projet prise.*
