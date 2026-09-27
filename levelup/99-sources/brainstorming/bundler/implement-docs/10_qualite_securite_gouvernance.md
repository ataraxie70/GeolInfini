# Qualité, sécurité et gouvernance

## 1. Tests
- tests unitaires sur les moteurs ;
- tests d’intégration API ;
- tests de cohérence des états ;
- tests de non-régression sur les règles de progression ;
- tests de schéma de données.

## 2. Sécurité
- authentification ;
- autorisation ;
- hachage des secrets ;
- validation stricte des entrées ;
- limitation des surfaces d’attaque ;
- journalisation des actions sensibles.

## 3. Gouvernance technique
- séparation stricte des couches ;
- revue de code systématique ;
- conventions de nommage ;
- documentation obligatoire ;
- pas de fonctionnalités nouvelles avant stabilisation du noyau.

## 4. Exploitabilité
- commande de lancement stable ;
- environnement reproductible ;
- configuration centralisée ;
- logs lisibles ;
- déploiement déterministe.

## 5. Observabilité
- journaux structurés ;
- métriques de latence ;
- métriques d’erreur ;
- suivi des blocages ;
- suivi des validations ;
- suivi des reprises de séance.
