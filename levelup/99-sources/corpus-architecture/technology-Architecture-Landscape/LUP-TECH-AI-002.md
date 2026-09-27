# LUP-TECH-AI-002

# AI Reference Architecture

**Projet :** LevelUP

**Code :** LUP-TECH-AI-002

**Version :** 1.0 (Draft)

**Statut :** Draft

**Classification :** Technology Architecture

---

# 1. Purpose

Ce document définit l'architecture de référence de la plateforme d'intelligence artificielle de LevelUP.

Il décrit les composants, leurs responsabilités, leurs interactions et les principes permettant d'intégrer des capacités d'IA de manière cohérente, sécurisée et évolutive.

Cette architecture constitue la référence technique pour tous les développements liés à l'intelligence artificielle.

---

# 2. Scope

Cette architecture couvre :

* l'ensemble de l'AI Platform ;
* l'intégration avec les Bounded Contexts ;
* les fournisseurs de modèles ;
* les services de récupération de connaissances ;
* les mécanismes de mémoire ;
* les composants d'observabilité ;
* les politiques de sécurité.

Ne sont pas couverts :

* les prompts détaillés ;
* les API spécifiques ;
* les SDK Flutter ;
* les implémentations techniques.

---

# 3. Architectural Goals

L'architecture poursuit les objectifs suivants :

* découplage des fournisseurs IA ;
* indépendance du domaine métier ;
* haute évolutivité ;
* sécurité des données ;
* maîtrise des coûts ;
* extensibilité ;
* observabilité complète ;
* intégration transparente avec les Bounded Contexts.

---

# 4. Reference Architecture Overview

L'architecture repose sur une plateforme d'IA transverse.

```text
                    +------------------------------------+
                    |            Flutter UI              |
                    +----------------+-------------------+
                                     |
                                     v
                    +------------------------------------+
                    |        Application Layer           |
                    +----------------+-------------------+
                                     |
                                     v
               +----------------------------------------------+
               |                 AI Platform                  |
               |----------------------------------------------|
               | AI Gateway                                  |
               | AI Orchestrator                             |
               | Context Builder                             |
               | Prompt Registry                             |
               | Knowledge Retrieval Service                 |
               | Conversation Memory Service                 |
               | Model Provider Adapter                      |
               | Policy Engine                               |
               | AI Observability                            |
               +----------------+-----------------------------+
                                |
                                v
             +---------------------------------------------+
             |           Domain Services                   |
             |---------------------------------------------|
             | Coaching                                   |
             | Learning                                   |
             | Assessment                                 |
             | Portfolio                                  |
             | Competency                                 |
             | Habit                                      |
             +----------------+----------------------------+
                              |
                              v
         +-----------------------------------------------+
         |             AI Providers                      |
         |-----------------------------------------------|
         | Gemini                                        |
         | OpenAI                                        |
         | Local Models                                  |
         | Future Providers                              |
         +-----------------------------------------------+
```

---

# 5. Core Components

## 5.1 AI Gateway

Point d'entrée unique des services IA.

Responsabilités :

* authentification ;
* autorisation ;
* limitation de débit ;
* journalisation ;
* routage.

---

## 5.2 AI Orchestrator

Le cœur de la plateforme.

Responsabilités :

* sélection du fournisseur ;
* orchestration des workflows ;
* exécution des appels IA ;
* reprise sur erreur ;
* gestion des délais d'attente ;
* coordination des services.

Aucun composant métier ne communique directement avec un fournisseur IA.

---

## 5.3 Context Builder

Construit le contexte nécessaire à chaque interaction.

Sources possibles :

* profil utilisateur ;
* compétences ;
* objectifs ;
* progression ;
* évaluations ;
* portfolio ;
* préférences ;
* ressources pédagogiques.

Le Context Builder applique le principe de minimisation des données.

---

## 5.4 Prompt Registry

Responsable de la gestion des prompts.

Fonctions :

* versionnement ;
* catégorisation ;
* validation ;
* internationalisation ;
* réutilisation.

Les prompts ne doivent jamais être codés en dur dans les applications métier.

---

## 5.5 Knowledge Retrieval Service

Implémente la stratégie de récupération de connaissances (RAG).

Il peut interroger :

* référentiels de compétences ;
* parcours pédagogiques ;
* ressources LevelUP ;
* documents métiers ;
* bases vectorielles ;
* moteurs de recherche internes.

---

## 5.6 Conversation Memory Service

Gère la mémoire conversationnelle.

Types de mémoire :

* session ;
* court terme ;
* long terme ;
* préférences utilisateur.

Les politiques de conservation sont configurables.

---

## 5.7 Model Provider Adapter

Abstraction des fournisseurs.

Chaque fournisseur implémente une interface commune.

Le remplacement d'un fournisseur ne doit avoir aucun impact sur le domaine métier.

---

## 5.8 AI Policy Engine

Applique les politiques de gouvernance.

Contrôle notamment :

* les permissions ;
* les données autorisées ;
* les règles de conformité ;
* les quotas ;
* les limites de coût.

---

## 5.9 AI Observability

Centralise les métriques :

* temps de réponse ;
* consommation de jetons ;
* coût ;
* taux d'erreur ;
* qualité des réponses ;
* fournisseur utilisé ;
* fréquence d'utilisation.

---

# 6. Integration Principles

Les Bounded Contexts consomment exclusivement les services de l'AI Platform.

Ils ne doivent jamais :

* appeler directement un fournisseur IA ;
* construire eux-mêmes les prompts ;
* gérer les clés d'API ;
* implémenter des stratégies de mémoire.

Toute logique d'orchestration est centralisée dans l'AI Platform.

---

# 7. Deployment Model

L'architecture prend en charge trois modes d'exécution :

### Cloud AI

Utilisation de modèles hébergés.

### On-device AI

Exécution locale sur l'appareil lorsque cela est possible.

### Hybrid AI

Sélection dynamique entre les modèles locaux et cloud selon le contexte, les capacités de l'appareil, la connectivité, le coût ou les exigences de confidentialité.

---

# 8. Non-Functional Requirements

L'architecture doit satisfaire aux exigences suivantes :

* disponibilité élevée ;
* faible latence ;
* évolutivité horizontale ;
* tolérance aux pannes ;
* observabilité complète ;
* sécurité de bout en bout ;
* faible couplage ;
* extensibilité.

---

# 9. Architecture Decision Records

## ADR-AI-001

L'intelligence artificielle est implémentée sous la forme d'une plateforme transverse.

---

## ADR-AI-002

Le domaine métier reste indépendant des fournisseurs d'IA.

---

## ADR-AI-003

Les prompts sont centralisés dans un registre dédié.

---

## ADR-AI-004

Toutes les interactions passent par l'AI Orchestrator.

---

## ADR-AI-005

Les connaissances métier sont enrichies via une architecture RAG.

---

# 10. Future Evolution

L'architecture est conçue pour accueillir :

* plusieurs fournisseurs simultanément ;
* des agents spécialisés ;
* des workflows multi-agents ;
* des modèles propriétaires LevelUP ;
* des modèles open source auto-hébergés ;
* des modèles multimodaux ;
* des systèmes d'apprentissage adaptatif.

Cette architecture garantit que l'évolution des technologies d'intelligence artificielle pourra être absorbée sans remise en cause des fondations métier de LevelUP.
