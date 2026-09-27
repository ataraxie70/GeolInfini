# Data Architecture — Graphe de Crédibilité

Ce document définit la structure des données du système. L'objectif est d'implémenter le "Graphe de Crédibilité" défini en Phase A, en assurant la traçabilité entre une affirmation de compétence et sa preuve technique.

## 1. Modèle Conceptuel des Données (MCD)

Le système ne repose pas sur une structure linéaire, mais sur un réseau de relations sémantiques.

### A. Entités et Attributs

#### 1. Profile (L'Identité)
*L'entité racine du système.*
- `id` : UUID (PK)
- `full_name` : String
- `professional_title` : String
- `bio_short` : Text (Pour l'accueil)
- `bio_long` : Text (Pour la page À propos)
- `vision_statement` : Text
- `core_values` : List\<String\>
- `social_links` : Map\<Platform, URL\>
- `updated_at` : DateTime

#### 2. Competency (La Capacité)
*L'unité de mesure du savoir-faire.*
- `id` : UUID (PK)
- la `name` : String (ex: "Architecture Microservices")
- `description` : Text
- `level` : Enum (Learning, Proficient, Expert)
- `category_id` : UUID (FK $\rightarrow$ Category)
- `updated_at` : DateTime

#### 3. Project (L'Instance de Preuve)
*L'application concrète d'une compétence.*
- `id` : UUID (PK)
- `title` : String
- `context` : Text (Le "Quoi" et le "Où")
- `problem_statement` : Text (Le défi technique)
- `solution_description` : Text (L'approche adoptée)
- `role` : String (Le rôle exact joué)
- `status` : Enum (InProgress, Completed, Archived)
- `start_date` : Date
- `end_date` : Date (Optionnel)
- `featured` : Boolean (Pour mise en avant accueil)
- `updated_at` : DateTime

#### 4. Proof (L'Ancrage Externe)
*La source de vérité tierce.*
- `id` : UUID (PK)
- `project_id` : UUID (FK $\rightarrow$ Project)
- `type` : Enum (GitHub, LiveDemo, CaseStudy, Certification)
- `url` : String (L'URL exacte)
- `label` : String (ex: "Code source du module d'authentification")
- `verification_status` : Enum (Valid, Broken, Pending)
- `created_at` : DateTime

#### 5. Article (Le Raisonnement)
*La couche narrative qui explique la démarche.*
- `id` : UUID (PK)
- `title` : String
- `content` : RichText / Markdown
- `type` : Enum (Retrospective, Tutorial, Analysis, Note)
- `published_at` : DateTime
- `project_id` : UUID (FK $\rightarrow$ Project, Optionnel)
- `updated_at` : DateTime

#### 6. Category & Tag (L'Organisation)
- **Category :** `id`, `name`, `description`. (Hiérarchie fixe)
- **Tag :** `id`, `name`. (Nuage flexible)

## 2. Matrice des Relations (Le Graphe)

| Relation | Type | Description | Objectif Business |
| :--- | :--- | :--- | :--- |
| **Category $\rightarrow$ Competency** | $1:N$ | Une catégorie regroupe plusieurs compétences. | Organisation taxonomique. |
| **Competency $\leftrightarrow$ Project** | $N:M$ | Une compétence est prouvée par plusieurs projets, et un projet peut prouver plusieurs compétences. | **Cœur du Graphe de Crédibilité.** |
| **Project $\rightarrow$ Proof** | $1:N$ | Un projet possède une ou plusieurs preuves externes. | Garantie de vérifiabilité (BR-02). |
| **Project $\rightarrow$ Article** | $1:N$ | Un projet peut donner lieu à plusieurs rétrospectives. | Transformation de la preuve en narration. |
| **Project/Article $\leftrightarrow$ Tag** | $N:M$ | Liens transversaux via des étiquettes. | Navigation facilitée et découverte. |

## 3. Stratégie de Flux de Données

### A. Cycle de Vie d'une Preuve
`Capture (Admin)` $\rightarrow$ `Liaison à Projet` $\rightarrow$ `Liaison à Compétence` $\rightarrow$ `Vérification du lien` $\rightarrow$ `Exposition Publique`.

### B. Optimisation pour le "Time-to-Proof" (BR-01)
Pour garantir un accès en $< 30s$, le modèle de données doit permettre :
1. Une requête directe : `GET /competency/{id}` $\rightarrow$ Jointure $\rightarrow$ `Project` $\rightarrow$ `Proof`.
2. Un indexage efficace des compétences et des projets "Featured".

## 4. Considérations sur le Stockage
Bien que le choix technologique soit réservé à la Phase D, le modèle impose :
- Un support pour les **relations Many-to-Many** (indispensable pour le graphe).
- Un support pour le **contenu riche** (Markdown pour les articles et descriptions).
- Une structure permettant le **versionnage** ou la mise à jour atomique pour respecter le principe de *Minimal Maintenance*.
