# MyWeather - Plateforme de Surveillance Climatique du Burkina Faso

## PROJECT OVERVIEW

| Field | Value |
|-------|-------|
| **Name** | MyWeather |
| **Type** | Platform complexe - Climate Monitoring & Alert System |
| **Description** | Plateforme d'alerte et d'information climatique pour protéger les populations du Burkina Faso contre les risques liés aux changements climatiques (chaleur, sécheresse, inondations, vagues de poussière) |
| **Security Level** | High |
| **Compliance** | GDPR, OCHA standards |

## CONTEXTE

Le Burkina Faso est particulièrement vulnérable aux variations climatiques:
- **Vagues de chaleur** croissante (>40°C frecuencia)
- **Sécheresses** prolongées affectant agriculture et élevage
- **Inondations** soudaines en saison humide
- **Vagues de poussière** harmsane (Harmattan)
- **Pluies irrégulières** impacting crops

## TECH STACK

### Backend
- Language: Python 3.11+
- Framework: FastAPI
- ORM: SQLAlchemy
- Task Queue: Celery (RabbitMQ backend)

### Frontend
- Framework: React 18
- State: Redux Toolkit
- Maps: Leaflet + React-Leaflet
- UI: TailwindCSS

### Data Layer
- Primary DB: PostgreSQL 15 + PostGIS
- Time Series: InfluxDB 2.x
- Cache: Redis 7
- Queue: RabbitMQ 3.12

### Infrastructure
- Container: Docker + Docker Swarm
- Monitoring: Prometheus + Grafana
- Logging: ELK Stack (future)

## ARCHITECTURE

```
┌─────────────────────────────────────────────────────────────┐
│                      FRONTEND (React)                        │
│            Weather Dashboard, Alert Maps, Advice            │
└─────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────┴─────────┐
                    ▼                   ▼
        ┌──────────────────┐  ┌──────────────────┐
        │   REST API        │  │   WebSocket      │
        │   (FastAPI)       │  │   (Real-time)    │
        └──────────────────┘  └──────────────────┘
                    │                   │
        ┌───────────┴───────────────────┴───────────┐
        ▼                                           ▼
┌──────────────────┐                   ┌──────────────────┐
│   Celery Workers  │                   │   InfluxDB      │
│   - Weather Fetch│                   │   (Time Series)  │
│   - Alert Process│                   └──────────────────┘
│   - SMS/Email    │
└──────────────────┘
        │
        ▼
┌──────────────────┐     ┌──────────────────┐
│   PostgreSQL     │     │   Redis          │
│   + PostGIS      │     │  (Cache/Sessions)│
└──────────────────┘     └──────────────────┘
```

## FEATURES

### 1. Weather Monitoring
- [ ] Real-time data from multiple sources (Meteo France, OpenWeatherMap, local stations)
- [ ] Temperature, humidity, wind, precipitation tracking
- [ ] Air quality index (AQI)
- [ ] Historical data visualization

### 2. Alert System
- [ ] Multi-channel alerts: SMS, Email, Push notifications
- [ ] Geographic targeting (by region, department)
- [ ] Configurable thresholds per hazard type
- [ ] Alert confirmation workflow

### 3. Mapping & Visualization
- [ ] Interactive map with weather layers
- [ ] Alert zones overlay
- [ ] Population density integration
- [ ] Vulnerability zones mapping

### 4. Forecasting
- [ ] Statistical forecasting models
- [ ] ML-based predictions (temperature, rainfall)
- [ ] 7-day and 30-day outlook

### 5. Advice & Recommendations
- [ ] Health advice (heat stroke prevention, dust protection)
- [ ] Agricultural recommendations (planting, irrigation)
- [ ] Livestock management tips
- [ ] Water conservation guidance

## HAZARD-SPECIFIC ALERTS

| Hazard | Trigger Threshold | Channels | Advice Category |
|--------|-------------------|----------|------------------|
| Heat Wave | >40°C for 3+ days | SMS, Email, Push | Health |
| Drought | <10mm rain for 30+ days | Email, Push | Agriculture |
| Flooding | >50mm rain in 24h | SMS, Push | Emergency |
| Dust Storm | AQI >200 | SMS, Push | Health |
| Irregular Rainfall | Anomaly detected | Email | Agriculture |

## SECURITY REQUIREMENTS

### Authentication
- JWT tokens with 24h expiry
- Refresh tokens for extended sessions
- Rate limiting: 100 req/min per user

### Data Protection
- Encryption at rest (AES-256)
- TLS 1.3 in transit
- Phone numbers stored hashed (for SMS alerts)
- Audit logging for all data access

### API Security
- Input validation on all endpoints
- SQL injection prevention (ORM + parameterized queries)
- XSS prevention (output encoding)
- CORS configured for frontend origins only

## PROJECT STRUCTURE

```
MyWeather/
├── src/
│   ├── api/                    # FastAPI application
│   │   ├── routes/             # API endpoints
│   │   ├── middleware/         # Auth, rate limiting
│   │   └── models/             # Pydantic schemas
│   ├── core/                   # Core configurations
│   │   ├── config.py           # Environment config
│   │   ├── security.py         # JWT, hashing
│   │   └── database.py         # DB connections
│   ├── models/                 # SQLAlchemy models
│   ├── services/               # Business logic
│   │   ├── weather/            # Weather data processing
│   │   ├── alerts/             # Alert management
│   │   ├── forecasting/        # ML predictions
│   │   └── advice/             # Recommendation engine
│   ├── workers/                # Celery tasks
│   └── utils/                  # Utilities
├── frontend/                   # React application
│   ├── src/
│   │   ├── components/         # UI components
│   │   ├── pages/              # Page components
│   │   ├── services/           # API calls
│   │   ├── store/              # Redux store
│   │   └── utils/              # Helpers
│   └── public/
├── infra/                      # Infrastructure as Code
│   ├── docker/                 # Docker configs
│   └── monitoring/             # Prometheus/Grafana
├── tests/                      # Test suite
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── data/                       # Local data, CSV imports
├── CLAUDE.md                   # This file
└── README.md
```

## CODING STANDARDS

### Python
- Style: Black formatter
- Linter: Ruff
- Type checking: mypy

### JavaScript/React
- Style: ESLint + Prettier
- Framework: React 18 + TypeScript

### Git Workflow
- Branch: GitFlow
- Commits: Conventional Commits
- PR: 2 approvals for main, 1 for dev

### Testing
- Coverage target: 80%
- Unit: pytest + pytest-cov
- Integration: pytest with test containers
- E2E: Playwright

## API ENDPOINTS (Planned)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/v1/weather/current | Current weather data |
| GET | /api/v1/weather/forecast | 7-day forecast |
| GET | /api/v1/alerts | Active alerts |
| POST | /api/v1/alerts | Create alert |
| GET | /api/v1/regions | List regions |
| GET | /api/v1/regions/{id}/weather | Region weather |
| GET | /api/v1/advice | Get advice by category |
| POST | /api/v1/subscriptions | Subscribe to alerts |

## ENVIRONMENT VARIABLES

```bash
# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/myweather

# Redis
REDIS_URL=redis://localhost:6379/0

# RabbitMQ
RABBITMQ_URL=amqp://guest:guest@localhost:5672//

# External APIs
METEO_FRANCE_API_KEY=xxx
OPENWEATHERMAP_API_KEY=xxx

# JWT
JWT_SECRET_KEY=xxx
JWT_ALGORITHM=HS256

# SMS Provider (e.g., Twilio)
SMS_PROVIDER=twilio
SMS_API_KEY=xxx
```

## REGIONS (Burkina Faso)

13 régions administratives:
- Nord: Boulder, Oubritenga, Passoré, Yatenga
- Centre: Kadiogo
- Est: Boulgou, Koulpélogo, Gourma
- Ouest: Houet, Kénédougou, Léraba, Mouhoun
- Sud-Ouest: Bougouriba, Ioba, Noumbiel, Poni
- Centre-Est: Bazèga, Manga, Ziro
- Centre-Sud: Nahouri, Ziro, Sissili

## ARCHITECTURE DECISIONS (ADR)

| ID | Date | Decision | Status |
|----|------|----------|--------|
| ADR-001 | 2026-04-21 | FastAPI over Django for async weather processing | Accepted |
| ADR-002 | 2026-04-21 | InfluxDB for time-series weather data | Accepted |
| ADR-003 | 2026-04-21 | Celery + RabbitMQ for background tasks | Accepted |
| ADR-004 | 2026-04-21 | PostGIS for geographic queries | Accepted |

## DEPLOYMENT

### Environments
| Environment | URL | Description |
|-------------|-----|-------------|
| Dev | localhost:3000 | Local development |
| Staging | staging.myweather.bf | Pre-production |
| Production | myweather.bf | Production |

### Health Checks
- API: GET /health
- Prometheus: /metrics