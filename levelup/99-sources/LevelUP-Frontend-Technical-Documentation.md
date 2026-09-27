# LevelUP — Documentation Technique Frontend & Ingénierie d'Expérience

**Version :** 1.0 — Synthèse consolidée
**Statut :** Document de référence (dérivé des livrables Foundation, Strategic DDD, Platform Context Landscape, Experience Architecture Landscape et UX/UI Design Making)
**Code :** LEVELUP-FRONTEND-TECH-DOC-001
**Objet :** Ce document consolide, dans une seule référence cohérente, l'ensemble des couches d'ingénierie frontend et d'expérience de LevelUP — des fondations techniques les plus basses jusqu'au monde social et communautaire où vivent les acteurs de l'écosystème. Il ne crée pas de nouvelle doctrine : il ordonne, relie et rend actionnable ce qui est déjà spécifié à travers les documents Foundation, Experience Architecture Landscape et UX/UI Design Making du projet.

---

## 0. Pourquoi ce document

Le projet levelUP dispose déjà d'une documentation d'ingénierie et d'expérience très riche, mais dispersée entre plusieurs dossiers (`Foundation`, `experience-Architecture-Landscape`, `UX_UI_design_making`, `platform-Context-Landscape`). Ce document répond à un besoin précis : donner une **vue frontend unique, hiérarchisée par couches**, qui montre comment la philosophie métier de LevelUP se traduit, niveau par niveau, jusqu'à l'écran, l'interaction, et finalement la communauté humaine qui vit dans cet écosystème.

La lecture proposée suit un principe simple : **on ne peut pas comprendre l'interface de LevelUP sans comprendre d'abord ce que LevelUP refuse d'être.**

---

## 1. Le Monde LevelUP — ce que l'interface doit incarner

Avant toute couche technique, un principe d'architecture non négociable gouverne tout le frontend : **l'UI est l'expression matérielle de la philosophie de progression, pas un vernis esthétique.**

```
BUSINESS PHILOSOPHY
"Foundation First" · "Faire n'est pas comprendre" · "Vérité avant motivation"
        │
        ▼
UX/UI CONTRACTS
Navigation verrouillée · Composants fondés sur la preuve · Explicabilité par le design
        │
        ▼
CLIENT IMPLEMENTATION
Vues Flutter · Composants React · Rendu HTML/CSS
```

### 1.1 Ce que LevelUP est visuellement
Professionnel, sérieux, structuré, sobre, élégant, technique, premium, humain.

### 1.2 Ce que LevelUP refuse
Le style "gaming" clignotant, les fioritures décoratives, le ton infantilisant, la surcharge cognitive, les dark patterns, la compétition toxique basée sur la vitesse, la pression temporelle artificielle sur des tâches non évaluées.

### 1.3 Les axiomes qui contraignent le frontend
Trois axiomes fondateurs pèsent directement sur toute décision d'interface :
- **A7 — Une tâche réalisée ne constitue pas une preuve de compétence.** Aucun composant ne peut afficher une compétence "acquise" sans preuve associée.
- **A9 — Les mécanismes RPG sont des représentations visuelles, jamais des preuves.** XP, niveaux, badges sont un langage, pas une vérité.
- **Vérité avant motivation.** Le système ne doit jamais donner l'illusion d'une maîtrise inexistante, même au prix de l'engagement à court terme.

Ce document organise maintenant la traduction de ces principes en quatre couches d'ingénierie d'expérience, puis en six couches d'architecture technique, puis dans le monde social qui les enveloppe.

---

## 2. Couche 1 — Design Foundations (les jetons atomiques)

Grille de base à pas de **4px**.

| Token | Valeur | Usage |
|---|---|---|
| `SPACE-XS` | 4px | micro-ajustements de labels |
| `SPACE-SM` | 8px | marges de listes denses |
| `SPACE-MD` | 12px | espace interne des petites cartes |
| `SPACE-LG` | 16px | espacement par défaut entre cartes |
| `SPACE-XL` | 24px | marges internes des modales |
| `SPACE-2XL` | 32px | marges de sections de page |
| `SPACE-3XL` | 48px | dashboards |
| `SPACE-4XL` | 64px | respiration des en-têtes |

**Rayons :** `RADIUS-XS` 4px (icônes) → `RADIUS-SM` 8px (boutons, champs) → `RADIUS-MD` 12px (bento-grid) → `RADIUS-LG` 16px (modales) → `RADIUS-XL` 24px (grands conteneurs) → `RADIUS-FULL` 9999px (pilules, avatars).

**Palette (Dark Mode Premium) :**
- Fond principal : Slate 900 `#0F172A`
- Surfaces : Slate 800 `#1E293B`
- Bordures : Slate 700/600 `#334155` / `#475569`
- Bleu `#3B82F6` — référence, information stable, historique
- Vert `#10B981` — progression validée, réussite
- Orange `#F97316` — action requise, alerte de routine
- **Violet `#8B5CF6` — strictement réservé à l'IA Coach**, jamais utilisé ailleurs
- Rouge `#EF4444` — réservé aux erreurs critiques système/sécurité, **jamais** pour signaler un simple échec pédagogique (tons doux orange/slate à la place)

**Typographie :** Outfit (titres, chiffres clés) · Inter (corps de texte, lecture prolongée) · JetBrains Mono (code, identifiants URN, consoles).

**Breakpoints :** Mobile 320–480px · Tablette 481–768px · Laptop 769–1024px · Desktop 1025–1440px · Wide >1440px.

Ces jetons ne sont pas des choix esthétiques libres : ils sont gouvernés (voir §9) et versionnés en semver.

---

## 3. Couche 2 — Interaction Foundations (le comportement des composants)

### 3.1 Les 17 états comportementaux obligatoires
Tout composant `LUP-COMP` doit implémenter : Default, Hover, Focus (bordure Indigo 2px), Pressed (scale 0.98), Selected, Dragging (opacité 70%), Loading (shimmer/spinner), Success, Warning, Error, Disabled (opacité 40%), Empty, Offline, Synchronizing, Updating, Completed, Archived.

### 3.2 Grammaire du mouvement
- Transitions d'interface : 200–300ms · micro-animations (hover/pressed) : 100ms
- Courbe : `ease-out` ou `cubic-bezier(0.4, 0, 0.2, 1)`
- Le mouvement exprime toujours une relation logique (un volet qui glisse = vue contextuelle temporaire ; une carte qui s'étend = détail sans perte de contexte)
- Respect strict de `prefers-reduced-motion` (glissements remplacés par de simples fondus)

### 3.3 Attention Management System (AMS)
Pendant une session d'étude active, les notifications non urgentes sont différées et regroupées. L'apprenant peut configurer des plages de concentration qui verrouillent les signaux distrayants.

### 3.4 Navigation contractuelle
La navigation n'est pas libre : elle est **assujettie à l'état de maîtrise** calculé par le Progress Context.

```
[ Requête de navigation vers CompetencyDetail ]
                │
                ▼
   [ Contrat de validation de prérequis ]
     │                              │
(validés)                    (manquants)
     ▼                              ▼
[ Routage autorisé ]      [ Refus + écran de verrou expliqué ]
```

Deux règles structurantes :
- **Verrouillage hiérarchique** : l'accès à une compétence dépendante est bloqué tant que l'évaluation du prérequis n'atteint pas un niveau de confiance suffisant — jamais une erreur 403 générique, toujours l'arbre de prérequis et les preuves manquantes.
- **Navigation sous contrat de session d'évaluation** : durant un examen à temps limité, les menus globaux disparaissent ; l'utilisateur reste confiné jusqu'à soumission ou expiration.

---

## 4. Couche 3 — Experience Components (les widgets du domaine)

Nomenclature : `LUP-COMP-[FAMILLE]-[ID]`.

| Famille | Rôle | Exemples |
|---|---|---|
| PRIMITIVE (PRM) | briques structurelles | BOX, STACK, FLEX, SPACER |
| FOUNDATION (FND) | éléments élémentaires | BUTTON, TEXT, ICON, AVATAR, BADGE |
| CORE (COR) | interactifs génériques | CARD, DIALOG, INPUT, SELECT, MENU, TOOLTIP |
| **DOMAIN (DOM)** | valeur métier exclusive | KGRAPH, SKCARD, AICoach, RADAR, TIMELINE, EVALPANEL |
| COMPOSITE (CMP) | assemblages | LEARNERDASH, WORKSPACE, TEACHERSPACE |

C'est la famille **DOMAIN** qui porte l'identité réelle de LevelUP. Trois composants la caractérisent :

**`LUP-COMP-DOM-SKCARD` (Skill Card)** — API : `competencyId` (URN), `masteryEstimation` (float), `evidences` (Array<Evidence>), `status` (Locked / Unlockable / Active / Mastered). Interdictions structurelles : impossible d'afficher "Validé" sans preuve ; impossible d'utiliser un vert de gratification si le niveau de confiance global est "Faible".

**`LUP-COMP-DOM-KGRAPH` (Knowledge Graph)** — graphe interactif des prérequis et compétences ; nœud verrouillé tant que le prérequis n'est pas validé, invitation à l'exploration plutôt qu'à la performance.

**`LUP-COMP-DOM-AICoach`** — panneau socratique, jamais un copilote d'exécution :
- flux de raisonnement affiché ("Étapes de réflexion de l'IA Coach"), collapsible
- badge de doute sémantique (violet clair) quand la confiance du modèle est faible : *"L'IA estime cette explication incertaine. Veuillez vérifier avec les sources documentaires."*
- couche anti-triche : si l'utilisateur cherche la solution brute sans effort, bannière orange, suspension temporaire de la génération de code, réorientation vers la méthode.

### Écrans contractuels
- **Competency Card** — champs obligatoires : id + nom, barre de maîtrise, preuves avec badge de confiance, objectif de routine actif.
- **Assessment Screen** — objectif ciblé, instructions, compte à rebours si configuré, critères binaires validé/non-validé, zone de dépôt de preuve, historique de feedback.
- **Daily Routine Widget** — streak actif, score de discipline glissant, prochaine activité planifiée, calendrier d'assiduité 30 jours (grille type GitHub commits).

---

## 5. Couche 4 — Product Patterns (l'orchestration des parcours)

Nomenclature : `LUP-PAT-[FAMILLE]-[ID]`, en quatre niveaux d'échelle croissante :

1. **Atomic Pattern** — une action immédiate. Ex. `LUP-PAT-ATOM-CONFIRM` : pression prolongée de 2 secondes avant une action critique irréversible.
2. **Interaction Pattern** — quelques widgets assemblés. Ex. `LUP-PAT-INT-ROUTINECREATE` : planification d'un créneau d'étude quotidien.
3. **Workflow Pattern** — processus multi-étapes. Ex. `LUP-PAT-WORK-LABSUBMIT` : glissement de fichier → hash SHA256 local → chiffrement/transmission → ticket de soumission.
4. **Journey Pattern** — expérience complète sur un jalon. Ex. `LUP-PAT-JOURNEY-FIRSTDAY` : diagnostic initial → configuration de routine → première recommandation du coach.
5. **Experience Blueprint** — orchestration globale. Ex. `LUP-PAT-BLUEPRINT-SOCRATIC` : verrouillage de navigation → session → dialogue coach → consignation de preuve → déverrouillage.

Ce dernier niveau est celui où la philosophie business devient littéralement un scénario d'écran.

---

## 6. Architecture d'ingénierie frontend (le runtime en 6 couches)

Le frontend est traité comme un système logiciel à part entière, **indépendant du framework de rendu**.

```
1. Presentation Layer      — rendu pur des LUP-COMP (React web / Flutter mobile), zéro logique métier
2. Interaction Layer       — routage, raccourcis clavier, gestes tactiles, transitions IMBS
3. State Layer             — état local + stores globaux, cache local des requêtes
4. Application Layer       — orchestration des cas d'usage (initier un défi, charger un cours)
5. Domain Layer            — entités métier (Learner, Competency, Evidence, AssessmentSession)
                              et règles de validation de prérequis
6. Infrastructure Layer    — clients réseau (Core API REST), abonnements NATS JetStream,
                              connecteurs SQLite (mobile) / IndexedDB (web)
```

### 6.1 Unified Experience Context (UEC) — Offline-First
Toute l'expérience utilisateur est encapsulée dans un store d'état unique et persistant : progression en cours, réponses non soumises du chat socratique, statut réseau.

**File d'attente d'actions locale :** en cas de coupure réseau, aucun écran d'erreur bloquant. L'application bascule en état *Offline* ; toutes les interactions (notes, validations, soumissions de preuves) sont sérialisées en commandes chiffrées et empilées localement (SQLite mobile / IndexedDB web). Dès reconnexion, dépilement transparent (*Delayed Sync*) — aucune perte de travail.

### 6.2 Continuité d'expérience multi-écrans (ECA)
L'UEC se synchronise de manière asynchrone avec la Core API (port 3000) et la Platform API (port 4000) aux événements clés. Un apprenant qui ferme son navigateur et rouvre l'app mobile retrouve l'état exact : historique de chat préservé, curseur d'éditeur calé, temps d'évaluation synchronisé.

**Profils de terminaux :**
- *Mobile (Compact)* — navigation en barre inférieure, le Knowledge Graph bascule en vue liste hiérarchisée
- *Tablette/Laptop (Standard)* — sidebar repliable, split-screen cours + terminal/chat
- *Bureau (High Density)* — multi-fenêtrage persistant : graphe global, IDE, terminal, Reflection Box, chat IA simultanés

---

## 7. Le cycle d'apprentissage comme moteur de l'interface (LXS)

Le Learning Experience System définit **11 étapes**, chacune avec un comportement d'écran précis :

| # | Étape | Comportement UI |
|---|---|---|
| 1 | Découverte | graphe interactif, nœud en exploration, description succincte au clic |
| 2 | Compréhension | textes structurés, tooltips de définition au survol |
| 3 | Exploration | ressources complémentaires, sandboxes sans évaluation |
| 4 | Pratique | exercices guidés, correction temps réel, avancement pas-à-pas |
| 5 | Feedback | résultat structuré, ligne d'erreur ciblée, pas de solution donnée directement |
| 6 | Réflexion | zone de saisie d'auto-explication (Reflection Box) |
| 7 | Consolidation | notifications discrètes de répétition espacée (courbe de l'oubli) |
| 8 | Évaluation | interface d'examen chronométrée, navigation globale masquée |
| 9 | Application | dashboard projet ou terminal SSH sur VM isolée |
| 10 | Maîtrise | déblocage visuel de badges, ouverture des nœuds dépendants |
| 11 | Transmission | peer review, forum d'entraide (l'expert enseigne au débutant) |

### 7.1 L'erreur comme donnée, pas comme échec
- Rouge vif interdit pour un simple écart d'apprentissage (réservé aux erreurs critiques système)
- Bouton systématique "Expliquer avec le Coach" sur tout message d'erreur pédagogique
- Indices graduels : 1er échec → méthode générale · 2e échec → indice technique ciblé · 3e échec → exemple similaire résolu. **Jamais la solution brute.**

---

## 8. Accessibilité — une capacité d'architecture, pas une case à cocher

Neuf dimensions opérationnelles gouvernent le frontend :

1. **Physique & sensorielle** — WCAG AA/AAA, contraste 4.5:1 (texte) / 3:1 (composants), navigation clavier complète, rôles ARIA sur tous les widgets spécifiques.
2. **Cognitive** — vocabulaire simplifié, glossaire sémantique interactif intégré aux cours et aux réponses du Coach.
3. **Éducative** — densité adaptative : novice = métaphores guidées, expert = code brut et specs techniques.
4. **Technique (résilience)** — Offline-First natif, lazy-loading des analytics lourds, économie d'énergie.
5. **Culturelle & linguistique** — i18n natif, support RTL, neutralité culturelle des icônes.
6. **De l'IA** — transparence : l'utilisateur peut interroger les sources de l'IA Coach.
7. **Émotionnelle (anti-anxiété)** — pas de timers anxiogènes hors évaluation, erreurs présentées avec bienveillance.
8. **Professionnelle** — le portail étudiant met l'accent sur les routines ; le portail entreprise/inspecteur sur les certifications et portefeuilles de preuves.
9. **Future** — modèles de données compatibles commande vocale, eye-tracking, AR/VR.

**Les 5 lois :** Chacun peut apprendre · Accessibilité par défaut (AA actif sans configuration) · Canaux multiples (au moins deux modes sensoriels par action majeure) · Dégradation douce (désactivation des fioritures avant les fonctions vitales) · Assistance progressive (les béquilles d'aide se retirent avec la maîtrise).

---

## 9. Le monde social — Community Learning Architecture (CLA)

C'est ici que l'interface cesse d'être individuelle et devient **le lieu où vivent les acteurs et leurs communautés**. LevelUP synthétise cinq modèles d'interaction existants, sans en copier aucun tel quel :

| Source d'inspiration | Ce qui est repris |
|---|---|
| GitHub | apprentissage par la preuve, pull requests de documentation, projets réels |
| Discord | présence temps réel, aide instantanée, salons de travail |
| Reddit | catégorisation et évaluation asynchrone, débats structurés |
| Stack Overflow | question-réponse validée par experts |
| Coursera / Moodle | rigueur de structuration des cours |

### 9.1 Typologie des communautés
Communautés publiques (par domaine) · communautés privées (entreprise/université) · groupes d'étude (3–5 personnes) · binômes d'apprentissage temporaires · cercles de mentorat.

### 9.2 Les défis — projets, pas jeux
```
STRUCTURE D'UN DÉFI
1. Objectifs pédagogiques reliés au graphe de compétences
2. Livrables et preuves physiques attendus
3. Règles de collaboration (pair-programming)
4. Rôle de l'IA (modération + coach socratique)
5. Évaluation finale binaire (validé / non-validé)
6. Récompenses sémantiques (XP, badges, réputation)
```
Typologie : personnels · entre pairs · communautaires · académiques/entreprise · nationaux/internationaux.

### 9.3 Réputation — jamais la popularité
Le score de réputation évite délibérément la course aux likes. Il est calculé sur : qualité d'aide (réponses validées), activité de mentorat (progression réelle des mentorés), production collaborative (pull requests approuvées), fiabilité de collaboration (évaluation par les pairs), expertise démontrée (niveau de preuve du graphe personnel).

### 9.4 Human Presence System (HPS)
Compteurs contextuels discrets et statiques (nombre d'apprenants sur la même compétence, sans clignotement) ; indicateurs de disponibilité des mentors intégrés naturellement comme aide progressive après l'IA ; flux d'activité collective en bento-grid passif, jamais en incitation à l'action immédiate.

---

## 10. Gouvernance & qualité — ce qui garde le monde cohérent dans le temps

### 10.1 Instances (UXGF)
- **Experience Architecture Board (EAB)** — autorité suprême, valide les évolutions stratégiques de la charte, arbitre les conflits, garantit la conformité à la vision fondatrice.
- **Design & Engineering Councils** — designers Figma + développeurs React/Flutter + experts A11y, produisent les nouveaux `LUP-COMP`.
- **Feature Teams** — implémentation opérationnelle dans le respect strict des contrats.

### 10.2 Cycle de vie d'une évolution UX
Proposition → maquette Figma (jetons/composants existants uniquement) → audit A11y → approbation EAB (conformité aux 14 principes HCD) → release semver → implémentation React/Flutter.

### 10.3 Matrice d'arbitrage des conflits de conception
```
[Priorité maximale]  Human First
        ▼             Learning First
        ▼             Clarity Before Beauty
        ▼             Cognitive Economy
        ▼             Universal Inclusion
        ▼             Consistency Everywhere
        ▼             Trust & Transparency
[Priorité basse]      Invisible Excellence
```

### 10.4 Cadre de qualité (EQF) — 5 niveaux de maturité
Ad-Hoc → Standardisé → Architecture Alignée (LXS + CLA) → Mesurable (fatigue d'apprentissage, clarté de l'IA) → Optimisé en continu.

**Métriques clés :** Clarté Pédagogique Perçue (CPP) · Score de Régularité & Discipline (SRD) · Taux d'Abandon face à l'Erreur (TAE) · Temps de Résolution de Tâche (TRT) · Fluidité Offline (taux de synchronisation réussie).

---

## 11. Vue de synthèse — le monde vécu par chaque acteur

| Acteur | Ce que l'interface lui donne à voir en priorité |
|---|---|
| **Apprenant individuel** | routine quotidienne, graphe de compétences, Reflection Box, coach socratique |
| **Formateur / mentor** | cercles de mentorat, revues de projet, indicateurs de progression des apprenants suivis |
| **Établissement / entreprise** | portefeuilles de preuves, certifications, graphes conformes aux standards du secteur |
| **Communauté publique** | défis communautaires, forums de transmission par les pairs, réputation pédagogique |
| **Administrateur / gouvernance** | Design System, registre de composants, tableaux de maturité EQF |

Ce tableau referme la boucle du document : les jetons de la §2 et les 17 états de la §3 ne sont jamais "juste du style" — ils sont la matière première avec laquelle se construit, écran après écran, le monde décrit à la §9, où un apprenant du Tampuis à Ouagadougou peut, avec les mêmes garanties de rigueur, croiser un mentor, une entreprise partenaire ou une communauté nationale entière autour d'une même preuve de compétence.

---

## Annexe — Traçabilité des sources

Ce document synthétise et réorganise, sans les dénaturer, les livrables suivants du projet :
- `Foundation/01-Core-Identity.md`, `02-Vision-Programe.md`, `03-Business-Motivation.md`, `03-Progression-Philosophy.md`
- `experience-Architecture-Landscape/*` (5 spécifications Core Standard : Design System, Experience Architecture, Experience Foundations & Learning Systems, Frontend Engineering & Governance, Visual Language & Motion Grammar, Accessibility & Community)
- `platform-Context-Landscape/LevelUP-Context-Landscape.md` (positionnement des contextes plateforme)
- `Strategic Domain Design (DDD)/01-Context-Map.md` (frontières métier)
- `UX_UI_design_making/*` — versions de travail antérieures aux spécifications finales ci-dessus, conservées comme historique de décision

Les documents `UX_UI_design_making/*` constituent les brouillons de réflexion ("je proposerais...") qui ont abouti aux spécifications finales du dossier `experience-Architecture-Landscape/`. En cas de divergence, **`experience-Architecture-Landscape/` fait foi**.
