---
projet: "Delivery"
type: "document-fondateur"
phase: "00-intention"
version: "0.1"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de Delivery, réécrite depuis le corpus hérité, avec le statut de chaque affirmation"
source_du_fond: "99-sources — six livraisons du 2026-08-25"
corpus_herite: "Référence, non opposable"
cree_le: 2026-09-09
tags:
  - Delivery
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `Delivery` depuis l'intention. Il ne transforme aucune idée en exigence, ne valide aucun acquis du corpus hérité et ne prend aucune décision.
> Il est **réécrit**, non recopié. Chaque affirmation matérielle porte sa source et son **statut** : fait, hypothèse, principe, possibilité.

---

## 1. Objet et principe de lecture

`Delivery` possédait, avant son entrée dans le coffre, un corpus de 21 fichiers réparti en six livraisons, produites le **25 août 2026 entre 13 h 23 et 15 h 08**. Il comprend une constitution fondatrice, un registre des décisions, un registre des hypothèses et des preuves, un DDD stratégique en deux versions, une revue contradictoire de ce DDD, un langage ubiquitaire et une carte de contextes stratégique.

> [!important] Ce corpus se distingue de tous les autres corpus hérités du coffre
> Il **déclare le statut de ses affirmations** au moyen d'une échelle explicite — `BASELINE`, `DECISION`, `HYPOTHESIS`, `OPEN`, `EVIDENCE`, `SUPERSEDED` —, il sépare hypothèse et preuve dans un registre dédié, et il soumet son propre modèle de domaine à une **revue contradictoire** sur neuf scénarios métier.
> La reprise ne corrige donc pas une méthode absente. Elle instruit ce que cette méthode déclare rester à démontrer, et que le corpus n'a pas démontré.

Trois règles gouvernent ce qui suit.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Le présent document relève presque entièrement du monde imaginé.
2. **Aucune promotion silencieuse de statut** — un statut `BASELINE` porté à l'intérieur du corpus qualifie l'état de ce texte, jamais l'état du projet.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

---

## 2. L'intention fondatrice

> **Construire une infrastructure numérique fédératrice du secteur de la livraison : un système dans lequel les personnes peuvent travailler, les organisations peuvent se créer, et les capacités de livraison peuvent circuler entre elles.**

Source : `99-sources/livraisons/01-constitution-fondatrice-v1.0.md`, point 1.3. **Statut : intention** — elle n'a pas à être vraie, elle a à être tenue.

### 2.1. Ce que le projet refuse d'être

Le corpus pose son intention **par la négative** avant de la poser par l'affirmative, et cette formulation est la plus nette du dossier :

> *« Ne pas reproduire un modèle de société de livraison supplémentaire lorsque le secteur possède déjà des indépendants, groupes, petites structures, agences, entreprises et opérateurs. »*

L'objet visé est une **couche commune** permettant à des acteurs juridiquement, économiquement et organisationnellement distincts de fonctionner avec leurs propres relations, tout en pouvant partager capacités, missions, informations et preuves **selon des règles explicites**.

**Statut : principe de conception.** L'intention n'est pas de centraliser la livraison dans un opérateur unique ; elle est de **rendre interopérable** ce qui existe déjà.

---

## 3. La thèse, énoncée de façon falsifiable

Le corpus formule sa thèse à travers ses hypothèses `H-016` et `H-018`. Elle est reprise ici sous une forme unique et discutable.

> **X** — Les capacités de livraison existent, mais **fragmentées** : chaque acteur les détient sans pouvoir les faire circuler. Transformer des capacités autonomes en capacité collective produit une valeur distincte d'un simple service de répartition de courses.
>
> **Le marché agit comme si non-X** — l'offre continue de se structurer en opérateurs verticaux qui internalisent leurs flottes, chacun reconstruisant à ses frais ce que les autres possèdent déjà.

**Statut : hypothèse — non instruite.**

**Condition de fausseté**, à formuler avant toute étude :

> **Si les organisations de livraison refusent de faire circuler leurs capacités — parce qu'une capacité prêtée est un client exposé —, la thèse tombe entièrement.**

Le corpus effleure cette objection à l'hypothèse `H-011`, qu'il classe `OPEN` avec la mention *« aucune preuve suffisante »* : *« les acteurs accepteront une exposition contrôlée de missions ouvertes »*. C'est la question la plus lourde de la reprise, et le corpus la reconnaît sans l'instruire.

---

## 4. Les dix-huit hypothèses, et ce qu'elles reconnaissent

Source : `99-sources/livraisons/03-registre-hypotheses-preuves-v1.0.md`. Le registre les classe lui-même ; les statuts ci-dessous sont **ceux du corpus**, non une requalification.

| # | Hypothèse | Statut déclaré par le corpus |
| --- | --- | --- |
| `H-001` | Les capacités de livraison existent mais sont fragmentées | Fortement signalée |
| `H-002` | L'accès à la demande est un problème important pour certains indépendants | Observée |
| `H-003` | Les petites organisations rencontrent une barrière de coût et de complexité numérique | Fortement signalée |
| `H-004` | Un logiciel métier multi-organisationnel peut être adopté par de petites structures | À valider |
| `H-005` | Une organisation peut conserver la mission tout en déléguant l'exécution | Prometteuse |
| `H-006` | La délégation entre organisations crée une valeur économique suffisante | À valider |
| `H-007` | La compatibilité de parcours produit plus de valeur qu'une logique de proximité seule | Prometteuse |
| `H-008` | La traçabilité de la garde et des transferts réduit les conflits | Prometteuse |
| `H-009` | Le réseau opérationnel fédéré peut devenir un actif défendable | **À démontrer** |
| `H-010` | Une boucle locale suffisamment dense peut résoudre le démarrage à froid | **À démontrer** |
| `H-011` | Les acteurs accepteront une exposition contrôlée de missions ouvertes | **Ouverte — aucune preuve suffisante** |
| `H-012` | Les modèles économiques peuvent rester pluriels sans détruire la cohérence du système | Ouverte |
| `H-013` | Le modèle logiciel peut rester distinct de l'exploitation logistique physique au démarrage | **À valider juridiquement** |
| `H-014` | Le calendrier de marché est favorable à une infrastructure fédératrice | À mesurer |
| `H-015` | Le projet peut construire une position dominante sur un marché initial restreint | Ouverte |
| `H-016` | Le secret stratégique est la transformation de capacités autonomes en capacité collective | Hypothèse forte |
| `H-017` | L'orchestration fédérée des capacités constitue le véritable cœur de domaine | Candidat, à valider |
| `H-018` | La circulation structurée de capacités entre organisations autonomes est une valeur métier distincte d'une simple répartition de courses | Hypothèse forte |

> [!danger] Aucune des dix-huit n'est démontrée, et la colonne « preuve » ne cite aucune source
> Les mentions portées en regard sont **génériques** : *« retours terrain »*, *« cas terrain »*, *« cas métier formalisés »*, *« modèle conceptuel »*, *« proposition stratégique »*. Aucun entretien n'est daté, aucun acteur nommé, aucune mesure chiffrée, aucun échantillon décrit.
> Un registre qui dit correctement ce qu'il faut démontrer, mais dont la colonne des preuves ne renvoie à rien de vérifiable, **atteste d'une intention de rigueur, pas d'un travail de terrain**. C'est l'écart exact de ce dossier, et il est le seul.

---

## 5. Ce que le corpus apporte, et ce qu'il ne prouve pas

**Ce qu'il apporte.** La méthode du registre, exposée au point 1. Une distinction métier fine et défendable entre le **titulaire** d'une mission et son **exécutant physique**, avec le corollaire que la responsabilité physique ne change qu'après prise en charge effective et confirmation. Une typologie des missions — ouverte, adressée, déléguée. Et une **revue contradictoire** qui éprouve ce modèle sur neuf scénarios, dont la capacité indisponible après proposition, l'acceptation sans prise en charge, la prise en charge avec anomalie et le transfert de garde. Cette revue est un exercice rare, et elle est conduite sérieusement.

**Ce qu'il ne prouve pas.** Qu'un seul acteur du secteur souhaite fédérer quoi que ce soit. Le corpus décrit un système que des organisations autonomes accepteraient de rejoindre, sans qu'aucune organisation réelle n'ait été interrogée, nommée ou observée.

**Ce qu'il n'aborde nulle part.** Qui paie, combien, et pour quoi. Aucune des dix-huit hypothèses ne porte sur le consentement à payer, et le registre des décisions n'y consacre aucune entrée. La règle `D2` de la [[Doctrine du coffre]] impose qu'un programme d'études porte un lot **payeur** ; il est ici entièrement à construire.

---

## 6. Recouvrements avec les autres projets du coffre

| Projet | Nature du recouvrement | Portée |
| --- | --- | --- |
| `payMe` | Les deux visent le **commerce du quotidien au Burkina Faso** et reposent sur une **preuve d'exécution** — de la garde d'un colis ici, du règlement d'une transaction là. Un livreur qui encaisse à la livraison relie directement les deux objets, et c'est le cas d'usage le plus courant du secteur | **Direct, non instruit** |
| `maSecure` | Les deux construisent un registre de preuves opposable entre acteurs qui ne se font pas confiance *a priori* | **Partiel** |
| `gounhri` | Fédérer des organisations autonomes est une question sociale avant d'être logistique | **Non instruit** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## 7. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

Le nom du produit · le territoire précis et le marché initial · le premier acteur servi · le périmètre du produit minimal · **le modèle économique et le payeur** · la forme juridique · le régime applicable à la distinction entre logiciel et exploitation logistique — objet de `H-013`, classée *à valider juridiquement* · le *Core Domain* — objet de `H-017`, classée *candidat* · le découpage en contextes bornés · l'architecture et la pile technique.

Le découpage en contextes bornés figure dans cette liste **bien qu'il existe en deux versions dans le corpus** : il a été produit dix-sept minutes après la constitution fondatrice, sans contact avec un acteur du secteur, et sa validité dépend d'hypothèses que le corpus lui-même déclare non démontrées.

---

## 8. Ce que la reprise doit produire, et dans quel ordre

```
INTENTION  (le présent document)
   v
ÉTUDE — les acteurs veulent-ils fédérer, qui paie, et le démarrage à froid se franchit-il ?
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

Le corpus a franchi le premier maillon en **dix-sept minutes** et s'est arrêté au quatrième. La reprise reprend au maillon manqué : l'étude. Elle doit pouvoir conclure que le projet **ne doit pas être construit**.

---

*Version 0.1 — ouverture de la reprise. Le corpus hérité reste consultable en [[Delivery/99-sources/Sources originales|99-sources]] et n'est opposable en rien.*
