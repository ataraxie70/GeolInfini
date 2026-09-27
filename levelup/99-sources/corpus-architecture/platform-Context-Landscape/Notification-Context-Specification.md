# Notification Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-NOTIFICATION-001

---

# 1. Objet

Le **Notification Context** est le Bounded Context de la couche Platform Services responsable de la création, de la personnalisation, du routage et de la distribution de l'ensemble des alertes, rappels, messages et rapports expédiés aux utilisateurs de LevelUP.

Il gère les différents canaux de diffusion (In-App, Push, Email, SMS) tout en garantissant le respect absolu des préférences et du consentement de chaque apprenant.

---

# 2. Mission

Fournir un système de messagerie centralisé et intelligent capable d'alerter les apprenants au moment opportun pour soutenir leur régularité (Discipline) et de les informer des événements majeurs de leur parcours d'apprentissage (évaluations, révisions, rapports d'activité).

---

# 3. Position dans l'écosystème

Le Notification Context appartient à la **Platform Services Layer**.

Il observe les événements d'intégration publiés par d'autres contextes (ex: `BookingScheduled` du `Scheduling Context`, `ActivityPostponed` du `Activity Context`, `RegressionDetected` du `Progress Context`) afin de déclencher l'envoi de rappels ou d'alertes adaptés.

---

# 4. Vision métier

Les notifications sont un outil puissant pour cultiver la discipline, mais elles peuvent facilement devenir une source de distraction ou de fatigue cognitive si elles sont mal dosées. Fidèle à la philosophie de LevelUP, le système de notification doit être :
1.  **Pertinent :** Les rappels doivent correspondre à des temps d'apprentissage réels bloqués.
2.  **Respectueux :** L'apprenant doit garder le contrôle total sur le bruit numérique émis par la plateforme (pas de spam).
3.  **Utile :** Chaque alerte doit encourager une action concrète (ex: démarrer une session, réviser une notion en risque).

---

# 5. Responsabilités

Le Notification Context est responsable de :

*   gérer les préférences de notification et les consentements des apprenants (`Learner Preferences`) ;
*   gérer les gabarits de messages dynamiques (`Notification Templates`) ;
*   assembler et rendre les messages personnalisés (Moteur de Rendu) ;
*   router les messages vers les bons canaux (`Delivery Channels`) en fonction du degré d'urgence et des choix de l'utilisateur ;
*   assurer la livraison des messages et gérer les tentatives d'envoi (`Delivery Attempts`) ;
*   limiter la fréquence d'envoi (`Rate Limiting`) pour protéger l'utilisateur.

Il n'est jamais responsable :
*   de décider de la planification des séances (responsabilité du `Scheduling Context`) ;
*   d'analyser le comportement ou les données d'apprentissage (responsabilité du `Analytics` ou `Progress Context`).

---

# 6. Ubiquitous Language

## Notification
Représentation d'un message individuel destiné à un utilisateur, contenant un contenu textuel ou riche, un statut et des métadonnées de livraison.

## Notification Template
Modèle de message réutilisable contenant des variables dynamiques (ex: `{learner_name}`, `{session_time}`).

## Delivery Channel
Canal technique de diffusion supporté par la plateforme :
*   *In-App Feed* (fil de notifications interne à l'application).
*   *Push Notification* (notification mobile ou web native).
*   *Email* (courriels de résumé et de suivi).
*   *SMS* (alertes d'urgence ou rappels critiques de routine).

## Learner Preferences
Configuration personnalisée définissant pour chaque type d'alerte quels canaux sont autorisés et à quelles heures les envois sont proscrits.

## Rate Limiting Rule
Règle de limitation de débit évitant de saturer les canaux de l'apprenant.

---

# 7. Modèle métier

```text
Business Event (ex: RegressionDetected) ➔ Observe
                                              │
                                              ▼
                                    [ Notification Engine ]
                                              │
                                    ├── consulte ──► Learner Preferences
                                    ├── applique ──► Rate Limiting Rules
                                    ├── applique ──► Moteur de Rendu (Templates)
                                              │
                                              ▼
                                      [ Notification ]
                                              │
                     ┌────────────────────────┼────────────────────────┐
                     ▼                        ▼                        ▼
                Channel: Push           Channel: Email          Channel: In-App
```

---

# 8. Principes métier

## Principe 1 — Priorité au consentement
Aucune notification n'est envoyée via un canal externe (Email, SMS, Push) sans l'accord explicite de l'apprenant.

## Principe 2 — Sanctuarisation du repos
Sauf alerte de sécurité critique, le système s'interdit d'envoyer des notifications intrusives (SMS, Push) pendant les heures de repos déclarées par l'apprenant.

## Principe 3 — Valeur ajoutée par message
Chaque notification doit comporter un lien direct ou une suggestion d'action immédiate (ex: *"Votre session Linux commence dans 10 min. Ouvrir mon terminal."*).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **Notification :** Racine d'agrégat représentant l'entité de message et l'historique de ses tentatives d'envoi.
*   **LearnerPreferences :** Racine d'agrégat définissant les règles et les consentements de routage d'un utilisateur.

## 9.2 Entités
*   **NotificationTemplate :** Contrat de gabarit de message stocké en base de données.
*   **DeliveryAttempt :** Enregistrement d'un essai d'envoi avec le code retour du fournisseur externe.

## 9.3 Value Objects
*   **NotificationId / PreferenceId :** Identifiants uniques normalisés.
*   **ChannelType :** Type de canal de livraison.
*   **QuietHours :** Plage horaire récurrente d'inhibition des alertes.

## 9.4 Domain Services
*   **TemplateRenderer :** Moteur remplaçant les placeholders d'un modèle par les données réelles de l'événement.
*   **ChannelRouter :** Algorithme déterminant le meilleur canal pour une alerte donnée selon l'urgence et les préférences.
*   **NotificationRateLimiter :** Service contrôlant les règles anti-spam.

## 9.5 Domain Events
*   **NotificationCreated :** Une nouvelle alerte a été enregistrée.
*   **NotificationSent :** Le message a été transmis avec succès au canal.
*   **NotificationDeliveryFailed :** Échec d'envoi après épuisement des tentatives.
*   **PreferencesUpdated :** Modification de la configuration par l'utilisateur.

---

# 10. Invariants

1.  Une notification ne peut pas être routée vers un canal explicitement désactivé par l'apprenant pour cette catégorie de message.
2.  Toute tentative d'envoi doit être horodatée et enregistrée de manière immuable (`DeliveryAttempt`).
3.  Le débit d'envoi vers un apprenant ne peut dépasser les limites définies par les `Rate Limiting Rules` de la plateforme.

---

# 11. Relations avec les autres Bounded Contexts

*   **Scheduling Context :** Émet les événements de planification pour déclencher les rappels de sessions.
*   **Progress & Activity Contexts :** Génèrent les faits d'apprentissage nécessitant des notifications (rappels de discipline, régressions détectées).
*   **Identity Context :** Fournit les coordonnées de base de l'apprenant (email, numéro de téléphone) de manière sécurisée.

---

# 12. Décisions architecturales

Le Notification Context fait office de passerelle vers les fournisseurs externes de communication (ex: SMTP pour l'email, Firebase pour le push, Twilio pour le SMS). 

Toute intégration technique s'effectue via un **Anti-Corruption Layer (ACL)** pour masquer les spécificités des services tiers et garantir l'indépendance de notre domaine.
