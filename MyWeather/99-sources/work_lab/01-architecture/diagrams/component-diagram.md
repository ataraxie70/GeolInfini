# Diagramme des Composants

## Vue d'Ensemble

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         MYWEATHER - COMPONENTS                              │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────────┐
                              │   UTILISATEURS  │
                              │  - Citoyens     │
                              │  - Agriculteurs │
                              │  - Opérateurs   │
                              └────────┬────────┘
                                       │
                                       │ HTTPS
                                       ▼
                    ┌──────────────────────────────────────┐
                    │         REVERSE PROXY                │
                    │              NGINX                   │
                    │  - SSL/TLS Termination               │
                    │  - Load Balancing                    │
                    │  - Static Files                      │
                    └─────────────────┬────────────────────┘
                                      │
              ┌───────────────────────┼───────────────────────┐
              │                       │                       │
              ▼                       ▼                       ▼
    ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
    │   FRONTEND      │   │    BACKEND      │   │    WORKERS      │
    │    (React)      │   │   (FastAPI)     │   │   (Celery)      │
    │                 │   │                 │   │                 │
    │ ┌─────────────┐ │   │ ┌─────────────┐ │   │ ┌─────────────┐ │
    │ │  Dashboard  │ │   │ │   Routes    │ │   │ │   Weather   │ │
    │ │  Weather    │ │   │ │   Weather   │ │   │ │   Fetch     │ │
    │ │  Alerts     │ │◄─┼─┼─►   Alerts   │ │   │ │   Process   │ │
    │ │  Maps       │ │   │ │   Regions   │ │   │ │   Alerts    │ │
    │ │  Advice     │ │   │ │   Advice    │ │   │ │   Notify    │ │
    │ │  Auth       │ │   │ │   Auth      │ │   │ │   Schedule  │ │
    │ └─────────────┘ │   │ └─────────────┘ │   │ └─────────────┘ │
    │                 │   │                 │   │                 │
    │ ┌─────────────┐ │   │ ┌─────────────┐ │   │                 │
    │ │   Redux     │ │   │ │  Services   │ │   │                 │
    │ │   Store     │ │   │ │   Weather   │ │   │                 │
    │ │             │ │   │ │   Alerts    │ │   │                 │
    │ │ - auth      │ │   │ │   Advice    │ │   │                 │
    │ │ - weather   │ │   │ │   Geography │ │   │                 │
    │ │ - alerts    │ │   │ │   Forecast  │ │   │                 │
    │ └─────────────┘ │   │ └─────────────┘ │   │                 │
    └────────┬────────┘   └────────┬────────┘   └────────┬────────┘
             │                    │                      │
             │                    │                      │
             └────────────────────┼──────────────────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
              ▼                   ▼                   ▼
    ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
    │   PostgreSQL    │ │     Redis       │ │    RabbitMQ     │
    │   + PostGIS     │ │    (Cache)      │ │    (Queue)      │
    │                 │ │                 │ │                 │
    │ - users         │ │ - sessions      │ │ - celery        │
    │ - regions       │ │ - weather cache │ │ - weather tasks │
    │ - alerts        │ │ - rate limits   │ │ - alert tasks   │
    │ - advice        │ │                 │ │ - notify tasks  │
    │ - weather_hist  │ │                 │ │                 │
    └─────────────────┘ └─────────────────┘ └─────────────────┘
              │
              ▼
    ┌─────────────────┐
    │    InfluxDB     │
    │  (Time Series)  │
    │                 │
    │ - raw_data      │
    │ - processed     │
    │ - forecasts     │
    └─────────────────┘
```

---

## Frontend Components

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      FRONTEND ARCHITECTURE                                  │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────────┐
                              │      App.tsx    │
                              │   (Root +       │
                              │    Routing)     │
                              └────────┬────────┘
                                       │
              ┌────────────────────────┼────────────────────────┐
              │                        │                        │
              ▼                        ▼                        ▼
    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
    │  MainLayout     │    │   AuthLayout    │    │  AdminLayout    │
    │                 │    │                 │    │                 │
    │ - Header        │    │ - Logo          │    │ - Sidebar       │
    │ - Sidebar       │    │ - LoginForm     │    │ - UserMgmt      │
    │ - Footer        │    │ - RegisterForm  │    │ - AlertMgmt     │
    └────────┬────────┘    └─────────────────┘    └─────────────────┘
             │
             │ Pages
    ┌────────┼────────────────────────────────────────┐
    │        │                                        │
    ▼        ▼                                        ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Dashboard     │  │   WeatherPage   │  │   AlertsPage    │
│                 │  │                 │  │                 │
│ ┌─────────────┐ │  │ ┌─────────────┐ │  │ ┌─────────────┐ │
│ │AlertBanner  │ │  │ │CurrentWeather│ │  │ │AlertList    │ │
│ │WeatherCards │ │  │ │ForecastChart │ │  │ │AlertCard    │ │
│ │QuickMap     │ │  │ │WeatherStats  │ │  │ │CreateAlert  │ │
│ │ActiveAlerts │ │  │ │RegionSelect  │ │  │ │FilterPanel  │ │
│ └─────────────┘ │  │ └─────────────┘ │  │ └─────────────┘ │
└─────────────────┘  └─────────────────┘  └─────────────────┘

┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│    MapPage      │  │   AdvicePage    │  │   LoginPage     │
│                 │  │                 │  │                 │
│ ┌─────────────┐ │  │ ┌─────────────┐ │  │ ┌─────────────┐ │
│ │ WeatherMap  │ │  │ │AdviceList   │ │  │ │LoginForm    │ │
│ │ AlertLayer  │ │  │ │AdviceCard   │ │  │ │ForgotPass   │ │
│ │ RegionLayer │ │  │ │CategoryTabs │ │  │ │SocialLogin  │ │
│ │ MapControls │ │  │ │SearchBar    │ │  │ │RegisterLink │ │
│ └─────────────┘ │  │ └─────────────┘ │  │ └─────────────┘ │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

---

## Backend Components

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      BACKEND ARCHITECTURE                                   │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────────┐
                              │   main.py       │
                              │ (FastAPI App)   │
                              └────────┬────────┘
                                       │
              ┌────────────────────────┼────────────────────────┐
              │                        │                        │
              ▼                        ▼                        ▼
    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
    │   Middleware    │    │    Routers      │    │  Dependencies   │
    │                 │    │                 │    │   (deps.py)     │
    │ - CORS          │    │ - /auth         │    │                 │
    │ - Auth (JWT)    │    │ - /weather      │    │ - get_db        │
    │ - Rate Limit    │    │ - /alerts       │    │ - get_user      │
    │ - Logging       │    │ - /regions      │    │ - get_current_user
    └─────────────────┘    │ - /advice       │    │ - require_role  │
                           │ - /subscriptions│    └─────────────────┘
                           └────────┬────────┘
                                    │
                          ┌─────────┼─────────┐
                          │         │         │
                          ▼         ▼         ▼
                ┌─────────────────┐ ┌─────────────────┐
                │    Services     │ │     Models      │
                │                 │ │                 │
                │ ┌─────────────┐ │ │ ┌─────────────┐ │
                │ │AuthService  │ │ │ │   User      │ │
                │ │- register   │ │ │ │   Alert     │ │
                │ │- login      │ │ │ │   Region    │ │
                │ │- logout     │ │ │ │   Advice    │ │
                │ └─────────────┘ │ │ │   Weather   │ │
                │                 │ │ └─────────────┘ │
                │ ┌─────────────┐ │ │                 │
                │ │WeatherSvc   │ │ │ ┌─────────────┐ │
                │ │- fetch      │ │ │ │  Schemas    │ │
                │ │- process    │ │ │ │  (Pydantic) │ │
                │ │- validate   │ │ │ │             │ │
                │ └─────────────┘ │ │ - UserCreate  │ │
                │                 │ │ - WeatherResp │ │
                │ ┌─────────────┐ │ │ - AlertResp   │ │
                │ │AlertService │ │ │ └─────────────┘ │
                │ │- create     │ │ └─────────────────┘ │
                │ │- evaluate   │ │
                │ │- notify     │ │
                │ └─────────────┘ │
                │                 │
                │ ┌─────────────┐ │
                │ │AdviceService│ │
                │ │- get_by_cat │ │
                │ │- get_simple │ │
                │ └─────────────┘ │
                └─────────────────┘
```

---

## Worker Components

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       WORKER ARCHITECTURE                                   │
└─────────────────────────────────────────────────────────────────────────────┘

                    ┌─────────────────────────────────────┐
                    │         Celery Beat (Scheduler)     │
                    │                                     │
                    │  Schedule:                          │
                    │  - fetch_weather: */15 * * * *      │
                    │  - check_alerts: */15 * * * *       │
                    │  - cleanup_old: 0 2 * * *           │
                    └─────────────────┬───────────────────┘
                                      │
                                      │ Trigger Tasks
                                      ▼
                    ┌─────────────────────────────────────┐
                    │          Celery Workers             │
                    │                                     │
                    │  Queues:                            │
                    │  - celery:weather (high priority)   │
                    │  - celery:alerts (critical)         │
                    │  - celery:notify (normal)           │
                    └─────────────────┬───────────────────┘
                                      │
              ┌───────────────────────┼───────────────────────┐
              │                       │                       │
              ▼                       ▼                       ▼
    ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
    │  Weather Tasks  │   │   Alert Tasks   │   │  Notify Tasks   │
    │                 │   │                 │   │                 │
    │ ┌─────────────┐ │   │ ┌─────────────┐ │   │ ┌─────────────┐ │
    │ │fetch_weather│ │   │ │process_alert│ │   │ │send_sms     │ │
    │ │- Meteo FR   │ │   │ │- evaluate   │ │   │ │send_email   │ │
    │ │- OpenWM     │ │   │ │- threshold  │ │   │ │send_push    │ │
    │ │- Local      │ │   │ │- create     │ │   │ │track_status │ │
    │ └─────────────┘ │   │ └─────────────┘ │   │ └─────────────┘ │
    │                 │   │                 │   │                 │
    │ ┌─────────────┐ │   │ ┌─────────────┐ │   │                 │
    │ │process_data │ │   │ │confirm_alert│ │   │                 │
    │ │- convert    │ │   │ │cancel_alert │ │   │                 │
    │ │- validate   │ │   │ │escalate     │ │   │                 │
    │ │- store      │ │   │ └─────────────┘ │   │                 │
    │ └─────────────┘ │   │                 │   │                 │
    │                 │   │ ┌─────────────┐ │   │                 │
    │ ┌─────────────┐ │   │ │check_thresh │ │   │                 │
    │ │check_coher. │ │   │ │- heat       │ │   │                 │
    │ │- compare    │ │   │ │- drought    │ │   │                 │
    │ │- confidence │ │   │ │- flood      │ │   │                 │
    │ └─────────────┘ │   │ │- dust       │ │   │                 │
    │                 │   │ └─────────────┘ │   │                 │
    └─────────────────┘   └─────────────────┘   └─────────────────┘
```

---

## Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        DATA FLOW COMPLETE                                   │
└─────────────────────────────────────────────────────────────────────────────┘

  EXTERNAL SOURCES
  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐
  │  Meteo       │  │  OpenWeather │  │  Local       │
  │  France API  │  │  Map API     │  │  Stations    │
  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘
         │                 │                 │
         │  JSON (brut)    │  JSON (brut)    │  JSON (brut)
         │                 │                 │
         ▼                 ▼                 │
  ┌──────────────────────────────────────────┴────┐
  │            COLLECTE (Celery Worker)           │
  │  - fetch_weather_task (toutes les 15 min)     │
  └────────────────────────┬──────────────────────┘
                           │
                           │ raw_data
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                        STOCKAGE BRUT                                   │
  │  ┌──────────────────┐  ┌──────────────────┐                           │
  │  │   PostgreSQL     │  │    InfluxDB      │                           │
  │  │  raw_weather_data│  │  raw_measurements│                           │
  │  │  (JSONB archive) │  │  (time-series)   │                           │
  │  └──────────────────┘  └──────────────────┘                           │
  └────────────────────────┬───────────────────────────────────────────────┘
                           │
                           │ Trigger
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                       TRAITEMENT                                       │
  │  ┌────────────────────────────────────────────────────────────────┐   │
  │  │  process_weather_task (Celery Worker)                          │   │
  │  │                                                                │   │
  │  │  1. CONVERSION                                                 │   │
  │  │     - Kelvin → Celsius                                         │   │
  │  │     - m/s → km/h                                               │   │
  │  │     - Pa → hPa                                                 │   │
  │  │                                                                │   │
  │  │  2. VÉRIFICATION                                               │   │
  │  │     - Comparaison multi-sources                                │   │
  │  │     - Détection anomalies (Z-score)                            │   │
  │  │     - Score de confiance                                       │   │
  │  │                                                                │   │
  │  │  3. ENRICHISSEMENT                                             │   │
  │  │     - Comparaison normales de saison                           │   │
  │  │     - Détection seuils d'alerte                                │   │
  │  │                                                                │   │
  │  │  4. SIMPLIFICATION                                             │   │
  │  │     - Templates de phrases                                     │   │
  │  │     - Langage simple                                           │   │
  │  │     - Conseils contextualisés                                  │   │
  │  └────────────────────────────────────────────────────────────────┘   │
  └────────────────────────┬───────────────────────────────────────────────┘
                           │
                           │ processed_data
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                      STOCKAGE TRAITÉ                                   │
  │  ┌──────────────────┐  ┌──────────────────┐                           │
  │  │   PostgreSQL     │  │     Redis        │                           │
  │  │  processed_...   │  │  cache:weather   │                           │
  │  │  (optimisé read) │  │  (TTL 15 min)    │                           │
  │  └──────────────────┘  └──────────────────┘                           │
  └────────────────────────┬───────────────────────────────────────────────┘
                           │
                           │ Vérification continue
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                     VÉRIFICATION ALERTES                               │
  │  ┌────────────────────────────────────────────────────────────────┐   │
  │  │  check_alerts_task (Celery Worker)                             │   │
  │  │                                                                │   │
  │  │  Pour chaque région:                                           │   │
  │  │  - Si temp > 40°C pendant 3j → Vague de chaleur                │   │
  │  │  - Si pluie < 10mm pendant 30j → Sécheresse                    │   │
  │  │  - Si pluie > 50mm en 24h → Inondation                         │   │
  │  │  - Si AQI > 200 → Vague de poussière                           │   │
  │  │                                                                │   │
  │  │  Si seuil dépassé:                                             │   │
  │  │  1. Créer alerte (status: pending)                             │   │
  │  │  2. Notifier opérateurs                                        │   │
  │  │  3. Attendre confirmation                                        │   │
  │  └────────────────────────────────────────────────────────────────┘   │
  └────────────────────────┬───────────────────────────────────────────────┘
                           │
                           │ Alerte confirmée
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                    NOTIFICATIONS                                       │
  │  ┌────────────────────────────────────────────────────────────────┐   │
  │  │  send_notifications_task (Celery Worker)                       │   │
  │  │                                                                │   │
  │  │  Pour chaque abonné de la région:                              │   │
  │  │  - SMS: Message court (< 160 chars)                            │   │
  │  │  - Email: Message détaillé avec conseils                       │   │
  │  │  - Push: Notification push navigateur/app                      │   │
  │  │                                                                │   │
  │  │  Suivi:                                                        │   │
  │  │  - status: sent/delivered/read/failed                          │   │
  │  │  - logging dans alert_notifications                            │   │
  │  └────────────────────────────────────────────────────────────────┘   │
  └────────────────────────┬───────────────────────────────────────────────┘
                           │
                           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                      UTILISATEURS                                      │
  │                                                                        │
  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                │
  │  │   Dashboard  │  │    SMS       │  │    Email     │                │
  │  │   (React)    │  │  (Twilio)    │  │   (SMTP)     │                │
  │  │              │  │              │  │              │                │
  │  │ "Il fait très│  │ "ALERTE:     │  │ [HTML]       │                │
  │  │ chaud (41°C) │  │ Vague de     │  │ Météo du     │                │
  │  │ à Ouaga"     │  │ chaleur à    │  │ jour +       │                │
  │  │              │  │ Centre.      │  │ Conseils     │                │
  │  │              │  │ 41°C.        │  │              │                │
  │  │              │  │ Restez à     │  │              │                │
  │  │              │  │ l'ombre."    │  │              │                │
  │  └──────────────┘  └──────────────┘  └──────────────┘                │
  └────────────────────────────────────────────────────────────────────────┘
```

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : En attente de validation*
