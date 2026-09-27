# Format des Données Brutes (APIs Météo)

## Objectif

Ce document décrit le **format technique des données** telles que reçues des APIs météo, avant tout traitement.

---

## Sources de Données

### 1. Meteo France API

**Endpoint** : `https://public-api.meteofrance.com/public/`

**Exemple de réponse** :
```json
{
  "city_name": "Ouagadougou",
  "country_code": "BF",
  "lat": 12.3714,
  "lon": -1.5197,
  "timezone": "Africa/Ouagadougou",
  "data": {
    "time": "2026-04-21T10:00:00Z",
    "t": 314.15,
    "u": 23,
    "ff": 5.14,
    "dd": 270,
    "pres": 101522,
    "td": 288.15,
    "clouds": 5,
    "visi": 10000
  }
}
```

**Champs techniques** :
| Champ | Signification | Unité |
|-------|---------------|-------|
| `t` | Température | Kelvin (K) |
| `u` | Humidité relative | % |
| `ff` | Vitesse du vent | m/s |
| `dd` | Direction du vent | Degrés (0-360) |
| `pres` | Pression atmosphérique | Pascal (Pa) |
| `td` | Point de rosée | Kelvin (K) |
| `clouds` | Couverture nuageuse | % |
| `visi` | Visibilité | mètres |

---

### 2. OpenWeatherMap API

**Endpoint** : `https://api.openweathermap.org/data/2.5/weather`

**Exemple de réponse** :
```json
{
  "coord": {"lon": -1.5197, "lat": 12.3714},
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 314.15,
    "feels_like": 318.2,
    "temp_min": 313.15,
    "temp_max": 315.15,
    "pressure": 101522,
    "humidity": 23,
    "sea_level": 101522,
    "grnd_level": 98215
  },
  "visibility": 10000,
  "wind": {
    "speed": 5.14,
    "deg": 270,
    "gust": 8.23
  },
  "clouds": {"all": 5},
  "dt": 1713697800,
  "sys": {
    "country": "BF",
    "sunrise": 1713672000,
    "sunset": 1713715200
  },
  "timezone": 0,
  "id": 2357048,
  "name": "Ouagadougou",
  "cod": 200
}
```

**Champs techniques** :
| Champ | Signification | Unité |
|-------|---------------|-------|
| `main.temp` | Température actuelle | Kelvin (K) |
| `main.feels_like` | Température ressentie | Kelvin (K) |
| `main.pressure` | Pression atmosphérique | Pascal (Pa) |
| `main.humidity` | Humidité relative | % |
| `wind.speed` | Vitesse du vent | m/s |
| `wind.deg` | Direction du vent | Degrés (0-360) |
| `wind.gust` | Rafales de vent | m/s |
| `visibility` | Visibilité | mètres |
| `clouds.all` | Couverture nuageuse | % |

---

### 3. Stations Locales (IoT)

**Format variable** selon le capteur. Exemple pour un capteur Arduino :

```json
{
  "station_id": "BF-OUAGA-001",
  "timestamp": "2026-04-21T10:30:00Z",
  "battery": 85,
  "sensors": {
    "temperature": 41.2,
    "humidity": 23,
    "pressure": 1015.2,
    "wind_speed": 22.3,
    "rain": 0
  }
}
```

**Champs techniques** :
| Champ | Signification | Unité |
|-------|---------------|-------|
| `sensors.temperature` | Température | Celsius (°C) |
| `sensors.humidity` | Humidité relative | % |
| `sensors.pressure` | Pression atmosphérique | hPa |
| `sensors.wind_speed` | Vitesse du vent | km/h |
| `sensors.rain` | Précipitations cumulées | mm |

---

## Schéma de Stockage Brut

```sql
-- Table de stockage des données brutes
CREATE TABLE raw_weather_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source VARCHAR(50) NOT NULL,        -- 'meteo_france', 'openweathermap', 'local'
    region_id UUID REFERENCES regions(id),
    collected_at TIMESTAMP NOT NULL,    -- Timestamp de la donnée
    stored_at TIMESTAMP DEFAULT NOW(),  -- Timestamp du stockage
    raw_payload JSONB NOT NULL,         -- Données brutes complètes
    checksum VARCHAR(64),               -- SHA256 pour déduplication
    status VARCHAR(20) DEFAULT 'pending' -- pending, processed, error
);

-- Index
CREATE INDEX idx_raw_weather_source ON raw_weather_data(source);
CREATE INDEX idx_raw_weather_collected ON raw_weather_data(collected_at DESC);
CREATE INDEX idx_raw_weather_status ON raw_weather_data(status);
CREATE INDEX idx_raw_weather_region ON raw_weather_data(region_id);
```

---

## Exemple de Données Brutes Stockées

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "source": "openweathermap",
  "region_id": "a0eebc99-c9c0-47dc-b6f5-446655440001",
  "collected_at": "2026-04-21T10:30:00Z",
  "stored_at": "2026-04-21T10:30:05Z",
  "raw_payload": {
    "coord": {"lon": -1.5197, "lat": 12.3714},
    "weather": [{"id": 800, "main": "Clear", "description": "clear sky"}],
    "main": {
      "temp": 314.15,
      "feels_like": 318.2,
      "temp_min": 313.15,
      "temp_max": 315.15,
      "pressure": 101522,
      "humidity": 23
    },
    "wind": {"speed": 5.14, "deg": 270, "gust": 8.23},
    "clouds": {"all": 5},
    "visibility": 10000
  },
  "checksum": "a1b2c3d4e5f6...",
  "status": "pending"
}
```

---

## Problèmes avec le Format Brut

### 1. Unités Non Intuitives

```
❌ Kelvin (314.15K) → Incompréhensible pour le grand public
❌ m/s (5.14 m/s) → Pas parlant pour les utilisateurs
❌ Pascal (101522 Pa) → Trop technique
```

### 2. Noms de Champs Techniques

```
❌ "ff", "dd", "t", "u" → Abréviations métier
❌ "grnd_level", "sea_level" → Trop précis
```

### 3. Pas de Contexte

```
❌ 41°C → Est-ce normal pour la saison ?
❌ 23% humidité → Sec ou humide ?
❌ Vent 18 km/h → Fort ou faible ?
```

### 4. Pas de Conseils

```
❌ Données brutes → Que doit faire l'utilisateur ?
```

---

## Conclusion

Le format brut est **optimisé pour le stockage et l'échange technique**, mais **inadapté pour une restitution directe aux utilisateurs**.

D'où la nécessité du **pipeline de transformation** décrit dans `data-pipeline.md`.

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : Validé*
