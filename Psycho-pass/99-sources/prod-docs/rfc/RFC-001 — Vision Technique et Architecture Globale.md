# RFC-001 — Vision Technique et Architecture Globale

## Projet : Psycho-Pass

### Statut : Draft

### Version : 1.0

### Auteur : Équipe Architecture Psycho-Pass

### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit la vision technique globale du projet Psycho-Pass.

Il sert de référence principale pour :

* les développeurs frontend ;
* les développeurs backend ;
* les architectes logiciels ;
* les futurs contributeurs techniques ;
* les responsables infrastructure.

Ce RFC décrit :

* l’architecture générale du système ;
* les responsabilités des composants ;
* les flux de données ;
* les principes d’organisation du code ;
* les contraintes techniques ;
* les décisions structurantes du projet.

---

# 2. CONTEXTE DU PROJET

Psycho-Pass est une plateforme web d’évaluation psychotechnique et de culture générale.

La plateforme doit permettre :

* le passage de tests chronométrés ;
* l’évaluation adaptative ;
* le calcul de scores ;
* l’analyse des performances ;
* la progression utilisateur ;
* l’administration de contenus pédagogiques.

Le système doit être :

* scalable ;
* maintenable ;
* sécurisé ;
* modulaire ;
* extensible.

---

# 3. OBJECTIFS TECHNIQUES PRINCIPAUX

## 3.1 Performance

Le système doit :

* charger rapidement ;
* répondre en temps réel ;
* supporter plusieurs utilisateurs simultanés ;
* minimiser les temps de latence.

---

## 3.2 Maintenabilité

Le projet doit :

* être modulaire ;
* avoir une séparation claire des responsabilités ;
* être facilement testable ;
* permettre des évolutions futures sans refonte majeure.

---

## 3.3 Scalabilité

L’architecture doit permettre :

* l’ajout futur de microservices ;
* la montée en charge ;
* la séparation des workloads critiques ;
* l’intégration de nouveaux modules.

---

## 3.4 Sécurité

Le système doit :

* protéger les données utilisateur ;
* sécuriser les endpoints ;
* contrôler les permissions ;
* éviter les manipulations côté client.

---

# 4. VISION ARCHITECTURALE

## 4.1 Architecture générale

Le projet adopte une architecture :

### Frontend + Backend séparés

Structure globale :

```text
[ Frontend Next.js ]
        |
        | HTTPS / API
        v
[ Backend API ]
        |
        v
[ PostgreSQL ]
```

---

## 4.2 Philosophie d’architecture

### Le frontend affiche

### Le backend décide

Le backend doit être l’unique source de vérité pour :

* scoring ;
* règles métier ;
* adaptativité ;
* permissions ;
* gestion des tests ;
* validation des réponses.

Le frontend ne doit jamais :

* recalculer un score critique ;
* décider de la difficulté ;
* gérer les permissions réelles ;
* stocker des données sensibles.

---

# 5. DÉCOUPAGE DU SYSTÈME

## 5.1 Frontend

### Responsabilités

* affichage UI ;
* navigation ;
* gestion locale des états visuels ;
* interactions utilisateur ;
* appels API ;
* animations et transitions ;
* accessibilité.

### Technologies prévues

* Next.js
* React
* TypeScript
* Tailwind CSS

---

## 5.2 Backend

### Responsabilités

* authentification ;
* logique métier ;
* moteur adaptatif ;
* scoring ;
* gestion des tests ;
* validation ;
* persistance des données ;
* analytics ;
* sécurité.

### Technologies prévues

* Node.js
* NestJS
* TypeScript

---

## 5.3 Base de données

### Responsabilités

* stockage des utilisateurs ;
* stockage des questions ;
* stockage des réponses ;
* stockage des résultats ;
* historique des performances.

### Technologie prévue

* PostgreSQL

---

# 6. PRINCIPES D’ARCHITECTURE

## 6.1 Séparation des responsabilités

Chaque couche doit avoir une responsabilité claire.

### Frontend

Responsable de :

* UX ;
* affichage ;
* expérience utilisateur.

### Backend

Responsable de :

* règles métier ;
* sécurité ;
* calculs ;
* orchestration.

### Database

Responsable de :

* persistance ;
* intégrité ;
* cohérence.

---

## 6.2 Architecture modulaire

Le backend doit être organisé par domaines métiers.

Exemple :

```text
src/
 ├── auth/
 ├── users/
 ├── tests/
 ├── questions/
 ├── scoring/
 ├── adaptive-engine/
 ├── analytics/
 └── admin/
```

---

## 6.3 Évolutivité

L’architecture doit permettre :

* le passage futur à des microservices ;
* la distribution de charge ;
* l’ajout de workers asynchrones ;
* l’ajout d’intelligence artificielle.

---

# 7. FLUX PRINCIPAUX DU SYSTÈME

## 7.1 Flux d’authentification

```text
Utilisateur
   ↓
Frontend
   ↓
API Auth Backend
   ↓
Validation
   ↓
JWT
   ↓
Session utilisateur
```

---

## 7.2 Flux de test

```text
Utilisateur
   ↓
Frontend
   ↓
Backend Test Engine
   ↓
Sélection des questions
   ↓
Réponses utilisateur
   ↓
Adaptive Engine
   ↓
Scoring Engine
   ↓
Résultat final
```

---

## 7.3 Flux d’administration

```text
Admin
   ↓
Frontend Admin
   ↓
API Backend
   ↓
Validation permissions
   ↓
CRUD Questions / Tests / Users
```

---

# 8. MOTEUR CENTRAL (CORE ENGINE)

Le backend doit être conçu autour d’un moteur principal.

---

## 8.1 Composants principaux

### Auth Engine

Gestion :

* login ;
* JWT ;
* permissions ;
* rôles.

---

### Test Engine

Gestion :

* sessions de test ;
* génération des questions ;
* timing ;
* validation des réponses.

---

### Adaptive Engine

Gestion :

* difficulté dynamique ;
* évolution du niveau ;
* équilibrage des catégories.

---

### Scoring Engine

Gestion :

* calcul des scores ;
* pondération ;
* normalisation ;
* statistiques.

---

### Analytics Engine

Gestion :

* métriques ;
* progression ;
* historique ;
* tableaux statistiques.

---

# 9. STRATÉGIE API

## 9.1 Architecture API

Le backend expose une API REST.

Structure :

```text
/api/v1/
```

---

## 9.2 Principes API

### MUST

* réponses JSON standardisées ;
* validation systématique ;
* gestion centralisée des erreurs ;
* versioning obligatoire ;
* endpoints cohérents.

---

## 9.3 Exemple structure endpoint

```text
GET    /api/v1/tests
POST   /api/v1/tests/start
POST   /api/v1/tests/:id/answer
GET    /api/v1/results
```

---

# 10. STRATÉGIE DE DONNÉES

## 10.1 Source de vérité

La base PostgreSQL est :

* la seule source persistante officielle ;
* responsable de l’intégrité métier.

---

## 10.2 Données critiques

Les données critiques incluent :

* résultats ;
* scores ;
* réponses ;
* progression ;
* permissions.

Ces données ne doivent jamais dépendre du frontend.

---

# 11. STRATÉGIE DE SÉCURITÉ

## 11.1 Authentification

Le système utilise :

* JWT access token ;
* refresh token ;
* hash sécurisé des mots de passe.

---

## 11.2 Validation

Toutes les entrées utilisateur doivent être :

* validées ;
* sanitizées ;
* typées.

---

## 11.3 Permissions

Système RBAC :

### Rôles prévus

* USER
* ADMIN
* SUPER_ADMIN

---

# 12. STRATÉGIE DE TESTS

## 12.1 Tests backend

* unitaires ;
* intégration ;
* validation API.

---

## 12.2 Tests frontend

* composants ;
* navigation ;
* formulaires ;
* responsive.

---

## 12.3 Tests E2E

Validation complète des parcours critiques.

---

# 13. STRATÉGIE DE DÉPLOIEMENT

## 13.1 Frontend

Déploiement :

* Vercel.

---

## 13.2 Backend

Déploiement :

* Railway ;
* Render ;
* VPS Dockerisé.

---

## 13.3 CI/CD

Pipeline :

* lint ;
* tests ;
* build ;
* déploiement.

---

# 14. STRATÉGIE DE MONITORING

Le système devra intégrer :

* logs structurés ;
* monitoring erreurs ;
* suivi performance ;
* alertes critiques.

---

# 15. CONTRAINTES TECHNIQUES

## MUST

* TypeScript obligatoire ;
* séparation stricte frontend/backend ;
* architecture modulaire ;
* API versionnée ;
* responsive obligatoire ;
* backend source de vérité.

---

# 16. DÉCISIONS VALIDÉES

| Sujet                | Décision                   |
| -------------------- | -------------------------- |
| Frontend             | Next.js                    |
| Backend              | NestJS                     |
| Langage              | TypeScript                 |
| Base de données      | PostgreSQL                 |
| Architecture         | Frontend / Backend séparés |
| API                  | REST                       |
| Auth                 | JWT                        |
| Hébergement Frontend | Vercel                     |
| Hébergement Backend  | Railway / VPS              |
| ORM                  | Prisma (prévisionnel)      |

---

# 17. RISQUES IDENTIFIÉS

## Risques techniques

* complexité du moteur adaptatif ;
* surcharge backend ;
* cohérence des scores ;
* gestion du temps réel.

## Risques produit

* difficulté de calibration ;
* qualité des questions ;
* expérience mobile.

---

# 18. ÉVOLUTIONS FUTURES

Architecture prévue pour :

* IA adaptative avancée ;
* moteur de recommandations ;
* microservices ;
* websocket temps réel ;
* application mobile ;
* analytics avancés.

---

# 19. CONCLUSION

Ce RFC définit les fondations techniques du projet Psycho-Pass.

Les décisions prises ici doivent servir de référence pour :

* les futurs RFC ;
* les MUST de développement ;
* l’architecture backend ;
* l’architecture frontend ;
* les conventions de code.

Toute modification structurelle future devra passer par un nouveau RFC validé.
