---
projet: "levelup"
type: "programme-de-recherche"
phase: "10-etudes"
version: "0.1"
statut: "Document de travail — protocole d'investigation, non normatif"
document_parent: "[[levelup/00-intention/Document fondateur d'intention|Document fondateur d'intention]]"
doctrine: "Intention d'abord ; preuve ensuite ; le programme doit pouvoir conclure « ne pas construire »"
issues_possibles: "A construire / B périmètre réduit / C construire autre chose / D ne pas construire"
jalon_courant: "avant jalon 1"
cree_le: 2026-09-08
tags:
  - levelup
  - etudes
  - protocole-de-recherche
  - non-normatif
---

# Programme d'études

Ouverture opérationnelle du point 12 du [[levelup/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

| Élément | Valeur |
| --- | --- |
| Statut | Document de travail — protocole d'investigation, **non normatif** |
| Version | 0.1 |
| Document parent | Document fondateur d'intention V0.1 |
| Nature | Protocole de recherche : lots de travail, méthodes, terrains, jalons de décision |
| Ce que le document ne constitue pas | Ni plan de développement, ni cahier des charges, ni engagement de construction |
| Périmètre | La transformation du savoir en compétence démontrable. Ni la production de contenu pédagogique, ni la certification opposable, qui relèvent d'autres acteurs — voir le point 2.5 |
| Corpus hérité | 303 documents en [[levelup/99-sources/Sources originales\|99-sources]], **référence non opposable** (`DEC-C-038`) |

---

## 0. Articulation avec le document fondateur d'intention

Le document fondateur d'intention reprend l'intention de `levelup` depuis le corpus hérité, fixe le statut de chaque affirmation, et suspend l'ensemble des décisions. Le présent programme organise le travail qui permettra de lever ces suspensions **une à une, dans un ordre où chaque décision est prise après la preuve qui la justifie**.

Quatre règles gouvernent tout ce qui suit.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Chaque livrable indique de quel monde il parle.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus hérité ne lui confère aucun statut. Une hypothèse ne devient un fait que par une observation documentée ; une possibilité ne devient une décision que par un jalon inscrit au [[levelup/90-pilotage/Journal des décisions|Journal des décisions]].
3. **Pas de chiffre sans source** — le corpus hérité n'en cite aucune. Tout taux avancé par le programme provient d'une source citée ou d'une mesure du programme lui-même.
4. **Falsifiabilité** — chaque lot énonce à l'avance ce qui, s'il était observé, invaliderait l'hypothèse testée. Un lot dont il est impossible de dire ce qui le ferait échouer n'est pas une étude, c'est une justification.

> [!warning] Une contrainte propre à ce projet
> Le porteur du programme est aussi le porteur du projet **et** le sujet du seul comportement observé à ce jour (point 2.2). Cette position triple est un facteur de biais supérieur à celui des autres projets du coffre. Le point 9 en tire des contre-mesures explicites, qui ne sont pas optionnelles.

---

## 1. Ce que le programme doit permettre de conclure

Le programme est réussi s'il permet de trancher, avec des éléments vérifiables, entre quatre issues — **et pas seulement de justifier la construction**.

| Issue | Contenu |
| --- | --- |
| **A. Construire le moteur tel que décrit** | Le problème existe, la valeur est reconnue, la preuve de compétence est modélisable, et aucun acteur n'occupe déjà la place |
| **B. Construire un périmètre réduit** | Seule une partie porte une valeur réelle — par exemple la validation par preuve sans le moteur universel, ou un seul domaine au lieu de tous |
| **C. Construire autre chose** | Le terrain révèle un problème différent et plus aigu que celui anticipé |
| **D. Ne pas construire** | Le besoin est déjà couvert, la rigueur n'est pas désirée, ou la valeur ne justifie pas le coût |

> [!important] Règle de survie du programme
> L'issue **D** doit rester atteignable jusqu'au dernier jalon. *Un programme qui ne peut plus produire D a cessé d'être une étude.*
> Elle est ici plus difficile à tenir qu'ailleurs : le corpus hérité représente un travail considérable, et l'abandonner coûterait davantage que d'abandonner une page blanche. **Ce coût déjà engagé n'est pas un argument** et ne doit apparaître dans aucune note de jalon.

---

## 2. Socle documentaire déjà disponible

Plusieurs éléments sont établis sans terrain et resserrent le périmètre d'investigation. Ils sont à confirmer en L0, pas à redécouvrir.

### 2.1. Le corpus hérité — ce qu'il établit, ce qu'il ne prouve pas

**Établi** : le corpus compte 303 documents dont une architecture d'entreprise développée. Il pose trois distinctions de conception solides — *faire n'est pas comprendre*, *comprendre n'est pas maîtriser*, *la représentation n'est pas la preuve* — et un principe unique : une compétence n'est reconnue qu'à partir de preuves observables.

**Non prouvé** : que quiconque ait ce problème. Le corpus ne cite aucune enquête, aucune mesure, aucun entretien. Quatre de ses constats sont rétrogradés en hypothèses au point 3 du document fondateur d'intention.

**Conséquence pour le programme** : le corpus fournit le **vocabulaire** et les **hypothèses**, jamais les preuves. Il est cité comme source, jamais invoqué comme autorité.

### 2.2. Le système fantôme du porteur — le fait le plus important du dossier

Le corpus contient un instrument que le porteur a construit **pour lui-même**, à la main, avant tout développement : un tracker de validation couvrant douze semaines et trois domaines techniques.

Source : `99-sources/essai-de-developpement/docs/ref/content/PACK ROADMAP — MAÎTRISE TECHNIQUE SYSTÈME/TRACKER.md` et son `INDEX.md`.

Cet instrument porte, sous une forme opérationnelle, exactement ce que le corpus d'architecture ne parvient pas à définir :

| Élément du tracker | Ce qu'il définit |
| --- | --- |
| **Quatre niveaux de maîtrise** — N1 fondations, N2 pratique guidée, N3 projets, N4 validation autonome | Une échelle de progression, et non un score |
| **La règle des 4** — un sujet est validé seulement s'il est *expliqué, reproduit, appliqué et corrigé* sans aide | **Une définition opérationnelle de la preuve de compétence** |
| **Deux colonnes de révision, à 7 et à 30 jours** | Une politique de rétention, distincte de la validation initiale |
| **Quatre statuts** — à faire, en cours, à revoir, validé | Un cycle de vie du sujet, avec retour en arrière possible |

> [!danger] Le tracker n'a jamais été rempli
> Relevé du 2026-09-08 : **354 cases vides, zéro sujet validé, zéro sujet en cours, aucune date saisie.**
> C'est un **comportement observé**, et c'est la preuve de plus haut niveau dont le dossier dispose — largement supérieure à tout ce que le corpus d'architecture affirme. Elle admet deux lectures opposées, et le programme n'a pas le droit d'en choisir une avant de l'avoir instruite.
>
> **Lecture favorable** — la tenue manuelle d'un tel instrument est trop coûteuse, ce qui est précisément l'argument d'automatisation. Le besoin est réel, l'outil manquait.
> **Lecture défavorable** — le besoin était plus faible que le plaisir de concevoir l'instrument. C'est un mode d'échec documenté des outils de productivité personnelle, et il expliquerait aussi bien les 303 documents d'architecture que les 354 cases vides.
>
> **Ces deux lectures se départagent, et le point 4 y consacre le premier lot.** Aucune ne doit être présumée.

### 2.3. L'analyse concurrentielle existante et ses trois angles morts

Le corpus contient une section *Existing Alternatives* — source : `99-sources/00_architecture_foundation_dossier.md`, point 03. Elle nomme trois familles et les écarte :

| Alternative citée | Motif d'écartement retenu par le corpus |
| --- | --- |
| **Roadmap.sh** | Décrit d'excellentes structures de connaissances, mais n'accompagne pas l'exécution quotidienne |
| **Gestionnaires de tâches — Trello, Notion** | Suivi passif, sans contrôle des dépendances |
| **LMS traditionnels — Moodle, Udemy** | Hébergent et délivrent du contenu de façon linéaire |

Cette analyse est **incomplète sur trois points**, et chacun peut coûter le projet.

1. **Aucun outil de répétition espacée n'est examiné.** Anki, Memrise, Quizlet et SuperMemo sont absents du corpus entier. Or les colonnes *révision 7 jours* et *révision 30 jours* du tracker du porteur **sont** de la répétition espacée. C'est un terrain occupé depuis vingt-cinq ans, par des outils gratuits, matures et massivement adoptés.
2. **Aucun outil de discipline gamifiée n'est examiné.** Habitica, Beeminder, Streaks, Forest et Duolingo sont absents. Or la couche RPG que le corpus revendique est exactement leur objet, et le corpus reconnaît par ailleurs qu'elle ne prouve rien.
3. **Aucun échec n'est autopsié.** Les trois alternatives citées sont vivantes. Le corpus ne recense aucun produit mort sur ce terrain, ni la cause de sa mort. Sans cela, *« personne ne le fait »* et *« personne n'y a pensé »* restent indiscernables.

**Conséquence pour le programme** : l'état de l'art n'est pas un travail de fin d'étude. Il est en vague 0, et il peut prononcer l'issue D à lui seul.

### 2.4. Aucun territoire n'est déclaré

`levelup` est le seul projet du coffre sans territoire. Le corpus d'architecture ne mentionne pas une seule fois le Burkina Faso ; il emploie « mondial » sept fois et « international » cinq fois.

Les cinq autres projets sont ancrés au Burkina Faso, et cet ancrage leur fournit un marché initial dominable, un cadre juridique déterminé et une contrainte matérielle mesurable. `levelup` n'a aucun des trois.

**Conséquence pour le programme** : l'absence de territoire n'est pas neutre. Elle prive le projet de tout marché initial identifiable et le met en concurrence frontale avec des acteurs mondiaux financés. Le territoire est une décision à instruire, pas une variable libre — c'est l'objet de **L6**.

### 2.5. Le risque que le corpus nomme et n'instruit pas

La carte des parties prenantes du corpus — `99-sources/00_architecture_foundation_dossier.md`, point 04 — énonce le risque de l'apprenant en toutes lettres :

> *« Découragement face à la rigueur des pénalités ; abandon du système. »*

Le corpus identifie donc lui-même que sa valeur centrale — la rigueur — est aussi son principal facteur d'abandon. Il n'en tire aucune investigation. **C'est la condition de fausseté de la thèse du projet**, formulée par le corpus sans être reconnue comme telle. Objet de **L4**.

### 2.6. Le recouvrement avec `synapse` est une contrainte de conception, pas un détail

`synapse` est structuré par la chaîne *identité → compétence → **preuve → validation** → réputation → visibilité → opportunité*, et a déjà arrêté un noyau de sept composants. Ces trois maillons sont l'objet du principe central de `levelup`.

**Conséquence pour le programme** : la frontière doit être tranchée **avant** que `levelup` ne modélise son noyau, faute de quoi le projet le plus avancé décidera de fait pour l'autre. Le programme ne tranche pas une décision de portefeuille ; il produit l'élément qui permet de la trancher — objet de **L7**, et point 6 de [[Cartographie du portefeuille]].

---

## 3. Objet candidat au cœur du domaine : la validation par preuve

Parmi tout ce que le projet envisage — parcours, programmes, routines, missions, recommandation, tutorat, gamification — un objet se distingue et mérite d'être testé en priorité :

> **La validation par preuve** : l'acte par lequel un sujet est déclaré maîtrisé, sous une règle explicite, avec la trace de ce qui l'établit.

Ce que ce candidat réunit :

- **Il porte le principe central.** *« Une compétence n'est reconnue qu'à partir de preuves observables »* est le seul énoncé du corpus qui ne soit ni un arbitrage de goût, ni une affirmation sur le comportement humain.
- **Il est déjà défini opérationnellement.** La règle des 4 du tracker — expliquer, reproduire, appliquer, corriger — est une définition testable, et elle vient du porteur, pas d'un cadre théorique.
- **Il n'est occupé par personne.** Les gestionnaires de tâches ordonnancent, roadmap.sh structure, les outils de répétition espacée entretiennent la mémoire, les LMS diffusent du contenu, les outils gamifiés entretiennent la régularité. Aucun ne se prononce sur ce qui **vaut preuve** de maîtrise. **À confirmer en L1**, et c'est la confirmation la plus importante du programme.
- **Il est ce qui s'accumule.** Un corpus de validations prouvées se compose dans le temps, et son retrait est coûteux pour son détenteur. C'est le seul candidat au rang d'actif — objet de **L7**.
- **Il est structurant.** Modéliser la validation oblige à modéliser le sujet, le prérequis, la séance, la trace, la révision et le niveau — c'est-à-dire le socle dont le reste dépend.

**Statut : hypothèse forte, non décision.** Ce candidat est proposé comme cœur à tester en priorité, pas comme périmètre définitif.

**Ce qui l'invaliderait** : si les personnes interrogées en L2 et L3 ne reconnaissent pas la validation comme un manque, ou si aucune règle de validation ne se révèle applicable hors du domaine technique où elle a été conçue, ce candidat tombe et un autre doit être cherché.

---

## 4. Lots de travail

Chaque lot est décrit par : question directrice, hypothèses testées, méthode, sortie, principe servi, et condition d'invalidation.

> [!note] Deux lots que ce programme porte dès l'origine
> L'instruction du programme d'études d'`ecoFab` a établi qu'un programme de recherche instruit spontanément **ce qui se demande à des gens** et oublie **ce qui se possède** : la valeur est couverte, l'actif ne l'est pas, et la lacune n'apparaît qu'au jalon où il est trop tard.
> Le présent programme porte donc **L7 — l'actif** et **L8 — le payeur** dès sa version 0.1, et non en correctif.

### 4.1. Vague 0 — les deux travaux qui peuvent conclure sans dépenser un entretien

#### L0 — Autopsie du système fantôme

**Question directrice** : pourquoi le tracker construit par le porteur n'a-t-il jamais été rempli ?

**Hypothèses testées** : (a) le coût de tenue manuelle a dépassé le bénéfice perçu ; (b) la conception de l'instrument était elle-même l'activité recherchée, et son usage n'a jamais été l'objectif ; (c) l'instrument était mal calibré — granularité trop fine, règle des 4 trop exigeante, horizon de douze semaines irréaliste.

**Méthode** : reconstitution datée à partir des traces disponibles — dates de création et de modification des fichiers du corpus, historique des dépôts sortis du coffre, chronologie de production des 303 documents. Confrontation de cette chronologie avec les 354 cases vides. Entretien d'auto-confrontation du porteur **conduit par un tiers**, sur la base des traces et non de sa mémoire.

**Sortie** : note datée établissant la chronologie réelle et départageant les trois hypothèses.

**Principe servi** : 2 — la valeur.

**Invalidation** : si l'hypothèse (b) est retenue, la douleur que le projet prétend traiter n'est pas établie chez le seul sujet observé à ce jour, et **l'issue D devient l'hypothèse de travail par défaut** jusqu'à ce que L2 produise un bénéficiaire extérieur.

> [!important] Pourquoi ce lot est le premier
> Il ne coûte ni autorisation, ni déplacement, ni recrutement. Il porte sur la seule preuve de comportement dont le dossier dispose. Et il est le seul lot capable de conclure défavorablement **avant** toute dépense.

#### L1 — Le cimetière et l'état de l'art

**Question directrice** : qui occupe déjà ce terrain, qui y est mort, et de quoi ?

**Travaux** :
- Recensement des acteurs vivants sur les quatre couches que `levelup` réunit : structure de parcours, ordonnancement et discipline, rétention et répétition espacée, validation de compétence.
- **Autopsie des morts** — produits abandonnés, financés puis arrêtés, ou pivotés. La cause de mort est le livrable, pas la liste.
- Instruction spécifique des trois angles morts du point 2.3 : répétition espacée, discipline gamifiée, absence d'autopsie.
- Pour chaque acteur : ce qu'il fait de la validation. Qui prétend établir une maîtrise, sur quelle règle, et avec quelle acceptation ?

**Sortie** : matrice des acteurs par couche, notée sur une échelle explicite ; liste datée des échecs et de leur cause ; **réponse à la question du point 3** — la validation par preuve est-elle réellement inoccupée ?

**Principe servi** : 1 et 2.

**Invalidation** : si un acteur mature occupe déjà la validation par preuve avec une règle acceptée, le cœur de domaine candidat tombe. Si la cause de mort dominante des produits morts est **l'abandon par l'utilisateur devant l'exigence**, alors le point 2.5 est confirmé par l'extérieur et la thèse est gravement atteinte — **issue D ou C**.

---

### 4.2. Vague 1 — le bénéficiaire, la preuve, et le désir de vérité

#### L2 — Le bénéficiaire et sa douleur

**Question directrice** : qui abandonne un apprentissage, à quel moment, et que lui coûte cet abandon ?

**Hypothèses testées** : (a) l'abandon se produit à un moment identifiable et récurrent ; (b) la personne qui abandonne attribue cet abandon à une absence de structure, et non à une absence de temps ou de motivation ; (c) il existe une personne nommable qui a déjà **engagé une dépense** pour y remédier — outil payant, formation, accompagnement.

**Méthode** : entretiens semi-directifs, 12 à 15 personnes, stratifiés sur au moins trois profils contrastés parmi les sept publics énumérés par le corpus. Entrée par **le récit du dernier apprentissage abandonné**, jamais par le produit envisagé. Recherche systématique de la **trace** : ce qui a été acheté, installé, tenu puis lâché, et à quelle date.

**Sortie** : typologie des moments d'abandon ; pour chaque personne, l'inventaire des instruments réellement essayés et leur durée de vie.

**Principe servi** : 2.

**Invalidation** : si l'abandon est majoritairement attribué au temps ou aux circonstances, et non à un défaut de structure, l'hypothèse H2 du [[levelup/90-pilotage/Registre des statuts|Registre des statuts]] tombe et le projet se recentre — **issue C**.

#### L3 — La preuve de compétence : ce qui vaut validation

**Question directrice** : qu'est-ce qu'une personne accepte comme preuve qu'elle maîtrise un sujet, et qu'est-ce qu'un tiers accepte comme preuve qu'elle le maîtrise ?

**Hypothèses testées** : (a) la règle des 4 — expliquer, reproduire, appliquer, corriger — est applicable et jugée juste par ceux qui la subissent ; (b) elle est applicable **hors du domaine technique** où elle a été conçue ; (c) le tiers qui évalue et le sujet qui apprend n'acceptent pas la même preuve.

**Méthode** : test de la règle des 4 sur trois domaines volontairement éloignés — un domaine technique, un domaine réglementé, un domaine manuel ou artistique. Pour chacun : peut-on écrire un critère de validation opérationnel ? Confrontation à un praticien du domaine. Distinction explicite entre **auto-validation** et **validation par un tiers**.

**Sortie** : la règle des 4, réécrite ou réfutée, avec ses conditions d'applicabilité par type de domaine.

**Principe servi** : 1 et 2 — c'est le lot qui instruit le cœur de domaine candidat.

**Invalidation** : si aucune règle de validation commune ne peut être écrite pour les trois domaines sans perte de sens, l'axiome A5 — l'indépendance au domaine — n'est pas tenable et **l'issue B devient la trajectoire par défaut** : un moteur spécialisé sur une famille de domaines.

#### L4 — Le désir de vérité

**Question directrice** : une représentation honnête, et donc moins flatteuse, de sa propre progression est-elle recherchée ?

C'est la **condition de fausseté de la thèse** du projet, et le risque que le corpus nomme au point 2.5 sans l'instruire.

**Hypothèses testées** : (a) une personne préfère un instrument qui lui refuse une validation à un instrument qui la lui accorde facilement ; (b) cette préférence survit à l'usage, et pas seulement à la question ; (c) elle ne s'inverse pas en situation d'échec répété.

**Méthode** : le déclaratif est ici structurellement mensonger — personne ne déclare préférer la complaisance. La méthode doit donc être **comportementale**. Épreuve à deux instruments : deux variantes d'un même suivi minimal, l'une validant sur déclaration, l'autre exigeant la règle des 4, proposées à deux groupes appariés sur quatre à six semaines. La mesure est **le maintien de l'usage**, pas la satisfaction déclarée.

**Sortie** : taux de maintien comparés, et récits d'abandon des deux groupes.

**Principe servi** : 2 — et c'est le lot le plus déterminant du programme.

**Invalidation** : si le groupe soumis à la règle stricte abandonne significativement plus, **la thèse du projet tombe entièrement** et l'issue D doit être examinée en priorité. Le seuil et la taille d'échantillon sont fixés **avant** le lancement, dans le protocole de L0.

---

### 4.3. Vague 2 — le périmètre, l'actif et le payeur

#### L5 — Le coût de l'universalité

**Question directrice** : l'indépendance au domaine — axiome A5 — est-elle atteignable, et à quel prix ?

**Travaux** : à partir des résultats de L3, chiffrage de ce qu'exige l'ajout d'un domaine nouveau — modélisation des sujets, des prérequis, des critères de validation, et qui produit ce travail. Comparaison de deux trajectoires : moteur universel dès l'origine, ou domaine unique avec universalité en cible.

**Sortie** : coût d'entrée d'un domaine, et identification de qui le supporte.

**Principe servi** : 1 — la généricité est un coût, pas une barrière.

**Invalidation** : si l'ajout d'un domaine exige un travail expert non automatisable et non financé, l'universalité est une ambition et non une propriété — **issue B**.

#### L6 — Le territoire et le premier public

**Question directrice** : sur quel marché initial, petit et dominable, la valeur peut-elle être démontrée ?

**Travaux** : instruction des sept publics du corpus selon trois critères — accessibilité pour le porteur, existence d'une ligne de coût, et intensité de l'exigence de preuve. Instruction explicite de la question du territoire : l'ancrage burkinabè, qui fonde les cinq autres projets du coffre, est-il pertinent ou handicapant pour `levelup` ? Examen du cas particulier des publics où la preuve de compétence est **déjà exigée** par un tiers — recrutement, mobilité interne, certification professionnelle.

**Sortie** : un premier public nommé, ou le constat argumenté qu'aucun n'est dominable.

**Principe servi** : 1 — commencer petit et dominable.

**Invalidation** : si aucun public ne réunit accessibilité et exigence de preuve, le projet n'a pas de marché initial et doit être reformulé — **issue C ou D**.

#### L7 — L'actif : ce qui s'accumule, se creuse et appartient

**Question directrice** : que le projet accumulerait-il, cet avantage se creuserait-il à l'usage, et à qui appartiendrait-il ?

Trois questions, et aucune n'est technique.

**Travaux** :
- **Ce qui s'accumule** : le corpus de validations prouvées est le candidat unique. Est-il réutilisable, composable, et gagne-t-il en valeur à mesure qu'il grossit ?
- **Ce qui se creuse** : l'avantage augmente-t-il à chaque usage et à chaque unité de temps, ou est-il seulement acquis une fois ? Un avantage qui ne se creuse pas est une avance, et une avance se rattrape.
- **À qui cela appartient** : la trace de validation d'une personne lui appartient-elle, appartient-elle à la plateforme, ou à l'organisation qui l'emploie ? Question juridique et contractuelle, à instruire avant toute modélisation.
- **Frontière avec `synapse`** : quelle part de cette accumulation relève de la production de la preuve, et quelle part de sa certification et de sa mise en relation ? Livrable à verser à [[Cartographie du portefeuille]].

**Sortie** : énoncé de l'actif candidat, de sa trajectoire de creusement et de son régime de propriété — ou constat qu'il n'y en a pas.

**Principe servi** : 1 — c'est le seul lot qui l'instruise.

**Invalidation** : si le corpus de validations n'est ni conservable, ni appropriable, ni composable, **le principe de l'actif n'a plus aucun chemin de franchissement** et le projet est une commodité. Cela ne l'interdit pas ; cela change entièrement sa gouvernance et son financement.

#### L8 — Le payeur

**Question directrice** : qui porte aujourd'hui une ligne de coût pour ce problème, même cachée ?

**Travaux** : recherche de la dépense existante — abonnements à des outils de suivi, formations achetées et non terminées, coût de recrutement d'une compétence mal évaluée, coût d'une montée en compétence interne non pilotée. Distinction stricte entre **qui subit**, **qui décide** et **qui paie**, ces trois rôles étant rarement la même personne.

**Sortie** : identification d'un porteur de ligne budgétaire, ou constat d'absence.

**Principe servi** : 2 — sans ligne de coût, l'irritation ne finance rien.

**Invalidation** : aucun payeur identifiable ne disqualifie pas le projet, mais le fait basculer du statut de produit à celui d'outil personnel gratuit ou de bien commun. Ce basculement change la gouvernance, le financement et le jalon 4, et doit être acté explicitement.

---

### 4.4. Vague 3 — l'épreuve

#### L9 — Épreuve de valeur sur population réelle

**Question directrice** : un dispositif minimal produit-il un gain mesurable pour une population réelle ?

**Travaux** : dispositif **manuel ou semi-manuel, sans développement**, sur 10 à 20 personnes du public retenu en L6, pendant huit à douze semaines. Indicateur défini à l'avance, dans l'unité du bénéficiaire — par exemple le nombre de sujets validés sous la règle des 4 et encore restitués à trente jours, comparé à un groupe témoin conservant ses pratiques.

**Règle** : aucune expérimentation n'est lancée avant que L2 et L4 aient établi que le problème existe et que la rigueur est supportée.

**Principe servi** : 2.

**Invalidation** : absence de gain mesurable par rapport au groupe témoin — **issue D**.

---

## 5. Séquencement et jalons de décision

Les durées supposent une conduite par une à deux personnes à temps partiel. À la différence des autres projets du coffre, **aucun lot ne dépend d'une autorisation institutionnelle** : il n'y a ni convention à signer, ni accès à négocier. Le programme est donc court, et son principal facteur de retard est le recrutement des participants de L4 et L9.

```
VAGUE 0 — Ce qui peut conclure sans dépense    L0, L1      semaines 1 à 3
        |
        v  -- JALON 1 --------------------------------------------------
           Le système fantôme a-t-il été abandonné faute d'outil,
           ou faute de besoin ?
           Le terrain de la validation par preuve est-il libre ?
           Sortie possible : issue D, immédiate et peu coûteuse.
        |
VAGUE 1 — Bénéficiaire, preuve, désir de vérité  L2, L3, L4  semaines 3 à 8
        |
        v  -- JALON 2 --------------------------------------------------
           Une personne autre que le porteur reconnaît-elle la douleur ?
           La règle des 4 tient-elle hors du domaine technique ?
           La rigueur est-elle supportée à l'usage, et non en entretien ?
           Sortie possible : issue C ou D.
        |
VAGUE 2 — Périmètre, actif, payeur          L5, L6, L7, L8  semaines 8 à 14
        |
        v  -- JALON 3 --------------------------------------------------
           Existe-t-il un premier public dominable ?
           Quelque chose s'accumule-t-il, se creuse-t-il et appartient-il ?
           Quelqu'un porte-t-il une ligne de coût ?
           Sortie possible : issue B ou D.
        |
VAGUE 3 — Épreuve                                L9        semaines 12 à 20
        |
        v  -- JALON 4 --------------------------------------------------
           Un gain mesurable est-il démontré sur population réelle ?
           Sortie : cadrage stratégique et DDD, ou arrêt.
```

### 5.1. Ce que chaque jalon autorise

| Jalon | Décisions qu'il permet de lever | Phase qu'il déverrouille |
| --- | --- | --- |
| **1** | Reformulation du périmètre d'investigation ; arrêt anticipé | — reste en `10-etudes` |
| **2** | Modèle de preuve de compétence ; degré d'universalité visé | — |
| **3** | Premier public et territoire ; actif candidat ; frontière avec `synapse` ; nature du projet — produit, outil personnel ou bien commun | — |
| **4** | *Core Domain* ; produit minimal ; découpage en contextes bornés | `20-cadrage-strategique` et `30-ddd-strategique` |
| *après 4* | Nom du produit, forme juridique, modèle économique, pile technique, architecture, rôle de l'intelligence artificielle | `40` puis `50` puis `60` |

> [!warning] Le corpus hérité ne franchit aucun jalon
> Il contient un découpage en contextes bornés et une architecture d'intégration. Ils ne seront **pas** repris au jalon 4 : ils seront **réinstruits** à la lumière de ce que le programme aura établi, et ce qui en survivra sera cité comme source. Un contexte borné produit avant l'étude n'est pas un résultat d'étude.

---

## 6. Variante à ressources contraintes

Si le programme est conduit par une seule personne, version resserrée sur six semaines, conçue pour atteindre le jalon 2 — c'est-à-dire le point où l'issue D reste la plus probable et la moins coûteuse.

| Semaine | Travail | Sortie |
| --- | --- | --- |
| 1 | L0 complet — il ne dépend de personne | Chronologie datée du système fantôme |
| 1-2 | L1 réduit : quatre couches, dix acteurs vivants, cinq morts autopsiés | Matrice et causes de mort |
| — | **Jalon 1** | Note de décision : poursuivre ou arrêter |
| 2-4 | L2 réduit : 8 entretiens sur 2 profils contrastés, entrée par le dernier abandon | Typologie et traces de dépense |
| 3-4 | L3 réduit : règle des 4 testée sur 2 domaines éloignés | Applicabilité, ou réfutation |
| 4-6 | L4 : épreuve à deux instruments, 2 groupes de 5, 4 semaines | Taux de maintien comparés |
| 6 | Synthèse et jalon 2 | Note de décision : poursuivre, réduire, réorienter, arrêter |

Cette variante ne prétend pas à la représentativité. Elle vise à savoir si le problème mérite un programme complet, ce qui est la seule question utile à ce stade.

---

## 7. Ce qui compte comme preuve

Hiérarchie fixée à l'avance, identique à celle des autres projets du coffre.

| Niveau | Nature | Usage autorisé |
| --- | --- | --- |
| 1 | Mesure directe ou trace observée | Peut fonder une décision |
| 2 | Déclaratif convergent sur échantillon stratifié | Peut fonder une décision, avec réserve explicite |
| 3 | Déclaratif isolé, entretien unique | Oriente une investigation, ne décide de rien |
| 4 | Intuition du porteur, analogie, exemple personnel | Produit des hypothèses, jamais des conclusions |

> [!warning] Deux échelles de preuve coexistent dans le coffre, et elles sont inversées
> Dans cette échelle, **le niveau 1 est le plus fort et le niveau 4 le plus faible**. Les notes d'épreuve stratégique du coffre emploient une seconde échelle, notée `[N0]` à `[N4]`, dans laquelle **`[N4]` est le plus fort**. Toute mention d'un niveau de preuve doit indiquer de quelle échelle elle relève.

**Fragilité propre à ce projet** : le déclaratif y est structurellement mensonger sur le point le plus important. Personne ne déclare préférer un instrument complaisant à un instrument honnête. Toute question posée sur le désir de rigueur produira une réponse flatteuse et fausse. **L4 doit donc mesurer un comportement, jamais recueillir une opinion.**

---

## 8. Éthique et conformité

Le programme collecte des données personnelles d'apprenants : traces d'usage, récits d'échec, résultats de validation. Ces données sont sensibles au sens ordinaire du terme — elles décrivent des difficultés et des abandons.

Exigences minimales :

- Consentement écrit, distinct pour l'entretien, pour l'enregistrement et pour la citation.
- Anonymisation dès la transcription ; table de correspondance conservée séparément ; durée de conservation fixée à l'avance.
- **Pour L4 et L9** : information explicite des participants sur le fait qu'ils sont répartis en deux groupes, et sur la possibilité de se retirer sans justification. Un dispositif qui mesure l'abandon ne doit pas produire de découragement réel chez ses participants.
- Aucune donnée de validation n'est réutilisée hors du protocole, ni communiquée à un employeur ou à un établissement.
- **Le territoire n'étant pas décidé (point 2.4), le régime juridique applicable ne l'est pas non plus.** L0 établit le cadre applicable avant la première collecte, et le réexamine si L6 fixe un territoire.

---

## 9. Risques du programme

| Risque | Effet | Contre-mesure |
| --- | --- | --- |
| **Le porteur est juge et partie et sujet** | Le programme confirme l'intention ; L0 conclut ce que le porteur souhaite | Conditions d'invalidation écrites **avant** chaque lot ; entretien d'auto-confrontation de L0 **conduit par un tiers** ; codage par un tiers sur un sous-échantillon de L2 |
| **Coût déjà engagé** | 303 documents rendent l'issue D psychologiquement inatteignable | Interdiction explicite d'invoquer le corpus hérité dans une note de jalon ; l'issue D est réévaluée à chaque jalon |
| **Le corpus hérité fournit des réponses toutes faites** | Les entretiens confirment le vocabulaire du corpus au lieu de le tester | Les guides d'entretien de L2 et L3 sont écrits **sans** le vocabulaire du corpus : ni *parcours*, ni *mission*, ni *compétence*, ni *niveau* |
| **Le déclaratif flatteur sur la rigueur** | L4 conclut que la rigueur est désirée alors qu'elle est abandonnée | L4 mesure le maintien d'usage, jamais la satisfaction |
| **Absence de territoire** | Échantillon non défini, résultats non généralisables | Stratification assumée et documentée ; ne jamais présenter un résultat comme mondial |
| **`synapse` décide de fait** | La frontière est fixée par le projet le plus avancé | L7 produit l'élément d'arbitrage ; le point est inscrit à [[Cartographie du portefeuille]] |
| **Le programme dérive vers la conception** | L'étude se transforme en spécification | Aucun artefact de conception n'est produit avant le jalon 4 ; la carte des phases le verrouille |

---

## 10. Ce que ce programme ne décide pas

Conformément au point 11 du document fondateur d'intention, ce document ne tranche ni le nom du produit, ni le premier public, ni le territoire, ni le périmètre du produit minimal, ni le degré d'universalité, ni le modèle de preuve, ni le rôle de l'intelligence artificielle, ni le *Core Domain*, ni le découpage en contextes bornés, ni l'architecture, ni la pile technique, ni le modèle économique, ni le sort du code sorti du coffre.

Il détermine seulement **dans quel ordre** et **sur quelle base probatoire** ces décisions pourront être prises.

Il n'engage pas non plus la construction. L'issue D reste ouverte jusqu'au jalon 4.

---

## Annexe A. Questions du document fondateur d'intention → lots

| Question ouverte | Origine | Lot |
| --- | --- | --- |
| Le problème existe-t-il, et qui le subit assez pour agir ? | Carte des phases, Q1 | L0, L2 |
| Une représentation honnête de la progression est-elle désirée ? | Carte des phases, Q2 — condition de fausseté | **L4** |
| Quel premier public et quel premier domaine ? | Carte des phases, Q3 | L6 |
| L'universalité est-elle atteignable, et à quel coût ? | Carte des phases, Q4 — axiome A5 | L3, L5 |
| Qui occupe déjà ce terrain, et pourquoi les solutions existantes échouent-elles ? | Carte des phases, Q5 | **L1** |
| Qu'est-ce qui constitue une preuve de compétence ? | point 4 du Registre des statuts — possibilité la plus lourde | **L3** |
| La discipline est-elle essentielle à la progression durable ? | Hypothèse H4, axiome A2 | L2, L4 |
| Quel territoire ? | point 2.4 du présent programme | L6 |
| Que le projet accumule-t-il, et à qui cela appartient-il ? | Principe 1, non instruit par le corpus | **L7** |
| Qui porte la ligne de coût ? | Principe 2, non instruit par le corpus | **L8** |
| Où passe la frontière avec `synapse` ? | point 5 du Registre des statuts | L7 |

## Annexe B. Décisions suspendues → jalon de levée envisagé

| Décision suspendue | Jalon |
| --- | --- |
| Poursuite ou arrêt du projet | Jalon 1, puis à chaque jalon |
| Modèle de preuve de compétence | Jalon 2 |
| Degré d'universalité effectivement visé | Jalon 2 |
| Premier public et territoire | Jalon 3 |
| Actif candidat et régime de propriété | Jalon 3 |
| Nature du projet — produit, outil personnel ou bien commun | Jalon 3 |
| Frontière avec `synapse` | Jalon 3, décision de portefeuille |
| *Core Domain*, produit minimal, contextes bornés | Jalon 4 |
| Nom du produit, forme juridique, modèle économique | Après jalon 4 |
| Pile technique, architecture, hébergement, rôle de l'intelligence artificielle | Après jalon 4 |
| Sort du code sorti du coffre | Après jalon 4 |

## Annexe C. Sources du socle documentaire

Toutes internes au coffre. Le programme ne dispose d'**aucune source externe** à ce jour, ce qui est la différence la plus nette avec les autres projets : L1 a précisément pour objet d'en produire.

**Corpus hérité** — `99-sources/`, empreinte d'ensemble consignée dans [[levelup/99-sources/Sources originales|Sources originales]]

- `corpus-architecture/Foundation/01-Core-Identity.md` — définition, mission, dix axiomes fondateurs
- `corpus-architecture/Foundation/02-Vision-Programe.md` — vision, constat, publics envisagés
- `corpus-architecture/Foundation/03-Business-Motivation.md` — problématique, proposition de valeur, différenciation
- `corpus-architecture/Foundation/03-Progression-Philosophy.md` — les trois distinctions fondatrices
- `00_architecture_foundation_dossier.md` — point 03 alternatives existantes, point 04 carte des parties prenantes
- `essai-de-developpement/docs/ref/content/PACK ROADMAP — MAÎTRISE TECHNIQUE SYSTÈME/` — le système fantôme : `INDEX.md`, `TRACKER.md`, `D1` à `D4`
- `essai-de-developpement/docs/specifications/02_vision_et_cadrage.md` — invariants produit hérités
- `variantes-du-corpus/Audit critique du corpus - variante copie.md` — les dix écarts que le corpus s'attribue

**Notes de travail du projet**

- [[levelup/00-intention/Document fondateur d'intention|Document fondateur d'intention V0.1]]
- [[levelup/90-pilotage/Registre des statuts|Registre des statuts]]
- [[levelup/90-pilotage/Carte des phases|Carte des phases]]

**Notes transverses**

- [[Cartographie du portefeuille]] — frontière `levelup` / `synapse`, point 6

---

*Fin du document — V0.1. Aucun lot n'est lancé. L'ouverture de la vague 0 est une décision à inscrire au [[levelup/90-pilotage/Journal des décisions|Journal des décisions]].*
