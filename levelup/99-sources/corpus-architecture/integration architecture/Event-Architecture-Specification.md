# Event Architecture Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Integration Architecture

**Code :** LEVELUP-ARCH-EVENT-001

---

# 1. Objet

L'**Event Architecture** définit les principes, les règles et les conventions régissant la production, la publication, la consommation et la gouvernance des événements dans l'écosystème LevelUP.

Elle établit un langage commun permettant aux Bounded Contexts de communiquer par des faits métier tout en préservant leur autonomie et leur cohérence.

Cette spécification est indépendante de toute technologie de transport ou de messagerie.

---

# 2. Mission

Permettre aux Bounded Contexts de collaborer par l'échange d'événements représentant des faits métier observables, immuables et traçables.

---

# 3. Vision architecturale

Un événement représente un fait métier devenu vrai.

Il décrit une situation qui s'est produite dans le domaine et qui peut être utile à d'autres parties de l'écosystème.

Les événements ne transportent jamais d'intention, de commande ou de logique métier.

Ils informent simplement qu'un fait s'est produit.

---

# 4. Définitions

## Event

Représentation d'un fait métier observable.

---

## Domain Event

Événement interne à un Bounded Context.

Il reflète une décision métier prise au sein de ce contexte.

Il n'est pas destiné à être consommé directement par les autres Contexts.

---

## Integration Event

Événement publié afin d'informer d'autres Bounded Contexts d'un fait métier significatif.

Il constitue un contrat public et stable.

---

## External Event

Événement provenant d'un système externe.

Il est traduit par un Anti-Corruption Layer avant d'être intégré au langage métier de LevelUP.

---

# 5. Principes fondateurs

## Principe 1 — Un événement représente un fait

Un événement décrit exclusivement un fait accompli.

Il n'exprime ni une intention, ni une demande.

---

## Principe 2 — Les événements sont immuables

Un événement publié ne peut jamais être modifié.

Toute évolution est représentée par un nouvel événement.

---

## Principe 3 — Les événements appartiennent à leur contexte

Chaque Domain Event est la propriété exclusive du Bounded Context qui le produit.

---

## Principe 4 — Les événements d'intégration sont des contrats

Les Integration Events constituent des interfaces publiques entre Contexts.

Ils doivent rester stables et versionnés.

---

## Principe 5 — Les événements décrivent le métier

Les noms d'événements utilisent exclusivement le langage métier de LevelUP.

Aucun détail technique ne doit apparaître.

---

# 6. Cycle de vie d'un événement

```text
Command

↓

Business Decision

↓

Domain Event

↓

Publication

↓

Integration Event

↓

Consumers
```

Chaque étape possède une responsabilité clairement définie.

---

# 7. Conventions de nommage

Les événements respectent les règles suivantes :

* exprimés au passé ;
* décrivent un fait accompli ;
* utilisent le langage métier ;
* portent un nom explicite ;
* sont indépendants des technologies.

Exemples :

* LearningProgramStarted
* ActivityCompleted
* AssessmentPassed
* CompetencyValidated
* EvidencePublished
* PortfolioUpdated

---

# 8. Structure commune

Tout événement publié possède au minimum :

* un identifiant unique ;
* un type ;
* un contexte producteur ;
* une date de production ;
* une version ;
* une référence métier ;
* une charge utile (*payload*) conforme au contrat publié ;
* des métadonnées techniques.

Les éléments communs peuvent s'appuyer sur les Shared Kernels (Identity, Metadata, Versioning, Evidence, etc.) lorsqu'ils existent.

---

# 9. Publication

Un événement est publié uniquement lorsqu'un fait métier significatif s'est produit.

Les événements ne sont jamais publiés pour décrire des détails d'implémentation ou des traitements techniques internes.

---

# 10. Consommation

Les Contexts consommateurs :

* interprètent uniquement le contrat public ;
* ne dépendent jamais du modèle interne du producteur ;
* restent autonomes dans leurs décisions métier ;
* peuvent ignorer les événements qui ne les concernent pas.

---

# 11. Versionnement

Les événements d'intégration sont versionnés.

Toute évolution incompatible entraîne la publication d'une nouvelle version du contrat.

Les anciennes versions peuvent être maintenues pendant une période de transition définie par la gouvernance d'architecture.

---

# 12. Gouvernance

Les événements publiés :

* sont documentés ;
* sont approuvés par la gouvernance d'architecture ;
* possèdent un propriétaire identifié ;
* disposent d'un cycle de vie explicite ;
* sont inscrits dans le catalogue officiel des événements.

---

# 13. Éléments interdits

Un événement ne doit jamais :

* contenir de logique métier ;
* exposer des modèles internes ;
* représenter une commande ;
* transporter des informations inutiles ;
* dépendre d'une technologie particulière.

---

# 14. Relations avec les autres spécifications

Cette spécification constitue la base des documents suivants :

* Event Catalog Specification ;
* Published Language Specification ;
* Integration Event Catalog ;
* API Contract Specification ;
* Command Architecture Specification ;
* Query Architecture Specification.

---

# 15. Décisions architecturales

L'Event Architecture constitue le modèle officiel de communication événementielle de LevelUP.

Les événements représentent exclusivement des faits métier immuables et constituent le principal mécanisme de propagation des changements entre les Bounded Contexts.

Cette architecture garantit une communication faiblement couplée, une forte traçabilité et une évolution indépendante des différents domaines de la plateforme, tout en restant indépendante des choix technologiques de mise en œuvre.
