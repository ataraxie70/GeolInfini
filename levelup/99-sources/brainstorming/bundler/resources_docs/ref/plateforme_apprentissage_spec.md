# Plateforme de pilotage de l’apprentissage

## 1. Rôle de la plateforme

La plateforme n’est pas un simple site web. Elle sert de **système de pilotage de l’apprentissage**.

Son rôle est de :

- structurer le parcours d’étude ;
- afficher les sujets à faire dans le bon ordre ;
- enregistrer les séances ;
- suivre les validations ;
- déclencher les révisions ;
- signaler les écarts de trajectoire ;
- conserver l’historique des progrès.

La plateforme doit servir le plan d’apprentissage, pas l’inverse.

---

## 2. Objectif fonctionnel

La plateforme doit permettre de répondre à 6 questions en permanence :

1. Que dois-je étudier maintenant ?
2. Pourquoi ce sujet vient-il à ce moment-là ?
3. Quel est le prérequis ?
4. Qu’ai-je réellement compris ?
5. Qu’est-ce qui doit être revu ?
6. Où en suis-je dans ma progression globale ?

---

## 3. Principes de conception

### 3.1 Simplicité d’abord
La plateforme doit être construite avec une base simple, puis enrichie progressivement.

### 3.2 Traçabilité
Chaque action importante doit laisser une trace :
- séance ;
- exercice ;
- validation ;
- révision ;
- correction.

### 3.3 Discipline
La plateforme doit contraindre la progression.
Elle ne doit pas permettre de sauter d’un sujet à l’autre sans justification.

### 3.4 Local-first
Le système peut être utilisé en local au départ.
Le fonctionnement principal doit rester possible sans dépendre d’un service externe.

### 3.5 Extensibilité
La plateforme doit pouvoir évoluer vers :
- web local ;
- notifications ;
- tableau de bord ;
- synchronisation ;
- accès mobile.

---

## 4. Modules fonctionnels

### 4.1 Module de plan d’étude
Contient :
- domaines ;
- sous-domaines ;
- séquences ;
- prérequis ;
- niveaux ;
- progression attendue.

Fonction :
- afficher l’ordre des sujets ;
- bloquer l’accès aux sujets non autorisés par dépendance ;
- indiquer la prochaine étape logique.

### 4.2 Module de séance
Contient :
- date ;
- durée ;
- sujet étudié ;
- activité réalisée ;
- difficulté ;
- résultat ;
- note de fin.

Fonction :
- enregistrer ce qui a été fait réellement ;
- comparer le plan prévu avec l’exécution.

### 4.3 Module de validation
Contient :
- sujet ;
- critères de validation ;
- statut ;
- date de validation ;
- points faibles ;
- retour nécessaire.

Fonction :
- décider si un sujet est acquis, à revoir ou rejeté.

### 4.4 Module de révision
Contient :
- sujet à revoir ;
- échéance ;
- priorité ;
- type de révision ;
- état de complétion.

Fonction :
- générer les rappels de révision ;
- éviter l’oubli ;
- maintenir la consolidation.

### 4.5 Module de projet
Contient :
- projets en cours ;
- lien avec les sujets appris ;
- avancement ;
- dépendances ;
- livrables.

Fonction :
- transformer l’apprentissage en réalisation concrète.

### 4.6 Module de tableau de bord
Contient :
- progression globale ;
- sujets validés ;
- sujets en retard ;
- nombre de révisions dues ;
- blocages ;
- tendance hebdomadaire.

Fonction :
- donner une vue immédiate de l’état du système.

---

## 5. Flux d’utilisation

### 5.1 Avant la séance
- la plateforme affiche le sujet du jour ;
- elle rappelle les prérequis ;
- elle rappelle l’objectif attendu ;
- elle signale les révisions dues.

### 5.2 Pendant la séance
- l’utilisateur note ce qu’il fait ;
- il indique les blocages ;
- il enregistre les réponses ;
- il associe la séance au sujet concerné.

### 5.3 Après la séance
- la séance est clôturée ;
- un statut est appliqué ;
- un rappel de révision est généré ;
- la progression est mise à jour.

---

## 6. Structure des données

### 6.1 Entités principales
- **Domaine**
- **Sous-domaine**
- **Sujet**
- **Prérequi**s
- **Séance**
- **Exercice**
- **Validation**
- **Révision**
- **Projet**
- **Notification**

### 6.2 Relations principales
- un domaine contient plusieurs sous-domaines ;
- un sous-domaine contient plusieurs sujets ;
- un sujet peut dépendre de plusieurs prérequis ;
- un sujet peut avoir plusieurs séances ;
- une séance peut produire une validation ;
- une validation peut créer plusieurs révisions ;
- un projet peut dépendre de plusieurs sujets.

---

## 7. États de progression

Chaque sujet doit avoir un état unique :

- **À faire**
- **En cours**
- **À réviser**
- **Validé**
- **Bloqué**

Règles :
- un sujet validé ne repasse pas en cours sans raison ;
- un sujet bloqué doit afficher le prérequis manquant ;
- un sujet à réviser doit apparaître dans le calendrier.

---

## 8. Mécanisme de discipline

La plateforme doit intégrer des règles fortes.

### Règle 1
Un sujet ne peut pas être marqué validé sans preuve minimale.

### Règle 2
Une séance sans note finale reste incomplète.

### Règle 3
Un sujet sans révision programmée est considéré comme fragile.

### Règle 4
Un projet ne peut pas être avancé si les sujets requis ne sont pas validés.

### Règle 5
Le tableau de bord doit rendre visibles les retards et les blocages.

---

## 9. Architecture technique cible

## 9.1 Version initiale
La première version doit rester simple.

Composants :
- interface web locale ;
- serveur applicatif ;
- base de données ;
- moteur de règles ;
- système de notifications.

## 9.2 Version évoluée
Ensuite, la plateforme pourra intégrer :
- authentification ;
- synchronisation ;
- export/import ;
- journal technique ;
- statistiques ;
- notifications multi-canaux.

---

## 10. Stack recommandée

### Backend
- Python avec Flask ou FastAPI pour une base simple et rapide à construire.

### Frontend
- HTML, CSS, JavaScript au départ ;
- puis éventuellement un frontend plus structuré si nécessaire.

### Base de données
- SQLite pour la première version ;
- puis PostgreSQL si la plateforme grandit.

### Notifications
- notifications locales ;
- notifications web ;
- plus tard intégration mobile ou messagerie.

### Déploiement
- utilisation locale sur machine personnelle ;
- serveur local accessible dans le réseau ;
- possibilité d’évolution vers un service plus stable.

---

## 11. Ordre de construction

### Phase 1 — Socle minimal
- sujets ;
- séances ;
- validations ;
- révisions.

### Phase 2 — Tableaux de bord
- progression ;
- filtres ;
- états ;
- blocages.

### Phase 3 — Automatisation
- rappels ;
- règles ;
- alertes ;
- révisions programmées.

### Phase 4 — Projets et historique
- lien entre apprentissage et projets ;
- historisation ;
- export ;
- résumé global.

### Phase 5 — Extension avancée
- amélioration de l’ergonomie ;
- synchronisation ;
- accès mobile ;
- notifications externes.

---

## 12. Priorité réelle du développement

L’ordre de développement doit être :

1. modèle de données ;
2. logique de progression ;
3. enregistrement des séances ;
4. validation ;
5. révision ;
6. tableau de bord ;
7. notifications ;
8. amélioration visuelle.

---

## 13. Résultat attendu

La plateforme doit produire trois effets :

- **clarté** : savoir quoi faire ;
- **contrôle** : savoir où l’on en est ;
- **discipline** : empêcher la dispersion.

Si elle ne fait pas ces trois choses, elle est mal conçue.

