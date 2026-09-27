# 01-architecture - Architecture Système

## Navigation

| Fichier | Description |
|---------|-------------|
| [global-architecture.md](./global-architecture.md) | Architecture globale du système |
| [backend-architecture.md](./backend-architecture.md) | Architecture détaillée du backend |
| [frontend-architecture.md](./frontend-architecture.md) | Architecture détaillée du frontend |
| [diagrams/component-diagram.md](./diagrams/component-diagram.md) | Diagramme des composants |
| [diagrams/deployment-diagram.md](./diagrams/deployment-diagram.md) | Diagramme de déploiement |
| [diagrams/sequence-diagrams.md](./diagrams/sequence-diagrams.md) | Diagrammes de séquence |

---

## Contenu

Cette section contient les documents d'**architecture technique** :
- Vue d'ensemble du système
- Composants et leurs interactions
- Technologies utilisées
- Schémas de déploiement

---

## Diagramme rapide

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Frontend  │────▶│   Backend   │────▶│  Données    │
│   (React)   │     │  (FastAPI)  │     │  (PostgreSQL│
│             │◀────│             │◀────│   InfluxDB) │
└─────────────┘     └─────────────┘     └─────────────┘
                           │
                           ▼
                    ┌─────────────┐
                    │   Workers   │
                    │  (Celery)   │
                    └─────────────┘
```

---

*Retour au [README principal](../README.md)*
