# Scheduling Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-SCHEDULING-001

---

# 1. Objet

Le **Scheduling Context** est le Bounded Context de la couche Platform Services responsable de la gestion du temps, de l'allocation des créneaux horaires, de la planification des sessions d'apprentissage et de la synchronisation avec des calendriers externes.

Il permet d'ancrer les activités théoriques et les routines quotidiennes de l'apprenant dans le monde réel en planifiant des plages temporelles concrètes et optimisées.

---

# 2. Mission

Fournir un service d'ordonnancement temporel intelligent et de synchronisation d'agendas permettant à chaque apprenant de réserver des temps d'apprentissage réguliers, de gérer ses disponibilités et de synchroniser ses sessions de travail avec ses outils de calendrier personnels.

---

# 3. Position dans l'écosystème

Le Scheduling Context appartient à la **Platform Services Layer**.

Il sert de support temporel au **Activity Context** (qui lui demande de réserver des créneaux pour des sessions de travail) et s'appuie sur le rythme d'apprentissage défini par le **Program Context**.

---

# 4. Vision métier

La discipline requiert du temps dédié. Une routine ou une activité d'apprentissage n'a aucune chance d'être exécutée si elle n'est pas explicitement planifiée dans l'emploi du temps réel de l'apprenant. 

Le Scheduling Context transforme l'intention d'apprendre en engagement temporel concret. Il aide l'utilisateur à sanctuariser du temps pour ses fondations et ses révisions, tout en s'adaptant de manière flexible à ses contraintes personnelles de calendrier.

---

# 5. Responsabilités

Le Scheduling Context est responsable de :

*   gérer les grilles de disponibilité hebdomadaire des apprenants (`Availability Grids`) ;
*   allouer et réserver des créneaux temporels (`TimeSlots`) pour les sessions d'apprentissage ;
*   gérer la récurrence des routines de travail ;
*   détecter les conflits d'emploi du temps ou les risques de surcharge cognitive ;
*   synchroniser les calendriers LevelUP avec des solutions d'agendas externes (ex: Google Calendar, Outlook, etc.).

Il n'est jamais responsable :
*   de définir les activités à réaliser (responsabilité du `Activity Context`) ;
*   d'enregistrer les réalisations réelles (responsabilité du `Activity Context`) ;
*   de mesurer la discipline ou la progression de l'apprenant.

---

# 6. Ubiquitous Language

## Learner Calendar
Calendrier unifié de l'apprenant regroupant ses créneaux de travail, ses grilles de disponibilité et ses réservations d'activités.

## Availability Grid
Grille temporelle récurrente définissant les plages horaires durant lesquelles l'apprenant s'engage à être disponible pour étudier (ex: tous les lundis de 18h à 20h).

## TimeSlot
Plage temporelle réservée (définie par une date, une heure de début et une heure de fin) dédiée à une session de travail.

## WorkSession Booking
Réservation d'un `TimeSlot` spécifique pour l'exécution d'une ou plusieurs activités du programme d'apprentissage.

## Recurrence Rule
Règle logique formalisant la répétition d'une routine dans le calendrier (ex: quotidiennement, tous les deux jours, hebdomadaire).

## Calendar Connection
Liaison technique et d'autorisation vers un fournisseur de calendrier externe.

---

# 7. Modèle métier

```text
Activity Context ──► demande une réservation ──┐
                                                ▼
                                        Learner Calendar
                                                │
                                                ├── Availability Grid
                                                ├── TimeSlots
                                                ├── WorkSession Bookings
                                                └── Calendar Connection
                                                        │
                                                        ▼
                                                External Calendar (Sync)
```

---

# 8. Principes métier

## Principe 1 — Sanctuarisation du temps
Le système incite l'apprenant à bloquer des plages horaires stables pour installer des routines d'apprentissage régulières, gages de discipline.

## Principe 2 — Souplesse face aux imprévus
Les créneaux manqués ou reportés dans le `Activity Context` doivent être automatiquement ou manuellement réalloués dans les plages libres de la grille de disponibilité.

## Principe 3 — Zéro conflit d'agenda
Un apprenant ne peut pas avoir deux réservations de sessions d'apprentissage simultanées sur le même calendrier.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **LearnerCalendar :** Racine d'agrégat représentant l'agenda global d'apprentissage d'un utilisateur. Il encapsule la cohérence de l'emploi du temps et les règles d'allocation.

## 9.2 Entités
*   **WorkSessionBooking :** Représente l'association d'un créneau horaire bloqué avec une intention de travail (liaison vers une `Activity`).
*   **AvailabilityGrid :** Grille hebdomadaire structurant les plages de travail autorisées.
*   **CalendarConnection :** Identifie et gère l'état de synchronisation avec un calendrier tiers.

## 9.3 Value Objects
*   **DateTimeRange :** Intervalle temporel immuable (début, fin, fuseau horaire).
*   **RecurrencePattern :** Spécification de la répétition d'un événement.
*   **BookingStatus :** États de la réservation (`Pending`, `Confirmed`, `Rescheduled`, `Cancelled`).

## 9.4 Domain Services
*   **TimeSlotAllocator :** Algorithme calculant les meilleurs créneaux libres pour placer les activités à venir en fonction de la charge souhaitée.
*   **ConflictDetector :** Service analysant les chevauchements de réservations.

## 9.5 Domain Events
*   **BookingScheduled :** Une session d'apprentissage a été planifiée sur un créneau.
*   **BookingRescheduled :** Une session a été déplacée.
*   **CalendarSynced :** Une synchronisation avec l'agenda externe a été effectuée.
*   **TimeConflictDetected :** Deux événements se chevauchent.

---

# 10. Invariants

1.  Deux réservations (`WorkSessionBooking`) pour un même apprenant ne peuvent pas se chevaucher dans le temps.
2.  Une réservation confirmée doit toujours correspondre à une plage temporelle valide située dans le futur au moment de sa création.
3.  La grille de disponibilité doit être configurée avec des fuseaux horaires explicites et valides.

---

# 11. Relations avec les autres Contexts

*   **Activity Context :** Fournit les demandes de planification des activités et reçoit les confirmations d'allocation de créneaux.
*   **Program Context :** Fournit les charges de travail cibles (ex: volume d'heures hebdomadaire) nécessaires pour calibrer l'allocation temporelle.
*   **Notification Context :** Déclenche les alertes et les rappels avant le début d'une session de travail réservée.

---

# 12. Décisions architecturales

Le Scheduling Context constitue le pivot de l'intégration avec le quotidien réel des apprenants. 

La synchronisation bidirectionnelle externe (ex: modification d'un événement sur Google Calendar qui répercute le report de l'activité associée dans LevelUP) est supportée par le biais d'un **Anti-Corruption Layer (ACL)** dédié aux API de calendrier tierces.
