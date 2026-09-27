# 08 — Cahier des charges technique

## 1. Objectif technique

Mettre en place une plateforme stable, modulaire et sécurisée, capable de supporter :

- consultation publique ;
- recommandation ;
- catalogue ;
- commande ;
- maintenance ;
- administration ;
- journalisation.

## 2. Stack recommandée

### Front-end

- application web moderne ;
- typage fort côté client ;
- composants réutilisables ;
- validation de formulaires.

### Back-end

- API HTTP JSON ;
- séparation domaine / application / infrastructure ;
- authentification par jetons ;
- stockage relationnel principal ;
- stockage objet pour médias.

### Base de données

- moteur relationnel ;
- contraintes d’intégrité ;
- indexation sur les attributs de recherche ;
- historique des changements critiques.

### Fichiers

- images produits ;
- certificats reconditionné ;
- pièces jointes de services.

### Recherche

- moteur de recherche interne ;
- index de filtrage ;
- éventuellement moteur dédié ultérieurement.

## 3. Services techniques

| Service | Exigence |
|---|---|
| Auth | jetons sécurisés, expiration, rotation |
| RBAC | contrôle d’accès fin |
| Recommandation | règles explicables |
| Paiement | intégration isolée |
| Upload | validation stricte |
| Recherche | pertinence et filtrage |
| Logs | structure exploitable |

## 4. Déploiement

- conteneurisation ;
- configuration par variables d’environnement ;
- séparation des environnements ;
- sauvegardes ;
- migration de schéma ;
- supervision.

## 5. Sécurité technique

- validation serveur systématique ;
- hachage fort des mots de passe ;
- protections CSRF selon mode d’authentification ;
- contrôle des tailles d’entrées ;
- prévention injection SQL ;
- journalisation des accès sensibles ;
- principe du moindre privilège.

## 6. Exigences d’exécution

- tolérance aux erreurs ;
- messages d’erreur propres ;
- codes HTTP cohérents ;
- absence de dépendance implicite à l’interface utilisateur ;
- réversibilité des migrations.

## 7. Exigences de performance

- chargement initial raisonnable ;
- pagination catalogue ;
- cache des requêtes coûteuses ;
- limitation de la taille des médias ;
- indexation des recherches fréquentes.

## 8. Observabilité

- logs structurés ;
- métriques applicatives ;
- traçage des cas d’usage ;
- audit des opérations critiques.

## 9. Maintenance

- migrations reproductibles ;
- configuration séparée ;
- tests automatisés ;
- documentation des modules ;
- versionnement de l’API.

## 10. Conclusion technique

Le système doit rester simple à opérer avant d’être sophistiqué.  
La complexité n’est légitime que lorsqu’elle apporte un gain mesurable.
