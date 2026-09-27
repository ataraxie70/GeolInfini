# 02-data-flow - Flux de Données (CŒUR DE LA PLATEFORME)

## Navigation

| Fichier | Description |
|---------|-------------|
| [data-pipeline.md](./data-pipeline.md) | Pipeline complet : API → Utilisateur |
| [raw-data-format.md](./raw-data-format.md) | Format des données brutes (APIs météo) |
| [processed-data-format.md](./processed-data-format.md) | Format traité (simplifié pour utilisateurs) |
| [transformation-rules.md](./transformation-rules.md) | Règles de transformation des données |
| [coherence-checks.md](./coherence-checks.md) | Vérifications de cohérence et détection d'anomalies |
| [simple-language.md](./simple-language.md) | Guide de simplification du langage météo |

---

## 🔄 Le Cœur de MyWeather

Ce dossier contient le **système de transformation des données** qui fait la valeur de MyWeather :

```
API Météo (technique)
    │
    ▼
Stockage données brutes
    │
    ▼
Traitement & Simplification  ←── C'EST ICI LA VALEUR AJOUTÉE
    │
    ├──► Vérification de cohérence
    ├──► Détection d'anomalies/écarts
    ├──► Transformation en langage simple
    │
    ▼
Rendu Utilisateur (compréhensible par tous)
```

---

## Pourquoi ce traitement est crucial

Les APIs météo (Meteo France, OpenWeatherMap) fournissent des données **techniques** :
- Température : `temp: 314.15K` (Kelvin !)
- Vent : `wind: {"speed": 5.1, "deg": 270, "gust": 8.3}`
- Pression : `pressure: 101522 Pa`

Un utilisateur ordinaire au Burkina Faso a besoin de :
- "Il fait très chaud (41°C)"
- "Vent d'ouest à 18 km/h avec des rafales"
- "Pression normale"

---

## Principes de Transformation

### 1. Conversion des unités
```json
// Brut (API)
{"temp": 314.15, "temp_unit": "K"}

// Traité (MyWeather)
{"temperature": "41°C", "feeling": "Très chaud"}
```

### 2. Simplification du langage
```json
// Brut (API)
{"humidity": 23, "dew_point": 15.2, "clouds": 5}

// Traité (MyWeather)
{"description": "L'air est très sec, ciel dégagé"}
```

### 3. Contextualisation locale
```json
// Brut (API)
{"temp": 38, "region": "Centre"}

// Traité (MyWeather)
{
  "temperature": "38°C",
  "comparison": "3°C au-dessus des normales de saison",
  "alert": "Attention, chaleur inhabituelle pour la région"
}
```

### 4. Détection d'anomalies
```json
// Comparaison multi-sources
API Meteo France: 41°C
API OpenWeatherMap: 32°C  ←── ANOMALIE DÉTECTÉE

// Résultat après vérification
{
  "temperature": "41°C",
  "confidence": "moyenne",
  "warning": "Écart important entre sources (9°C)",
  "source_used": "Meteo France (station locale)"
}
```

---

## Pipeline Complet (Diagramme)

```
┌──────────────────────────────────────────────────────────────────────────┐
│                         PIPELINE DE DONNÉES                              │
└──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────┐
  │  APIs Météo  │
  │  - Meteo FR  │
  │  - OpenWM    │
  │  - Local     │
  └──────┬───────┘
         │ (données brutes JSON)
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 1: COLLECTE                                                   │
  │  - Récupération depuis chaque API                                    │
  │  - Validation format                                                 │
  │  - Horodatage                                                        │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 2: STOCKAGE BRUT                                              │
  │  - PostgreSQL: raw_weather_data (table d'archivage)                  │
  │  - InfluxDB: raw_measurements (série temporelle)                     │
  │  - Métadonnées: source, timestamp_collecte, statut_brut              │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 3: CONVERSION UNITÉS                                          │
  │  - Kelvin → Celsius                                                  │
  │  - m/s → km/h                                                        │
  │  - Pa → hPa                                                          │
  │  - Degrés → Direction cardinale                                      │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 4: VÉRIFICATION DE COHÉRENCE                                  │
  │  - Comparaison multi-sources                                         │
  │  - Détection valeurs aberrantes (outliers)                           │
  │  - Calcul score de confiance                                         │
  │  - Alerte si écart > seuil                                           │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 5: ENRICHISSEMENT                                             │
  │  - Comparaison avec normales de saison                               │
  │  - Calcul d'écarts (anomalies)                                       │
  │  - Ajout contexte historique                                         │
  │  - Détection seuils d'alerte                                         │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 6: SIMPLIFICATION LANGAGE                                     │
  │  - Phrases templates pré-définies                                    │
  │  - Remplacement valeurs → descriptions                               │
  │  - Adaptation niveau de lecture (primaire)                           │
  │  - Traduction vers langues locales (futur)                           │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 7: STOCKAGE TRAITÉ                                            │
  │  - PostgreSQL: processed_weather_data                                │
  │  - Format optimisé pour frontend                                     │
  │  - Cache Redis pour accès rapide                                     │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  ÉTAPE 8: RENDU UTILISATEUR                                          │
  │  - API GET /weather/current → JSON simplifié                         │
  │  - Frontend React affiche cartes/composants                          │
  │  - Notifications push/SMS si alerte                                  │
  └──────────────────────────────────────────────────────────────────────┘
         │
         ▼
  ┌──────────────┐
  │  Utilisateur │
  │  "Il fait    │
  │  très chaud  │
  │  aujourd'hui │
  │  à Ouaga"    │
  └──────────────┘
```

---

*Retour au [README principal](../README.md)*
