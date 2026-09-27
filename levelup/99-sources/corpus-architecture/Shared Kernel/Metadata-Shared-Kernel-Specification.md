# Metadata Shared Kernel Specification

**Version :** 1.0 (Draft)

**Statut :** Shared Kernel

**Catégorie :** Architecture Foundation

**Code :** LEVELUP-SK-METADATA-001

---

# 1. Objet

Le **Metadata Shared Kernel** définit le modèle universel et normalisé de représentation des métadonnées au sein de l'architecture LevelUP.

Il fournit les structures communes de données, les Value Objects et les contrats nécessaires pour assurer la traçabilité, l'auditabilité, le cloisonnement des espaces de travail (multi-tenancy) et la gestion du cycle de vie de tous les agrégats et entités de la plateforme.

---

# 2. Mission

Fournir un cadre structurel partagé permettant à chaque Bounded Context d'enrichir ses modèles internes et ses événements d'intégration avec des métadonnées standardisées, cohérentes et exploitables par les services transverses (comme l'Analytics, l'Audit ou la Gouvernance).

---

# 3. Vision architecturale

Dans un écosystème d'apprentissage modulaire et découplé, les données transitent à travers plusieurs contextes (de la conception pédagogique à l'évaluation, puis au portfolio). Pour garantir l'intégrité globale du système sans créer de couplage fort entre les domaines :

1.  Chaque entité ou événement doit être auto-documenté.
2.  Les métadonnées doivent être normalisées à l'aide d'un schéma universel.
3.  La traçabilité et le cloisonnement de la donnée doivent être portés nativement par les structures fondamentales.

Le Metadata Shared Kernel matérialise ce socle commun de confiance et d'observabilité.

---

# 4. Principes fondateurs

## Principe 1 — Immutabilité des métadonnées d'audit
Les métadonnées de création (`CreatedAt`, `CreatedBy`) sont définies à l'initialisation de l'objet et ne doivent plus jamais être altérées.

## Principe 2 — Cloisonnement obligatoire (Multi-tenancy)
Tout objet personnel ou opérationnel doit être rattaché à un espace de travail (`WorkspaceId`) afin d'assurer l'isolation stricte des données entre organisations ou utilisateurs.

## Principe 3 — Traçabilité asynchrone
Tous les échanges événementiels doivent intégrer les identifiants de corrélation (`CorrelationId`) et de causalité (`CausationId`) pour permettre le traçage de bout en bout des flux métier.

## Principe 4 — Structure neutre
Les métadonnées ne portent aucune règle métier spécifique à un domaine. Elles qualifient le contenant et le cycle de vie de la donnée, jamais son contenu fonctionnel.

---

# 5. Structure conceptuelle du bloc de métadonnées

Le bloc de métadonnées partagé (Metadata Block) est organisé en quatre dimensions complémentaires :

```text
Metadata Block
│
├── Workspace Context (Cloisonnement)
│   ├── WorkspaceId
│   └── TenantId
│
├── Audit & Ownership (Traçabilité & Propriété)
│   ├── OwnerId
│   ├── CreatedAt
│   ├── CreatedBy
│   ├── UpdatedAt
│   └── UpdatedBy
│
├── Lifecycle & Governance (Cycle de vie)
│   ├── LifecycleStatus
│   └── Version
│
└── Execution Context (Traçabilité technique/asynchrone)
    ├── CorrelationId
    └── CausationId
```

---

# 6. Description des Attributs Communs

### 6.1 Espace de travail & Tenant
*   **WorkspaceId (UUID) :** Identifiant de l'espace de travail ou du contexte d'organisation (ex: une école, une entreprise ou un espace personnel).
*   **TenantId (UUID) :** Identifiant du client ou de l'entité juridique supérieure pour le cloisonnement physique/logique au niveau base de données.

### 6.2 Propriété & Audit
*   **OwnerId (UUID) :** Identifiant de l'utilisateur propriétaire de la ressource (l'apprenant pour un programme, le concepteur pour un modèle).
*   **CreatedAt (Timestamp ISO 8601) :** Horodatage précis de la création de la donnée.
*   **CreatedBy (UUID) :** Identifiant de l'acteur (utilisateur, système ou service IA) ayant initialisé la ressource.
*   **UpdatedAt (Timestamp ISO 8601) :** Horodatage de la dernière modification.
*   **UpdatedBy (UUID) :** Identifiant de l'acteur ayant effectué la dernière modification.

### 6.3 Gouvernance & Cycle de vie
*   **LifecycleStatus (Enum) :** État d'avancement de l'entité (ex: `Draft`, `Active`, `Archived`, `Suspended`).
*   **Version (String / SemVer) :** Numéro de version de la structure ou du modèle métier pour garantir la compatibilité ascendante.

### 6.4 Contexte d'exécution
*   **CorrelationId (UUID) :** Identifiant unique partagé par toutes les transactions découlant d'une même action initiée par l'utilisateur.
*   **CausationId (UUID) :** Identifiant de l'événement ou de la commande ayant directement provoqué l'action en cours.

---

# 7. Value Objects Recommandés

Pour l'implémentation de ce Shared Kernel dans le code, les types suivants sont définis :

*   `MetadataRecord` : Objet de valeur regroupant l'ensemble du bloc de métadonnées.
*   `AuditTrail` : Regroupement spécifique des champs `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`.
*   `TraceContext` : Regroupement de `CorrelationId` et `CausationId`.

---

# 8. Intégration dans les Bounded Contexts

Chaque Bounded Context consomme le Metadata Shared Kernel en l'associant à ses Aggregate Roots.

```text
[ Competency Aggregate Root ] ────► contient ────► [ MetadataRecord ]
[ Activity Plan Aggregate Root ] ─► contient ────► [ MetadataRecord ]
[ Integration Event Payload ] ────► contient ────► [ MetadataRecord ]
```

---

# 9. Décisions architecturales

Le Metadata Shared Kernel constitue le socle transverse indispensable pour assurer le respect des réglementations de sécurité, de confidentialité (RGPD/cloisonnement) et d'auditabilité de LevelUP.

Tous les agrégats persistés et tous les événements d'intégration publiés doivent obligatoirement intégrer et renseigner ce bloc de métadonnées standardisé.
