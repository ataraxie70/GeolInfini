# Versioning Shared Kernel Specification

**Version :** 1.0 (Draft)

**Statut :** Shared Kernel

**Catégorie :** Architecture Foundation

**Code :** LEVELUP-SK-VERSIONING-001

---

# 1. Objet

Le **Versioning Shared Kernel** définit les principes, les règles sémantiques et les contrats régissant la gestion des versions de l'ensemble des modèles de référence et des données opérationnelles de LevelUP.

Il fournit un cadre de versionnement unifié permettant d'assurer la compatibilité ascendante, de gérer les cycles de vie des compétences et d'encadrer les stratégies de migration des apprenants lors de l'évolution du référentiel.

---

# 2. Mission

Garantir que le patrimoine intellectuel de LevelUP (compétences, parcours, évaluations) puisse évoluer en continu sans perturber, interrompre ou corrompre la progression en cours des apprenants dans leur espace personnel (Execution Layer).

---

# 3. Vision architecturale

Le principe d'amélioration continue est au cœur de LevelUP (RMEF). Les compétences et parcours d'apprentissage ne sont pas figés. Cependant, la progression d'un utilisateur repose sur la régularité et la confiance. Modifier brutalement les objectifs pédagogiques en cours de route violerait le principe de rigueur.

Pour résoudre cette tension, l'architecture sépare :
1.  **Le Référentiel Officiel (immuable par version) :** Chaque publication de modèle est identifiée par une version immuable.
2.  **L'Espace Apprenant (adaptatif) :** Un programme en cours est lié à une version spécifique et ne subit les mises à jour qu'en fonction de règles de compatibilité explicites.

---

# 4. Principes de Versionnement Sémantique (Model SemVer)

LevelUP applique une déclinaison du versionnement sémantique (SemVer 2.0.0) adaptée aux modèles d'apprentissage :

```text
Format : [Majeur].[Mineur].[Correctif] (ex: 2.1.4)
```

### 4.1 Correctif (Patch - Z)
*   **Définition :** Correction de coquilles, reformulations mineures, ajouts de ressources documentaires d'illustration sans modification conceptuelle.
*   **Impact :** Entièrement rétrocompatible.
*   **Stratégie de mise à niveau :** Appliquée automatiquement et de manière transparente sur tous les programmes actifs des apprenants.

### 4.2 Mineur (Minor - Y)
*   **Définition :** Ajout de notions facultatives, d'objectifs optionnels, de nouvelles stratégies d'apprentissage ou de validations alternatives dans un parcours.
*   **Impact :** Rétrocompatible.
*   **Stratégie de mise à niveau :** Optionnelle. L'apprenant reçoit une notification lui proposant d'adopter la nouvelle structure sans perte de progression.

### 4.3 Majeur (Major - X)
*   **Définition :** Ajout ou suppression de compétences fondations obligatoires, restructuration complète des prérequis, modification des critères de validation finaux.
*   **Impact :** Non rétrocompatible (Breaking Change).
*   **Stratégie de mise à niveau :** L'apprenant conserve son programme sur l'ancienne version (marquée comme `Deprecated`). Une migration assistée avec recalcul des équivalences de compétences acquises lui est proposée s'il souhaite passer à la version majeure suivante.

---

# 5. Cycle de vie d'un Modèle de Référence

Chaque version publiée d'un modèle (Reference Model, Learning Blueprint) progresse à travers les statuts suivants :

```text
Draft ➔ Prototype ➔ Experimental ➔ Validated ➔ Recommended ➔ Deprecated ➔ Archived
```

*   **Draft (Brouillon) :** En cours de rédaction initiale dans le Competency ou Learning Context. Non visible par les apprenants.
*   **Prototype / Experimental :** Publié pour expérimentation auprès d'un panel d'utilisateurs restreint.
*   **Validated / Recommended :** Version stable officielle de LevelUP conseillée pour tout nouvel apprentissage.
*   **Deprecated (Déprécié) :** Remplacé par une version plus récente. Les nouveaux programmes ne peuvent plus s'inscrire sur cette version, mais les programmes en cours continuent de s'exécuter.
*   **Archived (Archivé) :** Retiré du système. Plus aucune exécution n'est autorisée.

---

# 6. Contrats d'Échange de Version

Tout contrat d'événement ou d'intégration décrivant une mise à jour de version doit contenir la structure commune suivante :

```text
VersionPayload
│
├── ModelIdentifier (UUID)
├── FormerVersion (SemVer String)
├── NewVersion (SemVer String)
├── ChangeType (Enum: PATCH, MINOR, MAJOR)
├── DeprecationDate (Timestamp, Optionnel)
└── MigrationMapping (Map de clés-valeurs pour la transition des acquis)
```

---

# 7. Invariants du Versionnement

Le Versioning Shared Kernel garantit les invariants suivants :

1.  Une version publiée sous le statut `Validated` ou `Recommended` est **immuable**. Toute modification physique de son contenu entraîne l'incrémentation de la version.
2.  Un programme personnel actif (`Active`) doit toujours être rattaché à une version de référence existante et non archivée.
3.  Le passage d'un programme personnel à une nouvelle version majeure requiert toujours le consentement explicite de l'apprenant.

---

# 8. Décisions architecturales

Le Versioning Shared Kernel protège la stabilité de l'expérience utilisateur tout en permettant au référentiel de s'améliorer en continu. 

Le calcul automatique des équivalences lors des changements majeurs relève de la responsabilité conjointe du **Competency Context** (pour les correspondances de compétences) et du **Learning Context** (pour le recalcul de la progression).
