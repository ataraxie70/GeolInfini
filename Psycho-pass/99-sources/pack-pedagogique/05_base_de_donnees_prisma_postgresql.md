# Base de données, PostgreSQL et Prisma

## 1. Rôle de la base de données

La base de données conserve l’état durable du système.
C’est elle qui garde :
- les utilisateurs ;
- les rôles ;
- les tests ;
- les questions ;
- les choix ;
- les réponses ;
- les sessions ;
- les scores ;
- l’historique ;
- les traces d’audit.

## 2. Pourquoi PostgreSQL

PostgreSQL est un bon choix parce que :
- il est robuste ;
- il gère bien les relations ;
- il est mature ;
- il supporte les index ;
- il convient aux données métier structurées.

## 3. Pourquoi Prisma

Prisma permet :
- de décrire le schéma de manière lisible ;
- de générer des types ;
- de faire des migrations ;
- de limiter les erreurs de manipulation SQL ;
- de travailler proprement avec TypeScript.

## 4. Concepts de base

### Table
Une table contient des lignes de données.

### Colonne
Une colonne représente un champ.

### Ligne
Une ligne représente un enregistrement.

### Relation
Une relation relie deux tables.

Exemple :
- un utilisateur peut avoir plusieurs sessions ;
- une session peut avoir plusieurs réponses.

### Index
Un index accélère certaines recherches.

## 5. Modèle de domaine du projet

Entités typiques :
- users
- roles
- tests
- categories
- questions
- choices
- sessions
- answers
- scores
- audits

## 6. Types de relations fréquentes

### 1 vers plusieurs
Exemple :
- un test contient plusieurs questions.

### Plusieurs vers plusieurs
Exemple :
- une question peut appartenir à plusieurs catégories selon la modélisation retenue.

### 1 vers 1
Exemple :
- une session peut avoir un résultat final unique.

## 7. Bonnes pratiques de schéma

- UUID comme identifiant principal ;
- timestamps standards ;
- contraintes de non-nullité quand nécessaire ;
- index sur les champs souvent recherchés ;
- soft delete si le besoin métier l’exige ;
- cohérence de nommage ;
- éviter la duplication de données si elle n’apporte rien.

## 8. Ce qui doit être calculé côté serveur

La base stocke.
Le backend calcule.

Exemples :
- score final ;
- score par catégorie ;
- statut d’une session ;
- décision d’accès ;
- validation métier.

## 9. Migrations

Une migration doit être :
- versionnée ;
- reproductible ;
- relue ;
- testée ;
- appliquée via le workflow prévu.

Ne modifie pas directement une base de production sans stratégie.

## 10. Seed

Le seed sert à préparer :
- un admin de départ ;
- des catégories de base ;
- des questions initiales ;
- quelques tests utiles au développement.

## 11. Exemple de réflexion avant de créer une table

Avant de créer une table, demande :
- à quoi sert-elle ?
- qui l’utilise ?
- quelle est sa clé principale ?
- quelles sont ses relations ?
- quelles sont ses contraintes ?
- faut-il garder un historique ?
- faut-il un audit ?

## 12. Erreurs classiques à éviter

- créer trop de tables trop tôt ;
- stocker des données dérivées qui devraient être recalculées ;
- oublier l’indexation ;
- supprimer une donnée sans traçabilité ;
- négliger la forme des noms ;
- faire du SQL sauvage sans besoin.

## 13. Résumé mental pour un junior

Pense en trois couches :
- la base stocke ;
- le backend calcule ;
- le frontend affiche.

C’est l’une des clés du projet.
