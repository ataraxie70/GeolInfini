---
projet: "payMe"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 16
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - payMe
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

> [!note] Correspondance avec l'échelle du corpus hérité
> Le corpus emploie quatre étiquettes : `[FAIT]` — vérifié auprès d'une source officielle référencée —, `[HYPOTHÈSE]` — plausible, à tester —, `[ANALYSE]` — raisonnement construit sur des faits, contestable — et `[INCONNU]` — question ouverte non tranchée.
> Elles se reportent ainsi : `[FAIT]` devient **fait**, `[HYPOTHÈSE]` devient **hypothèse**, `[ANALYSE]` devient **hypothèse** ou **principe** selon qu'elle affirme ou qu'elle arbitre, `[INCONNU]` devient un objet de lot.

---

## 1. Faits — établis, sourcés et datés

Tous repris du corpus, où ils portent l'étiquette `[FAIT]` avec leur source officielle.

| # | Fait | Source et date |
| --- | --- | --- |
| `F1` | La plateforme régionale de paiements instantanés fournit **nativement** l'alias comme identifiant, la vérification du bénéficiaire avant exécution, un code à lire unique accepté par tous les comptes connectés, et l'exécution en moins de dix secondes, en continu | Documentation officielle de la Banque centrale |
| `F2` | Sa connexion devient **obligatoire au 30 septembre 2026** pour les banques, les émetteurs de monnaie électronique et les établissements de paiement | Idem |
| `F3` | **La Banque centrale ne publie aucune application grand public.** Sa foire aux questions est explicite : l'accès se fait *« via l'application mobile que ce dernier [le participant] a l'obligation de mettre à votre disposition »* | Foire aux questions officielle |
| `F4` | **Au Burkina Faso, neuf institutions sont autorisées à ouvrir les services au public** au 2 avril 2026 : six banques, **un seul émetteur de monnaie électronique**, et deux établissements de paiement ou de microfinance | Liste officielle des participants, 2 avril 2026 |
| `F5` | **Wave, Moov Money, Telecel Money, Coris Money et Sank Money n'y figurent pas** | Idem |
| `F6` | **Les cartes ne sont pas sur cette plateforme.** Une carte prépayée relève de rails distincts qui ne communiquent pas avec elle et exigent un terminal d'acceptation dédié | Corpus, addendum point 2 |
| `F7` | Sur le marché burkinabè de la monnaie électronique : **rechargements 5 649 milliards de FCFA, retraits 5 539 milliards**, soit **0,98 franc ressortant en espèces pour chaque franc entré**. La ligne « paiements » s'établit à **875 milliards** | Statistiques de banque centrale citées par le corpus |
| `F8` | Le corpus hérité compte **trois documents**, dont **deux n'ont pour objet que de corriger le premier** : un addendum corrigeant une surestimation, et une révision du plan de preuve corrigeant la lecture d'un chiffre | Inventaire, 2026-09-09 |

### 1.1. Faits établis par le lot `L1`, conduit le 2026-09-09

Relevé documentaire, sources citées au [[payMe/10-etudes/Relevé de l'état de connexion|Relevé de l'état de connexion]].

| # | Fait | Portée |
| --- | --- | --- |
| `F9` | La composition burkinabè au 2 avril 2026 est **confirmée à la source primaire**, le document officiel ayant été lu directement : neuf institutions portant la mention `BURKINA (9)`, dont six banques et **un seul émetteur de monnaie électronique**. Wave, Moov Money, Telecel Money, Coris Money et Sank Money n'y figurent pas | Le socle du corpus tient. Une reprise de presse mentionnant Moov Money concerne un autre pays de l'Union et est écartée |
| `F10` | **Une liste plus récente existe, arrêtée au 31 juillet 2026**, annoncée par la banque centrale. **Son contenu n'a pas pu être obtenu**, et la composition burkinabè à cette date est **inconnue** | À obtenir **avant** le codage des entretiens du lot `L0`. Aucune conclusion n'est tirée de cette absence |
| `F11` | L'échéance du 30 septembre 2026 résulte d'un **report annoncé le 25 juin 2026**, cinq jours avant l'échéance précédente du 30 juin. Au 24 juin 2026 : **80 participants connectés, 74 institutions en phase de test réel** | S'inscrit dans la série de six reports en dix-huit mois établie par `maSecure`. **Rien n'établit que celle-ci sera tenue** |
| `F12` | L'absence de Wave est documentée au 24 août 2026. Motifs déclarés par l'opérateur : prérequis techniques, *« informations préliminaires »* sur l'intégration, dérogation accordée. Motif supposé et **structurel** : **la gratuité des transferts sur la plateforme heurte un revenu fondé sur leur facturation** | **Décisif pour le lot `L0`.** Un acteur dont le modèle est contredit par la plateforme a un intérêt à ne pas s'y connecter |

> [!danger] `F12` modifie ce que le lot `L0` doit mesurer
> Le corpus posait que la **cause `A`** — *« la personne est sur un autre opérateur »* — serait *« en voie de résolution »* par l'échéance du 30 septembre. **Ce raisonnement supposait que tous les émetteurs se connecteraient.**
> Si un acteur majeur a un intérêt économique structurel à ne pas le faire, la cause `A` **ne disparaît pas** : elle persiste pour la part de la population qu'il sert.
> Il ne suffit donc plus de distinguer `A` de `B` : il faut, **dans la cause `A`, relever l'opérateur concerné**. Cette modification de l'instrument a été décidée et pré-enregistrée **avant toute collecte** — point 4.3 du [[payMe/10-etudes/Protocole de la vague 0|Protocole de la vague 0]].
>
> Le motif structurel est **supposé par des analystes, non déclaré par l'opérateur**. Il est le plus lourd de conséquences et **le moins bien établi** du relevé : il est classé hypothèse, non fait acquis.

---

> [!important] Ce que `F3` à `F5` établissent ensemble, et que l'étude initiale avait manqué
> La plateforme livre un **rail et des standards**, puis délègue **intégralement l'expérience à chaque participant**. Il n'existe donc pas une expérience unifiée : il en existe autant que de participants, chacune enfermée dans le périmètre d'un seul établissement et ne montrant qu'un seul compte.
> L'abstraction du rail est réelle du point de vue du régulateur. **Elle n'existe pas du point de vue de l'utilisateur.** Au 8 septembre 2026, la promesse *« je paie n'importe qui depuis n'importe quel compte »* n'est tenue au Burkina Faso ni par la plateforme, ni par personne.

---

### 1.2. Faits apportés par la note de faisabilité technique, versée le 2026-09-09

| # | Fait | Portée |
| --- | --- | --- |
| `F13` | Le corpus est passé de **trois à quatre documents** le 2026-09-09 à 21 h 08, par l'ajout d'une note de faisabilité technique. Le même jour, l'addendum a été **restauré dans sa version d'origine**, et un original déposé sous un nom accidentel a été **remis en place**. L'empreinte du corpus change en conséquence | `DEC-C-081`. Les premières notes de la vague 0 ont été écrites sur l'état antérieur |
| `F14` | **L'accès à Internet au Burkina Faso est de 25,7 %** de la population | Décisif. Un modèle exigeant un téléphone intelligent, une connexion au moment de l'achat et une application installée ne sert que ce quart |
| `F15` | Le portail développeur de la plateforme annonce un **environnement de test « API Business »**, et il est **gratuit** | Rend le lot `L7` conduisible seul, sans partenaire ni capital |
| `F16` | Le modèle de paiement visé — un code à lire permanent, scanné depuis n'importe quelle application, débité sur le compte configuré du payeur — est **celui d'UPI en Inde**, qui a produit **228 milliards de transactions en 2025** | Établit que le modèle existe et fonctionne à grande échelle. **N'établit pas** qu'il soit disponible sur la plateforme régionale |

---

## 1 ter. La distinction que la note de faisabilité introduit

Elle n'avait été nommée dans aucun des trois documents antérieurs, et elle commande la constructibilité du produit.

| | **Modèle de transfert** | **Modèle de paiement** |
| --- | --- | --- |
| **Ce que fait l'utilisateur** | Il choisit un opérateur source, un opérateur destination, saisit un montant et un numéro | Il rattache un compte **une seule fois**, puis scanne et valide |
| **Où est le rail** | **Présent dans la tête de l'utilisateur à chaque opération** | **Disparu de l'expérience**, non simplifié |
| **Ce qui est vendu** | Le franchissement d'une frontière | Un paiement |
| **Qui le pratique** | Les agrégateurs et plateformes d'interopérabilité existants | Le modèle UPI |

Le produit décrit par le porteur relève du **second modèle**. La question du lot `L7` est de savoir si la plateforme régionale le permet.

---

## 2. La question ouverte dont tout dépend

> [!danger] `H6` est l'hypothèse la moins bien établie du dossier, et la plus lourde de conséquences
> Elle repose sur une **inférence tirée de noms d'adresses** relevés sur le portail développeur : tous les points d'entrée publiquement visibles portent des noms orientés bénéficiaire — lister les paiements reçus, générer un code à lire, envoyer une demande de paiement —, et l'ensemble est intitulé *« API Business »*. **Aucun point d'entrée visible ne correspond à l'initiation d'un débit sur le compte d'un payeur tiers.**
> Le portail est une application dont le contenu n'a pas pu être lu automatiquement. **Cette hypothèse est donc à infirmer en priorité, et elle ne se vérifie qu'en s'y rendant.** C'est l'objet du lot `L7`, et c'est pourquoi il prend le premier rang de la vague 0.

---

## 2 bis. La question ouverte dont tout dépendait avant le 2026-09-09

> [!danger] `Q1` — Le retrait d'espèces est-il subi ou choisi ?
> Le fait `F7` admet **deux lectures incompatibles**, et aucune statistique publique ne les départage : un rapport de banque centrale compte des retraits, il n'enregistre pas leur cause.
>
> | Lecture | Ce que 0,98 signifie | Décision qui en découle |
> | --- | --- | --- |
> | **Préférence** | Les gens veulent de l'espèce ; le numérique ne tient pas | Renoncer, ou changer de segment |
> | **Contrainte** | Les gens sont **contraints** de retirer ; la demande existe, l'aval manque | Construire l'aval |
>
> **L'écart entre les deux n'est pas une nuance, c'est le dimensionnement du marché.** Le corpus le chiffre : si 40 % des retraits étaient subis par absence d'acceptation, cela représenterait environ **2 200 milliards de FCFA de paiements qui se feraient en numérique s'ils le pouvaient — soit deux fois et demie la totalité de la ligne « paiements » actuelle**.
> Le lot `L0` du [[payMe/10-etudes/Programme d'études|Programme d'études]] a pour unique objet de trancher cette question, et il doit être conduit avant le 30 septembre 2026.

---

## 3. Hypothèses — à instruire, avec leur critère de mort

Reprises du plan de preuve du corpus, sans assouplissement.

| # | Hypothèse | Critère de mort |
| --- | --- | --- |
| `H1` | Un commerçant informel acceptera et maintiendra un encaissement numérique si le coût fixe est nul, le règlement instantané et l'inscription possible sans registre du commerce ni identifiant fiscal | Moins de 40 % encore actifs à huit semaines |
| `H2` | **Plus de 25 % de la valeur encaissée reste dans le circuit numérique à sept jours** | Part restée numérique inférieure à 10 % |
| `H3` | Au moins 15 % des commerçants retenus acceptent un service payant au-dessus du paiement gratuit | Moins de 5 % |
| `H4` | La **neutralité** est défendable : un tiers sans compte propre, sans flottant et sans intérêt à retenir la valeur peut acheminer un paiement vers n'importe quel compte, ce qu'aucun opérateur ne fera par conflit d'intérêt | Qu'un opérateur lance effectivement un service neutre, ou qu'une plateforme d'interopérabilité tierce occupe la position |
| `H5` | Le **graphe transactionnel du commerce informel** constitue un actif non copiable et cumulatif | Que `H2` tombe : un graphe construit sur des flux ressortant en espèces à quarante-huit heures n'enregistre rien d'exploitable |
| `H6` | **La plateforme régionale est conçue comme une infrastructure d'encaissement côté bénéficiaire, et non comme une infrastructure d'initiation ouverte à des tiers côté payeur** | Que le lot `L7` établisse qu'un tiers peut initier un débit et que le payeur s'authentifie dans l'application du tiers |

`H2` est signalée par le corpus comme *« l'hypothèse décisive »*, et la reprise ne modifie pas ce classement. Le référentiel national actuel étant d'environ 2 %, tout résultat au-dessus de 10 % constitue déjà une information majeure.

---

## 4. Principes et positions — proposés, jamais arrêtés

| # | Énoncé | Statut |
| --- | --- | --- |
| `P1` | **Le rail gratuit n'est pas un concurrent, c'est une subvention** — le coût marginal du paiement tombant à près de zéro, ce qui reste rare se déplace vers la relation au commerçant, la densité de sa donnée de flux et sa trésorerie | Principe de conception, non prouvé |
| `P2` | **Le paiement est un canal d'acquisition, pas un revenu** — le corpus établit par ailleurs que le paiement seul ne finance rien | Principe de conception, non prouvé |
| `P3` | **Position proposée** — *« le seul acteur neutre du paiement quotidien burkinabè : ni banque, ni opérateur, ni détenteur de fonds ; l'application qui accepte tous les comptes parce qu'elle n'en possède aucun »* | **Proposition à tester.** Aucun lot du programme ne la présuppose |
| `P4` | **Un identifiant de réception ne participe jamais à un parcours de débit.** Un identifiant publiable, permanent et affichable d'un côté ; de l'autre, une cérémonie de sortie exigeant possession, secret et canal distinct. Les deux ne se croisent pas | Principe de sécurité, issu d'un incident observé. Aucun acteur n'est nommé, et la règle vaut indépendamment de la cause de l'incident |
| `P5` | **Le plus proche possible du paiement en espèces.** Les espèces ont une propriété qu'aucun système numérique ne reproduit spontanément : **le payeur n'exige rien de l'infrastructure du bénéficiaire, et réciproquement** | Règle de conception revendiquée. Le fait `F14` en montre la portée : appliquée strictement, elle impose un canal fonctionnant sans connexion |

---

## 5. Possibilités — ouvertes, jamais sélectionnées

**Les trois actifs candidats**, classés par le corpus dans cet ordre : le **graphe transactionnel** du commerce informel, en premier rang ; le **réseau de déploiement et de service terrain**, en deuxième rang, à forte intensité capitalistique et peu compatible avec une équipe restreinte ; la **position sur le flux grossiste vers détaillant**, en troisième rang, la plus riche et la plus difficile, seule à résoudre la sortie en espèces mais se heurtant à la réticence fiscale des grossistes.

Le corpus recommande une séquence — le premier d'abord, le deuxième en soutien, le troisième comme pari de seconde vague. **Cette recommandation n'est pas une décision.**

---

## 6. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[payMe/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 3 — `DEC-C-067` à `DEC-C-069` | Idem |
