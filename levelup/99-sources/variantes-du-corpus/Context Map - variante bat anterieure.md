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
                             | Organization Context |
                             +----------------------+
                                         |
                                         | Customer / Supplier
                                         v
                             +----------------------+
                             | Execution Context    |
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
* Assessment Context

Ils représentent le cœur de LevelUP.

---

## 5.2 Supporting Domains

Ces contextes permettent l'exécution opérationnelle.

* Organization Context
* Execution Context
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
* Foundation
* Skill
* Knowledge
* Prerequisite

### Relations

Fournisseur principal du Learning Context.

---

## 6.2 Learning Context

### Mission

Transformer une compétence en parcours structuré.

### Responsabilités

* construire les Learning Paths ;
* définir les étapes ;
* gérer les jalons ;
* organiser les objectifs pédagogiques.

### Objets principaux

* Learning Path
* Stage
* Milestone
* Objective

### Relations

Consomme le modèle du Competency Context.

Fournit les parcours au Organization Context.

---

## 6.3 Organization Context

### Mission

Transformer un parcours en organisation quotidienne.

### Responsabilités

* créer les programmes ;
* gérer les routines ;
* organiser les calendriers ;
* adapter les plannings.

### Objets principaux

* Program
* Schedule
* Routine
* Session

---

## 6.4 Execution Context

### Mission

Superviser l'exécution réelle des activités.

### Responsabilités

* suivre les activités ;
* enregistrer les réalisations ;
* mesurer la discipline ;
* gérer les interruptions.

### Objets principaux

* Activity
* Execution Record
* Progress Record

---

## 6.5 Assessment Context

### Mission

Évaluer objectivement les compétences.

### Responsabilités

* gérer les missions ;
* produire les observations ;
* établir les diagnostics ;
* valider les compétences.

### Objets principaux

* Mission
* Assessment
* Observation
* Evidence
* Diagnostic
* Validation
* Capability Statement

---

## 6.6 Knowledge Context

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

## 6.7 Analytics Context

### Mission

Produire une vision objective de la progression.

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

## 6.8 Governance Context

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
| Learning             | Organization          | Customer / Supplier          |
| Organization         | Execution             | Customer / Supplier          |
| Execution            | Assessment            | Customer / Supplier          |
| Assessment           | Analytics             | Customer / Supplier          |
| Knowledge            | Tous les contextes    | Published Language           |
| Governance           | Tous les contextes    | Governance / Policy Provider |

---

# 8. Flux métier

L'écosystème LevelUP est organisé autour de cinq flux complémentaires.

## Flux de conception

Competency → Learning

Transformation d'une compétence en parcours.

---

## Flux d'organisation

Learning → Organization → Execution

Transformation d'un parcours en activité quotidienne.

---

## Flux d'observation

Execution → Assessment → Analytics

Transformation des activités en informations décisionnelles.

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
* Learning Path Identifier
* Program Identifier
* Mission Identifier
* Validation Status
* Capability Statement

Les modèles internes demeurent privés à chaque contexte.

---

# 10. Shared Kernel

Le Shared Kernel est volontairement réduit.

Seuls les concepts fondamentaux suivants sont communs :

* Identifiants métier ;
* conventions de nommage ;
* politiques de versionnement ;
* règles de traçabilité ;
* terminologie officielle.

Aucun objet métier complet n'est partagé.

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
* le modèle métier interne de chaque contexte ne doit jamais être exposé directement.

---

# 13. Conclusion

Le Context Map formalise l'organisation stratégique de l'écosystème logiciel de LevelUP.

Il établit les frontières entre les différents Bounded Contexts, définit leurs responsabilités et encadre leurs collaborations.

Ce document devient la référence architecturale de toutes les étapes suivantes de conception. Les agrégats, les services de domaine, les événements métier, les API internes et le découpage modulaire devront respecter les frontières définies dans ce Context Map afin de préserver la cohérence et l'évolutivité de LevelUP.
