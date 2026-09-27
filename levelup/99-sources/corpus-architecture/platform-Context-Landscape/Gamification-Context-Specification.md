# Gamification Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-GAMIFICATION-001

---

# 1. Objet

Le **Gamification Context** est le Bounded Context de la couche Platform Services responsable de la traduction des accomplissements réels et de la régularité de l'apprenant en indicateurs de motivation visuels (niveaux, points d'expérience, séries de jours consécutifs, badges cosmétiques).

Il conçoit et applique des mécaniques de gratification afin d'encourager la régularité (Discipline) tout en maintenant une séparation hermétique entre l'esthétique du jeu et la validation objective des compétences.

---

# 2. Mission

Fournit un moteur de gratification vertueux et non infantilisant destiné à stimuler la discipline et à célébrer les efforts continus de l'apprenant, sans jamais masquer ou exagérer son niveau réel de maîtrise.

---

# 3. Position dans l'écosystème

Le Gamification Context appartient à la **Platform Services Layer**.

Il consomme les événements d'intégration du **Activity Context** (achèvement d'activités pour la discipline) et du **Assessment Context** / **Progress Context** (acquisitions réelles pour l'expérience de maîtrise) afin de mettre à jour le profil de l'utilisateur.

---

# 4. Vision métier

La gamification classique (PBL : Points, Badges, Leaderboards) peut dénaturer l'apprentissage en focalisant l'utilisateur sur la récompense plutôt que sur la compétence. LevelUP applique des principes de gamification rigoureux :
1.  **"Compétence avant Récompense" (A9, A10) :** Les points d'expérience (XP) ne sont pas accordés pour de simples clics ou du temps d'attente. Ils découlent de l'apprentissage réel.
2.  **Séparation de l'XP de Discipline et de Maîtrise :**
    *   *XP de Discipline (Régularité) :* Récompense la constance dans l'effort quotidien (compléter ses routines planifiées).
    *   *XP de Maîtrise (Compétence) :* Récompense les validations objectives de connaissances ou compétences.
3.  **Récompenses purement cosmétiques :** Les badges ou titres débloqués sont esthétiques et expressifs. Ils ne constituent pas des preuves de compétences (les preuves restent exclusives au Portfolio).

---

# 5. Responsabilités

Le Gamification Context est responsable de :

*   gérer le profil gamifié de l'apprenant (`Learner Gamified Profile`) ;
*   créditer et suivre les points d'expérience de deux catégories (`Mastery XP` et `Discipline XP`) ;
*   calculer et maintenir les séries quotidiennes de régularité (`Daily Streaks`) ;
*   calculer le score de discipline globale (`Discipline Score`) ;
*   gérer l'attribution des récompenses cosmétiques (`Cosmetic Rewards`) lors du franchissement de caps de régularité.

Il n'est jamais responsable :
*   de mesurer le niveau de progression pédagogique (responsabilité du `Progress Context`) ;
*   de valider une compétence ou de délivrer un certificat officiel (responsabilité du `Assessment` ou `Certification Context`).

---

# 6. Ubiquitous Language

## Learner Gamified Profile
Profil regroupant les indicateurs d'engagement, d'expérience et les récompenses cosmétiques obtenues par un utilisateur.

## Experience Points (XP)
Unité de mesure de l'engagement. Divisée en :
*   **Mastery XP :** Liée à la validation d'une notion ou d'une compétence.
*   **Discipline XP :** Liée au respect des plannings et routines.

## Daily Streak
Indicateur comptabilisant le nombre de jours consécutifs durant lesquels l'apprenant a complété au moins une activité planifiée dans son agenda.

## Discipline Score
Pourcentage glissant de régularité mesurant le respect des créneaux de travail planifiés par rapport aux créneaux effectivement honorés.

## Cosmetic Reward
Badge visuel, titre honorifique ou élément de personnalisation d'interface débloqué à l'issue de caps de persévérance.

---

# 7. Modèle métier

```text
Activity Context (Activités complétées) ──────► émet ──┐
Assessment Context (Preuves validées) ────────► émet ──┼──┐
                                                        ▼  ▼
                                            [ Gamification Engine ]
                                                       │
                                            ├── calcule ──► Daily Streak
                                            ├── calcule ──► Discipline Score
                                            ├── alloue ───► XP (Mastery & Discipline)
                                                       │
                                                       ▼
                                          [ Learner Gamified Profile ]
                                                       │
                                                       ▼
                                            [ Cosmetic Rewards ]
```

---

# 8. Principes métier

## Principe 1 — Pas d'acquis fictifs
Aucun gain de `Mastery XP` ne peut avoir lieu sans la production d'une preuve d'apprentissage valide (`Evidence`) émanant de l'exécution ou de l'évaluation.

## Principe 2 — Valorisation de la régularité
Le système accorde des bonus de `Discipline XP` lors des séries ininterrompues (Streaks) pour encourager l'installation d'habitudes d'apprentissage durables.

## Principe 3 — Remise à zéro saine
La rupture d'une série quotidienne (Streak) ramène le compteur à zéro de manière factuelle. Cependant, le système permet de geler la série en cas d'interruption planifiée et validée (vacances, maladie) saisie dans le planning.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **LearnerGamifiedProfile :** Racine d'agrégat modélisant l'état gamifié de l'utilisateur, ses scores d'XP accumulés, sa série courante et sa collection de récompenses débloquées.

## 9.2 Entités
*   **DailyStreak :** Suivi de la série de jours consécutifs d'étude.
*   **CosmeticReward :** Représentation d'une récompense cosmétique débloquée.

## 9.3 Value Objects
*   **ProfileId / RewardId :** Identifiants uniques.
*   **PointsCategory :** Catégorisation de l'XP (`Mastery`, `Discipline`).
*   **DisciplineHistory :** Historique glissant des réalisations pour calcul du score de discipline.

## 9.4 Domain Services
*   **StreakCalculator :** Service analysant les horodatages d'activités terminées pour mettre à jour la série quotidienne.
*   **LevelCalculator :** Algorithme déterminant le niveau global à partir des points d'XP cumulés.

## 9.5 Domain Events
*   **XpAwarded :** Des points d'expérience ont été alloués à l'apprenant.
*   **LevelUpOccurred :** L'apprenant a franchi un palier de niveau d'expérience.
*   **StreakIncremented :** La série de régularité s'est poursuivie d'un jour.
*   **StreakReset :** La série a été interrompue et réinitialisée.
*   **RewardUnlocked :** Une récompense cosmétique a été obtenue.

---

# 10. Invariants

1.  Le compteur de `DailyStreak` ne peut être incrémenté qu'une seule fois par jour calendaire, au moment de l'achèvement de la première activité éligible de la journée.
2.  Les récompenses cosmétiques débloquées ne peuvent plus être retirées du profil de l'utilisateur, même en cas de remise à zéro de la série quotidienne.
3.  Le niveau de l'utilisateur est une fonction mathématique stricte de la somme de ses `Mastery XP` et `Discipline XP`.

---

# 11. Relations avec les autres Bounded Contexts

*   **Activity Context :** Fournit les validations d'exécution quotidiennes (déclencheur pour les `Discipline XP` et `Daily Streaks`).
*   **Assessment Context :** Fournit les résultats d'évaluations et les validations de compétences (déclencheur pour les `Mastery XP`).
*   **Progress Context :** Fournit les estimations d'évolution de maîtrise (déclencheur alternatif pour l'XP de connaissances).

---

# 12. Décisions architecturales

Le Gamification Context est conçu pour être un récepteur asynchrone d'événements. Il écoute l'activité globale de l'écosystème pour mettre à jour son modèle de profil, sans jamais bloquer l'exécution des flux métier principaux (couplage faible). 

Il ne gère aucune logique de persistance partagée avec les autres contextes : son modèle de données de profil lui est entièrement propre.
