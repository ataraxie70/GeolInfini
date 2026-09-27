# Backend NestJS pas à pas

## 1. Rôle du backend

Le backend est la partie la plus importante du projet.
Il garde la logique métier, les règles de sécurité, la validation et les calculs.

Dans Psycho-Pass, le backend doit :
- authentifier ;
- autoriser ;
- orchestrer les tests ;
- calculer les scores ;
- enregistrer les réponses ;
- exposer les données utiles ;
- protéger les actions sensibles.

## 2. Philosophie NestJS

NestJS organise le code en :
- modules ;
- controllers ;
- services ;
- DTOs ;
- guards ;
- interceptors ;
- filters ;
- providers.

Cette structure évite le code désordonné.

## 3. Rôle des composants

### Module
Regroupe une zone métier.

### Controller
Expose des routes HTTP.

### Service
Contient la logique métier.

### DTO
Décrit et valide les données reçues.

### Guard
Bloque ou autorise une route.

### Interceptor
Modifie ou observe le flux d’exécution.

### Filter
Traite les erreurs.

## 4. Pattern de base

Le schéma mental est :

**requête HTTP -> controller -> service -> base de données -> réponse**

Le controller ne doit pas devenir un énorme bloc de logique.
Le service ne doit pas être mélangé à l’UI.
La validation doit arriver tôt.

## 5. Ce qu’un junior doit apprendre

Un junior doit être capable de dire :
- où se trouve la règle métier ;
- où se trouve la route ;
- où se trouve le schéma ;
- où se trouve la validation ;
- où se trouve la sécurité ;
- où se trouve le test.

## 6. Authentification

Le backend doit :
- vérifier le mot de passe ;
- signer les tokens ;
- gérer le refresh ;
- protéger les routes ;
- transmettre seulement les données nécessaires.

## 7. Gestion des tests

Le backend doit :
- créer la session de test ;
- charger les questions ;
- vérifier les réponses ;
- calculer le résultat ;
- conserver l’historique.

## 8. Calcul du score

Le score doit être calculé sur le serveur.
Pourquoi ?
- pour éviter la triche ;
- pour garantir la cohérence ;
- pour centraliser la règle ;
- pour simplifier l’audit.

## 9. Validation

Tout ce qui entre dans le backend doit être validé.
Exemples :
- email ;
- mot de passe ;
- identifiant ;
- réponse ;
- payload JSON.

## 10. Gestion des erreurs

Les erreurs doivent être :
- lisibles ;
- cohérentes ;
- standardisées ;
- utiles au frontend ;
- sécurisées.

Évite :
- les erreurs brutes ;
- les messages trop techniques ;
- les fuites d’information sensibles.

## 11. Bonnes pratiques de service

Un service doit :
- avoir une responsabilité claire ;
- éviter le couplage excessif ;
- être testable ;
- être prévisible ;
- être lisible.

## 12. Tests backend

Teste au moins :
- les règles d’auth ;
- les permissions ;
- le calcul du score ;
- les cas d’erreur ;
- les cas limites.

## 13. Exemple d’erreur de débutant

Erreur classique :
mettre le calcul de score dans le frontend “pour aller vite”.

Pourquoi c’est mauvais :
- le client peut être modifié ;
- le calcul n’est pas fiable ;
- le résultat peut être falsifié ;
- la logique devient dupliquée.

## 14. Résumé très simple

Si tu es junior, retiens ceci :

- controller = entrée HTTP ;
- service = logique métier ;
- DTO = validation ;
- guard = protection ;
- Prisma = données ;
- backend = source de vérité métier.
