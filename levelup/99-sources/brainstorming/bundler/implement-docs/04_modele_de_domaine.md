# Modèle de domaine

## 1. Entités métier de base
- Domaine
- Sous-domaine
- Plan
- Module
- Sujet
- Concept
- Ressource
- Exercice
- Séance
- Validation
- Révision
- Erreur
- Notification
- Historique
- Paramètre système

## 2. Relations majeures
- un domaine contient plusieurs sous-domaines ;
- un plan organise plusieurs unités pédagogiques ;
- une unité contient plusieurs sujets ;
- un sujet dépend d’un ou plusieurs prérequis ;
- une séance se rattache à un objet pédagogique ;
- une validation produit une preuve de maîtrise ;
- une erreur alimente le feedback ;
- une révision corrige ou consolide un point faible ;
- une recommandation dirige vers l’action la plus utile.

## 3. Règles métier
- la progression suit les prérequis ;
- la révision prime sur la simple progression ;
- la faiblesse détectée prime sur l’objectif abstrait ;
- un sujet bloqué est prioritaire sur un sujet non critique ;
- toute décision est explicable ;
- tout état important est historisé.

## 4. États de progression
- à faire ;
- en cours ;
- à revoir ;
- validé ;
- bloqué ;
- verrouillé ;
- déverrouillé.

## 5. Découpage conceptuel recommandé
- noyau de progression ;
- noyau de recommandation ;
- noyau d’exécution de séance ;
- noyau de feedback ;
- noyau d’administration du contenu ;
- noyau d’audit et de traçabilité.
