# Audit et Plan d'Implémentation Frontend - levelUP

## 1. Audit d'État et Technique

### Vision & Philosophie (Spécifications Architecture)
Le frontend de levelUP n'est pas une simple interface, mais une "expression matérielle des axiomes de progression". 
- **Calm Technology** : Rejet volontaire des mécanismes de "dopamine rapide" (notifications intrusives, popups d'XP artificiels) pour favoriser le focus profond.
- **UI Basée sur la Preuve** : La progression n'est jamais un pourcentage abstrait, mais est liée à un dossier de preuves observables.
- **Socratisme & Expliquabilité** : L'IA Coach ne donne pas de solutions, mais guide via un questionnement socratique avec exposition de son raisonnement.
- **Cycle LXS (Learning Experience System)** : Implémentation d'un cycle en 11 étapes (Découverte $\rightarrow$ Compréhension $\rightarrow$ Exploration $\rightarrow$ Pratique $\rightarrow$ Feedback $\rightarrow$ Réflexion $\rightarrow$ Consolidation $\rightarrow$ Évaluation $\rightarrow$ Application $\rightarrow$ Maîtrise $\rightarrow$ Transmission).

### Analyse de l'Implémentation Actuelle (`clients/web`)
- **Framework** : React + TypeScript + Vite.
- **État Actuel** : 
    - Présence de composants "LUP" (`LUPButton`, `LUPCard`, etc.) et d'un radar de compétences.
    - Système de login basique et dashboard de suivi.
    - `useNavigationGuard` pour le respect des prérequis.
- **Écarts Critiques** :
    - **Runtime** : L'architecture impose un runtime en 6 couches (Presentation $\rightarrow$ Interaction $\rightarrow$ State $\rightarrow$ Application $\rightarrow$ Domain $\rightarrow$ Infrastructure) avec résilience "Offline-First". L'implémentation actuelle est un React classique sans cette stratification.
    - **Temps Réel** : Utilisation de REST simple au lieu d'un flux événementiel aligné sur NATS (Backend).
    - **UX LXS** : Le cycle en 11 étapes est absent ; seule une vue dashboard statique existe.
    - **Design System** : Palette "Dark Mode Sleek" (Anthracite, Bleu Électrique, Or) partiellement appliquée mais non systématisée via un Theme Provider strict.
    - **Accessibilité** : Non conforme WCAG 2.1 AA (manque ARIA/Clavier).

### Tableau des Écarts (Gaps)
| Dimension | Spécification levelUP | État Actuel | Criticité |
|---|---|---|---|
| **Philosophie** | Calm Technology / Evidence-Driven | Dashboard classique | 🔴 Haute |
| **Cycle LXS** | 11 étapes de progression | Vue statique / Login | 🔴 Haute |
| **Architecture FE**| Runtime 6 couches / Offline-First | Architecture React standard | 🟠 Moyenne |
| **Communication** | Event-driven (WebSockets/NATS) | Request-Response (REST) | 🔴 Haute |
| **Design System** | Glassmorphism / Palette spécifique | LUP components fragmentés | 🟠 Moyenne |
| **Accessibilité** | WCAG 2.1 AA / Contrast 4.5:1 | Insuffisant | 🔴 Haute |

---

## 2. Plan d'Intervention et d'Implémentation

### Phase 1 : Refonte du Runtime et Design System (Fondations)
- [ ] **Implémentation du Runtime 6-Layers** : Restructurer `src/` pour séparer strictement la Présentation, l'Interaction, l'État, l'Application, le Domaine et l'Infrastructure.
- [ ] **Systématisation du Theme Provider** : Implémenter la palette "Dark Mode Sleek" (Deep Anthracite `HSL 220, 15%, 10%`, Electric Blue, Gold) avec support Glassmorphism.
- [ ] **Mise en conformité A11y** : Audit et correction systématique pour atteindre le niveau WCAG 2.1 AA (Contrastes, ARIA, Focus).

### Phase 2 : Infrastructure Réactive et Résilience (Chemin Critique)
- [ ] **Migration vers l'État Global & WebSockets** : Remplacer les appels REST isolés par un store global synchronisé via WebSockets pour alignement avec le backend événementiel.
- [ ] **Implémentation Offline-First** : Créer une file d'attente d'actions locales pour garantir la continuité de l'expérience malgré les coupures réseau.
- [ ] **Mapping Événements BE $\rightarrow$ FE** : Aligner les types d'événements NATS avec les mises à jour d'état du frontend.

### Phase 3 : Implémentation du Cycle LXS (Cœur Métier)
- [ ] **Développement du Flow 11-étapes** : Créer les vues et composants pour chaque phase du LXS (de la Découverte à la Transmission).
- [ ] **Interface de l'IA Coach Socratique** : Implémenter le "Streaming of Reasoning" et les layouts anti-triche.
- [ ] **Système de Preuves (Evidence-Driven UI)** : Remplacer les barres de progression par des dossiers de preuves et badges de confiance.

### Phase 4 : Gouvernance et Polissage (Validation)
- [ ] **Validation EAB (Experience Architecture Board)** : Vérifier chaque flux contre les 14 principes HCD.
- [ ] **Mesure EQF (Experience Quality Framework)** : Implémenter le tracking du CPP (Perceived Pedagogical Clarity) et du TAE (Abandonment Rate due to Error).
- [ ] **Optimisation Mobile-First** : Finaliser l'Unified Experience Context (UEC) pour une continuité parfaite Mobile/Tablet/Desktop.
