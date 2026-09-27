---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Décisions de sécurité, cadre légal burkinabè et surface d'exposition"
statut_documentaire: "Historique — V0.1 Draft, antérieur à l'audit"
designation_historique: "Document 6 — Sécurité"
provenance: "files/Document_6_Securite.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - securite
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

Document 6 — Sécurité

Version : 0.1 (Draft)

Statut : Document de conception — dépend de Document 0 (Vision), Document 3 (DDD Tactique), Document 4 (Architecture Logicielle), Document 5 (API & Contrats)

---

## 0. Cadrage

Ce document tranche les points de sécurité laissés ouverts dans les documents précédents :

- anonymisation du journal `RechercheEffectuée` (Document 3, point 3.4) ;
- stratégie d'authentification IAM Organismes (Document 4/5) ;
- rate-limiting concret de la route `/recherche` (Document 5, point 2.2) ;
- gestion des secrets de `ConfigurationIntegration` (Document 3, point 5.3).

Il s'appuie sur le cadre légal en vigueur : la loi n°001-2021/AN du 30 mars 2021 relative à la protection des personnes à l'égard du traitement des données à caractère personnel, qui a remplacé l'ancienne loi n°010-2004/AN du 20 avril 2004, et dont le respect est contrôlé par la Commission de l'Informatique et des Libertés (CIL). checkMe traitant par nature des informations nominatives (Document 0, périmètre point 5), cette loi s'applique pleinement.

---

## 1. Principe directeur

> La sécurité ne doit jamais réintroduire, par la friction qu'elle ajoute, la barrière d'accès que Document 1 (point 0.1) a explicitement écartée.

Concrètement : toute mesure de sécurité côté citoyen doit être **invisible par défaut** et ne se déclencher qu'en présence d'un comportement suspect avéré — jamais de CAPTCHA systématique, jamais de compte obligatoire pour se protéger d'un risque hypothétique.

---

## 2. Modèle de menaces (synthèse)

| Actif à protéger | Menace principale | Impact |
|---|---|---|
| Enregistrements nominatifs (CNIB, noms, statuts) | Énumération massive via `/recherche` (brute-force d'identifiants) | Fuite de données personnelles à grande échelle |
| Comptes administrateur d'organisme | Vol de session / mot de passe faible | Publication frauduleuse, modification de résultats — atteinte directe à 6.1 (neutralité) |
| Secrets de connecteurs (`ConfigurationIntegration`) | Fuite de la base ou du fichier de configuration | Accès à des systèmes tiers de l'organisme |
| Webhooks connecteurs entrants | Usurpation d'un connecteur légitime | Injection de fausses données dans une publication |
| Journal `RechercheEffectuée` | Fuite du journal lui-même | Reconstitution d'un historique de recherches nominatives même si la base principale est saine |

---

## 3. Authentification & autorisation

### 3.1 IAM Organismes — décision : sessions opaques côté serveur, pas de JWT

**Décision** : jetons de session **opaques**, générés côté serveur, stockés dans Redis (déjà présent dans la stack — Document 4 point 1) avec expiration glissante courte (ex. 30 minutes d'inactivité).

**Justification** : un JWT auto-porteur ne peut pas être révoqué avant son expiration sans mécanisme de liste noire — ce qui revient à réintroduire un état côté serveur, donc à perdre l'avantage principal du JWT tout en gardant sa contrainte. Pour un compte administrateur d'organisme, la capacité de **révoquer immédiatement** une session (compte compromis, départ d'un agent) est plus importante que l'absence d'état. Redis étant déjà dans la stack, le coût d'implémentation d'une session opaque est nul.

- `Authorization: Bearer <session_id>` sur toutes les routes `api-organisme`.
- Déconnexion = suppression immédiate de la clé Redis.
- Rotation du jeton à chaque requête sensible (changement de mot de passe, changement de rôle).

### 3.2 Modèle de permissions (RBAC minimal)

| Rôle | Portée | Actions |
|---|---|---|
| `administrateur_national` | Toute l'infrastructure | Gestion des organismes eux-mêmes ; **aucun accès** aux publications/enregistrements d'un organisme (cohérent avec Document 1, point 7 — "il n'intervient pas sur le contenu métier") |
| `administrateur_organisme` | Un seul `organismeId` | Toutes les actions de Document 5 point 3, strictement scopées à son `organismeId` |

**Application technique** : chaque requête sur `api-organisme` est automatiquement filtrée par `organismeId` **au niveau du repository**, jamais laissée à la responsabilité du handler HTTP — élimine une classe entière de bugs d'isolation inter-organismes (Document 1, invariant point 5 point 2).

### 3.3 Webhooks connecteurs

Authentification par **signature HMAC** (secret partagé par configuration, référencé via `referenceCredentials` — Document 3 point 5.3), jamais par Bearer token classique : un webhook n'a pas de session, il doit prouver l'intégrité et l'origine de **chaque requête** indépendamment.

---

## 4. Protection de la route `/recherche` (citoyen)

### 4.1 Principe : limiter par couple (IP, publicationId), pas globalement

Un pic légitime (des milliers de citoyens différents consultant une publication très attendue) et une attaque par énumération (une IP testant des milliers d'identifiants sur **une seule** publication) ont la même volumétrie globale mais une signature très différente au niveau individuel.

**Décision** : rate-limiting par **fenêtre glissante Redis**, clé `(ip, publicationId)`, seuil bas (ex. 10 tentatives/minute) — jamais de limite globale sur la route qui pénaliserait un pic de charge légitime.

### 4.2 Friction progressive, jamais systématique

Au-delà du seuil : introduction d'un défi (ex. preuve de travail légère ou CAPTCHA) **uniquement pour ce couple (IP, publication)**, jamais pour l'ensemble des visiteurs — conforme au principe directeur (point 1).

### 4.3 Résultat "ambigu" durci (rappel Document 5)

Le fait de ne jamais révéler le nombre de correspondances en cas d'ambiguïté (Document 5, point 2.2) limite déjà fortement la valeur d'une énumération réussie : un attaquant ne peut jamais confirmer qu'il a "presque" trouvé.

---

## 5. Protection des données au repos

### 5.1 Chiffrement — au niveau infrastructure, pas au niveau champ, pour les identifiants indexés

**Décision** : chiffrement du disque (volumes PostgreSQL et Meilisearch chiffrés au niveau infrastructure), plutôt qu'un chiffrement applicatif champ par champ pour les identifiants (`cnib`, `numero_recepisse`, etc.).

**Justification** : un chiffrement applicatif rendrait ces valeurs illisibles pour Meilisearch, qui a besoin de les indexer en clair pour permettre la recherche tolérante aux fautes (Document 4 point 1). Le chiffrement au repos protège contre le vol physique du support ou une sauvegarde mal exposée, sans casser la fonctionnalité cœur du produit.

### 5.2 Champs non recherchés — chiffrement applicatif possible

Les champs strictement `affichable` mais jamais utilisés comme critère de recherche (ex. un commentaire libre dans un `Enregistrement`) peuvent être chiffrés au niveau applicatif sans impact fonctionnel — à évaluer publication par publication selon la sensibilité des champs définis par l'organisme.

---

## 6. Journal `RechercheEffectuée` — décision (tranche Document 3 point 3.4)

**Décision** : la valeur brute du critère saisi n'est **jamais** stockée en clair dans le journal. Elle est remplacée par un **HMAC** (clé secrète détenue par l'application, rotable) de la valeur normalisée.

**Ce que ça permet quand même** :
- Détecter qu'une même valeur a été recherchée plusieurs fois (même hash) — utile pour le rate-limiting comportemental et pour l'analyse d'abus.
- Ne conserver aucune donnée exploitable en cas de fuite du seul journal, sans accès à la clé HMAC (stockée séparément de la base, cohérent avec point 5.1).

**Ce que ça n'empêche pas** : `Trouvé`/`Ambigu`/`Aucun` (le résultat) reste stocké en clair — ce n'est pas une donnée nominative en soi, seul le critère saisi l'est potentiellement.

---

## 7. Gestion des secrets (`ConfigurationIntegration`)

**Décision MVP** (cohérente avec la contrainte d'équipe réduite, Document 2 point 2) : chiffrement applicatif des secrets avant stockage en base — `referenceCredentials` contient le texte chiffré, la clé de chiffrement maîtresse vit **hors base**, dans une variable d'environnement ou un fichier monté au démarrage du conteneur, jamais commité.

**Chemin d'évolution explicite** : dès que plusieurs organismes utilisent des connecteurs en production, migrer vers un coffre-fort dédié (Vault ou équivalent) — le point d'accroche reste `ConfigurationIntegrationRepository` (Document 3 point 5.6), donc ce changement n'impacte aucun autre module.

---

## 8. Journalisation de sécurité (distincte de l'Audit métier)

Le BC Audit (Document 1, point 2.4) trace les événements **métier** (création/modification de publication). Un journal de sécurité **séparé** doit tracer, à minima :

- tentatives de connexion échouées (IAM Organismes) ;
- changements de rôle/permission ;
- déclenchements du rate-limiting (point 4) ;
- échecs de vérification de signature webhook (point 3.3).

Ce journal n'est jamais exposé au citoyen ni à l'administrateur d'organisme concerné par une alerte — seulement à l'administrateur national, pour investigation.

---

## 9. Synthèse des décisions actées

| ID | Décision |
|---|---|
| SEC-01 | Sessions opaques (Redis) pour IAM Organismes, pas de JWT |
| SEC-02 | Scoping `organismeId` appliqué au niveau repository, jamais au niveau handler |
| SEC-03 | Rate-limiting par couple (IP, publicationId), jamais global |
| SEC-04 | Chiffrement au repos au niveau infrastructure pour les champs indexés ; applicatif possible pour les champs non recherchés |
| SEC-05 | Journal de recherche : HMAC du critère, jamais la valeur brute |
| SEC-06 | Secrets de connecteurs : chiffrement applicatif MVP, migration Vault prévue explicitement |

---

## 10. Prochaines étapes

- **Document Base de Données** : traduire SEC-01/04/05 en schéma concret (table `sessions` dans Redis uniquement — pas en PostgreSQL ; colonnes chiffrées ; table `journal_securite` séparée de `outbox`).
- **Document UX/UI** : traduire la friction progressive (point 4.2) en expérience concrète (à quel moment un citoyen légitime pourrait-il rencontrer un défi, et comment le formuler sans donner l'impression d'un système punitif).
