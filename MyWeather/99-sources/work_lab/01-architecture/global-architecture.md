# Architecture Globale - MyWeather

## Vue d'Ensemble

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         MYWEATHER PLATFORM                                  │
│            Plateforme de Surveillance Climatique - Burkina Faso             │
└─────────────────────────────────────────────────────────────────────────────┘

                              UTILISATEURS
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        │                           │                           │
        ▼                           ▼                           ▼
   ┌─────────┐               ┌─────────┐               ┌─────────┐
   │ Mobile  │               │ Desktop │               │  SMS/   │
   │  (PWA)  │               │  (Web)  │               │  Email  │
   └────┬────┘               └────┬────┘               └────┬────┘
        │                         │                         │
        └─────────────────────────┼─────────────────────────┘
                                  │
                                  ▼
                    ┌─────────────────────────┐
                    │    NGINX (Reverse)      │
                    │    Load Balancer        │
                    │    SSL/TLS              │
                    └───────────┬─────────────┘
                                │
                                ▼
        ┌───────────────────────────────────────────────────┐
        │              COUCHE APPLICATION                   │
        │                                                   │
        │  ┌─────────────────────────────────────────┐     │
        │  │         FRONTEND (React 18)             │     │
        │  │  - Dashboard                            │     │
        │  │  - Cartes interactives (Leaflet)        │     │
        │  │  - Alertes & Conseils                   │     │
        │  │  - Redux Toolkit (State)                │     │
        │  └─────────────────────────────────────────┘     │
        │                                                   │
        │  ┌─────────────────────────────────────────┐     │
        │  │         BACKEND (FastAPI)               │     │
        │  │  - API REST                             │     │
        │  │  - Authentification JWT                 │     │
        │  │  - Rate Limiting                        │     │
        │  │  - Middleware                           │     │
        │  └─────────────────────────────────────────┘     │
        │                                                   │
        │  ┌─────────────────────────────────────────┐     │
        │  │         WORKERS (Celery)                │     │
        │  │  - Fetch Météo                          │     │
        │  │  - Processing                           │     │
        │  │  - Notifications                        │     │
        │  └─────────────────────────────────────────┘     │
        └───────────────────────────────────────────────────┘
                                │
        ┌───────────────────────┼───────────────────────┐
        │                       │                       │
        ▼                       ▼                       ▼
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│  PostgreSQL   │     │    Redis      │     │   RabbitMQ    │
│  + PostGIS    │     │   (Cache)     │     │   (Queue)     │
│  (Données)    │     │  (Sessions)   │     │  (Tâches)     │
└───────────────┘     └───────────────┘     └───────────────┘
        │
        ▼
┌───────────────┐
│   InfluxDB    │
│ (Time Series) │
└───────────────┘
```

---

## Composants Principaux

### 1. Frontend (React 18)

**Rôle** : Interface utilisateur, affichage des données météo, cartes interactives

**Technologies** :
- React 18 + TypeScript
- Redux Toolkit (state management)
- React Router (navigation)
- Leaflet + React-Leaflet (cartes)
- TailwindCSS + DaisyUI (style)
- Axios (requêtes API)

**Composants clés** :
```
frontend/src/
├── components/
│   ├── ui/              # Boutons, cartes, modales
│   ├── layout/          # Header, Sidebar, Footer
│   ├── weather/         # CurrentWeather, ForecastChart
│   ├── alerts/          # AlertList, AlertCard
│   ├── maps/            # WeatherMap, AlertLayer
│   └── advice/          # AdviceCard, AdviceList
├── pages/
│   ├── Dashboard.tsx
│   ├── WeatherPage.tsx
│   ├── AlertsPage.tsx
│   ├── MapPage.tsx
│   ├── LoginPage.tsx
│   └── RegisterPage.tsx
└── store/
    └── slices/          # auth, weather, alerts, regions
```

---

### 2. Backend (FastAPI)

**Rôle** : API REST, authentification, business logic, orchestration

**Technologies** :
- FastAPI (framework web async)
- Uvicorn (serveur ASGI)
- SQLAlchemy (ORM)
- Pydantic (validation)
- python-jose (JWT)
- passlib (password hashing)

**Structure** :
```
src/
├── api/
│   ├── main.py              # App FastAPI
│   ├── deps.py              # Dépendances (get_db, get_user)
│   └── routes/
│       ├── auth.py          # /api/v1/auth/*
│       ├── weather.py       # /api/v1/weather/*
│       ├── alerts.py        # /api/v1/alerts/*
│       ├── regions.py       # /api/v1/regions/*
│       ├── advice.py        # /api/v1/advice/*
│       └── subscriptions.py # /api/v1/subscriptions/*
├── core/
│   ├── config.py            # Settings (env vars)
│   ├── database.py          # DB connection
│   ├── security.py          # JWT, hashing
│   └── rate_limiter.py      # Rate limiting
├── models/                  # SQLAlchemy models
├── schemas/                 # Pydantic schemas
└── services/                # Business logic
    ├── auth/
    ├── weather/
    ├── alerts/
    └── advice/
```

---

### 3. Workers (Celery)

**Rôle** : Tâches background périodiques (fetch météo, notifications)

**Technologies** :
- Celery 5.3
- Celery Beat (scheduler)
- RabbitMQ (message broker)

**Tâches principales** :
```python
# src/workers/tasks/

@celery_app.task
def fetch_weather_task():
    """Collecte les données météo toutes les 15 min"""

@celery_app.task
def process_weather_task(source: str, data_id: UUID):
    """Traite les données brutes (conversion, validation)"""

@celery_app.task
def check_alerts_task():
    """Vérifie les seuils d'alerte toutes les 15 min"""

@celery_app.task
def send_notifications_task(alert_id: UUID):
    """Envoie les notifications SMS/Email/Push"""
```

---

### 4. Base de Données (PostgreSQL + PostGIS)

**Rôle** : Stockage des données utilisateurs, alertes, régions, historique météo

**Schéma principal** :
```sql
-- Utilisateurs
users (id, email, phone_hash, password_hash, role, is_active)

-- Régions et Départements (données géographiques)
regions (id, name, code, geometry, population)
departments (id, name, code, geometry, region_id)

-- Alertes
alerts (id, title, message, severity, status, region_id, type_id)
alert_types (id, name, code, threshold_config)

-- Conseils
advice (id, category, hazard_type, title, content, language)

-- Abonnements
user_subscriptions (id, user_id, region_id, channels, hazard_types)

-- Historique météo (récent)
weather_observations (id, station_id, region_id, timestamp, temp, humidity...)

-- Audit
audit_logs (id, user_id, action, resource_type, details)
```

---

### 5. Time-Series (InfluxDB)

**Rôle** : Stockage optimisé des séries temporelles météo (historique complet)

**Buckets** :
```
raw_measurements       → Données brutes des APIs
processed_measurements → Données traitées
forecast_data          → Prévisions
```

**Exemple de requête** :
```python
# Récupérer l'historique 7 jours
query = """
  from(bucket: "processed_measurements")
    |> range(start: -7d)
    |> filter(fn: (r) => r._measurement == "weather")
    |> filter(fn: (r) => r.region == "centre")
    |> filter(fn: (r) => r._field == "temperature")
    |> aggregateWindow(every: 1h, fn: mean)
"""
```

---

### 6. Cache (Redis)

**Rôle** : Cache rapide, sessions utilisateurs, rate limiting

**Utilisations** :
```python
# Cache des données météo (TTL 15 min)
redis.setex(f"weather:centre", 900, json.dumps(data))

# Sessions utilisateurs (TTL 24h)
redis.setex(f"session:{user_id}", 86400, access_token)

# Rate limiting (100 req/min)
redis.incr(f"ratelimit:{user_id}:{minute}")
```

---

### 7. Queue (RabbitMQ)

**Rôle** : File d'attente pour les tâches Celery

**Queues** :
```
celery          → Tâches par défaut
celery:weather  → Tâches météo (priorité haute)
celery:alerts   → Tâches d'alerte (priorité critique)
celery:notify   → Tâches de notification
```

---

## Flux de Données Principal

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    FLUX: DONNÉE MÉTÉO                                   │
└─────────────────────────────────────────────────────────────────────────┘

  ┌─────────────┐
  │ APIs Météo  │  (Meteo France, OpenWeatherMap)
  └──────┬──────┘
         │
         │ 1. Fetch toutes les 15 min (Celery Beat)
         ▼
  ┌─────────────────┐
  │ fetch_weather   │  (Worker Celery)
  └──────┬──────────┘
         │
         │ 2. Stockage brut
         ▼
  ┌─────────────────┐
  │ PostgreSQL      │  raw_weather_data (JSONB)
  │ InfluxDB        │  raw_measurements
  └──────┬──────────┘
         │
         │ 3. Trigger traitement
         ▼
  ┌─────────────────┐
  │ process_weather │  (Worker Celery)
  └──────┬──────────┘
         │
         │ 4. Conversion + Validation
         │    - Kelvin → Celsius
         │    - Vérification cohérence
         │    - Score de confiance
         ▼
  ┌─────────────────┐
  │ PostgreSQL      │  processed_weather_data
  │ Redis           │  Cache (TTL 15 min)
  └──────┬──────────┘
         │
         │ 5. Vérification seuils d'alerte
         ▼
  ┌─────────────────┐
  │ check_alerts    │  (Worker Celery)
  └──────┬──────────┘
         │
         │ 6. Si alerte détectée
         ▼
  ┌─────────────────┐
  │ send_alerts     │  (Worker Celery)
  └──────┬──────────┘
         │
         │ 7. Notifications
         ▼
  ┌─────────────────┐
  │ SMS / Email     │
  │ Push            │
  └─────────────────┘
```

---

## Flux: Utilisateur consulte la météo

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    FLUX: CONSULTATION MÉTÉO                             │
└─────────────────────────────────────────────────────────────────────────┘

  ┌─────────────┐
  │ Utilisateur │
  └──────┬──────┘
         │
         │ 1. Ouvre l'application
         ▼
  ┌─────────────────┐
  │ React App       │  (Dashboard)
  └──────┬──────────┘
         │
         │ 2. Requête API
         ▼
  ┌─────────────────┐
  │ GET /weather/   │  (FastAPI)
  │ current         │
  └──────┬──────────┘
         │
         │ 3. Check cache Redis
         ▼
  ┌─────────────────┐
  │ Redis Cache     │  (Si hit → retour immédiat)
  └──────┬──────────┘
         │ (Si miss)
         ▼
  ┌─────────────────┐
  │ PostgreSQL      │  processed_weather_data
  └──────┬──────────┘
         │
         │ 4. Réponse JSON simplifié
         ▼
  ┌─────────────────┐
  │ React Display   │  (Cartes, températures, conseils)
  └─────────────────┘
```

---

## Sécurité

### Couche de Sécurité

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    PYRAMIDE DE SÉCURITÉ                                 │
└─────────────────────────────────────────────────────────────────────────┘

                    ┌───────────┐
                    │  HTTPS    │  (TLS 1.3 obligatoire)
                    └─────┬─────┘
                          │
              ┌───────────┴───────────┐
              │    Authentification   │  (JWT 24h + Refresh)
              └───────────┬───────────┘
                          │
            ┌─────────────┴─────────────┐
            │       Rate Limiting       │  (100 req/min/user)
            └─────────────┬─────────────┘
                          │
          ┌───────────────┴───────────────┐
          │    Input Validation (Pydantic)│  (Tous les endpoints)
          └───────────────┬───────────────┘
                          │
        ┌─────────────────┴─────────────────┐
        │    ORM + Requêtes Paramétrées     │  (Anti SQL Injection)
        └─────────────────┬─────────────────┘
                          │
      ┌───────────────────┴───────────────────┐
      │    Output Encoding (React auto)       │  (Anti XSS)
      └───────────────────────────────────────┘
```

### Authentification Flow

```
┌──────────┐                              ┌──────────┐
│  Client  │                              │  Server  │
└────┬─────┘                              └────┬─────┘
     │                                        │
     │  POST /auth/login                      │
     │  {email, password}                     │
     │───────────────────────────────────────>│
     │                                        │
     │                                        │ [Verify password]
     │                                        │ [Generate JWT]
     │                                        │
     │  {access_token, refresh_token}         │
     │<───────────────────────────────────────│
     │                                        │
     │  [Stockage tokens (localStorage)]      │
     │                                        │
     │  GET /api/v1/weather/current           │
     │  Authorization: Bearer <access_token>  │
     │───────────────────────────────────────>│
     │                                        │
     │                                        │ [Decode JWT]
     │                                        │ [Check permissions]
     │                                        │
     │  {weather data}                        │
     │<───────────────────────────────────────│
     │                                        │
     │  [Token expiré après 24h]              │
     │                                        │
     │  POST /auth/refresh                    │
     │  {refresh_token}                       │
     │───────────────────────────────────────>│
     │                                        │
     │  {new_access_token}                    │
     │<───────────────────────────────────────│
```

---

## Monitoring

### Stack de Monitoring

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    MONITORING STACK                                     │
└─────────────────────────────────────────────────────────────────────────┘

  ┌─────────────────┐
  │   Prometheus    │  (Collecte métriques)
  └────────┬────────┘
           │
           │ Scraping toutes les 15s
           ▼
  ┌─────────────────┐     ┌─────────────────┐
  │  API Metrics    │     │  Worker Metrics │
  │  :8000/metrics  │     │  :8001/metrics  │
  └─────────────────┘     └─────────────────┘
  
  ┌─────────────────┐
  │    Grafana      │  (Visualisation dashboards)
  └────────┬────────┘
           │
           ▼
  ┌─────────────────────────────────────────────────────────────────────┐
  │  Dashboards:                                                        │
  │  - API Latency & Error Rate                                         │
  │  - Request Count per Endpoint                                       │
  │  - Worker Task Duration                                             │
  │  - Database Query Performance                                       │
  │  - Cache Hit Rate                                                   │
  │  - Alert Count by Severity                                          │
  └─────────────────────────────────────────────────────────────────────┘
```

### Métriques Clés

```python
# Métriques Prometheus exposées
REQUEST_COUNT = Counter(
    'http_requests_total',
    'Total HTTP requests',
    ['method', 'endpoint', 'status']
)

REQUEST_LATENCY = Histogram(
    'http_request_duration_seconds',
    'HTTP request latency',
    ['method', 'endpoint']
)

WEATHER_FETCH_COUNT = Counter(
    'weather_fetch_total',
    'Total weather fetch operations',
    ['source', 'status']
)

ALERT_COUNT = Gauge(
    'alerts_active',
    'Number of active alerts',
    ['severity', 'region']
)

CACHE_HIT_RATE = Gauge(
    'cache_hit_rate',
    'Redis cache hit rate percentage'
)
```

---

## Déploiement

### Environnements

| Environnement | URL | Description |
|---------------|-----|-------------|
| **Local** | localhost:3000 | Développement |
| **Staging** | staging.myweather.bf | Pré-production, tests |
| **Production** | myweather.bf | Production réelle |

### Docker Compose (Services)

```yaml
version: '3.9'

services:
  # Infrastructure
  database:    # PostgreSQL 15 + PostGIS
  redis:       # Redis 7 (cache)
  rabbitmq:    # RabbitMQ 3.12 (queue)
  influxdb:    # InfluxDB 2.7 (time-series)
  
  # Application
  api:         # FastAPI (Uvicorn)
  worker:      # Celery Worker
  frontend:    # React (Nginx)
  
  # Monitoring
  prometheus:  # Collecte métriques
  grafana:     # Dashboards
```

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : En attente de validation*
