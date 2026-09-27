# LUP-TECH-EVENT-001

# Event-Driven Architecture Specification

**Projet :** LevelUP

**Code :** LUP-TECH-EVENT-001

**Version :** 1.0 (Draft)

**Statut :** Draft

**Classification :** Technology Architecture

---

# 1. Purpose

Cette spécification définit l'architecture événementielle de référence de LevelUP.

Elle établit les principes, responsabilités et mécanismes permettant de propager les changements d'état métier entre les différents Bounded Contexts et les plateformes transverses.

L'architecture événementielle constitue le système nerveux de la plateforme et favorise un couplage faible, une forte évolutivité et une meilleure observabilité.

---

# 2. Scope

Cette spécification couvre :

* les événements métier ;
* les événements d'intégration ;
* les événements de plateforme ;
* les contrats d'événements ;
* le routage ;
* le versionnement ;
* la gouvernance ;
* la sécurité ;
* l'observabilité.

Ne sont pas couverts :

* le choix du broker de messages ;
* les protocoles de transport ;
* les implémentations spécifiques.

---

# 3. Event Vision

Dans LevelUP, tout changement significatif de l'état métier est représenté par un événement.

Les événements constituent le mécanisme privilégié de propagation des changements entre les domaines et les plateformes transverses.

L'architecture adopte une approche **Event-First**, dans laquelle les événements représentent les faits métier plutôt que de simples notifications techniques.

---

# 4. Guiding Principles

## EVENT-001 — Business First

Chaque événement représente un fait métier ayant déjà eu lieu.

---

## EVENT-002 — Immutable Events

Un événement publié est immuable.

Toute correction est représentée par un nouvel événement.

---

## EVENT-003 — Domain Ownership

Chaque Bounded Context est propriétaire des événements qu'il publie.

---

## EVENT-004 — Loose Coupling

Les producteurs ne connaissent pas les consommateurs.

---

## EVENT-005 — Asynchronous Communication

Les échanges entre domaines privilégient les communications asynchrones lorsque cela est pertinent.

---

## EVENT-006 — Explicit Contracts

Chaque événement possède un contrat documenté.

---

## EVENT-007 — Versioned Events

Les événements suivent une politique de versionnement explicite.

---

## EVENT-008 — Event as Source of Integration

Les intégrations entre domaines privilégient les événements plutôt que les accès directs aux données.

---

# 5. Event Platform

La Event Platform fournit les capacités suivantes :

* publication d'événements ;
* abonnement ;
* routage ;
* filtrage ;
* distribution ;
* persistance lorsque nécessaire ;
* reprise après incident ;
* supervision.

Ces capacités sont indépendantes des technologies d'implémentation.

---

# 6. Event Categories

## Domain Events

Événements internes à un Bounded Context.

Ils reflètent une évolution du modèle métier.

---

## Integration Events

Événements publiés afin d'être consommés par d'autres domaines.

Ils constituent les contrats d'intégration.

---

## Platform Events

Événements destinés aux plateformes transverses.

Ils peuvent alimenter :

* la Knowledge Platform ;
* l'AI Platform ;
* l'Analytics Platform ;
* les Notifications ;
* l'Observability Platform.

---

## System Events

Événements techniques liés au fonctionnement de la plateforme.

---

## AI Events

Événements produits ou consommés par l'AI Platform.

Exemples :

* CapabilityExecuted ;
* ContextUpdated ;
* RecommendationGenerated ;
* KnowledgeRetrieved.

---

# 7. Event Lifecycle

Chaque événement suit le cycle de vie suivant :

1. génération ;
2. validation ;
3. publication ;
4. distribution ;
5. consommation ;
6. archivage éventuel ;
7. expiration selon la politique de conservation.

---

# 8. Event Ownership

Chaque événement possède :

* un domaine propriétaire ;
* un responsable métier ;
* une politique de versionnement ;
* une politique de conservation ;
* une politique de sécurité.

Le domaine propriétaire est seul responsable de l'évolution de son contrat.

---

# 9. Event Contracts

Chaque contrat d'événement définit :

* un identifiant ;
* un nom ;
* une description ;
* le domaine propriétaire ;
* la version ;
* les données transportées ;
* les métadonnées ;
* les règles de validation.

Les consommateurs ne doivent dépendre que de ces contrats.

---

# 10. Event Metadata

Chaque événement transporte des métadonnées standardisées comprenant notamment :

* identifiant unique ;
* identifiant de corrélation ;
* horodatage ;
* version ;
* domaine d'origine ;
* type d'événement ;
* classification des données ;
* niveau de sensibilité.

Ces métadonnées facilitent le routage, l'audit et l'observabilité.

---

# 11. Event Routing

La plateforme assure :

* le routage par catégorie ;
* le routage par domaine ;
* le routage par type ;
* le filtrage des consommateurs ;
* la diffusion vers plusieurs abonnés.

Le routage est indépendant des consommateurs.

---

# 12. Event Reliability

La plateforme garantit les mécanismes nécessaires afin de :

* limiter les pertes d'événements ;
* détecter les duplications ;
* permettre les reprises après incident ;
* assurer la résilience des traitements.

Les consommateurs doivent être conçus pour être idempotents.

---

# 13. Event Security

Les événements sont protégés selon leur classification.

Les mécanismes de sécurité comprennent notamment :

* authentification des producteurs ;
* autorisation des consommateurs ;
* chiffrement des communications ;
* protection des données sensibles ;
* journalisation des accès.

---

# 14. Event Observability

La plateforme fournit des capacités permettant de suivre :

* les publications ;
* les consommations ;
* les délais de traitement ;
* les erreurs ;
* les reprises ;
* les volumes échangés.

Ces informations alimentent l'Observability Platform.

---

# 15. Event Governance

La gouvernance définit :

* les conventions de nommage ;
* les politiques de versionnement ;
* les règles de compatibilité ;
* les propriétaires ;
* les processus de validation ;
* le catalogue des événements.

Aucun événement ne doit être publié sans contrat documenté.

---

# 16. Event Catalog

Tous les événements publiés sont référencés dans un catalogue central comprenant :

* leur identifiant ;
* leur description ;
* leur propriétaire ;
* leur version ;
* leurs consommateurs connus ;
* leur statut.

Le catalogue constitue la référence officielle des événements de la plateforme.

---

# 17. Non-Functional Requirements

L'architecture événementielle doit garantir :

* scalabilité ;
* résilience ;
* faible couplage ;
* extensibilité ;
* observabilité ;
* sécurité ;
* compatibilité ascendante lorsque possible.

---

# 18. Architecture Decision Records

## ADR-EVENT-001

Les événements représentent des faits métier immuables.

## ADR-EVENT-002

Chaque Bounded Context est propriétaire des événements qu'il publie.

## ADR-EVENT-003

Les intégrations entre domaines privilégient les événements plutôt que les accès directs aux bases de données.

## ADR-EVENT-004

Les événements possèdent des contrats versionnés.

## ADR-EVENT-005

La plateforme adopte une approche Event-First.

---

# 19. Future Evolution

L'architecture permettra progressivement :

* des workflows événementiels distribués ;
* des orchestrations de longue durée ;
* des événements multimodaux ;
* des mécanismes avancés de replay ;
* des politiques de gouvernance automatisées ;
* une intégration renforcée avec la Knowledge Platform, l'AI Platform et les capacités analytiques.

Cette évolution devra préserver les principes fondamentaux de faible couplage, de propriété des événements et d'indépendance vis-à-vis des technologies de transport définis dans cette spécification.
