# Frontend Next.js pas à pas

## 1. Rôle du frontend

Le frontend est la couche visible du produit.
Il sert à guider l’utilisateur, afficher les données et collecter les actions.

Dans Psycho-Pass, le frontend doit :
- afficher les écrans ;
- gérer la navigation ;
- afficher les formulaires ;
- envoyer les requêtes API ;
- gérer les états de chargement ;
- afficher les erreurs ;
- montrer les résultats renvoyés par le backend.

## 2. Ce que le frontend ne doit pas faire

Le frontend ne doit pas :
- recalculer un score critique ;
- décider d’une autorisation ;
- inventer des données ;
- modifier la vérité métier ;
- contourner l’API.

## 3. Structure mentale d’une page

Une page contient souvent :
- une mise en page ;
- un titre ;
- une action utilisateur ;
- un état de chargement ;
- un état d’erreur ;
- un affichage de résultat.

## 4. Écrans importants du MVP

- accueil ;
- connexion ;
- inscription ;
- dashboard ;
- liste des tests ;
- passation du test ;
- résultat ;
- historique.

## 5. Composants réutilisables

Il faut chercher à réutiliser :
- boutons ;
- champs de formulaire ;
- cartes ;
- badges ;
- modales ;
- alertes ;
- tableaux ;
- barres de progression.

## 6. Gestion des données

Le frontend doit se comporter comme un client de l’API.
Il récupère :
- un token ;
- des données utilisateur ;
- des tests ;
- des réponses ;
- des résultats.

Il ne doit pas inventer la logique de persistance.

## 7. Gestion de l’état

L’état correspond aux données manipulées dans l’interface.

Exemples :
- utilisateur connecté ;
- test en cours ;
- question courante ;
- chargement ;
- erreur ;
- résultat final.

## 8. Gestion d’erreurs

Un bon frontend :
- explique clairement l’erreur ;
- ne casse pas toute la page ;
- permet de réessayer ;
- évite les messages obscurs.

## 9. UX de base

La qualité de l’interface repose sur :
- la lisibilité ;
- la hiérarchie visuelle ;
- la cohérence ;
- la simplicité ;
- l’accessibilité.

## 10. Accessibilité minimale

Pense à :
- des labels clairs ;
- des contrastes lisibles ;
- un ordre logique ;
- une navigation clavier ;
- des messages d’erreur compréhensibles.

## 11. Séparation des responsabilités

Le frontend doit être organisé ainsi :
- pages ;
- composants ;
- services API ;
- hooks ;
- utilitaires ;
- types partagés.

## 12. Appels API

L’appel API doit être centralisé autant que possible pour éviter la duplication et les incohérences.

## 13. Erreur classique de débutant

Erreur fréquente :
mettre du calcul métier dans le composant UI.

Mieux :
- le composant affiche ;
- le service backend calcule ;
- le frontend consomme la réponse.

## 14. Résumé à retenir

Le frontend :
- montre ;
- collecte ;
- orchestre l’interface.

Le backend :
- décide ;
- calcule ;
- sécurise.

Cette séparation est essentielle.
