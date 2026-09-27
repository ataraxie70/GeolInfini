# Cahier des Charges — Plateforme de Tests Psychotechniques et Culture Générale

## 1. Présentation du projet

### Nom provisoire

**Psycho-pass**

### Objectif

Créer une plateforme web moderne permettant :

* l’évaluation cognitive,
* l’entraînement aux tests psychotechniques,
* l’évaluation de culture générale,
* l’analyse des performances,
* l’adaptation dynamique de la difficulté selon le niveau du candidat.

La plateforme doit fonctionner sur :

* ordinateur,
* tablette,
* smartphone.

---

# 2. Public cible

## Utilisateurs visés

* Étudiants
* Candidats aux concours
* Recruteurs
* Centres de formation
* Écoles
* Entreprises
* Personnes préparant des tests d’aptitude

---

# 3. Objectifs fonctionnels

La plateforme devra permettre :

### Pour les utilisateurs

* Créer un compte
* Passer des tests
* Voir les résultats
* Suivre la progression
* Recevoir des recommandations
* S’entraîner librement

### Pour les administrateurs

* Créer des tests
* Ajouter des questions
* Modifier les niveaux
* Voir les statistiques globales
* Gérer les utilisateurs

---

# 4. Types de tests à intégrer

## 4.1 Tests psychotechniques

### Raisonnement logique

* Suites logiques
* Matrices
* Analogies
* Dominos
* Intrus

### Raisonnement numérique

* Calcul mental
* Pourcentages
* Problèmes mathématiques
* Suites numériques

### Raisonnement verbal

* Synonymes
* Antonymes
* Compréhension de texte
* Relations lexicales

### Mémoire

* Mémoire visuelle
* Mémoire auditive
* Séquences

### Attention et concentration

* Recherche d’erreurs
* Comparaisons rapides
* Symboles

### Spatial / visuel

* Rotation mentale
* Assemblage de formes
* Orientation spatiale

---

## 4.2 Culture générale

### Catégories

* Histoire
* Géographie
* Sciences
* Informatique
* Actualité
* Français
* Littérature
* Cinéma
* Sport
* Musique

---

# 5. Fonctionnement adaptatif

## Principe

La difficulté des questions évolue selon les réponses du candidat.

### Règles

* Bonne réponse → difficulté augmente
* Mauvaise réponse → difficulté diminue
* Temps de réponse pris en compte
* Niveau recalculé en temps réel

### Objectif

Identifier :

* le niveau réel,
* la rapidité,
* la stabilité cognitive,
* les limites de performance.

---

# 6. Fonctionnalités détaillées

# 6.1 Gestion des comptes

## Utilisateur

* Inscription
* Connexion
* Mot de passe oublié
* Profil personnel
* Historique des tests

## Admin

* Gestion utilisateurs
* Suspension comptes
* Gestion contenus

---

# 6.2 Module de test

## Fonctionnalités

* Questions chronométrées
* Navigation contrôlée
* Questions aléatoires
* Affichage progressif
* Barre de progression
* Validation automatique

## Modes

### Mode entraînement

* Correction immédiate
* Explications

### Mode examen

* Pas de correction immédiate
* Score final uniquement

---

# 6.3 Système de notation

## Critères

* Exactitude
* Temps de réponse
* Niveau de difficulté
* Régularité

## Résultats affichés

* Score global
* Score par catégorie
* Temps moyen
* Niveau estimé
* Graphiques de progression

---

# 6.4 Tableau de bord utilisateur

## Affichage

* Derniers tests
* Progression
* Classement
* Statistiques
* Recommandations

---

# 6.5 Tableau de bord administrateur

## Fonctions

* Ajouter/modifier questions
* Créer des catégories
* Créer des examens
* Voir statistiques globales
* Exporter données

---

# 7. Intelligence adaptative

## Algorithme

Le moteur devra :

* ajuster la difficulté,
* détecter le niveau utilisateur,
* éviter les répétitions,
* équilibrer les catégories.

## Paramètres

* difficulté 1 → 10
* temps moyen attendu
* poids des questions
* seuils de progression

---

# 8. Base de données

## Tables principales

### Users

* id
* nom
* email
* mot_de_passe
* rôle
* niveau_global

### Questions

* id
* catégorie
* difficulté
* question
* réponses
* bonne_réponse
* explication

### Tests

* id
* utilisateur
* score
* date
* durée

### Results

* statistiques détaillées

---

# 9. Technologies recommandées

## Frontend

* React
* Next.js
* Tailwind CSS

## Backend

* Node.js
* NestJS

## Base de données

* PostgreSQL

## Authentification

* JWT
* OAuth Google

## Hébergement

* Vercel
* Railway
* AWS
* DigitalOcean

---

# 10. Design UX/UI

## Style attendu

* Moderne
* Minimaliste
* Rapide
* Responsive

## Pages importantes

* Landing page
* Page test
* Dashboard
* Résultats
* Admin panel

---

# 11. Sécurité

## Obligatoire

* Chiffrement mots de passe
* Protection anti-triche
* Limitation tentatives
* Sauvegarde automatique
* Protection API

---

# 12. Statistiques et analytics

## Données analysées

* Temps moyen
* Taux de réussite
* Questions difficiles
* Niveau moyen
* Progression utilisateur

---

# 13. Gamification (optionnel)

## Possibilités

* Badges
* Niveaux
* Classements
* Récompenses
* Séries quotidiennes

---

# 14. Monétisation (optionnel)

## Modèles

* Gratuit + Premium
* Abonnement mensuel
* Vente de packs de tests
* Entreprises / écoles

---

# 15. Version MVP recommandée

## Première version

### Inclure :

* Authentification
* 5 catégories
* 200 questions
* Score automatique
* Dashboard simple
* Admin basique

### Exclure temporairement :

* IA avancée
* Multijoueur
* Classement mondial

---

# 16. Roadmap de développement

## Phase 1

Conception

* maquettes
* architecture
* base de données

## Phase 2

Développement MVP

* frontend
* backend
* authentification

## Phase 3

Tests

* sécurité
* performance
* UX

## Phase 4

Déploiement

## Phase 5

Améliorations

* IA
* personnalisation
* mobile app

---

# 17. Livrables attendus

* Site web complet
* API backend
* Base de données
* Interface admin
* Documentation technique
* Documentation utilisateur

---

# 18. Estimation du projet

## Temps estimé

### MVP :

2 à 4 mois

### Version complète :

6 à 12 mois

---

# 19. Équipe recommandée

* 1 développeur frontend
* 1 développeur backend
* 1 designer UI/UX
* 1 expert psychométrie
* 1 administrateur contenu

---

# 20. Vision future

Évoluer vers :

* une plateforme de recrutement,
* des évaluations certifiantes,
* des tests IA adaptatifs,
* une application mobile,
* un système multilingue,
* une marketplace de tests.
