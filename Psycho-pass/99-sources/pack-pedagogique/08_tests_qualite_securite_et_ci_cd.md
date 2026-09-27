# Tests, qualité, sécurité et CI/CD

## 1. Pourquoi les tests sont indispensables

Les tests empêchent de casser le projet sans le voir.
Ils servent à vérifier :
- une règle métier ;
- un comportement API ;
- une interface ;
- un parcours utilisateur ;
- une sécurité.

## 2. Types de tests

### Test unitaire
Vérifie une petite unité de code.

### Test d’intégration
Vérifie plusieurs briques ensemble.

### Test E2E
Vérifie un parcours complet comme un vrai utilisateur.

## 3. Ce qu’il faut tester dans Psycho-Pass

- login ;
- refresh token ;
- accès protégé ;
- démarrage de test ;
- soumission de réponse ;
- calcul de score ;
- consultation du résultat ;
- droits admin ;
- erreurs de validation ;
- cas limites.

## 4. Qualité du code

La qualité ne doit pas être “visuelle”.
Elle doit être mesurée par :
- lint ;
- format ;
- tests ;
- revue ;
- cohérence ;
- absence d’astuces fragiles.

## 5. ESLint et Prettier

Ils servent à :
- garder un code lisible ;
- homogénéiser la mise en forme ;
- réduire les débats inutiles ;
- prévenir des erreurs simples.

## 6. Husky et lint-staged

Ils empêchent de committer du code non conforme.
C’est un contrôle automatique avant envoi dans Git.

## 7. Sécurité minimale

Tu dois toujours vérifier :
- authentification ;
- autorisation ;
- validation ;
- protection des secrets ;
- journalisation minimale ;
- dépendances à jour ;
- absence de fuite de données sensibles.

## 8. CI/CD

La CI exécute automatiquement :
- lint ;
- tests ;
- build ;
- vérifications de base.

Le CD prépare ou automatise la livraison.

## 9. Pourquoi la CI est importante

Sans CI :
- le projet peut casser silencieusement ;
- une PR peut contenir un bug évident ;
- les erreurs se propagent vite ;
- la qualité devient aléatoire.

Avec CI :
- le projet garde un niveau constant ;
- les régressions sont détectées tôt ;
- l’équipe travaille avec confiance.

## 10. Règles de sécurité à retenir

- pas de secret dans Git ;
- pas de mot de passe en clair ;
- pas d’accès sans contrôle ;
- pas de calcul critique côté client ;
- pas de suppression silencieuse sans besoin ;
- pas de logs trop bavards sur des données sensibles.

## 11. Définition d’une livraison propre

Une livraison propre doit avoir :
- du code lisible ;
- des tests ;
- une documentation ;
- des migrations vérifiées ;
- un build valide ;
- un déploiement reproductible.

## 12. Erreurs fréquentes

- penser que “si ça marche sur ma machine, c’est bon” ;
- oublier les tests de non-régression ;
- ignorer les erreurs de sécurité ;
- valider sans relire ;
- négliger le build de production.

## 13. Résumé simple

La qualité n’est pas un bonus.
La qualité fait partie du produit.
Les tests et la CI sont les gardiens de cette qualité.
