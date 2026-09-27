---
projet: "payMe"
type: "protocole-de-lot"
phase: "10-etudes"
lot: "L0"
version: "1.0"
objet: "Cadre d'échantillonnage, instruments de collecte, grille de codage et seuils pré-enregistrés du lot L0"
monde: "Monde observé — protocole de collecte, données personnelles minimisées"
statut: "Pré-enregistré le 2026-09-09, avant toute collecte. Non modifiable après le premier entretien"
echeance: 2026-09-30
cree_le: 2026-09-09
tags:
  - payMe
  - etudes
  - vague-0
  - protocole
---

# Protocole de la vague 0 — lot `L0`

Instrument de collecte du lot **`L0` — la taxonomie du retrait**. Il est écrit **avant toute collecte**, conformément à la règle `D3` de la [[Doctrine du coffre]].

> [!warning] Le rang du lot `L0` a changé le 2026-09-09, son protocole n'a pas changé
> Le programme est passé en V0.2 : le lot **`L7` — faisabilité technique** prend le premier rang de la vague 0, et `L0` passe en troisième. Motif au point 3 du [[payMe/10-etudes/Programme d'études|Programme d'études]] — la constructibilité précède le marché, et elle se mesure en deux à trois jours contre seize heures de collecte pour `L0`.
> **Aucun élément du présent protocole n'est modifié par ce changement de rang** : ni le cadre d'échantillonnage, ni les instruments, ni la grille de codage, ni les seuils. Le protocole reste pré-enregistré dans les termes du 2026-09-09.
> **Conséquence pratique** : conduire `L7` avant la collecte de `L0`. Si `L7` conclut au cas 3 — reformulation côté bénéficiaire —, la taxonomie du retrait reste pertinente mais son seuil ne commande plus la même décision, et le point 8.1 devra être relu à cette lumière **avant** la collecte, jamais après.

> [!danger] Ce document est gelé au premier entretien
> Tous les seuils, toutes les règles de codage et toutes les formulations de questions figurant ci-dessous sont **pré-enregistrés**. À compter du premier entretien conduit, **aucun ne se modifie**.
> Un seuil réécrit après avoir vu le résultat annule le lot qui le porte. Si une difficulté impose une modification, elle se consigne comme une **révision datée** au [[payMe/90-pilotage/Journal des décisions|Journal des décisions]], et les entretiens déjà conduits sont traités séparément de ceux qui suivent.

---

## 1. La question du lot, et pourquoi elle décide

Sur chaque franc entré en monnaie électronique au Burkina Faso, **0,98 franc ressort en espèces** — fait `F7`. Ce chiffre admet deux lectures que **rien dans les statistiques publiques ne départage** : un rapport de banque centrale compte des retraits, il n'enregistre pas leur cause.

| Lecture | Ce que 0,98 signifie | Décision qui en découle |
| --- | --- | --- |
| **Préférence** | Les gens veulent de l'espèce ; le numérique ne tient pas | Renoncer, ou changer de segment |
| **Contrainte** | Les gens sont **contraints** de retirer, faute d'un aval qui accepte | Construire l'aval |

**Ce lot tranche entre les deux.** Il ne cherche rien d'autre, et tout ce qui l'en éloigne est hors périmètre.

---

## 2. Ce que le lot `L1` a changé au protocole, avant que celui-ci ne soit gelé

Le [[payMe/10-etudes/Relevé de l'état de connexion|relevé du lot `L1`]], conduit le 2026-09-09, apporte un fait qui modifie l'instrument — et il est intégré **avant** la collecte, non après.

> [!important] La cause `A` ne disparaîtra pas uniformément au 30 septembre
> Le corpus posait que la cause `A` — *« la personne est sur un autre opérateur »* — serait résolue par l'échéance. Ce raisonnement supposait que **tous** les émetteurs se connecteraient.
> Or l'absence de Wave repose en partie sur un motif **structurel** : la gratuité des transferts sur la plateforme heurte un revenu fondé sur leur facturation — fait `F12`. Un acteur dont le modèle économique est contredit par la plateforme a un intérêt à ne pas s'y connecter.
> **Conséquence sur l'instrument** : lorsque la cause `A` est codée, **l'opérateur concerné est relevé**. Sans cette précision, la mesure ne permet pas de distinguer une cause `A` qui va disparaître d'une cause `A` qui va persister.

---

## 3. Cadre d'échantillonnage

### 3.1. Composition

| Groupe | Nombre | Durée unitaire | Total |
| --- | --- | --- | --- |
| **Payeurs** — utilisateurs actifs de monnaie électronique | **8** | 12 minutes | 1 h 36 |
| **Commerçants** — dont **au moins 2 ayant essayé puis abandonné** l'encaissement numérique | **4** | 25 minutes | 1 h 40 |
| **Total collecte** | **12** | | **3 h 16** |

Le reste des seize heures annoncées couvre le repérage, les déplacements, les refus, la transcription et le double codage.

### 3.2. Critères d'inclusion — payeurs

Une personne est retenue si **les trois conditions** sont réunies.

1. Elle possède un compte de monnaie électronique actif, quel que soit l'opérateur.
2. Elle a effectué **au moins un retrait d'espèces dans les trente derniers jours**.
3. Elle accepte l'entretien après lecture de la notice du point 7.

### 3.3. Critères d'exclusion — payeurs

Une personne est écartée, et le motif est consigné, si l'un des cas suivants se présente.

- Elle appartient au cercle personnel ou professionnel du porteur. **Ce critère n'est pas négociable** : un proche répond à la personne qui l'interroge, pas à la question.
- Elle est employée par un opérateur de monnaie électronique, une banque ou un établissement de paiement.
- Elle a déjà été interrogée dans le cadre de ce lot.

### 3.4. Zones de recrutement

**Trois zones contrastées de Ouagadougou**, réparties de façon à ne pas concentrer l'échantillon sur un seul profil économique.

| Zone | Ce qu'elle apporte |
| --- | --- |
| **Marché central ou grand marché** | Densité commerçante, transactions fréquentes et de faible montant |
| **Quartier périphérique** | Population moins équipée, acceptation numérique plus rare |
| **Axe commerçant ou station-service** | Transactions de montant plus élevé, clientèle mobile |

**Répartition visée** : deux à trois payeurs par zone, et au moins un commerçant par zone.

> [!note] Le repérage précède la collecte, et il compte dans le temps
> Un entretien de douze minutes se conduit dans une file d'attente, un maquis ou une station-service. La contrainte n'est pas la durée de l'entretien, c'est **le temps passé à trouver douze personnes disposées à le donner**.

### 3.5. Ce que l'échantillon ne permettra pas

Douze entretiens ne produisent **aucune représentativité statistique**, et le protocole ne prétend pas en produire. Ils produisent une **distribution de causes** suffisamment nette pour départager deux lectures opposées — ou insuffisamment nette, ce qui est également un résultat, et qui devra être écrit comme tel.

---

## 4. Instrument payeur — six questions, douze minutes

> [!danger] Règles de passation, à respecter sans exception
> **Ne jamais nommer le projet, ni décrire une solution.** La personne interrogée ne doit pas savoir qu'un produit est envisagé : elle décrirait alors ce qu'elle croit qu'on attend d'elle.
> **Ne jamais employer le vocabulaire du dossier** : ni *interopérabilité*, ni *acceptation*, ni *rétention*, ni *cause subie*.
> **Ne jamais reformuler la question `P2`.** C'est elle qui sépare le subi du choisi ; toute reformulation change ce qu'elle mesure.
> **Ne jamais suggérer une réponse** en énonçant les options à voix haute pour `P3`. Les cases sont un outil de codage pour l'enquêteur, pas une liste à lire.

### 4.1. Le formulaire

**Entretien n°** `___`  ·  **Zone** `______________`  ·  **Date** `__________`  ·  **Durée** `_____`

---

**`P1`.** *La dernière fois que vous avez retiré de l'argent, c'était pour quoi faire exactement ?*

> Question ouverte. **Laisser parler.** Ne pas relancer avant un silence de cinq secondes. Noter les mots employés, pas leur interprétation.

`________________________________________________________________`

`________________________________________________________________`

---

**`P2`.** *Si la personne — ou le commerçant — avait pu recevoir directement sur son compte, auriez-vous retiré quand même ?*

☐ **Non**, j'aurais envoyé directement  ☐ **Oui**, j'aurais retiré quand même  ☐ **Ça dépend** : `______________`

> **C'est LA question du lot.** Elle sépare le subi du choisi en une phrase. **Ne jamais la reformuler**, ne jamais l'abréger, ne jamais l'expliquer.

---

**`P3`.** *(uniquement si « Non »)* — *Pourquoi ne pouviez-vous pas envoyer directement ?*

> Question ouverte. Coder après coup, sans lire les options.

☐ La personne n'a pas de compte → **cause `A`**
☐ Elle est sur un autre opérateur → **cause `A`** · **opérateur : `______________`**
☐ Le commerçant ou le prestataire n'accepte pas → **cause `B`**
☐ On m'a demandé de l'espèce → **cause `C`**
☐ Autre : `______________________________`

> [!important] Le relevé de l'opérateur est obligatoire pour la cause `A`
> Ajout du 2026-09-09, motivé au point 2. Une cause `A` sans opérateur nommé **ne peut pas être exploitée** : elle ne dit pas si l'obstacle disparaîtra à l'échéance ou s'il persistera.

---

**`P4`.** *(uniquement si « Oui »)* — *Qu'est-ce qui fait que vous préférez avoir l'argent en main ?*

> Question ouverte. Coder après coup en `D` — préférence de possession, `E` — défiance envers le compte, ou `F` — crainte des frais ou du blocage.

`________________________________________________________________`

---

**`P5`.** *Sur les dix derniers paiements que vous avez faits, combien étaient en espèces ?*

`____ / 10`    ·    ☐ ne sait pas

> Ancrage chiffré. Il donne un ordre de grandeur individuel, à confronter au récit.

---

**`P6`.** *Y a-t-il un endroit où vous allez souvent et où vous aimeriez pouvoir payer sans espèces ?*

☐ Non   ☐ Oui — lequel : `______________________________`

> Question de clôture. Elle ouvre sur la cause `B` sans jamais la nommer, et elle repère les lieux d'acceptation manquants.

---

## 5. Instrument commerçant — vingt-cinq minutes

**Entretien n°** `___`  ·  **Zone** `______________`  ·  **Activité** `______________`  ·  **Date** `__________`

**`C1`.** *Comment vos clients vous paient-ils, en général ?*

**`C2`.** *Est-ce que vous acceptez le paiement par téléphone ? Depuis quand, ou pourquoi pas ?*

**`C3`.** *(si non, ou si abandonné)* — *Qu'est-ce qui vous en a empêché, ou qu'est-ce qui vous a fait arrêter ?*

> Question centrale du groupe commerçant. **Laisser parler.** Ne pas proposer de motifs.

**`C4`.** *Quand vous recevez de l'argent sur votre compte, qu'en faites-vous ensuite ?*

> Cette question mesure la **rétention** du côté commerçant, et prépare le lot `L3`.

**`C5`.** *Vos fournisseurs, vous les payez comment ?*

> Cette question éclaire la voie « grossiste vers détaillant », troisième actif candidat du corpus.

**`C6`.** *Est-ce que vous avez déjà payé pour un outil qui vous aide à gérer votre commerce ?*

> Question de trace, non d'intention. Elle prépare le lot `L6` — le payeur — et ne demande **jamais** si la personne *serait prête* à payer.

**`C7`.** *(si le commerçant a essayé puis abandonné)* — *Combien de temps avez-vous tenu, et qu'est-ce qui a fait la différence ?*

---

## 6. Grille de codage

### 6.1. Les six causes

| Type | Code | Cause | Portée pour le projet |
| --- | --- | --- | --- |
| **Subi** | `A` | Bénéficiaire inatteignable — pas de compte, ou opérateur non interopérable | **À ventiler par opérateur.** Certains se connecteront, d'autres peut-être pas |
| **Subi** | `B` | **Point d'acceptation absent** — le commerçant, le grossiste ou le prestataire n'accepte pas | **Le marché revendiqué** |
| **Subi** | `C` | Obligation externe — loyer, main-d'œuvre journalière, taxe exigée en espèces | Hors de portée |
| **Choisi** | `D` | Préférence de possession | Travail de long terme |
| **Choisi** | `E` | Défiance envers le compte | Travail de long terme |
| **Choisi** | `F` | Crainte des frais ou du blocage | Adressable par le produit |

### 6.2. Règles de codage, et cas limites

1. **Un entretien, un code principal.** C'est le dernier retrait décrit en `P1` qui est codé, pas l'habitude déclarée.
2. **La réponse « ça dépend » à `P2` n'est jamais codée seule.** Elle exige que `P3` et `P4` soient tous deux posés, et l'entretien reçoit alors **deux codes**, l'un subi et l'un choisi, comptés séparément et signalés comme tels.
3. **Un motif absent de la liste se code `Autre`, jamais rattaché de force.** Trois occurrences ou plus d'un même motif `Autre` ouvrent une septième cause, qui devra être nommée et datée au journal.
4. **Une cause `A` sans opérateur nommé est codée `A?`** et comptée à part. Elle ne compte ni pour la persistance, ni pour la résorption de la cause `A`.
5. **La cause `C` n'est pas une cause `B` déguisée.** *« On m'a demandé de l'espèce »* relève de `C` ; *« il n'a pas de moyen d'accepter »* relève de `B`. Le critère est la **capacité**, non la demande.
6. **Le doute se code au désavantage de la thèse.** Un cas ambigu entre `B` et `D` se code `D`. Cette règle est pré-enregistrée pour interdire au codeur de faire pencher le résultat.

### 6.3. Double codage

Le codage est conduit **deux fois par la même personne, à sept jours d'intervalle**, sans consulter le premier codage.

- **Les désaccords entre les deux passes sont comptés et publiés**, pas arbitrés en silence.
- Un taux de désaccord **supérieur à 25 %** rend la grille inexploitable : elle est alors reprise, et les entretiens sont recodés intégralement après révision datée au journal.
- **Les verbatims bruts sont conservés intégralement**, séparés de toute synthèse, et ne sont jamais réécrits.

### 6.4. Comptage des infirmations

Le relevé consigne explicitement, et au même rang que les confirmations, **le nombre d'entretiens qui contredisent chacune des lectures**. Un lot qui ne rapporte que ce qui va dans son sens n'a rien mesuré.

---

## 7. Cadre éthique et données personnelles

### 7.1. Notice à lire avant chaque entretien

> *« Je fais un travail personnel sur la façon dont les gens utilisent l'argent mobile ici. Ça prend une dizaine de minutes. Je ne note pas votre nom, je ne demande pas votre numéro, et je ne note aucun montant précis. Vous pouvez vous arrêter quand vous voulez, et vous pouvez refuser de répondre à une question. Est-ce que vous êtes d'accord ? »*

Le consentement est **oral**, et sa date est consignée sur le formulaire par une case cochée. Aucune signature n'est demandée : une signature créerait une donnée nominative que le protocole s'interdit précisément de recueillir.

### 7.2. Ce qui n'est jamais recueilli

Nom, prénom, numéro de téléphone, numéro de compte, adresse précise, photographie, enregistrement sonore, **montant exact d'une transaction**.

L'ancrage chiffré de `P5` porte sur une **proportion sur dix**, jamais sur une somme.

### 7.3. Conservation

Les formulaires portent un **numéro d'ordre** et rien d'autre. Ils sont conservés par le porteur, hors du coffre, et ne sont ni photographiés ni transmis. **Seuls les verbatims anonymisés et les comptages entrent dans le coffre.**

---

## 8. Seuils pré-enregistrés

> [!danger] Écrits avant toute collecte, non modifiables après le premier entretien
> Règle `D3`. Un seuil réécrit après avoir vu le résultat annule le lot.

### 8.1. Seuil principal

| Mesure | Seuil | Conséquence pré-écrite |
| --- | --- | --- |
| **Part de la cause `B`** parmi les retraits codés | **≥ 25 %** | La lecture « contrainte » est retenue. Le marché revendiqué existe sous la forme décrite, et la vague 1 s'ouvre |
| | **< 25 %** | La lecture « contrainte » est **infirmée**. La position formulée par le corpus tombe, et le projet doit être reformulé ou arrêté |

### 8.2. Seuil de refermeture

| Mesure | Seuil | Conséquence pré-écrite |
| --- | --- | --- |
| **Part de la cause `A` dont l'opérateur figure parmi ceux tenus de se connecter au 30 septembre 2026** | **≥ 50 % des causes `A`** | Cette part du marché **se referme à l'échéance**, sans que le projet y soit pour rien. Elle est retirée du dimensionnement |
| **Part de la cause `A` dont l'opérateur n'est pas tenu de se connecter, ou a un motif structurel de ne pas le faire** | — | Cette part **persiste** et s'ajoute à la cause `B` dans le dimensionnement du marché |

### 8.3. Seuil de validité du lot

| Mesure | Seuil | Conséquence pré-écrite |
| --- | --- | --- |
| Entretiens exploitables | **< 10 sur 12** | Le lot est **incomplet**. Il ne rend pas, et la collecte se poursuit |
| Désaccord entre les deux passes de codage | **> 25 %** | La grille est inexploitable. Révision datée, puis recodage intégral |
| Cause `A?` — opérateur non relevé | **> 3 entretiens** | Le relevé de l'opérateur n'a pas été tenu. Les entretiens concernés sont écartés du seuil 8.2 |

### 8.4. Ce qu'aucun résultat n'autorise

Aucun résultat de ce lot **n'autorise une décision de projet**. Le lot rend sur une question de fait ; l'issue s'inscrit au jalon 1, et le registre `DEC-P-` reste fermé jusque-là.

---

## 9. Contrainte de calendrier

> [!danger] La collecte doit être achevée avant le 2026-09-30
> La cause `A` est précisément ce que l'échéance du 30 septembre est censée supprimer pour les acteurs connectés. **Une mesure conduite avant et une mesure conduite après ne répondent pas à la même question.**
> Si la collecte devait déborder cette date, les entretiens conduits après le 30 septembre sont **datés, séparés et comptés à part**. Ils ne sont pas mélangés aux précédents.
>
> **Réserve.** L'échéance du 30 septembre 2026 résulte d'un report annoncé le 25 juin 2026, cinq jours avant l'échéance précédente, et s'inscrit dans une série de six reports en dix-huit mois — fait `F11`. **Rien n'établit qu'elle sera tenue.** Le protocole ne suppose ni qu'elle le sera, ni qu'elle ne le sera pas ; il date simplement chaque entretien.

---

## 10. Ce qui reste à faire, et par qui

| # | Travail | Qui | État |
| --- | --- | --- | --- |
| 1 | Relevé documentaire de l'état de connexion — lot `L1` | — | **Conduit le 2026-09-09** |
| 2 | **Obtenir la liste des participants arrêtée au 31 juillet 2026** | Porteur | **À faire avant le codage.** Le document n'a pas pu être récupéré ; sa composition burkinabè est inconnue |
| 3 | Imprimer douze formulaires payeur et quatre formulaires commerçant | Porteur | À faire |
| 4 | Repérer les trois zones et identifier les créneaux de passage | Porteur | À faire |
| 5 | **Conduire les douze entretiens** | Porteur | **À faire avant le 2026-09-30** |
| 6 | Première passe de codage | Porteur | Après collecte |
| 7 | Seconde passe de codage, à sept jours d'intervalle | Porteur | À J+7 |
| 8 | Rédaction du relevé de lot, avec comptage des infirmations | — | Une fois les verbatims et les comptages fournis |
| 9 | Note de jalon 1 | — | Après le relevé |

> [!important] Ce que le présent protocole ne peut pas faire
> Les entretiens des points 5 à 7 exigent une présence sur le terrain et un contact avec des personnes. **Ils ne peuvent pas être conduits autrement que par le porteur.**
> Le protocole est fait pour être imprimé et emporté tel quel. Une fois les verbatims anonymisés et les comptages disponibles, le relevé de lot et la note de jalon peuvent être rédigés.

---

*Version 1.0 — pré-enregistré le 2026-09-09, avant toute collecte. `DEC-C-080`.*
