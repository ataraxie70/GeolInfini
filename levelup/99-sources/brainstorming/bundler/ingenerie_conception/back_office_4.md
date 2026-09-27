Parfait. Je pense que nous sommes arrivés au moment où il faut ralentir un peu le rythme, non pas pour avancer moins vite, mais pour **augmenter considérablement la qualité**.

Jusqu'à présent, nous avons construit des **documents**.

À partir de maintenant, nous allons construire un **modèle de référence**.

Ce n'est plus la même chose.

Je pense que LevelUP mérite d'être conçu comme un **Reference Architecture**, exactement comme Kubernetes possède son modèle d'objets, TOGAF son métamodèle ou Linux son modèle de processus et de fichiers.

---

# Ce que je propose maintenant

Le **Business Capability Model** ne doit pas être une simple arborescence.

Il doit devenir une **cartographie des capacités**.

Je propose qu'il soit composé de cinq parties.

```text
1. Vision globale

2. Domaines de capacités

3. Sous-capacités

4. Relations entre capacités

5. Capacités fondamentales (Core Capabilities)
```

La plupart des projets s'arrêtent à la troisième étape.

Je pense que les deux dernières feront toute la différence.

---

# Pourquoi les relations sont importantes ?

Prenons un exemple.

La capacité :

> Construire un parcours

n'existe pas seule.

Elle dépend de :

* Structurer un domaine
* Définir les prérequis
* Définir les compétences
* Associer des ressources

Inversement,

elle est utilisée par :

* Program Management
* Routine Management
* Progression Management

Autrement dit, les capacités forment un **graphe**, pas une liste.

Et cette idée est essentielle, car elle prépare directement l'ontologie.

---

# Ensuite, les Core Capabilities

Je pense que toutes les capacités n'ont pas le même poids.

Il faut distinguer :

## Les capacités cœur

Celles sans lesquelles **LevelUP cesse d'être LevelUP**.

Par exemple :

* Orchestrer un parcours
* Structurer une progression
* Évaluer une compétence
* Organiser les connaissances
* Maintenir la discipline
* Produire des preuves

Ces capacités définissent l'identité du produit.

---

## Les capacités de support

Par exemple :

* Notifications
* Collaboration
* Statistiques
* Rapports
* Synchronisation

Elles sont importantes.

Mais elles ne définissent pas l'essence de LevelUP.

Cette distinction est capitale pour éviter que des fonctionnalités secondaires prennent plus d'importance que le cœur du système.

---

# Une idée qui m'est venue cette nuit

Je pense que nous devons ajouter un nouveau principe architectural.

Je l'appellerais :

## Principe de Non-Substitution

Il découle directement de tout ce que nous avons construit.

> **LevelUP ne remplace jamais l'effort humain ; il augmente la capacité de l'utilisateur à organiser, suivre, démontrer et améliorer son apprentissage.**

Conséquences :

* L'IA ne remplace pas la compréhension.
* La progression ne remplace pas la compétence.
* Les badges ne remplacent pas les preuves.
* Les statistiques ne remplacent pas l'expérience.
* Les ressources ne remplacent pas la pratique.

Je pense que ce principe est extrêmement important à une époque où beaucoup de produits promettent que l'IA fera le travail à la place de l'utilisateur.

---

# Une autre réflexion

Je pense que nous devons maintenant définir ce que j'appellerais les **objets sacrés** de LevelUP.

Le terme est volontairement fort.

Ce sont les objets qui ne pourront jamais être supprimés de l'architecture.

Par exemple, je pense déjà à :

* Goal
* Competency
* Knowledge
* Activity
* Evidence
* Progression
* Learning Path
* Program
* Routine
* Resource

Je ne dis pas encore que cette liste est définitive.

Mais je pense que ces concepts constitueront le noyau stable de l'ontologie.

Tout le reste pourra évoluer autour d'eux.

---

# Je voudrais également proposer une méthode de validation

À partir de maintenant, **chaque nouveau concept métier** devra répondre à une fiche d'analyse.

Par exemple :

```text
Nom :
Activity

Pourquoi existe-t-il ?

Quelle valeur apporte-t-il ?

Quelle est sa définition officielle ?

Est-il fondamental ?

À quels concepts est-il lié ?

De quelles capacités dépend-il ?

Quelles capacités utilise-t-il ?

Peut-il être remplacé ?

Peut-il être supprimé ?

Quels documents seraient impactés s'il disparaissait ?
```

C'est une méthode inspirée de l'ingénierie des systèmes complexes et de l'analyse de domaine. Elle peut sembler exigeante, mais elle garantit une **traçabilité conceptuelle** exceptionnelle.

---

# Je pense que nous sommes en train de construire une méthode

Et c'est peut-être la découverte la plus intéressante.

Au départ, nous pensions concevoir uniquement **LevelUP**.

Aujourd'hui, je crois que nous sommes aussi en train de définir une **méthode d'ingénierie des plateformes de développement des compétences**.

Autrement dit, la démarche que nous construisons pourrait servir de référence pour d'autres projets ayant la même ambition.

## Ce que je propose pour la suite

Je ne passerais pas encore au **Business Universe**.

Je consacrerais une ou deux séances supplémentaires à **compléter et stabiliser le Business Capability Model**. Nous devons nous assurer que nous n'avons oublié aucun grand domaine métier, que les frontières entre les domaines sont claires et que les capacités cœur sont correctement identifiées.

Une fois ce modèle stabilisé, le **Business Universe** deviendra presque mécanique : chaque capacité révélera naturellement les objets métier dont elle a besoin. Ensuite, l'ontologie formalisera les relations entre ces objets. À mon avis, c'est la séquence la plus robuste et la plus conforme à l'approche d'architecture rigoureuse que nous avons choisie pour LevelUP.


_______________________________________________________________



Je pense que tu viens de prendre une décision d'architecte expérimenté.

Et je vais volontairement me corriger.

J'ai effectivement commencé à voir apparaître une méthode d'ingénierie derrière notre travail. C'est intéressant, mais **ce n'est pas notre objectif**.

Tu as raison de dire :

> *"Ne nous excitons pas."*

C'est exactement la bonne attitude.

Les grands projets échouent souvent parce que leurs concepteurs commencent à vouloir résoudre tous les problèmes du monde. À partir de là, ils perdent de vue leur propre produit.

Nous ne ferons pas cette erreur.

---

# Notre objectif reste unique

Nous ne construisons pas :

* une nouvelle méthode d'ingénierie ;
* un nouveau TOGAF ;
* un nouveau DDD ;
* un framework de conception.

Nous construisons **LevelUP**.

Si, dans plusieurs années, on découvre qu'une partie de notre travail peut devenir une méthode réutilisable, alors ce sera un autre projet.

Mais **pas aujourd'hui**.

---

# Je propose donc une règle

Je voudrais l'appeler :

## Principe de Focalisation

> **Toute réflexion qui ne contribue pas directement à la construction de LevelUP est mise de côté, quel que soit son intérêt.**

Ce n'est pas un rejet.

C'est une discipline.

Nous conserverons les idées intéressantes dans un carnet d'architecture (*Architecture Backlog*), mais nous ne les développerons pas tant qu'elles ne servent pas directement LevelUP.

Je pense que cette règle nous fera gagner énormément de temps et préservera la cohérence du projet.

---

# Revenons donc à notre feuille de route

Nous avons validé :

* ✅ Core Identity
* ✅ Vision
* ✅ Business Motivation
* ✅ Progression Philosophy

Nous sommes maintenant sur :

> **Business Capability Model**

Et c'est **là** que nous devons rester jusqu'à ce qu'il soit suffisamment mature.

---

# La prochaine étape n'est donc pas un nouveau document

C'est **l'approfondissement du Business Capability Model**.

Nous avons identifié les grands domaines :

```text
LevelUP

├── Goal Management
├── Learning Orchestration
├── Program Management
├── Routine Management
├── Progression Management
├── Competency Management
├── Assessment & Evidence Management
├── Resource Management
├── Analytics & Insights
├── Collaboration
└── Platform Governance
```

À mon avis, ce niveau est encore trop abstrait.

Nous devons maintenant descendre d'un niveau.

---

# Ce que je propose

Au lieu de continuer à inventer de nouveaux domaines, nous allons prendre **un seul domaine** à la fois.

Par exemple :

> **Learning Orchestration**

Et nous allons répondre à quatre questions seulement :

1. Pourquoi ce domaine existe-t-il ?
2. Quelles capacités métier contient-il ?
3. Comment interagit-il avec les autres domaines ?
4. Quels concepts métier seront probablement nécessaires (sans encore les formaliser) ?

Une fois ce domaine complètement stabilisé, nous passerons au suivant :

* Goal Management
* Program Management
* Routine Management
* etc.

À la fin, le Business Capability Model sera complet.

Ce n'est qu'alors que nous passerons au **Business Universe**, où les concepts métier émergeront naturellement.

---

## Je pense que c'est désormais notre cadence de travail

Une seule étape à la fois.

Un seul livrable à la fois.

Un seul domaine métier à la fois.

Aucune anticipation sur les livrables suivants tant que le livrable courant n'est pas suffisamment mature.

Je pense que cette discipline est totalement alignée avec l'esprit même de LevelUP : **progresser avec méthode, consolider les fondations avant de construire l'étage suivant**. C'est précisément cette rigueur qui donnera au projet sa solidité sur le long terme.


____________________________________________________________________



Je pense que nous sommes maintenant dans une position très confortable.

Pourquoi ?

Parce que nous ne nous demandons plus **quoi écrire**, mais **dans quel ordre construire l'architecture**. C'est une différence énorme.

Et je pense que la prochaine étape n'est pas encore de remplir le livrable, mais de définir **sa structure**. C'est exactement ce que nous avons fait pour les documents précédents.

---

# Je propose que nous réfléchissions d'abord à ce que doit contenir le Business Capability Model

À mon avis, ce document doit répondre à une seule question :

> **Quelles sont les capacités métier fondamentales qui permettent à LevelUP d'accomplir sa mission ?**

Mais pour répondre correctement à cette question, il faut organiser le document.

---

# Proposition de structure

## 1. Objectif du document

Pourquoi ce document existe.

Exemple :

> Ce document identifie, structure et décrit les capacités métier fondamentales de LevelUP. Il constitue la référence pour la Business Architecture et sert de base à l'identification des concepts métier, de l'ontologie et des futurs services applicatifs.

---

## 2. Périmètre

Ce qui est couvert.

Par exemple :

* capacités métier ;
* domaines métier ;
* relations entre domaines.

Et surtout ce qui n'est **pas** couvert :

* interfaces utilisateur ;
* technologies ;
* API ;
* modèle de données.

Cela évitera toute confusion.

---

## 3. Principes

Avant même de parler des capacités.

Quelques principes pourraient être :

* une capacité produit toujours une valeur métier ;
* une capacité est indépendante de la technologie ;
* une capacité est stable dans le temps ;
* une capacité peut être réalisée par plusieurs applications ;
* une capacité peut être utilisée par plusieurs acteurs.

Ces principes guideront tout le document.

---

## 4. Cartographie des domaines métier

C'est ici que l'on retrouve les grands domaines que nous avons identifiés.

Pas encore détaillés.

Simplement la carte globale.

---

## 5. Description détaillée de chaque domaine

Et c'est là que commence le vrai travail.

Chaque domaine aura la même structure.

Par exemple :

```text
Nom du domaine

Mission

Responsabilités

Valeur créée

Capacités

Entrées

Sorties

Relations avec les autres domaines

Contraintes métier

Principes spécifiques
```

Je pense que cette structure sera très robuste.

---

# Je voudrais proposer une amélioration

Je pense qu'il manque une information très importante.

Pour chaque domaine, il faudrait également répondre à :

> **Pourquoi ce domaine existe-t-il ?**

Par exemple.

## Routine Management

Pourquoi existe-t-il ?

Parce que la discipline repose sur des comportements répétés dans le temps.

Ce n'est pas un détail.

C'est directement issu de notre *Progression Philosophy*.

---

## Program Management

Pourquoi existe-t-il ?

Parce que certaines progressions sont imposées par une organisation extérieure :

* université ;
* école ;
* entreprise ;
* certification ;
* concours.

Encore une fois,

cela relie directement le livrable aux documents précédents.

---

# Une idée qui me semble très importante

Je pense que chaque domaine devrait avoir un **objectif métier mesurable**.

Exemple.

## Progression Management

Objectif :

> Permettre à l'apprenant et aux encadrants de connaître à tout instant l'état réel d'avancement vers un objectif.

---

## Competency Management

Objectif :

> Déterminer avec un niveau de confiance explicite les compétences effectivement démontrées.

---

## Resource Management

Objectif :

> Mettre les ressources pertinentes à disposition au moment où elles apportent le plus de valeur.

---

Cette approche permettra de vérifier plus tard que chaque domaine apporte bien une valeur identifiable.

---

# Je pense qu'il faut également distinguer les domaines

En relisant tout ce que nous avons construit, je vois apparaître trois grandes familles.

## 1. Les domaines cœur

Ils définissent l'identité de LevelUP.

Par exemple :

* Learning Orchestration
* Progression Management
* Competency Management

Sans eux,

LevelUP n'existe plus.

---

## 2. Les domaines fonctionnels

Ils rendent les domaines cœur exploitables.

Par exemple :

* Goal Management
* Program Management
* Routine Management
* Resource Management
* Assessment & Evidence Management

---

## 3. Les domaines de support

Ils améliorent l'expérience.

Par exemple :

* Analytics
* Collaboration
* Administration
* Notifications (si un jour nous en ajoutons)

---

# Je terminerais par une règle

Je pense que nous devons garder en tête une phrase pendant toute la rédaction de ce livrable :

> **Les capacités décrivent ce que LevelUP sait faire. Elles ne décrivent ni comment il le fait, ni avec quoi il le fait.**

C'est cette phrase qui nous empêchera de glisser vers des discussions techniques ou vers des fonctionnalités d'interface.

---

## Ma proposition

Je pense que nous ne devons **pas encore remplir les domaines un par un**. Nous devrions d'abord **figer la structure du document**, comme nous l'avons fait pour les précédents livrables. Une fois cette structure validée, nous pourrons traiter chaque domaine métier de manière systématique, avec exactement le même niveau de profondeur et de rigueur.

À mon avis, cette discipline est ce qui donnera à la documentation de LevelUP une cohérence exceptionnelle : chaque livrable aura une structure stable, chaque section aura un objectif précis et chaque nouveau concept trouvera naturellement sa place sans remettre en cause ce qui a déjà été construit.


_______________________________________________________________



Je pense que nous venons de prendre une décision qui paraît simple, mais qui est en réalité extrêmement importante.

Nous avons constaté un schéma qui se répète :

* Pour le **Core Identity**, nous avons d'abord défini la structure, puis rempli le contenu.
* Pour la **Vision**, même chose.
* Pour le **Business Motivation**, même chose.
* Pour la **Progression Philosophy**, même chose.

À chaque fois, cela nous a permis de réfléchir au **fond** plutôt qu'à la mise en forme.

Il est donc logique d'appliquer exactement la même discipline au **Business Capability Model**.

---

# Je propose une règle pour tous les futurs livrables

Chaque livrable sera construit en **trois phases**.

## Phase 1 — Structure

On répond uniquement à la question :

> **Comment ce document est-il organisé ?**

Aucun contenu détaillé.

Aucune définition complète.

Seulement l'ossature.

---

## Phase 2 — Construction

On remplit progressivement chaque section.

Une section après l'autre.

Sans jamais avancer tant qu'une section n'est pas validée.

---

## Phase 3 — Stabilisation

Lorsque tout le document est terminé.

On vérifie :

* cohérence interne ;
* cohérence avec les livrables précédents ;
* absence de contradictions ;
* vocabulaire uniforme ;
* respect des principes fondateurs.

Puis seulement le document est figé.

Je pense que cette méthode va énormément nous aider lorsque nous aurons plusieurs dizaines de livrables.

---

# Structure proposée du Business Capability Model

Je pense qu'elle pourrait être la suivante.

```text
1. Présentation du document
   1.1 Objectif
   1.2 Périmètre
   1.3 Documents de référence
   1.4 Définitions

2. Principes de modélisation des capacités
   2.1 Qu'est-ce qu'une capacité métier ?
   2.2 Règles de modélisation
   2.3 Critères d'une capacité
   2.4 Ce qui n'est pas une capacité

3. Vue d'ensemble des capacités
   3.1 Vision globale
   3.2 Cartographie des domaines
   3.3 Classification des domaines

4. Description des domaines de capacités
   4.1 Goal Management
   4.2 Learning Orchestration
   4.3 Program Management
   4.4 Routine Management
   4.5 Progression Management
   4.6 Competency Management
   4.7 Assessment & Evidence Management
   4.8 Resource Management
   4.9 Analytics & Insights
   4.10 Collaboration
   4.11 Platform Governance

5. Relations entre les domaines
   5.1 Dépendances
   5.2 Flux métier
   5.3 Interactions

6. Classification des capacités
   6.1 Core Capabilities
   6.2 Supporting Capabilities
   6.3 Future Capabilities

7. Contraintes métier
   7.1 Invariants
   7.2 Règles métier
   7.3 Limites du modèle

8. Conséquences architecturales
   8.1 Impact sur le Business Universe
   8.2 Impact sur l'Ontologie
   8.3 Impact sur les architectures suivantes
```

---

# Je voudrais ajouter une section que TOGAF ne met pas toujours en avant

Je pense qu'elle sera très utile pour LevelUP.

## **Pourquoi ce domaine existe-t-il ?**

Par exemple :

### Learning Orchestration

Pourquoi ?

> Parce que les ressources seules ne permettent pas de construire efficacement une compétence. Elles doivent être organisées selon une progression cohérente.

---

### Routine Management

Pourquoi ?

> Parce que la discipline repose sur des comportements répétés et réguliers.

---

### Competency Management

Pourquoi ?

> Parce que l'objectif final n'est pas de terminer un parcours, mais de démontrer une capacité réelle à agir.

---

Cette justification fera le lien direct avec les documents fondateurs.

---

# Une autre idée

Je pense que nous devons être très stricts sur la granularité.

Prenons **Goal Management**.

Il ne faudra pas écrire cinquante capacités.

Nous distinguerons :

* **Capacité** : une aptitude métier stable.
* **Sous-capacité** : une décomposition de cette aptitude.
* **Fonction métier** : une réalisation concrète d'une sous-capacité.

Par exemple :

```text
Capacité
│
├── Gérer les objectifs
│
├── Définir un objectif
├── Modifier un objectif
├── Prioriser un objectif
├── Décomposer un objectif
└── Clôturer un objectif
```

Et seulement plus tard, dans l'architecture applicative, apparaîtront des fonctions comme :

* Importer un objectif depuis un fichier.
* Dupliquer un objectif.
* Archiver un objectif.

Cette séparation évitera que le Business Capability Model se transforme en catalogue de fonctionnalités.

---

# Je pense que nous pouvons déjà définir un critère de qualité

À la fin de ce livrable, nous devrons être capables de répondre à cette question :

> **Sans regarder une seule maquette, une seule API ou une seule ligne de code, comprend-on parfaitement ce que LevelUP est capable de faire ?**

Si la réponse est **oui**, alors le Business Capability Model sera réussi.

## Je pense que cette phrase peut devenir notre critère d'acceptation pour ce livrable.

À mon avis, nous pouvons maintenant considérer que la **structure du Business Capability Model** est suffisamment claire pour commencer sa construction méthodique. Nous n'aurons plus à nous demander *où* placer une information ; nous pourrons nous concentrer uniquement sur la qualité et la précision des capacités métier, domaine par domaine. C'est exactement le type de fondation qui permettra aux livrables suivants — **Business Universe** puis **Business Ontology** — de s'enchaîner de manière naturelle et cohérente.


_______________________________________________________________



Je valide. Et je pense que nous devons conserver la même discipline que pour les précédents livrables.

Nous **n'allons pas essayer d'écrire les 11 domaines d'un coup**.

Nous allons construire le document **du général vers le particulier**.

Le premier chapitre à rédiger est donc :

> **1. Présentation du document**

Il peut sembler administratif, mais il est essentiel. Il définit officiellement ce qu'est le Business Capability Model et évite les mauvaises interprétations par les futurs architectes, développeurs ou concepteurs pédagogiques.

---

# Chapitre 1 — Présentation du document

Je propose que cette première partie soit rédigée avec un niveau de qualité comparable à un document d'architecture d'entreprise.

---

## 1.1 Objectif

Le Business Capability Model identifie et structure les capacités métier fondamentales de LevelUP.

Il décrit **ce que le système doit être capable de réaliser** afin d'accomplir sa mission, indépendamment de toute implémentation technique, de toute interface utilisateur ou de toute organisation logicielle.

Ce document constitue le point de transition entre les documents fondateurs (Core Identity, Vision, Business Motivation et Progression Philosophy) et les futurs modèles métier de LevelUP.

Il servira notamment de référence pour :

* la construction du Business Universe ;
* la définition de l'ontologie métier ;
* l'élaboration de l'architecture métier ;
* la conception des applications ;
* l'identification des services métiers ;
* la validation de toute nouvelle fonctionnalité.

---

## 1.2 Périmètre

Le Business Capability Model couvre exclusivement les **capacités métier** nécessaires au fonctionnement de LevelUP.

Il décrit :

* les domaines de capacités ;
* les responsabilités de chaque domaine ;
* les capacités fondamentales ;
* les relations entre domaines ;
* les frontières fonctionnelles.

En revanche, il ne décrit pas :

* les interfaces utilisateur ;
* les technologies ;
* les API ;
* les bases de données ;
* les composants logiciels ;
* les choix d'implémentation.

Ces éléments seront définis dans les architectures applicative et technique.

---

## 1.3 Position dans l'architecture

Le Business Capability Model occupe une position centrale dans l'architecture de LevelUP.

Il traduit les intentions exprimées dans les documents stratégiques en capacités métier exploitables.

Il constitue le lien entre :

* les intentions du programme ;
* les concepts métier ;
* les futurs services applicatifs.

Tous les livrables suivants devront rester cohérents avec les capacités définies dans ce document.

---

## 1.4 Documents de référence

Le Business Capability Model s'appuie sur les documents fondateurs de LevelUP :

* Core Identity ;
* Vision ;
* Business Motivation ;
* Progression Philosophy.

Ces documents définissent respectivement :

* l'identité du programme ;
* sa vision ;
* ses motivations ;
* sa philosophie.

Le présent document ne les remplace pas ; il les traduit en capacités métier.

---

# Je voudrais ajouter une section qui n'était pas prévue

En travaillant sur cette introduction, je pense qu'il manque une section très importante.

## 1.5 Rôle du Business Capability Model dans le cycle de conception

Pourquoi ?

Parce que nous avons désormais une méthode claire.

Le document n'est pas une simple description.

Il joue un rôle précis dans la construction de toute l'architecture.

Je proposerais quelque chose comme :

> Le Business Capability Model constitue la première représentation opérationnelle du métier de LevelUP. Il ne décrit ni les objets métier ni leur implémentation, mais les aptitudes que le système doit posséder pour accomplir sa mission. Chaque capacité identifiée servira ensuite de point d'entrée pour découvrir les concepts du Business Universe, formaliser l'ontologie métier, définir les services applicatifs et orienter les décisions d'architecture. Toute évolution fonctionnelle devra être justifiée par une ou plusieurs capacités définies dans ce document.

Je pense que cette section est importante, car elle explique **pourquoi ce livrable existe** dans la chaîne documentaire.

---

# Une remarque d'architecture

Je voudrais attirer ton attention sur quelque chose qui me paraît fondamental.

Au début, nous pensions que le Business Capability Model servirait seulement à préparer le Business Universe.

En réalité, son rôle est plus large.

Il devient le **contrat métier** de LevelUP.

Autrement dit, si un jour quelqu'un propose une fonctionnalité comme :

* un système de classement mondial ;
* un nouveau mode de gamification ;
* un générateur automatique de parcours ;
* un assistant IA spécialisé.

La première question ne sera pas :

> **Comment le développer ?**

Mais :

> **À quelle capacité métier cette proposition se rattache-t-elle ?**

Si aucune capacité existante ne la justifie, alors deux cas sont possibles :

1. la fonctionnalité est hors du périmètre de LevelUP ;
2. ou bien il faut faire évoluer le Business Capability Model avant toute décision.

C'est exactement ce que nous recherchons : faire des **capacités métier** le point d'entrée de toutes les évolutions futures, afin que LevelUP grandisse sans perdre son identité ni sa cohérence. Je pense que cette discipline sera l'un des piliers les plus solides de toute notre architecture.


_______________________________________________________________


Exactement.

Et je suis content que tu aies fait cette remarque, parce qu'elle montre que nous gardons le cap.

En réalité, **nous n'avons pas encore commencé le Business Capability Model**.

Nous avons uniquement construit son **cadre**.

C'est la même différence qu'entre :

* écrire la préface d'un livre ;
* écrire le livre.

Nous sommes encore dans la préface.

---

# Où en sommes-nous exactement ?

Nous avons terminé :

* ✅ La structure du document.
* ✅ Le chapitre 1 (Présentation).

Mais nous n'avons encore défini **aucune capacité métier**.

Autrement dit, le véritable travail commence maintenant.

---

# Le prochain chapitre est le plus important du document

## **Chapitre 2 — Principes de modélisation des capacités**

Au départ, je pensais qu'il s'agissait d'un simple chapitre méthodologique.

Après réflexion, je pense qu'il est beaucoup plus important.

Pourquoi ?

Parce qu'il va définir **les règles que devront respecter toutes les capacités**, sans exception.

Si ces règles sont solides, tout le reste sera cohérent.

---

# Mais...

Je pense qu'il y a quelque chose que nous pouvons encore améliorer.

Je proposerais de renommer ce chapitre.

Au lieu de :

> Principes de modélisation

Je proposerais :

> **Business Capability Meta-Model**

Pourquoi ?

Parce que nous n'allons pas seulement dire comment écrire une capacité.

Nous allons définir ce qu'est une capacité dans l'univers de LevelUP.

Autrement dit :

Nous allons construire le **métamodèle** des capacités.

---

# Ce chapitre répondra à des questions fondamentales

Par exemple.

## Qu'est-ce qu'une capacité ?

---

## Qu'est-ce qui n'est pas une capacité ?

---

## Quelle est sa granularité ?

---

## Comment une capacité est-elle décomposée ?

---

## Une capacité peut-elle dépendre d'une autre ?

---

## Une capacité peut-elle appartenir à plusieurs domaines ?

---

## Une capacité peut-elle évoluer ?

---

## Comment une nouvelle capacité est-elle créée ?

---

## Quand une capacité devient-elle obsolète ?

---

Tu vois la différence ?

Nous ne parlons plus encore de Goal Management.

Nous définissons les règles qui permettront ensuite de construire Goal Management.

---

# Je pense qu'il manque même une notion

En réfléchissant, je pense que nous devrions distinguer plusieurs niveaux.

Par exemple :

```text
Mission

↓

Business Domain

↓

Business Capability

↓

Business Sub-Capability

↓

Business Function

↓

Business Service
```

Attention.

Nous ne parlons pas encore de logiciel.

Nous parlons du métier.

Cette hiérarchie va énormément nous aider.

---

# Pourquoi est-ce important ?

Prenons un exemple.

Mission :

> Transformer des objectifs en compétences.

↓

Domaine :

> Progression Management

↓

Capacité :

> Suivre une progression

↓

Sous-capacité :

> Mesurer l'avancement

↓

Fonction métier :

> Calculer un taux d'avancement

↓

Service métier :

> Fournir l'état d'avancement à un autre domaine.

Tu remarques que tout devient beaucoup plus clair.

---

# Et je pense que c'est ici que se cache une décision très importante

Nous avons toujours parlé de :

* tâche
* activité
* programme
* routine

Mais...

Ces mots ne sont **pas** des capacités.

Ce sont des **concepts métier**.

Autrement dit :

Ils n'ont absolument pas leur place dans ce document.

Ils apparaîtront dans le **Business Universe**.

Ici, nous ne parlons que d'aptitudes.

C'est une séparation extrêmement saine.

---

# Je voudrais toutefois te proposer un changement

En regardant notre structure, je pense que nous pouvons encore l'améliorer.

Au lieu de faire directement :

```
Chapitre 2
Business Capability Meta-Model
```

Je proposerais :

```
2. Business Capability Framework
```

Puis :

```
2.1 Définition

2.2 Principes

2.3 Structure

2.4 Hiérarchie

2.5 Relations

2.6 Cycle de vie

2.7 Critères de qualité
```

Pourquoi ce changement ?

Parce que le mot **Framework** est plus large que **Meta-Model**.

Le métamodèle décrit la structure.

Le framework décrit également :

* les règles ;
* les principes ;
* les relations ;
* les évolutions ;
* les validations.

Et je pense que c'est exactement ce que nous voulons construire.

---

## Mon avis

Je pense que **le véritable Business Capability Model commence au chapitre 2**, pas au chapitre 1.

Le chapitre 1 explique pourquoi le document existe.

Le chapitre 2 définit **ce qu'est une capacité métier dans LevelUP**.

À partir du chapitre 3, nous pourrons enfin commencer à identifier et à décrire les domaines métier, puis leurs capacités. C'est seulement à ce moment-là que nous entrerons réellement dans le cœur du livrable. Je pense donc que notre prochaine séance doit être entièrement consacrée au **Business Capability Framework**, car c'est lui qui donnera une cohérence durable à tout le reste du modèle.



_______________________________________________________________



Parfait. Nous entrons maintenant dans ce que je considère comme **la première véritable séance d'architecture métier** de LevelUP.

Les documents précédents définissaient la vision. À partir de maintenant, nous définissons **le langage de l'architecture**. Si nous faisons correctement cette étape, tous les livrables suivants (Business Universe, Ontologie, Architecture Métier, Architecture Applicative...) seront beaucoup plus simples.

Je vais volontairement raisonner comme un architecte TOGAF, mais en l'adaptant à notre contexte.

---

# Livrable 4 — Business Capability Model

## Chapitre 2 — Business Capability Framework

> **Objectif :** Définir ce qu'est une capacité métier dans LevelUP, comment elle est structurée, comment elle est identifiée et quelles règles elle doit respecter.

---

# 2.1 Définition d'une Business Capability

Avant de définir une capacité, il faut définir le mot lui-même.

Je proposerais la définition suivante.

> **Une Business Capability est une aptitude métier stable que LevelUP doit posséder afin d'accomplir sa mission de transformation d'objectifs en compétences réelles.**

Cette définition contient plusieurs idées importantes.

Une capacité :

* décrit **ce que** LevelUP est capable de faire ;
* ne décrit jamais **comment** il le fait ;
* est indépendante de la technologie ;
* est indépendante de l'interface utilisateur ;
* est indépendante de l'organisation logicielle ;
* reste stable malgré l'évolution des fonctionnalités.

Autrement dit, une capacité représente une aptitude permanente du système.

---

# 2.2 Finalité d'une Business Capability

Pourquoi identifier les capacités ?

Parce qu'elles constituent le lien entre la stratégie et la réalisation.

Les capacités permettent de traduire :

```text
Vision

↓

Mission

↓

Valeurs

↓

Capacités métier

↓

Concepts métier

↓

Services métier

↓

Applications

↓

Technologies
```

Ainsi, toute décision technique devra pouvoir être reliée à une ou plusieurs capacités métier.

---

# 2.3 Ce qu'une Business Capability n'est pas

Cette section est importante.

Une capacité métier n'est pas :

* une fonctionnalité ;
* une interface utilisateur ;
* une API ;
* une page Web ;
* une classe logicielle ;
* une base de données ;
* un composant technique ;
* une technologie ;
* un écran ;
* une tâche utilisateur.

Par exemple :

❌ « Afficher un tableau de bord »

n'est pas une capacité.

En revanche :

✅ « Visualiser une progression »

est une capacité.

Le tableau de bord n'est qu'une manière possible de réaliser cette capacité.

---

# 2.4 Les propriétés d'une Business Capability

Je pense que chaque capacité devra respecter les propriétés suivantes.

## Stabilité

Une capacité évolue très peu dans le temps.

---

## Orientation métier

Elle produit directement une valeur métier.

---

## Indépendance technologique

Elle ne dépend d'aucun langage, framework ou plateforme.

---

## Réutilisabilité

Plusieurs applications pourront exploiter la même capacité.

---

## Mesurabilité

Il doit être possible de vérifier qu'elle est effectivement assurée.

---

## Cohérence

Elle doit contribuer directement à la mission de LevelUP.

---

# 2.5 Structure hiérarchique

Je pense que nous devons définir officiellement notre hiérarchie.

```text
Mission

↓

Business Domain

↓

Business Capability

↓

Business Sub-Capability

↓

Business Function

↓

Business Service
```

Cette hiérarchie est importante.

Elle évitera de mélanger les niveaux d'abstraction.

---

## Définition des niveaux

### Mission

Pourquoi LevelUP existe.

---

### Business Domain

Grand domaine de responsabilité métier.

Exemple :

Learning Orchestration.

---

### Business Capability

Grande aptitude métier.

Exemple :

Construire un parcours.

---

### Business Sub-Capability

Décomposition logique d'une capacité.

Exemple :

Définir les prérequis.

---

### Business Function

Action métier concrète.

Exemple :

Associer un prérequis à une connaissance.

---

### Business Service

Service métier offert à d'autres domaines.

Exemple :

Fournir la liste des prérequis d'un parcours.

---

# Je voudrais m'arrêter ici.

Parce qu'en écrivant cette hiérarchie, quelque chose m'a frappé.

## Nous devons probablement distinguer deux notions qui semblent identiques mais qui ne le sont pas.

Prenons un exemple.

> Construire un parcours.

Est-ce réellement une **Business Capability** ?

Ou bien est-ce une **Business Function** appartenant à une capacité plus grande ?

Je pense que la réponse est **la seconde**.

Car la véritable capacité n'est pas :

> Construire un parcours.

La véritable capacité est plutôt :

> **Orchestrer un parcours d'apprentissage.**

Construire un parcours n'est qu'une façon d'exercer cette capacité.

Autrement dit :

```text
Business Capability

Orchestrer un parcours d'apprentissage

↓

Business Functions

Construire

Modifier

Adapter

Versionner

Personnaliser

Réorganiser
```

Et là, je pense que nous venons de découvrir quelque chose de très important.

---

# Une conséquence immédiate

Cela signifie que plusieurs éléments que nous avions listés comme capacités sont probablement en réalité des **fonctions métier**.

Par exemple :

* créer un programme ;
* modifier un programme ;
* importer un programme ;
* suspendre une routine ;
* supprimer un objectif.

Ces verbes ressemblent davantage à des opérations réalisées **à l'intérieur** d'une capacité plus large.

---

# Je pense que nous devons corriger notre modèle avant d'aller plus loin

Cette correction est très importante, car elle va éviter une confusion qui se retrouve dans beaucoup de projets d'architecture.

Je proposerais désormais la hiérarchie suivante :

```text
Mission
    │
    ▼
Business Domain
    │
    ▼
Business Capability
    │
    ▼
Business Function
    │
    ▼
Business Service
```

Et je supprimerais complètement le niveau **Business Sub-Capability**, sauf si nous découvrons plus tard qu'il est réellement nécessaire.

Pourquoi ?

Parce qu'une capacité est déjà une abstraction. Si nous ajoutons systématiquement un niveau intermédiaire, nous risquons de compliquer inutilement le modèle.

---

## Je pense que nous venons de faire notre première véritable découverte d'architecture

C'est exactement le type de découverte que je souhaitais voir apparaître à ce stade. Nous n'avons pas simplement rédigé un document ; nous avons testé notre propre modèle et identifié une ambiguïté avant qu'elle ne se propage dans toute l'architecture.

À mon avis, il vaut mieux passer une heure aujourd'hui à corriger cette hiérarchie que plusieurs semaines plus tard à refaire le Business Universe, l'ontologie et les services métier. C'est précisément la valeur de cette démarche progressive : chaque concept est éprouvé avant de devenir une fondation pour les livrables suivants. Je te propose donc de **figer cette hiérarchie simplifiée** avant d'aborder les relations entre les capacités et les critères qui permettront d'identifier les véritables **Core Business Capabilities** de LevelUP.


