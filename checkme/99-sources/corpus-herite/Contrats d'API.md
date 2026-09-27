---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Contrats des API citoyen et organisme, et format des événements de domaine"
statut_documentaire: "Historique — V0.1 Draft, antérieur à l'audit"
designation_historique: "Document 5 — API & Contrats"
provenance: "files/Document_5_API_Contrats.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - api
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

Document 5 — API & Contrats

Version : 0.1 (Draft)

Statut : Document de conception — dépend de Document 0 (Vision), Document 1 (DDD Stratégique), Document 3 (DDD Tactique), Document 4 (Architecture Logicielle)

---

## 0. Cadrage

Ce document formalise les contrats d'interface exposés par la couche `interfaces/` de chaque module (Document 4, point 3) : l'API publique de Consultation (citoyen), l'API du back-office organisme (Publications, Intégration, IAM Organismes), et le format stable des événements de domaine transitant par l'outbox. Il ne détaille pas encore le schéma de base de données (futur document dédié) ni les mécanismes d'authentification fins (futur document Sécurité) — seulement la forme des échanges.

---

## 1. Principes de conception

- **REST + JSON**, versionné dès le départ (`/v1/...`) — un changement cassant impose une nouvelle version, jamais une modification silencieuse d'un contrat existant (cohérent avec l'invariant "modèle non rétrogradable" de Document 3 point 2.1).
- **Neutralité dans les réponses** (6.1, Document 0) : aucune route ne renvoie de champ interprété ou décidé par checkMe — uniquement ce que l'organisme a explicitement publié comme `affichable` (Document 3 point 3.1).
- **Erreurs au format Problem Details (RFC 7807)** : `{type, title, status, detail, code}` — un `code` métier stable (ex. `PUBLICATION_INTROUVABLE`) en plus du code HTTP, pour que le front puisse réagir sans parser un message texte.
- **Deux API physiquement distinctes** (cohérent avec AP-5, frugalité réseau) : `api-citoyen` (surface minimale, aucune authentification requise par défaut) et `api-organisme` (surface plus riche, authentifiée). Elles peuvent partager le même binaire Go (Document 4) mais jamais le même point d'entrée HTTP ni la même politique de CORS.

---

## 2. API Citoyen (`api-citoyen/v1`) — non authentifiée par défaut

### 2.1 `GET /v1/publications/{publicationId}`

Retourne les métadonnées publiques d'une publication — jamais les enregistrements eux-mêmes.

```json
{
  "id": "pub_8f3a...",
  "organisme": { "nom": "Ministère de la Fonction Publique" },
  "categorie": { "libelle": "Concours direct" },
  "session": { "libelle": "Session 2026" },
  "etat": "publiee",
  "identifiantsAttendus": [
    { "type": "numero_recepisse", "libelle": "Numéro de récépissé", "obligatoire": false },
    { "type": "cnib", "libelle": "Numéro CNIB", "obligatoire": false }
  ]
}
```

`identifiantsAttendus` permet au front de générer dynamiquement le bon formulaire de recherche, sans coder en dur les types d'identifiants par organisme (cohérent avec 6.6, Document 0 — l'organisme définit ses identifiants).

**Erreurs** : `404 PUBLICATION_INTROUVABLE`, `410 PUBLICATION_NON_PUBLIQUE` (si `etat` = `brouillon` ou `archivee` — jamais exposée telle quelle, l'API renvoie juste "non disponible").

### 2.2 `POST /v1/publications/{publicationId}/recherche`

Requête :
```json
{
  "criteres": [
    { "type": "cnib", "valeur": "B01234567" }
  ]
}
```

Le tableau permet au citoyen de fournir plusieurs identifiants s'il les a tous ; le `ServiceDeResolution` (Document 3 point 3.3) choisit celui de plus haut `niveauConfiance`.

Réponses possibles :

| Cas | HTTP | Corps |
|---|---|---|
| Trouvé | `200` | `{ "resultat": "trouve", "situation": { "nature": "resultat", "champs": [...] } }` |
| Ambigu | `200` | `{ "resultat": "ambigu" }` — **aucun détail supplémentaire, jamais de nombre de correspondances exposé au client** (durci par rapport à Document 3 point 3.5, pour éviter toute fuite d'information même indirecte) |
| Aucun résultat | `200` | `{ "resultat": "aucun" }` |
| Publication non publique | `410` | Problem Details `PUBLICATION_NON_PUBLIQUE` |
| Critère invalide (type inconnu pour cette publication) | `422` | Problem Details `CRITERE_INVALIDE` |

> Remarque de sécurité : cette route retourne systématiquement `200` pour les trois cas métier (trouvé/ambigu/aucun) plutôt que `404` pour "aucun résultat" — un code HTTP différent selon que la donnée existe ou non créerait un canal d'énumération. Cette route est aussi la première candidate à un rate-limiting agressif par IP/publication (anti-bruteforce sur les identifiants faibles).

---

## 3. API Organisme (`api-organisme/v1`) — authentifiée (Bearer token, IAM Organismes)

### 3.1 Publications

| Route | Rôle requis | Description |
|---|---|---|
| `POST /v1/publications` | admin organisme | Crée une publication à l'état `brouillon`, avec `categorie`, `session`, `modele` initial. |
| `PATCH /v1/publications/{id}/modele` | admin organisme | Étend le modèle (ajout de champs/identifiants uniquement — rejet `409 MODELE_NON_RETROGRADABLE` si tentative de suppression, Document 3 point 2.1 invariant 3). |
| `POST /v1/publications/{id}/publier` | admin organisme | `brouillon` → `publiee`. Rejet `409` si aucun identifiant défini (invariant 1). |
| `POST /v1/publications/{id}/archiver` | admin organisme | Passage en `archivee`. |
| `GET /v1/publications/{id}` | admin organisme | Vue complète (contrairement à la vue citoyenne allégée). |

### 3.2 Intégration des données

| Route | Description |
|---|---|
| `POST /v1/publications/{id}/imports` | Upload multipart (fichier) ou payload JSON (API) + `mapping`. Crée un `LotImport` à l'état `recu`. |
| `GET /v1/imports/{id}` | Statut courant + `compteurs` + `erreursConformite` (Document 3 point 5.2). |
| `POST /v1/imports/{id}/appliquer` | Confirmation explicite requise pour un lot `partiellementValide` (invariant 3, point 5.2) — impossible d'appliquer automatiquement. |
| `POST /v1/organismes/{id}/configurations-integration` | Crée une `ConfigurationIntegration` (connecteur/synchronisation récurrente) — ne contient jamais le secret lui-même, seulement `referenceCredentials`. |
| `POST /v1/webhooks/connecteurs/{configId}` | Point d'entrée pour les connecteurs externes poussant des données — authentifié par signature (HMAC), pas par le Bearer token classique. |

**Erreurs communes** : `409 PUBLICATION_ARCHIVEE`, `422 MAPPING_INCOMPLET` (mapping ne couvre pas les champs obligatoires — invariant 1, point 5.2 Document 3).

---

## 4. Format des événements (contrat interne outbox)

Utilisé entre modules (Document 4 point 4), pas exposé publiquement pour l'instant — mais formalisé ici pour que sa forme reste stable dans le temps :

```json
{
  "id": "evt_...",
  "nom": "EnregistrementAjoute",
  "emisPar": "publications",
  "horodatage": "2026-08-02T10:15:00Z",
  "donnees": {
    "publicationId": "pub_8f3a...",
    "enregistrementId": "enr_...",
    "identifiantsValeurs": { "cnib": "B01234567" }
  }
}
```

Champs fixes (`id`, `nom`, `emisPar`, `horodatage`) identiques pour tout événement, `donnees` variable selon `nom`. Cette régularité permet à un futur consommateur (ex. export vers Audit externe, ou API événementielle publique pour les organismes avancés) de rester simple à écrire.

---

## 5. Conventions transverses

- **Pagination** : `?curseur=...&limite=50` (curseur plutôt qu'offset — plus stable sur de grandes collections d'`Enregistrement`, Document 3 point 1).
- **Dates** : toujours ISO 8601 UTC.
- **Idempotence** : `POST /imports` accepte un en-tête `Idempotency-Key` — un ré-essai réseau ne doit jamais créer deux `LotImport` identiques pour un même envoi.
- **CORS** : `api-citoyen` ouverte largement (site public) ; `api-organisme` restreinte aux origines du back-office uniquement.

---

## 6. Prochaines étapes

- **Document Sécurité** : détail de l'authentification IAM Organismes (JWT ? sessions ?), stratégie de rate-limiting concrète pour `/recherche`, gestion des secrets de `configurations-integration`, et la question ouverte sur l'anonymisation du journal de recherche (Document 3 point 3.4).
- **Document Base de Données** : schéma PostgreSQL par module, table `outbox`, structure d'index Meilisearch pour `VueConsultation`.
- **Document UX/UI** : traduire les contrats de ce document en parcours concrets (formulaire de recherche dynamique basé sur `identifiantsAttendus`, écran de suivi d'import avec `erreursConformite`).
