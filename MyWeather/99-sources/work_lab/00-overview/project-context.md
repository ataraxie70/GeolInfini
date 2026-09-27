# Contexte du Projet - MyWeather

## 🌍 Contexte Géographique et Climatique

### Le Burkina Faso face au changement climatique

Le Burkina Faso, pays sahélien d'Afrique de l'Ouest, est **particulièrement vulnérable** aux variations climatiques :

| Phénomène | Caractéristiques | Impact |
|-----------|------------------|--------|
| **Vagues de chaleur** | Températures > 40°C, fréquentes et prolongées | Santé publique, mortalité |
| **Sécheresses** | Pluviométrie < 10mm sur 30+ jours | Agriculture, élevage, eau potable |
| **Inondations** | Pluies > 50mm en 24h, soudaines | Dégâts matériels, déplacements |
| **Vagues de poussière** | AQI > 200 (Harmattan) | Respiratoire, visibilité |
| **Pluies irrégulières** | Anomalies de saisonnalité | Cycles culturaux perturbés |

### Données clés

- **Population** : ~22 millions d'habitants
- **Régions administratives** : 13 régions
- **Départements** : 301 départements
- **Climat** : Tropical sec (2 saisons : sèche et pluvieuse)
- **Températures moyennes** : 24°C à 45°C selon saison/région

---

## 🎯 Objectifs de la Plateforme

### Objectif Principal

> **Développer et déployer une plateforme d'alerte et d'information climatique pour protéger les populations du Burkina Faso contre les risques liés aux changements climatiques.**

### Objectifs Spécifiques

| # | Objectif | Description |
|---|----------|-------------|
| 1 | **Surveiller** | Collecter les données météo en temps réel de multiples sources |
| 2 | **Traiter** | Transformer les données techniques en informations compréhensibles |
| 3 | **Alerter** | Notifier les populations à risque via SMS, Email, Push |
| 4 | **Conseiller** | Fournir des recommandations adaptées à chaque situation |
| 5 | **Visualiser** | Cartes interactives et tableaux de bord accessibles |

---

## 👥 Utilisateurs Cibles

### Personas

#### 1. Citoyen Ordinaire (Utilisateur Final)
- **Profil** : Adulte, smartphone basique ou feature phone
- **Besoins** :
  - Savoir s'il y a un danger dans ma région
  - Comprendre rapidement (langage simple)
  - Recevoir des conseils pratiques
  - Être alerté avant le danger
- **Canaux** : SMS, Push notification, Web mobile

#### 2. Agriculteur
- **Profil** : Exploitant agricole, zone rurale
- **Besoins** :
  - Prévisions pluviométriques fiables
  - Conseils pour les semis/récoltes
  - Alertes sécheresse/inondation
- **Canaux** : SMS (langue locale si possible), Radio (future intégration)

#### 3. Éleveur
- **Profil** : Éleveur de bétail, souvent nomade
- **Besoins** :
  - Points d'eau disponibles
  - Pâturages praticables
  - Alertes chaleur extrême
- **Canaux** : SMS, Radio

#### 4. Opérateur Plateforme (Admin)
- **Profil** : Personnel météo, gestionnaire de crise
- **Besoins** :
  - Dashboard de supervision
  - Créer/valider les alertes
  - Gérer les utilisateurs
- **Canaux** : Web desktop

#### 5. Décideur Public
- **Profil** : Maire, gouverneur, ministère
- **Besoins** :
  - Vue d'ensemble des risques
  - Statistiques par région
  - Support à la décision
- **Canaux** : Web desktop, Email rapports

---

## 🔑 Principes de Conception

### 1. Accessibilité
- **Langage simple** : Pas de jargon technique météo
- **Multi-canal** : SMS pour zones sans internet, Web pour les autres
- **Responsive** : Mobile-first (80% du trafic)
- **Low-bandwidth** : Pages légères (< 500KB)

### 2. Compréhension Universelle
```
❌ Technique: "Température maximale de 41.3°C, humidité relative 23%"
✅ Simplifié: "Très chaud aujourd'hui (41°C). L'air est très sec."

❌ Technique: "Précipitations cumulées 62mm/24h"
✅ Simplifié: "Forte pluie tombée en 1 jour (62mm). Risque d'inondation."
```

### 3. Fierté Locale
- **Données contextualisées** : Comparaisons avec normales locales
- **Langues** : Français + langues locales (futur)
- **Exemples concrets** : Références à la vie quotidienne

### 4. Fiabilité
- **Multi-sources** : Croisement des données
- **Vérification de cohérence** : Détection d'anomalies
- **Confirmation humaine** : Workflow de validation des alertes

---

## 📐 Périmètre du Projet

### Inclus (In-Scope)

| Fonctionnalité | Priorité | Description |
|----------------|----------|-------------|
| Authentification | Haute | Login, register, gestion de compte |
| Dashboard météo | Haute | Température, humidité, vent, AQI |
| Alertes multi-canaux | Haute | SMS, Email, Push |
| Cartes interactives | Haute | Zones à risque, régions |
| Conseils contextualisés | Haute | Santé, agriculture, élevage, eau |
| Prévisions 7 jours | Moyenne | Statistiques simples |
| Historique météo | Moyenne | Consultable par région |
| Abonnements | Moyenne | Choisir ses régions/types d'alertes |
| Admin dashboard | Moyenne | Gestion utilisateurs, alertes |

### Non Inclus (Out-of-Scope) - Phase 1

| Fonctionnalité | Raison |
|----------------|--------|
| Prévisions ML avancées | Trop complexe pour MVP |
| Langues locales | À venir en phase 2 |
| API publique | Après stabilisation |
| Application mobile native | PWA suffit pour MVP |
| Intégration réseaux sociaux | Hors scope initial |

---

## 📊 Indicateurs de Succès

| Indicateur | Cible | Mesure |
|------------|-------|--------|
| Utilisateurs actifs | 10,000+ après 6 mois | Analytics |
| Temps de chargement | < 2s | Lighthouse |
| Taux d'ouverture SMS | > 80% | Provider SMS |
| Couverture régions | 13/13 régions | Dashboard |
| Disponibilité API | > 99% | Uptime monitoring |
| Satisfaction utilisateur | > 4/5 | Enquêtes |

---

## 🔗 Liens vers autres documents

- [Architecture globale](../01-architecture/global-architecture.md)
- [Data Pipeline](../02-data-flow/data-pipeline.md) (CŒUR DE LA PLATEFORME)
- [Glossaire](./glossary.md)

---

*Document créé le : 2026-04-21*  
*Version : 1.0*  
*Statut : En attente de validation*
