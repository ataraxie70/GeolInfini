# Design System Specifications & Component Registry

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Experience Layer  
**Code :** LEVELUP-EXP-DESIGN-SYSTEM-001  

---

# 1. Architecture Générale du Design System (UXD-006)

Le Design System de LevelUP est structuré comme un pont d'ingénierie formel entre les principes philosophiques d'expérience et leur mise en œuvre technique. Il s'organise selon un modèle strict de **quatre couches logiques**, assurant une modularité totale et une cohérence absolue entre Figma et le code (React, Flutter).

```text
 ┌────────────────────────────────────────────────────────┐
 │ Couche 4 : Product Patterns (Assemblages Métier)       │  (Workspaces d'étude, Dashboards, Écrans d'évaluation)
 └──────────────────────────┬─────────────────────────────┘
                            ▼
 ┌────────────────────────────────────────────────────────┐
 │ Couche 3 : Experience Components (Widgets Domain)      │  (KnowledgeGraph, SkillCard, AICoachPanel)
 └──────────────────────────┬─────────────────────────────┘
                            ▼
 ┌────────────────────────────────────────────────────────┐
 │ Couche 2 : Interaction Foundations (Comportements)     │  (Gestion des 17 états, navigation, focus clavier)
 └──────────────────────────┬─────────────────────────────┘
                            ▼
 ┌────────────────────────────────────────────────────────┐
 │ Couche 1 : Design Foundations (Tokens Atomiques)       │  (Couleurs, typographies, espaces, rayons, ombres)
 └────────────────────────────────────────────────────────┘
```

### 1.1 Jetons de Conception (Design Tokens)

#### A. Jetons d'Espacement (Spacing Tokens)
Les espacements entre les composants et à l'intérieur des conteneurs suivent une grille de base à pas de 4px :
*   `LUP-TOKEN-SPACE-XS` : 4px (micro-ajustements de labels).
*   `LUP-TOKEN-SPACE-SM` : 8px (marges d'éléments de listes denses).
*   `LUP-TOKEN-SPACE-MD` : 12px (espace interne par défaut des petites cartes).
*   `LUP-TOKEN-SPACE-LG` : 16px (espacement par défaut entre les cartes).
*   `LUP-TOKEN-SPACE-XL` : 24px (marges internes des fenêtres modales).
*   `LUP-TOKEN-SPACE-2XL` : 32px (marges de sections de page).
*   `LUP-TOKEN-SPACE-3XL` : 48px (espacement des grands conteneurs de dashboard).
*   `LUP-TOKEN-SPACE-4XL` : 64px (marges de respiration externe des en-têtes).

#### B. Jetons de Rayons de Courbure (Radius Tokens)
Les rayons de courbure des éléments visuels sont définis pour adoucir les composants sans donner un ton ludique :
*   `LUP-TOKEN-RADIUS-XS` : 4px (petits boutons d'icône).
*   `LUP-TOKEN-RADIUS-SM` : 8px (boutons d'action standards, champs de saisie).
*   `LUP-TOKEN-RADIUS-MD` : 12px (cartes de bento-grid, widgets secondaires).
*   `LUP-TOKEN-RADIUS-LG` : 16px (fenêtres de dialogue, panneaux coulissants).
*   `LUP-TOKEN-RADIUS-XL` : 24px (grands conteneurs d'apprentissage).
*   `LUP-TOKEN-RADIUS-FULL` : 9999px (boutons pilules, avatars circulaires).

#### C. Jetons d'Ombres & d'Élévations (Shadow Tokens)
*   `LUP-TOKEN-ELEVATION-0` : Aplat Slate 900 (`#0F172A`). Niveau de base de l'application.
*   `LUP-TOKEN-ELEVATION-1` : Slate 800 (`#1E293B`) avec une bordure fine d'une opacité de 10 % de blanc. Utilisé pour les cartes standards.
*   `LUP-TOKEN-ELEVATION-2` : Slate 800 avec une ombre portée diffuse (`0px 4px 12px rgba(0, 0, 0, 0.25)`). Utilisé pour le survol actif des cartes (Hover).
*   `LUP-TOKEN-ELEVATION-3` : Slate 800 avec une ombre portée prononcée (`0px 12px 32px rgba(0, 0, 0, 0.4)`). Utilisé pour les fenêtres modales et alertes de sécurité.

#### D. Points de Rupture d'Écran (Breakpoints)
*   `LUP-TOKEN-BREAKPOINT-MOBILE` : `320px` - `480px`.
*   `LUP-TOKEN-BREAKPOINT-TABLET` : `481px` - `768px`.
*   `LUP-TOKEN-BREAKPOINT-LAPTOP` : `769px` - `1024px`.
*   `LUP-TOKEN-BREAKPOINT-DESKTOP` : `1025px` - `1440px`.
*   `LUP-TOKEN-BREAKPOINT-WIDE` : `>1440px`.

---

## 2. Bibliothèque de Composants & Nomenclature (UXD-007)

Chaque composant visuel de LevelUP est traité comme un actif logiciel formel et enregistré dans le registre sous la nomenclature standardisée : `LUP-COMP-[FAMILY]-[ID]`.

### 2.1 Nomenclature des Familles de Composants
*   **PRIMITIVE (PRM) :** Briques techniques de structure et d'empilement.
    *   *Exemples :* `LUP-COMP-PRM-BOX`, `LUP-COMP-PRM-STACK`, `LUP-COMP-PRM-FLEX`, `LUP-COMP-PRM-SPACER`.
*   **FOUNDATION (FND) :** Éléments d'interface élémentaires et autonomes.
    *   *Exemples :* `LUP-COMP-FND-BUTTON`, `LUP-COMP-FND-TEXT`, `LUP-COMP-FND-ICON`, `LUP-COMP-FND-AVATAR`, `LUP-COMP-FND-BADGE`.
*   **CORE (COR) :** Composants interactifs complexes mais génériques.
    *   *Exemples :* `LUP-COMP-COR-CARD`, `LUP-COMP-COR-DIALOG`, `LUP-COMP-COR-INPUT`, `LUP-COMP-COR-SELECT`, `LUP-COMP-COR-MENU`, `LUP-COMP-COR-TOOLTIP`.
*   **DOMAIN (DOM) :** Composants métiers spécifiques, constituant la valeur exclusive de LevelUP.
    *   *Exemples :*
        *   `LUP-COMP-DOM-KGRAPH` : Graphe interactif des prérequis et des compétences.
        *   `LUP-COMP-DOM-SKCARD` : Carte de compétence affichant les preuves validées et l'estimation de maîtrise.
        *   `LUP-COMP-DOM-AICoach` : Panneau de chat socratique avec flux de raisonnement et filtre anti-triche.
        *   `LUP-COMP-DOM-RADAR` : Diagramme radar de maîtrise multi-domaines pour l'apprenant.
        *   `LUP-COMP-DOM-TIMELINE` : Fil chronologique d'apprentissage et routine d'assiduité quotidienne.
        *   `LUP-COMP-DOM-EVALPANEL` : Tableau de bord de consignation et de vérification des preuves d'évaluation.
*   **COMPOSITE (CMP) :** Assemblage de plusieurs composants Core/Domain pour matérialiser un espace de travail.
    *   *Exemples :* `LUP-COMP-CMP-LEARNERDASH`, `LUP-COMP-CMP-WORKSPACE`, `LUP-COMP-CMP-TEACHERSPACE`.

### 2.2 Fiche Technique Standardisée d'un Composant Domain (Exemple)
Pour être enregistré, un composant comme `LUP-COMP-DOM-SKCARD` doit documenter son API :
*   *Identity :* `LUP-COMP-DOM-SKCARD` | Version `1.0.0` | Category : Domain.
*   *Props (API Contract) :*
    *   `competencyId: URN` (Identifiant unique URN de la compétence).
    *   `masteryEstimation: float` (Pourcentage d'estimation de la maîtrise).
    *   `evidences: Array<Evidence>` (Liste des preuves associées avec niveau de confiance).
    *   `status: Enum { Locked, Unlockable, Active, Mastered }` (Statut d'accès dans le graphe).
*   *States :* Gestion obligatoire des états `Hover` (lueur), `Disabled` (grisé avec cadenas si prérequis manquants), `Offline` (badge synchro en attente).

---

## 3. Experience Patterns & Interaction Architecture (EPIA / UXD-008)

Les **Experience Patterns** documentent les flux d'interactions réutilisables pour orchestrer les parcours de l'utilisateur de manière standardisée sur le Web et le Mobile. Ils sont identifiés par le code `LUP-PAT-[FAMILY]-[ID]`.

### 3.1 Hiérarchie des Patrons de Conception (Patterns)
*   **Atomic Pattern (LUP-PAT-ATOM) :** Une action immédiate.
    *   *Exemple :* `LUP-PAT-ATOM-CONFIRM` (Bouton d'action critique déclenchant un état Pressed prolongé de 2 secondes avant exécution pour éviter les erreurs accidentelles).
*   **Interaction Pattern (LUP-PAT-INT) :** Assemblage de quelques formulaires ou widgets.
    *   *Exemple :* `LUP-PAT-INT-ROUTINECREATE` (Processus de planification d'un créneau d'étude quotidien).
*   **Workflow Pattern (LUP-PAT-WORK) :** Processus multi-étapes.
    *   *Exemple :* `LUP-PAT-WORK-LABSUBMIT` (Flux de dépôt de preuve de laboratoire technique : glissement de fichier ➔ calcul local du hash SHA256 ➔ chiffrement et transmission ➔ affichage du ticket de soumission).
*   **Journey Pattern (LUP-PAT-JOURNEY) :** Expérience complète sur un jalon temporel.
    *   *Exemple :* `LUP-PAT-JOURNEY-FIRSTDAY` (Parcours d'accueil et d'onboarding : questionnaire de diagnostic initial ➔ configuration de la routine ➔ génération et affichage de la première recommandation du coach).
*   **Experience Blueprint (LUP-PAT-BLUEPRINT) :** Orchestration globale.
    *   *Exemple :* `LUP-PAT-BLUEPRINT-SOCRATIC` (Scénario complet d'évaluation socratique : verrouillage de la navigation ➔ initialisation de la session ➔ dialogue avec l'IA Coach ➔ consignation de la preuve d'auto-explication ➔ déverrouillage de la navigation).
