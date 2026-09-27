# Format des Données Traitées

## Objectif

Ce document décrit le **format simplifié et enrichi** des données météo, prêt pour être affiché aux utilisateurs.

---

## Principes de Transformation

| Principe | Description | Exemple |
|----------|-------------|---------|
| **Unités locales** | Utiliser les unités courantes | °C au lieu de K |
| **Langage naturel** | Phrases complètes | "Il fait très chaud" |
| **Contextualisation** | Comparaison avec normales | "+3°C vs saison" |
| **Actionnabilité** | Conseils pratiques | "Évitez le soleil 11h-16h" |
| **Confiance** | Indicateur de fiabilité | "3 sources alignées" |

---

## Schéma de Données Traitées

### Format Complet (API Response)

```typescript
interface ProcessedWeatherData {
  // Identification
  region: {
    id: string;
    name: string;
    code: string;
  };
  
  // Temporel
  timestamp: string;           // ISO 8601
  date_formatted: string;      // "21/04/2026 à 10:30"
  local_time: string;          // "10:30"
  
  // Résumé global
  resume: string;              // "Il fait très chaud (41°C)..."
  
  // Données détaillées simplifiées
  temperature: {
    value: number;             // 41.2
    unit: string;              // "°C"
    description: string;       // "Il fait très chaud"
    feels_like: number;        // 45
    min_24h: number;           // 35
    max_24h: number;           // 42
  };
  
  humidity: {
    value: number;             // 23
    unit: string;              // "%"
    description: string;       // "L'air est très sec"
  };
  
  wind: {
    speed: number;             // 22.3
    unit: string;              // "km/h"
    direction: string;         // "O"
    direction_label: string;   // "Ouest"
    description: string;       // "Vent modéré"
    gust: number;              // 30
  };
  
  sky: {
    cover: number;             // 5 (%)
    description: string;       // "Ciel dégagé"
    condition: string;         // "clear"
  };
  
  precipitation: {
    probability: number;       // 0 (%)
    amount: number;            // 0 (mm)
    description: string;       // "Pas de pluie prévue"
  };
  
  // Contexte
  context: {
    comparison_normal: string;  // "+3°C par rapport aux normales"
    is_above_normal: boolean;
    anomaly_value: number;      // 3.2
    trend: string;              // "En hausse"
  };
  
  // Conseils
  advice: string;              // "Évitez les activités..."
  advice_items: string[];      // ["Hydratez-vous", ...]
  
  // Alerte
  alert: {
    active: boolean;
    type: string;              // "Vague de chaleur"
    severity: string;          // "severe"
    level_label: string;       // "Orange"
    message: string;           // "Alerte jusqu'au 24/04"
    expires_at: string;
  } | null;
  
  // Qualité des données
  confidence: {
    score: number;             // 100 (0-100)
    sources_count: number;     // 3
    warnings: string[];        // []
  };
}
```

---

## Exemple Concret

```json
{
  "region": {
    "id": "centre",
    "name": "Centre (Ouagadougou)",
    "code": "BF-CENTRE"
  },
  "timestamp": "2026-04-21T10:30:00Z",
  "date_formatted": "21/04/2026 à 10:30",
  "local_time": "10:30",
  
  "resume": "Il fait très chaud (41°C). L'air est très sec. Vent modéré (22 km/h) venant de l'Ouest. Ciel dégagé, beau temps. Pas de pluie prévue.",
  
  "temperature": {
    "value": 41.2,
    "unit": "°C",
    "description": "Il fait très chaud (41°C). Évitez le soleil.",
    "feels_like": 45.1,
    "min_24h": 35.2,
    "max_24h": 42.0
  },
  
  "humidity": {
    "value": 23,
    "unit": "%",
    "description": "L'air est très sec"
  },
  
  "wind": {
    "speed": 22.3,
    "unit": "km/h",
    "direction": "O",
    "direction_label": "Ouest",
    "description": "Vent modéré (22 km/h)",
    "gust": 30.5
  },
  
  "sky": {
    "cover": 5,
    "description": "Ciel dégagé, beau temps",
    "condition": "clear"
  },
  
  "precipitation": {
    "probability": 0,
    "amount": 0,
    "unit": "mm",
    "description": "Pas de pluie prévue"
  },
  
  "context": {
    "comparison_normal": "Température inhabituellement élevée (+3°C par rapport aux normales de saison)",
    "is_above_normal": true,
    "anomaly_value": 3.2,
    "trend": "Stable"
  },
  
  "advice": "Évitez les activités extérieures entre 11h et 16h. Hydratez-vous régulièrement. Portez des vêtements légers et clairs. Protection solaire indispensable (crème, chapeau).",
  
  "advice_items": [
    "Évitez les activités extérieures entre 11h et 16h",
    "Hydratez-vous régulièrement",
    "Portez des vêtements légers et clairs",
    "Protection solaire indispensable (crème, chapeau)"
  ],
  
  "alert": {
    "active": true,
    "type": "Vague de chaleur",
    "severity": "severe",
    "level_label": "Orange",
    "message": "Alerte chaleur extrême en cours jusqu'au 24/04. Restez à l'écoute des autorités.",
    "expires_at": "2026-04-24T23:59:59Z"
  },
  
  "confidence": {
    "score": 100,
    "sources_count": 3,
    "warnings": []
  }
}
```

---

## Format pour Cartes (Map View)

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "region_id": "centre",
        "region_name": "Centre",
        "temperature": 41.2,
        "temp_description": "Très chaud",
        "alert_active": true,
        "alert_severity": "severe",
        "alert_color": "#FF8C00",
        "confidence": 100
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [...]
      }
    }
  ]
}
```

---

## Format pour Notifications SMS

```
Format court (160 caractères max) :

[ALERTE] Vague de chaleur à Centre. 
Temp: 41°C. Restez à l'ombre, hydratez-vous.
Évitez sorties 11h-16h. Fin: 24/04.
MyWeather
```

---

## Format pour Notifications Email

```html
<!DOCTYPE html>
<html>
<head>
  <style>
    .alert-box { background: #FF8C00; color: white; padding: 15px; }
    .temp { font-size: 48px; font-weight: bold; }
    .advice { background: #f0f0f0; padding: 10px; margin: 10px 0; }
  </style>
</head>
<body>
  <div class="alert-box">
    ⚠️ ALERTE VAGUE DE CHALEUR - ORANGE
  </div>
  
  <h1>Météo à Centre (Ouagadougou)</h1>
  <p class="temp">41°C</p>
  <p>Il fait très chaud. L'air est très sec.</p>
  
  <div class="advice">
    <strong>Conseils :</strong>
    <ul>
      <li>Évitez les activités extérieures entre 11h et 16h</li>
      <li>Hydratez-vous régulièrement</li>
      <li>Portez des vêtements légers et clairs</li>
    </ul>
  </div>
  
  <p>Alerte valable jusqu'au 24/04/2026</p>
</body>
</html>
```

---

## Schéma de Base de Données (Format Traité)

```sql
-- Table des données traitées
CREATE TABLE processed_weather_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    region_id UUID REFERENCES regions(id),
    collected_at TIMESTAMP NOT NULL,
    processed_at TIMESTAMP DEFAULT NOW(),
    
    -- Résumé
    summary TEXT NOT NULL,
    
    -- Température
    temperature_c DECIMAL(5,2),
    temp_description TEXT,
    feels_like_c DECIMAL(5,2),
    temp_min_24h DECIMAL(5,2),
    temp_max_24h DECIMAL(5,2),
    
    -- Humidité
    humidity_pct DECIMAL(5,2),
    humidity_description TEXT,
    
    -- Vent
    wind_speed_kmh DECIMAL(5,2),
    wind_direction VARCHAR(10),
    wind_direction_label VARCHAR(20),
    wind_description TEXT,
    wind_gust_kmh DECIMAL(5,2),
    
    -- Ciel
    cloud_cover_pct DECIMAL(5,2),
    sky_description TEXT,
    sky_condition VARCHAR(50),
    
    -- Précipitations
    precip_probability_pct DECIMAL(5,2),
    precip_amount_mm DECIMAL(5,2),
    precip_description TEXT,
    
    -- Contexte
    is_above_normal BOOLEAN,
    temperature_anomaly DECIMAL(4,2),
    trend VARCHAR(20),
    
    -- Conseils
    advice TEXT,
    advice_items JSONB,
    
    -- Alerte
    has_active_alert BOOLEAN DEFAULT FALSE,
    alert_type VARCHAR(50),
    alert_severity VARCHAR(20),
    alert_level_label VARCHAR(20),
    alert_message TEXT,
    alert_expires_at TIMESTAMP,
    
    -- Confiance
    confidence_score INTEGER,
    sources_count INTEGER,
    warnings JSONB,
    
    -- TTL
    created_at TIMESTAMP DEFAULT NOW(),
    expires_at TIMESTAMP
);

-- Index
CREATE INDEX idx_processed_region ON processed_weather_data(region_id);
CREATE INDEX idx_processed_collected ON processed_weather_data(collected_at DESC);
CREATE INDEX idx_processed_alert ON processed_weather_data(has_active_alert) 
    WHERE has_active_alert = TRUE;
```

---

## Comparaison Brut vs Traité

| Aspect | Données Brutes | Données Traitées |
|--------|----------------|------------------|
| **Température** | `314.15 K` | `41°C - Il fait très chaud` |
| **Humidité** | `23%` | `23% - L'air est très sec` |
| **Vent** | `5.14 m/s, 270°` | `22 km/h Ouest - Vent modéré` |
| **Pression** | `101522 Pa` | `1015 hPa - Pression normale` |
| **Contexte** | Aucun | `+3°C vs normales de saison` |
| **Conseils** | Aucun | `Évitez soleil 11h-16h...` |
| **Alerte** | Non | `Vague de chaleur (Orange)` |
| **Confiance** | Non | `100% (3 sources)` |

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : Validé*
