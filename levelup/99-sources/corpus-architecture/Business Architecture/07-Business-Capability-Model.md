# LevelUP

# Livrable 7 — Business Capability Model

**Référence : LEVELUP-BUS-003**

---

# 1. Objet du document

Le Business Capability Model (BCM) décrit les capacités métier permanentes nécessaires au fonctionnement de LevelUP.

Une capacité métier représente une aptitude durable de l'organisation.

Elle est indépendante :

* des technologies ;
* des interfaces utilisateur ;
* des fonctionnalités logicielles ;
* des choix d'implémentation.

Le présent document définit les capacités fondamentales qui permettront à LevelUP de produire la valeur décrite dans le *Learning & Competency Value Stream*.

---

# 2. Mission des capacités métier

Toutes les capacités de LevelUP poursuivent une mission unique :

> Transformer une intention d'apprentissage en compétence réelle, démontrable et durable.

Aucune capacité n'existe indépendamment de cette mission.

Chaque capacité contribue directement à une ou plusieurs étapes du flux de création de valeur.

---

# 3. Principes de modélisation

Les capacités métier de LevelUP respectent les principes suivants :

* une capacité représente une aptitude durable ;
* une capacité est indépendante de l'organisation technique ;
* une capacité peut évoluer sans remettre en cause les autres ;
* une capacité possède une responsabilité clairement définie ;
* plusieurs services logiciels pourront implémenter une même capacité.

---

# 4. Architecture globale des capacités

Le modèle est organisé autour de huit capacités stratégiques.

```text
LevelUP

├── Competency Engineering
├── Learning Engineering
├── Learning Orchestration
├── Learning Execution
├── Competency Assurance
├── Knowledge Management
├── Progress Intelligence
└── Platform Governance
```

Ces capacités constituent le cœur opérationnel de LevelUP.

---

# 5. Description des capacités stratégiques

## 5.1 Competency Engineering

### Mission

Transformer un domaine de connaissance en un modèle de compétence structuré.

### Responsabilités

* structurer les domaines ;
* définir les compétences ;
* identifier les fondations ;
* établir les dépendances pédagogiques ;
* définir les sous-compétences ;
* définir les critères de maîtrise ;
* définir les critères de validation.

### Résultat

Un référentiel de compétences cohérent et exploitable.

---

## 5.2 Learning Engineering

### Mission

Transformer un référentiel de compétences en parcours d'apprentissage.

### Responsabilités

* construire les Learning Paths ;
* organiser les étapes de progression ;
* définir les objectifs intermédiaires ;
* organiser les jalons ;
* définir les missions pédagogiques ;
* gérer les variantes de parcours ;
* garantir la cohérence pédagogique.

### Résultat

Un parcours structuré conduisant progressivement à la compétence cible.

---

## 5.3 Learning Orchestration

### Mission

Transformer un parcours en organisation quotidienne.

### Responsabilités

* créer des programmes ;
* intégrer des emplois du temps ;
* gérer les routines ;
* organiser les sessions ;
* planifier les activités ;
* adapter le rythme de progression ;
* coordonner l'exécution.

### Résultat

Une organisation compatible avec la réalité de chaque apprenant.

---

## 5.4 Learning Execution

### Mission

Accompagner l'exécution du parcours.

### Responsabilités

* superviser les activités ;
* suivre l'avancement ;
* maintenir la discipline ;
* maintenir la régularité ;
* gérer les interruptions ;
* enregistrer les réalisations.

### Résultat

Une progression effective dans le temps.

---

## 5.5 Competency Assurance

### Mission

Garantir que les compétences sont réellement acquises.

### Responsabilités

* observer les performances ;
* déclencher les évaluations ;
* organiser les missions pratiques ;
* analyser les résultats ;
* produire un diagnostic ;
* décider de la validation ;
* recommander des renforcements ;
* organiser les révisions ;
* produire les Capability Statements.

### Résultat

Des compétences démontrées et non supposées.

---

## 5.6 Knowledge Management

### Mission

Gérer le patrimoine de connaissances utilisé par LevelUP.

### Responsabilités

* gérer les ressources ;
* gérer les références ;
* gérer les résumés ;
* gérer les notes ;
* gérer les liens entre ressources et compétences.

### Résultat

Un patrimoine documentaire organisé au service de la progression.

---

## 5.7 Progress Intelligence

### Mission

Transformer les données de progression en informations décisionnelles.

### Responsabilités

* mesurer la progression ;
* analyser la discipline ;
* analyser la régularité ;
* mesurer la maîtrise ;
* produire des indicateurs ;
* produire des historiques ;
* détecter les dérives.

### Résultat

Une vision objective de l'évolution de l'apprenant.

---

## 5.8 Platform Governance

### Mission

Assurer la cohérence et la gouvernance globale de LevelUP.

### Responsabilités

* administrer les référentiels ;
* gérer les catalogues ;
* gérer les configurations ;
* assurer la sécurité ;
* assurer la traçabilité ;
* gérer les évolutions du système.

### Résultat

Une plateforme stable, cohérente et gouvernée.

---

# 6. Décomposition des capacités

Chaque capacité stratégique est composée de capacités métier plus spécialisées.

Exemple :

```text
Competency Engineering

├── Domain Structuring
├── Competency Definition
├── Foundation Management
├── Dependency Management
├── Competency Mapping
└── Validation Criteria Definition
```

Cette décomposition sera précisée dans les futurs modèles métier.

---

# 7. Relations avec le Learning & Competency Value Stream

Les capacités soutiennent collectivement l'ensemble du flux de création de valeur.

| Étape du Value Stream           | Capacités principales                        |
| ------------------------------- | -------------------------------------------- |
| Définir une intention           | Learning Engineering                         |
| Identifier une compétence cible | Competency Engineering                       |
| Structurer le domaine           | Competency Engineering                       |
| Construire un parcours          | Learning Engineering                         |
| Organiser l'exécution           | Learning Orchestration                       |
| Accompagner l'exécution         | Learning Execution                           |
| Observer la progression         | Progress Intelligence                        |
| Évaluer les acquis              | Competency Assurance                         |
| Diagnostiquer et décider        | Competency Assurance + Progress Intelligence |
| Démontrer la compétence         | Competency Assurance                         |

Le Value Stream décrit le processus de création de valeur.

Les Business Capabilities décrivent les aptitudes nécessaires pour exécuter ce processus.

---

# 8. Principes d'évolution

Toute nouvelle capacité devra respecter les règles suivantes :

* contribuer directement à la mission de LevelUP ;
* ne pas dupliquer une capacité existante ;
* rester indépendante de toute technologie ;
* s'appuyer sur les concepts définis dans le Business Concept Model ;
* soutenir une ou plusieurs étapes du Learning & Competency Value Stream.

---

# 9. Décisions d'architecture

Les décisions suivantes sont désormais considérées comme structurantes :

* la compétence constitue le produit final de LevelUP ;
* les parcours sont construits à partir des compétences et non des ressources ;
* les ressources sont interchangeables ;
* les missions pratiques constituent le principal mécanisme d'évaluation ;
* la progression est adaptative ;
* les capacités métier sont organisées autour du cycle de création de valeur et non autour des fonctionnalités logicielles.

---

# 10. Conclusion

Le Business Capability Model formalise les capacités permanentes nécessaires à la réalisation de la mission de LevelUP.

Il constitue le point de jonction entre la stratégie définie par les premiers livrables et la modélisation métier détaillée qui suivra.

Les prochains livrables (Business Domain Model, Business Object Model et modèles d'architecture applicative) dériveront directement de ces capacités afin de garantir une continuité complète entre la vision, le métier et l'implémentation.
