# Query Architecture Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Integration Architecture

**Code :** LEVELUP-ARCH-QUERY-001

---

# 1. Objet

La **Query Architecture** définit les principes, les règles et les conventions régissant les opérations de consultation dans l'écosystème LevelUP.

Une Query représente une demande d'information adressée à un Bounded Context afin d'obtenir une vue métier sans modifier l'état du système.

Cette spécification est indépendante des technologies de communication ou de stockage.

---

# 2. Mission

Fournir un modèle commun permettant aux différents Bounded Contexts d'exposer leurs informations de manière cohérente, stable et faiblement couplée.

---

# 3. Vision architecturale

Une Query est l'entrée officielle d'un Bounded Context pour les opérations de lecture.

Elle exprime un besoin d'information métier.

Elle ne révèle ni le modèle interne, ni les mécanismes de stockage, ni les stratégies d'optimisation employées par le contexte.

---

# 4. Définition

Une **Query** est une requête de consultation demandant à un Bounded Context de fournir une représentation d'une information métier.

Elle ne provoque aucune modification de l'état du domaine et n'exprime aucune intention de transformation.

---

# 5. Principes fondateurs

## Principe 1 — Une Query exprime un besoin d'information

Une Query décrit ce qui doit être connu, jamais la manière dont cette information est obtenue.

---

## Principe 2 — Une Query ne modifie jamais l'état

Une Query ne crée, ne met à jour et ne supprime aucune donnée métier.

Elle ne déclenche pas de décision métier.

---

## Principe 3 — Une Query appartient à un seul Bounded Context

Chaque Query est publiée par un unique contexte responsable de la représentation qu'il expose.

---

## Principe 4 — Les Queries utilisent le langage métier

Les noms et les structures des Queries utilisent exclusivement le langage ubiquitaire de LevelUP.

Les détails techniques sont exclus.

---

## Principe 5 — Les représentations sont indépendantes du modèle interne

Les réponses aux Queries peuvent provenir de projections, de vues spécialisées, de caches ou de toute autre représentation adaptée.

Le modèle interne du contexte demeure protégé.

---

# 6. Cycle de vie

Une Query suit généralement les étapes suivantes :

1. émission de la Query ;
2. validation des paramètres ;
3. résolution de la représentation demandée ;
4. récupération des informations ;
5. construction de la vue métier ;
6. retour de la réponse.

Aucune modification de l'état du domaine n'intervient au cours de ce processus.

---

# 7. Conventions de nommage

Les Queries :

* utilisent un verbe de consultation ;
* expriment un besoin métier ;
* sont indépendantes des mécanismes de stockage ;
* restent compréhensibles par les experts métier.

Exemples :

* GetLearningProgram
* GetCompetencyProgress
* GetAssessmentHistory
* GetPortfolioSummary
* SearchKnowledge
* GetRecommendations

---

# 8. Structure commune

Toute Query comprend au minimum :

* un identifiant ;
* un type de requête ;
* un contexte propriétaire ;
* les paramètres nécessaires ;
* une version ;
* des métadonnées techniques.

Les réponses utilisent des contrats publics définis dans le Published Language.

---

# 9. Responsabilités

Le contexte propriétaire :

* valide la Query ;
* construit la représentation métier ;
* retourne uniquement les informations autorisées ;
* garantit la cohérence de la réponse.

Les consommateurs ne dépendent jamais des structures internes du contexte.

---

# 10. Gouvernance

Les Queries publiques :

* sont documentées ;
* sont versionnées ;
* appartiennent au Published Language du contexte ;
* suivent les règles de gouvernance de l'architecture d'intégration.

---

# 11. Contraintes

Une Query ne doit jamais :

* modifier l'état du domaine ;
* déclencher une logique métier de transformation ;
* publier un événement métier ;
* exposer les modèles internes ;
* dépendre des mécanismes de persistance.

---

# 12. Relations avec les autres spécifications

Cette spécification complète :

* Integration Architecture Specification ;
* Published Language Specification ;
* Command Architecture Specification ;
* Event Architecture Specification ;
* Shared Kernel Architecture Specification.

Elle constitue le modèle officiel des interactions de lecture dans l'écosystème LevelUP.

---

# 13. Décisions architecturales

Les Queries représentent le mécanisme officiel de consultation des informations métier dans LevelUP.

Elles séparent les besoins de lecture des opérations de modification du domaine, protègent les modèles internes des Bounded Contexts et permettent la construction de représentations optimisées, adaptées aux différents consommateurs.

Cette séparation renforce la modularité, améliore les performances des consultations et garantit une évolution indépendante des modèles de lecture et des modèles métier.
