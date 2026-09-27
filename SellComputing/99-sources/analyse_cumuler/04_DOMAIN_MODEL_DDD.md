# 04 — Modèle métier DDD

## 1. Domaine racine

Domaine principal :

**Plateforme de conseil, vente d’ordinateurs, accessoires audio et services techniques**.

## 2. Vision métier

Le système est orienté :

```text
besoin utilisateur -> analyse -> recommandation -> comparaison -> décision -> commande -> service
```

## 3. Bounded Contexts

| Contexte | Responsabilité |
|---|---|
| Identity & Access | authentification, rôles, permissions |
| Customer | profils et préférences |
| Catalog | produits, marques, catégories |
| Recommendation | scoring et justification |
| Refurbishment | contrôle, état, grade |
| Inventory | quantités et réservation |
| Ordering | commande et lignes |
| Payments | paiement et statut |
| Maintenance | demandes techniques |
| Accessory Requests | demandes hors catalogue |
| Content | guides, FAQ, articles |
| Notifications | événements et messages |
| Analytics | suivi des indicateurs |
| Administration | gestion et gouvernance |

## 4. Agrégats principaux

### Identity & Access

- User
- Role
- Permission
- Session
- RefreshToken

### Customer

- Customer
- Profile
- Address
- Preference
- RecommendationHistory

### Catalog

- Brand
- Category
- Product
- ProductVariant
- ProductSpecification
- ProductImage

### Recommendation

- Recommendation
- RecommendationRule
- RecommendationScore
- RecommendationResult

### Refurbishment

- RefurbishmentReport
- BatteryReport
- QualityCheck
- Certificate

### Ordering

- Order
- OrderItem
- OrderStatusHistory

### Maintenance

- ServiceRequest
- ServiceUpdate

### Accessory Requests

- AccessoryRequest

## 5. Invariants métier

- une catégorie peut être hiérarchique ;
- un produit doit appartenir à une marque et à une catégorie ;
- une variante porte le prix et l’état commercial ;
- une recommandation doit être explicable ;
- une commande doit contenir au moins une ligne ;
- une demande de service doit être historisée ;
- un rapport de reconditionnement doit tracer les contrôles.

## 6. Événements de domaine

- UserCreated
- UserLoggedIn
- ProfileUpdated
- ProductCreated
- ProductUpdated
- RecommendationGenerated
- OrderPlaced
- PaymentConfirmed
- ServiceRequested
- AccessoryRequested
- RefurbishmentValidated

## 7. Philosophie d’isolement

Chaque contexte métier doit être isolé par contrat.  
Le partage direct de tables entre contextes doit être évité.  
La cohérence transversale doit passer par événements ou services applicatifs.

## 8. Conséquence d’architecture

Cette découpe permet :

- testabilité ;
- remplacement partiel ;
- évolutivité ;
- maîtrise des dépendances ;
- réduction de la dette de couplage.
