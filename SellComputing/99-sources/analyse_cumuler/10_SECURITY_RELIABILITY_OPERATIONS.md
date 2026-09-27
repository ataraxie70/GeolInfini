# 10 — Exigences non fonctionnelles

## 1. Sécurité

### Exigences minimales

- authentification robuste ;
- autorisation par rôle et permission ;
- validation stricte de toutes les entrées ;
- protection contre injection ;
- protection contre bruteforce ;
- limitation des tentatives sensibles ;
- journalisation des actions critiques.

### Gestion des secrets

- secrets hors dépôt ;
- rotation des clés ;
- séparation des environnements ;
- accès minimal.

### Surface d’attaque

- exposition minimale des endpoints ;
- pas d’accès direct aux données sensibles ;
- médias servis de manière contrôlée.

## 2. Fiabilité

- tolérance aux erreurs partielles ;
- retour d’erreur explicite ;
- reprise possible après panne ;
- sauvegardes régulières ;
- migrations réversibles.

## 3. Performances

- pagination ;
- indexation ;
- cache contrôlé ;
- limitation des payloads ;
- compression des réponses publiques si pertinent.

## 4. Observabilité

- logs structurés ;
- corrélation des requêtes ;
- métriques de disponibilité ;
- métriques de latence ;
- alerting sur erreurs répétées.

## 5. Maintenabilité

- modules isolés ;
- nommage homogène ;
- tests unitaires par domaine ;
- tests d’intégration pour les flux critiques ;
- documentation à jour.

## 6. Disponibilité opérationnelle

- environnements séparés ;
- configuration par variables ;
- déploiement reproductible ;
- sauvegarde de base de données ;
- restauration testée.

## 7. Conformité d’usage

- collecte minimale ;
- transparence des traitements ;
- protection des données personnelles ;
- durée de conservation contrôlée.

## 8. Risques techniques

| Risque | Effet | Contre-mesure |
|---|---|---|
| couplage excessif | évolution difficile | frontières de contexte |
| recommandation opaque | perte de confiance | justification systématique |
| catalogue instable | mauvaise qualité de données | validation stricte |
| dette technique | ralentissement | architecture modulaire |
| fuite de données | incident de sécurité | moindre privilège |

## 9. Critère non fonctionnel final

Le système doit être suffisamment simple pour être maintenu, suffisamment rigoureux pour être sécurisé, et suffisamment lisible pour inspirer confiance.
