---
projet: "payMe"
type: "note-d-entree-projet"
statut_projet: "Vague 0 ouverte et révisée — L1 conduit, L7 à conduire en premier, L0 pré-enregistré"
nom_de_produit: "NON DÉCIDÉ — payMe est un nom de code interne"
corpus_herite: "4 documents en 99-sources — référence, non opposable, mais méthodiquement conforme"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - payMe
  - moc
---

# payMe

**Infrastructure d'encaissement et de trésorerie du commerce de proximité au Burkina Faso** : permettre à un commerçant d'encaisser sans condition administrative, sans coût fixe et sans délai, puis transformer son historique de flux en accès au crédit.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `00-intention`, `10-etudes`, `90-pilotage`, `99-sources` ouvertes le 2026-09-09 |
| Étude | [[payMe/10-etudes/Programme d'études\|Programme d'études]] **V0.2** — vague 0 ouverte le 2026-09-09, puis **révisée le jour même** |
| Rang 1 — lot `L7` | **À conduire. Faisabilité technique.** Deux à trois jours, coût nul, sur un environnement de test gratuit. **Binaire : il dit si le produit décrit est constructible** |
| Rang 2 — lot `L1` | **Conduit.** [[payMe/10-etudes/Relevé de l'état de connexion\|Relevé de l'état de connexion]] — relevé clos, avec une lacune nommée |
| Rang 3 — lot `L0` | **Pré-enregistré, collecte à conduire.** [[payMe/10-etudes/Protocole de la vague 0\|Protocole de la vague 0]] V1.0 — douze entretiens, seize heures, **avant le 2026-09-30** |
| Décisions de projet inscrites | **Aucune** — voir [[payMe/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Cinq, `DEC-C-067` à `DEC-C-069`, `DEC-C-080` et `DEC-C-081` |
| Corpus hérité | **4 documents**, archivés et empreintés en [[payMe/99-sources/Sources originales\|99-sources]]. **Non opposables**, mais méthodiquement conformes |

> [!danger] Une échéance datée court, et elle est proche
> Le 30 septembre 2026, la connexion à la plateforme régionale de paiements instantanés de la Banque centrale devient obligatoire pour les banques, les émetteurs de monnaie électronique et les établissements de paiement de l'Union.
> L'étude établit que **la nature du marché de `payMe` se joue à cette date**, et que le sens du travail de terrain n'est pas le même avant et après. C'est le seul projet du coffre dont le calendrier soit contraint par un événement extérieur daté.

---

## Ce que la mise en conformité a changé

| Opération | Effet | Décision |
| --- | --- | --- |
| **Mise en convention** | Note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, corpus empreinté. Les trois documents rejoignent `99-sources` | `DEC-C-067` |
| **Statut du corpus** | Le corpus devient **référence non opposable** — mais pour un motif différent de celui des autres projets : non pas un défaut de méthode, mais l'absence de jalon franchi | `DEC-C-068` |
| **Ouverture des études** | `10-etudes` est ouverte, et le plan de preuve du corpus est repris en programme conforme aux règles `D2` et `D3` du coffre | `DEC-C-069` |

---

## Navigation

- [[payMe/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, la position révisée, ce que l'étude a déplacé (V0.1)
- [[payMe/10-etudes/Programme d'études\|Programme d'études]] — `10-etudes` — les lots, les jalons, les critères de mort, l'échéance du 30 septembre (V0.1)
- [[payMe/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage`
- [[payMe/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage`
- [[payMe/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage`
- [[payMe/99-sources/Sources originales\|Sources originales]] — `99-sources`

**Phases non créées** : `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation`.

---

## Le nœud du problème, en une page

**Ce corpus est le plus rigoureux du coffre, et il faut le dire avant tout le reste.** Trois documents produits en huit jours, dont **deux ne servent qu'à corriger le premier**. Chaque affirmation y porte une étiquette — fait, hypothèse, analyse, inconnu —, les faits citent des sources officielles nommées et datées, les hypothèses portent un **critère de mort explicite**, et l'auteur y écrit que son objet *« ne cherche pas à valider l'intention fondatrice, il cherche à la casser »*. Aucun autre corpus hérité du coffre n'atteint ce niveau.

**Le renversement principal.** L'intention initiale — construire une couche d'abstraction au-dessus de rails de paiement fragmentés — a été déclarée **indisponible** : la Banque centrale déploie cette couche, gratuitement, et sa connexion devient obligatoire au 30 septembre 2026. L'étude en tire une formule qui retourne l'obstacle : *« la plateforme de la Banque centrale n'est pas votre concurrent, c'est votre subvention »*. Le rail devenant gratuit, ce qui reste rare se déplace vers la relation au commerçant, la densité de sa donnée de flux et sa trésorerie.

**La correction de l'addendum, et elle est importante.** L'étude initiale avait conclu trop vite. La plateforme de la Banque centrale fournit un **rail et des standards**, puis délègue l'expérience à chaque participant : il n'existe donc pas une expérience unifiée, mais autant d'expériences que d'établissements, chacune enfermée dans un seul périmètre et ne montrant qu'un seul compte. Au Burkina Faso, la liste officielle arrêtée au 2 avril 2026 compte **neuf institutions connectées**, dont **un seul émetteur de monnaie électronique**. Wave, Moov Money et Telecel Money n'y figurent pas.

**La position qui survit à ces corrections : la neutralité.** Aucun opérateur ne construira jamais un service qui achemine un paiement vers un concurrent quand il peut le garder. Un tiers sans compte propre, sans flottant et sans intérêt à retenir la valeur peut être neutre — et c'est la seule chose qu'un opérateur ne peut pas copier, non par incapacité technique mais par **conflit d'intérêt**.

**La question qui décide de tout, et le corpus la nomme.** Sur chaque franc entré en monnaie électronique au Burkina Faso, **0,98 franc ressort en espèces**. Deux lectures s'opposent et aucune statistique publique ne les départage. Si le retrait est **choisi**, il exprime une préférence pour l'espèce et il n'y a rien à construire. S'il est **subi** — parce que le destinataire n'accepte pas le numérique —, alors le gisement n'est pas dans la conversion de nouveaux usages mais dans la récupération d'usages déjà numériques forcés de sortir. Le corpus chiffre l'écart entre les deux lectures : dans la seconde, le marché récupérable dépasserait **deux fois et demie la totalité de la ligne « paiements » actuelle**.

**Ce qui manque, et c'est la seule chose.** Le terrain. Toutes les preuves du corpus sont documentaires : textes officiels, listes de participants, statistiques de banque centrale, précédents régionaux. **Aucun commerçant, aucun payeur n'a été interrogé.** Le corpus le sait, le dit, et a réduit son protocole de 63 heures à 16 pour que ce terrain soit atteignable.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre** : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — observé, imaginé, construit.
2. **Aucune promotion silencieuse de statut** — une position « proposée à tester » reste une proposition.
3. **Pas de chiffre sans source** — règle que le corpus applique déjà.
4. **Falsifiabilité** — toute hypothèse porte son critère de mort.
5. **Le corpus est cité, jamais invoqué.**

---

## Recouvrement direct avec `maSecure`, non instruit

> [!danger] Deux projets du coffre instruisent le même événement réglementaire sans se citer
> `maSecure` a établi le 2026-09-09, par son propre benchmark, que le cadre de la Banque centrale a été **reporté six fois en dix-huit mois**, que l'échéance du **30 septembre 2026** s'applique aux banques, aux émetteurs de monnaie électronique et aux prestataires de paiement, et qu'**au 2 avril 2026, 80 participants étaient raccordés et Wave en était absent**.
> `payMe` a établi, à partir de la **liste officielle arrêtée à cette même date du 2 avril 2026**, que le Burkina Faso compte **neuf institutions connectées**, dont un seul émetteur de monnaie électronique, et que Wave, Moov Money et Telecel Money n'y figurent pas.
> Les deux projets décrivent le même dispositif, à la même date, à deux échelles différentes — l'une régionale, l'autre nationale — et **aucun des deux ne cite l'autre**. Le recouvrement est direct, la complémentarité est immédiate, et l'instruction est à conduire conjointement.

D'autres recouvrements, non instruits, sont portés à [[Cartographie du portefeuille]] : avec `Delivery`, dont les livreurs encaissent à la livraison, et avec `gounhri`, le commerce de proximité étant d'abord un tissu social.

---

## Ce que la vague 0 a produit le 2026-09-09

### Le lot `L1` est conduit

**Confirmé à la source primaire.** La liste officielle du 2 avril 2026 a été lue directement, et non reprise de la presse : **neuf institutions au Burkina Faso**, six banques, **un seul émetteur de monnaie électronique**. Wave, Moov Money, Telecel Money, Coris Money et Sank Money n'y figurent pas.

**Lacune nommée.** Une liste plus récente existe, **arrêtée au 31 juillet 2026**. Son contenu n'a pas pu être obtenu, et la composition burkinabè à cette date est inconnue. Elle doit être récupérée **avant** le codage des entretiens.

**Correction qui déplace la mesure.** Le corpus posait que la cause `A` — *« la personne est sur un autre opérateur »* — disparaîtrait à l'échéance. Or l'absence de Wave repose en partie sur un motif **structurel** : la gratuité des transferts sur la plateforme heurte un revenu fondé sur leur facturation. **Un acteur dont le modèle est contredit par la plateforme a un intérêt à ne pas s'y connecter.** En conséquence, et avant tout entretien, l'instrument a été modifié : lorsque la cause `A` est codée, **l'opérateur concerné est relevé**.

### Le lot `L0` est pré-enregistré, et son rang a changé

Le [[payMe/10-etudes/Protocole de la vague 0\|Protocole de la vague 0]] est écrit, gelé, et prêt à être imprimé : cadre d'échantillonnage, deux instruments, grille de codage, cadre éthique, seuils.

Mais le corpus s'est augmenté le même jour d'une **note de faisabilité technique** qui pose une question antérieure à celle du marché — voir `DEC-C-081`.

> [!danger] Une question précède celle du marché, et elle coûte deux à trois jours
> **Un tiers peut-il initier un débit sur le compte d'un payeur qu'il ne détient pas ?**
> Le produit décrit relève du modèle de paiement — un code à lire permanent, scanné depuis n'importe quelle application, débité sur le compte configuré du payeur — et non du modèle de transfert que pratiquent les agrégateurs existants. C'est le modèle UPI, qui a produit 228 milliards de transactions en Inde en 2025.
> **Rien n'établit qu'il soit disponible sur la plateforme régionale.** Les points d'entrée publiquement visibles du portail développeur portent tous des noms orientés bénéficiaire, et aucun ne correspond à l'initiation d'un débit côté payeur. Ce n'est qu'une inférence tirée de noms d'adresses — hypothèse `H6`, la moins bien établie du dossier et la plus lourde de conséquences.
> Un marché établi ne sert à rien si le produit ne peut pas être bâti ; l'inverse n'est pas vrai. **Le lot le moins cher qui décide le plus passe en premier.**

---

## Étape suivante — le lot `L7`, sur l'environnement de test

Deux à trois jours, **coût nul**, aucune autorisation, aucun partenaire, aucun capital.

| Épreuve | Durée | Ce qu'elle tranche |
| --- | --- | --- |
| **Test 0** | 30 min | L'accès à l'environnement de test est-il libre, ou réservé aux participants agréés ? **Si réservé, le mémo de partenariat devient le chemin critique immédiat** |
| **Test 1** | 2 à 3 h | Cartographie exhaustive des points d'entrée, classés côté bénéficiaire, côté payeur, autorisation |
| **Test 1 *bis*** | — | Un canal fonctionnant sans connexion est-il prévu, et un participant peut-il l'exposer ? Le fait `F14` en montre l'enjeu : **l'accès à Internet au Burkina Faso est de 25,7 %** |
| **Test 2** | 1 journée | **Le point exact où le payeur s'authentifie.** Trois issues, trois décisions pré-écrites |
| **Test 3** | 2 à 3 h | Ce que le code à lire permanent transporte, et si le bénéficiaire peut rapprocher un paiement d'une vente |
| **Test 4** | 1 h | Confirmer qu'aucun point d'entrée ne concerne les cartes |

**Les issues du Test 2 sont pré-enregistrées** au point 3 du programme : le cas 1 ouvre `L0`, le cas 2 impose de repenser le produit, le cas 3 le reformule côté bénéficiaire — c'est-à-dire vers la position que l'étude v1.0 identifiait déjà, mais **par un chemin technique et non économique**.

> [!important] Ce lot ne peut être conduit que par le porteur
> Il exige de créer un compte sur l'environnement de test, de dérouler un paiement de bout en bout et d'observer où l'authentification s'exécute. **Le résultat de chaque épreuve, une fois relevé, peut être versé au coffre et le relevé de lot rédigé.**

Une fois `L7` rendu, la collecte du lot `L0` s'ouvre — **avant le 2026-09-30**, sous la réserve que l'échéance résulte d'un report annoncé cinq jours avant le précédent terme, dans une série de six reports en dix-huit mois.
