---
projet: "payMe"
type: "document-fondateur"
phase: "00-intention"
version: "0.1"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de payMe, réécrite depuis le corpus hérité, avec le statut de chaque affirmation"
source_du_fond: "99-sources — trois documents du 1er septembre 2026 et suivants"
corpus_herite: "Référence, non opposable"
cree_le: 2026-09-09
tags:
  - payMe
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `payMe` depuis l'intention. Il ne transforme aucune idée en exigence et ne prend aucune décision.
> Il est **réécrit**, non recopié. La particularité de ce projet est que son corpus hérité **porte déjà** le statut de ses affirmations : la reprise les reporte plutôt qu'elle ne les établit.

---

## 1. Objet et principe de lecture

`payMe` possédait, avant son entrée dans le coffre, un corpus de trois documents : une **étude stratégique de déconstruction du secteur**, un **addendum** corrigeant une surestimation de cette étude, et une **révision du plan de preuve** corrigeant la lecture d'un chiffre. Deux documents sur trois n'ont donc pour objet que de corriger le premier.

> [!important] Ce corpus se distingue de tous les autres corpus hérités du coffre
> Chaque affirmation matérielle y porte une étiquette — `[FAIT]` vérifié auprès d'une source officielle référencée, `[HYPOTHÈSE]` plausible à tester, `[ANALYSE]` raisonnement contestable, `[INCONNU]` question non tranchée. Les hypothèses portent un **critère de mort explicite**. Et l'avertissement méthodologique de l'étude énonce : *« ce document ne cherche pas à valider l'intention fondatrice. Il cherche à la casser. Ce qui survivra sera solide. »*
> La reprise ne corrige donc pas une méthode absente. **Elle constate qu'il manque une seule chose : le terrain.**

Trois règles gouvernent ce qui suit.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Ce document mêle les deux premiers, et le dit à chaque point.
2. **Aucune promotion silencieuse de statut** — une position formulée *« proposée à tester »* reste une proposition.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

---

## 2. L'intention initiale, et pourquoi elle n'est plus disponible

L'intention de départ, portée par un document fondateur v0.1 qui ne figure pas dans le corpus versé :

> **Construire une couche d'abstraction et d'expérience au-dessus des rails de paiement fragmentés, afin qu'un participant puisse payer et encaisser sans penser au rail sous-jacent.**

**Statut : intention abandonnée.** L'étude établit que cette couche est en cours de déploiement par la Banque centrale, qu'elle est **gratuite**, et que sa connexion devient **obligatoire au 30 septembre 2026** pour les banques, les émetteurs de monnaie électronique et les établissements de paiement.

Elle fournit nativement l'alias comme identifiant universel, la vérification du bénéficiaire avant exécution, un code à lire unique accepté par tous les comptes connectés et l'exécution en moins de dix secondes, en continu. Faits `F1` et `F2` du [[payMe/90-pilotage/Registre des statuts|Registre des statuts]].

---

## 3. La correction que l'addendum apporte, et qui rouvre une position

L'étude initiale avait conclu trop vite. La correction porte sur une distinction que le premier document n'avait pas faite.

> **La couche est fournie au niveau du rail et des standards. Elle ne l'est pas au niveau de l'expérience.**

**Fait `F3`** — la Banque centrale ne publie aucune application grand public. Sa foire aux questions officielle est explicite : l'accès se fait *« via l'application mobile que ce dernier [le participant] a l'obligation de mettre à votre disposition »*.

**Conséquence.** La plateforme livre un rail et impose des standards, puis **délègue intégralement l'expérience à chaque participant**. Il n'existe donc pas une expérience unifiée : il en existe autant que de participants, chacune enfermée dans le périmètre d'un seul établissement, ne montrant qu'un seul compte, et conçue par des institutions dont ce n'est pas le métier.

L'abstraction du rail est réelle **du point de vue du régulateur**. Elle n'existe pas **du point de vue de l'utilisateur**.

**Fait `F4` et `F5`** — au Burkina Faso, la liste officielle arrêtée au 2 avril 2026 compte **neuf institutions** autorisées à ouvrir les services au public : six banques, **un seul émetteur de monnaie électronique**, deux établissements de paiement ou de microfinance. Wave, Moov Money, Telecel Money, Coris Money et Sank Money n'y figurent pas.

> Au 8 septembre 2026, la promesse *« je paie n'importe qui depuis n'importe quel compte »* n'est tenue au Burkina Faso ni par la plateforme de la Banque centrale, ni par personne.

---

## 4. La question qui commande tout le reste

**Fait `F7`** — sur le marché burkinabè de la monnaie électronique, les rechargements atteignent 5 649 milliards de FCFA et les retraits 5 539 milliards. **Pour chaque franc entré, 0,98 franc ressort en espèces.** La ligne « paiements » s'établit à 875 milliards.

Ce chiffre admet deux lectures, et **aucune statistique publique ne les départage** : un rapport de banque centrale compte des retraits, il n'enregistre pas leur cause.

| Lecture | Ce que 0,98 signifie | Décision qui en découle |
| --- | --- | --- |
| **Préférence** | Les gens veulent de l'espèce. Le numérique ne tient pas | Renoncer, ou changer de segment |
| **Contrainte** | Les gens sont **contraints** de retirer, faute d'un aval qui accepte. La demande existe | Construire l'aval |

**L'écart n'est pas une nuance : c'est le dimensionnement du marché.** Si 40 % des retraits étaient subis par absence d'acceptation, cela représenterait environ **2 200 milliards de FCFA de paiements qui se feraient en numérique s'ils le pouvaient** — soit deux fois et demie la totalité de la ligne « paiements » actuelle. Le gisement ne serait pas dans la conversion de nouveaux usages, mais dans la **récupération d'usages déjà numériques forcés de sortir**.

### 4.1. La taxonomie qui rend la question mesurable

Le corpus décompose le retrait en six causes, dont trois seulement concernent le projet.

| Type | Cause | Portée pour le projet |
| --- | --- | --- |
| **Subi** | `A` — bénéficiaire inatteignable : pas de compte, opérateur non interopérable | **En voie de résolution par l'échéance du 30 septembre** |
| **Subi** | `B` — **point d'acceptation absent** : le commerçant, le grossiste, le service n'accepte pas | **Le marché revendiqué** |
| **Subi** | `C` — obligation externe : loyer, main-d'œuvre journalière, taxe exigée en espèces | Hors de portée |
| **Choisi** | `D` — préférence de possession | Travail de long terme |
| **Choisi** | `E` — défiance envers le compte | Travail de long terme |
| **Choisi** | `F` — crainte des frais ou du blocage | Adressable par le produit |

> [!danger] La distinction entre `A` et `B` est décisive, et elle est datée
> La cause `A` est précisément ce que la Banque centrale supprime gratuitement au **30 septembre 2026**.
> **Si l'essentiel des retraits subis relève de `A`, le marché du projet se referme à cette date**, sans que le porteur y soit pour rien.
> **S'il relève de `B`, le marché s'ouvre** — et il s'ouvre d'autant plus que le rail devient gratuit, puisque le seul obstacle restant devient l'acceptation.
> C'est pourquoi le lot `L0` du [[payMe/10-etudes/Programme d'études|Programme d'études]] doit être conduit **avant** cette date : la même mesure ne répond pas à la même question de part et d'autre.

---

## 5. La position qui survit, et son fondement

**Statut : proposition à tester**, enregistrée `P3` et `H4`.

La couche d'expérience n'est pas défendable **parce qu'une application se copie**. Après le 30 septembre 2026, les opérateurs disposeront chacun du même rail gratuit et d'applications déjà installées ; le combat se jouera sur la distribution, non sur la fonctionnalité.

La question devient donc : **que peut faire un tiers que ces opérateurs ne feront jamais ?**

> **Une seule réponse résiste : la neutralité.**
>
> Aucun opérateur ne construira un service qui achemine un paiement vers un concurrent quand il peut le garder. Chacun est **structurellement incapable d'être neutre**, parce que la neutralité lui coûte du flux.
> Un tiers sans compte propre, sans flottant, sans intérêt à retenir la valeur peut l'être. C'est la seule chose qu'un opérateur ne peut pas copier — non par incapacité technique, mais par **conflit d'intérêt**.

Cette neutralité produirait deux actifs cumulatifs : la **vue consolidée** du participant, que personne d'autre ne peut voir puisque chaque opérateur ne voit que son propre compte ; et la **relation aux commerçants que personne ne sert**, dont l'exclusion est administrative avant d'être technique.

**Formulation proposée par le corpus, reprise ici sans être adoptée :**

> *« Le seul acteur neutre du paiement quotidien burkinabè. Ni banque, ni opérateur, ni détenteur de fonds : l'application qui accepte tous les comptes parce qu'elle n'en possède aucun — et qui, de ce fait, voit ce que personne d'autre ne voit. »*

---

## 6. Ce que le corpus établit, et ce qu'il ne prouve pas

**Ce qu'il établit.** Le cadre réglementaire et son calendrier, la couverture réelle du dispositif au Burkina Faso, l'ampleur de la sortie en espèces, le fait que le paiement seul ne finance rien, et l'existence de précédents régionaux de la position visée. Tout cela est sourcé, daté et vérifiable.

**Ce qu'il ne prouve pas.** Que le retrait soit subi plutôt que choisi. Qu'un commerçant informel accepte et maintienne un encaissement numérique. Que la valeur reste dans le circuit. Qu'un commerçant paie pour un service adjacent.

> [!warning] Toutes les preuves du dossier sont documentaires
> **Aucun commerçant, aucun payeur n'a été interrogé.** Le corpus le sait, le dit, et a réduit son protocole de terrain de soixante-trois heures à seize pour que ce travail devienne atteignable par un porteur seul.
> C'est le seul écart de ce dossier, et il est aussi le seul qui compte : la question du point 4 ne se tranche que là.

---

## 7. Recouvrements avec les autres projets du coffre

| Projet | Nature du recouvrement | Portée |
| --- | --- | --- |
| `maSecure` | **Les deux instruisent le même dispositif réglementaire, à la même date de référence, sans se citer.** `maSecure` l'aborde à l'échelle de l'Union — six reports en dix-huit mois, 80 participants raccordés au 2 avril 2026 —, `payMe` à l'échelle du Burkina Faso — neuf institutions connectées à cette même date. La complémentarité est immédiate | **Direct. À instruire conjointement** |
| `Delivery` | Un livreur qui encaisse à la livraison relie directement les deux objets, et c'est le cas d'usage le plus courant du secteur | **Direct, non instruit** |
| `gounhri` | Le commerce de proximité est un tissu social avant d'être un flux de paiements | **Partiel, non instruit** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## 8. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

Le nom du produit · le premier segment de commerçants · le périmètre du produit minimal · **le modèle économique**, au-delà du principe que le paiement n'est pas le revenu · le régime réglementaire visé et le partenaire agréé · la forme juridique · l'ordre de construction des trois actifs candidats · le *Core Domain* · l'architecture et la pile technique.

---

## 9. Ce que la reprise doit produire, et dans quel ordre

```
INTENTION  (le présent document)
   v
ÉTUDE — le retrait est-il subi ou choisi, le commerçant adopte-t-il, la valeur reste-t-elle ?
   |     vague 0 : seize heures d'entretiens, avant le 30 septembre 2026
   v
CADRAGE STRATÉGIQUE — segment initial, position défendable, modèle économique
   v
DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

Le corpus a conduit l'étude documentaire et s'est arrêté au seuil du terrain. La reprise reprend exactement là, et son jalon 1 peut prononcer l'arrêt du projet.

---

*Version 0.1 — ouverture de la reprise. Le corpus hérité reste consultable en [[payMe/99-sources/Sources originales|99-sources]] et n'est opposable en rien.*
