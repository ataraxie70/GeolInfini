# MyWeather - Plateforme de Surveillance Climatique du Burkina Faso

![Status](https://img.shields.io/badge/status-In%20Development-blue)
![Python](https://img.shields.io/badge/Python-3.11+-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

## Présentation

MyWeather est une plateforme d'alerte et d'information climatique destinée à protéger les populations du Burkina Faso contre les risques liés aux changements climatiques.

### Risques Climatiques Couverts

| Risque | Description | Seuil d'Alerte |
|--------|-------------|----------------|
| 🌡️ Vagues de Chaleur | Températures extrêmes >40°C | 3+ jours consécutifs |
| 🏜️ Sécheresse | Manque de pluie prolongé | <10mm/30 jours |
| 🌊 Inondations | Précipitations intenses | >50mm/24h |
| 🌫️ Vagues de Poussière | Tempêtes de sable (Harmattan) | AQI >200 |
| 🌧️ Pluies Irrégulières | Anomalies de précipitation | Détection ML |

## Architecture

```
MyWeather/
├── src/api/              # FastAPI REST API
├── src/services/         # Logique métier
├── src/workers/          # Tâches Celery (background)
├── frontend/             # React Dashboard
├── infra/                # Docker, monitoring
└── tests/                # Suite de tests
```

## Installation

### Prérequis

- Python 3.11+
- Docker & Docker Compose
- Ollama (pour les modèles AI)

### Setup Local

```bash
# Cloner le projet
cd MyWeather

# Setup avec Docker
docker-compose up -d

# Ou installation manuelle
pip install -r requirements.txt
```

### Démarrage

```bash
# API
uvicorn src.api.main:app --reload

# Workers Celery
celery -A src.workers.celery_app worker --loglevel=info

# Frontend
cd frontend && npm start
```

## Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection | postgresql://localhost:5432/myweather |
| `REDIS_URL` | Redis connection | redis://localhost:6379/0 |
| `JWT_SECRET_KEY` | Secret pour JWT | (à configurer) |

## API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/api/v1/weather/current` | Données météo actuelles |
| GET | `/api/v1/weather/forecast` | Prévisions 7 jours |
| GET | `/api/v1/alerts` | Alertes actives |
| POST | `/api/v1/alerts` | Créer une alerte |
| GET | `/api/v1/regions` | Liste des régions |
| GET | `/api/v1/advice` | Conseils par catégorie |

## Licence

MIT License - Voir [LICENSE](LICENSE)