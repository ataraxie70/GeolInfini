Je valide également. Et je pense que nous devons maintenant changer légèrement notre façon de travailler.

Jusqu'à présent, nous faisions émerger les idées au fil de la discussion. Maintenant que le socle philosophique est solide, il est temps de devenir beaucoup plus rigoureux.

À partir de maintenant, chaque nouveau concept devra passer par un **processus de validation architecturale**.

Par exemple :

```text
Nouvelle idée
       │
       ▼
Est-ce un nouveau concept métier ?
       │
 ┌─────┴─────┐
 │           │
Oui          Non
 │            │
 ▼            ▼
Ontologie   Extension d'un concept existant
 │
 ▼
Relations avec les autres concepts
 │
 ▼
Règles métier
 │
 ▼
Validation avec les documents fondateurs
 │
 ▼
Intégration
```

Ainsi, le projet restera cohérent même dans plusieurs années.

---

# Je pense que nous avons maintenant trouvé le véritable ordre des prochaines étapes

Au début, je voulais écrire directement l'ontologie.

Je pense maintenant qu'il manque encore une brique.

Et cette brique est très utilisée en ingénierie système.

## Les capacités (Capabilities)

Pourquoi ?

Parce qu'une ontologie décrit **ce qui existe**.

Mais elle ne dit pas **ce que le système doit être capable de faire**.

Or, TOGAF accorde une grande importance aux **Business Capabilities**.

Je pense que c'est exactement ce qu'il nous faut avant l'ontologie.

---

## Pourquoi ?

Prenons un exemple.

Nous avons dit que LevelUP orchestre :

* les ressources ;
* les parcours ;
* les programmes ;
* les routines ;
* les activités ;
* les preuves ;
* les compétences.

Très bien.

Mais quelles sont les **capacités** que cela implique ?

Par exemple :

```text
Construire un parcours
```

est une capacité.

---

```text
Organiser une progression
```

est une autre capacité.

---

```text
Mesurer la progression
```

encore une autre.

---

```text
Évaluer une compétence
```

encore une autre.

---

```text
Adapter un parcours
```

encore une autre.

---

Ces capacités existent indépendamment de la technologie.

---

# Je pense que nous allons découvrir naturellement notre ontologie

Au lieu de dire :

> Voici les concepts.

Nous allons dire :

> Voici ce que LevelUP doit être capable de faire.

Puis nous nous demanderons :

> Quels concepts sont nécessaires pour réaliser cette capacité ?

C'est beaucoup plus naturel.

---

# Exemple

Capacité :

```text
Construire un parcours
```

Question :

Quels objets existent ?

Réponse :

* Learning Path
* Knowledge Domain
* Knowledge Node
* Knowledge Contract
* Resource
* Dependency

L'ontologie apparaît naturellement.

---

Autre capacité :

```text
Suivre un programme universitaire
```

Il faut alors :

* Program
* Session
* Schedule
* Activity
* Calendar
* Attendance
* Progress

Encore une fois, les concepts émergent naturellement.

---

# Cela va également éviter un autre piège

Si nous écrivons directement une ontologie, nous risquons d'inventer des concepts inutiles.

En partant des capacités métier, nous ne garderons que les concepts réellement nécessaires.

C'est une approche très proche de **Capability-Based Planning**, utilisée en architecture d'entreprise.

---

# Je pense que nous devons désormais considérer LevelUP comme un produit d'infrastructure

Cela signifie que les prochaines étapes seront :

```
Constitution
        ✅

↓

Vision
        ✅

↓

Business Motivation
        ✅

↓

Progression Philosophy
        ✅

↓

Business Capabilities
        ← prochaine étape

↓

Business Universe

↓

Business Ontology

↓

Ubiquitous Language

↓

Business Principles

↓

Business Architecture

↓

Information Architecture

↓

Application Architecture

↓

Technology Architecture
```

Tu remarqueras que nous avons légèrement adapté TOGAF.

Mais cette adaptation est logique.

Nous ne changeons pas la méthode.

Nous ajoutons simplement des livrables qui permettront d'obtenir une architecture beaucoup plus robuste.

---

## Une dernière proposition

Je voudrais introduire un principe qui guidera tout le reste du projet.

Je l'appellerais :

> **Principe de Transformation**

> **LevelUP ne crée pas la connaissance. Il ne crée pas non plus la compétence. Il orchestre la transformation progressive d'objectifs en compétences réelles en s'appuyant sur des ressources, une organisation, une discipline, une progression structurée et des preuves d'apprentissage.**

Je pense que ce principe est l'aboutissement de toute notre réflexion.

Il relie les quatre documents déjà figés et donne une direction claire à tous les suivants. Chaque future capacité métier, chaque concept de l'ontologie et chaque fonctionnalité devra contribuer à cette transformation. Si un élément n'apporte rien à cette chaîne de transformation, il n'appartient probablement pas au cœur de LevelUP.

À mon avis, c'est maintenant le bon moment pour attaquer le **Business Capabilities Model**. Ce document sera le pont entre la philosophie que nous avons construite et l'ontologie métier qui suivra. C'est lui qui permettra de transformer nos idées en une architecture exploitable sans perdre la cohérence acquise jusqu'à présent.



______________________________________________________



Je pense que nous avons maintenant suffisamment de recul pour faire un choix d'architecture que l'on ne regrettera pas dans quelques années.

Et je voudrais proposer une règle.

> **À partir de maintenant, nous ne parlerons plus de fonctionnalités tant que les capacités métier ne sont pas complètement définies.**

Pourquoi ?

Parce qu'une fonctionnalité dépend d'une interface.

Une capacité métier dépend de la mission du système.

Une interface peut changer.

Une capacité reste.

---

# Pourquoi les Business Capabilities sont si importantes ?

Prenons un exemple.

Aujourd'hui nous disons :

> "Créer un parcours."

Ce n'est pas une fonctionnalité.

C'est une **capacité**.

Demain :

* interface Web
* interface Mobile
* IA
* API
* CLI

Toutes pourront créer un parcours.

La capacité reste identique.

---

Même chose.

Aujourd'hui nous disons :

> "Suivre une progression."

Ce n'est pas un écran.

C'est une capacité fondamentale.

---

# Je pense que nous devons définir ce qu'est une capacité

Pour LevelUP, une **Business Capability** est :

> **Une aptitude permanente du système à produire une valeur métier, indépendamment de son implémentation technique.**

Autrement dit,

nous ne décrivons pas :

* des boutons ;
* des menus ;
* des pages.

Nous décrivons ce que le système est capable de faire.

---

# Je propose une organisation en domaines

Au lieu d'écrire une longue liste de capacités, je propose de les regrouper.

Je vois déjà plusieurs grands domaines.

```text
LevelUP

├── Goal Management
├── Learning Orchestration
├── Progression Management
├── Competency Management
├── Resource Management
├── Program Management
├── Routine Management
├── Assessment Management
├── Evidence Management
├── Analytics
├── Collaboration
└── Platform Administration
```

Mais attention.

Ce ne sont pas encore des modules logiciels.

Ce sont des domaines métier.

---

# Regardons un domaine

Par exemple :

## Goal Management

Que doit être capable de faire LevelUP ?

Pas comment.

Mais quoi.

Je vois déjà :

```text
Goal Management

├── Définir un objectif

├── Modifier un objectif

├── Prioriser un objectif

├── Décomposer un objectif

├── Associer un objectif à un parcours

├── Associer un objectif à un programme

├── Associer un objectif à une routine

├── Associer un objectif à une mission

├── Mesurer l'avancement

└── Clôturer un objectif
```

Tu remarques quelque chose ?

Nous découvrons naturellement les objets métier.

---

# Prenons maintenant le domaine central

Je pense que le cœur de LevelUP est celui-ci.

## Learning Orchestration

Ce domaine n'existe pratiquement dans aucun logiciel actuel.

Je pense qu'il contient des capacités comme :

```text
Construire un parcours

↓

Structurer un domaine

↓

Définir les prérequis

↓

Définir les fondations

↓

Organiser les connaissances

↓

Associer les ressources

↓

Construire les activités

↓

Définir les validations

↓

Construire les missions

↓

Construire les projets

↓

Adapter le parcours
```

Regarde bien.

Nous retrouvons exactement ce que nous avons construit depuis plusieurs jours.

---

# Ensuite vient Progression Management

Celui-ci répond à :

> Comment accompagner l'évolution de l'apprenant ?

Je vois :

```text
Suivre la progression

Mesurer la progression

Visualiser la progression

Identifier les blocages

Proposer des révisions

Détecter les retards

Réorganiser le planning

Maintenir la discipline

Maintenir la régularité
```

La progression reste importante.

Mais elle est bien une capacité parmi d'autres.

---

# Puis Competency Management

C'est ici que réside la finalité.

Je pense qu'on y trouvera :

```text
Définir une compétence

Associer les connaissances

Associer les activités

Associer les preuves

Évaluer les preuves

Mesurer la confiance

Valider une compétence

Identifier les lacunes

Visualiser la maîtrise
```

Et tu remarques quelque chose d'intéressant.

Nous ne parlons jamais d'XP.

Jamais de badges.

Jamais de niveaux.

Ils appartiendront plus tard à l'Experience Engine, pas au moteur métier.

---

# Je voudrais proposer une règle pour tous les futurs livrables

Je l'appellerais :

## Principe de séparation des intentions

Nous distinguerons toujours quatre niveaux.

```text
Pourquoi ?

↓

Valeurs
```

Puis

```text
Que doit faire le système ?

↓

Business Capabilities
```

Puis

```text
Quels concepts permettent cela ?

↓

Business Ontology
```

Puis

```text
Comment cela sera construit ?

↓

Architecture
```

Cette séparation est extrêmement importante.

Elle empêchera toute confusion entre les besoins métier et les choix techniques.

---

## Je pense que nous venons de trouver notre rythme de travail

À partir de maintenant, chaque livrable sera construit selon la même discipline :

1. **Définir précisément son rôle** dans l'architecture.
2. **Identifier les concepts et les capacités concernés**, sans parler de technologie.
3. **Vérifier la cohérence** avec le *Core Identity*, la *Vision*, le *Business Motivation* et la *Progression Philosophy*.
4. **Le figer** une fois validé.

Cette méthode est, à mon avis, l'un des meilleurs investissements que nous puissions faire. Elle demandera davantage de réflexion aujourd'hui, mais elle nous évitera des reconceptions majeures lorsque LevelUP grandira et intégrera de nouveaux domaines, de nouvelles formes d'apprentissage ou de nouveaux modes d'interaction avec l'IA. Notre objectif n'est pas seulement de concevoir un bon produit ; c'est de construire un **référentiel d'architecture** capable d'accompagner l'évolution de LevelUP pendant de nombreuses années.



______________________________________________________


Je pense que nous avons maintenant suffisamment de recul pour faire un choix d'architecture que l'on ne regrettera pas dans quelques années.

Et je voudrais proposer une règle.

> **À partir de maintenant, nous ne parlerons plus de fonctionnalités tant que les capacités métier ne sont pas complètement définies.**

Pourquoi ?

Parce qu'une fonctionnalité dépend d'une interface.

Une capacité métier dépend de la mission du système.

Une interface peut changer.

Une capacité reste.

---

# Pourquoi les Business Capabilities sont si importantes ?

Prenons un exemple.

Aujourd'hui nous disons :

> "Créer un parcours."

Ce n'est pas une fonctionnalité.

C'est une **capacité**.

Demain :

* interface Web
* interface Mobile
* IA
* API
* CLI

Toutes pourront créer un parcours.

La capacité reste identique.

---

Même chose.

Aujourd'hui nous disons :

> "Suivre une progression."

Ce n'est pas un écran.

C'est une capacité fondamentale.

---

# Je pense que nous devons définir ce qu'est une capacité

Pour LevelUP, une **Business Capability** est :

> **Une aptitude permanente du système à produire une valeur métier, indépendamment de son implémentation technique.**

Autrement dit,

nous ne décrivons pas :

* des boutons ;
* des menus ;
* des pages.

Nous décrivons ce que le système est capable de faire.

---

# Je propose une organisation en domaines

Au lieu d'écrire une longue liste de capacités, je propose de les regrouper.

Je vois déjà plusieurs grands domaines.

```text
LevelUP

├── Goal Management
├── Learning Orchestration
├── Progression Management
├── Competency Management
├── Resource Management
├── Program Management
├── Routine Management
├── Assessment Management
├── Evidence Management
├── Analytics
├── Collaboration
└── Platform Administration
```

Mais attention.

Ce ne sont pas encore des modules logiciels.

Ce sont des domaines métier.

---

# Regardons un domaine

Par exemple :

## Goal Management

Que doit être capable de faire LevelUP ?

Pas comment.

Mais quoi.

Je vois déjà :

```text
Goal Management

├── Définir un objectif

├── Modifier un objectif

├── Prioriser un objectif

├── Décomposer un objectif

├── Associer un objectif à un parcours

├── Associer un objectif à un programme

├── Associer un objectif à une routine

├── Associer un objectif à une mission

├── Mesurer l'avancement

└── Clôturer un objectif
```

Tu remarques quelque chose ?

Nous découvrons naturellement les objets métier.

---

# Prenons maintenant le domaine central

Je pense que le cœur de LevelUP est celui-ci.

## Learning Orchestration

Ce domaine n'existe pratiquement dans aucun logiciel actuel.

Je pense qu'il contient des capacités comme :

```text
Construire un parcours

↓

Structurer un domaine

↓

Définir les prérequis

↓

Définir les fondations

↓

Organiser les connaissances

↓

Associer les ressources

↓

Construire les activités

↓

Définir les validations

↓

Construire les missions

↓

Construire les projets

↓

Adapter le parcours
```

Regarde bien.

Nous retrouvons exactement ce que nous avons construit depuis plusieurs jours.

---

# Ensuite vient Progression Management

Celui-ci répond à :

> Comment accompagner l'évolution de l'apprenant ?

Je vois :

```text
Suivre la progression

Mesurer la progression

Visualiser la progression

Identifier les blocages

Proposer des révisions

Détecter les retards

Réorganiser le planning

Maintenir la discipline

Maintenir la régularité
```

La progression reste importante.

Mais elle est bien une capacité parmi d'autres.

---

# Puis Competency Management

C'est ici que réside la finalité.

Je pense qu'on y trouvera :

```text
Définir une compétence

Associer les connaissances

Associer les activités

Associer les preuves

Évaluer les preuves

Mesurer la confiance

Valider une compétence

Identifier les lacunes

Visualiser la maîtrise
```

Et tu remarques quelque chose d'intéressant.

Nous ne parlons jamais d'XP.

Jamais de badges.

Jamais de niveaux.

Ils appartiendront plus tard à l'Experience Engine, pas au moteur métier.

---

# Je voudrais proposer une règle pour tous les futurs livrables

Je l'appellerais :

## Principe de séparation des intentions

Nous distinguerons toujours quatre niveaux.

```text
Pourquoi ?

↓

Valeurs
```

Puis

```text
Que doit faire le système ?

↓

Business Capabilities
```

Puis

```text
Quels concepts permettent cela ?

↓

Business Ontology
```

Puis

```text
Comment cela sera construit ?

↓

Architecture
```

Cette séparation est extrêmement importante.

Elle empêchera toute confusion entre les besoins métier et les choix techniques.

---

## Je pense que nous venons de trouver notre rythme de travail

À partir de maintenant, chaque livrable sera construit selon la même discipline :

1. **Définir précisément son rôle** dans l'architecture.
2. **Identifier les concepts et les capacités concernés**, sans parler de technologie.
3. **Vérifier la cohérence** avec le *Core Identity*, la *Vision*, le *Business Motivation* et la *Progression Philosophy*.
4. **Le figer** une fois validé.

Cette méthode est, à mon avis, l'un des meilleurs investissements que nous puissions faire. Elle demandera davantage de réflexion aujourd'hui, mais elle nous évitera des reconceptions majeures lorsque LevelUP grandira et intégrera de nouveaux domaines, de nouvelles formes d'apprentissage ou de nouveaux modes d'interaction avec l'IA. Notre objectif n'est pas seulement de concevoir un bon produit ; c'est de construire un **référentiel d'architecture** capable d'accompagner l'évolution de LevelUP pendant de nombreuses années.



______________________________________________________



Je pense que c'est le bon moment pour s'arrêter quelques minutes et regarder l'architecture dans son ensemble.

Et ma réponse est **non**, je ne pense pas que nous devions encore attaquer directement le livrable 4.

Pourquoi ? Parce qu'en discutant, nous avons découvert quelque chose qui n'était pas prévu au départ.

Au début, le **Livrable 4** devait être directement le *Business Universe & Ontology*.

Aujourd'hui, ce n'est plus le bon ordre.

---

# Ce que nous avons découvert

En quelques échanges, nous avons fait émerger plusieurs concepts nouveaux :

* Organisation
* Transformation
* Compétence réelle
* Application réelle
* Preuves
* Capacités métier
* Orchestration

Ces concepts sont arrivés **après** que nous avions imaginé le Business Universe.

Cela signifie que notre compréhension du métier a encore gagné en maturité.

Et c'est une excellente nouvelle.

---

# Si nous écrivons maintenant l'ontologie...

Nous allons naturellement écrire quelque chose comme :

```text
Goal

↓

Learning Path

↓

Knowledge

↓

Skill

↓

Activity

↓

Evidence
```

Mais...

Pourquoi ces objets existent-ils ?

Parce qu'ils permettent au système d'être capable de faire quelque chose.

Autrement dit...

L'ontologie découle des capacités.

---

# Je pense donc que l'ordre doit changer

Au lieu de :

```text
Vision

↓

Business Universe

↓

Capabilities
```

Je proposerais :

```text
Vision

↓

Business Capabilities

↓

Business Universe

↓

Business Ontology
```

Je pense que c'est beaucoup plus robuste.

---

# Pourquoi ?

Prenons un exemple.

Nous écrivons :

> Le système doit être capable d'orchestrer un parcours.

Question.

Quels objets faut-il ?

Nous découvrons immédiatement :

* Learning Path
* Knowledge Tree
* Knowledge Node
* Knowledge Contract
* Activity
* Resource

L'ontologie apparaît naturellement.

---

Autre exemple.

Le système doit être capable de suivre un semestre universitaire.

Nous découvrons :

* Program
* Session
* Calendar
* Attendance
* Schedule

Encore une fois.

Les objets apparaissent naturellement.

---

# Je pense même qu'il manque un document

En réalité...

Nous parlons depuis plusieurs jours de :

* parcours
* programme
* routine
* mission

Mais nous ne les avons jamais définis officiellement.

Je pense que cela mérite un document.

Je l'appellerais :

> **Business Capability Model**

Ce document ne dira pas :

Comment fonctionne un parcours.

Il dira :

**Le système est capable de gérer des parcours.**

Ce n'est pas la même chose.

---

# Ensuite seulement...

Nous pourrons construire le Business Universe.

Et là, nous répondrons :

Qu'est-ce qu'un parcours ?

Qu'est-ce qu'un programme ?

Qu'est-ce qu'une mission ?

Qu'est-ce qu'une activité ?

Qu'est-ce qu'une preuve ?

---

# Je voudrais également proposer une amélioration de notre méthode

Je pense que nous sommes en train de construire bien plus qu'une simple documentation TOGAF.

Nous sommes en train de construire un **Architecture Knowledge Base**.

Je proposerais donc que chaque livrable possède quatre sections obligatoires.

## 1. Purpose

Pourquoi ce document existe.

---

## 2. Definitions

Les concepts définis officiellement.

---

## 3. Principles

Les règles qui ne doivent jamais être violées.

---

## 4. Consequences

Les impacts sur les futurs livrables.

Par exemple.

Dans le **Core Identity**.

Une conséquence est :

> Toute compétence devra être démontrable.

Donc...

Le futur moteur d'évaluation devra respecter cette règle.

Cette manière d'écrire crée une **traçabilité architecturale**. Chaque principe énoncé dans un document produit des conséquences dans les suivants. Si, un jour, quelqu'un souhaite modifier un principe, il pourra immédiatement identifier tous les éléments de l'architecture qui en dépendent.

---

# Mon avis d'architecte

Je pense que nous devons résister à une tentation très fréquente : **vouloir modéliser trop tôt**.

Pour beaucoup de projets, cela conduit à un modèle métier qui reflète les premières idées, mais pas la compréhension réelle du domaine.

Or, ce qui s'est passé ces derniers échanges est très révélateur : nous avons commencé par parler de **progression**, puis nous avons compris que la progression seule n'était pas suffisante ; nous avons introduit l'**organisation**, la **compétence réelle**, les **preuves**, la **transformation** et enfin l'**orchestration**. Cela montre que notre vision du métier est encore en train de se cristalliser.

## Ma recommandation

Je modifierais légèrement notre feuille de route :

| Ordre    | Livrable                      | Objectif                                   |
| -------- | ----------------------------- | ------------------------------------------ |
| ✅ 1      | Core Identity                 | Identité immuable                          |
| ✅ 2      | Vision du Programme           | Ambition à long terme                      |
| ✅ 3      | Business Motivation           | Justification du programme                 |
| ✅ 3 bis  | Progression Philosophy        | Philosophie de la progression              |
| **➡️ 4** | **Business Capability Model** | Ce que LevelUP doit être capable de faire  |
| 5        | Business Universe             | Les grands concepts métier                 |
| 6        | Business Ontology             | Les relations formelles entre les concepts |
| 7        | Ubiquitous Language           | Le vocabulaire officiel                    |
| 8        | Business Principles           | Les règles métier transverses              |

Je suis convaincu que cet ordre est le plus solide. Le **Business Capability Model** servira de pont entre la philosophie que nous avons construite et l'ontologie qui suivra. Une fois ce document validé, le *Business Universe* et l'ontologie ne seront plus des exercices de conception, mais presque une conséquence logique des capacités métier identifiées. C'est, à mon avis, la meilleure façon de garantir que LevelUP reste cohérent pendant les dix prochaines années.



______________________________________________________


Je pense que nous pouvons maintenant attaquer ce qui sera le **premier véritable livrable d'architecture métier** de LevelUP.

Les documents précédents répondaient à :

* Pourquoi ?
* Pour qui ?
* Avec quelles valeurs ?
* Selon quelle philosophie ?

Le **Business Capability Model** répond à une autre question :

> **De quoi LevelUP doit-il être capable pour accomplir sa mission ?**

Cette différence est fondamentale.

---

# Avant de commencer, je voudrais fixer quelques règles

Je ne veux pas que ce document soit une simple liste de capacités.

Je voudrais qu'il respecte plusieurs principes.

## Principe 1 — Une capacité exprime un verbe

Une capacité n'est jamais un nom.

❌ Mauvais

* Learning Path
* Routine
* Resource

✅ Correct

* Construire un parcours
* Organiser une routine
* Associer une ressource
* Évaluer une compétence
* Mesurer une progression

Une capacité décrit toujours **une aptitude**.

---

## Principe 2 — Une capacité est indépendante de la technologie

Nous n'écrirons jamais :

❌

* Envoyer une notification push
* Créer un écran
* Exporter en PDF

Ce sont des implémentations.

Nous écrirons :

✅

* Informer un utilisateur
* Produire un rapport
* Communiquer un changement

---

## Principe 3 — Une capacité produit une valeur métier

Chaque capacité doit répondre à la question :

> **Quelle valeur apporte-t-elle à la transformation d'un objectif en compétence réelle ?**

Si la réponse est "aucune", cette capacité n'appartient pas au cœur de LevelUP.

---

# Je propose une architecture hiérarchique

Au lieu d'avoir 100 capacités mélangées, nous allons construire un arbre.

## Niveau 0 : Mission

```text
LevelUP

↓

Orchestrer la transformation d'objectifs en compétences réelles.
```

Tout découle de cette mission.

---

## Niveau 1 : Domaines de capacités

Je pense que nous avons déjà identifié les grands domaines.

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

Je voudrais attirer ton attention sur un point.

Je n'ai pas écrit **Task Management**.

Pourquoi ?

Parce que nous avons déjà démontré que ce concept est trop faible.

---

# Regardons chaque domaine

## 1. Goal Management

Ce domaine répond à une seule question.

> **Comment transformer une intention en objectif exploitable par le système ?**

Capacités potentielles :

```text
Définir un objectif

Qualifier un objectif

Prioriser un objectif

Décomposer un objectif

Associer un objectif à un parcours

Associer un objectif à un programme

Associer un objectif à une routine

Mesurer l'atteinte d'un objectif

Clôturer un objectif
```

---

## 2. Learning Orchestration

Je pense que c'est **le cœur de LevelUP**.

Aucun logiciel actuel ne le traite exactement de cette manière.

Il ne s'agit pas de créer un cours.

Il s'agit d'orchestrer tout le parcours.

Capacités :

```text
Construire un parcours

Structurer un domaine

Définir les fondations

Définir les dépendances

Définir les prérequis

Organiser les connaissances

Organiser les compétences

Associer des ressources

Construire des activités

Construire des missions

Construire des projets

Adapter un parcours

Personnaliser un parcours
```

---

## 3. Program Management

Ce domaine est très important, car il répond à ton besoin initial.

Exemples :

* semestre universitaire ;
* formation intensive de trois mois ;
* préparation d'un concours ;
* bootcamp ;
* planning annuel.

Capacités :

```text
Créer un programme

Importer un programme

Structurer un calendrier

Associer des activités

Planifier les sessions

Suivre l'exécution

Réorganiser un programme

Synchroniser un programme
```

---

## 4. Routine Management

Très différent d'un programme.

Une routine est cyclique.

Capacités :

```text
Créer une routine

Planifier une fréquence

Déclencher une routine

Suspendre une routine

Adapter une routine

Mesurer la régularité

Maintenir les habitudes
```

---

## 5. Progression Management

Nous retrouvons ici la philosophie de LevelUP.

Capacités :

```text
Suivre la progression

Mesurer la progression

Visualiser la progression

Identifier les blocages

Détecter les retards

Proposer des révisions

Maintenir la discipline

Maintenir la régularité
```

---

## 6. Competency Management

La finalité.

Capacités :

```text
Définir une compétence

Associer les connaissances

Associer les activités

Associer les preuves

Évaluer les preuves

Mesurer la confiance

Valider une compétence

Identifier les lacunes

Visualiser la maîtrise
```

---

## 7. Assessment & Evidence Management

Je pense que ce domaine deviendra l'un des plus innovants.

Pourquoi ?

Parce que **la compétence ne sera jamais déclarative**.

Elle devra être démontrée.

Capacités :

```text
Définir une preuve

Collecter une preuve

Valider une preuve

Associer une preuve

Conserver l'historique

Construire un portefeuille de preuves

Mesurer la crédibilité d'une preuve
```

---

## 8. Resource Management

Attention.

LevelUP ne crée pas les ressources.

Il les organise.

Capacités :

```text
Référencer une ressource

Qualifier une ressource

Associer une ressource

Versionner une ressource

Évaluer une ressource

Recommander une ressource
```

---

# Une idée supplémentaire

Je pense qu'il existe une capacité transverse qui n'appartient à aucun domaine.

Je l'appellerais :

## Competency Orchestration

Parce que tout le système repose dessus.

Elle consiste à coordonner :

* les objectifs ;
* les parcours ;
* les programmes ;
* les routines ;
* les activités ;
* les évaluations ;
* les preuves ;
* les ressources ;
* la progression.

pour conduire à une compétence démontrable.

Cette capacité n'est pas un module.

C'est la **capacité systémique** de LevelUP.

---

# Ce que je propose pour ce livrable

Je ne souhaite pas le figer aujourd'hui.

Je voudrais le construire comme nous avons construit les premiers documents :

1. **Valider les domaines de capacités.**
2. Décomposer chaque domaine en sous-capacités.
3. Définir les relations entre les domaines.
4. Identifier les capacités cœur (*Core Capabilities*) et les capacités de support.
5. Vérifier que chaque capacité contribue bien à la mission fondatrice de LevelUP.

## Je pense que cette approche est plus fidèle à TOGAF

TOGAF insiste sur le fait que les **Business Capabilities** décrivent ce que l'organisation ou le système doit être capable de faire, indépendamment de toute organisation interne ou implémentation. En procédant de cette manière, nous préparons naturellement le terrain pour le **Business Universe** : lorsque chaque capacité sera stabilisée, les concepts métier nécessaires émergeront presque automatiquement. Nous n'aurons plus à « inventer » une ontologie ; nous la **découvrirons** à partir des besoins fondamentaux de LevelUP. C'est, à mon avis, la meilleure garantie d'obtenir un modèle métier cohérent, durable et extensible.
