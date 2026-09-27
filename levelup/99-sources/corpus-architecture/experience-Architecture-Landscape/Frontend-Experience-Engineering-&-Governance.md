# Frontend Experience Engineering & Governance

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Experience Layer  
**Code :** LEVELUP-EXP-ENG-GOVERNANCE-001  

---

# 1. Ingénierie & Architecture Frontend (UXD-011)

L'architecture frontend de LevelUP traite l'interface utilisateur comme un système logiciel structuré à part entière, indépendant des frameworks de rendu (React, Flutter). Cette couche d'ingénierie traduit les jetons et composants du Design System en une logique d'application robuste.

### 1.1 Modèle de Runtime en 6 Couches
L'application client s'organise selon une architecture en couches étanches :

1.  **Presentation Layer (Couche de Présentation) :**
    *   *Rôle :* Rendu visuel pur des composants `LUP-COMP`. Elle est implémentée en React pour le Web et en Flutter pour le Mobile. Elle ne contient aucune logique métier.
2.  **Interaction Layer (Couche d'Interaction) :**
    *   *Rôle :* Routage applicatif, gestion des raccourcis clavier, interception des gestes tactiles, et exécution des transitions de mouvements de l'IMBS.
3.  **State Layer (Couche d'État) :**
    *   *Rôle :* Gestion de l'état local et des stores de données globaux. Contient le cache local des requêtes.
4.  **Application Layer (Couche Applicative) :**
    *   *Rôle :* Orchestration des cas d'utilisation (use cases) et des scénarios (workflows), tels que l'initialisation d'un défi ou le chargement d'un cours.
5.  **Domain Layer (Couche Métier / Domaine) :**
    *   *Rôle :* Entités et objets de valeur métier (Learner, Competency, Evidence, AssessmentSession) porteurs des règles de validation de prérequis.
6.  **Infrastructure Layer (Couche d'Infrastructure) :**
    *   *Rôle :* Clients de communication réseau (API REST de la Core API, abonnements NATS JetStream, connecteurs de base de données locale SQLite ou IndexedDB).

### 1.2 Le Unified Experience Context (UEC) & Résilience Hors-Ligne (Offline-First)
L'état complet de l'expérience utilisateur est encapsulé dans une structure de données unique et persistante, le **Unified Experience Context (UEC)**.
*   **Fonctionnement de l'UEC :** Le store d'état maintient en permanence la trace des actions en cours de l'utilisateur (progression dans un cours, réponses non soumises de chat socratique, état des capteurs locaux, statut du réseau).
*   **File d'attente d'actions locale (Local Action Queue) :**
    *   En cas de déconnexion réseau, le système n'affiche aucun écran d'erreur bloquant. Le FER (Frontend Experience Runtime) bascule l'état de l'application en *Offline*.
    *   Toutes les interactions de l'utilisateur (prises de notes, validations d'exercices locaux, soumissions de preuves) sont sérialisées sous forme de commandes cryptées et empilées dans la base locale (SQLite pour Flutter mobile, IndexedDB pour React web).
    *   Un service d'arrière-plan surveille l'état de la connectivité réseau. Dès le rétablissement de la connexion, le FER dépile et exécute les commandes stockées de manière transparente (Delayed Sync), garantissant l'intégrité des données de progression sans aucune perte de travail pour l'utilisateur.

---

## 2. Continuité d'Expérience Multi-Écrans (ECA / UXD-012)

LevelUP garantit qu'un utilisateur peut commencer une routine d'apprentissage ou une évaluation sur un appareil et la terminer de manière transparente sur un autre.

### 2.1 Persistance Contextuelle Active
*   Le **Unified Experience Context (UEC)** est synchronisé de manière asynchrone avec la *Core API* (Port 3000) et la *Platform API* (Port 4000) lors des événements clés (validation de sous-étape, pause de cours, fermeture de session).
*   Lorsqu'un apprenant se reconnecte sur un autre terminal (ex. ouverture de l'application Flutter mobile après avoir fermé son navigateur web), le FER télécharge l'état de l'UEC actif et restaure l'interface exactement dans le même état (historique du chat socratique préservé, curseur d'IDE calé à la même ligne, temps restant d'évaluation synchronisé).

### 2.2 Profils de Terminaux (Device Profiles)
L'interface s'adapte de manière fluide aux dimensions et capacités de l'appareil :
*   *Profil Mobile (Compact) :* Densité d'information optimisée pour un écran de taille moyenne. La navigation globale s'effectue via une barre inférieure (Bottom Navigation). Les affichages complexes comme le graphe de compétences (Knowledge Graph) basculent automatiquement sur une vue liste hiérarchisée ou une carte de compétence focalisée.
*   *Profil Tablette / Laptop (Standard) :* Sidebar de navigation repliable, écran splitté (split-screen) pour la lecture de cours en parallèle du terminal interactif ou du chat IA.
*   *Profil Bureau (High Density) :* Multi-fenêtrage persistant intégrant le Graphe de compétences global, l'IDE de développement, le terminal d'exécution, la Reflection Box et le chat IA en affichage simultané.

---

## 3. Cadre de Gouvernance UX (UXGF / UXD-013)

Pour garantir que l'identité visuelle, les standards d'accessibilité et la cohérence de l'interface restent préservés malgré l'évolution des équipes et des technologies sur plusieurs décennies, LevelUP applique un cadre de gouvernance strict.

### 3.1 Niveaux de Décision & Instances
*   **Experience Architecture Board (EAB) :** L'EAB constitue l'autorité suprême en matière d'expérience utilisateur. Il valide les évolutions stratégiques de la charte graphique, arbitre les conflits de conception complexes et assure la conformité de chaque produit avec la vision fondatrice (`LEVELUP-EXP-FOUNDATION-001`).
*   **Design & Engineering Councils :** Comités thématiques réunissant les designers Figma, les développeurs frontend (React, Flutter), et les experts en accessibilité pour concevoir, tester et intégrer de nouveaux composants `LUP-COMP` dans le registre global.
*   **Feature Teams :** Équipes d'implémentation opérationnelle chargées de développer les fonctionnalités en respectant scrupuleusement les contrats d'API et d'états des composants du Design System.

### 3.2 Cycle de Vie des Évolutions de l'Expérience (UX Change Lifecycle)
Aucun changement graphique ou comportemental ne peut être introduit directement dans le code source sans respecter les étapes suivantes :
1.  *Proposition :* Rédaction d'une fiche d'évolution d'expérience décrivant le problème et le contexte.
2.  *Design Figma :* Conception des maquettes en réutilisant exclusivement les jetons et composants existants.
3.  *Audit Accessibilité (A11y) :* Validation préliminaire du respect du focus clavier, des contrastes et des rôles ARIA.
4.  *Approbation EAB :* Revue de conformité avec les 14 principes HCD.
5.  *Release :* Publication du composant ou de sa mise à jour dans le Design System global, avec incrémentation de version semver.
6.  *Implémentation technique :* Alignement du code dans les bibliothèques React et Flutter.

---

## 4. Cadre d'Évaluation de la Qualité de l'Expérience (EQF / UXD-014)

L'EQF établit les métriques mesurables de la réussite pédagogique et comportementale de l'expérience LevelUP, gérées à travers un processus d'amélioration continue PDCA (Plan-Do-Check-Act).

### 4.1 Modèle de Maturité de l'Expérience (5 Niveaux)
*   **Niveau 1 (Ad-Hoc) :** Aucun Design System en place. Interfaces développées de manière hétérogène selon les développeurs.
*   **Niveau 2 (Standardisé) :** Utilisation systématique des tokens visuels et des composants génériques, mais sans orchestration globale des workflows.
*   **Niveau 3 (Architecture Alignée) :** Alignement complet de l'expérience utilisateur sur le LXS (apprentissage individuel) et le CLA (apprentissage collectif).
*   **Niveau 4 (Mesurable) :** Suivi systématique des métriques de fatigue d'apprentissage et de clarté perçue des explications de l'IA Coach.
*   **Niveau 5 (Optimisé en Continu) :** Adaptation automatique des parcours d'apprentissage et des densités d'explication de l'interface en fonction des performances réelles de l'apprenant.

### 4.2 Catalogue des Métriques Clés de l'Expérience (EQF Catalog)
*   **Clarté Pédagogique Perçue (CPP) :** Score de compréhension de l'explication (calculé après chaque session socratique par une micro-évaluation de 3 questions).
*   **Score de Régularité & Discipline (SRD) :** Taux de réussite et assiduité de l'apprenant sur ses routines quotidiennes planifiées (indicateur clé du développement comportemental).
*   **Taux d'Abandon face à l'Erreur (TAE) :** Pourcentage d'apprenants quittant une session d'étude après avoir fait face à une erreur. Un TAE élevé indique un défaut de guidance ou un feedback d'erreur trop punitif.
*   **Temps de Résolution de Tâche (TRT) :** Temps nécessaire pour accomplir un défi de groupe ou un laboratoire technique (indicateur d'économie cognitive).
*   **Fluidité Offline (Offline Sync Rate) :** Taux de réussite de la synchronisation asynchrone des commandes de progression mises en cache locale.
