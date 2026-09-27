# Sell Computing — Index documentaire

## Statut du projet

Nom de travail : **Sell Computing**  
Périmètre fonctionnel consolidé : **plateforme de conseil, recommandation, vente d’ordinateurs, accessoires audio et services techniques**.

## Pile documentaire normalisée

| ID | Document | Rôle |
|---|---|---|
| 01 | Vision et périmètre | Formalise la finalité, les limites et les invariants |
| 02 | Analyse des besoins et personas | Décrit les cibles, leurs douleurs et les parcours |
| 03 | Spécification fonctionnelle | Définit les fonctionnalités et règles métier |
| 04 | Modèle métier DDD | Découpe le domaine en contextes et agrégats |
| 05 | Modèle de données ERD | Fixe les entités, relations et contraintes |
| 06 | Architecture applicative | Décrit la structure logicielle et les modules |
| 07 | Spécification UX/UI | Décrit les parcours, pages et composants |
| 08 | Cahier des charges technique | Fixe la stack, l’infrastructure et l’exécution |
| 09 | Contrats d’interface API | Définit les endpoints, schémas et erreurs |
| 10 | Exigences non fonctionnelles | Sécurité, performance, observabilité, conformité |
| 11 | Feuille de route MVP | Découpe l’ordre d’exécution avant codage |

## Lecture recommandée

1. Vision et périmètre  
2. Analyse des besoins  
3. Spécification fonctionnelle  
4. Modèle métier DDD  
5. Modèle de données  
6. Architecture applicative  
7. UX/UI  
8. Cahier des charges technique  
9. API  
10. NFR  
11. Roadmap MVP

## Hypothèse d’architecture

Architecture retenue pour la phase initiale :

- front-end web public ;
- back-office d’administration ;
- back-end API REST ;
- base de données relationnelle ;
- stockage objet pour médias ;
- moteur de recherche et de filtrage ;
- moteur de recommandation explicable ;
- journalisation et audit.

## Règles de consolidation

- Le site est conçu autour du **besoin utilisateur**, non autour du catalogue.
- La recommandation est une fonction centrale, non accessoire.
- Le reconditionné est traité comme une offre de confiance, avec preuves et contrôles.
- Le périmètre initial doit rester exploitable sans dépendance à un écosystème complexe.
