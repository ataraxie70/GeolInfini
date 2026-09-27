# Architecture technique détaillée
## Plateforme de pilotage de l’apprentissage

### 1. Objectif de l’architecture

L’architecture doit permettre de construire une plateforme locale, disciplinée, extensible et simple à maintenir. Elle doit séparer clairement :

- l’interface utilisateur ;
- la logique applicative ;
- les données ;
- les règles métier ;
- les notifications ;
- l’historique et la traçabilité.

Le système doit rester fonctionnel en local dès la première version.

---

## 2. Choix technologiques recommandés

### 2.1 Front-end
**React + Vite + TypeScript**

Justification : React est conçu autour de composants réutilisables pour construire des interfaces modulaires, et la documentation officielle recommande les composants fonctionnels pour les nouveaux développements. Vite fournit un outillage de développement rapide pour les applications web modernes. ([react.dev](https://react.dev/?utm_source=chatgpt.com))

### 2.2 Back-end
**FastAPI + Python**

Justification : FastAPI est un framework web moderne basé sur les annotations de type Python, avec une documentation automatique OpenAPI/Swagger intégrée. Il est adapté à la construction d’API claires et structurées. ([fastapi.tiangolo.com](https://fastapi.tiangolo.com/?utm_source=chatgpt.com))

### 2.3 Base de données
**SQLite pour la première version**

Justification : SQLite est une bibliothèque C autonome, légère, fiable et embarquée. Elle convient bien à une application locale, à un prototype sérieux et à une première version structurée. ([sqlite.org](https://sqlite.org/?utm_source=chatgpt.com))

### 2.4 Outils de développement
- Git pour le versionnement du code.
- Outils de migration de base de données.
- Environnement de développement local séparé de l’environnement d’exécution.

---

## 3. Vue d’ensemble de l’architecture

### 3.1 Architecture logique
La plateforme est organisée en 5 couches :

1. **Couche présentation**
   - interface web ;
   - tableaux de bord ;
   - formulaires ;
   - pages de suivi.

2. **Couche API**
   - endpoints REST ;
   - validation des entrées ;
   - gestion des réponses ;
   - exposition des données au front-end.

3. **Couche métier**
   - règles de progression ;
   - gestion des prérequis ;
   - validation des sujets ;
   - génération des révisions ;
   - logique de blocage.

4. **Couche données**
   - stockage des domaines ;
   - stockage des sujets ;
   - stockage des séances ;
   - stockage des validations ;
   - stockage des révisions ;
   - stockage des projets ;
   - journalisation.

5. **Couche système**
   - exécution locale ;
   - planification ;
   - notifications ;
   - sauvegarde ;
   - journal technique.

---

## 4. Architecture front-end

### 4.1 Rôle du front-end
Le front-end est responsable de :
- l’affichage du plan d’apprentissage ;
- la navigation entre domaines et sujets ;
- la saisie des séances ;
- la visualisation des validations ;
- la consultation des révisions ;
- la lecture du tableau de bord.

### 4.2 Découpage en composants React
Le front-end doit être décomposé en composants simples et réutilisables, conformément à la logique de React basée sur les composants. ([react.dev](https://react.dev/?utm_source=chatgpt.com))

Composants recommandés :
- `AppShell` : structure globale ;
- `Sidebar` : navigation ;
- `DashboardCards` : indicateurs clés ;
- `SubjectList` : liste des sujets ;
- `SubjectDetail` : détail d’un sujet ;
- `SessionForm` : saisie d’une séance ;
- `ValidationPanel` : validation d’un sujet ;
- `RevisionList` : révisions programmées ;
- `ProjectBoard` : projets ;
- `ActivityLog` : historique.

### 4.3 Organisation du front-end
Le front-end doit être organisé par fonctionnalité, non par type de fichier uniquement.

Exemple :
- `pages/` ;
- `components/` ;
- `features/` ;
- `services/` ;
- `hooks/` ;
- `types/` ;
- `utils/`.

### 4.4 Interface cible
L’interface doit rester :
- lisible ;
- rapide à parcourir ;
- adaptée à un usage fréquent ;
- orientée tableau de bord.

### 4.5 Choix React ou alternative
Pour cette plateforme, **React est un bon choix** parce que l’interface repose sur plusieurs blocs réutilisables : progression, séances, validation, révisions, projets, historique. Cette structure correspond naturellement au modèle composant de React. ([react.dev](https://react.dev/?utm_source=chatgpt.com))

---

## 5. Architecture back-end

### 5.1 Rôle du back-end
Le back-end doit :
- exposer les données au front-end ;
- appliquer les règles métier ;
- gérer la persistance ;
- calculer la progression ;
- déclencher les révisions ;
- enregistrer l’historique ;
- préparer les notifications.

### 5.2 Style d’API
L’API doit être de type REST, avec des ressources claires et stables.

Exemples de ressources :
- `/domains`
- `/subjects`
- `/prerequisites`
- `/sessions`
- `/validations`
- `/revisions`
- `/projects`
- `/dashboard`
- `/notifications`

### 5.3 Structure métier
Le back-end doit être découpé en 4 blocs :

1. **Services de domaine**
   - logique d’organisation des sujets ;
   - gestion des dépendances.

2. **Services de suivi**
   - séances ;
   - validations ;
   - révisions.

3. **Services de synthèse**
   - calcul de progression ;
   - état global ;
   - blocages.

4. **Services techniques**
   - notifications ;
   - export ;
   - journalisation.

### 5.4 Pourquoi FastAPI
FastAPI est pertinent ici parce qu’il fournit une base moderne pour construire une API avec typage, validation et documentation automatique. ([fastapi.tiangolo.com](https://fastapi.tiangolo.com/?utm_source=chatgpt.com))

---

## 6. Architecture des données

### 6.1 Choix initial
SQLite doit être utilisé au départ pour garder une architecture simple, locale et autonome. SQLite est une bibliothèque embarquée, self-contained, et adaptée à une première version locale. ([sqlite.org](https://sqlite.org/?utm_source=chatgpt.com))

### 6.2 Entités principales
Les entités minimales sont :
- `domain`
- `subdomain`
- `subject`
- `prerequisite`
- `session`
- `validation`
- `revision`
- `project`
- `notification`
- `activity_log`

### 6.3 Relations principales
- un domaine contient plusieurs sous-domaines ;
- un sous-domaine contient plusieurs sujets ;
- un sujet a zéro ou plusieurs prérequis ;
- un sujet a plusieurs séances ;
- un sujet a zéro ou plusieurs validations ;
- une validation peut créer plusieurs révisions ;
- un projet peut lier plusieurs sujets ;
- chaque action importante peut produire une entrée d’historique.

### 6.4 Règles de stockage
- chaque sujet doit avoir un état unique ;
- chaque séance doit être historisée ;
- chaque validation doit garder la trace du résultat ;
- chaque révision doit conserver son échéance ;
- chaque blocage doit garder le prérequis manquant.

---

## 7. Moteur de règles

Le moteur de règles est le cœur de la discipline.

### 7.1 Règles à implémenter
- blocage si prérequis non validés ;
- validation si preuve minimale enregistrée ;
- génération automatique des révisions ;
- mise à jour des états ;
- mise en évidence des retards.

### 7.2 Statuts d’un sujet
- `to_do`
- `in_progress`
- `to_review`
- `validated`
- `blocked`

### 7.3 Calcul de progression
La progression doit être calculée à partir :
- du nombre de sujets validés ;
- du nombre de sujets en retard ;
- du nombre de révisions en attente ;
- du poids des sujets critiques.

---

## 8. Module de notifications

### 8.1 Rôle
Le module de notifications sert à rappeler :
- les séances à venir ;
- les révisions dues ;
- les sujets bloqués ;
- les validations à finaliser ;
- les écarts de progression.

### 8.2 Niveau initial
La première version peut se limiter à :
- notifications dans l’interface ;
- alertes locales ;
- badges de rappel.

### 8.3 Évolution possible
Ensuite, le système peut évoluer vers :
- notifications navigateur ;
- notifications système ;
- notifications sur appareil mobile ;
- export vers d’autres canaux.

---

## 9. Module projet

Le module projet doit relier l’apprentissage à la production.

### Fonctions
- créer un projet ;
- lier les sujets nécessaires ;
- suivre l’avancement ;
- lister les livrables ;
- bloquer l’avancée si les prérequis ne sont pas validés.

---

## 10. Sécurité et contrôle d’accès

Même pour un usage local, la plateforme doit prévoir une séparation claire des responsabilités.

### Exigences
- authentification locale ;
- protection des actions sensibles ;
- journalisation des changements ;
- sauvegarde des données ;
- possibilité de restauration.

---

## 11. Déploiement cible

### 11.1 Déploiement local
La première version doit fonctionner en local sur une machine personnelle.

### 11.2 Composants de déploiement
- front-end généré en application web ;
- back-end Python ;
- base SQLite ;
- stockage des fichiers de projet ;
- logs locaux.

### 11.3 Évolution
L’architecture doit rester extensible vers un déploiement plus stable plus tard, sans réécriture complète.

---

## 12. Ordre de développement recommandé

1. modèle de données ;
2. API de base ;
3. interface des sujets ;
4. séance ;
5. validation ;
6. révision ;
7. tableau de bord ;
8. projet ;
9. notifications ;
10. journal et export.

---

## 13. Découpage MVP

Le MVP doit contenir uniquement :
- domaines ;
- sous-domaines ;
- sujets ;
- séances ;
- validations ;
- révisions ;
- tableau de bord simple.

Tout le reste vient après.

---

## 14. Conclusion

L’architecture cible la plus cohérente pour ce besoin est :
- **React + Vite** pour une interface composantée et rapide à développer ;
- **FastAPI** pour une API structurée et documentée ;
- **SQLite** pour une base locale simple et fiable au départ. ([react.dev](https://react.dev/?utm_source=chatgpt.com))

Cette combinaison est adaptée à une plateforme locale, disciplinée, évolutive et centrée sur le suivi concret de l’apprentissage.

