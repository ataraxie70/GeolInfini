# LevelUP Visual Language & Motion Grammar

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Experience Layer  
**Code :** LEVELUP-EXP-LVL-IMBS-001  

---

# 1. Langage Visuel LevelUP (LVL / UXD-005)

Le **LevelUP Visual Language (LVL)** définit la grammaire graphique universelle de l'écosystème. Il s'agit d'un langage au service du sens, où chaque décision esthétique découle d'une intention de clarté, de pédagogie ou d'accessibilité.

### 1.1 Identité Visuelle Unifiée
*   *Qui sommes-nous visuellement :* LevelUP est professionnel, sérieux, structuré, sobre, élégant, technique, premium et humain.
*   *Ce que nous refusons :* Le style graphique "gaming" clignotant, les fioritures visuelles inutiles, l'encombrement informationnel, le ton infantilisant et la distraction permanente.
*   *Objectif :* Permettre à l'utilisateur d'entrer dans un état d'attention focalisée ("flow state") pour travailler sereinement sur des compétences techniques à forte charge mentale.

### 1.2 Principes Esthétiques du Langage
*   **Functional Beauty (Beauté Fonctionnelle) :** Un composant n'est beau que s'il transmet l'information de manière limpide. Les éléments visuels purement décoratifs sont proscrits.
*   **Intentional Simplicity (Simplicité Intentionnelle) :** Si un pixel ou un élément de contour n'apporte pas une plus-value de compréhension, il doit être supprimé de l'interface.
*   **Calm Interfaces (Interfaces Calmes) :** L'espace vide (whitespace) n'est pas un espace perdu ; c'est un outil de hiérarchisation cognitive qui permet au regard de se poser et de respirer.
*   **Progressive Disclosure (Divulgation Progressive) :** Ne montrer la complexité qu'à la demande de l'utilisateur ou à mesure qu'il acquiert les compétences prérequises.
*   **Semantic Design (Design Sémantique) :** Les formes, couleurs et animations possèdent une signification fixe et constante à travers toute l'application.
*   **Invisible Technology (Technologie Invisible) :** L'UI doit s'effacer pour laisser place au code de l'utilisateur, à ses notes et à sa réflexion.

### 1.3 Le Visual Grammar Framework (VGF)
Le VGF structure le langage visuel de la même manière qu'une langue naturelle :

```text
 ┌────────────────────────────────────────────────────────────────────────┐
 │                      VISUAL GRAMMAR FRAMEWORK (VGF)                    │
 ├───────────────────┬───────────────────┬────────────────────────────────┤
 │ 1. Lexique        │ 2. Syntaxe        │ 3. Sémantique                  │
 │ (Formes, Couleurs,│ (Grilles, Rythme, │ (Couleurs fixes,               │
 │ Typo, Icônes)     │ Espaces)          │ Signification des icônes)      │
 └───────────────────┴───────────────────┴────────────────────────────────┘
```

#### A. Le Lexique Visuel
*   *Les Formes :* Proportions géométriques simples, coins arrondis standardisés (`8px` pour les petits contrôles, `12px` pour les cartes de bento-grid, `16px` pour les modales). Les formes trop angulaires ou agressives sont évitées pour susciter le calme.
*   *La Palette de Couleurs (Dark Mode Premium) :*
    *   *Fond principal (Scaffold BG) :* Slate 900 (`#0F172A`).
    *   *Surfaces de conteneurs (Surface Card) :* Slate 800 (`#1E293B`).
    *   *Bordures et séparateurs :* Slate 700 / 600 (`#334155` / `#475569`).
*   *La Typographie Pédagogique :*
    *   *Outfit :* Pour les titres principaux, les sections de dashboard et les chiffres clés.
    *   *Inter :* Pour le corps du texte, les descriptions de cours et les fiches explicatives (optimisé pour la lecture prolongée).
    *   *JetBrains Mono :* Pour le code source, les identifiants techniques uniques (URN), et les consoles système.
*   *L'Iconographie :* Style filaire épuré, épaisseur constante (`2px`), angles assortis à la charte des formes. Une icône doit toujours être accompagnée d'un texte explicatif ou d'une info-bulle (tooltip) d'accessibilité.

#### B. La Sémantique des Couleurs
Chaque couleur s'associe de manière exclusive à un domaine sémantique permanent :
*   **Bleu (`#3B82F6`) :** Informations de référence, documents d'étude stables, historique de progression.
*   **Vert (`#10B981`) :** Progression validée, badges de maîtrise, réussite d'une évaluation.
*   **Orange (`#F97316`) :** Action requise, lancement d'une évaluation, alertes de routine active.
*   **Violet (`#8B5CF6`) :** Éléments interactifs et retours de l'Intelligence Artificielle. Le violet est strictement réservé à l'IA Coach.
*   **Rouge (`#EF4444`) :** Erreur critique système, problème de sécurité ou déconnexion réseau majeure. Interdiction d'utiliser le rouge vif pour signaler de simples échecs pédagogiques.

#### C. La Pragmatique Contextuelle
Le langage visuel s'adapte selon la phase de l'apprenant :
*   *Mode Dashboard (Bento-grid) :* Densité d'information moyenne, priorités claires sur les routines quotidiennes et l'XP.
*   *Mode Session d'Étude (Zen Mode) :* Les menus secondaires se replient, l'espace vide augmente, l'interface se simplifie pour maximiser la concentration sur le cours ou le lab.
*   *Mode Évaluation (Restreint) :* Masquage complet de la navigation globale, limitation des actions possibles aux seuls contrôles de l'examen.

---

## 2. Interaction, Motion & Behavioral System (IMBS / UXD-010)

L'IMBS définit l'expression dynamique et comportementale de l'interface. Tout mouvement doit aider à comprendre, et non chercher à divertir.

### 2.1 Les 17 États Comportementaux des Composants
Chaque widget LUP-COMP doit réagir selon un ensemble d'états normalisés :
1.  **Default :** Repos. Le composant est inactif mais disponible.
2.  **Hover :** Survol. Augmentation discrète de la luminosité ou de l'élévation.
3.  **Focus :** Focus clavier obligatoire. Une bordure Indigo de `2px` détoure le composant.
4.  **Pressed :** Pression physique. Légère réduction d'échelle (`scale(0.98)`).
5.  **Selected :** État actif ou sélectionné.
6.  **Dragging :** Élément en cours de déplacement (opacité à 70 % et ombre diffuse).
7.  **Loading :** Chargement asynchrone (shimmer discret pour les données, spinner pour les actions).
8.  **Success :** Action validée avec succès. Transit rapide vers une icône de confirmation verte.
9.  **Warning :** Signalement d'un risque réversible ou d'un avertissement de routine.
10. **Error :** Échec d'une action ou violation de règles de prérequis.
11. **Disabled :** Composant grisé et désactivé (opacité à 40 %, non-cliquable).
12. **Empty :** Absence de données. Affiche une explication sémantique calme pour guider l'utilisateur.
13. **Offline :** Mode hors-ligne. Affichage d'un badge Slate neutre sur le composant.
14. **Synchronizing :** Synchronisation des données locales vers le cloud (légère pulsation discrète).
15. **Updating :** Flux d'informations mis à jour en direct.
16. **Completed :** Tâche terminée, figée et non modifiable.
17. **Archived :** Archive d'activité. Couleur estompée pour libérer l'attention sur les tâches actives.

### 2.2 Grammaire du Mouvement (Motion System)
*   *Principe :* Le mouvement exprime une transition logique (ex. un volet qui glisse depuis la droite montre qu'il s'agit d'une vue contextuelle temporaire ; une Skill Card qui s'étend vers le bas montre son détail sans perdre le contexte global).
*   *Timing :* Les transitions d'interface durent entre `200ms` et `300ms`. Les micro-animations d'état (hover, pressed) durent `100ms`. Les courbes d'animation utilisent des fonctions physiques (`ease-out` ou `cubic-bezier(0.4, 0, 0.2, 1)`).
*   *A11y :* Respect de la préférence utilisateur `prefers-reduced-motion` (remplacement des glissements par de simples fondus transparents).

### 2.3 Attention Management System (AMS)
L'attention est une ressource sacrée. Le système met en œuvre plusieurs filtres ergonomiques :
*   *Notification Throttling :* Pendant une session d'étude active, toutes les notifications non urgentes sont collectées en arrière-plan et différées jusqu'à la fin de la routine de l'apprenant.
*   *Groupes de Notifications :* Les messages d'activité communautaire sont regroupés au lieu d'interrompre le flux de travail de l'apprenant individuellement.
*   *Configuration de Concentration :* L'apprenant peut configurer des plages horaires d'étude durant lesquelles l'interface verrouille automatiquement les signaux interactifs distrayants.

### 2.4 Human Presence System (HPS)
Pour briser la solitude de l'apprentissage en ligne sans distraire :
*   *Compteurs Contextuels :* Des chiffres discrets et statiques indiquent le nombre d'apprenants travaillant simultanément sur la même compétence.
*   *Mentoring Indicators :* Les signaux de disponibilité des mentors sont discrets (pas de clignotements). L'accès à une session d'aide avec un mentor s'intègre naturellement comme une option d'aide progressive à la suite de l'IA.
*   *Activity Streams :* Flux d'activités collectives de défis présentés sous forme de flux passifs de bento-grid, ne forçant pas l'action immédiate.
