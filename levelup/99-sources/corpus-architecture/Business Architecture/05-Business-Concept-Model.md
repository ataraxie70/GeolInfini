# LevelUP

# Business Concept Model (BCM)

**Référence : LEVELUP-BUS-001**

---

# 1. Objet du document

Le Business Concept Model définit le langage métier officiel de LevelUP.

Il établit les concepts fondamentaux utilisés dans l'ensemble du projet et fixe leur signification.

Ce document ne décrit ni les fonctionnalités, ni l'architecture logicielle, ni le modèle de données.

Il répond exclusivement à la question :

> **Quels sont les concepts qui composent le monde de LevelUP ?**

Tous les futurs livrables utiliseront exclusivement les définitions établies dans ce document.

---

# 2. Principes de modélisation

Les concepts métier de LevelUP respectent les principes suivants :

* un concept représente une réalité métier clairement identifiable ;
* un concept possède une responsabilité unique ;
* un concept est indépendant de son implémentation logicielle ;
* un concept n'est jamais défini par son interface utilisateur ;
* un concept est défini par son rôle dans le système.

---

# 3. Taxonomie générale

Les concepts métier sont organisés en plusieurs familles.

## 3.1 Concepts de compétence

Ces concepts représentent ce que l'utilisateur cherche à construire.

* Domain
* Competency
* Foundation
* Skill
* Knowledge
* Validation
* Evidence

---

## 3.2 Concepts de progression

Ces concepts représentent l'organisation de l'apprentissage.

* Learning Path
* Milestone
* Stage
* Progress
* Objective

---

## 3.3 Concepts d'organisation

Ces concepts permettent de structurer l'activité quotidienne.

* Program
* Schedule
* Routine
* Session
* Activity

---

## 3.4 Concepts de contenu

Ces concepts représentent les éléments utilisés pendant la progression.

* Resource
* Exercise
* Assessment
* Project
* Note
* Reference

---

## 3.5 Concepts de supervision

Ces concepts permettent de mesurer l'évolution.

* Evaluation
* Validation
* Feedback
* Metrics
* History

---

# 4. Concepts fondamentaux

Les concepts suivants sont considérés comme les piliers du modèle métier.

---

## Domain

### Définition

Un Domain représente un domaine de compétence reconnu par une communauté, une profession ou un marché.

LevelUP ne crée pas les Domain.

Il les adopte afin d'organiser leur apprentissage.

### Exemples

* Administration Système
* Développement Frontend
* Développement Backend
* Développement Mobile
* DevOps
* Cloud Engineering

### Ce que Domain n'est pas

* un cours ;
* une technologie ;
* une ressource ;
* une tâche.

---

## Competency

### Définition

Une Competency représente une capacité réelle, démontrable et applicable dans un contexte concret.

La compétence constitue la finalité de tout parcours.

Une compétence n'est jamais considérée comme acquise uniquement parce qu'un contenu a été consulté.

---

## Foundation

### Définition

Une Foundation représente un ensemble de connaissances ou de compétences indispensables avant d'aborder des notions plus avancées.

Les Foundations constituent le principe directeur de l'organisation des parcours.

---

## Learning Path

### Définition

Le Learning Path représente l'organisation progressive permettant de construire une Competency dans un Domain donné.

Il respecte les dépendances pédagogiques et les fondations définies par LevelUP.

Le Learning Path n'est pas une simple liste de chapitres.

---

## Program

### Définition

Un Program représente un ensemble organisé d'activités poursuivant un objectif déterminé dans une période donnée.

Un Program peut représenter :

* un cursus personnel ;
* un semestre universitaire ;
* une formation professionnelle ;
* un plan de préparation ;
* un planning d'apprentissage.

Le Learning Path constitue un cas particulier de Program.

---

## Activity

### Définition

Une Activity représente une unité concrète de travail réalisée par l'utilisateur.

Une Activity peut consister à :

* étudier une notion ;
* réaliser un exercice ;
* développer un projet ;
* effectuer une révision ;
* réaliser une évaluation.

Une Activity représente l'exécution.

Elle ne représente pas la compétence.

---

## Resource

### Définition

Une Resource représente une source d'information permettant de réaliser une Activity.

Les Resources sont interchangeables.

Elles ne constituent pas le patrimoine principal de LevelUP.

---

## Validation

### Définition

La Validation représente la confirmation qu'une compétence ou une sous-compétence est effectivement maîtrisée.

Une Validation repose sur des preuves et non sur le simple achèvement d'un contenu.

---

## Evidence

### Définition

Une Evidence représente une preuve objective utilisée pour démontrer une compétence.

Exemples :

* projet réalisé ;
* exercice réussi ;
* démonstration pratique ;
* production technique ;
* examen.

---

# 5. Relations conceptuelles

Le modèle métier repose sur les relations suivantes.

* Un Domain contient plusieurs Competencies.
* Une Competency est construite grâce à un Learning Path.
* Un Learning Path est composé de plusieurs Foundations, Stages et Activities.
* Un Program organise l'exécution d'un Learning Path ou d'autres activités.
* Une Activity utilise une ou plusieurs Resources.
* Une Validation s'appuie sur une ou plusieurs Evidence.
* Une Competency n'est considérée comme acquise qu'après Validation.

---

# 6. Principes d'évolution

Le Business Concept Model constitue le langage officiel de LevelUP.

Tout nouveau concept devra respecter les règles suivantes :

* ne pas dupliquer un concept existant ;
* répondre à une responsabilité métier clairement distincte ;
* rester indépendant des technologies ;
* rester cohérent avec la Core Identity, la Vision et la Progression Philosophy.

---

# 7. Conclusion

Le Business Concept Model établit les fondations du vocabulaire métier de LevelUP.

Il servira de référence pour la construction du Business Capability Model, du Domain Model, du modèle de données et de l'architecture logicielle.
