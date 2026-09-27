# LevelUP

# Livrable 11 — Strategic Domain Design : Context Map

**Référence : LEVELUP-DDD-001**

---

# 1. Objet du document

Le présent document formalise le **Context Map** de LevelUP.

Il constitue le point de transition entre l'architecture métier et l'architecture logicielle en définissant les **Bounded Contexts**, leurs responsabilités, leurs frontières et leurs modes de collaboration.

Le Context Map garantit que chaque partie du système évolue de manière autonome tout en participant à la mission globale de LevelUP :

> Transformer une intention d'apprentissage en compétence démontrée.

---

# 2. Objectifs

Le Context Map poursuit les objectifs suivants :

* définir les frontières des modèles métier ;
* attribuer une responsabilité unique à chaque contexte ;
* limiter les dépendances entre contextes ;
* établir un langage partagé tout en préservant l'autonomie de chaque modèle ;
* préparer une architecture modulaire, distribuable et évolutive.

---

# 3. Principes d'architecture

Le Strategic Domain Design repose sur les principes suivants.

## 3.1 Un contexte possède un modèle unique

Chaque Bounded Context est propriétaire de son modèle métier.

Aucun autre contexte ne peut modifier directement ce modèle.

---

## 3.2 Les échanges sont explicites

Les contextes collaborent uniquement par des contrats métier.

Aucune dépendance implicite n'est autorisée.

---

## 3.3 Les responsabilités sont exclusives

Une responsabilité appartient toujours à un seul contexte.

Le partage de responsabilités est interdit.

---

## 3.4 Le langage est contextualisé

Un même terme peut avoir un sens différent selon le contexte.

Chaque contexte est responsable de son langage métier.

---

# 4. Vue d'ensemble du Context Map

```text
                             +----------------------+
                             | Competency Context   |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Learning Context     |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Program Context      |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Activity Context     |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Progress Context     |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Assessment Context   |
                             +----------------------+
                                         |
                                         v
                             +----------------------+
                             | Analytics Context    |
                             +----------------------+

Knowledge Context
        │
        ├────────────► Published Language vers tous les contextes

Governance Context
        │
        └────────────► Politiques et règles transversales
```

---

# 5. Classification des Bounded Contexts

## 5.1 Core Domains

Ces contextes produisent directement la valeur métier.

* Competency Context
* Learning Context
* Progress Context
* Assessment Context

Ils représentent le cœur de LevelUP.

---

## 5.2 Supporting Domains

Ces contextes permettent l'exécution opérationnelle.

* Program Context
* Activity Context
* Knowledge Context

Ils soutiennent les Core Domains.

---

## 5.3 Governance Domains

Ces contextes assurent la cohérence globale.

* Analytics Context
* Governance Context

Ils observent, pilotent et gouvernent l'écosystème.

---

# 6. Description des Bounded Contexts

## 6.1 Competency Context

### Mission

Définir les compétences, leurs fondations et leurs critères de maîtrise.

### Responsabilités

* gérer les domaines de compétence ;
* définir les compétences ;
* gérer les fondations ;
* gérer les prérequis ;
* définir les critères de validation.

### Objets principaux

* Domain
* Competency
* Competency Blueprint
* Reference Model
* Foundation
* Learning Objective
* Expected Outcome
* Validation Criterion

### Relations

Fournisseur principal du Learning Context.

---

## 6.2 Learning Context

### Mission

Transformer une compétence en parcours structuré.

### Responsabilités

* construire les Learning Blueprints ;
* définir les étapes d'apprentissage ;
* gérer les jalons et milestones ;
* organiser les objectifs pédagogiques et les unités d'apprentissage.

### Objets principaux

* Learning Blueprint
* Learning Strategy
* Learning Stage
* Learning Module
* Learning Unit
* Milestone
* Consolidation

### Relations

Consomme le modèle du Competency Context.

Fournit les parcours au Program Context.

---

## 6.3 Program Context

### Mission

Transformer les modèles d'apprentissage génériques en programmes personnalisés pour chaque utilisateur.

### Responsabilités

* créer les programmes personnels ;
* personnaliser le rythme d'apprentissage ;
* définir les objectifs personnels ;
* organiser les étapes du programme.

### Objets principaux

* Personal Program
* Program Blueprint
* Program Stage
* Program Goal
* Learning Pace
* Program Status

---

## 6.4 Activity Context

### Mission

Gérer la planification et l'exécution quotidienne des activités d'apprentissage concrètes.

### Responsabilités

* générer et ordonnancer les activités ;
* organiser les sessions de travail ;
* planifier les missions, révisions et consolidations ;
* suivre l'exécution et enregistrer les résultats.

### Objets principaux

* Activity Plan
* Activity
* Learning Session
* Routine
* Activity Queue
* Activity Outcome

---

## 6.5 Progress Context

### Mission

Observer, analyser et estimer en continu le niveau de maîtrise réel de l'apprenant.

### Responsabilités

* collecter et historiser les preuves d'apprentissage ;
* estimer le niveau de maîtrise multidimensionnel ;
* détecter les régressions et lacunes ;
* suggérer des recommandations de révision ou consolidation.

### Objets principaux

* Progress Record
* Learning Evidence
* Mastery State
* Progress Snapshot
* Recommendation

---

## 6.6 Assessment Context

### Mission

Évaluer objectivement les compétences et accorder les validations officielles.

### Responsabilités

* gérer les missions d'évaluation ;
* produire les observations d'évaluation ;
* établir les diagnostics de compétence ;
* valider officiellement l'acquisition des compétences.

### Objets principaux

* Mission
* Assessment
* Observation
* Evidence
* Diagnostic
* Validation
* Capability Statement

---

## 6.7 Knowledge Context

### Mission

Administrer le patrimoine de connaissances.

### Responsabilités

* gérer les ressources ;
* organiser les références ;
* maintenir les résumés ;
* relier les ressources aux compétences.

### Objets principaux

* Resource
* Reference
* Note
* Summary

---

## 6.8 Analytics Context

### Mission

Produire une vision objective de la progression globale.

### Responsabilités

* mesurer les performances ;
* produire les indicateurs ;
* détecter les tendances ;
* identifier les risques.

### Objets principaux

* Metric
* Indicator
* Trend
* Progress Report

---

## 6.9 Governance Context

### Mission

Garantir la cohérence globale de l'écosystème.

### Responsabilités

* administrer les politiques ;
* gérer les référentiels ;
* assurer la traçabilité ;
* gouverner les catalogues.

### Objets principaux

* Policy
* Configuration
* Catalog
* Audit Record

---

# 7. Relations entre les contextes

| Contexte fournisseur | Contexte consommateur | Pattern DDD                  |
| -------------------- | --------------------- | ---------------------------- |
| Competency           | Learning              | Customer / Supplier          |
| Learning             | Program               | Customer / Supplier          |
| Program              | Activity              | Customer / Supplier          |
| Activity             | Progress              | Customer / Supplier          |
| Progress             | Assessment            | Customer / Supplier          |
| Assessment           | Analytics             | Customer / Supplier          |
| Knowledge            | Tous les contextes    | Published Language           |
| Governance           | Tous les contextes    | Governance / Policy Provider |

---

# 8. Flux métier

L'écosystème LevelUP est organisé autour de cinq flux complémentaires.

## Flux de conception

Competency → Learning

Transformation d'une compétence en parcours (Learning Blueprint).

---

## Flux d'organisation

Learning → Program → Activity

Transformation d'un parcours en activités quotidiennes planifiées et personnalisées.

---

## Flux d'observation

Activity → Progress → Assessment → Analytics

Transformation des actions réelles en estimation de progression, puis en validations probantes et en indicateurs d'aide à la décision.

---

## Flux documentaire

Knowledge → Tous les contextes

Diffusion des ressources, références et supports pédagogiques.

---

## Flux de gouvernance

Governance → Tous les contextes

Application des politiques, règles et référentiels.

---

# 9. Langage partagé

Le langage partagé entre les contextes est volontairement limité.

Les concepts pouvant circuler sont notamment :

* Competency Identifier
* Learning Blueprint Identifier
* Program Identifier
* Activity Identifier
* Progress Record Identifier
* Evidence Identifier
* Validation Status
* Capability Statement

Les modèles internes demeurent privés à chaque contexte.

---

# 10. Shared Kernel

Le Shared Kernel est volontairement réduit pour limiter le couplage fort.

Seuls les concepts fondamentaux suivants sont partagés :

* identifiants métier ;
* conventions de nommage ;
* politiques de versionnement ;
* règles de traçabilité ;
* terminologie officielle ;
* le modèle structurel universel de preuve (**Evidence**), qui sert de contrat d'échange commun de confiance entre producteurs et consommateurs.

Hors du modèle structurel neutre d'Evidence, aucun objet métier interne complet n'est partagé.

---

# 11. Anti-Corruption Layer

Toute intégration avec un système externe (LMS, plateforme de formation, ERP, gestion documentaire ou IA) devra passer par une couche d'adaptation.

Cette couche a pour objectif :

* de protéger le modèle métier interne ;
* de traduire les concepts externes ;
* d'éviter toute contamination du langage métier de LevelUP.

---

# 12. Décisions d'architecture

Les décisions suivantes sont désormais structurantes.

* le Competency Context constitue le contexte maître de l'écosystème ;
* les modèles métier demeurent propriétaires de leur contexte ;
* les échanges inter-contextes sont réalisés exclusivement par des contrats métier ;
* les dépendances sont unidirectionnelles ;
* le modèle métier interne de chaque contexte ne doit jamais être exposé directement ;
* l'observation en continu est gérée par le Progress Context, mais seul le Assessment Context détient l'autorité de validation finale des compétences.

---

# 13. Conclusion

Le Context Map formalise l'organisation stratégique de l'écosystème logiciel de LevelUP.

Il établit les frontières entre les différents Bounded Contexts, définit leurs responsabilités et encadre leurs collaborations.

Ce document devient la référence architecturale de toutes les étapes suivantes de conception. Les agrégats, les services de domaine, les événements métier, les API internes et le découpage modulaire devront respecter les frontières définies dans ce Context Map afin de préserver la cohérence et l'évolutivité de LevelUP.
