# Media Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-MEDIA-001

---

# 1. Objet

Le **Media Context** est le Bounded Context de la couche Platform Services responsable du stockage, du traitement (transcodage), de l'extraction de métadonnées et de la sécurisation des accès pour l'ensemble des fichiers médias (vidéos, enregistrements audio, images, documents PDF, etc.) de la plateforme LevelUP.

Il garantit que tout média brut importé est converti dans des formats web optimisés, sécurisé par des jetons d'accès temporaires et indexable techniquement.

---

# 2. Mission

Fournir un service d'hébergement, de transcodage et de distribution sécurisée des contenus riches de la plateforme, permettant aux concepteurs pédagogiques et aux apprenants de manipuler des documents multimédias fluides, légers et protégés.

---

# 3. Position dans l'écosystème

Le Media Context appartient à la **Platform Services Layer**.

Il sert de gestionnaire de fichiers sous-jacent pour le **Knowledge Context** (ressources de cours), le **Content Delivery Context** (qui distribue ses fichiers optimisés) et le **Portfolio / Assessment Contexts** (pour l'hébergement des preuves sous forme de captures, vidéos ou rapports d'évaluation).

---

# 4. Vision métier

Un apprentissage moderne s'appuie sur la richesse des supports. Cependant, les fichiers vidéos bruts ou les captures d'écran non compressées pénalisent les performances réseau. Fidèle au principe de rigueur de LevelUP, le Media Context doit :
1.  **Optimiser l'infrastructure :** Compresser et transcoder automatiquement pour éviter les surcharges.
2.  **Sécuriser l'accès :** Les preuves de compétences ou les cours privés ne doivent pas être publiquement exposés sur internet sans contrôle.
3.  **Qualifier le contenu :** Extraire les métadonnées techniques (durée d'une vidéo, dimensions d'une image) nécessaires aux moteurs de recommandation et de planification.

---

# 5. Responsabilités

Le Media Context est responsable de :

*   héberger et organiser les fichiers médias bruts importés (`Media Assets`) ;
*   transcoder les fichiers en versions adaptées au web (`Media Variants`) ;
*   gérer le cycle de vie des tâches de traitement asynchrone (`Transcoding Jobs`) ;
*   extraire les informations techniques des fichiers (durée, taille, résolution, format) ;
*   sécuriser la lecture en délivrant des liens d'accès temporaires et signés (`Signed URLs`).

Il n'est jamais responsable :
*   d'associer les fichiers à des concepts pédagogiques (responsabilité du `Knowledge Context`) ;
*   d'évaluer le contenu d'un fichier (responsabilité du `Assessment Context`).

---

# 6. Ubiquitous Language

## Media Asset
Actif multimédia unique et immuable stocké sur la plateforme, caractérisé par un identifiant, un propriétaire et un fichier physique d'origine.

## Media Variant
Déclinaison optimisée d'un actif média (ex: version 720p d'une vidéo, miniature JPEG d'une image brute, version allégée d'un PDF).

## Transcoding Job
Tâche asynchrone de conversion, de compression ou de transcodage d'un actif média.

## Metadata Extraction
Processus d'analyse technique du fichier permettant d'identifier ses propriétés internes (dimensions, codecs, débit, nombre de pages).

## Signed URL
Lien d'accès web temporaire et signé numériquement permettant à un utilisateur autorisé de lire ou télécharger un média privé pendant une durée limitée.

---

# 7. Modèle métier

```text
Upload de fichier brut (Concepteur/Apprenant)
                     │
                     ▼
               [ Media Asset ]
                     │
                     ├────────► Lance ➔ [ Transcoding Job ]
                     │                          │
                     │                          ▼
                     ├────────► Génère ➔ [ Media Variants ]
                     │                          │
                     ▼                          ▼
            [ Metadata Extraction ]      [ Storage Bucket ]
                     │
                     ▼
             Exposition sécurisée via [ Signed URL Generator ]
```

---

# 8. Principes métier

## Principe 1 — Immutabilité de l'actif d'origine
Une fois importé, le média brut ne peut plus être modifié. Toute modification d'un support pédagogique génère un nouvel actif média avec son propre identifiant.

## Principe 2 — Automatisation du traitement
Dès l'importation complète du fichier brut, les tâches de transcodage et d'extraction de métadonnées sont lancées de manière asynchrone sans intervention humaine.

## Principe 3 — Sécurité par défaut
Aucun lien brut vers les espaces de stockage (cloud storage buckets) n'est exposé. L'accès aux médias privés se fait exclusivement via des URLs temporaires signées.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **MediaAsset :** Racine d'agrégat représentant l'actif média, encapsulant l'ensemble de ses variantes et son état de traitement global.

## 9.2 Entités
*   **MediaVariant :** Version déclinée d'un média physique.
*   **TranscodingJob :** Suivi de la tâche asynchrone de transcodage.

## 9.3 Value Objects
*   **MediaId / JobId :** Identifiants uniques.
*   **AssetMetadata :** Dimensions, durée, format, taille du fichier.
*   **SignedContext :** Droits et durée de validité associés à une URL signée.
*   **ProcessingStatus :** États du job (`Uploading`, `Processing`, `Ready`, `Failed`).

## 9.4 Domain Services
*   **TranscoderEngine :** Service technique gérant la conversion vidéo, audio et image (encapsulant FFMPEG ou des services cloud de transcodage).
*   **UrlSigner :** Service générant les signatures cryptographiques pour sécuriser l'accès.
*   **MetadataExtractor :** Service extrayant les propriétés du fichier.

## 9.5 Domain Events
*   **MediaAssetUploaded :** Importation du fichier brut réussie.
*   **TranscodingJobStarted :** Début du traitement asynchrone.
*   **MediaVariantGenerated :** Une variante optimisée a été créée.
*   **MediaAssetReady :** Le média est entièrement traité et disponible.
*   **MediaAssetFailed :** Échec du traitement du fichier.

---

# 10. Invariants

1.  Une variante (`MediaVariant`) doit obligatoirement être rattachée à un actif d'origine (`MediaAsset`) valide.
2.  Un média ne peut pas être marqué comme `Ready` si l'extraction des métadonnées minimales (taille, type MIME) a échoué.
3.  Les signatures d'URL doivent utiliser des clés d'autorisation privées à la plateforme et inclure une date d'expiration stricte.

---

# 11. Relations avec les autres Bounded Contexts

*   **Knowledge Context :** Référence les `MediaAssets` dans les ressources de cours.
*   **Assessment & Portfolio Contexts :** Importent des captures, PDF et vidéos servant de preuves (`Evidence`) et s'appuient sur le Media Context pour leur stockage et leur lecture sécurisée.
*   **Content Delivery Context :** Consomme les variantes optimisées (ex: flux vidéo) pour la distribution CDN et locale.

---

# 12. Décisions architecturales

Le Media Context sépare la logique métier d'orchestration de l'infrastructure de stockage physique (ex: Amazon S3, Google Cloud Storage) et de traitement (ex: AWS Elemental MediaConvert, instances de transcodage dédiées). 

Ces dépendances matérielles sont dissimulées derrière l'interface du service de domaine `TranscoderEngine`.
