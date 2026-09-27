Je pense que nous venons d'atteindre un tournant dans la conception de Project Atlas.

Et je vais faire une remarque qui va probablement changer toute la suite de notre démarche TOGAF.

**Nous ne sommes plus en train de concevoir un logiciel.**

Nous sommes en train de concevoir **une entreprise de connaissance** (*Knowledge Enterprise*).

Et cette distinction va influencer toute l'architecture.

---

# Ce qu'est réellement Atlas

Si je devais résumer Atlas en une phrase aujourd'hui, je n'écrirais plus :

> Une plateforme de vente d'ordinateurs.

Ni même :

> Une plateforme d'aide à la décision.

J'écrirais plutôt :

> **Project Atlas est un écosystème numérique de connaissances, de communauté et de services dédié à l'accompagnement des décisions informatiques tout au long du cycle de vie des équipements.**

Chaque mot est important.

* **Écosystème** : parce qu'il y a plusieurs acteurs qui créent de la valeur.
* **Connaissances** : parce que c'est l'actif principal.
* **Communauté** : parce que les utilisateurs enrichissent le système.
* **Services** : parce que le commerce n'est qu'un service parmi d'autres.
* **Cycle de vie** : parce que l'accompagnement commence avant l'achat et continue après.

---

# Je pense que nous devons identifier les piliers de l'entreprise

À ce stade, Atlas ne repose plus sur un catalogue mais sur plusieurs **capacités stratégiques**.

Je vois au moins cinq piliers.

```text
                      PROJECT ATLAS

                              │

      ┌──────────────┬──────────────┬──────────────┬──────────────┬──────────────┐

      │              │              │              │              │

      ▼              ▼              ▼              ▼              ▼

 Knowledge      Community      Decision       Commerce      Lifecycle

     │              │              │              │              │

     └──────────────┴──────────────┴──────────────┴──────────────┘

                           Better Computing Decisions
```

---

## 1. Knowledge

C'est le patrimoine numérique.

Il comprend :

* fiches produits ;
* composants ;
* processeurs ;
* benchmarks ;
* générations ;
* guides ;
* articles ;
* vidéos ;
* FAQ ;
* compatibilités ;
* réparabilité ;
* disponibilité des pièces au Burkina Faso ;
* retours d'expérience ;
* comparatifs ;
* glossaire.

Ce patrimoine devient le cœur de l'entreprise.

---

## 2. Community

Ce n'est pas un simple espace de commentaires.

La communauté devient coproductrice de connaissances.

Elle apporte :

* questions ;
* réponses ;
* cas d'usage ;
* problèmes rencontrés ;
* solutions ;
* conseils ;
* retours après plusieurs mois d'utilisation ;
* bonnes pratiques.

Chaque échange améliore Atlas.

---

## 3. Decision

C'est probablement le cœur technologique.

Le moteur répond à :

> **Que faut-il recommander ?**

Mais aussi :

> **Pourquoi ?**

Il prend en compte :

* le budget ;
* l'usage ;
* le niveau technique ;
* la disponibilité locale ;
* la durée de vie souhaitée ;
* les possibilités d'évolution ;
* le coût total de possession ;
* la réparabilité.

---

## 4. Commerce

Le commerce devient un moyen de concrétiser une décision.

Il comprend :

* catalogue ;
* disponibilité ;
* stock ;
* paiement ;
* réservation ;
* livraison ;
* garanties ;
* devis ;
* promotions.

Mais il n'est plus le centre.

---

## 5. Lifecycle

Et celui-ci est souvent oublié.

Atlas ne doit jamais abandonner le client après l'achat.

Il doit continuer à l'accompagner.

Exemple :

```text
Achat

↓

Mise en route

↓

Tutoriels

↓

Maintenance

↓

Ajout de RAM

↓

Changement SSD

↓

Nouvelle batterie

↓

Revente

↓

Nouvel achat
```

Le client reste dans l'écosystème.

---

# Le blog change complètement de statut

Au départ nous parlions d'un blog.

Je pense maintenant qu'il ne faut plus employer ce terme dans l'architecture.

Il faut parler de :

> **Knowledge Publishing Platform**

Pourquoi ?

Parce que le contenu publié n'est pas uniquement destiné à communiquer.

Il sert à enrichir le patrimoine numérique.

Chaque contenu possède un cycle de vie.

```text
Création

↓

Publication

↓

Discussion

↓

Validation

↓

Référence

↓

Réutilisation

↓

Archivage

↓

Mise à jour
```

Ce n'est plus un simple article.

C'est un actif.

---

# Une idée encore plus importante

Je pense que nous devons faire une chose que peu de plateformes font.

Chaque contenu devrait être relié à tout le reste.

Par exemple :

```text
Article

↓

"Pourquoi un i5 12e Gen est meilleur qu'un i7 7e Gen"

↓

lié à

↓

CPU

↓

Ordinateurs

↓

Comparatifs

↓

Questions fréquentes

↓

Vidéos

↓

Commentaires

↓

Produits concernés

↓

Recommandations
```

Tout est connecté.

C'est cela qui transforme un site en patrimoine numérique.

---

# Je pense que nous devons modifier notre démarche TOGAF

Je vais proposer une évolution de notre méthode.

Au lieu de passer directement aux **Enterprise Principles**, je pense qu'il manque une étape fondamentale : **le modèle conceptuel de l'entreprise**.

Je proposerais donc :

```text
Phase 0

00_Project_Charter.md
01_Problem_Statement.md
02_Vision.md
03_Mission.md
04_Core_Identity.md

05_Enterprise_Conceptual_Model.md   ← nouveau

06_Decision_Model.md

07_Enterprise_Principles.md

08_Value_Proposition.md

09_Stakeholders.md

10_Business_Context.md

11_Assumptions_and_Constraints.md

12_Glossary.md
```

## Pourquoi ce document est essentiel

Le **Enterprise Conceptual Model** répondra à la question :

> **Quels sont les concepts fondamentaux qui composent Atlas et comment interagissent-ils ?**

Nous pourrons y définir les grands objets métier, sans parler de base de données ou de technologie :

* **Knowledge Asset** (article, vidéo, guide, fiche produit, FAQ…)
* **Product** (ordinateur, composant, accessoire…)
* **User** (avec son profil, ses besoins et son contexte)
* **Community** (échanges, contributions, réputation)
* **Decision** (analyse, justification, recommandation)
* **Service** (vente, maintenance, conseil, formation…)
* **Lifecycle** (avant-vente, achat, utilisation, évolution, revente)

Ce document deviendra la référence des phases **Business Architecture** et **Data Architecture**. Il garantira que tout le monde — architectes, développeurs, rédacteurs, vendeurs et partenaires — partage la même compréhension de ce qu'est Atlas.

À mon avis, c'est la prochaine étape logique. Si nous la construisons correctement, les modèles métier, les modèles de données et les applications découleront naturellement de cette vision commune.
