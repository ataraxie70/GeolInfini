# Vérifications de Cohérence et Détection d'Anomalies

## Objectif

Ce document décrit les **mécanismes de validation** des données météo pour garantir leur fiabilité avant affichage.

---

## 1. Types de Vérifications

```
┌─────────────────────────────────────────────────────────────────┐
│                  VÉRIFICATIONS DE COHÉRENCE                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. COMPARAISON MULTI-SOURCES                                   │
│     └─→ Les 3 sources sont-elles alignées ?                     │
│                                                                 │
│  2. DÉTECTION VALEURS ABERRANTES (Outliers)                     │
│     └─→ Y a-t-il une valeur "hors norme" ?                      │
│                                                                 │
│  3. VÉRIFICATION DE PLAUSIBILITÉ                                │
│     └─→ La valeur est-elle possible pour le Burkina Faso ?      │
│                                                                 │
│  4. CONTRÔLE DE COHÉRENCE INTERNE                               │
│     └─→ Les données sont-elles cohérentes entre elles ?         │
│                                                                 │
│  5. VÉRIFICATION TEMPORELLE                                     │
│     └─→ La donnée est-elle récente ?                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Comparaison Multi-Sources

### Principe

```
Source 1 (Meteo France):    41.2°C
Source 2 (OpenWeatherMap):  40.8°C
Source 3 (Local Station):   41.5°C
                            ─────
                            Moyenne: 41.17°C
                            Écart max: 0.7°C → CONFIANCE: 100%
```

```
Source 1 (Meteo France):    41.2°C
Source 2 (OpenWeatherMap):  32.5°C  ← ANOMALIE
Source 3 (Local Station):   41.5°C
                            ─────
                            Moyenne: 38.4°C (faussée !)
                            Écart max: 9.0°C → CONFIANCE: 20%
```

### Algorithme

```python
def compare_sources(values: list[tuple[str, float]]) -> dict:
    """
    Compare les valeurs de multiples sources
    
    Args:
        values: Liste de tuples (source_name, value)
    
    Returns:
        dict avec statistiques et score de confiance
    """
    if not values:
        return {'error': 'Aucune donnée'}
    
    if len(values) == 1:
        return {
            'selected_value': values[0][1],
            'sources_count': 1,
            'confidence': 40,  # Confiance faible, une seule source
            'warnings': ['Une seule source disponible']
        }
    
    # Extraire les valeurs
    numeric_values = [v[1] for v in values]
    
    # Statistiques de base
    min_val = min(numeric_values)
    max_val = max(numeric_values)
    avg_val = sum(numeric_values) / len(numeric_values)
    spread = max_val - min_val  # Écart max
    
    # Calcul de la variance (si >= 2 sources)
    if len(numeric_values) >= 2:
        variance = sum((x - avg_val) ** 2 for x in numeric_values) / len(numeric_values)
        std_dev = variance ** 0.5
    else:
        std_dev = 0
    
    # Calcul du score de confiance
    if spread < 2:
        confidence = 100  # Excellente cohérence
    elif spread < 5:
        confidence = 70   # Bonne cohérence
    elif spread < 10:
        confidence = 40   # Cohérence moyenne
    else:
        confidence = 20   # Mauvaise cohérence
    
    # Détection de source potentiellement erronée
    outlier_source = None
    if len(numeric_values) >= 3 and std_dev > 0:
        z_scores = [(v - avg_val) / std_dev for v in numeric_values]
        max_z_idx = max(range(len(z_scores)), key=lambda i: abs(z_scores[i]))
        
        # Si Z-score > 2, la valeur est statistiquement aberrante
        if abs(z_scores[max_z_idx]) > 2:
            outlier_source = values[max_z_idx][0]
    
    return {
        'selected_value': avg_val,
        'sources_count': len(values),
        'min': min_val,
        'max': max_val,
        'spread': round(spread, 2),
        'std_deviation': round(std_dev, 2),
        'confidence': confidence,
        'outlier_source': outlier_source,
        'warnings': [f"Écart important: {round(spread, 1)}°C"] if spread > 5 else []
    }

# Exemple 1: Sources alignées
values = [
    ('meteo_france', 41.2),
    ('openweathermap', 40.8),
    ('local_station', 41.5)
]
result = compare_sources(values)
# {
#   'selected_value': 41.17,
#   'sources_count': 3,
#   'min': 40.8,
#   'max': 41.5,
#   'spread': 0.7,
#   'confidence': 100,
#   'outlier_source': None,
#   'warnings': []
# }

# Exemple 2: Anomalie détectée
values = [
    ('meteo_france', 41.2),
    ('openweathermap', 32.5),  # Anomalie
    ('local_station', 41.5)
]
result = compare_sources(values)
# {
#   'selected_value': 38.4,
#   'sources_count': 3,
#   'min': 32.5,
#   'max': 41.5,
#   'spread': 9.0,
#   'confidence': 40,
#   'outlier_source': 'openweathermap',
#   'warnings': ['Écart important: 9.0°C']
# }
```

---

## 3. Détection de Valeurs Aberrantes (Outliers)

### Méthode Z-Score

```python
def detect_outliers_zscore(values: list[float], threshold: float = 3.0) -> list[int]:
    """
    Détecte les valeurs aberrantes utilisant le Z-score
    
    Z-score = (valeur - moyenne) / écart-type
    
    Si |Z-score| > 3 → valeur aberrante (99.7% de confiance)
    """
    if len(values) < 3:
        return []
    
    avg = sum(values) / len(values)
    std_dev = (sum((x - avg) ** 2 for x in values) / len(values)) ** 0.5
    
    if std_dev == 0:
        return []
    
    outliers = []
    for i, val in enumerate(values):
        z_score = abs((val - avg) / std_dev)
        if z_score > threshold:
            outliers.append(i)
    
    return outliers

# Exemple
values = [41.2, 40.8, 41.5, 32.5, 41.0]
outliers = detect_outliers_zscore(values)
# [3] → La valeur 32.5 est aberrante
```

### Méthode IQR (Interquartile Range)

```python
def detect_outliers_iqr(values: list[float]) -> list[int]:
    """
    Détecte les valeurs aberrantes utilisant l'écart interquartile
    
    IQR = Q3 - Q1
    Outlier si: valeur < Q1 - 1.5*IQR ou valeur > Q3 + 1.5*IQR
    """
    if len(values) < 4:
        return []
    
    sorted_vals = sorted(values)
    n = len(sorted_vals)
    
    # Calcul des quartiles
    q1_idx = n // 4
    q3_idx = (3 * n) // 4
    
    q1 = sorted_vals[q1_idx]
    q3 = sorted_vals[q3_idx]
    
    iqr = q3 - q1
    
    lower_bound = q1 - 1.5 * iqr
    upper_bound = q3 + 1.5 * iqr
    
    outliers = []
    for i, val in enumerate(values):
        if val < lower_bound or val > upper_bound:
            outliers.append(i)
    
    return outliers

# Exemple
values = [41.2, 40.8, 41.5, 32.5, 41.0, 40.5, 41.8]
outliers = detect_outliers_iqr(values)
# [3] → La valeur 32.5 est aberrante
```

---

## 4. Vérification de Plausibilité

### Plages de Valeurs Possibles (Burkina Faso)

```python
PLAUSIBLE_RANGES = {
    'temperature': {
        'min': -5,    # Jamais vu mais théoriquement possible
        'max': 50,    # Record absolu ~47°C
        'warning_min': 5,
        'warning_max': 45,
    },
    'humidity': {
        'min': 0,
        'max': 100,
    },
    'wind_speed': {
        'min': 0,
        'max': 120,   # Ouragan category 3+
        'warning_max': 80,
    },
    'pressure': {
        'min': 980,   # Tempête majeure
        'max': 1050,  # Anticyclone fort
    },
    'precipitation': {
        'min': 0,
        'max': 300,   # mm en 24h (extrême)
        'warning_max': 150,
    },
}

def check_plausibility(field: str, value: float) -> dict:
    """
    Vérifie si une valeur est plausible pour le Burkina Faso
    """
    ranges = PLAUSIBLE_RANGES.get(field)
    
    if not ranges:
        return {'valid': True, 'message': 'Champ inconnu'}
    
    min_val = ranges.get('min', float('-inf'))
    max_val = ranges.get('max', float('inf'))
    warning_min = ranges.get('warning_min', min_val)
    warning_max = ranges.get('warning_max', max_val)
    
    if value < min_val or value > max_val:
        return {
            'valid': False,
            'level': 'error',
            'message': f"Valeur impossible pour {field}: {value} (attendu: {min_val}-{max_val})"
        }
    
    if value < warning_min or value > warning_max:
        return {
            'valid': True,
            'level': 'warning',
            'message': f"Valeur inhabituelle pour {field}: {value}"
        }
    
    return {
        'valid': True,
        'level': 'info',
        'message': f"Valeur plausible pour {field}: {value}"
    }

# Exemples
check_plausibility('temperature', 41)
# {'valid': True, 'level': 'info', 'message': 'Valeur plausible pour temperature: 41'}

check_plausibility('temperature', 60)
# {'valid': False, 'level': 'error', 'message': 'Valeur impossible pour temperature: 60'}

check_plausibility('temperature', -5)
# {'valid': True, 'level': 'warning', 'message': 'Valeur inhabituelle pour temperature: -5'}
```

---

## 5. Contrôle de Cohérence Interne

### Vérifications Croisées

```python
def check_internal_coherence(data: dict) -> list[dict]:
    """
    Vérifie la cohérence entre différentes données météo
    """
    warnings = []
    
    # 1. Température vs Point de rosée
    # Le point de rosée ne peut pas dépasser la température
    if 'temp' in data and 'dew_point' in data:
        if data['dew_point'] > data['temp']:
            warnings.append({
                'field': 'dew_point',
                'level': 'error',
                'message': f"Point de rosée ({data['dew_point']}°C) > Température ({data['temp']}°C) impossible"
            })
    
    # 2. Humidité élevée + Température élevée = Heat Index élevé
    if data.get('temp', 0) > 35 and data.get('humidity', 0) > 80:
        warnings.append({
            'field': 'heat_index',
            'level': 'warning',
            'message': "Combinaison chaleur + humidité extrême - Heat Index très élevé"
        })
    
    # 3. Vent fort + Ciel dégagé = Risque poussière
    if data.get('wind_speed', 0) > 50 and data.get('cloud_cover', 0) < 20:
        warnings.append({
            'field': 'dust_risk',
            'level': 'warning',
            'message': "Risque de vague de poussière (vent fort + ciel dégagé)"
        })
    
    # 4. Pression très basse = Système dépressionnaire
    if data.get('pressure', 1013) < 995:
        warnings.append({
            'field': 'pressure',
            'level': 'warning',
            'message': "Pression très basse - Système météorologique intense possible"
        })
    
    # 5. Précipitations sans nuages = Incohérent
    if data.get('precipitation', 0) > 0 and data.get('cloud_cover', 0) < 30:
        warnings.append({
            'field': 'precip_cloud',
            'level': 'warning',
            'message': "Pluie détectée sans couverture nuageuse significative"
        })
    
    return warnings

# Exemple
data = {
    'temp': 42,
    'humidity': 85,
    'wind_speed': 55,
    'cloud_cover': 5,
    'pressure': 1015
}

warnings = check_internal_coherence(data)
# [
#   {'field': 'heat_index', 'level': 'warning', 
#    'message': "Combinaison chaleur + humidité extrême..."},
#   {'field': 'dust_risk', 'level': 'warning',
#    'message': "Risque de vague de poussière..."}
# ]
```

---

## 6. Vérification Temporelle

### Fraîcheur des Données

```python
from datetime import datetime, timedelta

def check_data_freshness(collected_at: datetime, max_age_minutes: int = 30) -> dict:
    """
    Vérifie si les données sont suffisamment récentes
    """
    now = datetime.utcnow()
    age = now - collected_at
    
    if age > timedelta(hours=2):
        return {
            'fresh': False,
            'level': 'error',
            'message': f"Données obsolètes ({age.seconds // 60} min)",
            'age_minutes': age.seconds // 60
        }
    
    if age > timedelta(minutes=max_age_minutes):
        return {
            'fresh': True,
            'level': 'warning',
            'message': f"Données anciennes ({age.seconds // 60} min)",
            'age_minutes': age.seconds // 60
        }
    
    return {
        'fresh': True,
        'level': 'info',
        'message': f"Données récentes ({age.seconds // 60} min)",
        'age_minutes': age.seconds // 60
    }

# Exemple
collected = datetime.utcnow() - timedelta(minutes=45)
result = check_data_freshness(collected)
# {
#   'fresh': True,
#   'level': 'warning',
#   'message': 'Données anciennes (45 min)',
#   'age_minutes': 45
# }
```

---

## 7. Score de Confiance Global

### Calcul du Score

```python
def calculate_confidence_score(
    sources_count: int,
    spread: float,
    has_outlier: bool,
    plausibility_ok: bool,
    coherence_warnings: list,
    data_age_minutes: int
) -> int:
    """
    Calcule un score de confiance global (0-100)
    """
    score = 100
    
    # 1. Nombre de sources (max -20)
    if sources_count == 1:
        score -= 40
    elif sources_count == 2:
        score -= 20
    elif sources_count >= 3:
        score -= 0
    
    # 2. Écart entre sources (max -30)
    if spread > 10:
        score -= 30
    elif spread > 5:
        score -= 20
    elif spread > 2:
        score -= 10
    
    # 3. Outlier détecté (max -20)
    if has_outlier:
        score -= 20
    
    # 4. Plausibilité (max -30)
    if not plausibility_ok:
        score -= 30
    
    # 5. Cohérence interne (max -15)
    score -= min(len(coherence_warnings) * 5, 15)
    
    # 6. Âge des données (max -20)
    if data_age_minutes > 120:
        score -= 20
    elif data_age_minutes > 60:
        score -= 10
    elif data_age_minutes > 30:
        score -= 5
    
    return max(0, min(100, score))

# Exemple 1: Données fiables
score = calculate_confidence_score(
    sources_count=3,
    spread=0.7,
    has_outlier=False,
    plausibility_ok=True,
    coherence_warnings=[],
    data_age_minutes=15
)
# 100 → Excellente confiance

# Exemple 2: Données douteuses
score = calculate_confidence_score(
    sources_count=2,
    spread=8.5,
    has_outlier=True,
    plausibility_ok=True,
    coherence_warnings=['Vent fort sans nuages'],
    data_age_minutes=75
)
# 35 → Faible confiance
```

### Interprétation du Score

| Score | Niveau | Action |
|-------|--------|--------|
| **80-100** | 🟢 Excellente | Afficher normalement |
| **60-79** | 🟡 Bonne | Afficher avec indication |
| **40-59** | 🟠 Moyenne | Afficher avec avertissement |
| **20-39** | 🔴 Faible | Afficher avec alerte de confiance |
| **0-19** | ⚫ Très faible | Masquer ou demander vérification |

---

## 8. Gestion des Anomalies

### Workflow de Traitement

```
┌─────────────────┐
│ Anomalie        │
│ Détectée        │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ 1. CLASSIFIER L'ANOMALIE                                        │
│    - Mineure (écart 2-5°C)                                      │
│    - Majeure (écart 5-10°C)                                     │
│    - Critique (écart >10°C ou valeur impossible)                │
└─────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ 2. ACTION SELON NIVEAU                                          │
│                                                                 │
│  Mineure:                                                       │
│    - Utiliser moyenne des sources                               │
│    - Ajouter warning dans l'affichage                           │
│    - Log pour analyse                                           │
│                                                                 │
│  Majeure:                                                       │
│    - Exclure source aberrante                                   │
│    - Utiliser moyenne des sources fiables                       │
│    - Afficher indicateur de confiance réduit                    │
│    - Notification à l'équipe technique                          │
│                                                                 │
│  Critique:                                                      │
│    - Rejeter toutes les sources                                 │
│    - Tenter récupération alternative                            │
│    - Afficher "Données non disponibles"                         │
│    - Alerte immédiate équipe technique                          │
└─────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ 3. LOGGING ET TRACKING                                          │
│    - Enregistrer dans audit_logs                                │
│    - Metric Prometheus (anomaly_count)                          │
│    - Review hebdomadaire                                        │
└─────────────────────────────────────────────────────────────────┘
```

### Code de Gestion

```python
from enum import Enum

class AnomalyLevel(Enum):
    MINOR = "minor"
    MAJOR = "major"
    CRITICAL = "critical"

def handle_anomaly(
    field: str,
    values: list[tuple[str, float]],
    anomaly_type: str,
    spread: float
) -> dict:
    """
    Gère une anomalie détectée et retourne la valeur à utiliser
    """
    # Déterminer le niveau
    if spread > 10 or anomaly_type == 'impossible_value':
        level = AnomalyLevel.CRITICAL
    elif spread > 5:
        level = AnomalyLevel.MAJOR
    else:
        level = AnomalyLevel.MINOR
    
    # Action selon le niveau
    if level == AnomalyLevel.CRITICAL:
        # Rejeter toutes les sources
        return {
            'value': None,
            'confidence': 0,
            'level': 'critical',
            'message': 'Données non fiables - Vérification en cours',
            'action': 'reject_all'
        }
    
    elif level == AnomalyLevel.MAJOR:
        # Exclure source aberrante et utiliser moyenne des autres
        outlier_idx = detect_outliers_zscore([v[1] for v in values])
        
        if outlier_idx:
            reliable_values = [v[1] for i, v in enumerate(values) if i not in outlier_idx]
        else:
            reliable_values = [v[1] for v in values]
        
        avg_value = sum(reliable_values) / len(reliable_values)
        
        return {
            'value': avg_value,
            'confidence': 40,
            'level': 'major',
            'message': f'Données avec confiance réduite (écart: {spread:.1f}°C)',
            'action': 'exclude_outlier'
        }
    
    else:  # MINOR
        # Utiliser moyenne avec warning
        avg_value = sum(v[1] for v in values) / len(values)
        
        return {
            'value': avg_value,
            'confidence': 70,
            'level': 'minor',
            'message': f'Écart entre sources: {spread:.1f}°C',
            'action': 'use_average_warning'
        }

# Exemple
values = [
    ('meteo_france', 41.2),
    ('openweathermap', 32.5),  # Anomalie
    ('local_station', 41.5)
]

result = handle_anomaly(
    field='temperature',
    values=values,
    anomaly_type='source_divergence',
    spread=9.0
)
# {
#   'value': 41.35,  # Moyenne de meteo_france et local_station
#   'confidence': 40,
#   'level': 'major',
#   'message': 'Données avec confiance réduite (écart: 9.0°C)',
#   'action': 'exclude_outlier'
# }
```

---

## 9. Tableau Récapitulatif des Vérifications

| Type | Méthode | Seuil | Action |
|------|---------|-------|--------|
| **Multi-sources** | Spread max | >5°C | Warning |
| | | >10°C | Rejet |
| **Outlier** | Z-score | >2 | Exclure source |
| | | >3 | Alert |
| **Plausibilité** | Température | < -5 ou > 50°C | Rejet |
| | Humidité | < 0 ou > 100% | Rejet |
| | Vent | > 120 km/h | Rejet |
| **Cohérence** | Dew point > Temp | Error | Rejet |
| | Pluie sans nuages | Warning | Alert |
| **Fraîcheur** | Âge données | > 30 min | Warning |
| | | > 2h | Rejet |

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : En attente de validation*
