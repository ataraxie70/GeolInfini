# MyWeather - Work Lab

## 🎯 Objectif de ce dossier

Ce dossier `work_lab` contient **toute la documentation de conception** de la plateforme MyWeather avant l'implémentation. Chaque fichier `.md` décrit un aspect spécifique du projet.

---

## 📁 Structure des dossiers

```
work_lab/
├── README.md                 # Ce fichier - guide de navigation
├── 00-overview/              # Vue d'ensemble du projet
│   ├── README.md             # Navigation overview
│   ├── project-context.md    # Contexte, objectifs, utilisateurs
│   └── glossary.md           # Glossaire des termes
│
├── 01-architecture/          # Architecture système
│   ├── README.md             # Navigation architecture
│   ├── global-architecture.md # Architecture globale
│   ├── backend-architecture.md # Détails backend
│   ├── frontend-architecture.md # Détails frontend
│   └── diagrams/             # Diagrammes (UML, flux, etc.)
│       ├── component-diagram.md
│       ├── deployment-diagram.md
│       └── sequence-diagrams.md
│
├── 02-data-flow/             # Flux de données (CŒUR DE LA PLATEFORME)
│   ├── README.md             # Navigation data flow
│   ├── data-pipeline.md      # Pipeline complet API → Utilisateur
│   ├── raw-data-format.md    # Format des données brutes (APIs)
│   ├── processed-data-format.md # Format traité (simplifié)
│   ├── transformation-rules.md # Règles de transformation
│   ├── coherence-checks.md   # Vérifications de cohérence
│   └── simple-language.md    # Guide de simplification du langage
│
├── 03-api-specs/             # Spécifications API
│   ├── README.md             # Navigation API
│   ├── endpoints.md          # Liste des endpoints
│   ├── request-response.md   # Formats des requêtes/réponses
│   ├── authentication.md     # Authentification (JWT)
│   └── rate-limiting.md      # Limites de taux
│
├── 04-frontend/              # Spécifications Frontend
│   ├── README.md             # Navigation frontend
│   ├── components.md         # Composants React
│   ├── pages.md              # Pages de l'application
│   ├── state-management.md   # Redux Toolkit
│   └── mockups.md            # Maquettes
│
├── 05-infrastructure/        # Infrastructure & Déploiement
│   ├── README.md             # Navigation infrastructure
│   ├── docker-compose.md     # Configuration Docker
│   ├── environment-vars.md   # Variables d'environnement
│   └── monitoring.md         # Monitoring (Prometheus/Grafana)
│
└── 06-tests/                 # Stratégie de tests
    ├── README.md             # Navigation tests
    ├── unit-tests.md         # Tests unitaires
    ├── integration-tests.md  # Tests d'intégration
    └── e2e-tests.md          # Tests end-to-end
```

---

## 🚀 Comment utiliser ce dossier

### Pour comprendre le projet
1. Commencer par `00-overview/project-context.md`
2. Puis `01-architecture/global-architecture.md`
3. Ensuite `02-data-flow/data-pipeline.md` (cœur de la plateforme)

### Pour implémenter
1. Backend → `03-api-specs/`
2. Frontend → `04-frontend/`
3. Infrastructure → `05-infrastructure/`
4. Tests → `06-tests/`

---

## 📝 État d'avancement

| Dossier | Statut | Description |
|---------|--------|-------------|
| 00-overview | 🟡 En cours | Contexte et glossaire |
| 01-architecture | 🟡 En cours | Architecture globale |
| 02-data-flow | 🔴 À faire | Pipeline de données |
| 03-api-specs | 🔴 À faire | API |
| 04-frontend | 🔴 À faire | Frontend |
| 05-infrastructure | 🔴 À faire | Infrastructure |
| 06-tests | 🔴 À faire | Tests |

**Légende** : 🟢 Validé | 🟡 En cours | 🔴 À faire

---

## 🔄 Mise à jour

Ce dossier est **vivant** - il évolue avec le projet. Après l'implémentation, il sert de documentation de référence.

*Dernière mise à jour : 2026-04-21*
