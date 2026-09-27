# Common Identifiers Shared Kernel Specification

**Version :** 1.0 (Draft)

**Statut :** Shared Kernel

**Catégorie :** Architecture Foundation

**Code :** LEVELUP-SK-COMMON-IDENTIFIERS-001

---

# 1. Objet

Le **Common Identifiers Shared Kernel** définit le modèle de représentation, de formatage et de validation de l'ensemble des identifiants métier et techniques circulant entre les Bounded Contexts de l'écosystème LevelUP.

Il fournit les spécifications de structure (URNs et UUIDs) garantissant l'absence de collision sémantique, la traçabilité des ressources et la simplicité de routage des événements d'intégration.

---

# 2. Mission

Établir une convention d'identifiants standardisée et robuste permettant aux Bounded Contexts de s'échanger des références d'entités claires, typées, validables et faciles à parser, sans jamais exposer de clés primaires de bases de données internes.

---

# 3. Vision architecturale

Pour préserver le couplage faible entre les couches d'architecture (Reference Layer, Execution Layer, Platform Services et Governance) :
1.  **Les ressources immuables du Référentiel (Reference Layer)** utilisent des identifiants lisibles de type **URN (Uniform Resource Name)** préfixés, permettant d'identifier immédiatement le domaine et le type de ressource.
2.  **Les données opérationnelles et individuelles (Execution & Services Layers)** utilisent des identifiants uniques de type **UUIDv4** pour garantir l'anonymisation, la sécurité et l'indépendance de persistance.

---

# 4. Spécifications des Formats d'Identifiants

Les identifiants LevelUP se séparent en deux grandes catégories.

```text
Identifiants LevelUP
│
├── 1. Identifiants de Référence (URN Préfixés)
│   ├── DomainId       (ex: domain:tech:sysadmin:linux)
│   ├── CompetencyId   (ex: competency:linux:bash-scripting)
│   └── ResourceId     (ex: resource:book:linux-bible-2026)
│
└── 2. Identifiants Opérationnels (UUID v4)
    ├── LearnerId      (ex: 4a3e7b12-9c3f-4e5a-8b1a-0d2e3f4a5b6c)
    ├── ProgramId      (ex: 8f2c3d4a-5b6c-7e8f-9a0b-1c2d3e4f5a6b)
    ├── ActivityId     (ex: 3b1a2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d)
    └── EvidenceId     (ex: c9a8b7c6-d5e4-f3a2-b1c0-d9e8f7a6b5c4)
```

---

## 5. Identifiants de Référence (URNs)

Les URNs sont insensibles à la casse (convertis en minuscules) et respectent l'expression régulière :
`^[a-z0-9]+(:[a-z0-9\-]+)+$`

### 5.1 DomainId (Identifiant de Domaine)
*   **Format :** `domain:<categorie>:<sous-categorie>:<slug>`
*   **Exemple :** `domain:tech:sysadmin:linux`
*   **Description :** Identifie un domaine métier ou technique global.

### 5.2 CompetencyId (Identifiant de Compétence)
*   **Format :** `competency:<domain-slug>:<competency-slug>`
*   **Exemple :** `competency:linux:bash-scripting`
*   **Description :** Identifie un modèle de compétence immuable dans le référentiel.

### 5.3 ResourceId (Identifiant de Ressource Pédagogique)
*   **Format :** `resource:<type-ressource>:<slug-unique>`
*   **Exemple :** `resource:book:linux-bible-2026`
*   **Description :** Identifie une référence documentaire dans le catalogue.

---

## 6. Identifiants Opérationnels (UUIDv4)

Ces identifiants sont générés dynamiquement par le système lors de l'exécution. Ils doivent être conformes à la RFC 9562 (représentation textuelle canonique hexadécimale à 36 caractères).

### 6.1 LearnerId (Identifiant d'Apprenant)
*   **Usage :** Réfère de manière unique et anonyme un utilisateur au sein de l'Execution Layer.
*   **Exemple :** `4a3e7b12-9c3f-4e5a-8b1a-0d2e3f4a5b6c`

### 6.2 ProgramId (Identifiant de Programme)
*   **Usage :** Réfère l'instance personnalisée d'un parcours (`Personal Program`) pour un apprenant donné.

### 6.3 ActivityId (Identifiant d'Activité)
*   **Usage :** Réfère une tâche concrète planifiée ou exécutée par l'apprenant au quotidien.

### 6.4 EvidenceId (Identifiant de Preuve)
*   **Usage :** Réfère une preuve structurelle d'apprentissage émise par un contexte producteur.

---

# 7. Invariants et Règles de Validation

1.  **Immutabilité :** Une fois généré ou défini, l'identifiant d'une ressource ou d'un objet ne peut jamais être modifié.
2.  **Unicité :** Aucun identifiant opérationnel ne peut être réutilisé pour deux entités différentes.
3.  **Validation à l'entrée :** Tout Bounded Context recevant un identifiant via un événement d'intégration doit valider son format (expression régulière pour URN, format RFC 9562 pour UUID) avant de lancer un traitement métier.

---

# 8. Décisions architecturales

Le choix de séparer les identifiants en URNs (lisibles et structurés) et UUIDs (techniques et aléatoires) offre plusieurs avantages clés :
*   Facilité de débogage et de lecture des fichiers d'architecture et de configuration grâce aux URNs.
*   Sécurité renforcée et conformité au RGPD dans l'Execution Layer grâce aux UUIDs (impossible de déduire l'identité d'un apprenant à partir de son identifiant sans accès au contexte d'identité).
*   Indépendance technologique totale de persistance pour l'implémentation physique des bases de données de chaque Bounded Context.
