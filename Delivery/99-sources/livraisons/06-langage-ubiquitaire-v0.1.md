# Langage ubiquitaire et politique d'accès aux opportunités — v0.1

**Projet : Écosystème de livraison**  
**Étape : DDD stratégique — formalisation du langage ubiquitaire**  
**Version : 0.1**  
**Statut : BASELINE DE TRAVAIL**  
**Date : 25 août 2026**

---

# 1. Objet

Ce document formalise le langage ubiquitaire initial des Bounded Contexts du modèle DDD stratégique.

Une préoccupation stratégique supplémentaire est intégrée explicitement :

> **Comment une mission ouverte est-elle exposée aux capacités disponibles afin de permettre un accès équitable aux opportunités, sans dégrader l'efficacité opérationnelle ni favoriser l'abandon des nouveaux entrants ?**

Cette question est considérée comme **structurante pour Capacity Exchange** et non comme un simple détail d'interface.

---

# 2. Principe directeur

Le système ne doit pas confondre :

- visibilité ;
- éligibilité ;
- opportunité ;
- proposition ;
- engagement ;
- attribution ;
- exécution.

Une mission ouverte ne devient pas automatiquement la propriété du premier acteur qui la voit.

Elle devient une **opportunité d'exécution** que le système expose, selon une politique explicite, à un ensemble de capacités éligibles.

---

# 3. Modèle général

```text
MISSION
   │
   ▼
ÉTAPE
   │
   ▼
OPPORTUNITÉ D'EXÉCUTION
   │
   ├── contraintes satisfaites ?
   │        │
   │        ├── non → exclue
   │        └── oui
   │
   ▼
ENSEMBLE DES CAPACITÉS ÉLIGIBLES
   │
   ▼
POLITIQUE D'EXPOSITION
   │
   ├── accès direct
   ├── exposition graduée
   ├── extension du pool
   └── relance / réouverture
   │
   ▼
PROPOSITION
   │
   ▼
ENGAGEMENT
   │
   ▼
EXÉCUTION
```

---

# 4. Distinction fondamentale : mission directe vs mission ouverte

## 4.1 Mission directement adressée

Une mission peut être adressée à un acteur déterminé.

```text
Demandeur
   ↓
Mission
   ↓
Acteur A
   ↓
Acceptation
   ↓
Engagement
```

Après acceptation, l'acteur A est responsable de l'engagement opérationnel correspondant.

Il peut, lorsque les règles l'autorisent, déléguer l'exécution à une autre capacité.

La délégation ne modifie pas automatiquement le titulaire de la mission.

---

## 4.2 Mission ouverte

Une mission ouverte n'est pas adressée à un acteur unique.

Elle devient une opportunité susceptible d'être présentée à plusieurs capacités.

```text
Mission ouverte
      ↓
Opportunité
      ↓
Capacités éligibles
      ↓
Politique d'exposition
      ↓
Propositions
      ↓
Engagement
```

**Décision de langage :**

> Une mission ouverte est une mission dont l'exécution n'est pas encore engagée auprès d'un acteur déterminé et dont l'opportunité peut être exposée à un ensemble de capacités éligibles.

---

# 5. Le problème de l'équité d'accès

Le système ne doit pas appliquer une règle naïve du type :

> « montrer la mission à tout le monde ».

Cela crée :

- surcharge ;
- concurrence inutile ;
- faible lisibilité ;
- avantage systématique aux acteurs déjà actifs ;
- captation par les mêmes acteurs ;
- sentiment d'absence d'opportunités chez les nouveaux entrants.

À l'inverse, il ne faut pas non plus appliquer :

> « attribuer artificiellement les missions aux nouveaux entrants ».

Cela dégraderait l'efficacité et pourrait compromettre la confiance des organisations.

Le principe retenu est donc :

> **équité d'accès aux opportunités sous contrainte d'efficacité opérationnelle.**

L'équité ne signifie pas une égalité mécanique du nombre de missions.

Elle signifie que les capacités éligibles disposent d'une possibilité raisonnable, observable et non arbitrairement verrouillée d'accéder aux opportunités pertinentes.

---

# 6. Nouveau concept : Politique d'exposition

### Définition

La **Politique d'exposition** détermine quelles capacités éligibles peuvent voir ou recevoir une opportunité d'exécution, à quel moment et selon quelles règles.

Elle appartient au contexte **Capacity Exchange**.

Elle ne décide pas de l'exécution physique.

---

# 7. Les trois niveaux à distinguer

## 7.1 Éligibilité

Question :

> « Cette capacité peut-elle légalement et opérationnellement exécuter cette opportunité ? »

Critères possibles :

- zone ;
- disponibilité ;
- type de capacité ;
- contraintes de colis ;
- horaires ;
- statut opérationnel ;
- affiliation ;
- restrictions métier ;
- compatibilité de trajet.

L'éligibilité est une **contrainte dure**.

---

## 7.2 Exposition

Question :

> « Parmi les capacités éligibles, lesquelles doivent être exposées à cette opportunité maintenant ? »

Cette décision relève de la politique de distribution.

---

## 7.3 Engagement

Question :

> « Une capacité a-t-elle accepté et engagé cette opportunité ? »

L'engagement constitue le changement d'état métier.

---

# 8. Politique d'exposition graduée

Le modèle recommandé est une exposition progressive.

```text
Niveau 0
   ↓
Capacités éligibles directement pertinentes
   ↓
Niveau 1
   ↓
Sous-ensemble priorisé
   ↓
Niveau 2
   ↓
Élargissement du pool
   ↓
Niveau 3
   ↓
Réouverture / extension
```

L'ouverture progressive doit pouvoir prendre en compte :

- proximité ;
- compatibilité ;
- disponibilité ;
- contraintes temporelles ;
- capacité réelle ;
- charge actuelle ;
- historique de fiabilité ;
- temps depuis la dernière opportunité pertinente ;
- ancienneté dans le réseau ;
- période de démarrage d'un nouvel entrant.

---

# 9. Règle spéciale : nouveau membre / capacité récemment enrôlée

Un nouvel entrant ne doit pas être placé dans une situation où :

```text
inscription
   ↓
aucune visibilité
   ↓
aucune mission
   ↓
aucun historique
   ↓
aucune amélioration possible
```

Ce serait une boucle de verrouillage.

Le système doit donc prévoir un mécanisme de **Cold Start opérationnel**.

### Cold Start opérationnel

Un nouvel entrant éligible peut recevoir une exposition contrôlée à des opportunités compatibles afin de produire ses premières preuves opérationnelles.

Ce mécanisme ne signifie pas :

> « le nouveau doit recevoir une mission ».

Il signifie :

> « le nouveau ne doit pas être structurellement privé d'accès aux opportunités pertinentes uniquement parce qu'il ne possède pas encore d'historique ».

---

# 10. Anti-starvation

### Définition

Une capacité ne doit pas rester indéfiniment sans opportunité pertinente alors que :

- elle est disponible ;
- elle est éligible ;
- elle répond aux contraintes ;
- des opportunités compatibles existent.

Cette règle est appelée :

> **Anti-Starvation Policy**

Elle ne garantit pas un volume minimal de missions.

Elle impose une contrainte de non-exclusion structurelle.

---

# 11. Temps depuis la dernière opportunité

Le temps depuis la dernière opportunité pertinente peut devenir un signal de distribution.

Exemple conceptuel :

```text
Éligibilité
   +
Compatibilité
   +
Disponibilité
   +
Temps depuis dernière opportunité
   +
Charge actuelle
   +
Fiabilité
```

Mais ce signal ne doit pas être transformé prématurément en score opaque.

Le DDD stratégique exige d'abord une politique explicable.

---

# 12. Pas de score opaque au niveau stratégique

Une règle comme :

```text
score = 0.27 × proximité
      + 0.18 × réputation
      + 0.31 × ancienneté
      + ...
```

n'est pas une règle métier acceptable à ce stade.

Le système doit pouvoir expliquer :

> « Cette opportunité vous a été exposée parce que vous étiez disponible, éligible, compatible avec le trajet et que votre accès aux opportunités pertinentes était faible. »

L'algorithme pourra évoluer.

La politique métier doit rester explicable.

---

# 13. Équité ≠ égalité

Le système ne cherche pas :

```text
10 acteurs
100 missions
→ 10 missions chacun
```

Il cherche :

```text
opportunités pertinentes
        +
accès non arbitrairement bloqué
        +
efficacité opérationnelle
        +
protection contre la captation
        +
possibilité de progression
```

Une capacité qui refuse régulièrement les opportunités peut naturellement recevoir moins d'exposition.

Une capacité qui accepte et exécute correctement peut naturellement être davantage sollicitée.

La politique doit cependant empêcher qu'un petit groupe capte toutes les opportunités pertinentes simplement grâce à son historique initial.

---

# 14. Nouveau concept : Opportunité d'exécution

### Définition

Une **Opportunité d'exécution** est une représentation échangeable d'un besoin d'exécution suffisamment défini pour être proposé à une ou plusieurs capacités éligibles.

Elle possède notamment :

- origine ;
- destination ;
- fenêtre temporelle ;
- contraintes ;
- caractéristiques du colis ;
- étape concernée ;
- politique d'exposition ;
- état d'ouverture ;
- durée d'exposition ;
- propositions éventuelles ;
- engagement éventuel.

Elle n'est pas la mission.

---

# 15. États de l'opportunité

```text
Créée
  ↓
Éligible à l'ouverture
  ↓
Exposée
  ↓
Proposition reçue
  ↓
Engagée
  ↓
Retirée / expirée / réouverte
```

L'état `Exposée` signifie :

> l'opportunité est accessible selon la politique d'exposition.

Il ne signifie pas :

> quelqu'un l'a acceptée.

---

# 16. Proposition

### Définition

Une **Proposition** est l'expression par une capacité de sa volonté d'accepter une opportunité exposée.

```text
Opportunité
   ↓
Proposition
   ↓
Acceptation
   ↓
Engagement
```

Une proposition peut être :

- acceptée ;
- refusée ;
- expirée ;
- invalidée.

---

# 17. Engagement

### Définition

Un **Engagement** est l'état dans lequel une opportunité est effectivement attribuée à une capacité selon les règles du système.

Il réserve le droit opérationnel d'exécuter l'opportunité.

Il ne constitue pas encore une prise en charge physique.

---

# 18. Capacité

### Définition stabilisée

Une **Capacité** est une aptitude opérationnelle déclarée et mobilisable par une personne ou une organisation pour répondre à certaines opportunités d'exécution.

Une capacité n'est pas nécessairement :

- une personne ;
- un véhicule ;
- une disponibilité.

Elle peut être soutenue par plusieurs ressources.

Exemple :

```text
Personne
   +
Moto
   +
Zone autorisée
   +
Disponibilité
   +
Aptitude
       ↓
Capacité opérationnelle
```

---

# 19. Disponibilité

### Définition

La **Disponibilité** indique qu'une capacité peut potentiellement être mobilisée pendant une période donnée.

Elle ne signifie pas :

- qu'elle est éligible à toutes les missions ;
- qu'elle est exposée à toutes les opportunités ;
- qu'elle est engagée ;
- qu'elle est en train d'exécuter.

---

# 20. Éligibilité

### Définition

L'**Éligibilité** est la satisfaction des contraintes nécessaires pour qu'une capacité puisse être considérée pour une opportunité.

```text
Disponibilité
     +
Contraintes satisfaites
     ↓
Éligibilité
```

L'éligibilité est préalable à l'exposition.

---

# 21. Vocabulaire officiel par contexte

## Identity & Organization

| Terme | Définition |
|---|---|
| Personne | Identité humaine du domaine |
| Compte opérateur | Identité permettant d'interagir avec l'infrastructure |
| Organisation | Entité autonome opérant dans le réseau |
| Affiliation | Relation entre une personne et une organisation |
| Rôle | Responsabilité exercée dans un contexte donné |

---

## Capacity & Availability

| Terme | Définition |
|---|---|
| Capacité | Aptitude opérationnelle mobilisable |
| Disponibilité | Possibilité déclarée de mobilisation |
| Ressource | Moyen contribuant à une capacité |
| Aptitude | Contraintes opérationnelles satisfaites |
| Indisponibilité | État empêchant une mobilisation |

---

## Mission Orchestration

| Terme | Définition |
|---|---|
| Mission | Besoin d'exécution porté par un demandeur |
| Étape | Segment opérationnel d'une mission |
| Titulaire | Organisation ou acteur responsable de la mission |
| Mission ouverte | Mission dont l'exécution n'est pas encore engagée auprès d'un acteur déterminé |
| Mission adressée | Mission proposée directement à un acteur déterminé |

---

## Capacity Exchange

| Terme | Définition |
|---|---|
| Opportunité d'exécution | Unité échangeable représentant un besoin exécutable |
| Éligibilité | Satisfaction des contraintes de considération |
| Politique d'exposition | Règles déterminant l'accès à une opportunité |
| Exposition | Mise à disposition contrôlée d'une opportunité |
| Proposition | Volonté d'une capacité d'accepter une opportunité |
| Engagement | Attribution effective de l'opportunité à une capacité |
| Délégation | Engagement d'une capacité externe pour exécuter une mission détenue par un autre acteur |
| Cold Start opérationnel | Mécanisme empêchant l'exclusion structurelle des nouveaux entrants |
| Anti-Starvation | Politique empêchant l'exclusion durable d'une capacité éligible |

---

## Execution & Custody

| Terme | Définition |
|---|---|
| Exécution | Réalisation physique de l'opportunité |
| Prise en charge | Acquisition effective de la garde physique |
| Garde | Responsabilité physique actuelle |
| Transfert de garde | Changement confirmé de responsable physique |
| Remise | Événement par lequel un objet est transféré à un destinataire ou opérateur |

---

## Location & Journey

| Terme | Définition |
|---|---|
| Localisation | Référence spatiale utilisable pour l'exécution |
| Point de livraison | Lieu où une étape doit être réalisée |
| Étape de trajet | Portion spatiale/chronologique d'une exécution |
| Compatibilité de trajet | Compatibilité spatiale et temporelle entre opportunités et capacité |

---

## Trust & Evidence

| Terme | Définition |
|---|---|
| Preuve | Élément permettant de vérifier un événement ou une affirmation |
| Trace | Historique observable d'un événement |
| Incident | Événement perturbant ou contestant un processus métier |
| Confiance | Capacité à estimer le risque opérationnel sur la base de faits observables |

---

## Settlement & Economics

| Terme | Définition |
|---|---|
| Rémunération | Valeur versée pour une exécution |
| Commission | Part prélevée ou due selon une relation économique |
| Règlement | Processus de clôture financière |
| Créance | Montant dû à un acteur |

---

# 22. Termes interdits ou à éviter

Le langage officiel doit éviter les termes ambigus suivants :

| Terme à éviter | Remplacement |
|---|---|
| Livreur | Capacité / opérateur / personne selon contexte |
| Course | Mission ou opportunité selon contexte |
| Job | Opportunité d'exécution |
| Assignation | Engagement |
| Match | Compatibilité / proposition / engagement |
| Disponible | Disponibilité |
| Affecté | Engagé |
| Livré | Remis / mission clôturée selon le fait réel |
| Score | Critères / politique d'exposition |
| Priorité | Ordre d'exposition / règle de politique |
| Réputation | Historique de confiance / indicateurs observables |

---

# 23. Invariants stratégiques ajoutés

### I-18 — Une mission ouverte n'est pas une attribution

L'ouverture crée une opportunité ; elle n'attribue pas la mission.

### I-19 — L'éligibilité précède l'exposition

Une capacité ne doit pas être exposée à une opportunité pour laquelle elle ne satisfait pas les contraintes métier.

### I-20 — L'exposition n'est pas l'engagement

Voir ou recevoir une opportunité ne réserve pas automatiquement la capacité.

### I-21 — L'engagement précède la prise en charge

Une capacité doit être engagée avant de devenir responsable de l'exécution, sauf exception explicitement modélisée.

### I-22 — L'accès aux opportunités ne doit pas être structurellement verrouillé par l'historique

L'absence d'historique d'un nouvel entrant ne doit pas, à elle seule, empêcher son accès aux opportunités pertinentes.

### I-23 — L'équité n'impose pas une égalité de volume

La distribution doit préserver simultanément accès, pertinence et efficacité.

### I-24 — Une politique d'exposition doit être explicable

Le système doit pouvoir fournir une justification compréhensible de l'accès à une opportunité.

### I-25 — La captation systématique doit être détectable

Le système doit pouvoir identifier les situations où un sous-ensemble de capacités capte durablement les opportunités compatibles.

---

# 24. Conséquence stratégique

La politique d'accès aux missions ouvertes n'est pas une simple fonctionnalité UX.

Elle devient une composante du **Core Domain candidat**.

Le cœur du système n'est donc plus seulement :

> trouver une capacité pour une opportunité.

Il devient :

> **organiser l'exposition, la compatibilité, la proposition et l'engagement de capacités autonomes de manière efficace, explicable et durable.**

Cette dimension d'équité est directement liée à la construction du réseau.

Un réseau où les nouveaux entrants ne voient jamais d'opportunités ne construit pas sa densité.

Un réseau où les meilleurs acteurs captent systématiquement tout détruit également sa profondeur.

Le mécanisme d'échange doit donc optimiser simultanément :

```text
Efficacité
+
Accessibilité
+
Diversité du réseau
+
Confiance
+
Densité
+
Rétention
```

---

# 25. Ce qui reste volontairement non figé

Les éléments suivants ne sont pas encore des décisions algorithmiques :

- poids exact des critères ;
- durée exacte des fenêtres d'exposition ;
- nombre exact de niveaux d'ouverture ;
- formule de priorité ;
- seuils anti-starvation ;
- traitement détaillé des nouveaux entrants ;
- règles de rémunération ;
- stratégie de pénalité ;
- optimisation algorithmique.

Ces éléments devront être validés par expérimentation et données réelles.

---

# 26. Décision de modélisation

Le modèle DDD adopte désormais officiellement le principe :

> **Une mission ouverte produit une ou plusieurs opportunités d'exécution, et Capacity Exchange gouverne leur exposition progressive aux capacités éligibles selon une politique d'accès explicable, équilibrant efficacité opérationnelle et équité d'accès.**

Cette décision est suffisamment importante pour être enregistrée comme décision DDD et non laissée dans les notes de conception.

---

# 27. Prochaine étape

Le langage ubiquitaire étant maintenant suffisamment stabilisé, la prochaine étape du DDD stratégique est :

1. consolider le **Context Map** ;
2. formaliser les relations entre Bounded Contexts ;
3. arbitrer définitivement le **Core Domain** ;
4. identifier les Supporting / Generic Domains ;
5. produire la **baseline DDD stratégique finale** ;
6. seulement ensuite descendre vers le **DDD tactique**.

Le point d'attention prioritaire pour la suite sera `Capacity Exchange`, car il concentre désormais :

```text
Éligibilité
    ↓
Opportunité
    ↓
Exposition
    ↓
Équité d'accès
    ↓
Proposition
    ↓
Engagement
    ↓
Délégation
```

Il s'agit potentiellement de la partie la plus différenciante de toute l'infrastructure.
