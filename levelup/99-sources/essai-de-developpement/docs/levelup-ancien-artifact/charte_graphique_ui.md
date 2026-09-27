# LevelUP — Charte Graphique & Spécifications UI/UX

Ce document définit l'identité visuelle de **LevelUP**, son Design System et les spécifications d'interface pour le Dashboard Apprenant et le Panel d'Administration.

---

## 1. Design System & Identité Visuelle

Pour refléter la philosophie de rigueur, de discipline et de technologie, LevelUP adopte un style **Dark Mode futuriste (Obsidian & Neon)** avec des contrastes élevés, des bordures lumineuses et des indicateurs dynamiques.

### 1.1 Palette de Couleurs (Thème Sombre Principal)

| Rôle Visuel | Teinte (Hex) | Équivalent HSL | Utilisation |
| :--- | :--- | :--- | :--- |
| **Fond Principal** | `#0B0F19` | `hsl(222, 39%, 7%)` | Fond d'écran général (Obsidian profond) |
| **Fond Cartes/Sidebar** | `#121824` | `hsl(221, 33%, 11%)` | Conteneurs des cartes, barres latérales |
| **Bordures/Séparateurs** | `#1E293B` | `hsl(217, 33%, 17%)` | Délimitation fine des éléments |
| **Texte Primaire** | `#F8FAFC` | `hsl(210, 40%, 98%)` | Titres et informations majeures |
| **Texte Secondaire** | `#94A3B8` | `hsl(215, 25%, 68%)` | Descriptions, légendes et métadonnées |
| **Accent Énergie (Cyan)** | `#06B6D4` | `hsl(189, 94%, 43%)` | Actions primaires, sélection active, progression |
| **Validation (Émeraude)** | `#10B981` | `hsl(162, 76%, 41%)` | Sujets maîtrisés, séances faites, scores élevés |
| **Alerte/Pénalité (Orange)** | `#F97316` | `hsl(24, 95%, 53%)` | Séance ratée, niveau de pénalité, points retirés |

### 1.2 Typographie
* **Polices Recommandées** : 
  * `Inter` ou `Outfit` (Sans-Serif) pour l'interface courante, les tableaux et formulaires (lisibilité maximale).
  * `Space Grotesk` ou `JetBrains Mono` (Monospace/Technique) pour les en-têtes de cartes, les scores de discipline et les graphes techniques.

---

## 2. Spécification des Interfaces & Maquettes

Nous avons généré deux maquettes d'interface haute fidélité respectant scrupuleusement ces critères de design.

### 2.1 Le Dashboard Apprenant (Daily Focus)

Le tableau de bord de l'apprenant est centré sur l'exécution immédiate et le maintien du score de discipline. Il est composé de :
1. **La Séance du Jour** : Une carte centrale proéminente affichant la tâche courante, son avancement et le bouton principal d'action `Start Session`.
2. **Le Score de Discipline** : Une jauge semi-circulaire colorée (vert/cyan) indiquant le score actuel (ex: `95/100`), incitant l'apprenant à ne pas rater de session.
3. **Le Suivi de Progression (Graphe linéaire)** : Un graphique de vélocité montrant le nombre de sujets déverrouillés et maîtrisés au fil de la semaine.
4. **La Barre Latérale de Navigation** : Accès rapide à la vue globale, aux cours actifs, aux trophées et aux paramètres.

![Maquette du Tableau de Bord Apprenant](/home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/learner_dashboard_mockup_1781250420862.png)

---

### 2.2 Le Panel d'Administration (Curriculum & Rules Builder)

Destiné à la configuration no-code de la formation, ce panel permet le pilotage des structures d'apprentissage :
1. **Le Concepteur de Graphe de Dépendances (Dependency Graph Designer)** : Un outil visuel central où l'administrateur peut relier graphiquement les cours et sujets (ex. : *Intro to Python* $\rightarrow$ *Data Structures* $\rightarrow$ *Algorithms*). Chaque boîte de sujet montre sa jauge de complétion et ses verrous actifs.
2. **Le Gestionnaire de Règles de Pénalité (Penalization Rules Configuration)** : Un panneau à droite avec des boutons bascules (toggles) pour activer/désactiver des règles disciplinaires telles que le retard de rendu, la détection de plagiat ou les limites de connexions multiples.
3. **La Grille Métrique (Active Student Metrics)** : Un aperçu en temps réel du nombre d'étudiants actifs, du taux moyen d'engagement, du taux de complétion globale et de l'historique d'activité récent.
4. **Le Menu Program Builder** : Une barre latérale gauche pour structurer les contenus en blocs, évaluations et publier le programme complet.

![Maquette du Tableau de Bord Administrateur](/home/oswiser9/.gemini/antigravity-cli/brain/2b111fff-7b5c-4ebc-b70a-4f99edf45df3/admin_dashboard_mockup_1781250434875.png)

---

## 3. Comportements Dynamiques & Transitions (Micro-Interactions)

Pour que l'expérience utilisateur soit la plus fluide et premium possible, les interactions suivantes doivent être implémentées :

### 3.1 États Hover (Survol)
* **Cartes de Contenu** : Translation verticale de `-4px` et halo lumineux subtil (box-shadow cyan/blue avec `opacity: 0.15`).
* **Boutons d'Action** : Effet de transition fluide sur l'opacité du dégradé (0.3s) et changement du pointeur de la souris.

### 3.2 Déverrouillage de Sujet (Progression)
* Lorsqu'un prérequis est validé, le sujet dépendant doit passer de l'état `Locked` à `Available` via une micro-animation CSS : un icône de cadenas fermé qui se transforme en cadenas ouvert, accompagné d'une impulsion lumineuse émeraude sur les contours de la carte.

### 3.3 Application de Pénalité (Discipline)
* En cas de bascule d'une séance vers l'état `Missed`, le tableau de bord de l'apprenant applique un filtre rouge translucide temporaire sur l'écran d'accueil lors du chargement, puis affiche une carte d'alerte avec le motif et le score mis à jour (décrémentation animée du compteur de discipline).
