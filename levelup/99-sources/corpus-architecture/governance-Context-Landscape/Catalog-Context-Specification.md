# Catalog Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-CATALOG-001

---

# 1. Objet

Le **Catalog Context** est le Bounded Context de la couche Governance Layer responsable de la publication, de l'indexation, de la classification taxonomique, des politiques de visibilité et de la gestion des abonnements pour l'ensemble des catalogues de la plateforme LevelUP (Catalogue de Compétences, Catalogue de Parcours, Catalogue de Ressources).

Il fait office de méta-catalogue de gouvernance, fédérant les accès aux ressources pédagogiques officielles.

---

# 2. Mission

Fournir un registre de gouvernance centralisé et indexé pour classifier l'ensemble du patrimoine de connaissances de LevelUP, gérer l'exposition et la visibilité des ressources en fonction des droits des organisations/workspaces et piloter les licences de distribution.

---

# 3. Position dans l'écosystème

Le Catalog Context appartient à la **Governance Layer**.

Il référence les modèles de données validés par le **Competency Context**, **Learning Context** et **Knowledge Context**, et sert de point de contrôle d'éligibilité pour le **Workspace Context** (qui lui demande quelles ressources sont autorisées à l'import).

---

# 4. Vision métier

L'organisation de la connaissance requiert une catégorisation rigoureuse. LevelUP gère des milliers de compétences, de parcours et de livres. Pour permettre aux organisations de s'y retrouver de manière structurée sans créer de goulot d'étranglement conceptuel, le Catalog Context applique les règles suivantes :
1.  **Exposition et Licences contrôlées (Visibility Policies) :** Un catalogue peut être public (accessible à tous), privé (réservé à une école ou une entreprise pour ses formations internes) ou partagé (accessible par abonnement commercial).
2.  **Taxonomie unifiée :** Les ressources sont classées à l'aide d'un arbre de thèmes rigoureux et cohérent (ex: `Sciences ➔ Informatique ➔ Systèmes ➔ Linux`), évitant l'éparpillement des tags.
3.  **Indexation de confiance :** Une entrée de catalogue ne peut référencer qu'une ressource officiellement publiée, immatriculée et validée.

---

# 5. Responsabilités

Le Catalog Context est responsable de :

*   gérer les entités de catalogues unifiés (`Catalogs`) ;
*   gérer les fiches d'indexation de ressources (`Catalog Entries`) ;
*   structurer les classifications thématiques et arbres de catégories (`Catalog Taxonomies`) ;
*   appliquer les règles de visibilité et de filtrage d'accès aux ressources (`Visibility Policies`) ;
*   gérer les abonnements des workspaces aux différents catalogues (`Catalog Subscriptions`).

Il n'est jamais responsable :
*   de stocker la structure interne ou le code d'une compétence (responsabilité du `Competency Context`) ;
*   d'héberger les fichiers physiques d'apprentissage (responsabilité du `Media Context`).

---

# 6. Ubiquitous Language

## Catalog
Registre officiel thématique regroupant un ensemble indexé d'entrées de ressources d'apprentissage.

## Catalog Entry
Fiche d'indexation unitaire décrivant et référençant une ressource du référentiel (compétence, parcours ou livre) à l'aide de métadonnées de recherche, de tags et de descriptions.

## Catalog Taxonomy
Structure hiérarchique arborescente (catégories, sous-catégories) servant à classer thématiquement les entrées de catalogue.

## Visibility Policy
Règle régissant l'exposition d'un catalogue ou d'une entrée (`Public`, `Restricted`, `Internal`, `Licensed`).

## Catalog Subscription
Contrat d'autorisation accordant à un `Workspace` ou à une `Organization` le droit d'importer et de consommer les ressources d'un catalogue donné.

---

# 7. Modèle métier

```text
Concepteur (Publie un modèle) ──► déclare ──┐
                                            ▼
                                     [ Catalog Entry ]
                                            │
                      ├── applique ──► Catalog Taxonomy (Catégories)
                      ├── applique ──► Visibility Policy (Droits d'accès)
                      │
                      ▼
               [ Catalog ] (Registre)
                      │
                      ├── consulte ──► Catalog Subscriptions (Abonnements)
                      │
                      ▼
Workspace Context (Demande d'import) ➔ Valide l'éligibilité
```

---

# 8. Principes métier

## Principe 1 — Référencement de confiance
Aucune entrée de catalogue (`CatalogEntry`) ne peut être enregistrée si elle pointe vers une ressource non existante ou non immatriculée dans le registre des versions.

## Principe 2 — Cloisonnement commercial
Un espace de travail personnel gratuit ne peut pas importer de ressources issues d'un catalogue d'organisation privé, à moins de disposer d'un abonnement actif valide.

## Principe 3 — Stabilité de la taxonomie
L'arbre des thèmes (`CatalogTaxonomy`) est géré au niveau de la gouvernance globale de LevelUP pour éviter la prolifération de catégories dupliquées ou redondantes.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **Catalog :** Racine d'agrégat modélisant le catalogue, ses entrées indexées, son arbre de taxonomie interne, ses politiques d'accès et ses abonnements actifs.

## 9.2 Entités
*   **CatalogEntry :** Index de ressource.
*   **CatalogTaxonomy :** Nœud de catégorie dans l'arbre thématique.
*   **CatalogSubscription :** Contrat d'adhésion d'espace.

## 9.3 Value Objects
*   **CatalogId / EntryId / SubscriptionId :** Identifiants uniques.
*   **VisibilityLevel :** Niveaux d'exposition (`Public`, `Private`, `GuildOnly`, `Commercial`).
*   **TaxonomyNode :** Identifiant de position dans l'arbre (ex: `tech.sysadmin.linux`).

## 9.4 Domain Services
*   **TaxonomyClassifier :** Service d'aide au classement automatique ou manuel des ressources.
*   **SubscriptionValidator :** Service vérifiant si les droits d'abonnement d'un Workspace l'autorisent à importer la ressource visée.

## 9.5 Domain Events
*   **CatalogPublished :** Création d'un nouveau registre.
*   **CatalogEntryIndexed :** Indexation d'une nouvelle ressource.
*   **CatalogSubscriptionActivated :** Activation d'un droit d'accès pour un espace.
*   **CatalogEntryVisibilityChanged :** Mise à jour de la politique d'exposition.
*   **CatalogSubscriptionExpired :** Fin de validité d'un accès.

---

# 10. Invariants

1.  Une entrée de catalogue (`CatalogEntry`) doit obligatoirement être liée à un URN de ressource unique et immuable.
2.  Une sous-catégorie de taxonomie doit être rattachée à un nœud de catégorie parent existant dans l'arbre global (pas d'orphelins).
3.  La date de début d'un abonnement (`CatalogSubscription`) doit être inférieure ou égale à sa date de fin de validité.

---

# 11. Relations avec les autres Bounded Contexts

*   **Workspace Context :** Valide les imports de modèles via les services d'abonnement du Catalog Context.
*   **Competency, Learning & Knowledge Contexts :** Fournissent les URNs des ressources valides à indexer.
*   **Search Context :** Consomme les entrées et taxonomies du Catalog Context pour indexer et alimenter le moteur de recherche de la plateforme.

---

# 12. Décisions architecturales

Le Catalog Context sert de registre de métadonnées léger. Les informations d'entrées de catalogue et de taxonomies sont structurées de manière hiérarchique (modélisées par des arbres ou bases de données relationnelles gérant les fermetures transitives) pour optimiser les requêtes de navigation et de filtrage.
