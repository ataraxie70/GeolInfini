---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Choix technologiques, découpage en modules, règles de frontière et bus d'événements"
statut_documentaire: "Historique — V0.1 Draft, antérieur à l'audit"
designation_historique: "Document 4 — Architecture Logicielle"
provenance: "files/Document_4_Architecture_Logicielle.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

Document 4 — Architecture Logicielle

Version : 0.1 (Draft)

Statut : Document de conception — dépend de Document 0 (Vision), Document 1 (DDD Stratégique), Document 2 (Vision d'Architecture), Document 3 (DDD Tactique)

---

## 0. Cadrage

Ce document traduit les décisions de Document 2 (monolithe modulaire, CQRS léger pour Consultation) et les agrégats de Document 3 en une structure de code concrète : choix technologique, arborescence de dossiers, convention de communication inter-module, mécanisme de bus d'événements, et stratégie de déploiement pour un développeur seul.

---

## 1. Choix technologique

| Brique | Choix | Justification |
|---|---|---|
| **Langage backend** | **Go** | Le compilateur applique nativement la discipline de frontière de module exigée par AP-1 (Document 2) : tout identifiant non exporté (minuscule) est invisible en dehors de son package. C'est le langage — pas seulement la convention — qui empêche la dérive identifiée comme risque principal en Document 2 point 7. Binaire unique, faible empreinte mémoire, cohérent avec la contrainte réseau/infra low-cost (Document 2 point 2) et avec ton expérience déjà acquise sur Go (SYNERGIE, MaSecure). |
| **Base de données d'écriture** | **PostgreSQL** | Open-source, auto-hébergeable (AP-4), transactions ACID nécessaires aux agrégats `Publication`/`Enregistrement`/`LotImport`. |
| **Index de recherche (vue de lecture Consultation)** | **Meilisearch** | Open-source, auto-hébergeable, conçu pour la tolérance aux fautes de frappe (utile pour l'identifiant faible "nom + prénom", Document 3 point 6), empreinte bien plus légère qu'Elasticsearch/OpenSearch — cohérent avec un contexte d'équipe réduite. |
| **Cache** | **Redis** | Standard, léger, auto-hébergeable, absorbe les pics de charge répétés (Document 2 AP-2/point 5). |
| **Stockage de fichiers** | **MinIO (S3-compatible)** | Auto-hébergeable, évite le verrouillage propriétaire (AP-4), pour les fichiers bruts d'import (`LotImport`) avant/après traitement. |
| **Frontend citoyen** | **Next.js (rendu serveur)** | Cohérent avec ta pratique existante ; le rendu serveur minimise le JavaScript envoyé au client, cohérent avec AP-5 (frugalité réseau). Une seule page de recherche + une page de résultat suffisent au parcours citoyen. |
| **Frontend back-office organisme** | **Next.js**, application séparée | Moins sensible au poids réseau (usage interne, connexion généralement meilleure) ; séparée du frontend citoyen pour ne jamais faire porter son poids (bibliothèques d'administration, tableaux, etc.) à l'interface publique. |

---

## 2. Structure du monolithe modulaire

```
checkme/
├── cmd/
│   └── server/                 # point d'entrée unique, assemble tous les modules
│       └── main.go
├── internal/
│   ├── publications/           # BC Gestion des Publications
│   │   ├── domain/             # Publication, Enregistrement, Modele, invariants — aucune dépendance externe
│   │   ├── application/        # cas d'usage : CreerPublication, PublierPublication, AjouterEnregistrements
│   │   ├── infrastructure/     # implémentation PostgreSQL des repositories, publication d'événements
│   │   ├── interfaces/         # handlers HTTP exposés au back-office organisme
│   │   └── module.go           # SEUL point d'entrée public du module (interface exportée)
│   ├── consultation/           # BC Consultation (CORE)
│   │   ├── domain/             # VueConsultation, CritereRecherche, Situation, ServiceDeResolution
│   │   ├── application/        # cas d'usage : Rechercher, Indexer, Desindexer
│   │   ├── infrastructure/     # client Meilisearch, client Redis
│   │   ├── interfaces/         # handlers HTTP exposés au citoyen
│   │   └── module.go
│   ├── integration/            # BC Intégration des Données
│   │   ├── domain/             # LotImport, ConfigurationIntegration, TraducteurCanonique
│   │   ├── application/
│   │   ├── infrastructure/     # client MinIO, connecteurs
│   │   ├── interfaces/         # upload fichier, endpoints API, webhooks connecteurs
│   │   └── module.go
│   ├── organismes/             # BC Gestion des Organismes (générique)
│   ├── iam_organismes/         # BC IAM Organismes (générique)
│   ├── compte_citoyen/         # BC Compte Citoyen (générique, optionnel — squelette dès maintenant)
│   ├── audit/                  # BC Traçabilité & Audit (transversal, écoute uniquement)
│   └── shared/
│       ├── eventbus/           # interface + implémentation du bus d'événements interne
│       └── kernel/             # concepts VRAIMENT génériques (Id, Pagination, erreurs communes)
├── migrations/                 # migrations SQL PostgreSQL
├── web/
│   ├── citoyen/                 # app Next.js — interface publique, légère
│   └── back-office/             # app Next.js — interface organisme/administrateur
└── deploy/
    ├── docker-compose.yml       # Postgres, Meilisearch, Redis, MinIO, app
    └── Dockerfile
```

### 2.1 Règle de frontière (traduction concrète d'AP-1)

- Rien en dehors de `module.go` n'est exporté (majuscule) hors de son package `internal/<contexte>/`.
- Un module ne dépend **jamais** directement du package `infrastructure/` d'un autre module — uniquement de son `module.go`.
- `shared/kernel` reste volontairement minimal : dès qu'un concept y grossit au point de porter une règle métier, c'est le signe qu'il appartient en réalité à un contexte précis et doit en sortir.

---

## 3. Architecture interne d'un module (hexagonale légère)

Chaque module (`publications`, `consultation`, `integration`, …) suit la même structure à quatre couches, dans cet ordre de dépendance strict — une couche ne connaît que celles listées avant elle :

1. **`domain/`** — agrégats, VOs, invariants, services de domaine (Document 3). Zéro import de bibliothèque externe (ni SQL, ni HTTP).
2. **`application/`** — cas d'usage, orchestrent le `domain/` via des interfaces de repository définies ici (pas dans `infrastructure/`).
3. **`infrastructure/`** — implémentations concrètes des interfaces de repository (PostgreSQL, Meilisearch…), et publication effective des événements de domaine sur le bus.
4. **`interfaces/`** — adaptateurs "pilotants" (handlers HTTP), traduisent requêtes/réponses HTTP en appels aux cas d'usage d'`application/`.

Cette organisation garantit que `domain/` — la partie la plus précieuse, issue directement de Document 3 — reste testable sans base de données ni serveur HTTP, et reste stable même si l'infrastructure change (ex. remplacer Meilisearch par autre chose ne touche que `consultation/infrastructure/`).

---

## 4. Bus d'événements interne + Transactional Outbox

### 4.1 Problème

Document 3 définit des événements de domaine (`PublicationPubliée`, `EnregistrementAjouté`, `LotImportAppliqué`, …) qui doivent déclencher des réactions dans d'autres modules (notamment la projection vers `VueConsultation`). Si on se contente de publier ces événements en mémoire après un `COMMIT` PostgreSQL, un crash entre les deux opérations perd l'événement silencieusement — la projection de recherche se désynchronise sans qu'on le sache.

### 4.2 Décision : Transactional Outbox

Chaque module qui émet des événements de domaine écrit l'événement dans une table `outbox` **au sein de la même transaction PostgreSQL** que la modification de l'agrégat. Un relais asynchrone (goroutine dédiée) lit ensuite cette table et publie sur le bus d'événements interne, avec accusé de réception avant suppression/marquage.

> Ce pattern a déjà fait ses preuves sur MaSecure — même logique appliquée ici pour garantir qu'aucun `EnregistrementAjouté` ne se perde silencieusement entre Gestion des Publications et l'index de Consultation.

### 4.3 Bus interne — interface

```go
type Event interface {
    Nom() string
}

type Bus interface {
    Publier(ctx context.Context, evt Event) error
    Souscrire(nomEvt string, gestionnaire func(context.Context, Event) error)
}
```

**Implémentation MVP** : bus en mémoire (channels + goroutines), suffisant pour un seul processus (monolithe). **Évolution prévue** (si Consultation est extrait en service séparé — Document 2 AP-2) : remplacer uniquement l'implémentation de `Bus` par un client NATS/Kafka, sans toucher au `domain/` ni à `application/` d'aucun module — c'est précisément l'intérêt d'avoir isolé cette interface dès maintenant.

---

## 5. Déploiement (MVP)

```yaml
# deploy/docker-compose.yml (extrait de principe)
services:
  app:
    build: .
    depends_on: [postgres, meilisearch, redis, minio]
    environment:
      DATABASE_URL: postgres://...
      MEILISEARCH_URL: http://meilisearch:7700
      REDIS_URL: redis://redis:6379
      MINIO_ENDPOINT: minio:9000
  postgres:
    image: postgres:16
  meilisearch:
    image: getmeili/meilisearch:v1.9
  redis:
    image: redis:7
  minio:
    image: minio/minio
```

**Un seul binaire Go, un seul `docker-compose up`.** Cohérent avec la contrainte d'équipe réduite (Document 2 point 2) : pas d'orchestrateur Kubernetes au démarrage. Le chemin d'évolution vers plus d'échelle (réplication horizontale du module Consultation, extraction en service séparé) reste ouvert grâce aux couches 3 et 4 ci-dessus, sans jamais nécessiter une réécriture du `domain/`.

---

## 6. Conventions

- **Tests** : `domain/` et `application/` couverts par tests unitaires purs (pas de conteneur nécessaire) ; `infrastructure/` couverte par tests d'intégration (via testcontainers PostgreSQL/Meilisearch).
- **Nommage** : les noms de packages, types et cas d'usage reprennent **exactement** le vocabulaire du langage ubiquitaire de Document 1/3 (`Publication`, `Enregistrement`, `ServiceDeResolution`…) — aucune traduction anglaise ad hoc qui romprait le lien entre le code et la documentation métier.
- **Migrations** : une migration SQL par changement de schéma, jamais de modification manuelle en production — traçabilité alignée avec la valeur du projet (Document 0 point 9).

---

## 7. Prochaines étapes

- **Document API & Contrats** : formaliser les contrats HTTP exposés par `interfaces/` de chaque module (citoyen, back-office, webhooks connecteurs), et le format stable des événements publiés sur l'outbox.
- **Document Sécurité** : authentification back-office (IAM Organismes), gestion des secrets pour `ConfigurationIntegration` (Document 3 point 5.3), et la question ouverte sur l'anonymisation du journal `RechercheEffectuée` (Document 3 point 3.4).
- **Document Base de Données** : schéma PostgreSQL détaillé par module, table `outbox`, index Meilisearch.
