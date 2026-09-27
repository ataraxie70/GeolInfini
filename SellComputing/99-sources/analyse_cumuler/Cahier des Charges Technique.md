# Cahier des Charges Technique

## Plateforme de Conseil, Vente d'Ordinateurs et Services Informatiques

**Version : 1.0**
**Statut : Conception Technique**
**Phase : Architecture et Modélisation**

---

# 1. Objectifs Techniques

L'architecture doit permettre :

* une navigation rapide même avec une connexion moyenne ;
* une expérience optimale sur mobile ;
* un référencement naturel performant ;
* une administration simple ;
* une évolution progressive du produit ;
* une maintenance facile ;
* une forte modularité ;
* une excellente évolutivité.

Le système doit pouvoir démarrer avec quelques dizaines de produits et évoluer jusqu'à plusieurs milliers sans refonte majeure.

---

# 2. Architecture Générale

## Architecture retenue

Architecture modulaire monolithique.

Pourquoi ?

* plus simple à développer ;
* plus simple à maintenir ;
* moins coûteuse ;
* adaptée à un MVP ;
* évolutive vers microservices si nécessaire.

---

## Schéma logique

```text
┌───────────────────────┐
│      Frontend         │
│    Next.js PWA        │
└──────────┬────────────┘
           │ HTTPS
           ▼
┌───────────────────────┐
│       API NestJS      │
└──────┬─────┬─────┬────┘
       │     │     │
       ▼     ▼     ▼

Products  Services  Content

       │
       ▼

 PostgreSQL

       │
       ▼

 Object Storage
 Images / Videos
```

---

# 3. Stack Technique

## Frontend

### Framework

Next.js

Motifs :

* SEO excellent
* SSR
* ISR
* App Router
* PWA
* performances élevées

### Langage

TypeScript

### Style

Tailwind CSS

### Composants UI

Shadcn/UI

### Gestion état

TanStack Query

### Formulaires

React Hook Form

### Validation

Zod

---

## Backend

### Framework

NestJS

### Langage

TypeScript

### ORM

Prisma

### Validation

Class Validator

### Documentation API

OpenAPI / Swagger

---

## Base de données

PostgreSQL

Motifs :

* robuste
* open source
* relationnel
* performant
* évolutif

---

## Stockage fichiers

MinIO

Puis :

* Wasabi
* Cloudflare R2
* AWS S3

selon la croissance.

---

## Cache

Redis

Utilisation :

* cache catalogue
* sessions
* recherches fréquentes

---

# 4. Modules Applicatifs

---

## Module Catalogue

Gestion :

* produits
* catégories
* marques
* variantes
* images

---

## Module Recommandation

Fonction :

orienter l'utilisateur.

Entrées :

* budget
* usage
* mobilité
* préférence neuf/reconditionné

Sortie :

* score
* recommandations

---

## Module Comparateur

Permet :

* comparer plusieurs ordinateurs
* comparer plusieurs casques

---

## Module Reconditionné

Gestion :

* état
* batterie
* garantie
* historique contrôle

---

## Module Services

Gestion :

* nettoyage
* diagnostic
* assistance

---

## Module Accessoires

Gestion :

* casques
* écouteurs

Demande spéciale :

* accessoires sur commande

---

## Module Contenus

Gestion :

* guides
* conseils
* vidéos
* FAQ

---

## Module Utilisateurs

Gestion :

* comptes
* préférences
* historique

---

## Module Administration

Gestion :

* catalogue
* commandes
* contenus
* services

---

# 5. Architecture Base de Données

---

## Users

```sql
users
```

| Champ         | Type      |
| ------------- | --------- |
| id            | UUID      |
| email         | VARCHAR   |
| password_hash | TEXT      |
| role_id       | UUID      |
| created_at    | TIMESTAMP |

---

## Roles

```sql
roles
```

| Champ |
| ----- |
| id    |
| name  |

Exemples :

* admin
* vendeur
* support
* client

---

## Brands

```sql
brands
```

| Champ       |
| ----------- |
| id          |
| name        |
| logo        |
| description |

---

## Categories

```sql
categories
```

Exemples :

* ordinateur
* casque
* écouteur
* service

---

## Products

```sql
products
```

| Champ       |
| ----------- |
| id          |
| category_id |
| brand_id    |
| name        |
| slug        |
| description |
| condition   |
| price       |
| warranty    |
| status      |

---

## Product Specs

```sql
product_specs
```

| Champ      |
| ---------- |
| product_id |
| cpu        |
| ram        |
| storage    |
| gpu        |
| display    |
| battery    |
| weight     |

---

## Product Images

```sql
product_images
```

| Champ      |
| ---------- |
| id         |
| product_id |
| url        |
| sort_order |

---

# 6. Moteur de Recommandation

## Concept

Chaque produit possède des scores.

Exemple :

```text
Bureautique : 95
Programmation : 90
Gaming : 45
Montage vidéo : 60
Mobilité : 92
```

---

## Table

```sql
product_use_scores
```

| Champ          |
| -------------- |
| product_id     |
| office_score   |
| coding_score   |
| gaming_score   |
| mobility_score |
| creator_score  |

---

## Fonctionnement

Questionnaire :

1. Budget
2. Usage principal
3. Mobilité
4. Taille écran
5. Neuf/Reconditionné

Le moteur calcule ensuite :

```text
Compatibilité utilisateur
+
Performance
+
Prix
+
Disponibilité
=
Score final
```

---

# 7. Gestion du Reconditionné

Table dédiée :

```sql
refurbished_reports
```

Contient :

* état esthétique
* état batterie
* composants remplacés
* tests réalisés
* date contrôle
* technicien

---

## Classification

A+

Comme neuf

A

Très bon état

B

Bon état

C

État acceptable

---

# 8. Services Techniques

Table :

```sql
service_requests
```

Contient :

* client
* appareil
* problème
* statut
* coût
* technicien

---

## Statuts

```text
Nouveau
Diagnostic
En cours
Terminé
Livré
```

---

# 9. Système de Recherche

Solution MVP :

PostgreSQL Full Text Search

Phase 2 :

Meilisearch

Phase 3 :

Elasticsearch

---

# 10. Sécurité

---

## Authentification

JWT

Refresh Token

---

## Protection

* Rate Limiting
* CSRF
* XSS
* CSP
* Validation stricte

---

## Administration

RBAC

Role Based Access Control

---

# 11. Observabilité

Outils :

* Sentry
* Grafana
* Prometheus

---

# 12. Déploiement

## Environnements

```text
Local
Staging
Production
```

---

## Docker

Conteneurs :

```text
Frontend
Backend
PostgreSQL
Redis
MinIO
```

---

## CI/CD

GitHub Actions

Pipeline :

```text
Tests
Lint
Build
Security Scan
Deploy
```

---

# 13. Architecture MVP

Version 1

Modules obligatoires :

✅ Catalogue

✅ Recommandation

✅ Comparateur

✅ Services

✅ Contenus

✅ Administration

---

# 14. Architecture V2

Ajouts :

* compte client complet
* wishlist
* notifications
* suivi SAV
* réservation intervention

---

# 15. Architecture V3

Ajouts :

* assistant IA d'aide au choix
* analyse automatique des besoins
* recommandations personnalisées
* moteur de scoring avancé
* marketplace partenaires

---

# Conclusion

L'architecture retenue est :

**Next.js + NestJS + PostgreSQL + Prisma + Docker**

Cette architecture offre :

* faible coût initial ;
* excellente maintenabilité ;
* forte évolutivité ;
* SEO performant ;
* expérience mobile optimale ;
* capacité à devenir la référence locale pour le conseil, la vente d'ordinateurs, les accessoires audio et les services techniques.
