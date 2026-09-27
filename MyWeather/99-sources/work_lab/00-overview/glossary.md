# Glossaire - MyWeather

## Termes Techniques

| Terme | Définition |
|-------|------------|
| **API** | Interface de programmation permettant de récupérer les données météo auprès des fournisseurs (Meteo France, OpenWeatherMap) |
| **AQI** | Air Quality Index - Indice de qualité de l'air (0-500). Au-delà de 200 : air malsain |
| **Celery** | Système de file d'attente de tâches pour exécuter les travaux en arrière-plan (ex: fetch météo toutes les 15 min) |
| **Docker** | Technologie de conteneurisation pour empaqueter et déployer l'application |
| **FastAPI** | Framework Python moderne pour créer des API web rapides |
| **InfluxDB** | Base de données spécialisée pour les séries temporelles (données météo historiques) |
| **JWT** | Jeton d'authentification sécurisé pour les utilisateurs connectés |
| **PostGIS** | Extension de PostgreSQL pour gérer les données géographiques (régions, départements) |
| **PostgreSQL** | Base de données principale pour stocker les utilisateurs, alertes, configurations |
| **PWA** | Progressive Web App - Application web qui fonctionne comme une app mobile |
| **RabbitMQ** | Système de messagerie pour la communication entre les services (file d'attente) |
| **React** | Bibliothèque JavaScript pour créer l'interface utilisateur |
| **Redis** | Base de données en mémoire pour le cache et les sessions rapides |
| **TailwindCSS** | Framework CSS utilitaire pour le design de l'interface |

---

## Termes Métier

| Terme | Définition |
|-------|------------|
| **Alerte** | Notification officielle émise lorsqu'un seuil de danger est dépassé |
| **Bulletin** | Résumé périodique des conditions météo (quotidien, hebdo) |
| **Conseil** | Recommandation pratique liée à un type de risque (santé, agriculture, etc.) |
| **Département** | Subdivision administrative d'une région (301 au Burkina Faso) |
| **Donnée brute** | Information météo telle que reçue de l'API (technique, non traitée) |
| **Donnée traitée** | Information transformée en langage simple pour l'utilisateur |
| **Hazard (Aléa)** | Phénomène météo dangereux (chaleur, pluie, sécheresse, poussière) |
| **Normale climatique** | Moyenne des valeurs météo sur 30 ans (référence de comparaison) |
| **Région** | Division administrative principale (13 au Burkina Faso) |
| **Seuil d'alerte** | Valeur critique qui déclenche une alerte (ex: >40°C pendant 3 jours) |
| **Station météo** | Point de mesure physique (ou virtuelle via API) |
| **Vulnérabilité** | Degré de risque d'une zone face aux aléas climatiques |

---

## Types d'Alertes

| Code | Nom | Description | Seuil typique |
|------|-----|-------------|---------------|
| `HEAT_WAVE` | Vague de chaleur | Températures anormalement élevées | >40°C pendant 3 jours |
| `DROUGHT` | Sécheresse | Absence prolongée de pluie | <10mm sur 30 jours |
| `FLOOD` | Inondation | Pluies intenses soudaines | >50mm en 24h |
| `DUST_STORM` | Vague de poussière | Tempête de sable/poussière | AQI >200 |
| `IRREGULAR_RAIN` | Pluies irrégulières | Anomalie de saisonnalité | Écart >30% vs normale |

---

## Niveaux de Sévérité

| Niveau | Couleur | Description | Action recommandée |
|--------|---------|-------------|-------------------|
| **LOW** | 🟢 Vert | Risque faible | Veille normale |
| **MODERATE** | 🟡 Jaune | Risque modéré | Surveiller l'évolution |
| **SEVERE** | 🟠 Orange | Risque élevé | Précautions actives |
| **EXTREME** | 🔴 Rouge | Danger imminent | Actions urgentes |

---

## Canaux de Notification

| Canal | Description | Usage |
|-------|-------------|-------|
| **SMS** | Message texte court (160 caractères) | Zones sans internet, urgences |
| **Email** | Message électronique détaillé | Informations complètes, rapports |
| **Push** | Notification push sur l'app/web | Utilisateurs connectés |

---

## Unités de Mesure

| Grandeur | Unité | Symbole | Exemple |
|----------|-------|---------|---------|
| Température | Degrés Celsius | °C | 35°C |
| Humidité | Pourcentage | % | 65% |
| Vitesse du vent | Kilomètres par heure | km/h | 25 km/h |
| Précipitations | Millimètres | mm | 15 mm |
| Pression atmosphérique | Hectopascals | hPa | 1013 hPa |
| Qualité de l'air | Indice AQI | - | 85 (moyen) |

---

## Acronymes

| Acronyme | Signification |
|----------|---------------|
| ADR | Architecture Decision Record |
| AQI | Air Quality Index |
| CORS | Cross-Origin Resource Sharing |
| CRUD | Create, Read, Update, Delete |
| E2E | End-to-End (tests) |
| JWT | JSON Web Token |
| MVP | Minimum Viable Product |
| ORM | Object-Relational Mapping |
| PWA | Progressive Web App |
| SQL | Structured Query Language |
| TLS | Transport Layer Security |
| UX | User Experience |
| WCAG | Web Content Accessibility Guidelines |

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : Validé*
