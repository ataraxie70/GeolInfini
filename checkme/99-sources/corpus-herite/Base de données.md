---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Schéma PostgreSQL, index de recherche et usage de Redis"
statut_documentaire: "Historique — V0.1 Draft, antérieur à l'audit"
designation_historique: "Document 7 — Base de Données"
provenance: "files/Document_7_Base_De_Donnees.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - donnees
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

Document 7 — Base de Données

Version : 0.1 (Draft)

Statut : Document de conception — dépend de Document 3 (DDD Tactique), Document 4 (Architecture Logicielle), Document 6 (Sécurité)

---

## 0. Cadrage

Ce document traduit les agrégats de Document 3, la structure modulaire de Document 4 et les décisions de Document 6 (SEC-01, SEC-04, SEC-05, SEC-06) en schéma PostgreSQL concret, structure d'index Meilisearch, et usage de Redis. Un seul cluster PostgreSQL physique est utilisé au démarrage (cohérent avec la contrainte d'équipe réduite, Document 2 point 2), mais organisé pour ne jamais dépendre de cette proximité physique.

---

## 1. Principes directeurs

**BD-01 — Aucune contrainte `FOREIGN KEY` inter-module, même au sein du même cluster physique.**
Une référence d'un module vers un autre (ex. `enregistrement.publication_id` n'est pas concerné, il est intra-module ; mais `lot_import.publication_id` référence le module `publications` depuis `integration`) reste une simple colonne, validée par le code applicatif via le `module.go` du module cible, jamais par une contrainte SQL. Une FK inter-module rendrait la base elle-même dépendante du couplage qu'AP-1 (Document 2) interdit en code — la même discipline doit s'appliquer à la base.

**BD-02 — Aucun module ne duplique l'historique que le BC Audit construit déjà.**
Les tables métier (`publications`, `enregistrements`, `lots_import`…) ne conservent que l'**état courant**. Toute trace de modification/suppression transite par l'outbox vers Audit, qui est seul responsable de l'historisation (cohérent avec Document 3 point 2.3/point 5.5 — chaque `EnregistrementModifié`/`EnregistrementSupprimé` est déjà un événement dédié).

**BD-03 — Un schéma PostgreSQL (namespace) par module, pas seulement des tables préfixées.**
`publications.*`, `integration.*`, `organismes.*`, `iam_organismes.*`, `compte_citoyen.*`, `audit.*`. Rend la frontière de module visible même en explorant la base directement, et permet de restreindre les permissions d'un rôle applicatif par schéma dès maintenant — utile le jour où un module est extrait en service séparé avec sa propre base (Document 2, AP-2).

---

## 2. Schéma `publications`

```sql
CREATE TABLE publications.publications (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organisme_id            UUID NOT NULL,                    -- référence logique (BD-01)
    categorie_code          VARCHAR(64) NOT NULL,
    categorie_libelle       VARCHAR(255) NOT NULL,
    session_code            VARCHAR(64) NOT NULL,
    session_libelle         VARCHAR(255) NOT NULL,
    session_periode         DATERANGE,
    modele                  JSONB NOT NULL,                   -- { champs: [...], identifiants: [...] }
    etat                    VARCHAR(20) NOT NULL DEFAULT 'brouillon'
                             CHECK (etat IN ('brouillon','publiee','mise_a_jour','archivee')),
    date_creation            TIMESTAMPTZ NOT NULL DEFAULT now(),
    date_derniere_publication TIMESTAMPTZ
);

CREATE INDEX idx_publications_organisme ON publications.publications (organisme_id);
CREATE INDEX idx_publications_modele_gin ON publications.publications USING GIN (modele);
```

`modele` en JSONB : sa structure varie librement d'une publication à l'autre (Document 3 point 2.1) sans jamais nécessiter de migration de schéma — cohérent avec l'évolutivité exigée par Document 0 point 11.

```sql
CREATE TABLE publications.enregistrements (
    id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    publication_id        UUID NOT NULL REFERENCES publications.publications(id),  -- FK intra-module, autorisée
    valeurs               JSONB NOT NULL,
    identifiants_valeurs  JSONB NOT NULL,
    lot_import_id         UUID,             -- référence logique vers integration.lots_import (BD-01)
    ligne_source          INTEGER,
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at            TIMESTAMPTZ       -- soft delete ; l'historique détaillé vit dans audit (BD-02)
);

CREATE INDEX idx_enregistrements_publication ON publications.enregistrements (publication_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_enregistrements_identifiants_gin ON publications.enregistrements USING GIN (identifiants_valeurs);
```

L'index GIN sur `identifiants_valeurs` sert aux vérifications internes (ex. détection de doublon à l'ingestion) — **pas** à la recherche citoyenne, qui passe exclusivement par Meilisearch (point 7). Suppression = `deleted_at` renseigné, jamais de `DELETE` physique avant confirmation que l'événement `EnregistrementSupprimé` a bien atteint l'outbox.

---

## 3. Schéma `integration`

```sql
CREATE TABLE integration.lots_import (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    publication_id      UUID NOT NULL,                       -- référence logique (BD-01)
    mode_integration     VARCHAR(20) NOT NULL
                          CHECK (mode_integration IN ('fichier','api','connecteur','synchronisation')),
    source              JSONB NOT NULL,                       -- { origine, date_reception }
    mapping             JSONB NOT NULL,
    statut              VARCHAR(20) NOT NULL DEFAULT 'recu'
                          CHECK (statut IN ('recu','en_validation','valide','partiellement_valide','rejete','applique')),
    erreurs_conformite  JSONB NOT NULL DEFAULT '[]',
    compteurs           JSONB NOT NULL DEFAULT '{"lignesTraitees":0,"lignesEnErreur":0}',
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_lots_import_publication ON integration.lots_import (publication_id);

CREATE TABLE integration.configurations_integration (
    id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    publication_id        UUID NOT NULL,                      -- référence logique (BD-01)
    mode_integration       VARCHAR(20) NOT NULL
                           CHECK (mode_integration IN ('connecteur','synchronisation')),
    mapping               JSONB NOT NULL,
    frequence             VARCHAR(50),
    reference_credentials TEXT NOT NULL,                       -- chiffré applicatif (SEC-06), jamais en clair
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

---

## 4. Table Outbox (structure générique, une instance par module)

```sql
CREATE TABLE publications.outbox (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom          VARCHAR(100) NOT NULL,      -- ex. 'PublicationPubliee', 'EnregistrementAjoute'
    emis_par     VARCHAR(50)  NOT NULL DEFAULT 'publications',
    donnees      JSONB NOT NULL,
    statut       VARCHAR(20) NOT NULL DEFAULT 'en_attente'
                  CHECK (statut IN ('en_attente','publie','en_erreur')),
    tentatives   INTEGER NOT NULL DEFAULT 0,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    publie_at    TIMESTAMPTZ
);

CREATE INDEX idx_outbox_a_publier ON publications.outbox (created_at) WHERE statut = 'en_attente';
```

Même structure répliquée dans `integration.outbox`. Le relais (Document 4 point 4.2) tourne en tâche de fond, module par module, via le repository de chaque module — jamais une requête SQL brute traversant les schémas.

---

## 5. Schéma `audit`

```sql
CREATE TABLE audit.journal_audit (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    evenement     VARCHAR(100) NOT NULL,
    emis_par      VARCHAR(50) NOT NULL,
    horodatage    TIMESTAMPTZ NOT NULL,
    donnees       JSONB NOT NULL
);

CREATE INDEX idx_journal_audit_evenement ON audit.journal_audit (evenement, horodatage);

-- Journal de recherche (Document 6, point 6 — SEC-05) : critère haché, jamais en clair
CREATE TABLE audit.recherches (
    id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    publication_id        UUID NOT NULL,
    type_critere_utilise  VARCHAR(64) NOT NULL,
    critere_hash          VARCHAR(128) NOT NULL,   -- HMAC, jamais la valeur brute
    resultat              VARCHAR(20) NOT NULL CHECK (resultat IN ('trouve','ambigu','aucun')),
    compte_citoyen_id     UUID,                    -- nul si recherche anonyme (Document 1, point 0.1)
    horodatage            TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_recherches_hash ON audit.recherches (critere_hash);

-- Journal de sécurité (Document 6, point 8) — distinct du journal métier
CREATE TABLE audit.journal_securite (
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type_evenement VARCHAR(50) NOT NULL
                    CHECK (type_evenement IN ('connexion_echouee','changement_role','rate_limit_declenche','webhook_signature_invalide')),
    ip             INET,
    details        JSONB NOT NULL DEFAULT '{}',
    horodatage     TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

`audit` est le seul schéma à accumuler de l'historique fin — cohérent avec BD-02 : les autres modules restent légers et rapides à interroger.

---

## 6. Redis — clés et durées de vie

| Préfixe de clé | Contenu | TTL | Décision liée |
|---|---|---|---|
| `session:{sessionId}` | `{organismeId, role, adminId}` | glissant, 30 min d'inactivité | SEC-01 |
| `ratelimit:{ip}:{publicationId}` | Compteur fenêtre glissante | 1 min | SEC-03 |
| `cache:situation:{publicationId}:{critereHash}` | Résultat de résolution mis en cache | quelques minutes, invalidé sur `EnregistrementModifié` | Document 2, absorption des pics |

Aucune donnée nominative en clair dans une clé Redis : le cache de situation est indexé par le hash du critère, pas par sa valeur brute — même logique que SEC-05 appliquée au cache.

---

## 7. Index Meilisearch — `vue_consultation`

Un document par `Enregistrement` publié, structure indicative :

```json
{
  "id": "pub_8f3a..._enr_1a2b...",
  "publication_id": "pub_8f3a...",
  "identifiants": [
    { "type": "cnib", "valeur_normalisee": "b01234567" },
    { "type": "numero_recepisse", "valeur_normalisee": "2026-004521" }
  ],
  "situation": { "nature": "resultat", "champs": [ { "cle": "statut", "valeur": "Admis" } ] }
}
```

- **Attributs `searchable`** : `identifiants.valeur_normalisee` (avec tolérance aux fautes de frappe activée — utile pour l'identifiant faible nom+prénom, Document 3 point 6).
- **Attributs `filterable`** : `publication_id`, `identifiants.type` — permet au `ServiceDeResolution` (Document 3 point 3.3) de restreindre la recherche à la bonne publication et au bon type d'identifiant avant de chercher la valeur.
- **Jamais indexé/recherché** : `situation.champs` — restitué uniquement en résultat, jamais utilisé comme critère de recherche.

Document créé/mis à jour de façon asynchrone depuis les événements `PublicationPubliee` / `EnregistrementAjoute` / `EnregistrementModifie`, supprimé sur `EnregistrementSupprime` ou `PublicationArchivee` (Document 3 point 2.3/point 5.5).

---

## 8. Conventions & migrations

- Une migration SQL par schéma, nommée `NNN_<module>_<description>.sql` (ex. `003_publications_ajout_index_gin.sql`), jamais de modification manuelle en production (Document 4 point 6).
- Chaque module possède son propre rôle applicatif PostgreSQL avec permissions limitées à son schéma (`GRANT` uniquement sur `publications.*` pour le rôle du module Publications, etc.) — application concrète de BD-03 au niveau des permissions, pas seulement du namespace.
- Toute nouvelle colonne JSONB dont la structure se stabilise et devient interrogée massivement est un signal pour l'extraire en colonnes relationnelles classiques — le JSONB est un point de départ flexible, pas une fin en soi.

---

## 9. Synthèse des décisions actées

| ID | Décision |
|---|---|
| BD-01 | Aucune `FOREIGN KEY` inter-module, même au sein du même cluster physique |
| BD-02 | Aucun module ne duplique l'historique déjà construit par Audit |
| BD-03 | Un schéma PostgreSQL par module, avec permissions applicatives restreintes en conséquence |
| BD-04 | `modele` en JSONB pour rester évolutif sans migration (Document 0 point 11) |
| BD-05 | Suppression logique (`deleted_at`) pour `enregistrements`, jamais de suppression physique immédiate |
| BD-06 | Index Meilisearch séparé de PostgreSQL, alimenté uniquement par événements asynchrones |

---

## 10. Prochaines étapes

Avec ce document, l'ensemble des piliers techniques annoncés par Document 0 sont couverts (DDD, TOGAF/architecture, architecture logicielle, sécurité, API, base de données). Il reste :

- **Document UX/UI** — dernier document du plan initial : parcours concrets citoyen (recherche, résultat, cas ambigu/aucun résultat) et back-office organisme (création de publication, suivi d'import, gestion des erreurs de conformité), en s'appuyant directement sur les contrats de Document 5 et les états de Document 3.
