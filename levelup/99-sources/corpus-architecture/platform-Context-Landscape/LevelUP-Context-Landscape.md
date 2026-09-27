# LevelUP Context Landscape

**Version :** 1.0 (Draft)

**Statut :** Strategic Architecture

**Catégorie :** Enterprise Domain Architecture

**Code :** LEVELUP-ARCH-CONTEXT-LANDSCAPE-001

---

# 1. Objet

Le **LevelUP Context Landscape** constitue la cartographie officielle des Bounded Contexts composant l'architecture métier de la plateforme.

Il définit :

* les différents domaines fonctionnels ;
* leurs responsabilités ;
* leurs frontières ;
* leurs dépendances ;
* leur position dans l'architecture globale.

Ce document constitue la référence de structuration de l'ensemble du modèle métier.

---

# 2. Objectifs

Le Context Landscape poursuit les objectifs suivants :

* garantir une séparation claire des responsabilités ;
* éviter les chevauchements fonctionnels ;
* identifier les Core Domains de LevelUP ;
* identifier les Supporting Domains ;
* identifier les Generic Domains ;
* faciliter l'évolution de l'architecture ;
* servir de référence pour la conception logicielle.

---

# 3. Vision d'ensemble

L'architecture de LevelUP est organisée en quatre grandes couches.

```text
                         LEVELUP

┌──────────────────────────────────────────────┐
│            Shared Knowledge Layer            │
├──────────────────────────────────────────────┤
│ Knowledge                                    │
│ Competency                                   │
│ Learning                                     │
│ Reference Models                             │
│ Assessment Models                            │
└──────────────────────────────────────────────┘

┌──────────────────────────────────────────────┐
│             Execution Layer                  │
├──────────────────────────────────────────────┤
│ Program                                      │
│ Activity                                     │
│ Progress                                     │
│ Assessment                                   │
└──────────────────────────────────────────────┘

┌──────────────────────────────────────────────┐
│          Platform Services Layer             │
├──────────────────────────────────────────────┤
│ Analytics                                    │
│ Recommendation                               │
│ Search                                       │
│ Scheduling                                   │
│ Notification                                 │
│ Resource Catalog                             │
│ AI Coach                                     │
│ Portfolio                                    │
│ Certification                                │
│ Community                                    │
│ Collaboration                                │
└──────────────────────────────────────────────┘

┌──────────────────────────────────────────────┐
│             Governance Layer                 │
├──────────────────────────────────────────────┤
│ Identity                                     │
│ Organization                                 │
│ Workspace                                    │
│ Authorization                                │
│ Configuration                                │
│ Audit                                        │
│ Versioning                                   │
│ Catalog                                      │
└──────────────────────────────────────────────┘
```

---

# 4. Classification des domaines

## 4.1 Core Domains

Les Core Domains constituent la proposition de valeur de LevelUP.

Ils sont propres à la plateforme et matérialisent sa philosophie.

Ils regroupent :

* Knowledge Context
* Competency Context
* Learning Context
* Program Context
* Activity Context
* Progress Context
* Assessment Context
* Reference Model Engineering

Ces contextes représentent le cœur du système.

---

## 4.2 Supporting Domains

Les Supporting Domains enrichissent l'expérience utilisateur et soutiennent le fonctionnement du cœur métier.

Ils comprennent notamment :

* Analytics Context
* Recommendation Context
* Resource Catalog Context
* Search Context
* Portfolio Context
* Certification Context
* Community Context
* Collaboration Context
* AI Coach Context
* Scheduling Context
* Notification Context

Ils peuvent évoluer indépendamment du cœur métier.

---

## 4.3 Generic Domains

Les Generic Domains regroupent les capacités techniques et organisationnelles communes à de nombreuses plateformes.

Ils comprennent notamment :

* Identity Context
* Authentication Context
* Authorization Context
* Organization Context
* Workspace Context
* Configuration Context
* Audit Context
* Versioning Context
* Media Context
* Logging Context
* Monitoring Context

Ces contextes ne différencient pas LevelUP mais assurent son fonctionnement.

---

# 5. Vue fonctionnelle

## Shared Knowledge Layer

Cette couche contient les modèles de référence publiés par la plateforme.

Elle décrit :

* les connaissances ;
* les compétences ;
* les parcours ;
* les modèles pédagogiques ;
* les modèles d'évaluation.

Elle est indépendante des utilisateurs.

---

## Execution Layer

Cette couche représente l'exécution personnalisée des modèles de référence.

Elle gère :

* les programmes personnels ;
* les activités ;
* la progression ;
* les évaluations.

Chaque donnée est propre à un apprenant.

---

## Platform Services Layer

Cette couche fournit des services transverses consommés par les autres contextes.

Elle n'est pas responsable de la logique métier principale.

Elle améliore :

* l'expérience utilisateur ;
* les recommandations ;
* l'analyse ;
* la recherche ;
* la collaboration.

---

## Governance Layer

Cette couche garantit la gouvernance de la plateforme.

Elle assure :

* la sécurité ;
* l'identité ;
* les droits d'accès ;
* la configuration ;
* la traçabilité ;
* la gestion des versions.

---

# 6. Relations de haut niveau

```text
Knowledge
      │
      ▼
Competency
      │
      ▼
Learning
      │
      ▼
Program
      │
      ▼
Activity
      │
      ▼
Progress
      │
      ▼
Assessment

             │
             ▼

Analytics
Recommendation
Portfolio
Certification
```

Le flux principal suit le cycle de vie complet d'une compétence.

Les autres contextes gravitent autour de ce flux sans modifier sa logique fondamentale.

---

# 7. Principes architecturaux

## Principe 1 — Un contexte, une responsabilité

Chaque Bounded Context possède une responsabilité métier clairement définie.

---

## Principe 2 — Dépendances orientées

Les dépendances suivent le flux métier.

Les contextes amont ne dépendent jamais des contextes aval.

---

## Principe 3 — Indépendance des modèles

Les modèles de référence sont indépendants des données personnelles des apprenants.

---

## Principe 4 — Séparation entre définition et exécution

Les modèles pédagogiques sont définis dans la Shared Knowledge Layer.

Leur exécution est assurée par l'Execution Layer.

---

## Principe 5 — Services transverses découplés

Les services de recommandation, d'analyse ou de collaboration ne modifient jamais directement le cœur métier.

Ils consomment les informations produites par celui-ci.

---

# 8. Évolution de l'architecture

Le Context Landscape est un document vivant.

Tout nouveau Bounded Context doit :

* posséder une responsabilité clairement identifiée ;
* être rattaché à une couche architecturale ;
* préciser ses relations avec les autres contextes ;
* éviter toute duplication de responsabilité.

Aucun nouveau contexte ne peut être introduit sans mise à jour du présent document.

---

# 9. Décisions architecturales

Le Context Landscape constitue la carte officielle de l'architecture métier de LevelUP.

Il formalise la séparation entre les modèles de référence, l'exécution personnalisée, les services transverses et la gouvernance.

Cette organisation garantit une architecture évolutive, cohérente et alignée avec les principes du Domain-Driven Design et de l'architecture d'entreprise.

Il devient le point d'entrée de toute évolution fonctionnelle de la plateforme.
