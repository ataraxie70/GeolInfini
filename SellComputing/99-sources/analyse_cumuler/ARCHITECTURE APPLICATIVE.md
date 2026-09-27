# ARCHITECTURE APPLICATIVE

# DDD + Clean Architecture + Hexagonal Architecture

# Plateforme Conseil, Vente d'Ordinateurs et Services Informatiques

Version : 1.0
Statut : Architecture Logicielle

---

# 1. Pourquoi cette architecture ?

Nous ne construisons pas simplement une boutique en ligne.

Nous construisons :

```text
Conseil
+
Recommandation
+
Comparaison
+
Catalogue
+
Services techniques
+
Maintenance
+
Contenu éducatif
```

Une architecture MVC classique devient rapidement difficile à maintenir.

L'objectif est donc :

* découplage fort ;
* évolutivité ;
* testabilité ;
* maintenabilité ;
* possibilité de croissance sur plusieurs années.

---

# 2. Architecture retenue

Nous combinons :

## DDD

Domain Driven Design

Pour organiser le métier.

---

## Clean Architecture

Pour séparer :

```text
Métier
↓
Application
↓
Infrastructure
↓
Interface
```

---

## Hexagonal Architecture

Pour permettre :

```text
API REST
Admin
Jobs
CLI
Import
IA
```

sans modifier le métier.

---

# 3. Architecture globale

```text
┌───────────────────────────┐
│        Frontend           │
│        Next.js            │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│      API Controllers      │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│      Application Layer    │
│       Use Cases           │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│       Domain Layer        │
│ Aggregate / Entities      │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│ Infrastructure Layer      │
│ Prisma / PostgreSQL       │
└───────────────────────────┘
```

---

# 4. Bounded Contexts Backend

Le backend sera divisé en modules.

Chaque module possède :

```text
Domain
Application
Infrastructure
Presentation
```

---

## Modules

### IAM

Responsable :

* login
* rôles
* permissions

---

### Customer

Responsable :

* profils
* préférences
* historique

---

### Catalog

Responsable :

* produits
* catégories
* marques
* variantes

---

### Recommendation

Responsable :

* questionnaire
* scoring
* recommandations

---

### Refurbishment

Responsable :

* diagnostics
* état
* garantie

---

### Inventory

Responsable :

* stock
* réservations
* mouvements

---

### Ordering

Responsable :

* panier
* commande
* livraison

---

### Payments

Responsable :

* transactions
* remboursements

---

### Maintenance

Responsable :

* nettoyage
* SAV
* diagnostics

---

### Accessory Requests

Responsable :

* accessoires spéciaux
* devis

---

### CMS

Responsable :

* guides
* vidéos
* FAQ

---

### Notifications

Responsable :

* emails
* SMS

---

### Analytics

Responsable :

* statistiques
* événements

---

# 5. Structure du Monorepo

```text
apps/
│
├── web
├── admin
├── api
│
packages/
│
├── shared
├── ui
├── config
├── types
├── validation
│
infrastructure/
│
├── docker
├── nginx
├── monitoring
│
docs/
```

---

# 6. Structure du Backend

```text
src/

modules/

catalog/
recommendation/
ordering/
inventory/
maintenance/
cms/
customer/
iam/

shared/
```

---

# 7. Structure interne d'un module

Exemple :

Catalog

```text
catalog/

domain/
application/
infrastructure/
presentation/
```

---

# 8. Domain Layer

Le domaine contient :

```text
Entities
Value Objects
Aggregates
Domain Events
Repositories
Specifications
Policies
```

---

## Exemple Product Aggregate

```text
Product

├─ Specs
├─ Images
├─ Warranty
├─ UseScores
└─ RefurbishmentData
```

---

# 9. Application Layer

Contient :

```text
Use Cases
Commands
Queries
DTO
```

---

## Exemple

```text
CreateProduct

UpdateProduct

PublishProduct

RecommendProduct

CompareProducts

CreateOrder
```

---

# 10. CQRS

Séparation :

```text
Command

modifie

Query

lit
```

---

Exemple :

```text
CreateOrderCommand

GetOrderQuery
```

---

# 11. Domain Events

Événements métier.

---

## Catalogue

```text
ProductCreated

ProductPublished

ProductUpdated
```

---

## Recommendation

```text
RecommendationGenerated
```

---

## Commande

```text
OrderPlaced

OrderCancelled
```

---

## Paiement

```text
PaymentSucceeded

PaymentFailed
```

---

## Maintenance

```text
ServiceRequestCreated
```

---

# 12. Repositories

Interface :

```typescript
interface ProductRepository {
 save()
 findById()
 search()
}
```

---

Implémentation :

```text
PrismaProductRepository
```

---

# 13. API REST

---

## Catalogue

```http
GET /products
GET /products/:id
POST /products
PUT /products/:id
DELETE /products/:id
```

---

## Recommandation

```http
POST /recommendations
GET /recommendations/:id
```

---

## Comparateur

```http
POST /compare
```

---

## Commandes

```http
POST /orders
GET /orders/:id
```

---

## Maintenance

```http
POST /service-requests
GET /service-requests/:id
```

---

# 14. Recherche

MVP :

```text
PostgreSQL Full Text Search
```

---

Phase 2 :

```text
Meilisearch
```

---

Phase 3 :

```text
Elasticsearch
```

---

# 15. Cache

Redis

---

Utilisation :

```text
Produits populaires

Filtres

Recommandations

Sessions
```

---

# 16. Notifications

Architecture Event Driven

---

Exemple :

```text
OrderPlaced

↓

Notification Event

↓

Email
SMS
WhatsApp
```

---

# 17. Frontend Architecture

---

## Applications

### Site Public

Next.js

---

### Dashboard Admin

Next.js

---

# 18. Structure Frontend

```text
app/

components/

features/

hooks/

services/

lib/

types/
```

---

# 19. Pages Principales

## Public

```text
Accueil

Trouver mon ordinateur

Catalogue

Comparateur

Reconditionné

Maintenance

Guides

FAQ
```

---

## Admin

```text
Dashboard

Produits

Stocks

Commandes

Maintenance

CMS

Analytics

Utilisateurs
```

---

# 20. Sécurité

---

## Auth

```text
JWT

Refresh Token
```

---

## RBAC

```text
Admin

Manager

Support

Content Editor

Customer
```

---

## Protection

```text
Rate Limiting

CSRF

XSS

CSP

Validation
```

---

# 21. Infrastructure Docker

```text
Frontend

Backend

PostgreSQL

Redis

MinIO

Nginx
```

---

# 22. CI/CD

GitHub Actions

Pipeline :

```text
Lint

Tests

Build

Security Scan

Deploy
```

---

# 23. Observabilité

Logs :

```text
Pino
```

Monitoring :

```text
Prometheus

Grafana
```

Erreurs :

```text
Sentry
```

---

# 24. Évolution Future

## V2

* Wishlist
* Notifications push
* Historique avancé

---

## V3

* Assistant IA
* Analyse automatique des besoins
* Scoring intelligent

---

## V4

* Marketplace partenaires
* Réseau de techniciens
* Services à domicile

---

# 25. Roadmap Développement

## Sprint 1

Fondations

* Monorepo
* Docker
* PostgreSQL
* NestJS
* Next.js

---

## Sprint 2

Catalogue

* Produits
* Catégories
* Marques

---

## Sprint 3

Recommandation

* Questionnaire
* Scoring

---

## Sprint 4

Comparateur

---

## Sprint 5

Commandes

---

## Sprint 6

Maintenance

---

## Sprint 7

CMS

---

## Sprint 8

Administration

---

# Conclusion

Tu disposes maintenant des 4 documents fondateurs :

1. Vision Produit
2. Cahier des Charges Fonctionnel
3. Domain Model DDD
4. ERD V2 Production
5. Architecture Applicative
