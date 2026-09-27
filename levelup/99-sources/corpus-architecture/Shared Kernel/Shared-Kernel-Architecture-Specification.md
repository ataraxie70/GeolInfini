# Shared Kernel Architecture Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Architecture

**Code :** LEVELUP-ARCH-SHARED-KERNEL-001

---

# 1. Objet

Le **Shared Kernel** définit l'ensemble des concepts, modèles, conventions et contrats partagés entre plusieurs Bounded Contexts de l'architecture LevelUP.

Il fournit un langage commun permettant aux différents contextes de collaborer tout en préservant leur autonomie et leurs frontières métier.

Le Shared Kernel n'est pas un Bounded Context.

Il constitue un mécanisme architectural transversal.

---

# 2. Mission

Garantir la cohérence des modèles partagés utilisés dans plusieurs Bounded Contexts sans introduire de dépendances métier inappropriées.

Le Shared Kernel vise à réduire les ambiguïtés, éviter les duplications inutiles et assurer l'interopérabilité des différents domaines de la plateforme.

---

# 3. Position dans l'architecture

Le Shared Kernel appartient à la couche d'architecture de l'entreprise.

Il est consommé par les différents Bounded Contexts.

Aucun contexte n'en est propriétaire.

Sa gouvernance relève de l'architecture globale de LevelUP.

```text
                     Shared Kernel

        ┌────────────────────────────────────┐
        │  Concepts communs                  │
        │  Value Objects                     │
        │  Contrats                          │
        │  Métadonnées                       │
        │  Conventions                       │
        └────────────────────────────────────┘

          ▲         ▲         ▲         ▲
          │         │         │         │

 Knowledge   Assessment   Portfolio   Analytics
 Competency  Activity     Search      Recommendation
 Learning    Progress     Resource Catalog
```

---

# 4. Vision architecturale

Chaque Bounded Context possède son propre modèle métier.

Cependant, certains concepts sont identiques dans plusieurs contextes.

Lorsque ces concepts représentent une vérité commune et stable pour l'ensemble de la plateforme, ils peuvent être définis dans le Shared Kernel.

Le Shared Kernel constitue ainsi le socle du langage partagé de LevelUP.

Il ne remplace jamais les modèles métiers propres à chaque contexte.

---

# 5. Objectifs

Le Shared Kernel poursuit les objectifs suivants :

* établir un vocabulaire partagé ;
* garantir la cohérence des concepts communs ;
* réduire les duplications de modèles ;
* faciliter l'interopérabilité entre contextes ;
* stabiliser les contrats d'échange ;
* limiter les dépendances entre Bounded Contexts.

---

# 6. Principes fondateurs

## Principe 1 — Le Shared Kernel n'est pas un domaine métier

Il ne contient aucune logique métier spécifique.

Il ne représente aucune capacité fonctionnelle de la plateforme.

---

## Principe 2 — Les Bounded Contexts restent autonomes

Chaque contexte conserve la propriété de son modèle métier.

Le Shared Kernel ne remet jamais en cause cette autonomie.

---

## Principe 3 — Seuls les concepts universels sont partagés

Un élément ne peut intégrer le Shared Kernel que s'il possède la même signification dans tous les contextes consommateurs.

---

## Principe 4 — La stabilité est obligatoire

Les éléments du Shared Kernel doivent évoluer lentement.

Les concepts encore expérimentaux restent dans leurs contextes d'origine.

---

## Principe 5 — Le partage est justifié

Un concept n'entre pas dans le Shared Kernel parce qu'il est réutilisé.

Il y entre parce qu'il représente une vérité commune de l'architecture.

---

# 7. Éléments autorisés

Le Shared Kernel peut contenir notamment :

* Value Objects ;
* objets de métadonnées ;
* classifications communes ;
* systèmes de version ;
* identifiants communs ;
* conventions de nommage ;
* contrats d'échange ;
* événements d'intégration ;
* formats de représentation ;
* énumérations communes ;
* règles de validation génériques.

---

# 8. Éléments interdits

Le Shared Kernel ne peut jamais contenir :

* Aggregate Roots ;
* Entités métier ;
* Repositories ;
* Services métier ;
* politiques métier ;
* règles propres à un domaine ;
* Workflows ;
* Cas d'utilisation ;
* interfaces utilisateur ;
* logique applicative.

---

# 9. Critères d'admission

Un concept ne peut être intégré au Shared Kernel que si toutes les conditions suivantes sont réunies :

* il est utilisé par plusieurs Bounded Contexts ;
* sa signification est identique dans chacun d'eux ;
* il est suffisamment stable ;
* il ne transporte aucune logique métier spécifique ;
* sa centralisation améliore la cohérence globale de l'architecture.

---

# 10. Gouvernance

Toute évolution du Shared Kernel doit :

* être justifiée ;
* être revue par l'architecture ;
* être rétrocompatible lorsque cela est possible ;
* être documentée ;
* être versionnée.

Les changements du Shared Kernel sont considérés comme des évolutions architecturales majeures.

---

# 11. Structure du Shared Kernel

Le Shared Kernel est organisé en plusieurs spécifications spécialisées.

À titre indicatif :

* Evidence Shared Kernel
* Metadata Shared Kernel
* Versioning Shared Kernel
* Classification Shared Kernel
* Common Identifiers
* Common Value Objects
* Integration Event Contracts

Chaque spécification possède sa propre documentation.

---

# 12. Cycle de vie

Un concept suit les étapes suivantes :

1. apparition dans un Bounded Context ;
2. réutilisation par plusieurs contextes ;
3. analyse architecturale ;
4. validation des critères d'admission ;
5. intégration dans le Shared Kernel ;
6. gouvernance et évolution.

Le Shared Kernel n'est jamais le point de départ d'un concept métier.

Il en est le point de stabilisation.

---

# 13. Relations avec les Bounded Contexts

Les contextes utilisent le Shared Kernel comme référence commune.

Ils restent néanmoins propriétaires de leurs propres modèles métier.

Le Shared Kernel ne peut imposer une logique métier à un contexte.

Les dépendances doivent toujours rester unidirectionnelles :

```text
Bounded Context
        │
        ▼
Shared Kernel

Jamais :

Shared Kernel
        │
        ▼
Bounded Context
```

---

# 14. Évolution

Le Shared Kernel est conçu pour évoluer progressivement.

De nouvelles spécifications peuvent être ajoutées lorsque des concepts communs émergent naturellement de l'évolution de la plateforme.

Aucun élément ne doit être ajouté de manière anticipée.

---

# 15. Décisions architecturales

Le Shared Kernel constitue le socle du langage partagé de LevelUP.

Il ne représente ni un domaine métier, ni un service, ni un contexte fonctionnel.

Il formalise uniquement les concepts universels nécessaires à la collaboration entre les Bounded Contexts.

Cette approche garantit :

* une architecture modulaire ;
* des frontières métier préservées ;
* une forte cohérence sémantique ;
* une gouvernance maîtrisée des modèles partagés ;
* une évolution progressive et contrôlée de l'écosystème.

Le Shared Kernel est ainsi considéré comme un contrat architectural, garant de l'unité du langage sans compromettre l'autonomie des différents domaines de LevelUP.
