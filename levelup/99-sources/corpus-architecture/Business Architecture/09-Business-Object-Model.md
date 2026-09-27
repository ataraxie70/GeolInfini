# LevelUP

# Livrable 9 — Business Object Model

**Référence : LEVELUP-BUS-005**

## Objet du document

Le Business Object Model définit les objets métier fondamentaux manipulés par les domaines métier de LevelUP.

Ces objets représentent les réalités métier du système. Ils sont indépendants de toute implémentation technique, de toute base de données et de toute interface utilisateur.

Ils constituent le socle de la future modélisation DDD, du modèle de données et de l'architecture applicative.

---

# 1. Principes de modélisation

Les objets métier de LevelUP respectent les principes suivants :

* chaque objet représente une réalité métier identifiable ;
* chaque objet possède une responsabilité unique ;
* chaque objet appartient à un domaine métier clairement identifié ;
* chaque objet possède un cycle de vie métier ;
* chaque objet est régi par des invariants métier.

---

# 2. Classification des objets

Les objets métier sont répartis en deux grandes catégories.

## 2.1 Objets de référence

Ils décrivent la connaissance structurée et relativement stable.

Exemples :

* Domain
* Competency
* Foundation
* Learning Path
* Resource

## 2.2 Objets d'exécution

Ils décrivent l'activité réelle d'un apprenant.

Exemples :

* Program
* Activity
* Mission
* Observation
* Assessment
* Validation
* Progress Record

---

# 3. Description des principaux objets métier

## Domain

### Mission

Représenter un domaine reconnu de compétence.

### Domaine propriétaire

Competency Domain.

### Responsabilités

* identifier un domaine d'expertise ;
* regrouper les compétences associées ;
* définir le périmètre de spécialisation.

### Invariants

* un Domain possède au moins une Competency ;
* un Domain ne représente jamais une ressource.

---

## Competency

### Mission

Représenter une capacité opérationnelle démontrable.

### Domaine propriétaire

Competency Domain.

### Responsabilités

* définir le résultat attendu d'un parcours ;
* regrouper les fondations nécessaires ;
* définir les critères de maîtrise.

### Invariants

* une Competency possède des Foundations ;
* une Competency est démontrée par des Evidence ;
* une Competency ne peut être validée sans Assessment.

---

## Foundation

### Mission

Définir les acquis indispensables à toute progression.

### Domaine propriétaire

Competency Domain.

### Invariants

* une Foundation précède toujours les notions qui en dépendent ;
* une Foundation ne peut dépendre d'une compétence plus avancée.

---

## Learning Path

### Mission

Organiser la progression vers une Competency.

### Domaine propriétaire

Learning Domain.

### Invariants

* un Learning Path possède une Competency cible ;
* il respecte les dépendances pédagogiques ;
* il définit une progression cohérente.

---

## Program

### Mission

Transformer un Learning Path ou un objectif en plan d'exécution.

### Domaine propriétaire

Organization Domain.

### Invariants

* un Program est planifiable ;
* un Program produit des Activities ;
* un Program possède une durée.

---

## Activity

### Mission

Représenter une unité concrète de travail.

### Domaine propriétaire

Execution Domain.

### Invariants

* une Activity appartient à un Program ;
* une Activity possède un état d'exécution.

---

## Mission

### Mission

Permettre la démonstration d'une compétence dans une situation réaliste.

### Domaine propriétaire

Assessment Domain.

### Invariants

* une Mission évalue une ou plusieurs Competencies ;
* une Mission produit des Observations.

---

## Observation

### Mission

Collecter des faits objectifs pendant l'exécution d'une Mission.

### Domaine propriétaire

Assessment Domain.

### Invariants

* une Observation est factuelle ;
* elle alimente un Diagnostic.

---

## Diagnostic

### Mission

Déterminer le niveau réel de maîtrise.

### Domaine propriétaire

Assessment Domain.

### Invariants

* un Diagnostic repose sur des Observations ;
* il conduit à une décision pédagogique.

---

## Validation

### Mission

Reconnaître officiellement la maîtrise d'une Competency.

### Domaine propriétaire

Assessment Domain.

### Invariants

* une Validation nécessite un Diagnostic favorable ;
* une Validation produit un Capability Statement.

---

## Capability Statement

### Mission

Décrire explicitement ce que l'apprenant est capable de réaliser.

### Domaine propriétaire

Assessment Domain.

### Invariants

* il décrit des capacités démontrées ;
* il ne repose jamais sur un simple taux de progression.

---

# 4. Relations métier

Les principales relations sont les suivantes :

* un Domain regroupe plusieurs Competencies ;
* une Competency est construite par un Learning Path ;
* un Learning Path peut être exécuté au travers d'un ou plusieurs Programs ;
* un Program organise des Activities ;
* une Mission produit des Observations ;
* les Observations alimentent un Diagnostic ;
* le Diagnostic conduit à une Validation ;
* la Validation génère un Capability Statement.

---

# 5. Principaux invariants métier

Les règles suivantes sont considérées comme fondamentales :

* aucune compétence ne peut être validée sans preuve ;
* une progression ne garantit jamais une compétence ;
* les fondations sont validées avant les spécialisations ;
* une mission observe une compétence dans un contexte réel ;
* un Capability Statement reflète uniquement des capacités effectivement démontrées.

---

# 6. Conclusion

Le Business Object Model constitue la représentation officielle des objets métier de LevelUP.

Il servira de base à la définition des agrégats DDD, des entités, des objets de valeur, des services métier et du modèle de données, tout en garantissant une parfaite continuité avec les livrables précédents.
