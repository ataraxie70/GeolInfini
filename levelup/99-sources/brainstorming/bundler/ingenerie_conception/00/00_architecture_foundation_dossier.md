# Architecture Foundation Dossier — LevelUP
## TOGAF Phase 0 : Exploration & Foundation

---

### 01. Executive Summary

LevelUP est un système d'ingénierie éducative et de pilotage de la progression conçu pour faire face au déficit de compétences réelles dans un environnement saturé d'informations. L'accès instantané au savoir, accéléré par les technologies d'intelligence artificielle, a découplé l'activité d'apprentissage de la maîtrise effective. LevelUP résout ce problème en introduisant un modèle de progression sous contraintes rigoureuses (le Score de Discipline et le Graphe Dirigé Acyclique de prérequis), forçant l'apprenant à consolider ses bases avant toute spécialisation.

Ce dossier d'architecture de Phase 0 formalise les besoins métiers, les capacités système et le cadre conceptuel indispensables avant d'entamer la Phase A (Architecture Vision) du cycle TOGAF. Il vise à garantir l'indépendance technologique du moteur de progression tout en s'assurant que l'implémentation future (qu'elle soit en NestJS ou FastAPI) respectera scrupuleusement les exigences de rigueur, de traçabilité et de maîtrise réelle.

---

### 02. Vision Exploration

#### Initial Idea
Concevoir un système capable d'accompagner de bout en bout l'acquisition de compétences réelles et mesurables, en transformant des catalogues de connaissances passifs en parcours d'apprentissage actifs, structurés et contraignants.

#### Vision
Devenir l'infrastructure universelle de référence pour la structuration et la validation de parcours d'acquisition de compétences, garantissant l'excellence technique et l'autonomie des apprenants dans des domaines complexes (système, DevOps, ingénierie).

#### Motivations
* **Inflation informationnelle** : L'accès facile au savoir dissimule une absence de savoir-faire réel.
* **Manque de régularité** : La motivation initiale s'estompe rapidement face à la complexité technique ; seule la discipline algorithmiquement encadrée permet d'ancrer les compétences dans la durée.
* **Besoin de transparence** : Permettre aux organisations et aux individus de certifier des compétences sur la base de preuves tangibles et non de déclarations d'intention.

#### Assumptions
* L'apprenant accepte et recherche un modèle contraignant où la progression est subordonnée à la régularité et à la réussite d'épreuves de validation.
* Les domaines de compétence peuvent être modélisés sous forme de graphes de dépendance déterministes.
* La discipline personnelle est une métrique quantifiable, modifiable par des événements d'apprentissage (retards, succès).

#### Expected Outcomes
* Un moteur de progression universel, imperméable aux effets de mode technologiques.
* Une réduction mesurable des taux d'abandon dans les parcours d'apprentissage techniques complexes.
* Des apprenants dotés de fondations inébranlables, directement opérationnels sur des projets réels.

#### Potential Misconceptions
* **Confusion avec un LMS classique (Learning Management System)** : LevelUP ne diffuse pas de contenu ; il structure le parcours et pilote l'effort.
* **Confusion avec un simple outil RPG/Gamification** : L'expérience inspirée du jeu (niveaux, badges) est une surcouche de représentation visuelle ; elle ne constitue en aucun cas une preuve ou une validation de compétence.

---

### 03. Problem Analysis

#### Problem Statement
L'abondance de ressources pédagogiques (vidéos, tutoriels, IA génératives) crée une illusion de compétence (effet Dunning-Kruger) chez les apprenants, qui éludent les fondamentaux complexes pour se focaliser sur des spécialisations prématurées, menant à une incapacité à résoudre des problèmes concrets de manière autonome.

#### Root Causes
1. **Absence de contraintes d'accès** : L'apprenant consomme le contenu de manière non structurée sans valider les prérequis cognitifs indispensables.
2. **Priorisation de la vitesse sur la solidité** : Les plateformes favorisent la gratification immédiate (complétion de barres de progression) plutôt que la validation par l'échec constructif et la révision.
3. **Découplage de la pratique** : Les connaissances restent théoriques par manque de mécanismes imposant la production de preuves matérielles évaluées rigoureusement.

```text
Information pléthorique
   │
   ▼
Absence de contraintes pédagogiques
   │
   ▼
Consommation superficielle et dispersion
   │
   ▼
Illusion de maîtrise (Compétence fictive)
   │
   ▼
Inaptitude face à des cas réels (Déficit de compétence)
```

#### Existing Situation
* Les apprenants s'inscrivent à de multiples cours en ligne sans jamais les terminer.
* Les profils juniors maîtrisent des frameworks avancés (ex. Next.js, Flutter) sans comprendre les concepts de base (ex. protocoles HTTP, gestion de la mémoire, asynchronisme).
* Les organisations peinent à évaluer le niveau réel de leurs collaborateurs lors des recrutements ou des mobilités internes.

#### Consequences
* Perte de temps et d'investissements financiers pour les individus et les entreprises.
* Systèmes informatiques fragiles, mal conçus et difficiles à maintenir en production en raison du manque de compétences fondamentales des développeurs.
* Surcharge cognitive et découragement des apprenants face à la complexité non ordonnée.

#### Existing Alternatives
* **Roadmap.sh** : Décrit d'excellentes structures de connaissances ("Quoi apprendre"), mais n'accompagne pas l'apprenant dans l'exécution quotidienne ("Comment et dans quel ordre l'assimiler").
* **Gestionnaires de tâches (Trello, Notion)** : Offrent un suivi passif sans intelligence métier ni contrôle algorithmique des dépendances.
* **LMS traditionnels (Moodle, Udemy)** : Se limitent à héberger et délivrer du contenu de manière linéaire.

#### Improvement Opportunities
Créer un système qui unifie la structure de connaissances, le calendrier de l'apprenant, le calcul de sa discipline et la validation stricte par preuves sous la forme d'un **Moteur d'Organisation**.

---

### 04. Stakeholder Map

| Stakeholder | Role | Influence | Expectations | Risks |
| :--- | :--- | :--- | :--- | :--- |
| **Apprenant** | Acteur principal du parcours d'apprentissage. | Haute | Un parcours clair, motivant, des objectifs réalistes, une progression visible et valorisante. | Découragement face à la rigueur des pénalités ; abandon du système. |
| **Administrateur** | Configure les programmes et gère les utilisateurs. | Haute | Des outils de création simples, un suivi d'activité transparent, des indicateurs de progression fiables. | Complexité de modélisation des graphes de prérequis. |
| **Ingénieur Pédagogique** | Modélise les domaines de compétences (Blueprints). | Moyenne | Un formalisme rigoureux pour décrire les concepts, les sous-compétences et les critères de maîtrise. | Manque de flexibilité du modèle face à des disciplines non techniques. |
| **Responsable RH / Org** | Évalue l'impact du système sur la performance globale. | Moyenne | Un tableau de bord consolidé, des garanties de compétences réelles acquises par les équipes. | Perception du système comme trop directif ou stressant pour les salariés. |
| **Noyau Système (Automates)** | Moteurs exécutant les règles (discipline, progression). | Critique | Des règles déterministes, des flux d'événements stables, une traçabilité totale. | Effets de bord lors des recalculs de plannings en masse. |

---

### 05. Strategic Context

```text
      POLITIQUES (PESTEL)                            FORCES (SWOT)
┌────────────────────────────────────────┐     ┌────────────────────────────────────────┐
│ - Souveraineté numérique (Compétences) │     │ - Force : Modèle conceptuel rigoureux  │
│ - Régulations sur la formation pro.    │     │ - Faiblesse : Surcharge cognitive init.│
└────────────────────────────────────────┘     └────────────────────────────────────────┘
      ÉCONOMIQUES (PESTEL)                           FAIBLESSES (SWOT)
┌────────────────────────────────────────┐     ┌────────────────────────────────────────┐
│ - Coût élevé des recrutements ratés    │     │ - Opportunité : Intégration IA tutorat │
│ - Investissements dans l'upskilling   │     │ - Menace : Résistance à la contrainte  │
└────────────────────────────────────────┘     └────────────────────────────────────────┘
```

#### PESTEL Analysis
* **Politique** : Volonté des gouvernements de renforcer l'autonomie et la souveraineté technologique par des plans de formation d'envergure.
* **Économique** : Coût critique du déficit de compétences pour les entreprises. Les budgets de formation recherchent un retour sur investissement mesurable (ROI).
* **Social** : Mutation rapide des métiers. Besoin constant de reconversion et d'apprentissage continu tout au long de la vie professionnelle.
* **Technologique** : Démocratisation de l'IA comme assistant d'apprentissage, rendant obsolète la simple mémorisation et valorisant la capacité de résolution de problèmes.
* **Environnemental** : Transition vers des infrastructures de formation à distance plus sobres et efficaces.
* **Légal** : Conformité avec les référentiels nationaux de certification (ex. Qualiopi en France, certifications professionnelles d'État).

#### SWOT Analysis
* **Strengths (Forces)** : Modélisation mathématique de la progression ; concept novateur de "système de contraintes intelligentes" ; indépendance totale vis-à-vis du contenu pédagogique.
* **Weaknesses (Faiblesses)** : Courbe d'apprentissage initiale pour modéliser les domaines complexes ; sévérité du système pouvant repousser les utilisateurs habitués à la passivité.
* **Opportunities (Opportunités)** : Devenir le standard d'orchestration derrière les grands catalogues de cours mondiaux ; utiliser l'IA comme évaluateur de preuves de validation.
* **Threats (Menaces)** : Concurrence de solutions d'apprentissage "rapides et faciles" axées sur l'obtention de diplômes de complétion superficiels.

---

### 06. System Definition

#### Purpose
Le système LevelUP a pour but d'orchestrer, de planifier et de valider l'acquisition de compétences chez un individu en appliquant des contraintes déterministes basées sur un graphe de dépendance et un indicateur de discipline.

```text
┌─────────────────────────────────────────────────────────────────────────┐
│                          SYSTÈME LEVELUP                                │
│                                                                         │
│   [Intrants] ──► [Moteur Progression] ──► [Machine d'État] ──► [Extrants]│
│                        │                       ▲                        │
│                        ▼                       │                        │
│                  [Score Discipline] ───────────┘                        │
└─────────────────────────────────────────────────────────────────────────┘
```

#### Inputs
* **Blueprint du Domaine** : Graphe dirigé acyclique (DAG) définissant les sujets, ressources, exercices, prérequis et validations.
* **Profil Apprenant & Contraintes** : Temps disponible, cadence ciblée, niveau initial, domaine choisi.
* **Événements d'Exécution** : Lancement d'une séance, signalement d'interruption, déclaration de complétion, soumission de preuves.

#### Outputs
* **Trajectoire d'Apprentissage Personnalisée** : Calendrier dynamique ajusté.
* **Indicateurs de Discipline** : Score de discipline mis à jour, historique des pénalités appliquées.
* **Registre de Compétences** : États de validation, preuves de maîtrise stockées et auditables.

#### Actors
* **Apprenant** (Humain) : Exécute les séances et soumet ses validations.
* **Administrateur** (Humain) : Configure les programmes, valide manuellement certaines épreuves.
* **Orchestrateur Temporel / Cron Job** (Système) : Analyse chaque nuit le respect des échéances pour appliquer les pénalités et recalculer les trajectoires.

#### Interfaces
* **API de Services Métier** (Frontière applicative) : Expose les cas d'usage (Planification, Progression, Reprise, Validation).
* **Interface Utilisateur (UI)** : Dashboard apprenant orienté action ; dashboard administration orienté configuration des Blueprints.

#### Dependencies
* **Source de Temps FIable** : Indispensable pour le calcul des dépassements de délais et des fenêtres de révision.
* **Système de Fichiers / Stockage Objet** : Pour conserver les pièces jointes soumises comme preuves de validation.

#### Constraints
* **Immutabilité des Événements** : Toute pénalité, interruption ou validation doit être historisée dans un journal d'audit non modifiable.
* **Déterminisme Pédagogique** : Pour un état de progression et une action donnée, le résultat du déverrouillage ou du blocage d'un sujet doit être strictement reproductible et explicable.

#### System Boundary
Le système n'héberge pas les plateformes de code (ex. GitHub, serveurs de test), ne gère pas la visioconférence ou le streaming vidéo, et n'écrit pas de cours. Il s'arrête à la frontière de l'orchestration, du suivi d'exécution et de la validation des parcours.

---

### 07. Architecture Foundation

#### Vision (Target State)
Un moteur universel capable de piloter l'apprentissage de n'importe quelle discipline en s'appuyant sur un réseau décentralisé de *Blueprints de compétences*, garantissant la formation d'experts hautement qualifiés grâce à un cadre d'exécution rigoureux.

#### Mission
Fournir aux individus et aux organisations le cadre méthodologique et logiciel permettant de transformer des intentions d'apprentissage en compétences réelles démontrables.

#### Values
* **Discipline** : La progression pérenne est le fruit de la régularité et non de l'impulsion.
* **Rigueur (Vérité avant motivation)** : Le système ne masque pas les lacunes ; il refuse l'accès aux niveaux supérieurs tant que les bases ne sont pas consolidées.
* **Fondations d'abord** : La spécialisation tardive sur des bases solides prévaut sur l'acquisition hâtive de notions avancées.
* **Universalité** : Le moteur est abstrait de tout domaine d'étude spécifique (du code système à l'art lyrique).

#### Architectural Principles

##### 1. Domain-Driven & Decoupled Core
Le noyau de calcul des règles métier (progression, validation, discipline) est isolé de toute dépendance technologique (FastAPI, NestJS, Prisma) sous forme de fonctions pures et déterministes.

##### 2. Auditability & Traceability First
Toute transition d'état, application de pénalité ou validation doit être enregistrée dans un journal d'activité non modifiable, garantissant l'explicabilité de chaque décision du système.

##### 3. API-First & Modular Design
Le système est conçu comme un ensemble de modules logiques (Progression, Recommandation, Session, Discipline) communicant via des interfaces claires, permettant l'évolution indépendante des composants.

##### 4. Resilient Recovery
L'interruption d'un parcours est modélisée comme un état normal du cycle de vie de l'apprentissage. L'infrastructure doit être capable de figer un contexte d'interruption et d'orchestrer un protocole de reprise sans déstabiliser l'ensemble du planning historique.

#### Scope

##### In Scope
* Gestion et modélisation des domaines, sujets, prérequis et validations sous forme de graphes.
* Génération de plannings et calcul dynamique des calendriers.
* Calcul du score de discipline, application automatique de pénalités et gestion des sessions de reprise.
* Collecte et historisation des preuves de maîtrise.

##### Out of Scope
* Hébergement de cours interactifs ou d'environnements d'exécution de code (compilateurs, bacs à sable).
* Systèmes de paiement et d'abonnement.
* Gestion de communautés sociales ou de réseaux d'entraide (hors périmètre du MVP).

---

### 08. Capability Map

#### Level 1 Capabilities
1. **Curriculum Engineering** (Ingénierie des Parcours)
2. **Trajectory Orchestration** (Pilotage des Trajectoires)
3. **Mastery Validation** (Validation de la Maîtrise)
4. **Discipline Governance** (Gouvernance de la Discipline)
5. **System Traceability** (Traçabilité du Système)

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        LEVELUP BUSINESS CAPABILITIES                   │
├────────────────────────────────────────────────────────────────────────┤
│  1. Curriculum Eng.  2. Trajectory Orch.  3. Mastery Val.  4. Disp. Gov│
│  ┌────────────────┐  ┌─────────────────┐  ┌──────────────┐ ┌──────────┐│
│  │ - Domain Mgmt  │  │ - Session Lifecycle│ - Proof Coll.│ │ - Score  ││
│  │ - Topic Graph  │  │ - Scheduling    │  │ - Eval. Rules│ │ - Penalty││
│  │ - Resource Rel.│  │ - Recovery Mgmt │  │ - Mastery Lvl│ │ - Audit  ││
│  └────────────────┘  └─────────────────┘  └──────────────┘ └──────────┘│
└────────────────────────────────────────────────────────────────────────┘
```

#### Level 2 & 3 Capabilities

##### 1. Curriculum Engineering
* **Domain Management**
  * Créer, mettre à jour ou archiver un domaine de compétence.
  * Associer des métadonnées (durée estimée, objectifs, niveau de difficulté).
* **Prerequisite Graph Engine**
  * Modéliser le graphe orienté acyclique (DAG) des sujets.
  * Détecter les cycles d'interdépendance interdits lors de la modélisation.
  * Calculer l'état de verrouillage/déverrouillage d'un nœud du graphe.
* **Resource Linking**
  * Associer des ressources internes ou externes (documents, vidéos, exercices) à un sujet.
  * Qualifier les ressources (primaires vs. secondaires).

##### 2. Trajectory Orchestration
* **Session Lifecycle Management**
  * Créer une séance de travail planifiée.
  * Gérer les transitions d'état d'une séance (`planned` -> `active` -> `done` / `interrupted` / `missed`).
* **Dynamic Scheduling**
  * Générer un calendrier d'étude en fonction du profil de l'apprenant.
  * Recalculer automatiquement les dates cibles en cas de retard ou de pénalité.
* **Recovery Management**
  * Capturer un instantané du contexte lors d'une interruption.
  * Proposer un protocole de reprise (questionnaire de contexte, séances de rattrapage).

##### 3. Mastery Validation
* **Proof Collection**
  * Recevoir et stocker les livrables d'évaluation (fichiers, liens vers dépôts de code).
* **Evaluation Execution**
  * Soumettre la preuve à une validation (manuelle par l'administrateur ou automatisée).
* **Mastery Level Computation**
  * Déterminer le niveau de maîtrise d'un sujet (ex. non acquis, acquis, maîtrisé).
  * Déclencher la mise à jour des états du graphe de progression.

##### 4. Discipline Governance
* **Discipline Score Tracker**
  * Calculer et maintenir le score de discipline de l'apprenant en fonction de sa régularité.
* **Penalty Engine**
  * Analyser les manquements de planification.
  * Appliquer des sanctions (diminution du score, verrouillage temporaire de certains sujets).

##### 5. System Traceability
* **Audit Trail**
  * Journaliser chaque action administrative et d'apprentissage dans un log immuable.
* **Activity Reporting**
  * Exposer l'historique d'activité de l'apprenant à des fins d'analyse.

---

### 09. Product Discovery

#### Value Proposition
Pour les apprenants engagés dans des parcours d'ingénierie complexes, LevelUP offre un **cadre d'autoformation rigoureux et personnalisé** qui garantit l'assimilation des fondamentaux et l'acquisition de compétences réelles et démontrables, en éliminant la dispersion et l'illusion de maîtrise.

#### Personas
* **Thomas (L'Apprenant Autodidacte)** : Développeur junior voulant maîtriser la programmation système et le DevOps. Il se disperse souvent, saute les chapitres fondamentaux de gestion mémoire, et abandonne ses roadmaps après deux semaines.
* **Karine (L'Administratrice / Mentor)** : Formatrice dans une école d'ingénieurs. Elle a besoin de suivre précisément la progression de ses étudiants, d'évaluer la qualité de leurs livrables, et de s'assurer qu'aucun étudiant n'accède aux modules avancés sans maîtriser les bases.

#### User Journeys (Thomas)
1. **Sélection du Domaine** : Thomas choisit le Blueprint "Administration Système Linux".
2. **Initialisation** : Le système génère son calendrier selon ses contraintes (1h/jour). Seules les "Fondations" sont déverrouillées ; les sujets "Automation" et "Services" sont visibles mais verrouillés (`locked`).
3. **Étude et Pratique** : Thomas démarre sa séance quotidienne. À la fin, il fournit un script Bash et le rapport d'exécution comme preuve.
4. **Validation** : Karine valide la preuve. Le sujet passe à l'état `validated`. Les sujets dépendants passent automatiquement de `locked` à `available`.
5. **Manquement et Pénalité** : Thomas manque trois séances planifiées. Le job de nuit détecte le manquement. Son score de discipline chute, une pénalité est appliquée, verrouillant les nouveaux sujets et lui imposant un protocole de reprise (séance de consolidation obligatoire).

#### Success Metrics
* **Taux de complétion des programmes** : Pourcentage d'apprenants atteignant l'étape finale du parcours.
* **Rétention des utilisateurs** : Fréquence de connexion et respect des plannings (stabilité du score de discipline).
* **Qualité des compétences acquises** : Taux de réussite aux épreuves pratiques de validation finale.

---

### 10. Drivers

#### Strategic Drivers
* **Garantie de compétence** : L'exigence du marché pour des professionnels capables d'agir de manière autonome sur des infrastructures critiques.
* **Optimisation des coûts de formation** : Volonté de réduire le taux d'échec et d'abandon dans les cursus d'apprentissage.

#### Business Drivers
* **Universalisabilité** : Être capable d'intégrer des catalogues de domaines très variés sans modifier le code de l'application.
* **Crédibilité des certifications** : Faire en sorte qu'un badge ou niveau LevelUP possède une valeur réelle sur le marché de l'emploi grâce à la traçabilité des preuves.

#### Technical Drivers
* **Robustesse de l'Orchestration** : Nécessité d'exécuter des calculs temporels fiables pour des milliers d'apprenants simultanément lors des opérations de nuit.
* **Modularité et Maintenabilité** : Séparer strictement le moteur de règles pour simplifier le test unitaire des comportements décisionnels.

---

### 11. Constraints

* **Technologiques** : Aucun choix technologique ne doit être inscrit dans les modèles métier. La base de données et l'API doivent pouvoir être remplacées sans altérer les règles du moteur de progression.
* **Temporelles** : Le MVP doit être opérationnel rapidement pour valider le modèle pédagogique auprès d'un premier panel d'utilisateurs.
* **Compétences** : La modélisation des Blueprints nécessite une expertise en ingénierie pédagogique ; l'outil d'administration doit être accessible à des non-développeurs.
* **Réglementaires** : Respect du RGPD pour le stockage des données d'apprentissage des utilisateurs et la traçabilité de leurs activités.

---

### 12. Risks

| Risk Description | Category | Impact | Likelihood | Mitigation Strategy |
| :--- | :--- | :--- | :--- | :--- |
| **Rejet de la contrainte par les utilisateurs** | Business | Élevé | Moyenne | Introduire des boucles de feedback positives et des surcouches esthétiques valorisantes (RPG) sans compromettre la rigueur. |
| **Explosion de complexité du graphe de dépendance** | Technique | Moyen | Élevée | Limiter la profondeur des graphes dans la console d'administration et implémenter des tests de validation syntaxique lors de la création d'un Blueprint. |
| **Corruption ou perte de la traçabilité** | Technique | Élevé | Faible | Rendre la table du journal d'audit en lecture seule au niveau de la base de données (Append-Only) avec réplication. |
| **Désalignement entre validation et compétence réelle** | Pédagogique | Élevé | Moyenne | Exiger des livrables concrets (code, schémas) comme preuves de validation plutôt que des quiz à choix multiples. |

---

### 13. Assumptions

* **Disponibilité des validateurs** : On suppose qu'un processus (humain ou automatisé) est disponible pour évaluer les preuves de validation dans des délais raisonnables afin de ne pas bloquer l'apprenant.
* **Stabilité des concepts fondamentaux** : Les connaissances fondamentales d'un domaine technique (ex. les réseaux IP) évoluent lentement, ce qui garantit la durabilité des Blueprints créés.
* **Accès réseau régulier** : L'apprenant dispose d'un accès internet régulier pour synchroniser ses sessions de travail et valider ses étapes.

---

### 14. Scope

```text
┌────────────────────────────────────────────────────────┐
│                    SCOPE BOUNDARIES                    │
├───────────────────────────┬────────────────────────────┤
│         IN SCOPE          │        OUT OF SCOPE        │
├───────────────────────────┼────────────────────────────┤
│ - Engine State Machines   │ - Course Content Authoring │
│ - Target Competency DAGs  │ - Video Hosting & Steaming │
│ - Scheduling & Penalties  │ - Code Sandbox Execution   │
│ - Activity Logs (Audit)   │ - Peer-to-Peer Chat Rooms  │
└───────────────────────────┴────────────────────────────┘
```

---

### 15. Success Criteria

* **Déterminisme unitaire** : 100% des cas d'évaluation du graphe et du calcul de discipline doivent être couverts par des tests unitaires déterministes, garantissant l'absence d'effets de bord algorithmiques.
* **Indépendance Framework** : Possibilité de faire tourner le moteur de règles métier dans un script console simple sans lancer de serveur HTTP ni de base de données.
* **Vitesse de calcul** : Le recalcul d'une trajectoire après modification ou pénalité doit s'exécuter en moins de 100 millisecondes pour un utilisateur donné.

---

### 16. Architecture Readiness Assessment

#### Strategic & Business Readiness
Le besoin est clairement validé. Les documents stratégiques (`01-Core-Identity`, `02-Vision-Programe`, `03-Business-Motivation`) fixent une ligne directrice claire et partagée. Le modèle de capacités (Business Capability Model) est aligné avec les objectifs de rigueur et de discipline.

#### Technical Readiness
L'essai de développement existant (`levelUP_essaie_developpement`) démontre la faisabilité technique d'un MVP V1 (NestJS/Prisma/Redis). Toutefois, la transition vers une architecture industrielle nécessite d'extraire la logique métier des controleurs/services d'API pour la sanctuariser dans un noyau pur (`Core Engine`).

#### Conclusion
Le projet est **prêt** pour l'entrée formelle dans la Phase A de TOGAF. Les fondations conceptuelles sont solides, le périmètre est délimité, et les contraintes d'infrastructure sont identifiées.

---

### 17. TOGAF Phase A Preparation

La prochaine étape consiste à lancer la **Phase A (Architecture Vision)**, qui se concentrera sur :
1. **La validation des frontières du système** avec les parties prenantes.
2. **La rédaction des scénarios d'utilisation nominaux et dégradés** (cas limites d'interruption et de pénalités complexes).
3. **L'établissement formel des contrats d'interface (API)** pour détacher l'interface utilisateur du moteur de progression.
4. **La création de la structure documentaire technique définitive** au sein du répertoire d'ingénierie.
