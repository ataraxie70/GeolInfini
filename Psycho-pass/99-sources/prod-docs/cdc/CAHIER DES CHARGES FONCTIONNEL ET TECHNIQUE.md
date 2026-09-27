# CAHIER DES CHARGES FONCTIONNEL ET TECHNIQUE

# Projet : Psycho-Pass
## Plateforme d’évaluation psychotechnique et de culture générale

---

# 1. INTRODUCTION

## 1.1 Présentation générale

Psycho-Pass est une plateforme web spécialisée dans les tests psychotechniques, les évaluations cognitives et la culture générale.

La plateforme a pour objectif de proposer :
- des tests d’évaluation modernes ;
- un système adaptatif intelligent ;
- un suivi détaillé des performances ;
- un espace d’entraînement et de progression ;
- une expérience fluide et responsive.

Le projet vise à devenir une solution de référence pour les étudiants, candidats aux concours, centres de formation et structures de recrutement.

---

## 1.2 Objectifs du projet

### Objectifs principaux
- Évaluer les capacités cognitives et logiques des utilisateurs.
- Fournir des tests de culture générale structurés.
- Adapter automatiquement la difficulté des questions.
- Mesurer les performances et la progression.
- Centraliser différents types de tests dans une seule plateforme.

### Objectifs secondaires
- Créer un système extensible.
- Préparer une future monétisation.
- Permettre l’intégration future d’IA adaptative.
- Prévoir une application mobile à moyen terme.

---

## 1.3 Public cible

### Cibles principales
- Étudiants
- Candidats aux concours
- Utilisateurs préparant des tests d’aptitude
- Centres de formation
- Écoles et universités

### Cibles secondaires
- Entreprises
- Cabinets de recrutement
- Organismes de certification

---

# 2. PÉRIMÈTRE DU PROJET

## 2.1 Fonctionnalités incluses dans le MVP

Le MVP (Minimum Viable Product) devra inclure les fonctionnalités suivantes :

### Gestion utilisateur
- Création de compte
- Connexion / déconnexion
- Réinitialisation du mot de passe
- Gestion du profil

### Système de tests
- Passage de tests psychotechniques
- Passage de tests de culture générale
- Questions chronométrées
- Navigation contrôlée
- Correction automatique
- Calcul des scores

### Système adaptatif
- Ajustement dynamique de la difficulté
- Estimation du niveau utilisateur
- Sélection intelligente des questions

### Tableau de bord
- Historique des tests
- Visualisation des résultats
- Statistiques personnelles
- Progression utilisateur

### Administration
- Gestion des questions
- Gestion des catégories
- Gestion des utilisateurs
- Consultation des statistiques globales

---

## 2.2 Fonctionnalités exclues du MVP

Les fonctionnalités suivantes sont reportées à une phase ultérieure :
- Application mobile native
- Mode multijoueur
- Marketplace de contenus
- Paiement intégré
- Classements mondiaux avancés
- Intelligence artificielle avancée
- Certification officielle
- Génération automatique de questions

---

# 3. DESCRIPTION FONCTIONNELLE

## 3.1 Types de tests

### 3.1.1 Tests psychotechniques

#### Raisonnement logique
- Suites logiques
- Matrices
- Analogies
- Intrus
- Dominos

#### Raisonnement numérique
- Calcul mental
- Suites numériques
- Pourcentages
- Résolution de problèmes

#### Raisonnement verbal
- Synonymes
- Antonymes
- Compréhension de texte
- Relations lexicales

#### Attention et concentration
- Recherche d’erreurs
- Comparaisons rapides
- Symboles

#### Mémoire
- Mémoire visuelle
- Mémoire de séquences
- Mémorisation rapide

#### Raisonnement spatial
- Rotation mentale
- Orientation spatiale
- Assemblage de formes

---

### 3.1.2 Tests de culture générale

Catégories prévues :
- Histoire
- Géographie
- Sciences
- Français
- Informatique
- Actualité
- Littérature
- Sport
- Musique
- Cinéma

---

## 3.2 Fonctionnement du système adaptatif

### Principe général

Le moteur adaptatif doit ajuster automatiquement la difficulté des questions selon :
- les bonnes réponses ;
- les mauvaises réponses ;
- le temps de réponse ;
- la régularité des performances.

### Règles de fonctionnement

#### Bonne réponse
- Augmentation progressive de la difficulté.

#### Mauvaise réponse
- Réduction légère de la difficulté.

#### Temps excessif
- Réduction partielle de l’indice de performance.

#### Objectif
- Déterminer le niveau réel de compétence de l’utilisateur.

---

# 4. PARCOURS UTILISATEUR

## 4.1 Inscription

L’utilisateur doit pouvoir :
- créer un compte avec email et mot de passe ;
- confirmer son inscription ;
- accéder à son espace personnel.

---

## 4.2 Passage d’un test

### Étapes
1. Choix du test.
2. Affichage des instructions.
3. Démarrage du chronomètre.
4. Réponse aux questions.
5. Ajustement adaptatif.
6. Fin du test.
7. Affichage des résultats.

---

## 4.3 Consultation des résultats

L’utilisateur doit pouvoir visualiser :
- son score global ;
- son score par catégorie ;
- son temps moyen ;
- son niveau estimé ;
- ses erreurs ;
- ses statistiques historiques.

---

# 5. SPÉCIFICATIONS FONCTIONNELLES

## 5.1 Gestion des comptes

### Fonctionnalités utilisateur
- Inscription
- Connexion
- Déconnexion
- Modification du profil
- Réinitialisation mot de passe
- Historique personnel

### Fonctionnalités administrateur
- Gestion utilisateurs
- Désactivation comptes
- Attribution des rôles

---

## 5.2 Module de test

### Fonctionnalités obligatoires
- Affichage des questions
- QCM et réponses textuelles
- Chronomètre
- Barre de progression
- Validation automatique
- Questions aléatoires

### Modes disponibles
#### Mode entraînement
- Correction immédiate
- Explications détaillées

#### Mode examen
- Résultats uniquement à la fin
- Conditions proches d’un examen réel

---

## 5.3 Module de résultats

### Données affichées
- Score final
- Taux de réussite
- Temps moyen
- Difficulté moyenne atteinte
- Évolution dans le temps

### Recommandations
Le système peut proposer :
- des catégories à renforcer ;
- des exercices adaptés ;
- des objectifs de progression.

---

## 5.4 Module d’administration

L’administrateur doit pouvoir :
- créer des catégories ;
- créer des questions ;
- modifier les niveaux ;
- ajouter des explications ;
- consulter les statistiques ;
- gérer les contenus.

---

# 6. STRUCTURE DES QUESTIONS

Chaque question devra contenir :
- identifiant unique ;
- catégorie ;
- sous-catégorie ;
- niveau de difficulté ;
- énoncé ;
- type de question ;
- liste des réponses ;
- bonne réponse ;
- explication ;
- temps recommandé ;
- statut de publication.

---

# 7. SYSTÈME DE NOTATION

## 7.1 Paramètres pris en compte

Le score final doit dépendre de :
- la justesse des réponses ;
- la difficulté ;
- la rapidité ;
- la cohérence globale.

---

## 7.2 Méthode de calcul

### Proposition MVP
- Bonne réponse : points de base
- Bonne réponse rapide : bonus léger
- Mauvaise réponse : zéro point
- Score normalisé sur 100

---

# 8. ARCHITECTURE TECHNIQUE

## 8.1 Frontend

### Technologies recommandées
- Next.js
- React
- Tailwind CSS

### Objectifs
- rapidité ;
- responsive design ;
- compatibilité mobile.

---

## 8.2 Backend

### Technologies recommandées
- Node.js
- NestJS

### Fonctions principales
- gestion des utilisateurs ;
- API sécurisée ;
- moteur adaptatif ;
- calcul des scores.

---

## 8.3 Base de données

### Technologie recommandée
- PostgreSQL

### Objectifs
- fiabilité ;
- performance ;
- évolutivité.

---

## 8.4 Hébergement

### Frontend
- Vercel

### Backend
- Railway
- Render
- VPS dédié

---

# 9. MODÉLISATION DES DONNÉES

## 9.1 Table Users

| Champ | Type |
|---|---|
| id | UUID |
| nom | VARCHAR |
| email | VARCHAR |
| mot_de_passe | TEXT |
| rôle | VARCHAR |
| date_creation | TIMESTAMP |

---

## 9.2 Table Categories

| Champ | Type |
|---|---|
| id | UUID |
| nom | VARCHAR |
| type | VARCHAR |

---

## 9.3 Table Questions

| Champ | Type |
|---|---|
| id | UUID |
| category_id | UUID |
| difficulté | INTEGER |
| énoncé | TEXT |
| type_reponse | VARCHAR |
| réponses | JSON |
| bonne_réponse | TEXT |
| explication | TEXT |
| statut | VARCHAR |

---

## 9.4 Table Tests

| Champ | Type |
|---|---|
| id | UUID |
| user_id | UUID |
| score_total | INTEGER |
| durée | INTEGER |
| niveau_estimé | INTEGER |
| date | TIMESTAMP |

---

## 9.5 Table Answers

| Champ | Type |
|---|---|
| id | UUID |
| test_id | UUID |
| question_id | UUID |
| réponse_utilisateur | TEXT |
| est_correcte | BOOLEAN |
| temps_réponse | INTEGER |

---

# 10. EXIGENCES NON FONCTIONNELLES

## 10.1 Performance
- Temps de chargement rapide
- Réactivité fluide
- Optimisation mobile

## 10.2 Sécurité
- Hashage des mots de passe
- Protection API
- Limitation des tentatives
- Protection des données utilisateurs

## 10.3 Compatibilité
- Chrome
- Firefox
- Safari
- Edge
- Mobile Android / iOS

## 10.4 Maintenabilité
- Code documenté
- Architecture modulaire
- API propre et évolutive

---

# 11. UX / UI

## 11.1 Objectifs UX
- Interface simple
- Navigation intuitive
- Expérience rapide
- Lisibilité maximale

## 11.2 Design attendu
- Moderne
- Minimaliste
- Responsive
- Professionnel

## 11.3 Pages principales
- Accueil
- Connexion
- Tableau de bord
- Passage de test
- Résultats
- Historique
- Administration

---

# 12. ANALYTICS ET STATISTIQUES

Le système devra enregistrer :
- taux de réussite ;
- temps moyen ;
- progression ;
- catégories faibles ;
- difficulté moyenne atteinte.

---

# 13. CRITÈRES DE VALIDATION

Le MVP sera considéré comme validé si :
- un utilisateur peut créer un compte ;
- un test complet peut être passé ;
- les scores sont cohérents ;
- les résultats sont sauvegardés ;
- l’administration permet d’ajouter des questions ;
- le système adaptatif fonctionne.

---

# 14. LIVRABLES ATTENDUS

Le prestataire devra fournir :
- code source frontend ;
- code source backend ;
- base de données ;
- documentation technique ;
- guide d’installation ;
- environnement de production ;
- espace d’administration.

---

# 15. PLANIFICATION DU PROJET

## Phase 1 — Conception
Durée estimée : 1 à 2 semaines

### Tâches
- Validation du périmètre
- Maquettes UI/UX
- Architecture technique
- Modélisation des données

---

## Phase 2 — Développement MVP
Durée estimée : 4 à 6 semaines

### Tâches
- Frontend
- Backend
- Authentification
- Moteur de tests
- Scoring
- Dashboard

---

## Phase 3 — Tests et corrections
Durée estimée : 1 à 2 semaines

### Tâches
- Tests fonctionnels
- Tests responsive
- Corrections bugs
- Optimisation

---

## Phase 4 — Déploiement
Durée estimée : 1 semaine

### Tâches
- Mise en production
- Configuration serveur
- Sauvegardes
- Monitoring

---

# 16. ÉVOLUTIONS FUTURES

Évolutions prévues après le MVP :
- Intelligence artificielle avancée
- Application mobile
- Système de badges
- Classements
- Paiements et abonnements
- Génération automatique de tests
- Système de certification
- Version multilingue

---

# 17. CONCLUSION

Psycho-Pass est un projet de plateforme d’évaluation psychotechnique et de culture générale conçu pour offrir une expérience moderne, adaptative et évolutive.

Le MVP doit prioritairement garantir :
- la stabilité ;
- la qualité des tests ;
- la fiabilité des scores ;
- la simplicité d’utilisation ;
- la capacité d’évolution future.

Ce cahier des charges constitue la base fonctionnelle et technique du développement du projet.
