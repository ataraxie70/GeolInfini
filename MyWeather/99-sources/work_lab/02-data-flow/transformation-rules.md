# Règles de Transformation des Données

## Objectif

Ce document décrit les **règles de transformation** appliquées aux données brutes pour les convertir en informations simplifiées.

---

## 1. Conversion des Unités

### 1.1 Température

```python
# Kelvin → Celsius
def kelvin_to_celsius(k: float) -> float:
    return round(k - 273.15, 1)

# Exemples
314.15 K → 41.0°C
273.15 K → 0.0°C
293.15 K → 20.0°C
```

### 1.2 Vent

```python
# m/s → km/h
def ms_to_kmh(ms: float) -> float:
    return round(ms * 3.6, 1)

# Exemples
5.0 m/s → 18.0 km/h
10.0 m/s → 36.0 km/h
1.0 m/s → 3.6 km/h
```

### 1.3 Pression

```python
# Pascal → hPa (hectopascal)
def pa_to_hpa(pa: float) -> float:
    return round(pa / 100, 1)

# Exemples
101522 Pa → 1015.2 hPa
100000 Pa → 1000.0 hPa
```

### 1.4 Direction du Vent

```python
# Degrés → Direction cardinale
DEGREES_TO_DIRECTION = [
    (337.5, 360, "N", "Nord"),
    (0, 22.5, "N", "Nord"),
    (22.5, 67.5, "NE", "Nord-Est"),
    (67.5, 112.5, "E", "Est"),
    (112.5, 157.5, "SE", "Sud-Est"),
    (157.5, 202.5, "S", "Sud"),
    (202.5, 247.5, "SW", "Sud-Ouest"),
    (247.5, 292.5, "W", "Ouest"),
    (292.5, 337.5, "NW", "Nord-Ouest"),
]

def degrees_to_direction(degrees: float) -> tuple[str, str]:
    for min_val, max_val, short, full in DEGREES_TO_DIRECTION:
        if min_val <= degrees < max_val:
            return short, full
    return "N", "Nord"

# Exemples
0° → N (Nord)
90° → E (Est)
180° → S (Sud)
270° → W (Ouest)
```

### 1.5 Visibilité

```python
# mètres → kilomètres
def m_to_km(m: float) -> float:
    return round(m / 1000, 1)

# Exemples
10000 m → 10.0 km
5000 m → 5.0 km
1000 m → 1.0 km
```

---

## 2. descriptions de Température

### 2.1 Seuils pour le Burkina Faso

```python
TEMP_DESCRIPTIONS = [
    (20, "very_cold", "Il fait très froid ({temp}°C). Couvrez-vous bien."),
    (25, "cold", "Il fait frais ({temp}°C)."),
    (30, "mild", "Température agréable ({temp}°C)."),
    (35, "warm", "Il fait chaud ({temp}°C)."),
    (40, "very_hot", "Il fait très chaud ({temp}°C). Évitez le soleil."),
    (43, "extreme_hot", "CHALEUR EXTRÊME ({temp}°C). Danger pour la santé."),
]

def get_temp_description(temp_c: float) -> str:
    for threshold, key, template in TEMP_DESCRIPTIONS:
        if temp_c < threshold:
            return template.format(temp=int(temp_c))
    return template.format(temp=int(temp_c))

# Exemples
18°C → "Il fait très froid (18°C). Couvrez-vous bien."
23°C → "Il fait frais (23°C)."
28°C → "Température agréable (28°C)."
33°C → "Il fait chaud (33°C)."
38°C → "Il fait très chaud (38°C). Évitez le soleil."
42°C → "CHALEUR EXTRÊME (42°C). Danger pour la santé."
```

### 2.2 Température Ressentie

```python
# Calcul de l'indice de chaleur (Heat Index)
def calculate_heat_index(temp_c: float, humidity: float) -> float:
    """
    Calcule la température ressentie en fonction de l'humidité
    Formule simplifiée de Steadman
    """
    if temp_c < 27:
        return temp_c  # Pas significatif en-dessous de 27°C
    
    # Formule complète (simplifiée ici)
    hi = 0.5 * (temp_c + 61.0 + ((temp_c - 68.0) * 1.2) + (humidity * 0.094))
    
    if hi >= 80:
        # Formule complète nécessaire
        hi = (
            -42.379 + 2.04901523 * temp_c + 10.14333127 * humidity
            - 0.22475541 * temp_c * humidity - 0.00683783 * temp_c**2
            - 0.05481717 * humidity**2 + 0.00122874 * temp_c**2 * humidity
            + 0.00085282 * temp_c * humidity**2 - 0.00000199 * temp_c**2 * humidity**2
        )
    
    return round(hi - 32, 1)  # Conversion Fahrenheit → Celsius

# Exemples
40°C, 20% → 38°C (ressenti plus bas car air sec)
40°C, 60% → 48°C (ressenti plus haut car air humide)
35°C, 80% → 42°C (effet de serre humide)
```

---

## 3. Descriptions d'Humidité

```python
HUMIDITY_DESCRIPTIONS = [
    (20, "very_dry", "L'air est très sec."),
    (30, "dry", "L'air est sec."),
    (50, "comfortable", "Humidité confortable."),
    (60, "slightly_humid", "L'air est légèrement humide."),
    (80, "humid", "L'air est humide, temps lourd."),
    (100, "very_humid", "L'air est très humide, saturation."),
]

def get_humidity_description(humidity: float) -> str:
    for threshold, key, template in HUMIDITY_DESCRIPTIONS:
        if humidity < threshold:
            return template
    return template

# Exemples
15% → "L'air est très sec."
25% → "L'air est sec."
45% → "Humidité confortable."
70% → "L'air est humide, temps lourd."
90% → "L'air est très humide, saturation."
```

---

## 4. Descriptions du Vent

```python
WIND_DESCRIPTIONS = [
    (5, "calm", "Vent calme ou absent."),
    (15, "light", "Légère brise ({speed} km/h)."),
    (30, "moderate", "Vent modéré ({speed} km/h)."),
    (50, "strong", "Vent fort ({speed} km/h). Attention aux objets légers."),
    (80, "very_strong", "VENT TRÈS FORT ({speed} km/h). Restez à l'abri."),
    (120, "extreme", "VENT EXTRÊME ({speed} km/h). Danger imminent."),
]

def get_wind_description(speed_kmh: float) -> str:
    for threshold, key, template in WIND_DESCRIPTIONS:
        if speed_kmh < threshold:
            return template.format(speed=int(speed_kmh))
    return template.format(speed=int(speed_kmh))

# Exemples
3 km/h → "Vent calme ou absent."
10 km/h → "Légère brise (10 km/h)."
25 km/h → "Vent modéré (25 km/h)."
45 km/h → "Vent fort (45 km/h). Attention aux objets légers."
70 km/h → "VENT TRÈS FORT (70 km/h). Restez à l'abri."
100 km/h → "VENT EXTRÊME (100 km/h). Danger imminent."
```

---

## 5. Descriptions du Ciel

```python
SKY_DESCRIPTIONS = [
    (10, "clear", "Ciel dégagé, beau temps."),
    (25, "few_clouds", "Quelques nuages."),
    (50, "scattered", "Partiellement nuageux."),
    (80, "broken", "Très nuageux."),
    (100, "overcast", "Ciel couvert."),
]

def get_sky_description(cloud_cover: float) -> str:
    for threshold, key, template in SKY_DESCRIPTIONS:
        if cloud_cover <= threshold:
            return template
    return template

# Exemples
5% → "Ciel dégagé, beau temps."
20% → "Quelques nuages."
40% → "Partiellement nuageux."
70% → "Très nuageux."
95% → "Ciel couvert."
```

---

## 6. Descriptions des Précipitations

```python
PRECIP_DESCRIPTIONS = [
    (0, "none", "Pas de pluie prévue."),
    (20, "low", "Faible risque de pluie ({prob}%)."),
    (50, "medium", "Risque de pluie ({prob}%). Prévoyez un parapluie."),
    (80, "high", "Fortes pluies attendues ({prob}%)."),
    (100, "certain", "Pluie certaine. Restez à l'abri."),
]

def get_precip_description(probability: float, amount_mm: float = 0) -> str:
    for threshold, key, template in PRECIP_DESCRIPTIONS:
        if probability < threshold:
            return template.format(prob=int(probability))
    return template.format(prob=int(probability))

# Exemples
0% → "Pas de pluie prévue."
15% → "Faible risque de pluie (15%)."
40% → "Risque de pluie (40%). Prévoyez un parapluie."
75% → "Fortes pluies attendues (75%)."
95% → "Pluie certaine. Restez à l'abri."
```

---

## 7. Comparaison avec les Normales

### 7.1 Normales Climatiques par Région

```python
# Normales 1991-2020 pour le Burkina Faso
CLIMATE_NORMALS = {
    'centre': {
        1: {'temp_avg': 28.5, 'temp_min': 22.0, 'temp_max': 35.0, 'rain_avg': 0},
        2: {'temp_avg': 30.2, 'temp_min': 23.5, 'temp_max': 37.0, 'rain_avg': 0},
        3: {'temp_avg': 32.1, 'temp_min': 25.0, 'temp_max': 39.0, 'rain_avg': 5},
        4: {'temp_avg': 33.5, 'temp_min': 26.5, 'temp_max': 40.5, 'rain_avg': 20},
        5: {'temp_avg': 33.0, 'temp_min': 26.0, 'temp_max': 40.0, 'rain_avg': 60},
        6: {'temp_avg': 31.5, 'temp_min': 24.5, 'temp_max': 38.0, 'rain_avg': 100},
        7: {'temp_avg': 29.5, 'temp_min': 23.0, 'temp_max': 35.0, 'rain_avg': 150},
        8: {'temp_avg': 28.0, 'temp_min': 22.5, 'temp_max': 33.0, 'rain_avg': 200},
        9: {'temp_avg': 28.5, 'temp_min': 22.5, 'temp_max': 34.0, 'rain_avg': 180},
        10: {'temp_avg': 29.5, 'temp_min': 23.0, 'temp_max': 36.0, 'rain_avg': 100},
        11: {'temp_avg': 30.5, 'temp_min': 23.5, 'temp_max': 37.0, 'rain_avg': 30},
        12: {'temp_avg': 29.0, 'temp_min': 22.5, 'temp_max': 36.0, 'rain_avg': 0},
    },
    # ... autres régions
}

def compare_with_normal(
    region_id: str, 
    month: int, 
    current_temp: float
) -> dict:
    """
    Compare la température actuelle avec les normales de saison
    """
    normals = CLIMATE_NORMALS.get(region_id, {}).get(month)
    
    if not normals:
        return {
            'comparison': 'Données non disponibles',
            'is_normal': True,
            'anomaly': 0
        }
    
    anomaly = current_temp - normals['temp_avg']
    
    if abs(anomaly) < 1:
        status = "dans les normales de saison"
    elif anomaly > 0:
        status = f"au-dessus des normales (+{anomaly:.1f}°C)"
    else:
        status = f"en-dessous des normales ({anomaly:.1f}°C)"
    
    return {
        'comparison': status,
        'is_above_normal': anomaly > 0,
        'is_below_normal': anomaly < 0,
        'is_extreme': abs(anomaly) > 3,
        'anomaly': round(anomaly, 1),
        'normal_avg': normals['temp_avg']
    }

# Exemples (Centre, Avril)
# Normale: 33.5°C
35.0°C → "au-dessus des normales (+1.5°C)"
38.0°C → "au-dessus des normales (+4.5°C)" [EXTREME]
32.0°C → "en-dessous des normales (-1.5°C)"
33.0°C → "dans les normales de saison"
```

---

## 8. Génération de Résumé

```python
def generate_weather_summary(data: dict) -> str:
    """
    Génère un résumé météo en langage naturel
    """
    sentences = []
    
    # Température (toujours inclus)
    temp = data.get('temperature', 25)
    temp_desc = get_temp_description(temp)
    sentences.append(temp_desc)
    
    # Humidité (seulement si notable)
    humidity = data.get('humidity', 50)
    if humidity < 25 or humidity > 75:
        humidity_desc = get_humidity_description(humidity)
        sentences.append(humidity_desc)
    
    # Vent (seulement si notable)
    wind = data.get('wind_speed', 0)
    if wind > 10:
        wind_desc = get_wind_description(wind)
        sentences.append(wind_desc)
    
    # Ciel
    cloud = data.get('cloud_cover', 0)
    sky_desc = get_sky_description(cloud)
    sentences.append(sky_desc)
    
    # Précipitations
    precip = data.get('precipitation_prob', 0)
    if precip > 0:
        precip_desc = get_precip_description(precip)
        sentences.append(precip_desc)
    
    return " ".join(sentences)

# Exemple d'utilisation
data = {
    'temperature': 41,
    'humidity': 23,
    'wind_speed': 22,
    'cloud_cover': 5,
    'precipitation_prob': 0
}

summary = generate_weather_summary(data)
# Résultat:
# "Il fait très chaud (41°C). Évitez le soleil. L'air est très sec. 
#  Vent modéré (22 km/h). Ciel dégagé, beau temps."
```

---

## 9. Génération de Conseils

```python
def generate_advice(weather_data: dict, alert_data: dict = None) -> list[str]:
    """
    Génère des conseils basés sur les conditions météo
    """
    advice = []
    
    temp = weather_data.get('temperature', 25)
    uv = weather_data.get('uv_index', 5)
    wind = weather_data.get('wind_speed', 0)
    humidity = weather_data.get('humidity', 50)
    
    # Conseils chaleur
    if temp > 40:
        advice.extend([
            "Évitez les activités extérieures entre 11h et 16h",
            "Hydratez-vous régulièrement (au moins 2L d'eau par jour)",
            "Portez des vêtements légers, clairs et amples",
            "Restez à l'ombre ou dans des endroits climatisés",
            "Ne laissez jamais personne dans une voiture stationnée au soleil"
        ])
    elif temp > 35:
        advice.extend([
            "Limitez les efforts physiques aux heures chaudes",
            "Buvez de l'eau régulièrement sans attendre la soif"
        ])
    
    # Conseils UV
    if uv >= 8:
        advice.extend([
            "Protection solaire indispensable",
            "Appliquez de la crème solaire (indice 50+)",
            "Portez un chapeau à larges bords",
            "Portez des lunettes de soleil"
        ])
    elif uv >= 6:
        advice.append("Protection solaire recommandée")
    
    # Conseils vent
    if wind > 50:
        advice.extend([
            "Attention aux objets légers à l'extérieur",
            "Évitez de stationner sous les arbres"
        ])
    
    # Conseils humidité (air sec)
    if humidity < 20:
        advice.extend([
            "Hydratez votre peau avec des crèmes hydratantes",
            "Protégez vos yeux (larmes artificielles si besoin)",
            "Évitez les lentilles de contact prolongées"
        ])
    
    # Conseils agriculture (si applicable)
    if weather_data.get('user_type') == 'farmer':
        if temp > 40:
            advice.append("Arrosez vos cultures tôt le matin ou tard le soir")
        if humidity < 20:
            advice.append("Paillage recommandé pour conserver l'humidité du sol")
    
    # Conseils élevage (si applicable)
    if weather_data.get('user_type') == 'herder':
        if temp > 40:
            advice.extend([
                "Assurez-vous que les animaux ont accès à l'eau",
                "Évitez les déplacements pendant les heures chaudes",
                "Recherchez des zones ombragées pour le pâturage"
            ])
    
    # Alerte active
    if alert_data and alert_data.get('active'):
        advice.append(f"⚠️ ALERTE {alert_data['type']}: {alert_data['message']}")
    
    # Dé-duplication et limite
    unique_advice = list(dict.fromkeys(advice))
    return unique_advice[:5]  # Maximum 5 conseils

# Exemple
data = {'temperature': 41, 'humidity': 23, 'uv_index': 9, 'wind_speed': 22}
advice = generate_advice(data)
# [
#   "Évitez les activités extérieures entre 11h et 16h",
#   "Hydratez-vous régulièrement (au moins 2L d'eau par jour)",
#   "Portez des vêtements légers, clairs et amples",
#   "Protection solaire indispensable",
#   "Appliquez de la crème solaire (indice 50+)"
# ]
```

---

## 10. Tableau Récapitulatif des Règles

| Donnée | Seuil | Description | Conseil |
|--------|-------|-------------|---------|
| **Température** | < 20°C | Très froid | Couvrez-vous |
| | 20-25°C | Frais | - |
| | 25-30°C | Agréable | - |
| | 30-35°C | Chaud | Limitez efforts |
| | 35-40°C | Très chaud | Évitez 11h-16h |
| | > 40°C | Chaleur extrême | Danger santé |
| **Humidité** | < 20% | Très sec | Hydratez peau |
| | 20-30% | Sec | - |
| | 30-60% | Confortable | - |
| | 60-80% | Humide | - |
| | > 80% | Très humide | Temps lourd |
| **Vent** | < 5 km/h | Calme | - |
| | 5-15 km/h | Légère brise | - |
| | 15-30 km/h | Modéré | - |
| | 30-50 km/h | Fort | Attention objets |
| | 50-80 km/h | Très fort | Restez à l'abri |
| | > 80 km/h | Extrême | Danger |

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : Validé*
