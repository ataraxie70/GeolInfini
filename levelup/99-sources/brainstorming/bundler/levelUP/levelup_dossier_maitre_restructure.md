# LEVELUP — Dossier maître de reprise et de restructuration

## 1. Diagnostic synthétique

L’archive `levelUP.zip` ne contient pas un codebase exécutable. Elle contient principalement :
- des documents d’audit et d’état ;
- des cahiers des charges ;
- des architectures fonctionnelles et techniques ;
- des schémas de base de données ;
- des moteurs métier décrits en pseudo-implémentation ;
- des roadmaps de formation système / C / DevOps ;
- des maquettes et du design d’interface ;
- quelques seeds SQL.

Conclusion opérationnelle :
- le projet est déjà très avancé sur la conception ;
- la structure documentaire est toutefois éclatée ;
- plusieurs documents décrivent la même couche sous des angles différents ;
- un développeur externe ne peut pas démarrer proprement sans un dossier maître unique ;
- aucun backend complet, aucun frontend complet et aucun pipeline de livraison ne sont présents dans l’archive elle-même.

## 2. Ce qui est déjà fort

### 2.1 Vision produit
Le système est clair : piloter l’apprentissage avec discipline, ordre, traçabilité, validation et révision.

### 2.2 Moteur pédagogique
Les briques conceptuelles sont déjà posées :
- progression / verrouillage des sujets ;
- recommandations de ressources ;
- exécution de séances ;
- moteur de feedback ;
- moteur d’exercices ;
- orchestrateur central.

### 2.3 Base de données
Le schéma fonctionnel est bien pensé :
- utilisateurs ;
- domaines ;
- sujets ;
- prérequis ;
- séances ;
- validations ;
- révisions ;
- projets ;
- notifications ;
- journal d’activité ;
- paramètres système ;
- pièces jointes.

### 2.4 Parcours technique
La roadmap de formation est cohérente :
- développement système ;
- administration système ;
- DevOps / DevSecOps ;
- progression par étapes ;
- validation par maîtrise réelle.

## 3. Ce qui bloque la reprise technique

### 3.1 Pas de source de vérité unique
Les documents se recouvrent :
- cahier des charges ;
- spécification plateforme ;
- architecture technique ;
- architecture d’entreprise ;
- roadmap prioritaire ;
- audit ;
- architecture cible ;
- moteurs métier.

Sans consolidation, la lecture produit une surcharge cognitive inutile.

### 3.2 Mélange entre vision, règles métier et implémentation
On trouve dans le même corpus :
- des objectifs produit ;
- des règles pédagogiques ;
- des modèles SQL ;
- des fragments de pseudo-code ;
- des décisions d’architecture.

Ces couches doivent être séparées.

### 3.3 Ambiguïté sur le périmètre de départ
Deux axes coexistent :
- un MVP local stable ;
- une plateforme plus ambitieuse, quasi-entreprise.

Le socle doit être figé avant toute extension.

### 3.4 Absence de contrat de données finalisé
Le schéma est riche, mais il faut encore figer :
- les entités de base ;
- les états autorisés ;
- les transitions ;
- les contraintes d’intégrité ;
- les événements métier.

## 4. Lecture architecturale correcte

Le projet doit être traité comme un système en 5 couches :

1. **Vision et gouvernance**
   - pourquoi le système existe ;
   - ce qu’il interdit ;
   - ce qu’il priorise.

2. **Métier**
   - parcours ;
   - sujets ;
   - prérequis ;
   - validations ;
   - révisions ;
   - pénalités ;
   - sessions.

3. **Application**
   - orchestrateur ;
   - moteurs ;
   - services ;
   - API ;
   - admin dashboard.

4. **Données**
   - schéma relationnel ;
   - seeds ;
   - historique ;
   - audit ;
   - états.

5. **Exécution**
   - backend ;
   - frontend ;
   - jobs planifiés ;
   - tests ;
   - observabilité ;
   - sauvegardes.

## 5. Proposition de dossier maître unique

Le projet devrait être réorganisé autour d’un seul dossier de référence documentaire.

```text
levelup_master/
├── 00_vision/
│   ├── mission.md
│   ├── principles.md
│   └── scope.md
├── 01_exigences/
│   ├── needs_analysis.md
│   ├── use_cases.md
│   ├── constraints.md
│   └── acceptance_criteria.md
├── 02_metier/
│   ├── domains.md
│   ├── learning_paths.md
│   ├── sessions.md
│   ├── revisions.md
│   ├── penalties.md
│   └── admin_rules.md
├── 03_architecture/
│   ├── business_architecture.md
│   ├── application_architecture.md
│   ├── technical_architecture.md
│   ├── data_architecture.md
│   ├── security_architecture.md
│   └── observability.md
├── 04_conception_ui/
│   ├── information_architecture.md
│   ├── dashboard_admin.md
│   ├── dashboard_apprenant.md
│   └── design_system.md
├── 05_donnees/
│   ├── erd.md
│   ├── schema_sql.md
│   ├── seed_strategy.md
│   └── audit_logs.md
├── 06_moteurs/
│   ├── progression_engine.md
│   ├── recommendation_engine.md
│   ├── session_engine.md
│   ├── feedback_engine.md
│   └── orchestrator.md
├── 07_implementation/
│   ├── backend_plan.md
│   ├── frontend_plan.md
│   ├── admin_module_plan.md
│   ├── testing_plan.md
│   └── release_plan.md
└── 08_roadmap/
    ├── phase_0_foundation.md
    ├── phase_1_mvp.md
    ├── phase_2_admin.md
    └── phase_3_scale.md
```

## 6. Chaîne de livrables recommandée

### Livrable 0 — Cadrage
- objectif du produit ;
- public cible ;
- périmètre ;
- hors périmètre ;
- contraintes ;
- critères de succès.

### Livrable 1 — Analyse des besoins
- problèmes à résoudre ;
- usages quotidiens ;
- règles d’étude ;
- cas d’échec ;
- pénalités ;
- reprise après interruption.

### Livrable 2 — Modèle métier
- domaines ;
- programmes ;
- plans ;
- modules ;
- sujets ;
- prérequis ;
- états d’avancement ;
- validations ;
- révisions ;
- sanctions.

### Livrable 3 — Architecture logique
- modules backend ;
- modules frontend ;
- flux d’orchestration ;
- frontières d’isolement ;
- contrats internes ;
- événements métier.

### Livrable 4 — Modèle de données
- tables ;
- clés ;
- cardinalités ;
- contraintes ;
- index ;
- historique ;
- audit.

### Livrable 5 — Spécification du dashboard d’administration
- création d’un programme ;
- création d’un plan ;
- ajout de modules ;
- ajout de sujets ;
- définition des prérequis ;
- calendrier ;
- règles de pénalité ;
- validation manuelle ;
- import/export.

### Livrable 6 — Spécification des moteurs
- progression ;
- recommandation ;
- session ;
- feedback ;
- orchestrateur ;
- règles de décision.

### Livrable 7 — Plan d’implémentation
- backend ;
- frontend ;
- API ;
- persistance ;
- sécurité ;
- tests ;
- migration ;
- CI/CD.

### Livrable 8 — Plan de validation
- tests métier ;
- tests d’intégrité ;
- tests d’interface ;
- tests de non-régression ;
- cas limites ;
- reprise après erreur.

### Livrable 9 — Dossier de mise en production locale
- démarrage ;
- seed ;
- comptes ;
- configuration ;
- sauvegarde ;
- restauration ;
- diagnostic.

## 7. Spécification du module d’administration demandé

Le tableau de bord d’administration doit permettre :

### 7.1 Gestion de programmes
- créer un nouveau programme ;
- le nommer ;
- le classer ;
- lui associer une finalité ;
- lui donner un statut actif/inactif.

### 7.2 Gestion de plans
- créer un plan d’étude ;
- le rattacher à un programme ;
- définir sa durée ;
- définir sa cadence ;
- définir ses objectifs.

### 7.3 Gestion de contenu
- ajouter des modules ;
- ajouter des sujets ;
- ajouter des exercices ;
- ajouter des ressources ;
- marquer une ressource comme primaire ou secondaire.

### 7.4 Gestion des dépendances
- lier les prérequis ;
- imposer des verrous ;
- empêcher l’ouverture prématurée d’un sujet.

### 7.5 Gestion temporelle
- générer un emploi du temps ;
- déplacer une séance ;
- suspendre temporairement un bloc ;
- reprendre après interruption ;
- recalculer le planning.

### 7.6 Gestion disciplinaire
- définir des pénalités ;
- appliquer une pénalité en cas de tâche non faite ;
- historiser le motif ;
- éviter les modifications sauvages du plan.

### 7.7 Gestion de reprise
- questionnaire de reprise ;
- vérification du contexte ;
- recalage automatique ;
- proposition de séance de rattrapage.

## 8. Règle d’or du système

Le système ne doit pas être un agenda passif.  
Il doit être un **mécanisme de contrainte intelligente**.

Il doit :
- afficher quoi faire ;
- expliquer pourquoi ;
- empêcher la fuite vers des sujets non autorisés ;
- enregistrer les écarts ;
- proposer une reprise ;
- corriger la trajectoire.

## 9. Ordre de construction réel

### Phase A — Stabilisation conceptuelle
1. figer le vocabulaire ;
2. supprimer les doublons ;
3. définir les états ;
4. définir les transitions ;
5. définir le périmètre MVP.

### Phase B — Socle de données
1. schéma relationnel final ;
2. seeds minimaux ;
3. historique ;
4. règles d’intégrité.

### Phase C — Socle backend
1. API de lecture ;
2. API d’écriture ;
3. moteurs métier ;
4. orchestrateur ;
5. tests.

### Phase D — Dashboard
1. dashboard apprenant ;
2. dashboard admin ;
3. édition des programmes ;
4. édition des plans ;
5. pilotage des pénalités.

### Phase E — Industrialisation
1. logs ;
2. monitoring ;
3. sauvegardes ;
4. migration ;
5. CI/CD.

## 10. Recommandation finale

Le bon traitement de cette archive n’est pas une implémentation immédiate, mais une **refonte documentaire et architecturale en dossier maître unique**.  
Une fois cette consolidation faite, le développement devient presque mécanique : les règles métier, les modèles de données et le comportement des écrans sont déjà déterminés.