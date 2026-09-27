# Workspace Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-WORKSPACE-001

---

# 1. Objet

Le **Workspace Context** est le Bounded Context de la couche Governance Layer responsable de la création, du partitionnement logique (sandboxing), de l'inscription des membres et du contrôle des quotas pour l'ensemble des espaces de travail (Workspaces) de la plateforme LevelUP.

Il constitue la structure de cloisonnement d'exécution opérationnelle au sein de la plateforme.

---

# 2. Mission

Fournir un mécanisme de partitionnement logique étanche des données d'exécution d'apprentissage en isolant les environnements (personnels, professionnels ou académiques) de chaque utilisateur tout en encadrant le partage des ressources de référence.

---

# 3. Position dans l'écosystème

Le Workspace Context appartient à la **Governance Layer**.

Il s'appuie sur le **Organization Context** (pour attribuer des espaces partagés à des structures d'entreprises) et collabore avec l'ensemble des contextes opérationnels de l'**Execution Layer** (qui doivent associer chaque donnée d'activité, de programme ou d'évaluation à un `WorkspaceId` valide).

---

# 4. Vision métier

Un utilisateur de LevelUP peut avoir plusieurs vies d'apprentissage. Il peut étudier le piano dans son espace personnel, s'entraîner à Linux dans l'espace de travail de son université et suivre des formations internes sur le cloud dans l'espace de travail de son employeur. 

Fidèle à notre principe d'universalité et de rigueur, le Workspace Context assure :
1.  **L'étanchéité des parcours (Sandboxing) :** La progression, les routines et les échecs d'un apprenant dans son espace personnel ne sont pas visibles par son employeur. Chaque espace est une cloison étanche.
2.  **La contextualisation des ressources :** Un espace de travail peut importer des modèles de compétences officiels ou restreindre l'accès à un catalogue interne d'activités.
3.  **La gouvernance des ressources (Quotas) :** Les espaces de travail professionnels ou scolaires sont encadrés par des limites d'utilisation (stockage, membres, volumes d'activités).

---

# 5. Responsabilités

Le Workspace Context est responsable de :

*   gérer le cycle de vie des espaces de travail (`Workspaces`) ;
*   gérer les relations d'inscription des utilisateurs à un espace (`Workspace Enrollments`) ;
*   attribuer et contrôler les limites de ressources allouées à un espace (`Workspace Quotas`) ;
*   gérer les imports de ressources pédagogiques autorisées dans l'espace (`Resource References`) ;
*   suivre la session d'espace de travail active de l'utilisateur (`Active Workspace Sessions`).

Il n'est jamais responsable :
*   d'héberger les données nominatives des comptes utilisateurs (responsabilité du `Identity Context`) ;
*   de gérer la planification d'un programme individuel (responsabilité du `Program Context`).

---

# 6. Ubiquitous Language

## Workspace
Partition logique étanche de la plateforme regroupant un ensemble de membres, de ressources et de données d'exécution d'apprentissage.
*   *Personal Workspace :* Espace privé d'un apprenant.
*   *Shared Workspace :* Espace d'une organisation (école, entreprise) regroupant des promotions ou des équipes.
*   *Community Workspace :* Espace public ou de guilde géré par la communauté.

## Workspace Enrollment
Contrat d'accès rattachant un utilisateur à un espace de travail pour une période donnée.

## Workspace Quota
Spécification des limites techniques et d'usage de l'espace (ex: nombre maximum de membres, espace de stockage média max, nombre de programmes actifs maximum).

## Active Workspace Session
Espace de travail sélectionné par l'utilisateur comme contexte d'affichage et d'exécution pour sa session de navigation courante.

## Resource Reference
Référence vers une compétence, un parcours ou une ressource documentaire importée et disponible au sein du Workspace.

---

# 7. Modèle métier

```text
Utilisateur ──► sélectionne ──► [ Active Workspace Session ]
                                         │
                                         ▼
                                   [ Workspace ] (Cloisonnement)
                                         │
                         ├── gère ──► Workspace Type (Personal, Shared, Community)
                         ├── gère ──► Workspace Enrollments
                         ├── gère ──► Workspace Quotas
                         └── gère ──► Resource References
```

---

# 8. Principes métier

## Principe 1 — Isolation absolue de l'exécution
Aucun événement issu de l'Execution Layer (ex: `ActivityCompleted`, `MasteryImproved`) ne peut circuler en dehors du `WorkspaceId` dans lequel l'activité s'est déroulée.

## Principe 2 — Workspace personnel gratuit et inviolable
Chaque utilisateur dispose d'un espace personnel par défaut, immuable et confidentiel, indépendant de toute organisation.

## Principe 3 — Partage de modèles en lecture seule
Les modèles de compétences (`Reference Models`) importés dans un espace de travail partagé sont utilisables en lecture seule ; aucune modification locale ne peut altérer le modèle global.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **Workspace :** Racine d'agrégat modélisant l'espace de travail, ses règles de type, ses quotas, ses importations de ressources et ses membres inscrits.

## 9.2 Entités
*   **WorkspaceEnrollment :** Fiche d'inscription d'un membre à l'espace.
*   **WorkspaceQuota :** Configuration des seuils d'utilisation.

## 9.3 Value Objects
*   **WorkspaceId / EnrollmentId :** Identifiants uniques.
*   **WorkspaceType :** Types d'espaces (`Personal`, `Shared`, `Community`).
*   **ResourceReference :** URN de ressource importée.

## 9.4 Domain Services
*   **WorkspaceProvisioner :** Service configurant l'infrastructure initiale de l'espace de travail (initialisation du dossier de Portfolio, configurations d'alertes par défaut).
*   **QuotaChecker :** Service validant le respect des contraintes d'usage lors d'actions critiques (ex: refus d'inscription d'un nouveau membre si le quota est dépassé).

## 9.5 Domain Events
*   **WorkspaceCreated :** Initialisation d'un espace de travail.
*   **MemberEnrolled :** Inscription d'un utilisateur au workspace.
*   **MemberDisenrolled :** Désinscription d'un membre.
*   **WorkspaceQuotaUpdated :** Modification des seuils autorisés.
*   **ResourceImported :** Importation réussie d'un modèle dans l'espace.
*   **WorkspaceArchived :** Fermeture logique de l'espace de travail.

---

# 10. Invariants

1.  Un utilisateur ne peut pas disposer d'une `ActiveWorkspaceSession` sur un espace de travail s'il ne possède pas de `WorkspaceEnrollment` actif pour cet espace.
2.  Un espace de travail de type `Personal` ne peut comporter qu'un seul et unique membre inscrit (son propriétaire).
3.  Toute ressource opérationnelle créée au sein d'un workspace doit hériter de son identifiant (`WorkspaceId`) comme métadonnée obligatoire.

---

# 11. Relations avec les autres Bounded Contexts

*   **Organization Context :** Fournit les entités d'organisations pour initier et lier les `Shared Workspaces` associés.
*   **Identity Context :** Fournit les comptes d'utilisateurs éligibles aux inscriptions.
*   **Execution Layer Contexts (Program, Activity, Progress, Assessment) :** Lisent le `WorkspaceId` pour filtrer, sand boxer et enregistrer l'ensemble des données opérationnelles de l'apprenant.

---

# 12. Décisions architecturales

Le Workspace Context matérialise le cloisonnement logique de LevelUP. Selon le niveau de sécurité et de conformité requis, ce partitionnement peut être implémenté via des bases de données partagées avec filtrage par colonne (`Tenant Isolation`), ou par le biais de bases de données physiques distinctes par Workspace, instanciées via le `WorkspaceProvisioner`.
