# Organization Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-ORGANIZATION-001

---

# 1. Objet

Le **Organization Context** (à ne pas confondre avec le *Program Context* qui gère la planification des parcours apprenants) est le Bounded Context de la couche Governance Layer responsable de la structuration administrative et hiérarchique des organisations utilisatrices de LevelUP (entreprises, établissements scolaires, équipes, départements, promotions).

Il modélise les notions de rattachement institutionnel, les rôles administratifs de haut niveau et les promotions d'apprenants (cohortes).

---

# 2. Mission

Fournir un cadre d'organisation multi-tenant permettant de modéliser les hiérarchies d'entreprises ou d'universités partenaires, d'encadrer l'adhésion des utilisateurs aux structures et d'isoler les données d'apprentissage selon les frontières juridiques ou éducatives.

---

# 3. Position dans l'écosystème

Le Organization Context appartient à la **Governance Layer**.

Il collabore avec le **Identity Context** (qui lui fournit les comptes utilisateurs authentifiés) et sert de base de structuration au **Workspace Context** (pour allouer des espaces de travail dédiés aux organisations ou aux promotions).

---

# 4. Vision métier

L'apprentissage peut s'inscrire dans un contexte collectif ou corporate. Une entreprise souhaite guider la montée en compétences de ses départements ; une école souhaite structurer ses classes d'élèves. Afin de répondre à ces besoins complexes sans violer notre valeur d'universalité et de rigueur, le Organization Context applique les principes suivants :
1.  **Strict cloisonnement organisationnel :** Les données d'une organisation sont isolées logiquement. Une entreprise tierce ne peut en aucun cas observer la progression des membres d'une autre structure.
2.  **Rôles administratifs clairs :** Les rôles au sein de l'organisation (Manager, Administrateur, Professeur, Élève) qualifient le rattachement administratif et ne se substituent pas aux droits dynamiques portés par le contexte d'autorisation.
3.  **Apprentissage par Cohorte :** Le regroupement des apprenants par promotions (cohortes) permet d'optimiser l'allocation des tuteurs et de faciliter le suivi d'objectifs partagés.

---

# 5. Responsabilités

Le Organization Context est responsable de :

*   gérer les entités supérieures d'organisation (`Organizations`) ;
*   structurer les sous-structures internes (`Organizational Units` : départements, filiales, classes) ;
*   gérer les relations d'adhésion et de rattachement (`Memberships`) des comptes aux organisations ;
*   attribuer les rôles administratifs de structure (`Organization Roles`) ;
*   structurer les groupes d'apprenants par promotions (`Cohorts`).

Il n'est jamais responsable :
*   d'évaluer ou de modifier la progression des apprenants (responsabilité du `Progress Context`) ;
*   de gérer les politiques de sécurité fines d'accès aux fichiers ou API (responsabilité du `Authorization Context`).

---

# 6. Ubiquitous Language

## Organization
Entité administrative ou juridique supérieure exploitant LevelUP (ex: une société, une école d'ingénieurs).

## Organizational Unit
Division interne à une organisation représentant une équipe, un département fonctionnel ou une classe physique d'apprentissage.

## Membership
Contrat de rattachement associant un compte d'utilisateur (`AccountId`) à une `Organization` ou à une `OrganizationalUnit`.

## Organization Role
Rôle attribué à un membre qualifiant son autorité administrative (ex: `Owner`, `Administrator`, `Manager`, `Educator`, `Member`).

## Cohort (Promotion)
Regroupement temporel d'apprenants au sein d'une organisation poursuivant simultanément des objectifs ou parcours de compétences similaires (ex: Promotion Flutter 2026).

---

# 7. Modèle métier

```text
Identity Context (Account) ──► s'associe ──┐
                                            ▼
                                     [ Organization ]
                                            │
                                ├── gère ──► Organizational Units (Hiérarchie)
                                ├── gère ──► Memberships (Rattachement)
                                ├── gère ──► Organization Roles
                                └── gère ──► Cohorts (Promotions)
```

---

# 8. Principes métier

## Principe 1 — Pas de hiérarchie cyclique
Une unité d'organisation (`OrganizationalUnit`) ne peut pas être sa propre unité parente, ni directement, ni par héritage de dépendances.

## Principe 2 — Autorité déléguée
L'administrateur d'une organisation parente détient l'autorité de gestion sur l'ensemble des sous-unités et des cohortes rattachées, tandis qu'un manager de sous-unité n'a d'autorité que locale.

## Principe 3 — Propriété du Workspace
Toute organisation a le droit de posséder un ou plusieurs espaces de travail (`Workspaces`) partagés pour ses membres, qu'elle finance ou administre.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **Organization :** Racine d'agrégat modélisant la structure administrative supérieure, l'arbre de ses unités et l'ensemble de ses adhésions et cohortes.

## 9.2 Entités
*   **OrganizationalUnit :** Unité divisionnaire de l'arbre d'organisation.
*   **Membership :** Fiche d'adhésion d'un utilisateur à la structure.
*   **Cohort :** Promotion d'apprenants.

## 9.3 Value Objects
*   **OrganizationId / UnitId / CohortId :** Identifiants URN ou UUID uniques.
*   **OrganizationRoleType :** Valeurs de rôles d'organisation (`Owner`, `Admin`, `Educator`, `Manager`, `Member`).
*   **HierarchyPath :** Chemin matérialisant la position d'une unité dans l'arbre hiérarchique.

## 9.4 Domain Services
*   **HierarchyManager :** Service garantissant l'absence de cycles et validant les déplacements de nœuds dans la structure hiérarchique.
*   **MembershipValidator :** Service auditant la conformité des adhésions (ex: vérification des quotas d'utilisateurs souscrits).

## 9.5 Domain Events
*   **OrganizationCreated :** Enregistrement d'une nouvelle structure.
*   **OrganizationalUnitAdded :** Ajout d'une équipe ou d'une division.
*   **MembershipAssigned :** Rattachement d'un utilisateur à l'organisation ou à une unité.
*   **CohortFormed :** Création d'une nouvelle promotion d'apprenants.
*   **MembershipRevoked :** Retrait d'un membre de la structure.

---

# 10. Invariants

1.  Une unité d'organisation ne peut avoir qu'un seul parent direct (structure en arbre strict).
2.  Un utilisateur ne peut disposer d'un rôle d'administration (`Owner` ou `Admin`) sur une sous-unité que s'il est membre actif de l'organisation racine.
3.  Une cohorte (`Cohort`) doit être rattachée à une organisation ou unité d'organisation existante.

---

# 11. Relations avec les autres Bounded Contexts

*   **Workspace Context :** Utilise les structures d'organisation et de cohortes pour allouer et configurer les espaces de travail partagés correspondants.
*   **Identity Context :** Fournit les comptes d'utilisateurs éligibles à l'adhésion.
*   **Authorization Context :** Lit les rôles administratifs de l'organisation pour en déduire les permissions logicielles d'administration d'écoles ou d'entreprises.

---

# 12. Décisions architecturales

Le Organization Context gère la structure administrative de multi-tenancy. Les arbres hiérarchiques et les adhésions sont stockés localement dans sa base de données dédiée pour assurer un cloisonnement hermétique au niveau logique ou physique (schémas de base de données séparés).
