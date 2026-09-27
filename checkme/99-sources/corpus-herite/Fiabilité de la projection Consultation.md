---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Outbox, idempotence, statuts d'indexation, reprise et reconstruction par génération"
statut_documentaire: "Baseline canonique — intervention P0-3"
designation_historique: "Document P0-3 — Fiabilité de la projection Consultation"
provenance: "documents_corriges/Document_P0_3_Fiabilite_Projection_Consultation.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - projection
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

# Document P0-3 — Fiabilité de la Projection Consultation

Version : 0.1
Statut : En revue
Intervention corrigée : P0-3 — Durcir la projection Consultation
Date : 2026-08-02

Sources historiques consultées :

- `documents_corriges/Document_0_Vision_Principes_Fondateurs.md`
- `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md`
- `files/Document_2_Vision_Architecture.md`
- `files/Document_3_DDD_Tactique.md`
- `files/Document_4_Architecture_Logicielle.md`
- `files/Document_5_API_Contrats.md`
- `files/Document_7_Base_De_Donnees.md`
- `files/Audit_Complet_CheckMe.md`

Règle de périmètre :

- ce document corrige uniquement P0-3 ;
- il définit la fiabilité de l'outbox, des projecteurs et de l'index Consultation ;
- il ne produit pas encore de migrations SQL exécutables, qui relèvent de P0-4 ;
- il ne modifie pas les fichiers historiques du dossier `files/`.

---

## 1. Problème corrigé

Les documents historiques posent déjà une bonne direction :

- Gestion des Publications est la source de vérité ;
- Consultation lit une vue dédiée ;
- la vue Consultation est alimentée par événements ;
- une Transactional Outbox évite de perdre un événement après un `COMMIT`.

Mais plusieurs points restaient ouverts :

- sémantique de livraison : at-least-once ou exactly-once ;
- idempotence des projecteurs ;
- verrouillage concurrent des événements à dispatcher ;
- retries et dead-letter ;
- versionnement des événements ;
- replay complet d'une projection ;
- détection de divergence entre source de vérité et index ;
- statut explicite d'indexation visible côté back-office.

Décision P0-3 :

> La projection Consultation est alimentée par une outbox à livraison at-least-once. Tous les projecteurs sont idempotents. Une publication n'est consultable côté citoyen que lorsque sa projection active est déclarée `indexee`.

---

## 2. Exigences conservées

Cette correction respecte les décisions déjà actées :

- Consultation ne modifie jamais le modèle d'écriture Publications ;
- Consultation lit une vue matérialisée dédiée ;
- la cohérence entre publication et consultation reste éventuelle ;
- la latence d'indexation doit être visible pour éviter la confusion côté organisme ;
- les recherches citoyennes doivent rester rapides ;
- les règles de matching P0-2 restent applicables une fois la projection disponible.

---

## 3. Principes obligatoires

### 3.1 Livraison at-least-once

Le système ne promet pas une livraison exactly-once.

Il promet :

- aucun événement engagé en base ne doit être perdu ;
- un événement peut être livré plusieurs fois ;
- les consommateurs doivent produire le même état final même en cas de duplication.

### 3.2 Projecteurs idempotents

Chaque projecteur doit pouvoir recevoir plusieurs fois le même événement sans créer de doublon, sans revenir en arrière, et sans exposer une projection incohérente.

### 3.3 Projection observable

L'état de la projection doit être visible dans le back-office.

Une publication peut être `publiee` côté métier sans être encore `indexee` côté Consultation.

### 3.4 Recherche gated par le statut d'indexation

La route citoyenne de recherche ne doit résoudre une publication que si :

- la publication est dans un état public ;
- la projection Consultation active existe ;
- le statut d'indexation de la publication est `indexee`.

Si ce n'est pas le cas, la recherche ne doit pas utiliser une projection partielle.

### 3.5 Cohérence asymétrique

La cohérence éventuelle est acceptable pour rendre une publication disponible à la recherche : un délai de quelques secondes entre `PublicationPubliee` et `indexee` est tolérable s'il est visible.

Elle est beaucoup moins acceptable pour retirer une donnée déjà consultable.

Règle :

> Les changements qui retirent ou invalident une donnée consultable (`PublicationArchivee`, suppression d'enregistrement, correction sensible) doivent bloquer la recherche avant d'être considérés comme terminés côté back-office.

Dans le monolithe modulaire, ce blocage passe par une interface publique du module Consultation, jamais par une écriture directe dans ses tables internes.

---

## 4. Composants concernés

### 4.1 Source de vérité Publications

Responsabilités :

- écrire `Publication` et `Enregistrement` ;
- écrire les événements de domaine dans l'outbox dans la même transaction ;
- fournir une interface publique paginée pour reconstruire une projection.

### 4.2 Outbox

Responsabilités :

- conserver durablement les événements à livrer ;
- permettre leur claim concurrent sans double traitement simultané ;
- conserver les erreurs de livraison ;
- permettre la reprise après crash.

### 4.3 Dispatcher

Responsabilités :

- prendre des événements en attente ;
- créer ou traiter les livraisons nécessaires par consommateur ;
- appliquer une stratégie de retry ;
- envoyer en dead-letter après échecs répétés ;
- ne marquer un événement comme livré que lorsque les consommateurs obligatoires ont confirmé leur traitement.

### 4.4 Projecteur Consultation

Responsabilités :

- consommer les événements Publications utiles à Consultation ;
- produire ou mettre à jour la vue de recherche ;
- appliquer les règles P0-2 : index exact obligatoire, index flou séparé et optionnel ;
- tenir un journal de traitement idempotent ;
- mettre à jour le statut d'indexation par publication.

### 4.5 Garde de consultation

Responsabilités :

- permettre à un cas d'usage Publications de bloquer immédiatement la recherche d'une publication ;
- stocker une raison technique : archive, correction sensible, rebuild obligatoire, erreur de projection ;
- empêcher la recherche citoyenne même si l'ancienne génération d'index existe encore ;
- être appelée uniquement via l'interface publique du module Consultation.

### 4.6 Store de projection Consultation

Responsabilités :

- stocker les documents de recherche actifs ;
- permettre la recherche exacte et, plus tard, la recherche floue contrôlée ;
- supporter un rebuild complet par génération de projection ;
- permettre une suppression idempotente.

---

## 5. Contrat d'événement corrigé

Le format historique `{id, nom, emisPar, horodatage, donnees}` est insuffisant pour une projection fiable.

Chaque événement durable doit porter les métadonnées suivantes.

```json
{
  "eventId": "evt_...",
  "eventName": "EnregistrementAjoute",
  "eventVersion": 1,
  "emittedBy": "publications",
  "occurredAt": "2026-08-02T10:15:00Z",
  "correlationId": "corr_...",
  "causationId": "evt_...",
  "aggregateType": "Enregistrement",
  "aggregateId": "enr_...",
  "aggregateVersion": 3,
  "publicationId": "pub_...",
  "payload": {}
}
```

Champs obligatoires :

| Champ | Rôle |
|---|---|
| `eventId` | Identifiant global unique de l'événement. |
| `eventName` | Nom stable ASCII de l'événement. |
| `eventVersion` | Version du schéma d'événement. |
| `emittedBy` | Module émetteur. |
| `occurredAt` | Date métier d'émission. |
| `correlationId` | Regroupe les événements issus d'une même action utilisateur/import. |
| `causationId` | Événement ou commande ayant causé celui-ci, si disponible. |
| `aggregateType` | Type d'agrégat concerné. |
| `aggregateId` | Identifiant de l'agrégat concerné. |
| `aggregateVersion` | Version monotone de l'agrégat. |
| `publicationId` | Publication concernée, obligatoire pour les événements utilisés par Consultation. |
| `payload` | Données de l'événement. |

Règle :

> Un projecteur Consultation doit refuser ou placer en erreur tout événement utile à Consultation qui n'a pas de `publicationId`, `eventVersion`, `aggregateId` ou `aggregateVersion`.

---

## 6. Événements consommés par Consultation

| Événement | Effet attendu |
|---|---|
| `PublicationPubliee` | Démarre l'indexation initiale de la publication. |
| `PublicationArchivee` | Rend la publication immédiatement non consultable puis désindexe ses documents. |
| `PublicationModeleEtendu` | Marque la projection comme à revalider si les champs affichables ou identifiants changent. |
| `EnregistrementAjoute` | Upsert du document de recherche de l'enregistrement. |
| `EnregistrementModifie` | Upsert idempotent du document de recherche de l'enregistrement. |
| `EnregistrementSupprime` | Suppression idempotente du document de recherche de l'enregistrement. |

Pour construire une projection fiable, les événements d'enregistrement doivent contenir soit :

- toutes les données nécessaires à la projection : identifiants normalisables, champs affichables, versions utiles ;
- soit une référence permettant au projecteur de récupérer ces données via une interface publique paginée du module Publications.

Règle MVP :

> Les événements d'enregistrement doivent être suffisamment complets pour upsert ou supprimer un document sans requête SQL directe dans les tables Publications.

---

## 7. États d'indexation par publication

Chaque publication possède un statut de projection Consultation.

| Statut | Signification | Recherche citoyenne |
|---|---|---|
| `non_indexee` | Aucune projection active. | Refusée. |
| `indexation_en_cours` | Construction ou reconstruction en cours. | Refusée. |
| `indexee` | Projection active disponible. | Autorisée. |
| `indexation_en_erreur` | Projection incomplète ou erreur persistante. | Refusée. |
| `desindexation_en_cours` | Archive ou retrait en cours. | Refusée. |

Règles :

- `PublicationPubliee` met le statut à `indexation_en_cours`.
- La recherche citoyenne n'est autorisée qu'en `indexee`.
- `PublicationArchivee` doit déclencher la garde de consultation avant que l'action soit considérée terminée côté back-office.
- La désindexation physique peut rester asynchrone, mais la recherche doit déjà être bloquée.
- Une erreur de projection après le nombre maximal de retries met le statut à `indexation_en_erreur`.
- Un rebuild complet peut repasser de `indexation_en_erreur` à `indexation_en_cours`, puis `indexee`.

---

## 8. Modèle de livraison outbox

### 8.1 Statuts d'événement

Statuts recommandés pour un événement outbox :

| Statut | Signification |
|---|---|
| `en_attente` | L'événement doit être traité. |
| `en_traitement` | L'événement est claim par un dispatcher. |
| `livre` | Tous les consommateurs obligatoires ont confirmé le traitement. |
| `en_erreur` | Échec temporaire, retry prévu. |
| `dead_letter` | Échec durable nécessitant intervention ou replay. |

### 8.2 Livraison par consommateur

Un événement peut avoir plusieurs consommateurs : Consultation, Audit, futur export.

Pour éviter qu'un consommateur masque l'échec d'un autre, le système doit suivre une livraison par consommateur.

Structure conceptuelle :

```text
outbox_event(event_id, event_name, event_version, status, attempts, next_attempt_at, locked_until, payload)
outbox_delivery(event_id, consumer_name, status, attempts, next_attempt_at, last_error)
```

Règle :

> `outbox_event.status = livre` uniquement lorsque toutes les livraisons obligatoires sont `livre`.

### 8.3 Claim concurrent

Le dispatcher doit prendre les événements par lots avec verrouillage.

Règles :

- un événement claim reçoit `locked_by` et `locked_until` ;
- un autre dispatcher ne traite pas l'événement tant que le lock est valide ;
- un lock expiré peut être repris ;
- le claim doit être atomique ;
- les lots doivent être limités pour éviter de bloquer la file.

---

## 9. Retry et dead-letter

### 9.1 Retry

Les erreurs temporaires doivent être rejouées automatiquement.

Stratégie recommandée :

- retry 1 : après quelques secondes ;
- retry 2 : après quelques dizaines de secondes ;
- retry 3 : après quelques minutes ;
- retries suivants : backoff exponentiel plafonné ;
- ajout d'un jitter pour éviter les reprises simultanées.

Chaque échec conserve :

- message d'erreur technique ;
- type d'erreur ;
- date de dernière tentative ;
- nombre de tentatives ;
- nom du consommateur.

### 9.2 Dead-letter

Un événement passe en `dead_letter` si :

- le nombre maximum de retries est atteint ;
- le payload est invalide ;
- la version d'événement n'est pas supportée ;
- un trou de version d'agrégat est détecté ;
- le projecteur refuse l'événement pour protéger la cohérence.

Effets :

- la publication concernée passe en `indexation_en_erreur` si Consultation est consommateur obligatoire ;
- le back-office doit pouvoir voir qu'une intervention est nécessaire ;
- un replay ou rebuild doit être possible.

---

## 10. Idempotence du projecteur Consultation

### 10.1 Journal de traitement

Consultation doit tenir un journal des événements traités.

Structure conceptuelle :

```text
processed_event(
  event_id,
  consumer_name,
  event_name,
  event_version,
  aggregate_type,
  aggregate_id,
  aggregate_version,
  processed_at,
  payload_hash
)
```

Règles :

- si `event_id` est déjà traité par `consultation_projector`, l'événement est ignoré ;
- si le même `event_id` revient avec un `payload_hash` différent, l'événement est rejeté en erreur critique ;
- si `aggregateVersion` est inférieure ou égale à la dernière version appliquée pour cet agrégat, l'événement est ignoré ;
- si `aggregateVersion` saute une version attendue, la projection passe en erreur ou demande rebuild.

### 10.2 Opérations idempotentes

| Événement | Opération idempotente |
|---|---|
| `EnregistrementAjoute` | Upsert par clé déterministe `(publicationId, enregistrementId, generation)`. |
| `EnregistrementModifie` | Upsert par la même clé, avec version supérieure. |
| `EnregistrementSupprime` | Delete par clé ; si absent, succès. |
| `PublicationArchivee` | Désactiver la recherche puis delete par `publicationId`; si déjà supprimé, succès. |
| `PublicationPubliee` | Démarrer ou reprendre une génération d'indexation. |

---

## 11. Générations de projection

Pour éviter d'exposer un index partiel, chaque construction complète d'une publication utilise une génération.

Concept :

```text
projection_generation(
  publication_id,
  generation_id,
  status,
  started_at,
  completed_at,
  expected_count,
  indexed_count,
  checksum
)
```

Règles :

- les documents indexés portent `generationId` ;
- la recherche citoyenne utilise uniquement la génération active ;
- une génération devient active seulement après validation ;
- une génération échouée ne devient jamais active ;
- une génération ancienne peut être supprimée après activation de la nouvelle.

### 11.1 Publication initiale

Flux :

1. `PublicationPubliee` reçu.
2. Statut projection : `indexation_en_cours`.
3. Création d'une nouvelle génération.
4. Parcours paginé des enregistrements publiés.
5. Indexation des documents.
6. Vérification du nombre indexé.
7. Activation de la génération.
8. Statut projection : `indexee`.

### 11.2 Mise à jour ponctuelle

Flux :

1. `EnregistrementModifie` reçu.
2. Upsert du document concerné.
3. Journalisation de l'événement traité.
4. La publication reste `indexee` si l'upsert réussit.
5. En cas d'échec répété, statut `indexation_en_erreur`.

### 11.3 Archive

Flux :

1. Le cas d'usage Publications appelle la garde de Consultation via son interface publique.
2. Statut projection : `desindexation_en_cours`.
3. Recherche citoyenne refusée immédiatement.
4. `PublicationArchivee` est écrit dans l'outbox.
5. Le projecteur supprime les documents de la publication.
6. Statut projection : `non_indexee` ou état terminal équivalent.

Si la garde ne peut pas être posée, l'archive ne doit pas être présentée comme terminée à l'administrateur.

---

## 12. Rebuild et replay

### 12.1 Rebuild complet

Le rebuild reconstruit la projection d'une publication depuis la source de vérité Publications.

Il est utilisé quand :

- l'index est corrompu ;
- une génération a échoué ;
- une version d'événement est perdue ou incohérente ;
- une évolution de modèle nécessite une reconstruction ;
- un opérateur veut vérifier la projection avant un pic de charge.

Règles :

- le rebuild ne lit pas directement les tables internes Publications ;
- il utilise une interface publique du module Publications ;
- il est paginé ;
- il produit une nouvelle génération ;
- il active la génération seulement après validation.

Interface conceptuelle attendue côté Publications :

```text
ListerEnregistrementsProjetables(publicationId, cursor, limite)
Retour:
  publicationVersion
  modeleProjection
  enregistrements[]
  nextCursor
```

### 12.2 Replay d'événements

Le replay rejoue les événements outbox ou dead-letter.

Il est utilisé quand :

- le consommateur Consultation était indisponible ;
- un bug de projecteur a été corrigé ;
- une livraison a échoué temporairement.

Règles :

- le replay respecte l'idempotence ;
- le replay ne supprime pas le journal `processed_event` sauf décision opérateur explicite ;
- un replay dangereux doit plutôt déclencher un rebuild complet.

---

## 13. Détection de divergence

La divergence entre Publications et Consultation doit être détectable.

Contrôles recommandés :

| Contrôle | Fréquence | Action si échec |
|---|---|---|
| Nombre d'enregistrements projetables vs documents indexés | Après indexation et périodiquement | `indexation_en_erreur` + rebuild |
| Checksum des identifiants projetés | Après rebuild | Rebuild ou investigation |
| Événements en retard au-delà d'un seuil | Monitoring continu | Alerte |
| Dead-letter non vide | Monitoring continu | Alerte |
| Publication `publiee` mais projection non `indexee` depuis trop longtemps | Monitoring continu | Alerte back-office/opérateur |

La divergence ne doit jamais être silencieuse.

---

## 14. Comportement API et UX

### 14.1 Côté citoyen

Si la publication n'est pas `indexee`, la recherche citoyenne ne doit pas interroger une projection partielle.

Message recommandé :

> Cette publication n'est pas encore disponible pour la recherche. Merci de réessayer dans quelques instants.

La forme exacte du code API sera définie en P0-4.

### 14.2 Côté back-office

Le back-office doit distinguer :

- publication métier créée ;
- publication métier publiée ;
- indexation en cours ;
- publication disponible à la recherche ;
- indexation en erreur.

Exemple :

```text
Publiée — indexation en cours
Publiée — disponible à la recherche
Publiée — erreur d'indexation
```

---

## 15. Tests d'acceptation obligatoires

### 15.1 Outbox

| Cas | Attendu |
|---|---|
| Crash avant commit Publications | Aucun événement durable, aucune projection attendue. |
| Crash après commit mais avant dispatch | Événement repris au redémarrage. |
| Deux dispatchers démarrent | Un seul claim actif par événement. |
| Lock expiré | L'événement peut être repris. |
| Consommateur Consultation échoue | Retry puis `dead_letter` après seuil. |

### 15.2 Idempotence

| Cas | Attendu |
|---|---|
| Même `EnregistrementAjoute` livré deux fois | Un seul document projeté. |
| `EnregistrementModifie` livré deux fois | Même état final. |
| `EnregistrementSupprime` livré deux fois | Succès sans erreur. |
| Même `eventId` avec payload différent | Erreur critique. |
| Version d'agrégat ancienne | Événement ignoré. |

### 15.3 Statut d'indexation

| Cas | Attendu |
|---|---|
| Publication publiée | Statut `indexation_en_cours`. |
| Indexation complète validée | Statut `indexee`. |
| Recherche pendant indexation | Refusée, pas de projection partielle. |
| Erreur persistante | Statut `indexation_en_erreur`. |
| Archive reçue | Recherche immédiatement refusée. |
| Garde Consultation indisponible lors d'une archive | Action back-office non confirmée comme terminée. |

### 15.4 Rebuild

| Cas | Attendu |
|---|---|
| Rebuild initial réussi | Nouvelle génération active. |
| Rebuild échoué à mi-parcours | Ancienne génération non remplacée ou publication non consultable selon contexte. |
| Divergence de compteur | Statut erreur + rebuild possible. |
| Replay événement déjà traité | Aucun changement indésirable. |

---

## 16. Ordre d'implémentation recommandé

1. Étendre le contrat événementiel avec métadonnées obligatoires.
2. Ajouter le statut de projection par publication.
3. Implémenter le journal `processed_event`.
4. Rendre les opérations `upsert/delete` du projecteur idempotentes.
5. Implémenter claim + retry + dead-letter.
6. Implémenter le rebuild complet par publication.
7. Ajouter les contrôles de divergence.
8. Brancher l'UX back-office sur les statuts d'indexation.

---

## 17. Décisions reportées

Les sujets suivants restent hors P0-3 :

- migrations SQL exactes ;
- OpenAPI détaillé ;
- JSON Schemas exécutables ;
- choix définitif de stockage exact : PostgreSQL, Meilisearch configuré strictement ou autre index ;
- stratégie cache Redis ;
- alerting et monitoring opérationnels détaillés.

Ils seront traités par P0-4 ou par les interventions P1 prévues.

---

## 18. Validation de l'intervention P0-3

Critères de validation :

- la livraison outbox est définie comme at-least-once ;
- les projecteurs sont explicitement idempotents ;
- les statuts d'indexation sont définis ;
- une publication non `indexee` n'est pas consultable côté citoyen ;
- retry, dead-letter, replay et rebuild sont spécifiés ;
- la divergence source/index devient détectable ;
- le dossier `files/` n'a pas été modifié ;
- la prochaine intervention peut être P0-4.
