# DOMAIN MODEL DDD

# Plateforme de Conseil, Vente d'Ordinateurs et Services Informatiques

Version : 1.0

Statut : Architecture Métier

---

# 1. Vision Produit

## Mission

Permettre à chaque utilisateur de trouver la solution informatique la plus adaptée à son besoin réel grâce à une plateforme combinant :

* conseil ;
* comparaison ;
* recommandation ;
* vente ;
* maintenance ;
* accompagnement.

La plateforme ne vend pas uniquement des produits.

Elle aide à prendre une décision.

---

# 2. Vision Métier

Le cœur du système n'est pas le catalogue.

Le cœur du système est :

```text
Besoin utilisateur
↓
Analyse
↓
Recommandation
↓
Comparaison
↓
Décision
↓
Commande
↓
Accompagnement
```

Le produit doit donc être construit autour du besoin plutôt qu'autour des marques.

---

# 3. Principes Métier

## Principe 1

Le besoin est plus important que la marque.

## Principe 2

Le conseil est plus important que la vente.

## Principe 3

Le reconditionné doit être considéré comme un produit de confiance.

## Principe 4

Chaque produit doit être associé à des usages.

## Principe 5

Chaque utilisateur doit pouvoir comprendre une recommandation.

---

# 4. Bounded Contexts

Le système est découpé en plusieurs domaines métier indépendants.

## Liste des domaines

1. Identity & Access
2. Customer
3. Product Catalog
4. Recommendation
5. Refurbishment
6. Inventory
7. Ordering
8. Payments
9. Maintenance
10. Accessory Requests
11. Content
12. Notifications
13. Analytics
14. Administration

---

# 5. Identity & Access Context

## Objectif

Gérer les accès.

## Responsabilités

* authentification
* autorisation
* rôles
* permissions
* sécurité

## Agrégat principal

User

### Entités

User
Role
Permission
Session
RefreshToken

## Événements

UserCreated

UserLoggedIn

PasswordChanged

RoleAssigned

PermissionGranted

---

# 6. Customer Context

## Objectif

Représenter les clients.

## Agrégat principal

Customer

### Entités

Customer
Profile
Address
Preference
RecommendationHistory

## Responsabilités

* informations personnelles
* historique
* préférences
* habitudes

## Cas métier

Un client peut :

* recevoir des recommandations
* commander
* demander un service
* demander un accessoire spécifique

---

# 7. Product Catalog Context

## Objectif

Gérer les produits.

## Agrégat principal

Product

### Entités

Product
Brand
Category
Specification
Media
Warranty

## Responsabilités

* référencement
* présentation
* classification
* recherche

## Invariants

Un produit doit :

* appartenir à une catégorie
* posséder une marque
* posséder une fiche descriptive
* posséder au moins une image

---

# 8. Product Types

## Ordinateurs

Sous-types :

* bureautique
* étudiant
* professionnel
* développeur
* gaming
* création

## Audio

Sous-types :

* casque
* écouteur
* micro-casque

## Services

Sous-types :

* nettoyage
* maintenance
* diagnostic
* assistance

---

# 9. Recommendation Context

## Objectif

Transformer un besoin en recommandation.

---

## Agrégat principal

Recommendation

---

### Entités

Questionnaire

UserProfile

Recommendation

RecommendationScore

RecommendationRule

---

## Entrées

Budget

Usage

Mobilité

Préférence neuf/reconditionné

Préférence écran

---

## Sorties

Produits recommandés

Score

Explication

Comparaison

---

## Invariants

Une recommandation doit être explicable.

L'utilisateur doit comprendre pourquoi un produit est proposé.

---

# 10. Refurbishment Context

## Objectif

Rassurer le client.

---

## Agrégat principal

RefurbishedDevice

---

### Entités

InspectionReport

BatteryReport

ComponentReplacement

QualityCheck

Warranty

---

## Grades

A+

A

B

C

---

## Invariants

Chaque produit reconditionné doit :

* avoir été inspecté
* avoir une garantie
* avoir un rapport d'état

---

# 11. Inventory Context

## Objectif

Gérer les disponibilités.

---

## Agrégat principal

StockItem

---

### Entités

Stock

Reservation

Movement

WarehouseLocation

---

## Mouvements

Entrée

Sortie

Réservation

Ajustement

Retour

---

# 12. Ordering Context

## Objectif

Transformer une intention d'achat en commande.

---

## Agrégat principal

Order

---

### Entités

Cart

CartItem

Order

OrderItem

Delivery

---

## Workflow

Panier

Validation

Paiement

Préparation

Expédition

Livraison

Clôture

---

# 13. Payments Context

## Objectif

Encaisser les paiements.

---

### Entités

Payment

Transaction

Refund

PaymentMethod

---

## Méthodes futures

Mobile Money

Carte bancaire

Virement

Paiement à la livraison

---

# 14. Maintenance Context

## Objectif

Gérer les interventions techniques.

---

### Entités

ServiceRequest

Device

Diagnosis

Intervention

Technician

ServiceHistory

---

## Services

Nettoyage

Changement pâte thermique

Diagnostic

Installation système

Optimisation

Assistance

---

# 15. Accessory Request Context

## Objectif

Trouver des accessoires non présents dans le catalogue.

---

### Entités

AccessoryRequest

Supplier

Quote

Response

Validation

---

## Workflow

Demande

Recherche

Devis

Validation

Commande

Livraison

---

# 16. Content Context

## Objectif

Éduquer l'utilisateur.

---

### Entités

Article

Guide

Video

FAQ

Category

Tag

Author

---

## Types de contenus

Guide d'achat

Comparatif

Conseil

Tutoriel

Maintenance

Actualité

---

# 17. Notification Context

## Objectif

Informer l'utilisateur.

---

### Entités

Notification

Template

Channel

DeliveryLog

---

## Canaux

Email

SMS

WhatsApp (future)

Push (future)

---

# 18. Analytics Context

## Objectif

Comprendre le comportement utilisateur.

---

### Entités

PageView

SearchEvent

RecommendationEvent

ComparisonEvent

PurchaseEvent

---

## KPIs

Taux de conversion

Produits consultés

Produits comparés

Demandes maintenance

Demandes accessoires

---

# 19. Administration Context

## Objectif

Piloter la plateforme.

---

### Entités

AdminUser

AuditLog

Setting

FeatureFlag

ModerationAction

---

## Responsabilités

Gestion catalogue

Gestion contenus

Gestion commandes

Gestion services

Gestion utilisateurs

Gestion sécurité

---

# 20. Domain Events

## ProductCreated

Produit ajouté

## ProductUpdated

Produit modifié

## ProductPublished

Produit visible

## RecommendationGenerated

Recommandation créée

## OrderPlaced

Commande passée

## PaymentConfirmed

Paiement confirmé

## ServiceRequested

Maintenance demandée

## AccessoryRequested

Accessoire demandé

## ArticlePublished

Contenu publié

---

# 21. Ubiquitous Language

Client

Produit

Usage

Recommandation

Score

Comparaison

Garantie

Reconditionné

Maintenance

Accessoire

Commande

Paiement

Diagnostic

Intervention

---

# 22. Roadmap Domain Evolution

Phase 1

Catalogue
Recommandation
Comparateur
Maintenance

Phase 2

Compte client
Wishlist
Historique

Phase 3

Assistant IA

Phase 4

Marketplace partenaires

Phase 5

Écosystème informatique complet

---

# Conclusion

Le modèle métier est centré sur :

Besoin utilisateur → Recommandation → Décision → Achat → Accompagnement

C'est ce domaine métier qui pilotera ensuite :

* l'ERD V2 ;
* les API ;
* les services NestJS ;
* les interfaces Next.js ;
* les workflows métier ;
* les règles de sécurité ;
* les indicateurs de performance.
