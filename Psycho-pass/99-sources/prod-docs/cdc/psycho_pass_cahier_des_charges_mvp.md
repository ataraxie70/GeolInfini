# Psycho-Pass — Note de cadrage produit / base de cahier des charges

## 1. Présentation du projet
**Nom du projet :** Psycho-Pass  
**Nature :** Plateforme web d’évaluation et d’entraînement aux tests psychotechniques et à la culture générale.  
**Objectif :** permettre aux utilisateurs de s’entraîner, de passer des tests chronométrés et d’obtenir un score détaillé avec progression adaptative.

## 2. Vision produit
Psycho-Pass doit devenir une plateforme simple, rapide et fiable pour :
- évaluer le niveau logique, verbal, numérique et attentionnel d’un utilisateur ;
- proposer des tests de culture générale ;
- adapter la difficulté selon les réponses ;
- suivre la progression dans le temps ;
- fournir une expérience fluide sur mobile et ordinateur.

## 3. Public cible
- Candidats aux concours et examens
- Étudiants
- Centres de formation
- Écoles
- Professionnels en préparation de tests d’aptitude
- Utilisateurs cherchant à s’entraîner à la culture générale

## 4. Problème à résoudre
Les utilisateurs ont souvent :
- des tests dispersés sur plusieurs sites ;
- peu de retours sur leurs erreurs ;
- une difficulté mal calibrée ;
- aucune vision claire de leurs progrès.

Psycho-Pass doit centraliser l’entraînement et rendre l’évaluation plus intelligente.

## 5. Périmètre du MVP
### 5.1 Fonctionnalités incluses
- Création de compte / connexion
- Tableau de bord utilisateur
- Passage de tests
- Chronomètre intégré
- Correction automatique
- Score global et score par catégorie
- Historique des tests
- Test adaptatif simple
- Interface d’administration basique
- Gestion des catégories et des questions

### 5.2 Fonctionnalités hors MVP
- Application mobile native
- Mode multijoueur
- IA avancée de recommandation
- Certificats officiels
- Paiement / abonnement
- Classements publics détaillés
- Marketplace de contenus

## 6. Modules fonctionnels
### 6.1 Module d’authentification
- Inscription avec email et mot de passe
- Connexion / déconnexion
- Réinitialisation du mot de passe
- Profil utilisateur

### 6.2 Module de tests psychotechniques
Catégories initiales recommandées :
- Raisonnement logique
- Raisonnement numérique
- Raisonnement verbal
- Attention / concentration
- Mémoire

### 6.3 Module de culture générale
Catégories initiales recommandées :
- Histoire
- Géographie
- Sciences
- Français
- Actualité
- Sport / loisirs

### 6.4 Module adaptatif
Le moteur doit ajuster la difficulté des questions selon :
- le taux de bonnes réponses ;
- le temps de réponse ;
- la répétition des erreurs ;
- le niveau déjà estimé.

Règle simple du MVP :
- bonne réponse → la difficulté augmente légèrement ;
- mauvaise réponse → la difficulté baisse légèrement ;
- réponse trop lente → pénalité légère sur l’indice de performance.

### 6.5 Module de résultats
Affichage après test :
- score total ;
- score par catégorie ;
- temps moyen de réponse ;
- niveau estimé ;
- questions réussies / ratées ;
- recommandations de révision.

### 6.6 Module d’administration
- Créer / modifier / supprimer une question
- Créer des catégories
- Définir la difficulté
- Ajouter des explications
- Consulter les statistiques de base

## 7. Règles de notation
Le score doit être calculé à partir de :
- exactitude de la réponse ;
- temps de réponse ;
- difficulté de la question.

Proposition MVP :
- réponse correcte = points de base ;
- réponse correcte rapide = bonus léger ;
- réponse incorrecte = zéro point ;
- score final normalisé sur 100.

## 8. Structure d’une question
Chaque question doit contenir :
- ID
- catégorie
- sous-catégorie
- niveau de difficulté (1 à 10)
- énoncé
- type de réponse (QCM, saisie libre, vrai/faux)
- propositions de réponses si nécessaire
- bonne réponse
- explication
- temps estimé
- statut (brouillon / publié)

## 9. Parcours utilisateur
### Parcours standard
1. L’utilisateur crée un compte.
2. Il choisit une catégorie ou un test global.
3. Le système sélectionne une série de questions.
4. L’utilisateur répond avec chronomètre.
5. Le moteur ajuste la difficulté.
6. Le score final est généré.
7. L’utilisateur visualise ses résultats.
8. Les performances sont enregistrées dans l’historique.

## 10. Pages à prévoir
- Accueil
- Inscription / connexion
- Tableau de bord
- Choix du test
- Page de question
- Page de résultat
- Historique
- Profil
- Administration

## 11. Architecture recommandée
### Frontend
- Next.js ou React
- Tailwind CSS

### Backend
- NestJS avec Node.js et TypeScript

### Base de données
- PostgreSQL

### Authentification
- JWT
- ou OAuth Google en option

### Hébergement
- Vercel pour le frontend
- Railway / Render / VPS pour le backend

## 12. Modèle de données minimal
### Users
- id
- nom
- email
- mot_de_passe
- rôle
- date_creation

### Categories
- id
- nom
- type (psychotechnique / culture générale)

### Questions
- id
- category_id
- difficulté
- énoncé
- type_reponse
- réponses
- bonne_réponse
- explication
- statut

### Tests
- id
- user_id
- date
- score_total
- durée
- niveau_estimé

### Answers
- id
- test_id
- question_id
- réponse_utilisateur
- est_correcte
- temps_de_réponse

## 13. Exigences non fonctionnelles
- Interface responsive
- Temps de chargement rapide
- Sécurité des mots de passe
- Sauvegarde des données
- Logs d’erreurs
- Accessibilité correcte
- Code maintenable

## 14. Critères de qualité
La plateforme est considérée comme réussie si :
- un utilisateur peut s’inscrire et passer un test sans aide ;
- les scores sont cohérents ;
- les questions s’affichent correctement sur mobile ;
- l’administration permet d’ajouter du contenu facilement ;
- le test adaptatif modifie bien la difficulté.

## 15. Livrables attendus pour le développeur
- Maquettes des écrans
- Schéma de base de données
- API backend
- Interface utilisateur
- Espace admin
- Documentation technique
- Documentation de déploiement

## 16. Priorités de développement
### Priorité 1
- Authentification
- Banque de questions
- Moteur de test
- Scoring

### Priorité 2
- Adaptativité
- Historique
- Dashboard avancé

### Priorité 3
- Recommandations intelligentes
- Gamification
- Monétisation

## 17. Proposition de planning MVP
### Semaine 1–2
- cadrage final
- maquettes
- base de données

### Semaine 3–5
- développement frontend
- authentification
- affichage des tests

### Semaine 6–8
- backend
- scoring
- administration

### Semaine 9–10
- tests
- corrections
- mise en production

## 18. Résumé exécutif
Psycho-Pass est une plateforme d’évaluation et d’entraînement destinée à centraliser les tests psychotechniques et de culture générale dans une expérience adaptative, claire et mesurable. Le MVP doit être simple, robuste et extensible afin de poser une base solide pour des évolutions futures.
