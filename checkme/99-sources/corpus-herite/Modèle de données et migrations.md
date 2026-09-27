---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Modèle relationnel, invariants d'intégrité et ordre des migrations PostgreSQL"
statut_documentaire: "Baseline canonique — intervention P0-4, en revue, périmètre réduit"
designation_historique: "Document P0-4 — Modèle de données et migrations"
provenance: "documents_corriges/Document_P0_4_Modele_Donnees_Migrations.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - donnees
  - migrations
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

> [!caution] Périmètre réduit sans traçabilité, et cinq migrations jamais exécutées
> La sortie attendue de P0-4 était *« OpenAPI, JSON Schemas, migrations initiales, fixtures »*. Ce document ne porte que le modèle de données et les migrations ; **OpenAPI, JSON Schemas et fixtures ne sont ni faits, ni reportés dans une intervention nommée**. Les cinq fichiers `migrations/` en annexe n'ont jamais été exécutés — voir le point 3 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]].

# Document P0-4 — Modèle de données et migrations

Version : 0.1  
Statut : En revue  
Intervention corrigée : P0-4 — Modèle de données et migrations exécutables  
Date : 2026-08-10

---

## 1. Objet

Ce document transforme les décisions P0-1, P0-2 et P0-3 en modèle de données relationnel exécutable.

Il fixe :

- le modèle canonique de la source de vérité Publications ;
- le modèle de projection Consultation ;
- le modèle de livraison Outbox ;
- le journal d'idempotence ;
- les générations de projection ;
- les contraintes d'intégrité minimales ;
- l'ordre des migrations SQL.

Le modèle vise un **MVP PostgreSQL**. Il ne dépend pas d'un moteur de recherche externe.

---

## 2. Décisions P0-4

### 2.1 SGBD

PostgreSQL est retenu pour :

- les agrégats métier et leurs contraintes relationnelles ;
- l'Outbox ;
- les journaux d'idempotence ;
- la projection Consultation du MVP ;
- les index exacts déterministes.

Le choix n'interdit pas l'ajout ultérieur d'un moteur de recherche spécialisé pour la recherche floue contrôlée.

### 2.2 Séparation des modules

Deux schémas PostgreSQL sont utilisés :

- `publications` : source de vérité et Outbox ;
- `consultation` : projection et mécanismes de garde.

Les tables de `consultation` ne doivent jamais être écrites par le module Publications. Le lien vers `publication_id` est une référence logique ; aucune clé étrangère inter-module n'est imposée.

### 2.3 Identifiants

Les identifiants métier internes sont des UUID fournis par l'application.

Les numéros métier externes restent des valeurs dans les enregistrements source et dans la projection.

Pour les critères exacts sensibles, la projection stocke une empreinte HMAC déterministe calculée par l'application après normalisation. La clé HMAC n'est jamais stockée dans la base.

### 2.4 Données souples

`jsonb` est utilisé pour les données d'enregistrement et de présentation qui dépendent du modèle de publication.

Les champs de contrôle structurants restent relationnels afin de permettre les contraintes, index et audits.

---

## 3. Modèle relationnel canonique

### 3.1 Vue d'ensemble

```text
organisme
   |
   +---- publication ---- publication_model ---- identifier_definition
   |          |
   |          +---- record
   |          |
   |          +---- outbox_event ---- outbox_delivery
   |
   +---- user_account / organization_membership   [hors P0-4 métier principal]

publication_id .......................... logique uniquement ..........................>
                                               consultation.publication_projection
                                               consultation.projection_generation
                                               consultation.projection_record
                                               consultation.projection_identifier
                                               consultation.projection_guard
                                               consultation.processed_event
```

### 3.2 Organisme

`organisme` représente une institution utilisatrice de l'infrastructure.

Invariants :

- `code` est unique ;
- `name` est obligatoire ;
- un organisme peut posséder plusieurs publications ;
- aucune publication ne peut appartenir à plusieurs organismes.

### 3.3 Publication

`publication` est l'unité métier principale.

Attributs essentiels :

- organisme ;
- code stable ;
- titre ;
- catégorie ;
- session ;
- modèle ;
- statut métier ;
- version monotone.

Statuts métier :

- `brouillon` ;
- `publiee` ;
- `archivee`.

La disponibilité à la recherche n'est **pas** un statut de `publication`. Elle relève de `consultation.publication_projection.status`.

### 3.4 Modèle et définitions d'identifiants

`publication_model` décrit la structure de données d'une publication.

`identifier_definition` définit pour chaque identifiant :

- type stable ;
- libellé ;
- rang de confiance ;
- caractère obligatoire à l'ingestion ;
- mode de correspondance ;
- normalisation ;
- possibilité de résultat direct.

Invariants :

- les rangs sont uniques dans un modèle ;
- `floue_controlee` ne peut pas être utilisée pour un identifiant déclaré exact dans la convention du modèle ;
- le rang `1` représente le critère le plus fiable ;
- un identifiant non direct ne peut pas être utilisé seul pour produire `trouve`.

La contrainte « exact vs flou » est complétée par une table de types système afin d'empêcher une activation accidentelle de fuzzy sur des types connus comme forts.

### 3.5 Enregistrement

`record` représente une ligne métier source dans une publication.

Clés :

- `publication_id` ;
- `record_id` ;
- `external_key` facultative mais unique dans la publication lorsqu'elle est fournie ;
- `aggregate_version` monotone ;
- `payload` contenant les valeurs métier ;
- `display_payload` contenant, lorsque l'ingestion le prépare, les champs destinés à la consultation.

Le système conserve les enregistrements supprimés logiquement afin de permettre la traçabilité et la génération d'événements de suppression.

### 3.6 Outbox

`outbox_event` contient les événements durables écrits dans la même transaction que la mutation métier.

`outbox_delivery` représente la livraison à un consommateur obligatoire, ici `consultation`.

Le statut de l'événement est :

- `pending` ;
- `processing` ;
- `delivered` ;
- `dead_letter`.

Le statut `delivered` n'est valide que lorsque toutes les livraisons obligatoires associées sont `delivered`.

### 3.7 Projection Consultation

`publication_projection` est la racine de projection par publication.

Elle stocke :

- statut de disponibilité ;
- génération active ;
- timestamps ;
- motif d'erreur éventuel.

`projection_generation` permet le double-buffering logique : une génération en construction ne devient active qu'après validation.

`projection_record` représente la vue consultable d'un enregistrement.

`projection_identifier` stocke les clés exactes normalisées et HMACées.

`projection_guard` permet de bloquer immédiatement la recherche avant une opération destructive ou une désindexation asynchrone.

### 3.8 Idempotence

`processed_event` journalise les événements déjà consommés par un projecteur.

`projection_aggregate_state` conserve la dernière version appliquée par agrégat et consommateur.

Ces deux mécanismes complètent l'idempotence :

- `event_id` protège contre les duplications du même événement ;
- `aggregate_version` empêche un événement ancien de revenir en arrière ;
- un saut de version est détectable et peut mettre la projection en erreur.

---

## 4. Modèle détaillé des tables

| Schéma | Table | Responsabilité |
|---|---|---|
| `publications` | `organization` | Organisme propriétaire |
| `publications` | `publication_model` | Modèle de données |
| `publications` | `identifier_definition` | Définition des critères de consultation |
| `publications` | `publication` | Publication métier |
| `publications` | `record` | Enregistrements métier source |
| `publications` | `outbox_event` | Événements durables |
| `publications` | `outbox_delivery` | Livraison par consommateur |
| `consultation` | `publication_projection` | État de disponibilité de la projection |
| `consultation` | `projection_generation` | Générations de reconstruction |
| `consultation` | `projection_record` | Vue consultable |
| `consultation` | `projection_identifier` | Index exact HMACé |
| `consultation` | `projection_guard` | Blocage immédiat de consultation |
| `consultation` | `processed_event` | Idempotence par événement |
| `consultation` | `projection_aggregate_state` | Ordonnancement par agrégat |

---

## 5. Invariants de base de données

### 5.1 Multi-organisme

Un `record` ne peut référencer qu'une seule `publication` et la publication n'appartient qu'à un seul organisme.

L'application doit toujours filtrer les opérations d'écriture d'administration par `organization_id`.

### 5.2 Versionnement

`aggregate_version >= 1`.

Pour un couple `(aggregate_type, aggregate_id)`, les versions émises sont strictement monotones.

La base garantit la non-duplication d'un événement `(aggregate_type, aggregate_id, aggregate_version)`.

### 5.3 Publication

Transitions valides :

```text
brouillon -> publiee -> archivee
brouillon -> archivee
```

Une publication archivée ne revient pas à `publiee` par la même opération. Une nouvelle publication/version de campagne doit être créée si le métier le nécessite.

### 5.4 Identifiants

`rank_confidence` est unique par modèle.

`matching_mode` est limité à :

- `exacte` ;
- `floue_controlee`.

`normalisation` doit appartenir à un vocabulaire connu.

### 5.5 Recherche exacte

La clé exacte de projection est unique pour une génération et un type d'identifiant :

```text
(publication_id, generation_id, identifier_type, normalized_hmac)
```

Ainsi, deux enregistrements ne peuvent pas être publiés simultanément dans une même génération avec exactement le même critère exact.

Une collision métier provoque une erreur d'indexation, pas un choix arbitraire d'un candidat.

### 5.6 Génération active

Une seule génération peut être active pour une publication.

La recherche citoyenne ne lit que cette génération.

### 5.7 Garde

Une garde active bloque la recherche même si une génération ancienne existe physiquement.

---

## 6. Normalisation et HMAC exact

Le pipeline exact est :

```text
entrée citoyenne
 -> normalisation canonique
 -> HMAC-SHA-256 avec clé serveur
 -> lookup exact
```

La même normalisation doit être appliquée lors de l'indexation et de la recherche.

La base ne doit pas connaître la clé HMAC.

Le nom de l'algorithme et la version de normalisation sont stockés dans `identifier_definition.normalization` afin de rendre un rebuild explicite lors d'un changement.

Exemples de normalisations admissibles :

- `code_alphanumerique_v1` ;
- `uppercase_trim_v1` ;
- `nom_prenom_unicode_v1`.

Une modification de normalisation d'un identifiant existant implique une nouvelle génération de projection.

---

## 7. États de projection

Valeurs :

```text
non_indexee
indexation_en_cours
indexee
indexation_en_erreur
desindexation_en_cours
```

Règles :

- seule `indexee` autorise une recherche citoyenne ;
- une `projection_guard` active interdit la recherche, même pendant une phase de transition ;
- une génération nouvelle ne devient active qu'après contrôle de cardinalité ;
- une erreur de projection laisse l'ancienne génération active uniquement si aucune garde n'est nécessaire et si la publication était déjà saine ; sinon la recherche est bloquée.

---

## 8. Outbox et reprise

### 8.1 Transaction d'écriture

Une mutation Publication et son `outbox_event` correspondant doivent être engagés dans une même transaction.

Pour chaque consommateur obligatoire, une ligne `outbox_delivery` est créée dans la même transaction.

### 8.2 Claim

Le dispatcher utilise `FOR UPDATE SKIP LOCKED` pour prendre les livraisons disponibles.

Le verrou logique est représenté par :

- `locked_until` ;
- `attempt_count` ;
- `next_attempt_at`.

Une livraison dont `locked_until` est dépassé peut être reprise.

### 8.3 Dead-letter

Après le nombre maximal de tentatives, la livraison devient `dead_letter`.

L'événement parent ne devient jamais `delivered` tant qu'une livraison obligatoire est en erreur finale.

---

## 9. Générations et reconstruction

Construction :

1. créer une génération `building` ;
2. indexer les enregistrements de la source de vérité ;
3. compter les éléments projetés ;
4. vérifier la cohérence attendue ;
5. passer la génération à `ready` ;
6. activer atomiquement la génération ;
7. passer la publication à `indexee`.

Les générations non actives sont conservées jusqu'à la rétention opérationnelle définie ultérieurement.

---

## 10. Tests d'acceptation P0-4

### Modèle source

- impossible de créer deux organismes de même code ;
- impossible de créer deux rangs de confiance identiques dans un modèle ;
- impossible de dupliquer une version d'agrégat ;
- impossible d'insérer un record dans une publication inexistante ;
- impossible de publier sans modèle valide.

### Projection

- impossible d'avoir deux générations actives pour une publication ;
- une même clé exacte ne peut pas identifier deux records dans une génération ;
- une projection en `indexation_en_cours` n'est pas consultable ;
- une garde active bloque la consultation ;
- un event déjà traité avec le même `payload_hash` reste idempotent ;
- le même `event_id` avec un autre hash déclenche une erreur de cohérence côté projecteur.

### Outbox

- mutation métier sans événement durable impossible ;
- un événement livré à `consultation` deux fois ne crée pas de doublon ;
- une livraison verrouillée puis abandonnée peut être reprise ;
- une livraison `dead_letter` empêche l'événement parent de devenir `delivered`.

---

## 11. Hors périmètre P0-4

Ne sont pas figés ici :

- IAM complet ;
- conformité et durée de conservation des données nominatives ;
- chiffrement applicatif de chaque champ ;
- recherche floue ;
- cache Redis ;
- monitoring complet et SLO ;
- API publique OpenAPI complète.

Ces points ne doivent toutefois pas contredire ce modèle.

---

## 12. Ordre des migrations

```text
001_extensions_and_schemas.sql
002_publications.sql
003_outbox.sql
004_consultation.sql
005_integrity_indexes.sql
```

Chaque migration est transactionnelle lorsque PostgreSQL le permet. Les changements irréversibles futurs doivent être isolés dans une migration dédiée.

---

## 13. Critères de sortie P0-4

P0-4 est considéré comme suffisamment défini lorsque :

- le modèle source de vérité est relationnel et explicite ;
- la projection Consultation peut être reconstruite sans écrire dans Publications ;
- l'Outbox supporte la livraison at-least-once ;
- l'idempotence dispose d'un stockage dédié ;
- la recherche exacte est contrainte par unicité ;
- une seule génération active est possible ;
- les migrations SQL peuvent initialiser une base vide ;
- les invariants principaux sont exprimés par `CHECK`, `UNIQUE`, `PRIMARY KEY` ou logique transactionnelle explicite.

---

## 14. Validation de l'intervention P0-4

Livrables produits :

- ce modèle de données canonique ;
- cinq migrations PostgreSQL exécutables dans l'ordre ;
- contraintes d'intégrité et index principaux ;
- commentaires SQL sur les frontières de module.

La prochaine intervention recommandée est **P0-5 — conformité, données nominatives, conservation, exposition et audit**.
