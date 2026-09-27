# 06 — Architecture applicative

## 1. Architecture retenue

Architecture de référence :

- DDD ;
- Clean Architecture ;
- Hexagonal Architecture ;
- API REST ;
- front-end web séparé ;
- back-office séparé.

## 2. Découpage des couches

| Couche | Rôle |
|---|---|
| Domain | règles métier pures |
| Application | orchestration des cas d’usage |
| Infrastructure | base de données, fichiers, services externes |
| Interface | HTTP, CLI interne, webhooks, UI |

## 3. Modules backend

- IAM
- Customer
- Catalog
- Recommendation
- Refurbishment
- Inventory
- Ordering
- Payments
- Maintenance
- Accessory Requests
- Content
- Notifications
- Analytics
- Administration

## 4. Structure logique d’un module

```text
module/
├── domain/
├── application/
├── infrastructure/
├── interfaces/
└── tests/
```

## 5. Front-end

### Applications

- site public ;
- espace client ;
- espace administrateur.

### Fonctionnement

- pages publiques indexables ;
- parcours guidé ;
- tableaux de bord ;
- formulaires validés côté client et serveur.

## 6. Flux principaux

### Flux recommandation

```text
Questionnaire -> validation -> scoring -> classement -> explication -> affichage
```

### Flux commande

```text
Produit -> panier -> validation -> paiement -> confirmation -> suivi
```

### Flux maintenance

```text
Demande -> qualification -> prise en charge -> mise à jour -> clôture
```

## 7. Répartition des responsabilités

| Élément | Responsable |
|---|---|
| règles de score | domaine recommandation |
| stockage produit | catalogue / infrastructure |
| calcul du prix | ordering |
| validation sécurité | IAM / gateway |
| affichage UX | front-end |
| audit | infrastructure transversale |

## 8. Recherche et filtrage

La recherche doit être découplée du stockage principal.

Elle doit supporter :

- texte ;
- catégories ;
- état ;
- usages ;
- prix ;
- performance.

## 9. Cache

Le cache ne doit jamais contenir une vérité métier exclusive.  
Il sert uniquement d’accélérateur.

## 10. Observabilité

- logs structurés ;
- métriques de charge ;
- traces de requêtes ;
- audit métier ;
- alertes sur erreurs critiques.

## 11. Évolution

L’architecture doit permettre :

- extension des catégories ;
- ajout de nouveaux types de services ;
- ajout de nouvelles règles de recommandation ;
- ajout d’un module mobile ultérieur.
