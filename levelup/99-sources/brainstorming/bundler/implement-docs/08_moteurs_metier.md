# Moteurs métier

## 1. Progression Engine
Rôle :
- décider du verrouillage ;
- décider du déverrouillage ;
- décider de la validation ;
- décider du passage en révision ;
- produire une décision explicable.

Entrées :
- état de maîtrise ;
- prérequis ;
- score de validation ;
- historique ;
- statut de révision.

Sorties :
- lock ;
- unlock ;
- validate ;
- review ;
- block ;
- explanation.

## 2. Recommendation Engine
Rôle :
- décider quoi faire ensuite ;
- classer les actions par utilité ;
- privilégier la correction d’un point faible ;
- conserver l’ordre pédagogique.

Entrées :
- état de progression ;
- erreurs observées ;
- charge de travail ;
- niveau de maîtrise ;
- ressources disponibles.

Sorties :
- ressource à lire ;
- exercice à faire ;
- sujet à réviser ;
- séance à lancer ;
- sujet à débloquer.

## 3. Session Execution Engine
Rôle :
- transformer une décision abstraite en séance réelle ;
- suivre l’exécution ;
- enregistrer la durée ;
- capturer les résultats ;
- mettre à jour les états métier.

## 4. Feedback Engine
Rôle :
- classer les erreurs ;
- relier l’erreur à un concept ;
- produire une cause probable ;
- proposer une action corrective.

## 5. Orchestrateur central
Rôle :
- relier progression, recommandation, séance et feedback ;
- produire une décision unifiée ;
- servir de cerveau d’exécution du système.

## 6. Propriété commune
Chaque moteur doit être :
- déterministe ;
- testable ;
- explicable ;
- audit-able ;
- découplé des effets secondaires.
