# RFC-002 — Stack technique complète
## Projet : Psycho-Pass
### Statut : Draft
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit la stack technique officielle du projet Psycho-Pass.

Il précise :
- les technologies retenues pour chaque couche du système ;
- les outils obligatoires de développement ;
- les standards de qualité ;
- les dépendances critiques ;
- les choix techniques validés pour le MVP et les évolutions futures.

Ce RFC sert de base de référence pour toute l’équipe technique.

---

# 2. OBJECTIFS DE LA STACK

La stack doit répondre aux exigences suivantes :
- rapidité de développement ;
- maintenabilité ;
- robustesse ;
- évolutivité ;
- cohérence entre frontend et backend ;
- sécurité ;
- facilité de recrutement de développeurs ;
- compatibilité avec un futur passage à l’échelle.

---

# 3. PRINCIPES GÉNÉRAUX DE SÉLECTION

## 3.1 Principes retenus
La stack doit être choisie selon les critères suivants :
- adoption large dans l’écosystème ;
- maturité des outils ;
- documentation disponible ;
- compatibilité TypeScript ;
- facilité de test ;
- capacité de mise en production fiable.

## 3.2 Philosophie technique
Le projet adopte une approche :
- moderne ;
- orientée composants ;
- typée ;
- modulaire ;
- testable ;
- scalable.

---

# 4. STACK OFFICIELLE RETENUE

## 4.1 Frontend

### Technologie principale
- **Next.js**

### Langage
- **TypeScript**

### UI framework
- **React**

### Styling
- **Tailwind CSS**

### Bibliothèque de composants
- **shadcn/ui** ou équivalent validé

### État applicatif
- état local React
- **Zustand** pour l’état global si nécessaire
- ou solution équivalente plus légère selon le besoin

### Formulaires
- **React Hook Form**
- **Zod** pour validation côté client

### Animations
- **Framer Motion** pour les transitions et micro-interactions

---

## 4.2 Backend

### Technologie principale
- **NestJS**

### Langage
- **TypeScript**

### Style architectural
- architecture modulaire
- séparation claire des responsabilités
- services métiers isolés

### API
- **REST API** pour le MVP

### Validation
- **class-validator** et/ou **Zod** selon la couche retenue

### Documentation API
- **OpenAPI / Swagger**

---

## 4.3 Base de données

### SGBD principal
- **PostgreSQL**

### Rôle
- stockage relationnel des utilisateurs, tests, réponses, scores, catégories et historiques.

### Justification
PostgreSQL est retenu pour :
- sa fiabilité ;
- sa maturité ;
- sa gestion des transactions ;
- ses capacités de requêtage ;
- son excellent support de données structurées.

---

## 4.4 ORM

### ORM retenu
- **Prisma**

### Rôle
- mapping entre le code TypeScript et PostgreSQL ;
- gestion des migrations ;
- typage fort ;
- productivité accrue.

---

## 4.5 Authentification

### Solution retenue
- **JWT** pour les sessions applicatives
- **Refresh tokens** pour prolonger les sessions

### Extensions possibles
- OAuth Google ultérieurement

### Objectifs
- sécurité ;
- contrôle des accès ;
- expérience utilisateur fluide.

---

## 4.6 Cache et performance

### Outil recommandé
- **Redis**

### Usage possible
- sessions temporaires ;
- rate limiting ;
- cache de données peu volatiles ;
- optimisation de certains calculs.

### Remarque
Redis n’est pas obligatoire au MVP si la charge est faible, mais il est recommandé pour préparer l’évolutivité.

---

## 4.7 Queue / traitement asynchrone

### Outil recommandé
- **BullMQ** avec Redis

### Usage
- calculs différés ;
- génération de rapports ;
- traitements de statistiques ;
- notifications futures.

### Statut
- recommandé pour la phase 2, pas obligatoire pour le MVP.

---

## 4.8 Tests

### Frontend
- **Vitest**
- **React Testing Library**
- **Playwright** pour les tests end-to-end

### Backend
- **Jest** ou **Vitest**
- tests unitaires
- tests d’intégration

### Objectif
- garantir la stabilité du moteur de test, du scoring et des parcours utilisateur.

---

## 4.9 Qualité de code

### Outils obligatoires
- **ESLint**
- **Prettier**
- **Husky**
- **lint-staged**

### Rôle
- uniformiser le code ;
- automatiser le formatage ;
- éviter les régressions triviales.

---

## 4.10 CI/CD

### Outil recommandé
- **GitHub Actions**

### Pipeline minimal
- installation des dépendances ;
- lint ;
- tests ;
- build ;
- déploiement conditionnel.

---

## 4.11 Hébergement et déploiement

### Frontend
- **Vercel**

### Backend
- **Railway** ou **Render** pour le MVP
- **VPS Dockerisé** pour les évolutions avancées

### Base de données
- PostgreSQL managé ou hébergé sur service fiable

---

## 4.12 Observabilité

### Outils recommandés
- logs structurés
- monitoring d’erreurs
- suivi des performances
- traçage applicatif si nécessaire

### Solutions possibles
- Sentry pour les erreurs
- service de logs centralisés

---

# 5. ARCHITECTURE GLOBALE DE LA STACK

## 5.1 Vue d’ensemble

```text
[ Next.js / React / TypeScript ]
                |
                | HTTPS / REST
                v
[ NestJS / TypeScript API ]
                |
                v
[ PostgreSQL + Prisma ]
```

### Composants additionnels possibles
```text
[ Redis ] ---> cache / queue / rate limiting
[ Sentry ] ---> monitoring erreurs
[ GitHub Actions ] ---> CI/CD
```

---

# 6. DÉTAIL PAR BLOC TECHNIQUE

## 6.1 Frontend

### Rôle
Le frontend est responsable de l’expérience utilisateur, de la lisibilité, de la navigation et de la fluidité d’utilisation.

### Choix techniques
- Next.js pour le rendu moderne et la structuration des pages ;
- TypeScript pour la robustesse ;
- Tailwind CSS pour la vitesse d’itération ;
- shadcn/ui pour la cohérence des composants ;
- Framer Motion pour les micro-interactions.

### Avantages attendus
- base solide pour le SEO si nécessaire ;
- bon découpage en composants ;
- intégration naturelle avec une API backend ;
- productivité élevée.

---

## 6.2 Backend

### Rôle
Le backend est le cœur métier du projet.
Il gère :
- les règles de test ;
- la sélection des questions ;
- le moteur adaptatif ;
- les calculs de score ;
- les permissions ;
- la persistance ;
- l’administration.

### Choix techniques
- NestJS pour l’architecture modulaire ;
- TypeScript pour le typage ;
- Swagger pour la documentation API ;
- Prisma pour l’accès aux données.

### Avantages attendus
- architecture claire ;
- testabilité ;
- séparation des modules ;
- évolution facilitée.

---

## 6.3 Base de données

### Rôle
Stocker les données critiques avec intégrité et cohérence.

### Choix techniques
- PostgreSQL comme base principale ;
- migrations contrôlées via Prisma ;
- index sur les colonnes critiques ;
- contraintes d’intégrité explicites.

### Avantages attendus
- fiabilité transactionnelle ;
- excellent support relationnel ;
- croissance durable.

---

# 7. DÉPENDANCES CRITIQUES

## 7.1 Dépendances obligatoires
- TypeScript
- Next.js
- React
- Tailwind CSS
- NestJS
- Prisma
- PostgreSQL
- JWT
- Zod
- React Hook Form
- ESLint
- Prettier

## 7.2 Dépendances facultatives mais recommandées
- Redis
- BullMQ
- Sentry
- Playwright
- Framer Motion
- shadcn/ui

---

# 8. DÉCISIONS TECHNIQUES OFFICIELLES

| Domaine | Décision |
|---|---|
| Frontend | Next.js + React |
| Langage frontend | TypeScript |
| Style | Tailwind CSS |
| UI kit | shadcn/ui |
| Backend | NestJS |
| Langage backend | TypeScript |
| Base de données | PostgreSQL |
| ORM | Prisma |
| Auth | JWT + Refresh Token |
| API | REST |
| Formulaires | React Hook Form + Zod |
| Tests | Vitest / Jest + Playwright |
| CI/CD | GitHub Actions |
| Hosting frontend | Vercel |
| Hosting backend | Railway / Render / VPS |
| Cache (optionnel) | Redis |
| Queue (optionnelle) | BullMQ |
| Monitoring | Sentry + logs |

---

# 9. CONTRAINTES D’IMPLÉMENTATION

## MUST
- Toute nouvelle dépendance doit être validée.
- Toute technologie ajoutée doit avoir une justification.
- Le projet doit rester cohérent avec TypeScript.
- Le frontend ne doit pas dupliquer la logique métier critique.
- Les tests doivent être intégrés au cycle de développement.
- Les secrets doivent être gérés hors du code source.

---

# 10. STRATÉGIE D’ÉVOLUTION

La stack retenue doit permettre les évolutions suivantes :
- ajout d’IA d’aide à la progression ;
- ajout de microservices ;
- ajout d’un moteur de recommandation ;
- ajout d’une application mobile ;
- ajout de websockets si nécessaire ;
- ajout de fonctionnalités temps réel ;
- montée en charge progressive.

---

# 11. RECOMMANDATION DE DÉMARRAGE

Pour le MVP, la stack minimale recommandée est :
- Next.js
- React
- TypeScript
- Tailwind CSS
- shadcn/ui
- NestJS
- PostgreSQL
- Prisma
- JWT
- Zod
- React Hook Form
- ESLint / Prettier
- GitHub Actions

Redis, BullMQ, Sentry et d’autres briques peuvent être intégrés dès que la charge ou les besoins le justifient.

---

# 12. CONCLUSION

Ce RFC-002 fixe la stack officielle de Psycho-Pass.

Cette stack a été choisie pour offrir :
- une base moderne ;
- une excellente maintenabilité ;
- une forte compatibilité TypeScript ;
- une bonne productivité ;
- une trajectoire claire vers la scalabilité.

Toute divergence future doit faire l’objet d’un nouveau RFC ou d’une mise à jour contrôlée de ce document.

