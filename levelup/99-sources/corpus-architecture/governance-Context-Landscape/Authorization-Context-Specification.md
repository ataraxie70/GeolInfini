# Authorization Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-AUTHORIZATION-001

---

# 1. Objet

Le **Authorization Context** est le Bounded Context de la couche Governance Layer responsable du contrôle d'accès aux ressources, de l'évaluation dynamique des droits (RBAC/ABAC) et de la sécurisation des appels d'API et des traitements de la plateforme LevelUP.

Il garantit que chaque acteur n'exécute que les actions pour lesquelles il possède une autorisation légitime explicite.

---

# 2. Mission

Fournir un moteur de sécurité et d'autorisation centralisé, performant et granulaire capable de valider en temps réel les requêtes d'accès à n'importe quelle ressource (modèles, programmes, activités, évaluations) en appliquant le principe du privilège minimal.

---

# 3. Position dans l'écosystème

Le Authorization Context appartient à la **Governance Layer**.

Il intercepte (via des intergiciels ou Policy Enforcement Points) l'ensemble des requêtes d'accès en provenance de l'interface utilisateur ou des API inter-contextes, et utilise l'identité authentifiée fournie par le **Identity Context** pour prendre ses décisions d'autorisation.

---

# 4. Vision métier

La rigueur de LevelUP s'applique également à la gestion des droits d'accès. La confiance accordée aux validations de compétences de notre écosystème repose sur la certitude absolue que seuls les évaluateurs habilités et qualifiés peuvent certifier un acquis. Le Authorization Context matérialise cette confiance en appliquant les règles suivantes :
1.  **Refus par défaut (Deny by Default) :** Tout accès ou action non explicitement autorisé par une règle est rejeté.
2.  **Rôles distincts et étanches :** Les droits d'un Concepteur Pédagogique (écrire des modèles), d'un Évaluateur (valider des compétences) et d'un Apprenant (compléter des activités) sont rigoureusement isolés.
3.  **Contrôle contextuel dynamique (ABAC) :** L'évaluation d'un droit prend en compte le contexte (l'espace de travail `WorkspaceId`, la relation d'adhésion `Membership` et le statut de la ressource).

---

# 5. Responsabilités

Le Authorization Context est responsable de :

*   gérer les attributions de rôles applicatifs aux utilisateurs (`Role Assignments`) ;
*   gérer les règles d'autorisation et les permissions associées (`Access Policies`) ;
*   évaluer les demandes d'accès en combinant les rôles et les attributs du contexte (Policy Decision Point) ;
*   fournir les intercepteurs pour appliquer les décisions d'accès (Policy Enforcement Point) ;
*   enregistrer les violations d'accès et tentatives non autorisées.

Il n'est jamais responsable :
*   de vérifier l'identité de l'utilisateur (responsabilité du `Identity Context`) ;
*   d'auditer l'historique d'accès global (responsabilité du `Audit Context`).

---

# 6. Ubiquitous Language

## Access Policy
Règle logique formalisant les conditions nécessaires pour autoriser une action spécifique sur une ressource (ex: *"Seul l'évaluateur rattaché à la cohorte C peut valider la compétence K"*).

## Role
Regroupement de permissions correspondant à un profil d'acteur (ex: `SystemAdmin`, `WorkspaceAdmin`, `Educator`, `Learner`, `Observer`).

## Permission
Capacité d'action unitaire et ciblée sur une ressource ou une catégorie de ressources (ex: `read:competency`, `write:assessment`, `execute:activity`).

## Authorization Decision
Décision finale binaire (`Allow` ou `Deny`) rendue par le moteur à la suite de l'analyse d'une demande d'accès.

## Evaluation Context
Ensemble d'attributs dynamiques fournis lors de la requête (adresse IP, heure, `WorkspaceId` ciblé, identifiant de l'objet ciblé).

---

# 7. Modèle métier

```text
Requête d'action (ex: valider une compétence K)
                      │
                      ▼
        [ Policy Enforcement Point (PEP) ] ➔ Intercepte
                      │
                      ▼
        [ Policy Decision Point (PDP) ] ➔ Évalue
                      │
                      ├── consulte ──► Access Policies (Règles)
                      ├── consulte ──► Role Assignments (Rôle de l'acteur)
                      ├── consulte ──► Evaluation Context (WorkspaceId, Ressource K)
                      │
                      ▼
           [ Authorization Decision ]
                      │
          ┌───────────┴───────────┐
          ▼                       ▼
      [ Allow ]                [ Deny ]
(Action autorisée)    (Action rejetée ➔ Log de violation)
```

---

# 8. Principes métier

## Principe 1 — Deny by Default
Aucune action n'est permise si aucune politique d'accès (`AccessPolicy`) ne l'autorise explicitement.

## Principe 2 — Isolation par Workspace
Un rôle ou une permission accordé au sein d'un espace de travail (`WorkspaceId`) n'a aucune valeur en dehors de ce espace de travail. Les privilèges ne débordent jamais des frontières du sandbox logique.

## Principe 3 — Séparation des pouvoirs d'évaluation
L'apprenant ne peut en aucun cas se voir attribuer des droits de modification ou de validation sur ses propres évaluations (`Assessment`) ou dossiers de preuves (`Evidence Sets`).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **AccessPolicy :** Racine d'agrégat modélisant une règle de sécurité, ses rôles cibles, ses permissions et ses conditions ABAC.
*   **RoleAssignment :** Racine d'agrégat matérialisant l'attribution d'un rôle à un `AccountId` / `LearnerId` au sein d'un périmètre (`WorkspaceId`).

## 9.2 Entités
*   **Permission :** Définition unitaire d'une action autorisée.

## 9.3 Value Objects
*   **PolicyId / AssignmentId :** Identifiants uniques.
*   **ActionType :** Actions binaires (`Create`, `Read`, `Update`, `Delete`, `Execute`, `Validate`).
*   **Decision :** Décisions d'accès (`Allow`, `Deny`).
*   **ResourceUrn :** Référence de la ressource visée.

## 9.4 Domain Services
*   **PolicyDecisionPoint (PDP) :** Moteur d'évaluation combinant rôles, attributs de ressources et contextes pour rendre la décision d'autorisation.
*   **AccessEvaluator :** Service simplifiant l'évaluation à chaud des permissions pour le code applicatif.

## 9.5 Domain Events
*   **RoleAssigned :** Attribution d'un privilège à un utilisateur.
*   **RoleRevoked :** Retrait d'un privilège.
*   **AccessPolicyUpdated :** Modification d'une politique d'accès.
*   **UnauthorizedAccessAttempted :** Tentative de violation d'accès bloquée par le système.

---

# 10. Invariants

1.  Un `RoleAssignment` doit obligatoirement être associé à un `AccountId` / `LearnerId` existant et à un `WorkspaceId` (sauf rôles système globaux).
2.  Une décision d'accès doit être rendue et évaluée avant l'exécution physique de toute commande dans l'écosystème LevelUP.
3.  La permission d'écriture sur un enregistrement d'évaluation (`write:assessment`) ne peut être allouée qu'à des acteurs portant le rôle `Educator` ou `SystemAdmin` dans l'espace concerné.

---

# 11. Relations avec les autres Bounded Contexts

*   **Identity Context :** Fournit les sessions de connexion actives et les identifiants de comptes pour valider la provenance de la requête.
*   **Workspace Context :** Fournit l'état d'inscription des membres pour évaluer la validité du périmètre du workspace demandé.
*   **Audit Context :** Reçoit les logs de violations et d'accès refusés pour la conformité et la sécurité.

---

# 12. Décisions architecturales

Le Authorization Context est implémenté en utilisant des moteurs de politiques déclaratifs standardisés (comme Open Policy Agent - OPA) ou des modèles d'autorisation d'API (comme Casbin ou OAuth2 scopes). 

Le moteur de décision (PDP) est découplé des points d'application (PEP) qui s'insèrent sous forme de filtres (middlewares) à l'entrée de chaque API de Bounded Context.
