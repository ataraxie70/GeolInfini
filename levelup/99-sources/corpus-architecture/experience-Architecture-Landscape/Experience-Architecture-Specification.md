# Experience Architecture & UX Contracts Specification

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Experience Layer  
**Code :** LEVELUP-EXP-UXCONTRACT-001  

---

# 1. Principes de Conception d'Expérience (Experience Principles)

Fidèle aux documents de fondation de LevelUP, l'interface utilisateur (UI) et l'expérience utilisateur (UX) ne sont pas uniquement esthétiques : elles constituent l'expression rigoureuse et matérielle des axiomes de progression.

```text
 ┌────────────────────────────────────────────────────────────────────────┐
 │                         BUSINESS PHILOSOPHY                            │
 │                "Foundation First", "Faire n'est pas comprendre"         │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼
 ┌────────────────────────────────────────────────────────────────────────┐
 │                          UX/UI CONTRACTS                               │
 │             Navigation verrouillée, Composants fondés sur la preuve    │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼
 ┌────────────────────────────────────────────────────────────────────────┐
 │                          CLIENT IMPLEMENTATION                         │
 │                   Flutter views, HTML components, React code           │
 └────────────────────────────────────────────────────────────────────────┘
```

## 1.1 Foundation First (Les fondations d'abord)
L'UI doit contraindre l'apprenant à maîtriser les bases avant d'accéder au niveau suivant. Les concepts avancés d'un graphe de compétences doivent être visuellement verrouillés (locked) tant que leurs prérequis ne sont pas validés par des preuves physiques.

## 1.2 Progression par la Preuve (Evidence-driven UI)
Aucun pourcentage de progression ne peut être affiché "à plat" sans être directement associé à un dossier de preuves observables. Cliquer sur un niveau ou une compétence affiche instantanément la liste des `Evidences` associées.

## 1.3 Discipline vs Motivation Éphémère (Discipline over Cheap Dopamine)
L'interface évite les animations intrusives, les bannières clignotantes et les gratifications faciles (popups d'XP artificiels). Elle valorise l'assiduité calme (routines régulières, score de discipline stable, streaks de jours d'apprentissage).

## 1.4 Explicabilité par le Design (Explainability by Design)
Toute suggestion d'activité ou de parcours générée par l'IA ou le moteur de planification doit exposer clairement sa justification sémantique (ex: *"Recommandé car vous travaillez sur la compétence K et avez complété l'activité prérequise A"*).

---

# 2. Contrats de Navigation (Navigation Contracts)

Le système de navigation client (routage) est assujetti à l'état de maîtrise calculé dans le `Progress Context`.

```text
                    [ Requête de navigation vers CompetencyDetail ]
                                          │
                                          ▼
                         [ Contrat de validation de prérequis ]
                                          │
                  ┌───────────────────────┴───────────────────────┐
                  ▼ (Prérequis validés)                           ▼ (Prérequis manquants)
         [ Routage autorisé ]                            [ Routage refusé ]
    (Affichage de CompetencyDetail)            (Affichage d'un écran explicatif de verrou)
```

## 2.1 Verrouillage Hiérarchique de Navigation
*   **Règle :** L'accès aux écrans de détails ou de labs d'une compétence $C_2$ dépendante d'une compétence $C_1$ est bloqué tant que l'évaluation $Assessment(C_1)$ n'est pas validée avec un niveau de confiance de preuve minimal.
*   **Comportement UI :** Le bouton d'accès déclenche un état de blocage affichant l'arbre de prérequis et les preuves manquantes pour $C_1$, plutôt qu'une erreur 403 générique.

## 2.2 Navigation sous Contrat de Session d'Évaluation
*   **Règle :** Lorsqu'une `AssessmentSession` pratique à temps limité est active, la navigation de l'apprenant au sein de l'application est restreinte.
*   **Comportement UI :** Masquage des menus de navigation globale. L'utilisateur est confiné dans l'environnement d'évaluation jusqu'à la soumission de la preuve ou l'expiration du délai.

---

# 3. Contrats de Composants UI (Component Contracts)

Les composants graphiques doivent intégrer structurellement des contraintes de données.

## 3.1 Composant : Carte de Compétence (Competency Card)
Ce composant affiche le statut d'une compétence dans les tableaux de bord.

```text
┌────────────────────────────────────────────────────────┐
│  [Icône Domaine]  Nom de la compétence                 │
│  Niveau de Maîtrise : Intermédiaire                    │
│  [██████████░░░░░░░░░░] 50% (Estimation)               │
├────────────────────────────────────────────────────────┤
│  Preuves Validées :                                    │
│  - [Badge: Élevé] Github Commit #4122 (Signature Dev)  │
│  - [Badge: Max] Rapport d'Évaluation (Signature Coach) │
├────────────────────────────────────────────────────────┤
│  Objectif Actif : Compléter le Lab d'écriture Bash     │
└────────────────────────────────────────────────────────┘
```

*   **Champs obligatoires à afficher :**
    1.  `CompetencyId` (URN) et nom descriptif.
    2.  `MasteryEstimation` sous forme de barre de progression.
    3.  Liste des `Evidences` actives avec badge de `ConfidenceLevel`.
    4.  Indicateur d'objectif de routine actif.
*   **Interdictions :**
    *   Interdiction d'afficher un niveau "Validé" si la liste des preuves est vide.
    *   Interdiction d'utiliser des couleurs de gratification positives (ex: vert vif) si le niveau de confiance global des preuves est "Faible".

## 3.2 Composant : Écran d'Évaluation (Assessment Screen)
Ce composant est l'interface d'examen pratique de l'apprenant.
*   **Champs obligatoires à afficher :**
    1.  `AssessmentGoal` (compétence ciblée).
    2.  `Instructions` claires d'exécution.
    3.  `TimeLimit` (compte à rebours dynamique s'il est configuré).
    4.  `ReviewCriteria` (critères d'évaluation binationaux : validé/non-validé).
    5.  Zone de dépôt de la preuve (`EvidenceSubmissionArea`).
    6.  Feedback historique textuel de l'évaluateur (Humain ou IA).

## 3.3 Composant : Widget de Routine Quotidienne (Daily Routine Widget)
Ce widget résume l'assiduité et la discipline de l'apprenant.
*   **Champs obligatoires à afficher :**
    1.  `DailyStreak` actif (ex: *12 jours consécutifs*).
    2.  `DisciplineScore` (pourcentage glissant de réussite des plannings).
    3.  L'activité suivante planifiée pour la journée avec son heure cible.
    4.  Un calendrier de régularité glissant sur 30 jours (grille d'assiduité style GitHub commits).

---

# 4. Accessibilité & Directives de Design Visuel (Design System)

Pour véhiculer la rigueur et le professionnalisme de LevelUP :

*   **Palette de Couleurs (Dark Mode Sleek) :**
    *   Fond : Anthracite profond ou bleu ardoise (HSL `220, 15%, 10%`).
    *   Surfaces de cartes : Gris foncé texturé avec bordures fines en verre (glassmorphism discret).
    *   Accents de progression : Bleu électrique HSL (`200, 100%, 50%`) pour la progression en cours, or HSL (`45, 100%, 50%`) pour les jalons certifiés. Éviter les dégradés flashy multicolores.
*   **Typographie :**
    *   Titre : Police de caractère géométrique ou technique (ex: *Outfit* ou *JetBrains Mono* pour les identifiants techniques).
    *   Corps de texte : Sans-serif lisible et optimisé pour la lecture prolongée (ex: *Inter*).
*   **Accessibilité (A11y) :**
    *   Contraste minimal de `4.5:1` pour le texte classique et `3:1` pour les composants visuels (respect des normes WCAG AA).
    *   Support du focus clavier pour toutes les interactions de laboratoires d'écriture.
