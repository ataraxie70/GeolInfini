# LevelUP

# Livrable 8 — Business Domain Model

**Référence : LEVELUP-BUS-004**

---

# 1. Objet du document

Le présent document définit les domaines métier qui composent l'écosystème fonctionnel de LevelUP.

Un domaine métier représente un espace cohérent de responsabilités, de règles métier, de concepts et de processus participant à la mission globale de la plateforme.

Le Business Domain Model constitue la base de la modélisation métier détaillée et servira de référence pour :

* le Business Object Model ;
* le modèle de données ;
* l'architecture applicative ;
* les services métier ;
* les API ;
* les futurs Bounded Contexts.

---

# 2. Objectif du modèle

Le Business Domain Model répond à la question suivante :

> **Quels sont les grands domaines métier qui collaborent pour transformer une intention d'apprentissage en compétence démontrée ?**

Chaque domaine est autonome dans ses responsabilités tout en collaborant avec les autres domaines.

Le découpage est réalisé selon les responsabilités métier et non selon les fonctionnalités de l'application.

---

# 3. Principes de découpage

Les domaines métier de LevelUP respectent les principes suivants :

* chaque domaine possède une responsabilité clairement identifiée ;
* chaque domaine possède son propre vocabulaire métier ;
* chaque domaine maîtrise ses propres règles métier ;
* les domaines communiquent par des contrats métier explicites ;
* les dépendances sont limitées afin de préserver leur autonomie.

Ces principes permettront ultérieurement une implémentation sous forme de modules ou de services sans modifier le modèle métier.

---

# 4. Vue d'ensemble des domaines

```text
                                      LevelUP

 ┌────────────────────────────────────────────────────────────────────┐
 │                      Competency Domain                             │
 └────────────────────────────────────────────────────────────────────┘
                    │
                    ▼
 ┌────────────────────────────────────────────────────────────────────┐
 │                       Learning Domain                              │
 └────────────────────────────────────────────────────────────────────┘
                    │
                    ▼
 ┌────────────────────────────────────────────────────────────────────┐
 │                     Organization Domain                            │
 └────────────────────────────────────────────────────────────────────┘
                    │
                    ▼
 ┌────────────────────────────────────────────────────────────────────┐
 │                      Execution Domain                              │
 └────────────────────────────────────────────────────────────────────┘
                    │
                    ▼
 ┌────────────────────────────────────────────────────────────────────┐
 │                     Assessment Domain                              │
 └────────────────────────────────────────────────────────────────────┘
                    │
                    ▼
 ┌────────────────────────────────────────────────────────────────────┐
 │                      Analytics Domain                              │
 └────────────────────────────────────────────────────────────────────┘

Les domaines transversaux :

• Knowledge Domain
• Governance Domain
```

---

# 5. Description des domaines métier

---

## 5.1 Competency Domain

### Mission

Définir ce qu'est une compétence et comment elle est construite.

### Responsabilités

* gérer les domaines de compétence ;
* définir les compétences ;
* structurer les fondations ;
* définir les prérequis ;
* organiser les dépendances ;
* définir les critères de maîtrise.

### Concepts principaux

* Domain
* Competency
* Foundation
* Skill
* Knowledge
* Prerequisite

### Questions auxquelles répond ce domaine

* Quelle compétence construit-on ?
* Quels sont ses fondements ?
* Quels prérequis sont nécessaires ?
* Quelles capacités sont attendues ?

---

## 5.2 Learning Domain

### Mission

Transformer une compétence en parcours d'apprentissage.

### Responsabilités

* construire les Learning Paths ;
* organiser les étapes ;
* définir les objectifs ;
* structurer les jalons ;
* organiser la progression.

### Concepts principaux

* Learning Path
* Stage
* Milestone
* Objective
* Progression Rule

### Questions

* Dans quel ordre apprend-on ?
* Quels objectifs doivent être atteints ?
* Quelles étapes composent le parcours ?

---

## 5.3 Organization Domain

### Mission

Transformer un parcours en organisation concrète.

### Responsabilités

* créer des programmes ;
* gérer les routines ;
* intégrer des emplois du temps ;
* organiser les sessions ;
* planifier les activités.

### Concepts principaux

* Program
* Schedule
* Routine
* Session
* Calendar

### Questions

* Quand apprendre ?
* À quel rythme ?
* Comment organiser le travail ?

---

## 5.4 Execution Domain

### Mission

Piloter l'exécution quotidienne.

### Responsabilités

* suivre les activités ;
* enregistrer les réalisations ;
* mesurer la discipline ;
* gérer les interruptions ;
* maintenir la continuité.

### Concepts principaux

* Activity
* Execution
* Completion
* Discipline
* Consistency

### Questions

* Que fait réellement l'apprenant ?
* Les activités sont-elles exécutées ?
* Le rythme est-il respecté ?

---

## 5.5 Assessment Domain

### Mission

Évaluer les acquis et garantir la qualité des compétences.

### Responsabilités

* organiser les missions ;
* observer les réalisations ;
* produire les diagnostics ;
* valider les compétences ;
* recommander les renforcements.

### Concepts principaux

* Mission
* Assessment
* Observation
* Evidence
* Diagnostic
* Validation
* Capability Statement

### Questions

* Les fondations sont-elles solides ?
* Que sait réellement faire l'apprenant ?
* Peut-il passer à l'étape suivante ?

---

## 5.6 Knowledge Domain

### Mission

Gérer les ressources utilisées pendant les parcours.

### Responsabilités

* organiser les ressources ;
* gérer les références ;
* gérer les notes ;
* gérer les résumés ;
* relier les ressources aux compétences.

### Concepts principaux

* Resource
* Reference
* Note
* Summary
* Documentation

### Questions

* Quelles ressources soutiennent la compétence ?
* Quels supports sont disponibles ?

---

## 5.7 Analytics Domain

### Mission

Produire une compréhension globale de la progression.

### Responsabilités

* mesurer la progression ;
* produire des indicateurs ;
* analyser les performances ;
* détecter les difficultés ;
* suivre l'évolution dans le temps.

### Concepts principaux

* Metrics
* History
* Indicator
* Progress Report
* Trend

### Questions

* Comment évolue l'apprenant ?
* Quels risques sont identifiés ?
* Où se situent les difficultés ?

---

## 5.8 Governance Domain

### Mission

Garantir la cohérence globale de la plateforme.

### Responsabilités

* administrer les référentiels ;
* gérer les politiques ;
* assurer la traçabilité ;
* gouverner les catalogues ;
* contrôler les évolutions.

### Concepts principaux

* Policy
* Catalog
* Audit
* Configuration
* Version

### Questions

* Les référentiels sont-ils cohérents ?
* Les règles sont-elles respectées ?

---

# 6. Relations entre les domaines

Les domaines collaborent sans perdre leur autonomie.

Principales relations :

* le Competency Domain fournit la structure des compétences au Learning Domain ;
* le Learning Domain construit les parcours utilisés par l'Organization Domain ;
* l'Organization Domain produit les programmes exécutés par l'Execution Domain ;
* l'Execution Domain transmet les observations à l'Assessment Domain ;
* l'Assessment Domain produit les validations et diagnostics ;
* l'Analytics Domain consolide les informations provenant de l'ensemble des domaines ;
* le Knowledge Domain fournit les ressources à tous les domaines qui en ont besoin ;
* le Governance Domain définit les règles communes applicables à l'ensemble de l'écosystème.

---

# 7. Principes d'architecture

Le modèle métier repose sur les principes suivants :

* un domaine ne manipule que les concepts dont il est propriétaire ;
* les domaines collaborent par échange d'informations métier ;
* les règles métier restent localisées dans leur domaine d'origine ;
* les concepts ne doivent pas être dupliqués entre domaines ;
* chaque domaine peut évoluer indépendamment tant que ses contrats métier sont respectés.

---

# 8. Vision vers les Bounded Contexts

Chaque domaine identifié dans ce document constitue un candidat naturel à un Bounded Context selon les principes du Domain-Driven Design.

Cette organisation permettra :

* une évolution indépendante ;
* une forte cohésion interne ;
* un faible couplage entre domaines ;
* une architecture modulaire ;
* une éventuelle évolution vers une architecture distribuée sans remise en cause du modèle métier.

---

# 9. Décisions d'architecture

Les décisions suivantes sont désormais considérées comme structurantes :

* les domaines métier constituent les unités fondamentales de l'écosystème LevelUP ;
* chaque domaine possède son propre langage métier ;
* les responsabilités sont réparties selon les capacités métier et non selon les interfaces utilisateur ;
* les futurs services applicatifs devront respecter les frontières définies par ce modèle ;
* toute évolution fonctionnelle devra être rattachée à un domaine métier existant ou justifier la création d'un nouveau domaine.

---

# 10. Conclusion

Le Business Domain Model formalise la structure métier de LevelUP.

Il établit les frontières entre les grands domaines de responsabilité et fournit le cadre de référence pour la modélisation des objets métier, des services applicatifs et de l'architecture logicielle.

Ce document marque la transition entre la vision métier et la conception détaillée de l'écosystème LevelUP.
