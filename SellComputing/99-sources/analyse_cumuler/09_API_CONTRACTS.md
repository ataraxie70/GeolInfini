# 09 — Contrats d’interface API

## 1. Style général

- protocole : HTTP ;
- format : JSON ;
- versionnement : `/api/v1` ;
- authentification : jeton d’accès ;
- erreurs normalisées ;
- pagination explicite.

## 2. Ressources principales

### Auth

- `POST /api/v1/auth/login`
- `POST /api/v1/auth/logout`
- `POST /api/v1/auth/refresh`

### Catalogue

- `GET /api/v1/products`
- `GET /api/v1/products/{id}`
- `GET /api/v1/categories`
- `GET /api/v1/brands`

### Recommandation

- `POST /api/v1/recommendations`
- `GET /api/v1/recommendations/{id}`

### Comparaison

- `POST /api/v1/compare`

### Commandes

- `POST /api/v1/orders`
- `GET /api/v1/orders/{id}`

### Maintenance

- `POST /api/v1/service-requests`
- `GET /api/v1/service-requests/{id}`

### Accessoires

- `POST /api/v1/accessory-requests`

### Contenu

- `GET /api/v1/articles`
- `GET /api/v1/articles/{slug}`

## 3. Schéma de réponse minimal

```json
{
  "data": {},
  "meta": {},
  "error": null
}
```

## 4. Erreur standardisée

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "budget is required",
    "details": []
  }
}
```

## 5. Contrat de recommandation

### Requête minimale

```json
{
  "budget": 300000,
  "usage": "programming",
  "mobility": "high",
  "condition_preference": "any"
}
```

### Réponse minimale

```json
{
  "recommendations": [
    {
      "product_id": "uuid",
      "rank": 1,
      "score": 92,
      "reasons": [
        "RAM compatible with programming workloads",
        "SSD suitable for responsiveness",
        "weight favorable for mobility"
      ]
    }
  ]
}
```

## 6. Contrat de comparaison

Entrée :

- liste de produits ;
- maximum défini ;
- même catégorie de préférence.

Sortie :

- tableau de différences ;
- points forts ;
- points faibles.

## 7. Contrat de maintenance

Entrée :

- type de service ;
- description ;
- coordonnées ;
- urgence éventuelle.

Sortie :

- numéro de dossier ;
- statut ;
- délai estimé si disponible.

## 8. Règles d’interface

- toutes les entrées doivent être validées côté serveur ;
- toute réponse doit être déterministe pour des entrées identiques ;
- toute erreur doit être machine-readable ;
- toute donnée sensible doit être exclue des réponses publiques ;
- tout identifiant exposé doit être non séquentiel.

## 9. Évolutivité

Le contrat doit rester compatible avec :

- ajout de nouveaux champs ;
- ajout de nouveaux types de recommandation ;
- ajout de nouvelles catégories ;
- ajout de nouvelles actions d’administration.
