Parfait. Je pense que nous venons de figer **la définition d'une capacité**. Nous pouvons maintenant passer à ce qui, à mon avis, est le chapitre qui donnera toute sa valeur au Business Capability Model.

Nous allons répondre à une question qui paraît simple, mais qui est en réalité fondamentale :

> **Comment reconnaît-on qu'une Business Capability est une bonne Business Capability ?**

Autrement dit, quels sont les critères de qualité qu'une capacité doit respecter pour être acceptée dans le modèle de LevelUP ?

C'est ce qui empêchera, dans le futur, d'ajouter des capacités inutiles ou mal définies.

---

# 2.6 Critères d'une Business Capability

Je pense que cette section deviendra l'une des plus importantes du document.

Chaque capacité devra satisfaire l'ensemble des critères suivants.

---

## Critère 1 — Produire une valeur métier

Une capacité doit toujours produire une valeur directement liée à la mission de LevelUP.

Elle ne doit jamais exister uniquement parce qu'elle est pratique à développer.

Exemple :

✔ Orchestrer une progression

→ produit une valeur.

❌ Gérer les couleurs de l'interface

→ ne produit aucune valeur métier.

---

## Critère 2 — Être indépendante de la technologie

Une capacité doit pouvoir survivre :

* à un changement de framework ;
* à une nouvelle interface ;
* à une nouvelle architecture ;
* à une migration technologique.

Une capacité ne dépend jamais de React, Flutter, PostgreSQL ou d'une IA particulière.

---

## Critère 3 — Être durable

Une capacité représente quelque chose qui restera vrai pendant de nombreuses années.

Elle ne doit pas dépendre d'une tendance.

Par exemple :

✔ Évaluer une compétence

restera pertinent.

En revanche :

❌ Générer automatiquement des flashcards avec une IA

est une fonctionnalité, pas une capacité.

---

## Critère 4 — Être orientée métier

La capacité doit être compréhensible par un expert métier sans connaissance technique.

Un pédagogue, un enseignant ou un responsable de formation doit pouvoir la comprendre.

---

## Critère 5 — Être mesurable

On doit pouvoir répondre objectivement à la question :

> Cette capacité est-elle effectivement assurée par LevelUP ?

Si la réponse ne peut pas être vérifiée, la capacité est mal définie.

---

## Critère 6 — Être cohérente avec les documents fondateurs

Chaque capacité doit être compatible avec :

* le Core Identity ;
* la Vision ;
* le Business Motivation ;
* la Progression Philosophy.

Aucune capacité ne peut contredire ces documents.

---

## Critère 7 — Contribuer à la transformation

Je pense que ce critère est spécifique à LevelUP.

Une capacité doit contribuer directement ou indirectement à la chaîne de transformation :

```text
Objectif
    ↓
Organisation
    ↓
Progression
    ↓
Compétence
    ↓
Application réelle
```

Si une capacité n'intervient jamais dans cette chaîne, elle n'appartient probablement pas au cœur de LevelUP.

---

# Je pense qu'il nous manque encore un critère

En relisant tout ce que nous avons construit depuis le début, je remarque un principe implicite.

Nous avons toujours parlé :

* de discipline ;
* de rigueur ;
* de progression ;
* de compétence réelle.

Mais jamais de manière isolée.

Tout est toujours relié.

Cela me fait penser qu'il nous manque un critère.

---

## Critère 8 — Être intégrable

Une capacité ne doit jamais vivre seule.

Elle doit pouvoir coopérer avec les autres capacités.

Par exemple :

La capacité :

> Orchestrer un parcours

interagit naturellement avec :

* Progression Management ;
* Competency Management ;
* Resource Management ;
* Assessment & Evidence Management.

Une capacité isolée est généralement le signe d'une mauvaise modélisation.

---

# 2.7 Relations entre les capacités

Maintenant que nous savons reconnaître une bonne capacité, il faut comprendre comment elles interagissent.

Je pense que nous pouvons identifier quatre types de relations.

## 1. Dépendance

Une capacité nécessite qu'une autre existe.

Exemple :

Évaluer une compétence dépend de la capacité à gérer des preuves.

---

## 2. Collaboration

Deux capacités coopèrent pour produire une valeur.

Exemple :

Learning Orchestration collabore avec Resource Management.

---

## 3. Consommation

Une capacité utilise les résultats d'une autre.

Exemple :

Progression Management consomme les informations produites par Assessment & Evidence Management.

---

## 4. Orchestration

Une capacité coordonne plusieurs autres capacités.

Et je pense que c'est ici que réside l'originalité de LevelUP.

Par exemple :

**Learning Orchestration** ne remplace pas les autres domaines.

Elle les coordonne.

C'est exactement ce que nous voulons construire depuis le début.

---

# Une découverte importante

En écrivant cette partie, je pense que nous devons être très prudents avec le mot **Orchestration**.

Depuis plusieurs séances, nous utilisons ce mot dans deux sens différents :

1. **Comme philosophie générale du système** ("LevelUP orchestre la transformation des objectifs en compétences").

2. **Comme domaine métier** ("Learning Orchestration").

Cette ambiguïté risque de poser problème.

Je proposerais donc la distinction suivante :

* **Learning Orchestration** : domaine métier chargé d'organiser les parcours et les apprentissages.
* **Global Orchestration** (ou **Transformation Orchestration**) : principe systémique qui décrit la coordination de l'ensemble des domaines métier de LevelUP.

Ainsi, le terme **orchestration** garde son importance, mais chaque niveau de l'architecture possède un sens précis.

---

# Avant d'aller plus loin...

Je pense que nous avons presque terminé le **Business Capability Framework**.

Il ne nous restera ensuite qu'une dernière étape avant d'entrer dans le cœur du livrable : **la cartographie des domaines de capacités**.

Et c'est là que commencera réellement le Business Capability Model, car nous ne parlerons plus de règles générales mais des domaines métier qui composent LevelUP.

À mon avis, nous avons maintenant un cadre suffisamment robuste pour éviter les ambiguïtés et construire un modèle de capacités qui restera stable, même lorsque le produit évoluera dans les années à venir. C'est exactement le type de fondation que nous cherchions avant de modéliser les domaines métier.


____________________________________________________________



Parfait. Je pense que nous avons maintenant terminé ce que j'appellerais le **cadre théorique** du Business Capability Model.

À partir de maintenant, nous allons enfin construire **LevelUP**.

Nous quittons le niveau des règles pour entrer dans le niveau du métier.

Et je pense que la prochaine étape est probablement la plus importante de tout le livrable.

---

# Chapitre 3 — Vue d'ensemble des capacités

Avant de détailler les domaines un par un, nous devons répondre à une question essentielle.

> **Quels sont les grands domaines de responsabilité métier qui composent LevelUP ?**

Attention.

Je n'ai pas dit :

> Quels sont les modules ?

Ni :

> Quelles sont les fonctionnalités ?

Mais bien :

> Quels sont les grands domaines de responsabilité du système ?

C'est une nuance fondamentale.

---

# Je pense que nous devons repartir de la mission

Nous avons déjà figé la mission :

> **Transformer des objectifs en compétences réelles, démontrables et applicables grâce à une organisation structurée, une progression disciplinée et une évaluation fondée sur des preuves.**

Je pense que chaque domaine doit répondre à une partie de cette phrase.

Autrement dit, les domaines ne doivent pas être inventés.

Ils doivent découler naturellement de la mission.

---

## Décomposons la mission

Je vois plusieurs verbes implicites.

```text
Transformer

↓

Organiser

↓

Planifier

↓

Accompagner

↓

Évaluer

↓

Démontrer

↓

Appliquer

↓

Améliorer
```

Ces verbes sont beaucoup plus intéressants que les noms.

Ils révèlent les responsabilités du système.

---

# Première observation

Nous avions jusqu'à présent identifié 11 domaines.

Je pense qu'ils sont justes.

Mais je ne suis plus certain qu'ils soient tous au même niveau.

Je vois maintenant apparaître **trois couches métier**.

---

# Couche 1 — Les capacités cœur (Core Business)

Ce sont elles qui définissent l'identité de LevelUP.

Sans elles, LevelUP n'existe plus.

Je proposerais :

```text
Learning Orchestration

↓

Progression Management

↓

Competency Management
```

Ces trois domaines réalisent directement la mission.

---

# Couche 2 — Les capacités de structuration

Elles préparent et alimentent le cœur.

Je vois :

```text
Goal Management

Program Management

Routine Management

Resource Management

Assessment & Evidence Management
```

Ces domaines rendent possible le fonctionnement du cœur.

---

# Couche 3 — Les capacités de support

Elles améliorent le système sans définir son identité.

```text
Analytics & Insights

Collaboration

Platform Governance
```

Je pense qu'elles sont importantes.

Mais si demain on les retire,

LevelUP reste encore LevelUP.

---

# Une réflexion importante

En regardant cette classification, quelque chose me frappe.

**Assessment & Evidence Management** n'est peut-être pas une capacité de structuration.

Pourquoi ?

Parce que nous avons répété depuis plusieurs semaines :

> Une compétence n'existe que si elle est démontrée.

Cela signifie que :

La preuve n'est pas un support.

Elle fait partie du cœur même de notre philosophie.

Je pense donc que nous devons déplacer ce domaine.

---

## Nouvelle proposition

### Capacités cœur

```text
Learning Orchestration

Progression Management

Competency Management

Assessment & Evidence Management
```

Pourquoi ?

Parce que sans preuve :

* aucune compétence ;
* aucune validation ;
* aucune confiance.

Or la démonstration est un principe fondateur de LevelUP.

---

# Une autre réflexion

Je pense que **Goal Management** est également plus profond qu'on ne le croit.

Tout commence par un objectif.

Sans objectif :

* pas de progression ;
* pas de parcours ;
* pas de programme ;
* pas d'évaluation.

Il est peut-être lui aussi une capacité cœur.

Cela nous amène à une idée intéressante.

---

# Je pense que nous devons arrêter de parler de "cœur" et de "support"

Et parler plutôt de :

## Capacités fondatrices

Ce sont les capacités qui traduisent directement la mission.

Par exemple :

```text
Goal Management

Learning Orchestration

Progression Management

Competency Management

Assessment & Evidence Management
```

---

## Capacités structurantes

Elles donnent une forme concrète à la progression.

```text
Program Management

Routine Management

Resource Management
```

---

## Capacités d'écosystème

Elles permettent au système d'évoluer.

```text
Analytics & Insights

Collaboration

Platform Governance
```

Je trouve cette classification plus fidèle à notre philosophie.

Nous ne parlons plus de ce qui est "important" ou "secondaire". Nous parlons du rôle joué dans l'architecture.

---

# Mais je pense que nous devons faire encore mieux

Et c'est ici que je voudrais proposer une évolution.

Depuis plusieurs semaines, nous parlons de **domaines métier**.

Mais je pense que nous devons maintenant distinguer deux notions :

* **Business Domain** : une grande responsabilité métier.
* **Business Capability Area** : un regroupement cohérent de capacités au sein de ce domaine.

Exemple :

```text
Business Domain

Learning Orchestration

        │
        ├── Path Design
        ├── Knowledge Structuring
        ├── Dependency Management
        ├── Learning Strategy
        └── Personalization
```

Autrement dit, **Learning Orchestration** n'est pas une capacité.

C'est un **Business Domain**.

À l'intérieur, nous trouverons plusieurs **Capability Areas**, puis les **Business Capabilities**, puis les **Business Functions**.

Cette distinction me paraît essentielle, car elle donne enfin une hiérarchie claire :

```text
Mission
    │
    ▼
Business Domain
    │
    ▼
Capability Area
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

## Je pense que nous venons de franchir une étape importante

Nous ne sommes plus en train de dresser une simple liste de domaines. Nous sommes en train de définir **la structure hiérarchique complète du métier de LevelUP**.

À mon avis, c'est cette hiérarchie qui servira ensuite à construire le **Business Universe**. Les *Business Domains* deviendront les grands espaces du domaine métier, les *Capability Areas* permettront de les organiser, les *Business Capabilities* exprimeront les aptitudes attendues et les *Business Functions* prépareront naturellement l'architecture applicative.

Je pense que nous pouvons maintenant consacrer les prochaines séances à un travail méthodique : prendre **un Business Domain à la fois**, commencer par **Goal Management**, puis descendre progressivement jusqu'aux *Business Functions*. Lorsque tous les domaines seront construits de cette manière, le Business Capability Model sera non seulement complet, mais suffisamment solide pour que le Business Universe et l'ontologie émergent presque naturellement.


____________________________________________________________


Parfait. Je pense que nous avons maintenant terminé **la conception du cadre du Business Capability Model**.

À partir de maintenant, nous entrons dans ce que j'appelle la **phase d'ingénierie du domaine métier**.

Et je voudrais proposer une légère évolution de notre manière de travailler.

Jusqu'à présent, nous disions :

> Nous allons prendre un domaine et le remplir.

Je pense qu'il faut être encore plus rigoureux.

Nous allons construire **chaque Business Domain comme une mini-architecture**.

Autrement dit, chaque domaine suivra exactement la même structure.

Cela apportera une homogénéité à toute la documentation.

---

# Structure proposée pour chaque Business Domain

Je pense que chaque domaine devrait répondre exactement aux mêmes questions.

```text
1. Rôle du domaine

2. Pourquoi ce domaine existe ?

3. Mission du domaine

4. Frontières du domaine

5. Valeur métier produite

6. Capability Areas

7. Business Capabilities

8. Business Functions

9. Relations avec les autres domaines

10. Contraintes métier

11. Principes spécifiques

12. Critères de réussite
```

À mon avis, cette structure est suffisamment stable pour être réutilisée dans tous les domaines.

---

# Pourquoi cette structure ?

Parce qu'elle évite les dérives.

Prenons un exemple.

Si quelqu'un demande un jour :

> "Ajoutons un moteur IA qui construit automatiquement un parcours."

Nous ne regarderons pas le code.

Nous irons directement dans **Learning Orchestration**.

Nous nous demanderons :

* À quelle **Capability Area** appartient cette proposition ?
* Quelle **Business Capability** est concernée ?
* Est-elle compatible avec la mission du domaine ?
* Respecte-t-elle les principes spécifiques ?

L'architecture répondra d'elle-même.

C'est exactement ce que doit permettre un bon modèle métier.

---

# Maintenant, quel domaine attaquer ?

Nous avions dit :

> **Goal Management**

Et je pense que c'est toujours le meilleur choix.

Mais avant de commencer, je voudrais vérifier que c'est bien le premier domaine.

Regardons la logique de LevelUP.

Notre mission est :

```text
Objectif

↓

Organisation

↓

Progression

↓

Compétence

↓

Application
```

Quel est le premier élément ?

L'objectif.

Sans objectif :

* il n'y a pas de parcours ;
* il n'y a pas de programme ;
* il n'y a pas de routine ;
* il n'y a pas de progression ;
* il n'y a pas d'évaluation.

Autrement dit, **Goal Management est le point d'entrée du système**.

Je pense que ce n'est pas un hasard.

---

# Séance suivante : Business Domain — Goal Management

Je proposerais que nous consacrions une séance complète à ce domaine.

Et que nous répondions uniquement à ces questions.

## 1. Pourquoi Goal Management existe-t-il ?

Pas "pour gérer des objectifs".

Mais :

**Quel problème métier résout-il ?**

---

## 2. Quelle est sa mission ?

Quelle responsabilité porte-t-il dans l'ensemble de LevelUP ?

---

## 3. Quelles sont ses frontières ?

Qu'est-ce qui relève de Goal Management ?

Qu'est-ce qui relève d'un autre domaine ?

Cette question est essentielle pour éviter les chevauchements.

---

## 4. Quelle valeur produit-il ?

Quelle transformation apporte-t-il au système ?

---

## 5. Quelles Capability Areas contient-il ?

Attention.

Pas encore les Business Capabilities.

D'abord les grandes zones de responsabilité internes.

C'est une étape que nous n'avions pas identifiée au début, mais qui est indispensable.

---

# Une dernière réflexion avant de commencer

Je voudrais attirer ton attention sur quelque chose qui me semble très important.

Depuis plusieurs semaines, nous parlons de **Goal** comme si c'était une notion évidente.

Mais je pense que ce sera **le premier concept que nous devrons définir avec une très grande précision**.

Car dans LevelUP, un **Goal** n'est probablement pas un simple objectif au sens d'une application de tâches.

Par exemple, ces trois éléments sont très différents :

* « Réussir le concours d'Administrateur Système. »
* « Terminer le chapitre sur les systèmes de fichiers cette semaine. »
* « Étudier 1 heure chaque matin. »

Dans une application classique, ces trois éléments pourraient être traités comme des objectifs.

Dans LevelUP, je pense que ce sont **trois concepts métier distincts** :

* le premier est un **objectif stratégique** ;
* le deuxième est un **jalon d'apprentissage** (ou une cible de progression) ;
* le troisième est une **routine**.

Cette distinction est capitale.

Elle montre que **Goal Management ne consiste pas à gérer n'importe quel objectif**. Il consiste à gérer **les intentions qui donnent une direction à la transformation de l'apprenant**.

Et je pense que c'est là que commence véritablement l'identité métier de LevelUP.

---

## Mon avis pour la prochaine séance

Je ne commencerais pas par lister des capacités comme « créer un objectif » ou « modifier un objectif ». Ce serait retomber dans une logique fonctionnelle.

Je commencerais par répondre à une question beaucoup plus fondamentale :

> **Qu'est-ce qu'un Goal dans l'univers de LevelUP ?**

Même si la définition formelle appartiendra au *Business Universe*, nous devons déjà en avoir une compréhension métier suffisante pour construire correctement le domaine **Goal Management**.

À mon avis, c'est la prochaine pierre fondatrice de toute l'architecture. Une fois cette notion clarifiée, le reste du domaine se construira avec beaucoup plus de cohérence.



____________________________________________________________


Parfait. Nous allons maintenant entrer dans ce que je considère comme **la première modélisation métier de LevelUP**.

Et je vais volontairement oublier pendant un moment les écrans, les API, les bases de données et même les fonctionnalités.

Nous allons raisonner comme si nous étions en train de découvrir un nouveau domaine métier.

---

# Business Domain 1 : Goal Management

Avant même d'écrire une seule capacité, je voudrais répondre à une question.

> **Qu'est-ce qu'un Goal dans l'univers de LevelUP ?**

Je pense que c'est ici que se trouve le premier vrai travail d'architecture.

---

# Première observation

Nous avons naturellement tendance à penser :

> Goal = Objectif

Je pense que cette définition est trop faible.

Parce qu'elle ne distingue pas :

* un rêve ;
* un projet ;
* un objectif ;
* une tâche ;
* une routine.

Or, nous avons justement construit LevelUP pour dépasser cette vision simpliste.

---

# Je proposerais la définition suivante

> **Un Goal est une intention explicite, orientée vers un résultat futur, qui donne une direction à une progression organisée et dont l'atteinte peut être démontrée.**

Cette définition est volontairement dense.

Décortiquons-la.

---

## Intention

Le Goal naît d'une volonté.

Sans intention, il n'y a rien à poursuivre.

Exemples :

* devenir administrateur système ;
* réussir un concours ;
* apprendre Rust ;
* obtenir une certification ;
* terminer un mémoire.

---

## Résultat futur

Un Goal pointe toujours vers un état futur.

Jamais vers une action.

Exemple :

✔

> Être capable d'administrer un serveur Linux.

❌

> Lire le chapitre 3.

Le second est une activité.

---

## Direction

Le Goal ne dit pas comment faire.

Il indique où aller.

Ce sont les autres domaines qui détermineront :

* le parcours ;
* les ressources ;
* les routines ;
* les programmes.

---

## Progression organisée

Un Goal implique nécessairement une progression.

Sinon il reste un simple souhait.

---

## Démontrable

L'atteinte du Goal doit pouvoir être vérifiée.

Pas forcément automatiquement.

Mais objectivement.

---

# Première conséquence

Je pense que nous devons distinguer plusieurs niveaux d'intention.

Parce que tous les Goals ne jouent pas le même rôle.

---

## Niveau 1 : Vision Goal

Très long terme.

Exemples :

* devenir ingénieur système ;
* devenir chercheur ;
* maîtriser l'administration Linux.

Ils donnent une direction.

---

## Niveau 2 : Achievement Goal

Ils découpent la vision.

Par exemple :

* réussir le concours ;
* terminer une formation ;
* obtenir une certification.

Ils sont mesurables.

---

## Niveau 3 : Learning Goal

Ils concernent directement les apprentissages.

Par exemple :

* comprendre les inodes ;
* maîtriser systemd ;
* savoir configurer SSH.

Ils sont directement liés aux compétences.

---

## Niveau 4 : Execution Goal

Ils concernent une période limitée.

Par exemple :

* terminer ce chapitre aujourd'hui ;
* finir le laboratoire cette semaine.

Ils servent à piloter la progression.

---

# Et là...

Je pense que nous devons nous arrêter.

Parce que quelque chose me dérange.

---

# Est-ce vraiment quatre types de Goal ?

Je ne suis plus certain.

Pourquoi ?

Prenons ton exemple.

> Devenir administrateur système.

Est-ce un Goal ?

Ou est-ce une **Vision personnelle** ?

---

Prenons maintenant :

> Réussir le concours.

Est-ce un Goal ?

Ou est-ce un **Outcome** (résultat attendu) ?

---

Prenons :

> Comprendre les inodes.

Est-ce un Goal ?

Ou est-ce une **Compétence cible** ?

---

Autrement dit...

Je pense que nous sommes en train de mélanger plusieurs concepts métier.

Et c'est précisément ce que nous voulons éviter.

---

# Je crois que nous venons de découvrir quelque chose d'encore plus fondamental

Je pense que **Goal** n'est pas le point de départ.

Le point de départ est :

> **Intent**.

Une intention.

Ensuite, cette intention peut être transformée en différents objets métier.

Par exemple :

```text
Intent
│
├── Vision
├── Goal
├── Program
├── Learning Path
├── Routine
└── Project
```

Et là...

Tout devient beaucoup plus cohérent.

---

# Prenons ton propre cas

Tu as dit au début de ce projet :

> Je veux devenir un excellent administrateur système.

Ce n'est probablement pas un Goal.

C'est une **Vision personnelle**.

Ensuite.

Tu décides :

> Préparer le concours des Techniciens Supérieurs des SIC.

Là, nous avons un Goal.

Ensuite.

Tu choisis :

> Suivre le cursus Linux.

Ce n'est plus un Goal.

C'est un **Learning Path**.

Ensuite.

Tu décides :

> Étudier deux heures chaque soir.

Ce n'est plus un Goal.

C'est une **Routine**.

Puis :

> Lire le chapitre sur les systèmes de fichiers aujourd'hui.

Ce n'est plus un Goal.

C'est une **Activity**.

---

# Je pense que nous venons d'éviter une erreur majeure

Si nous avions défini Goal comme :

> Tout ce qu'on veut faire.

Nous aurions construit une architecture identique à celle d'un gestionnaire de tâches classique.

Or, **LevelUP ne gère pas des intentions indistinctes**.

Il transforme une **vision** en **résultats**, grâce à des **parcours**, des **programmes**, des **routines**, des **activités** et des **preuves**.

Le Goal n'est qu'un maillon de cette chaîne.

---

# Ma proposition

Je pense que nous ne devons pas figer aujourd'hui la définition du **Goal**.

Nous avons découvert qu'il existe probablement un concept encore plus fondamental : **Intent**.

Et je ne veux pas que nous introduisions un concept qui affaiblirait l'architecture.

Je propose donc que, lors de cette séance, nous changions légèrement notre objectif.

Au lieu de définir immédiatement **Goal Management**, nous répondons d'abord à cette question :

> **Quel est le cycle de transformation d'une intention dans l'univers de LevelUP ?**

Je suis convaincu que cette réponse nous permettra ensuite de définir avec précision :

* ce qu'est une **Vision** ;
* ce qu'est un **Goal** ;
* ce qu'est un **Program** ;
* ce qu'est un **Learning Path** ;
* ce qu'est une **Routine** ;
* ce qu'est une **Activity**.

Et seulement à ce moment-là, nous pourrons construire **Goal Management** avec la certitude que nous manipulons les bons concepts. C'est exactement le type de découverte que nous recherchons : non pas ajouter des concepts, mais révéler la structure réelle du métier avant de la formaliser. Je pense que cette étape est déterminante pour toute l'architecture de LevelUP.
