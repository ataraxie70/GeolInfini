# RFC-003 — Backend Core Engine
## Projet : Psycho-Pass
### Statut : Draft
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit l’architecture fonctionnelle et technique du backend central du projet Psycho-Pass.

Le backend est le moteur principal de la plateforme. Il a pour rôle de contrôler toutes les règles métier critiques, notamment :
- l’authentification ;
- la gestion des tests ;
- la sélection des questions ;
- le moteur adaptatif ;
- le calcul des scores ;
- l’enregistrement des réponses ;
- la gestion des résultats ;
- les permissions ;
- l’administration ;
- l’analytics.

Ce RFC sert de référence pour toute l’implémentation backend.

---

# 2. RÔLE DU BACKEND DANS LE SYSTÈME

Le backend est la source de vérité fonctionnelle de Psycho-Pass.

Il doit garantir que :
- les règles métier sont appliquées de manière cohérente ;
- les résultats sont fiables ;
- les sessions de test sont contrôlées ;
- les permissions sont respectées ;
- les données critiques ne dépendent jamais du frontend ;
- les calculs sensibles ne sont pas exposés côté client.

## Principe fondamental
### Le frontend affiche, le backend décide.

---

# 3. OBJECTIFS TECHNIQUES DU BACKEND

## 3.1 Fiabilité
Le backend doit produire des résultats stables, cohérents et vérifiables.

## 3.2 Sécurité
Le backend doit protéger les données, les accès et les calculs critiques.

## 3.3 Évolutivité
Le backend doit pouvoir évoluer vers :
- davantage d’utilisateurs ;
- plus de tests ;
- plus de catégories ;
- des traitements asynchrones ;
- des microservices à long terme.

## 3.4 Maintenabilité
Le code doit rester modulaire, testable et facile à faire évoluer.

---

# 4. PÉRIMÈTRE FONCTIONNEL DU BACKEND

## 4.1 Modules obligatoires
Le backend du MVP doit inclure les modules suivants :
- Authentification ;
- Gestion des utilisateurs ;
- Gestion des questions ;
- Test Engine ;
- Adaptive Engine ;
- Scoring Engine ;
- Results Engine ;
- Admin Engine ;
- Analytics Engine ;
- Audit / Logs.

---

# 5. ARCHITECTURE GÉNÉRALE DU BACKEND

## 5.1 Style d’architecture
Le backend adopte une architecture modulaire organisée par domaine métier.

### Structure recommandée
```text
src/
 ├── auth/
 ├── users/
 ├── questions/
 ├── tests/
 ├── adaptive-engine/
 ├── scoring/
 ├── results/
 ├── admin/
 ├── analytics/
 ├── common/
 ├── config/
 └── database/
```

## 5.2 Principes d’architecture
- séparation stricte des responsabilités ;
- dépendances minimales entre modules ;
- logique métier isolée dans les services ;
- contrôleurs légers ;
- accès base de données centralisé ;
- validation systématique des entrées.

---

# 6. STACK BACKEND OFFICIELLE

Ce RFC s’appuie sur la stack validée dans le RFC-002.

## 6.1 Technologies retenues
- NestJS
- TypeScript
- PostgreSQL
- Prisma
- JWT
- Swagger / OpenAPI
- Zod ou class-validator selon la couche
- Redis en option pour cache / queue
- BullMQ en option pour traitement asynchrone

---

# 7. RESPONSABILITÉS DES MODULES

## 7.1 Auth Module

### Responsabilités
- inscription ;
- connexion ;
- déconnexion ;
- renouvellement de session ;
- reset mot de passe ;
- contrôle des rôles.

### Fonctions attendues
- hash des mots de passe ;
- génération de JWT ;
- refresh token ;
- vérification d’accès.

### Règle
Aucune route sensible ne doit être accessible sans contrôle d’authentification approprié.

---

## 7.2 Users Module

### Responsabilités
- création utilisateur ;
- lecture profil ;
- mise à jour profil ;
- historique de base ;
- statut du compte.

### Données gérées
- identité ;
- email ;
- rôle ;
- statut ;
- préférences de base.

---

## 7.3 Questions Module

### Responsabilités
- stockage des questions ;
- lecture filtrée par catégorie et difficulté ;
- gestion des statuts ;
- gestion des explications ;
- support des types de réponses.

### Types supportés
- QCM ;
- vrai/faux ;
- saisie libre ;
- sélection multiple si nécessaire.

---

## 7.4 Test Engine Module

### Responsabilités
- création d’une session de test ;
- sélection des questions ;
- contrôle du déroulé ;
- suivi du temps ;
- réception des réponses ;
- clôture du test.

### Règles
- une session de test doit être identifiée de manière unique ;
- l’ordre des questions peut être déterministe ou aléatoire selon le type de test ;
- le backend doit enregistrer chaque réponse avec son temps de réponse ;
- la session doit pouvoir être finalisée proprement.

---

## 7.5 Adaptive Engine Module

### Responsabilités
- ajuster la difficulté des questions ;
- estimer le niveau de l’utilisateur ;
- adapter la sélection des questions ;
- éviter les répétitions trop proches ;
- maintenir un équilibre entre catégories.

### Entrées principales
- historique des réponses ;
- temps de réponse ;
- taux de réussite ;
- niveau courant ;
- catégorie concernée.

### Sorties principales
- nouvelle difficulté cible ;
- estimation du niveau ;
- prochaine question ou lot de questions ;
- signal de stabilisation ou progression.

### Règle de base MVP
- bonne réponse → difficulté légèrement augmentée ;
- mauvaise réponse → difficulté légèrement réduite ;
- réponse trop lente → ajustement négatif léger sur l’indice de performance ;
- répétition excessive d’erreurs → priorisation d’un niveau inférieur.

---

## 7.6 Scoring Module

### Responsabilités
- calcul du score brut ;
- calcul du score normalisé ;
- pondération des réponses ;
- prise en compte du temps ;
- attribution du score par catégorie ;
- consolidation du score final.

### Règles de calcul
Le scoring doit être entièrement calculé côté backend.

### Principes
- la bonne réponse apporte des points ;
- la difficulté de la question influence la valeur des points ;
- la rapidité peut apporter un bonus léger ;
- la mauvaise réponse apporte zéro point ou pénalité selon le mode de test ;
- le score final doit être normalisé sur 100 pour le MVP.

### Sorties
- score global ;
- score par catégorie ;
- score par sous-catégorie ;
- indicateurs de performance ;
- niveau estimé.

---

## 7.7 Results Module

### Responsabilités
- générer le résultat final ;
- enregistrer le résultat ;
- exposer les données de restitution ;
- fournir les statistiques de session.

### Données affichées
- score final ;
- durée totale ;
- temps moyen par question ;
- taux de réussite ;
- catégories fortes et faibles ;
- progression par rapport aux sessions précédentes.

---

## 7.8 Admin Module

### Responsabilités
- gestion des questions ;
- gestion des catégories ;
- gestion des sessions de test ;
- gestion des utilisateurs ;
- consultation des statistiques.

### Permissions
Accessible uniquement aux rôles autorisés.

---

## 7.9 Analytics Module

### Responsabilités
- calculer les métriques ;
- générer des statistiques globales ;
- suivre la progression des utilisateurs ;
- identifier les questions difficiles ;
- suivre l’usage de la plateforme.

### Exemples d’indicateurs
- taux de complétion ;
- taux de réussite ;
- temps moyen ;
- difficulté moyenne atteinte ;
- questions les plus ratées.

---

## 7.10 Audit / Logs Module

### Responsabilités
- journalisation des actions critiques ;
- traçabilité des erreurs ;
- suivi des accès ;
- audit des opérations administratives.

---

# 8. FLUX MÉTIER PRINCIPAUX

## 8.1 Flux d’inscription / connexion

```text
Frontend → API Auth → Validation → Base de données → JWT → Session
```

---

## 8.2 Flux de création de test

```text
Utilisateur → Frontend → API Test Engine → Sélection questions → Session test créée
```

---

## 8.3 Flux de réponse à une question

```text
Utilisateur répond → Frontend → API Backend → Validation → Enregistrement → Mise à jour adaptative
```

---

## 8.4 Flux de clôture de test

```text
Fin test → Backend calcule score → Backend crée résultat → Frontend affiche restitution
```

---

# 9. RÈGLES MÉTIER FONDAMENTALES

## 9.1 Règles de validation
- une réponse doit correspondre au type attendu ;
- une question non publiée ne doit jamais être servie ;
- une session expirée doit être fermée ;
- un score ne doit pas être recalculé par le client.

---

## 9.2 Règles de cohérence
- une question appartient à une seule catégorie principale ;
- une réponse appartient à une seule session ;
- une session appartient à un seul utilisateur ;
- un résultat doit être rattaché à une session finalisée.

---

## 9.3 Règles de sécurité métier
- seules les routes autorisées peuvent modifier les contenus ;
- les données critiques sont signées ou protégées par la logique serveur ;
- les actions admin doivent être auditées.

---

# 10. STRUCTURE DES SERVICES

## Services recommandés
- AuthService
- UsersService
- QuestionsService
- TestsService
- AdaptiveEngineService
- ScoringService
- ResultsService
- AdminService
- AnalyticsService
- AuditService

Chaque service doit :
- avoir une responsabilité unique ;
- être testable isolément ;
- être réutilisable ;
- éviter les dépendances circulaires.

---

# 11. CONTRATS API PRINCIPAUX

## 11.1 Auth
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/auth/refresh`
- `POST /api/v1/auth/logout`

## 11.2 Tests
- `POST /api/v1/tests/start`
- `POST /api/v1/tests/:id/answer`
- `POST /api/v1/tests/:id/finish`
- `GET /api/v1/tests/:id`

## 11.3 Questions
- `GET /api/v1/questions`
- `POST /api/v1/questions`
- `PATCH /api/v1/questions/:id`
- `DELETE /api/v1/questions/:id`

## 11.4 Results
- `GET /api/v1/results`
- `GET /api/v1/results/:id`

## 11.5 Admin
- `GET /api/v1/admin/users`
- `GET /api/v1/admin/stats`

---

# 12. TRAITEMENT DES DONNÉES

## 12.1 Données critiques
Les données critiques doivent toujours être :
- validées ;
- persistées ;
- versionnées si nécessaire ;
- auditées.

## 12.2 Données temporaires
Certaines données de session peuvent être stockées temporairement en mémoire ou dans Redis selon l’évolution.

---

# 13. ERREURS ET GESTION D’EXCEPTIONS

## 13.1 Principes
- toute erreur doit être capturée proprement ;
- les messages renvoyés au client doivent être clairs ;
- les erreurs internes doivent être loggées ;
- aucun détail sensible ne doit fuiter dans la réponse API.

## 13.2 Structure de réponse d’erreur
- code HTTP approprié ;
- message lisible ;
- identifiant de corrélation si nécessaire.

---

# 14. PERFORMANCE ET OPTIMISATION

## 14.1 Requêtes base de données
- index sur les colonnes critiques ;
- optimisation des jointures ;
- pagination obligatoire pour les listes ;
- requêtes minimales.

## 14.2 Temps réel
Le MVP peut fonctionner en modèle requête/réponse classique.
Le temps réel pourra être introduit plus tard si nécessaire.

---

# 15. STRATÉGIE DE TESTS BACKEND

## 15.1 Tests unitaires
À prévoir sur :
- scoring ;
- adaptativité ;
- validation ;
- permissions.

## 15.2 Tests d’intégration
À prévoir sur :
- auth ;
- flux de test ;
- calcul final ;
- persistence des résultats.

## 15.3 Tests E2E
À prévoir sur :
- création de compte ;
- passage complet d’un test ;
- consultation du résultat ;
- parcours admin.

---

# 16. OBSERVABILITÉ

Le backend doit intégrer :
- logs structurés ;
- erreurs centralisées ;
- métriques de performance ;
- suivi des opérations critiques ;
- journal d’audit.

---

# 17. CONTRAINTES D’IMPLÉMENTATION

## MUST
- TypeScript obligatoire ;
- NestJS privilégié ;
- architecture modulaire ;
- logique métier exclusivement côté serveur ;
- validation systématique ;
- endpoints versionnés ;
- code testable ;
- journalisation des opérations sensibles.

---

# 18. CRITÈRES DE VALIDATION DU BACKEND

Le backend sera considéré comme conforme si :
- un utilisateur peut s’authentifier ;
- une session de test peut être créée ;
- les réponses sont enregistrées ;
- le scoring est correct ;
- l’adaptativité fonctionne ;
- les résultats sont persistés ;
- les permissions admin sont respectées ;
- les endpoints sont documentés.

---

# 19. ÉVOLUTIONS FUTURES

Le backend doit pouvoir évoluer vers :
- des workers asynchrones ;
- Redis distribué ;
- microservices ;
- WebSockets ;
- moteur de recommandation ;
- calculs statistiques avancés ;
- IA d’aide à la progression.

---

# 20. CONCLUSION

Ce RFC-003 définit le backend de Psycho-Pass comme un moteur métier central, modulaire et fiable.

La priorité absolue est de garantir :
- la cohérence des règles ;
- la sécurité des données ;
- la qualité du scoring ;
- la robustesse du moteur adaptatif ;
- la maintenabilité à long terme.

Toute modification structurante devra faire l’objet d’un RFC dédié ou d’une révision validée.

