---
type: "note-de-pilotage-transverse"
portee: "Coffre entier — les six projets, et tout projet à venir"
objet: "Règles de conception et d'étude opposables à tous les projets"
statut: "Opposable — trois règles promues le 2026-09-08 par DEC-C-049"
regles_opposables: 3
regles_candidates: 1
cree_le: 2026-09-08
tags:
  - coffre
  - doctrine
  - methode
---

# Doctrine du coffre

Règles de **conception et d'étude** opposables à tous les projets du coffre, et à tout projet à venir.

> [!important] Ce que cette note est, et ce qu'elle n'est pas
> Elle est **opposable** : un document de projet qui la contredit est en écart, et l'écart doit être nommé et motivé, ou corrigé.
> Elle **ne décide rien pour aucun projet**. Elle fixe la manière d'instruire, jamais la conclusion à atteindre.
> Elle **ne remplace pas** les règles de tenue documentaire — nommage, journalisation, statuts, sources — qui restent à l'[[Index du coffre]]. Les deux ensembles sont de nature différente : celles-ci portent sur la méthode, celles-là sur le rangement.

## Comment une règle entre ici

Une règle n'est promue que si elle satisfait trois conditions cumulatives.

1. **Elle a été atteinte au moins deux fois indépendamment**, par des projets qui ne se citaient pas — ou une fois, mais démontrée par l'échec constaté de son absence.
2. **Elle se formule sans nommer de projet.** Une règle qui ne vaut que pour un terrain n'est pas une doctrine, c'est une décision de projet.
3. **Elle est opposable, donc vérifiable.** On doit pouvoir dire d'un document s'il la respecte ou non.

Sa promotion est inscrite au [[ecoFab/90-pilotage/Journal des décisions\|Journal des décisions]] du coffre. Son retrait aussi.

---

## D1 — Une dépendance qu'on ne signe pas soi-même est une cible, jamais une condition d'existence

> **Énoncé.** Un projet dont l'existence dépend d'un accord, d'une convention ou d'un accès qu'il ne contrôle pas **n'est pas un modèle, c'est une attente**. Tout projet doit être viable dans son mode le plus autonome dès le premier jour. La dépendance forte est prévue, préparée, et non bloquante : le champ existe, il est rempli quand il peut l'être, et son absence n'arrête jamais le système.

### Origine

Deux projets y sont arrivés séparément, sans se citer.

| Projet | Formulation | Source |
| --- | --- | --- |
| `ecoFab` | Quatre niveaux de dépendance à l'identifiant national, du plus fort au plus faible, avec la règle : *« le projet doit être viable au niveau 3 ou 4 dès le premier jour »* | Lot L5 du [[Programme d'études approfondies]] |
| `synapse` | *« Identité, comptes, rôles, révocation, **champ d'identifiant national prévu mais non bloquant** »* | Point 1 du noyau retenu, [[Dossier de faisabilité]] |

### Ce qu'elle proscrit

Placer sur le chemin critique une convention non signée, un accès non accordé, une autorisation non obtenue. Le délai d'une démarche administrative n'est pas un risque technique : il n'est pas maîtrisable, et il ne se rattrape pas.

### Portée réelle

La règle ne porte pas sur l'identifiant national. Elle porte sur **toute dépendance dont la levée appartient à un tiers** : convention ministérielle, accès à un référentiel, partenariat institutionnel, autorisation d'enquête, financement conditionnel.

### Comment on la vérifie

Pour chaque dépendance d'un projet, deux questions. **Qui signe ?** Si ce n'est pas le porteur, la dépendance est forte. **Que fait le système si la signature n'arrive jamais ?** Si la réponse est « rien », le projet est en écart.

### Précédent d'application

`DEC-P-001` d'`ecoFab` faisait de l'identifiant national le mécanisme de distinction des statuts, donc une dépendance de niveau 1 sur le chemin critique. Elle a été **annulée le 2026-09-08**, pour ce motif de fond autant que pour un vice de forme. L'annulation n'a créé aucune décision de remplacement : elle a restauré la règle que le lot L5 portait déjà.

---

## D2 — Tout programme d'études porte un lot « actif » et un lot « payeur »

> **Énoncé.** Un programme de recherche instruit spontanément **ce qui se demande à des gens**, et oublie **ce qui se possède** et **qui paie**. Ces deux angles morts ne se découvrent qu'au jalon final, quand il est trop tard pour les instruire. Tout programme d'études du coffre porte donc, dès sa première version, un lot consacré à l'actif et un lot consacré au payeur.

### Origine

Une démonstration par l'échec, puis une application préventive.

| Projet | Fait | Source |
| --- | --- | --- |
| `ecoFab` | Ses dix lots initiaux instruisaient le problème, la valeur et les contraintes. **Aucun n'instruisait l'actif ni le payeur.** Le programme a été noté `P3 = 1` et déclaré *« non instruit, programme à compléter »* sur ce seul critère | [[Épreuve de l'actif et de la valeur]], point 7.1 |
| `levelup` | Son programme d'études porte les deux lots **dès sa version 0.1**, en correctif préventif du constat précédent | [[levelup/10-etudes/Programme d'études\|Programme d'études de levelup]], point 4 |

### Contenu minimal du lot « actif »

Trois questions distinctes, dont aucune n'est technique.

| Question | Ce qu'elle établit |
| --- | --- |
| **Que s'accumule-t-il ?** | L'objet qui grossit avec l'usage, et qui n'est pas le point d'entrée |
| **Cela se creuse-t-il ?** | L'avantage augmente-t-il à chaque usage et à chaque unité de temps, ou est-il seulement acquis ? Un avantage qui ne se creuse pas est une avance, et une avance se rattrape |
| **À qui cela appartient-il ?** | Question juridique et contractuelle, à instruire **avant** toute modélisation et avant toute conservation durable |

### Contenu minimal du lot « payeur »

Une question, et une distinction que rien ne remplace.

**Qui porte aujourd'hui une ligne de coût pour ce problème, même cachée ?** — salaire de qui le fait à la main, pénalités, rebuts, temps perdu, dépense déjà engagée ailleurs.

La distinction entre **qui subit**, **qui décide** et **qui paie** est explicite. Ces trois rôles sont rarement la même personne, et les confondre produit un modèle économique imaginaire.

### Ce que l'absence de réponse signifie

Aucun payeur identifiable **ne disqualifie pas** un projet. Elle le fait basculer du statut de produit à celui d'infrastructure publique ou d'œuvre. Ce basculement change la forme juridique, le financement, la gouvernance et le contenu du dernier jalon. **Il doit être acté explicitement, jamais subi.**

### Comment on la vérifie

Le programme d'études contient-il deux lots portant ces intitulés, avec leur condition d'invalidation écrite ? Sinon, il est en écart.

---

## D3 — Les seuils d'invalidation sont pré-enregistrés

> **Énoncé.** Chaque seuil qui déclencherait l'abandon ou la reformulation d'une hypothèse est **écrit, daté et versé au coffre avant la première collecte** du lot concerné. Un seuil réécrit après avoir vu le résultat n'est pas un seuil, c'est une justification.

### Origine

Tous les projets du coffre sont conduits par la personne qui souhaite qu'ils existent, et le plus souvent seule. Le biais de confirmation du porteur est identifié comme premier risque par les programmes d'`ecoFab` et de `levelup`, et la contre-mesure qu'ils prévoyaient — **un codage par un tiers sur un sous-échantillon** — n'est pas disponible en conduite solo.

Source : point 5.2 du [[Programme d'études approfondies]] et [[Protocole de la vague 0]] d'`ecoFab`, point 5.

### Les quatre obligations

Elles ne remplacent pas un tiers ; elles rendent son intervention possible plus tard.

| # | Obligation | Ce qu'elle empêche |
| --- | --- | --- |
| **a** | **Pré-enregistrement.** Le seuil est écrit, daté et versé avant le premier entretien du lot | Ajuster la barre après avoir vu le résultat |
| **b** | **Verbatims bruts conservés**, anonymisés et non codés, séparément du codage du porteur | Rendre le recodage par un tiers impossible |
| **c** | **Guide d'entretien sans le vocabulaire du projet** — ni le nom de la solution, ni ses concepts | Obtenir une réponse de politesse, qui est toujours favorable |
| **d** | **Comptage des infirmations.** Chaque lot rapporte le nombre d'observations qui **contredisent** l'hypothèse testée | Ne rapporter que ce qui confirme. Un lot sans aucune infirmation est suspect avant d'être encourageant |

### Modification d'un seuil

Elle reste possible, à trois conditions : elle est inscrite au journal du projet, elle est datée, et elle est **motivée par autre chose que le résultat obtenu**. Un changement de méthode, un défaut d'échantillon ou une erreur de formulation sont des motifs recevables. Le résultat n'en est jamais un.

### Comment on la vérifie

Le seuil figure-t-il dans un document daté **antérieur** à la collecte ? La date fait foi, pas l'intention.

---

## État de conformité des projets

Relevé au 2026-09-09 ; ligne `checkme` mise à jour le 2026-09-10 ; ligne `survie` ajoutée le 2026-09-12. La doctrine n'est pas rétroactive sur les documents déjà écrits : elle s'applique à toute version produite après sa promotion.

| Projet | D1 — dépendance | D2 — actif et payeur | D3 — pré-enregistrement |
| --- | --- | --- | --- |
| `ecoFab` | **Conforme.** Règle portée par le lot L5 ; `DEC-P-001` annulée | **Conforme.** Lots `L10` et `L11` créés en V0.3 | **Conforme.** Seuils des vagues 0 et 1 pré-enregistrés au [[Protocole de la vague 0]] |
| `levelup` | Non instruit — aucune dépendance institutionnelle identifiée à ce stade | **Conforme.** Lots `L7` et `L8` portés dès la V0.1 | **Partielle.** Les conditions d'invalidation sont écrites par lot ; le protocole opérationnel qui les date reste à produire |
| `maSecure` | **Écart établi, sur le mécanisme central.** La conception héritée suppose de garder les fonds, ce qui exige un agrément dont le capital minimum est de 300 millions de francs CFA libérés avant délivrance. Ni le porteur ne signe, ni le produit ne subsiste sans la signature | **Conforme.** Lots `L7` et `L8` portés dès la V0.1 | **Conforme.** Seuils pré-enregistrés lot par lot au [[maSecure/10-etudes/Programme d'études\|Programme d'études]] |
| `Psycho-pass` | **Conforme.** Aucune signature de tiers ne conditionne l'existence du produit. Le lot `L2` vérifie que l'origine du contenu ne réintroduit pas la dépendance par une autre porte | **Conforme.** Lots `L6` et `L7` portés dès la V0.1 | **Conforme.** Seuils pré-enregistrés lot par lot au [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] |
| `payMe` | **Écart partiel, instruit.** La position revendiquée est celle d'un tiers **sans compte propre ni flottant**, ce qui allège la dépendance sans la supprimer : l'accès au rail suppose un participant agréé. Le lot `L4` l'instruit et pré-enregistre le seuil au-delà duquel la dépendance est classée non maîtrisée | **Conforme.** Lots `L5` et `L6` portés dès la V0.1 | **Conforme.** Seuils pré-enregistrés lot par lot, dont ceux hérités du corpus, repris sans assouplissement |
| `Delivery` | **Conforme en apparence, à vérifier.** Aucune signature de tiers ne conditionne l'existence du produit, mais l'hypothèse `H-013` du corpus — la distinction entre modèle logiciel et exploitation logistique — est classée par le corpus lui-même *« à valider juridiquement »* | **À instruire.** Le corpus porte 18 hypothèses mais **aucune sur le consentement à payer** ; un lot payeur est entièrement à construire | **Partielle.** Le corpus énonce lot par lot *« ce qu'il faut démontrer »*, ce qui est le bon geste, mais **aucun seuil chiffré** n'est pré-enregistré |
| `INPC-BF` | **À instruire.** Le rattachement institutionnel est central et n'est pas arrêté | **À instruire.** Pas de programme d'études | **Sans objet** à ce stade |
| `SellComputing` | **À instruire** | **À instruire.** Pas de programme d'études, et l'échelle du projet doit être tranchée d'abord | **Sans objet** à ce stade |
| `MyWeather` | **À instruire** | **À instruire.** Pas de programme d'études | **Sans objet** à ce stade |
| `Pblog` | **Conforme.** Aucune dépendance institutionnelle : le produit est publié et fonctionne | **À instruire.** Pas de programme d'études. Le corpus fixe deux objectifs mesurables — flux de contacts, délai de validation — **et n'en mesure aucun**, alors que le produit publié les rend mesurables gratuitement | **Sans objet** à ce stade |
| `synapse` | **Conforme.** Champ d'identifiant national prévu, non bloquant | **À instruire.** Pas de programme d'études ; le dossier de faisabilité arrête un noyau sans instruire l'actif ni le payeur | **Sans objet** — aucune collecte de terrain engagée |
| `infUb` | **À vérifier.** Le portage institutionnel est central ; la question du porteur est ouverte | **À instruire.** Étude comparative, pas de programme d'études | **Sans objet** à ce stade |
| `checkme` | **Instruite au stade de l'intention.** Aucune signature de tiers n'est requise pour construire et présenter le produit ; aucune personne réelle ne peut être servie sans qu'un tiers signe. La cession complète visée par le porteur transfère cette dépendance à l'autorité cessionnaire — point 7 du [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] | **Conforme.** Lots `L7` et `L8` portés dès la V0.1 du programme d'études ; le basculement en infrastructure publique, déclaré comme intention, sera acté au jalon 3 | **Conforme.** Seuils pré-enregistrés lot par lot le 2026-09-10, avant toute collecte, au [[checkme/10-etudes/Programme d'études\|Programme d'études]] |
| `gounhri` | **À instruire** | **À instruire.** Dossier d'ingénierie humaine, pas de programme d'études | **Sans objet** à ce stade |
| `survie` | **Sans objet au stade de l'intention.** Aucune dépendance envers un tiers n'est identifiée. La reformulation R2 en introduirait une : le consentement des enseignants et des établissements à la diffusion de leurs supports | **À instruire.** Pas de programme d'études : le verdict *à reformuler* ferme la chaîne avant cette phase | **Conforme.** Les seuils du seul test prévu — l'usage réel de ClassRoom par le porteur pendant six semaines de cours — sont pré-enregistrés le 2026-09-12, avant toute collecte, au point 14.2 du [[survie/00-intention/Document fondateur d'intention\|document fondateur]] |

> [!note] Ce que « à instruire » veut dire
> Au 2026-09-10, huit projets sur quatorze n'ont pas de programme d'études au sens d'`ecoFab`, de `levelup`, de `maSecure`, de `Psycho-pass`, de `payMe` et de `checkme` — lots numérotés, jalons, conditions d'invalidation. `D2` et `D3` ne leur sont donc pas encore opposables en fait ; elles le deviendront **au moment où ils en écriront un**. Le relevé les mentionne pour que l'écart soit visible, non pour le reprocher.

---

## Règle candidate, non promue

Une quatrième règle est proposée depuis le 2026-09-06 par le point 2 de [[Cartographie du portefeuille]], et **n'a pas été promue**. Elle est consignée ici pour qu'elle ne se perde pas, et signalée comme non opposable.

> **Énoncé proposé.** On ne déplace pas un usage installé en offrant mieux ; on s'installe sur un **usage mal servi**, auprès de **celui dont on allège le travail**.

Elle satisfait la première condition d'entrée de façon remarquable — **trois projets y sont arrivés indépendamment**, dont deux avec des précédents internationaux documentés : l'arrêt d'Ayoba malgré 35 millions d'utilisateurs, la domination de Zalo par l'indispensabilité latérale, et l'adoption volontaire de Notify par 7 000 services britanniques.

Sa promotion appartient au porteur. Tant qu'elle n'est pas inscrite au journal, **elle n'est pas opposable**, et aucun document de projet ne peut être déclaré en écart pour ne pas la suivre.

---

## Ce que la présente note ne fait pas

Elle ne tranche aucune frontière entre projets — cela relève de [[Cartographie du portefeuille]]. Elle ne modifie aucune décision de projet déjà prise. Elle ne rend rétroactivement fautif aucun document antérieur au 2026-09-08.

Elle rend opposable trois manières de faire dont l'absence a déjà coûté, dans ce coffre, un verdict de programme et une décision produit annulée.
