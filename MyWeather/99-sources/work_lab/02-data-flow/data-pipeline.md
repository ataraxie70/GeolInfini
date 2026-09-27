# Data Pipeline - Cœur de la Plateforme MyWeather

## Vue d'ensemble

Le **Data Pipeline** est le système qui transforme les données météo brutes (techniques) en informations compréhensibles pour tous les utilisateurs.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    CYCLE DE VIE D'UNE DONNÉE                           │
└─────────────────────────────────────────────────────────────────────────┘

  COLLECTE → STOCKAGE BRUT → CONVERSION → VÉRIFICATION → ENRICHISSEMENT
                                                              │
      ╔═══════════════════════════════════════════════════════╝
      ║
      ▼
  SIMPLIFICATION → STOCKAGE TRAITÉ → RENDU → UTILISATEUR

```

---

## Étape 1: Collecte des Données

### Sources de Données

| Source | Type | Fréquence | Couverture |
|--------|------|-----------|------------|
| **Meteo France** | API REST | 15 min | Mondiale |
| **OpenWeatherMap** | API REST | 10 min | Mondiale |
| **Stations locales** | IoT/Capteurs | 5 min | Burkina Faso |

### Données Collectées (Format Brut)

```json
{
  "source": "openweathermap",
  "collected_at": "2026-04-21T10:30:00Z",
  "location": {
    "lat": 12.3714,
    "lon": -1.5197,
    "region_id": "centre",
    "region_name": "Centre (Ouagadougou)"
  },
  "raw_data": {
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
    "wind": {
      "speed": 5.14,
      "deg": 270,
      "gust": 8.23
    },
    "clouds": {
      "all": 5
    },
    "visibility": 10000,
    "pop": 0,
    "dt": 1713697800
  }
}
```

### Code de Collecte (Extrait)

```python
# src/workers/tasks/weather.py

@celery_app.task(bind=True, max_retries=3)
def fetch_weather_task(self):
    """
    Tâche Celery périodique pour collecter les données météo
    Exécutée toutes les 15 minutes
    """
    sources = [MeteoFranceSource(), OpenWeatherMapSource(), LocalStationSource()]
    
    for source in sources:
        try:
            raw_data = source.fetch_all_regions()
            
            # Étape 1: Stockage brut
            store_raw_data(
                source=source.name,
                data=raw_data,
                collected_at=datetime.utcnow()
            )
            
            # Queue pour traitement
            process_weather_task.delay(source.name, raw_data['id'])
            
        except Exception as exc:
            logger.error(f"Erreur collecte {source.name}: {exc}")
            raise self.retry(exc=exc, countdown=300)
```

---

## Étape 2: Stockage des Données Brutes

### Schéma de Stockage

```sql
-- Table d'archivage des données brutes
CREATE TABLE raw_weather_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source VARCHAR(50) NOT NULL,
    region_id UUID REFERENCES regions(id),
    collected_at TIMESTAMP NOT NULL,
    stored_at TIMESTAMP DEFAULT NOW(),
    raw_payload JSONB NOT NULL,
    checksum VARCHAR(64),
    status VARCHAR(20) DEFAULT 'pending'  -- pending, processed, error
);

-- Index pour requêtes rapides
CREATE INDEX idx_raw_weather_source ON raw_weather_data(source);
CREATE INDEX idx_raw_weather_collected ON raw_weather_data(collected_at DESC);
CREATE INDEX idx_raw_weather_status ON raw_weather_data(status);
```

### Données Brutes dans InfluxDB (Time-Series)

```python
# InfluxDB Bucket: raw_measurements
# Measurement: weather_observation

from influxdb_client import Point

point = Point("weather_observation") \
    .tag("source", "openweathermap") \
    .tag("region", "centre") \
    .field("temperature_k", 314.15) \
    .field("humidity_pct", 23) \
    .field("wind_speed_ms", 5.14) \
    .field("pressure_pa", 101522) \
    .time(datetime.utcnow())

write_client.write(bucket='raw_measurements', record=point)
```

---

## Étape 3: Conversion des Unités

### Tableau de Conversion

| Grandeur | Unité brute | Unité cible | Formule |
|----------|-------------|-------------|---------|
| Température | Kelvin (K) | Celsius (°C) | `°C = K - 273.15` |
| Vent | m/s | km/h | `km/h = m/s × 3.6` |
| Pression | Pascal (Pa) | hPa | `hPa = Pa / 100` |
| Direction | Degrés (0-360) | Cardinale | `270° → Ouest` |
| Visibilité | mètres | km | `km = m / 1000` |

### Code de Conversion

```python
# src/services/weather/converters.py

from typing import Dict, Any
from enum import Enum

class WindDirection(Enum):
    N = (337.5, 360, "Nord")
    NE = (22.5, 67.5, "Nord-Est")
    E = (67.5, 112.5, "Est")
    SE = (112.5, 157.5, "Sud-Est")
    S = (157.5, 202.5, "Sud")
    SW = (202.5, 247.5, "Sud-Ouest")
    W = (247.5, 292.5, "Ouest")
    NW = (292.5, 337.5, "Nord-Ouest")
    
    @classmethod
    def from_degrees(cls, degrees: float) -> str:
        for direction in cls:
            min_val, max_val, _ = direction.value
            if min_val <= degrees < max_val or (degrees >= 337.5):
                return direction.name
        return "N"

def convert_weather_data(raw_data: Dict[str, Any]) -> Dict[str, Any]:
    """
    Convertit les données météo brutes en unités standardisées
    """
    main = raw_data.get('main', {})
    wind = raw_data.get('wind', {})
    
    return {
        # Température: Kelvin → Celsius
        'temperature': round(main.get('temp', 0) - 273.15, 1),
        'feels_like': round(main.get('feels_like', 0) - 273.15, 1),
        'temp_min': round(main.get('temp_min', 0) - 273.15, 1),
        'temp_max': round(main.get('temp_max', 0) - 273.15, 1),
        
        # Humidité (déjà en %)
        'humidity': main.get('humidity', 0),
        
        # Vent: m/s → km/h
        'wind_speed': round(wind.get('speed', 0) * 3.6, 1),
        'wind_direction_deg': wind.get('deg', 0),
        'wind_direction': WindDirection.from_degrees(wind.get('deg', 0)),
        'wind_gust': round(wind.get('gust', 0) * 3.6, 1) if 'gust' in wind else None,
        
        # Pression: Pa → hPa
        'pressure': round(main.get('pressure', 0) / 100, 1),
        
        # Visibilité: m → km
        'visibility': round(raw_data.get('visibility', 10000) / 1000, 1),
        
        # Couverture nuageuse: %
        'cloud_cover': raw_data.get('clouds', {}).get('all', 0),
        
        # Probabilité de précipitation: ratio → %
        'precipitation_prob': round(raw_data.get('pop', 0) * 100),
    }
```

---

## Étape 4: Vérification de Cohérence

### Algorithme de Vérification

```
┌─────────────────────────────────────────────────────────────────┐
│               VÉRIFICATION DE COHÉRENCE                         │
└─────────────────────────────────────────────────────────────────┘

  ┌─────────────┐
  │ Données de  │
  │ 3 sources   │
  └──────┬──────┘
         │
         ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ 1. COMPARAISON MULTI-SOURCES                                │
  │    - Calcul moyenne, min, max                               │
  │    - Détection écarts > seuil                               │
  └─────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ 2. DÉTECTION VALEURS ABERRANTES (Outliers)                  │
  │    - Z-score > 3 = anomalie                                 │
  │    - IQR method pour valeurs extrêmes                       │
  └─────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ 3. VÉRIFICATION PLAUSIBILITÉ                                │
  │    - Température dans [-10, 55] pour Burkina Faso           │
  │    - Humidité dans [0, 100]                                 │
  │    - Vent dans [0, 150] km/h                                │
  └─────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ 4. CALCUL SCORE DE CONFIANCE                                │
  │    - 3 sources alignées → confiance = 100%                  │
  │    - 2 sources alignées → confiance = 70%                   │
  │    - 1 source fiable → confiance = 40%                      │
  │    - Anomalie détectée → confiance = 20% + warning          │
  └─────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ 5. SORTIE: Données validées + métadonnées                   │
  │    - selected_value (la plus fiable)                        │
  │    - confidence_score                                       │
  │    - warnings (liste d'avertissements)                      │
  └─────────────────────────────────────────────────────────────┘
```

### Code de Vérification

```python
# src/services/weather/validators.py

import statistics
from typing import List, Dict, Any, Tuple

class CoherenceChecker:
    """
    Vérifie la cohérence des données météo entre multiples sources
    """
    
    # Seuils d'alerte d'écart
    THRESHOLDS = {
        'temperature': 5.0,  # 5°C d'écart max entre sources
        'humidity': 15.0,    # 15% d'écart max
        'wind_speed': 10.0,  # 10 km/h d'écart max
        'pressure': 5.0,     # 5 hPa d'écart max
    }
    
    # Plages de plausibilité pour le Burkina Faso
    PLAUSIBLE_RANGES = {
        'temperature': (-5, 50),
        'humidity': (0, 100),
        'wind_speed': (0, 120),
        'pressure': (980, 1050),
    }
    
    def check_temperature_coherence(
        self,
        values: List[Tuple[str, float]]  # [(source, temp), ...]
    ) -> Dict[str, Any]:
        """
        Vérifie la cohérence des températures entre sources
        """
        if not values:
            return {'error': 'Aucune donnée'}
        
        temps = [v[1] for v in values]
        sources = [v[0] for v in values]
        
        # Statistiques de base
        avg_temp = statistics.mean(temps)
        min_temp = min(temps)
        max_temp = max(temps)
        spread = max_temp - min_temp  # Écart max
        
        # Détection d'anomalie
        anomaly_detected = spread > self.THRESHOLDS['temperature']
        
        # Calcul de la variance
        if len(temps) >= 2:
            variance = statistics.variance(temps)
            std_dev = variance ** 0.5
        else:
            std_dev = 0
        
        # Score de confiance
        if spread < 2:
            confidence = 100
        elif spread < 5:
            confidence = 70
        elif spread < 10:
            confidence = 40
        else:
            confidence = 20
        
        # Détection de la source potentiellement erronée
        outlier_source = None
        if anomaly_detected and len(temps) >= 3:
            z_scores = [(t - avg_temp) / (std_dev or 1) for t in temps]
            max_z_idx = max(range(len(z_scores)), key=lambda i: abs(z_scores[i]))
            if abs(z_scores[max_z_idx]) > 2:
                outlier_source = sources[max_z_idx]
        
        return {
            'selected_value': avg_temp,
            'sources_count': len(sources),
            'min': min_temp,
            'max': max_temp,
            'spread': round(spread, 2),
            'std_deviation': round(std_dev, 2),
            'confidence': confidence,
            'anomaly_detected': anomaly_detected,
            'outlier_source': outlier_source,
            'warnings': [
                f"Écart important entre sources: {round(spread, 1)}°C"
            ] if anomaly_detected else []
        }
    
    def check_plausibility(self, field: str, value: float) -> Tuple[bool, str]:
        """
        Vérifie si une valeur est plausible pour le Burkina Faso
        """
        min_val, max_val = self.PLAUSIBLE_RANGES.get(field, (None, None))
        
        if min_val is None:
            return True, ""
        
        if value < min_val or value > max_val:
            return False, f"Valeur non plausible pour {field}: {value} (attendu: {min_val}-{max_val})"
        
        return True, ""
```

### Exemple de Résultat de Vérification

```json
{
  "field": "temperature",
  "sources": [
    {"name": "Meteo France", "value": 41.2},
    {"name": "OpenWeatherMap", "value": 40.8},
    {"name": "Local Station", "value": 41.5}
  ],
  "coherence_check": {
    "selected_value": 41.17,
    "sources_count": 3,
    "min": 40.8,
    "max": 41.5,
    "spread": 0.7,
    "std_deviation": 0.38,
    "confidence": 100,
    "anomaly_detected": false,
    "outlier_source": null,
    "warnings": [],
    "plausibility": {
      "is_valid": true,
      "message": ""
    }
  }
}
```

---

## Étape 5: Enrichissement des Données

### Comparaison avec les Normales

```python
# src/services/weather/enrichment.py

class WeatherEnrichment:
    """
    Enrichit les données météo avec du contexte
    """
    
    def compare_with_normals(
        self,
        region_id: str,
        temperature: float,
        month: int
    ) -> Dict[str, Any]:
        """
        Compare la température actuelle avec les normales de saison
        """
        # Normales climatiques pour le Burkina Faso (moyennes 1991-2020)
        normals_by_month = {
            'centre': {
                1: {'temp_avg': 28.5, 'temp_min': 22.0, 'temp_max': 35.0},
                2: {'temp_avg': 30.2, 'temp_min': 23.5, 'temp_max': 37.0},
                3: {'temp_avg': 32.1, 'temp_min': 25.0, 'temp_max': 39.0},
                4: {'temp_avg': 33.5, 'temp_min': 26.5, 'temp_max': 40.5},
                # ... autres mois
            },
            # ... autres régions
        }
        
        region_normals = normals_by_month.get(region_id, {}).get(month)
        
        if not region_normals:
            return {'comparison': 'données non disponibles'}
        
        anomaly = temperature - region_normals['temp_avg']
        
        # Détermination du statut
        if abs(anomaly) < 1:
            status = "dans les normales"
        elif anomaly > 0:
            status = f"au-dessus des normales (+{anomaly:.1f}°C)"
        else:
            status = f"en-dessous des normales ({anomaly:.1f}°C)"
        
        return {
            'normal_avg': region_normals['temp_avg'],
            'normal_min': region_normals['temp_min'],
            'normal_max': region_normals['temp_max'],
            'anomaly': round(anomaly, 1),
            'status': status,
            'is_extreme': abs(anomaly) > 3
        }
    
    def detect_alert_threshold(
        self,
        hazard_type: str,
        value: float,
        duration_hours: int = 0
    ) -> Dict[str, Any]:
        """
        Détecte si un seuil d'alerte est franchi
        """
        thresholds = {
            'heat_wave': {
                'temperature_min': 40,
                'duration_hours_min': 72,  # 3 jours
                'severity_levels': [
                    (40, 'moderate'),
                    (43, 'severe'),
                    (45, 'extreme')
                ]
            },
            'drought': {
                'rainfall_max': 10,
                'duration_days_min': 30,
                'severity_levels': [
                    (10, 'moderate'),
                    (5, 'severe'),
                    (0, 'extreme')
                ]
            },
            'flooding': {
                'rainfall_24h_min': 50,
                'severity_levels': [
                    (50, 'moderate'),
                    (80, 'severe'),
                    (100, 'extreme')
                ]
            },
            'dust_storm': {
                'aqi_min': 200,
                'severity_levels': [
                    (200, 'moderate'),
                    (300, 'severe'),
                    (400, 'extreme')
                ]
            }
        }
        
        config = thresholds.get(hazard_type)
        if not config:
            return {'alert': False}
        
        # Vérification du seuil
        key = 'temperature_min' if hazard_type == 'heat_wave' else \
              'rainfall_max' if hazard_type in ['drought', 'flooding'] else 'aqi_min'
        
        threshold = config[key]
        
        if hazard_type == 'drought':
            triggered = value <= threshold
        else:
            triggered = value >= threshold
        
        if not triggered:
            return {'alert': False}
        
        # Détermination de la sévérité
        severity = 'moderate'
        for level_val, level_name in reversed(config['severity_levels']):
            if hazard_type == 'drought':
                if value <= level_val:
                    severity = level_name
            else:
                if value >= level_val:
                    severity = level_name
        
        return {
            'alert': True,
            'hazard_type': hazard_type,
            'severity': severity,
            'threshold': threshold,
            'current_value': value,
            'exceedance': round(abs(value - threshold), 1)
        }
```

---

## Étape 6: Simplification du Langage

### Moteur de Simplification

```python
# src/services/weather/simplifier.py

from typing import Dict, Any
from datetime import datetime

class WeatherSimplifier:
    """
    Transforme les données météo techniques en langage simple
    """
    
    # Templates de phrases en français simple
    TEMPLATES = {
        'temperature': {
            'very_cold': "Il fait très froid ({temp}°C). Couvrez-vous bien.",
            'cold': "Il fait frais ({temp}°C).",
            'mild': "Température agréable ({temp}°C).",
            'warm': "Il fait chaud ({temp}°C).",
            'very_hot': "Il fait très chaud ({temp}°C). Évitez le soleil.",
            'extreme_hot': "CHALEUR EXTRÊME ({temp}°C). Danger pour la santé.",
        },
        'humidity': {
            'very_dry': "L'air est très sec.",
            'dry': "L'air est sec.",
            'comfortable': "Humidité confortable.",
            'humid': "L'air est humide.",
            'very_humid': "L'air est très humide, temps lourd.",
        },
        'wind': {
            'calm': "Vent calme ou absent.",
            'light': "Légère brise ({speed} km/h).",
            'moderate': "Vent modéré ({speed} km/h).",
            'strong': "Vent fort ({speed} km/h). Attention aux objets légers.",
            'very_strong': "VENT TRÈS FORT ({speed} km/h). Restez à l'abri.",
        },
        'sky': {
            'clear': "Ciel dégagé, beau temps.",
            'few_clouds': "Quelques nuages.",
            'scattered': "Partiellement nuageux.",
            'broken': "Très nuageux.",
            'overcast': "Ciel couvert.",
        },
        'precipitation': {
            'none': "Pas de pluie prévue.",
            'low': "Faible risque de pluie ({prob}%).",
            'medium': "Risque de pluie ({prob}%). Prévoyez un parapluie.",
            'high': "Fortes pluies attendues ({prob}%).",
            'certain': "Pluie certaine. Restez à l'abri.",
        },
    }
    
    # Seuils pour les descriptions
    THRESHOLDS = {
        'temperature': [
            (20, 'very_cold'),
            (25, 'cold'),
            (30, 'mild'),
            (35, 'warm'),
            (40, 'very_hot'),
            (float('inf'), 'extreme_hot'),
        ],
        'humidity': [
            (20, 'very_dry'),
            (30, 'dry'),
            (60, 'comfortable'),
            (80, 'humid'),
            (float('inf'), 'very_humid'),
        ],
        'wind_speed': [
            (5, 'calm'),
            (15, 'light'),
            (30, 'moderate'),
            (50, 'strong'),
            (float('inf'), 'very_strong'),
        ],
    }
    
    def get_description(self, field: str, value: float) -> str:
        """
        Retourne la description simple pour une valeur
        """
        templates = self.TEMPLATES.get(field, {})
        thresholds = self.THRESHOLDS.get(field, [])
        
        # Trouver la catégorie
        category = 'unknown'
        for threshold, cat in thresholds:
            if value < threshold:
                category = cat
                break
        
        template = templates.get(category, "{value}")
        
        # Remplir le template
        if field == 'temperature':
            return template.format(temp=int(value))
        elif field == 'wind_speed':
            return template.format(speed=int(value))
        elif field == 'precipitation_prob':
            return template.format(prob=int(value))
        else:
            return template.format(value=value)
    
    def generate_summary(
        self,
        weather_data: Dict[str, Any],
        context: Dict[str, Any] = None
    ) -> str:
        """
        Génère un résumé météo en langage naturel
        """
        temp = weather_data.get('temperature', 0)
        humidity = weather_data.get('humidity', 50)
        wind = weather_data.get('wind_speed', 0)
        sky = weather_data.get('cloud_cover', 0)
        precip = weather_data.get('precipitation_prob', 0)
        
        # Construire le résumé phrase par phrase
        sentences = []
        
        # Température
        temp_desc = self.get_description('temperature', temp)
        sentences.append(temp_desc)
        
        # Humidité (seulement si notable)
        if humidity < 25 or humidity > 75:
            humidity_desc = self.get_description('humidity', humidity)
            sentences.append(humidity_desc)
        
        # Vent (seulement si notable)
        if wind > 15:
            wind_desc = self.get_description('wind_speed', wind)
            sentences.append(wind_desc)
        
        # Ciel
        if sky < 20:
            sentences.append(self.TEMPLATES['sky']['clear'])
        elif sky < 50:
            sentences.append(self.TEMPLATES['sky']['scattered'])
        else:
            sentences.append(self.TEMPLATES['sky']['overcast'])
        
        # Précipitations
        precip_desc = self.get_description('precipitation', precip)
        if precip > 0:
            sentences.append(precip_desc)
        
        # Ajouter le contexte si disponible
        if context:
            if context.get('is_above_normal'):
                sentences.append(
                    f"Température inhabituellement élevée pour la saison."
                )
            if context.get('alert_active'):
                sentences.append(
                    f"⚠️ ALERTE {context['alert_type']} en cours."
                )
        
        return " ".join(sentences)
    
    def generate_simple_report(
        self,
        weather_data: Dict[str, Any],
        region_name: str,
        timestamp: datetime
    ) -> Dict[str, Any]:
        """
        Génère un rapport complet simplifié
        """
        temp = weather_data.get('temperature', 0)
        
        return {
            'region': region_name,
            'date': timestamp.strftime('%d/%m/%Y à %H:%M'),
            'resume': self.generate_summary(weather_data),
            'details_simples': {
                'temperature': f"{int(temp)}°C - {self.get_description('temperature', temp)}",
                'humidite': f"{weather_data.get('humidity', 0)}% - {self.get_description('humidity', weather_data.get('humidity', 0))}",
                'vent': f"{int(weather_data.get('wind_speed', 0))} km/h - {self.get_description('wind_speed', weather_data.get('wind_speed', 0))}",
                'ciel': self.get_description('sky', weather_data.get('cloud_cover', 0)),
                'pluie': self.get_description('precipitation', weather_data.get('precipitation_prob', 0)),
            },
            'conseil': self.generate_advice(weather_data),
            'alerte': weather_data.get('alert', None)
        }
    
    def generate_advice(self, weather_data: Dict[str, Any]) -> str:
        """
        Génère un conseil basé sur les conditions
        """
        temp = weather_data.get('temperature', 25)
        uv = weather_data.get('uv_index', 5)
        
        advice = []
        
        if temp > 40:
            advice.append("Évitez les activités extérieures entre 11h et 16h")
            advice.append("Hydratez-vous régulièrement")
            advice.append("Portez des vêtements légers et clairs")
        elif temp > 35:
            advice.append("Limitez les efforts physiques aux heures chaudes")
            advice.append("Buvez de l'eau régulièrement")
        
        if uv >= 8:
            advice.append("Protection solaire indispensable (crème, chapeau)")
        
        if weather_data.get('wind_speed', 0) > 40:
            advice.append("Attention aux objets légers à l'extérieur")
        
        return " | ".join(advice) if advice else "Aucun conseil particulier"
```

### Exemple de Sortie Simplifiée

```json
// Format traité (prêt pour le frontend)
{
  "region": {
    "id": "centre",
    "name": "Centre (Ouagadougou)"
  },
  "timestamp": "2026-04-21T10:30:00Z",
  "date_formatted": "21/04/2026 à 10:30",
  "resume": "Il fait très chaud (41°C). L'air est très sec. Vent modéré (22 km/h). Ciel dégagé, beau temps. Pas de pluie prévue.",
  "details_simples": {
    "temperature": "41°C - Il fait très chaud (41°C). Évitez le soleil.",
    "humidite": "23% - L'air est très sec.",
    "vent": "22 km/h - Vent modéré (22 km/h).",
    "ciel": "Ciel dégagé, beau temps.",
    "pluie": "Pas de pluie prévue."
  },
  "contexte": {
    "comparaison_saison": "Température inhabituellement élevée (+3°C par rapport aux normales)",
    "tendance": "La chaleur devrait persister 3 jours"
  },
  "conseil": "Évitez les activités extérieures entre 11h et 16h | Hydratez-vous régulièrement | Portez des vêtements légers et clairs | Protection solaire indispensable (crème, chapeau)",
  "alerte": {
    "active": true,
    "type": "Vague de chaleur",
    "niveau": "Orange (Sévère)",
    "message": "Alerte chaleur extrême en cours jusqu'au 24/04"
  },
  "confiance_donnees": {
    "score": 100,
    "sources": 3,
    "warnings": []
  }
}
```

---

## Étape 7: Stockage des Données Traitées

```sql
-- Table des données traitées (optimisée pour lecture frontend)
CREATE TABLE processed_weather_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    region_id UUID REFERENCES regions(id),
    collected_at TIMESTAMP NOT NULL,
    processed_at TIMESTAMP DEFAULT NOW(),
    
    -- Données simplifiées
    temperature_c DECIMAL(5,2),
    temperature_description TEXT,
    humidity_pct DECIMAL(5,2),
    humidity_description TEXT,
    wind_speed_kmh DECIMAL(5,2),
    wind_description TEXT,
    wind_direction VARCHAR(10),
    cloud_cover_pct DECIMAL(5,2),
    sky_description TEXT,
    precipitation_prob_pct DECIMAL(5,2),
    
    -- Résumé généré
    summary TEXT,
    advice TEXT,
    
    -- Contexte
    is_above_normal BOOLEAN,
    temperature_anomaly DECIMAL(4,2),
    
    -- Alerte associée
    has_active_alert BOOLEAN DEFAULT FALSE,
    alert_type VARCHAR(50),
    alert_severity VARCHAR(20),
    
    -- Qualité des données
    confidence_score INTEGER,
    sources_count INTEGER,
    warnings JSONB,
    
    -- Métadonnées
    created_at TIMESTAMP DEFAULT NOW(),
    expires_at TIMESTAMP  -- TTL pour cache
);

-- Index pour requêtes rapides
CREATE INDEX idx_processed_region ON processed_weather_data(region_id);
CREATE INDEX idx_processed_collected ON processed_weather_data(collected_at DESC);
CREATE INDEX idx_processed_alert ON processed_weather_data(has_active_alert) WHERE has_active_alert = TRUE;
```

---

## Étape 8: Rendu Utilisateur

### API Endpoint

```python
# src/api/routes/weather.py

from fastapi import APIRouter, Depends, Query
from typing import Optional
from sqlalchemy.orm import Session

router = APIRouter(prefix="/weather", tags=["Weather"])

@router.get("/current")
async def get_current_weather(
    region_id: Optional[str] = Query(None, description="ID de la région"),
    db: Session = Depends(get_db)
):
    """
    Récupère les données météo actuelles (format simplifié)
    """
    if region_id:
        # Données pour une région spécifique
        data = db.query(ProcessedWeatherData)\
            .filter(ProcessedWeatherData.region_id == region_id)\
            .order_by(ProcessedWeatherData.collected_at.desc())\
            .first()
        
        if not data:
            raise HTTPException(404, "Données non disponibles")
        
        return {
            "success": True,
            "data": {
                "region": {"id": data.region_id, "name": data.region.name},
                "timestamp": data.collected_at.isoformat(),
                "resume": data.summary,
                "temperature": {
                    "value": float(data.temperature_c),
                    "description": data.temperature_description,
                    "unit": "°C"
                },
                "humidity": {
                    "value": float(data.humidity_pct),
                    "description": data.humidity_description,
                    "unit": "%"
                },
                "wind": {
                    "speed": float(data.wind_speed_kmh),
                    "direction": data.wind_direction,
                    "description": data.wind_description,
                    "unit": "km/h"
                },
                "advice": data.advice,
                "alert": {
                    "active": data.has_active_alert,
                    "type": data.alert_type,
                    "severity": data.alert_severity
                } if data.has_active_alert else None,
                "confidence": {
                    "score": data.confidence_score,
                    "sources": data.sources_count,
                    "warnings": data.warnings or []
                }
            }
        }
    
    else:
        # Toutes les régions
        all_data = db.query(ProcessedWeatherData)\
            .order_by(ProcessedWeatherData.collected_at.desc())\
            .all()
        
        return {
            "success": True,
            "data": [format_region_data(d) for d in all_data]
        }
```

### Réponse API (Exemple)

```json
{
  "success": true,
  "data": {
    "region": {
      "id": "centre",
      "name": "Centre (Ouagadougou)"
    },
    "timestamp": "2026-04-21T10:30:00Z",
    "resume": "Il fait très chaud (41°C). L'air est très sec. Vent modéré (22 km/h). Ciel dégagé, beau temps.",
    "temperature": {
      "value": 41.2,
      "description": "Il fait très chaud (41°C). Évitez le soleil.",
      "unit": "°C"
    },
    "humidity": {
      "value": 23,
      "description": "L'air est très sec.",
      "unit": "%"
    },
    "wind": {
      "speed": 22.3,
      "direction": "O",
      "description": "Vent modéré (22 km/h).",
      "unit": "km/h"
    },
    "advice": "Évitez les activités extérieures entre 11h et 16h | Hydratez-vous régulièrement | Portez des vêtements légers et clairs",
    "alert": {
      "active": true,
      "type": "Vague de chaleur",
      "severity": "severe"
    },
    "confidence": {
      "score": 100,
      "sources": 3,
      "warnings": []
    }
  }
}
```

---

## Diagramme de Flux Complet

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         DATA PIPELINE MYWEATHER                             │
└─────────────────────────────────────────────────────────────────────────────┘

  ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
  │  Meteo France   │     │  OpenWeatherMap │     │  Local Stations │
  │     (API)       │     │     (API)       │     │     (IoT)       │
  └────────┬────────┘     └────────┬────────┘     └────────┬────────┘
           │                       │                       │
           │  JSON brut            │  JSON brut            │  JSON brut
           │  (Kelvin, m/s, Pa)    │  (Kelvin, m/s, Pa)    │  (variable)
           ▼                       ▼                       ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                         ÉTAPE 1: COLLECTE                              │
  │  Celery Worker: fetch_weather_task (toutes les 15 min)                 │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                    ÉTAPE 2: STOCKAGE BRUT                              │
  │  PostgreSQL: raw_weather_data (JSONB)                                  │
  │  InfluxDB: raw_measurements (time-series)                              │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                   ÉTAPE 3: CONVERSION UNITÉS                           │
  │  Kelvin → Celsius | m/s → km/h | Pa → hPa | ° → Cardinale              │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                 ÉTAPE 4: VÉRIFICATION COHÉRENCE                        │
  │  - Comparaison 3 sources                                               │
  │  - Détection anomalies (Z-score, IQR)                                  │
  │  - Score de confiance                                                  │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                    ÉTAPE 5: ENRICHISSEMENT                             │
  │  - Comparaison normales de saison                                      │
  │  - Détection seuils d'alerte                                           │
  │  - Contexte historique                                                 │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                  ÉTAPE 6: SIMPLIFICATION LANGAGE                       │
  │  - Templates de phrases                                                │
  │  - Descriptions compréhensibles                                        │
  │  - Conseils contextualisés                                             │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                    ÉTAPE 7: STOCKAGE TRAITÉ                            │
  │  PostgreSQL: processed_weather_data                                    │
  │  Redis: Cache pour accès rapide (TTL 15 min)                           │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                      ÉTAPE 8: RENDU API                                │
  │  GET /api/v1/weather/current                                           │
  │  Response: JSON simplifié                                              │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                      FRONTEND (React)                                  │
  │  - Dashboard affiche résumé                                            │
  │  - Cartes avec zones colorées                                          │
  │  - Notifications si alerte                                             │
  └────────────────────────────────────────────────────────────────────────┘
           │
           ▼
  ┌────────────────────────────────────────────────────────────────────────┐
  │                       UTILISATEUR                                      │
  │  "Il fait très chaud à Ouaga aujourd'hui (41°C).                       │
  │   Restez à l'ombre et buvez de l'eau !"                                │
  └────────────────────────────────────────────────────────────────────────┘
```

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : En attente de validation*
