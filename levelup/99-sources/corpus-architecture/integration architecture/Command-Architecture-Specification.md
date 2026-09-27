# Command Architecture Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Integration Architecture

**Code :** LEVELUP-ARCH-COMMAND-001

---

# 1. Objet

La **Command Architecture** définit les principes, les règles et les conventions gouvernant les commandes dans l'écosystème LevelUP.

Une Command représente une intention métier adressée à un Bounded Context afin de lui demander l'exécution d'une action relevant de sa responsabilité.

Cette spécification est indépendante des technologies de communication utilisées.

---

# 2. Mission

Fournir un modèle commun permettant aux différents Contexts d'exprimer des intentions métier de manière explicite, cohérente et faiblement couplée.

---

# 3. Vision architecturale

Une Command est l'entrée officielle d'un Bounded Context.

Elle représente une demande d'exécution d'une action métier.

Elle ne décrit ni la manière dont cette action sera réalisée, ni son résultat.

Le traitement de la Command relève exclusivement du contexte destinataire.

---

# 4. Définition

Une **Command** est une requête intentionnelle demandant à un Bounded Context de tenter l'exécution d'une action métier.

Elle exprime un objectif à atteindre, sans imposer le processus interne permettant d'y parvenir.

---

# 5. Principes fondateurs

## Principe 1 — Une Command exprime une intention

La Command représente une demande d'action.

Elle ne décrit jamais une implémentation technique.

---

## Principe 2 — Une Command possède un destinataire unique

Chaque Command est adressée à un seul Bounded Context.

Le contexte destinataire est seul responsable de son traitement.

---

## Principe 3 — Une Command ne garantit pas le succès

L'acceptation d'une Command ne signifie pas que l'action demandée sera réalisée.

Le résultat dépend des règles métier du contexte destinataire.

---

## Principe 4 — Une Command précède les événements

Lorsqu'une Command est acceptée et traitée avec succès, elle peut conduire à la production d'un ou plusieurs Domain Events.

Ces événements peuvent ensuite être publiés sous forme d'Integration Events.

---

## Principe 5 — Les Commands utilisent le langage métier

Le nom et la structure d'une Command doivent refléter le vocabulaire du domaine.

Aucun détail technique ne doit apparaître.

---

# 6. Cycle de vie

Une Command suit généralement les étapes suivantes :

1. émission de la Command ;
2. validation de la demande ;
3. application des règles métier ;
4. prise de décision ;
5. modification éventuelle de l'état du domaine ;
6. émission des Domain Events ;
7. publication éventuelle des Integration Events.

---

# 7. Conventions de nommage

Les Commands :

* utilisent un verbe d'action ;
* décrivent une intention métier ;
* sont rédigées dans le langage ubiquitaire de LevelUP ;
* sont indépendantes de toute technologie.

Exemples :

* CreateLearningProgram
* StartLearningProgram
* SubmitAssessment
* ValidateCompetency
* PublishPortfolio
* GenerateRecommendation

---

# 8. Structure commune

Toute Command comprend au minimum :

* un identifiant unique ;
* un type de commande ;
* un émetteur ;
* un contexte destinataire ;
* une date d'émission ;
* les données nécessaires au traitement ;
* des métadonnées techniques ;
* une version.

Les structures communes peuvent réutiliser les Shared Kernels lorsque cela est pertinent.

---

# 9. Responsabilités

Le contexte destinataire :

* valide la Command ;
* applique les règles métier ;
* décide de son acceptation ou de son rejet ;
* produit les événements appropriés lorsque nécessaire.

Les autres Contexts ne participent pas à cette décision.

---

# 10. Gouvernance

Les Commands publiques :

* sont documentées ;
* sont versionnées ;
* appartiennent à un Published Language ;
* sont gouvernées par l'architecture d'intégration.

Toute évolution incompatible donne lieu à une nouvelle version.

---

# 11. Contraintes

Une Command ne doit jamais :

* représenter un événement passé ;
* exposer des détails d'implémentation ;
* modifier directement un autre Bounded Context ;
* contourner les règles métier ;
* dépendre de structures internes externes.

---

# 12. Relations avec les autres spécifications

Cette spécification complète :

* Integration Architecture Specification ;
* Event Architecture Specification ;
* Published Language Specification ;
* Event Catalog Specification ;
* Shared Kernel Architecture Specification.

Elle constitue le modèle officiel des intentions métier dans l'écosystème LevelUP.

---

# 13. Décisions architecturales

Les Commands sont le mécanisme officiel permettant de demander l'exécution d'une action métier au sein de LevelUP.

Elles assurent une séparation claire entre les intentions, les décisions métier et les faits produits par le système. Cette approche garantit une architecture modulaire, un faible couplage entre les Contexts et une gouvernance explicite des interactions.
