# Contrats API

## 1. Principe
L’API expose les cas d’usage ; elle ne contient pas la logique métier profonde.

## 2. Familles d’endpoints
- domaines ;
- plans ;
- unités ;
- sujets ;
- concepts ;
- ressources ;
- séances ;
- validations ;
- révisions ;
- recommandations ;
- orchestrateur ;
- audit ;
- paramètres.

## 3. Règles de contrat
- schémas d’entrée et de sortie stricts ;
- messages d’erreur homogènes ;
- codes HTTP cohérents ;
- pagination si nécessaire ;
- filtrage et recherche explicites ;
- validation Pydantic ou équivalent.

## 4. Contrats de décision
Les endpoints des moteurs doivent exposer :
- la décision ;
- les raisons ;
- les dépendances ;
- les éléments bloquants ;
- la prochaine action recommandée.

## 5. Contrats d’écriture
Toute opération d’écriture doit :
- valider les prérequis ;
- enregistrer l’audit ;
- renvoyer l’état post-opération ;
- refuser les entrées incohérentes.
