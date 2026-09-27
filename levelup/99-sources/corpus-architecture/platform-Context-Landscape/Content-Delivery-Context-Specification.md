# Content Delivery Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-CONTENT-DELIVERY-001

---

# 1. Objet

Le **Content Delivery Context** est le Bounded Context de la couche Platform Services responsable de la distribution technique, du stockage temporaire (caching), de l'optimisation des formats et de la synchronisation hors-ligne des contenus pédagogiques (textes, vidéos, fichiers, interactifs) consommés par les apprenants.

Il fait le pont entre le référentiel logique des connaissances et l'appareil physique de l'utilisateur en s'assurant que le contenu est livré avec une latence minimale et une résilience maximale.

---

# 2. Mission

Garantir une accessibilité fluide et continue aux ressources d'apprentissage, y compris en situation de mobilité ou de connectivité dégradée, en fournissant des mécanismes de packaging compressé, de streaming adaptatif et de synchronisation locale (offline-first).

---

# 3. Position dans l'écosystème

Le Content Delivery Context appartient à la **Platform Services Layer**.

Il sert d'infrastructure de diffusion au **Knowledge Context** (qui stocke les ressources et références logiques) et collabore avec le **Activity Context** afin de pré-télécharger (prefetch) les contenus requis pour les activités planifiées à court terme.

---

# 4. Vision métier

Pour installer une discipline de fer, l'apprenant ne doit subir aucune friction technique. Un temps de chargement de vidéo trop long, un PDF qui ne s'ouvre pas dans le train, ou l'absence de réseau ne doivent jamais servir de prétexte à l'abandon d'une session de travail. 

Le Content Delivery Context matérialise l'engagement d'une plateforme "offline-first" : le savoir doit être disponible instantanément, n'importe où, sur n'importe quel écran.

---

# 5. Responsabilités

Le Content Delivery Context est responsable de :

*   compiler les ressources pédagogiques (fichiers, textes, codes) en paquets compressés légers (`Content Packages`) ;
*   gérer les manifestes de synchronisation hors-ligne (`Offline Manifests`) ;
*   orchestrer la distribution via des réseaux de diffusion de contenu (`CDN`) ou des serveurs de cache ;
*   adapter dynamiquement la qualité des médias (vidéo/audio) en fonction de la bande passante (`Bandwidth Profile`) ;
*   vérifier l'intégrité et la signature numérique des fichiers livrés.

Il n'est jamais responsable :
*   d'organiser les métadonnées logiques ou les auteurs des ressources (responsabilité du `Knowledge Context`) ;
*   d'ordonnancer les étapes d'apprentissage (responsabilité du `Learning Context`).

---

# 6. Ubiquitous Language

## Content Package
Ensemble de ressources pédagogiques (fichiers markdown, images, exercices) packagé et compressé pour un téléchargement ou une consultation rapide.

## Offline Manifest
Fichier de configuration listant de manière exhaustive toutes les ressources (et leurs empreintes cryptographiques) nécessaires pour exécuter hors-ligne une étape du programme d'apprentissage.

## Delivery Endpoint
Point de terminaison réseau (serveur CDN, cache applicatif local) d'où le contenu est physiquement téléchargé.

## Bandwidth Profile
Profil de connectivité détecté (ex: `HighSpeed`, `LowConnection`, `Offline`) orientant la stratégie de chargement des médias.

## Media Adaptor
Composant technique charge de transcoder ou de sélectionner la résolution optimale d'un fichier vidéo ou audio.

---

# 7. Modèle métier

```text
Knowledge Context (Ressources logiques) ➔ Émet
                                            │
                                            ▼
                              [ Content Packager Service ]
                                            │
                                            ▼
                              [ Content Delivery Package ]
                                            │
                                  ├── Offline Manifest (SHA-256)
                                  ├── Content Streams (Vidéo/Audio)
                                  └── Caching Policies
                                            │
                                            ▼
                           ┌────────────────┴────────────────┐
                           ▼                                 ▼
                     Local Cache (Offline)              Global CDN
```

---

# 8. Principes métier

## Principe 1 — Offline-First
Le système anticipe les besoins de l'apprenant en téléchargeant en tâche de fond les ressources des activités prévues pour les 48 prochaines heures.

## Principe 2 — Intégrité des données
Chaque élément de contenu livré localement est validé à l'aide d'un hash SHA-256 défini dans le manifeste pour éviter toute corruption de données.

## Principe 3 — Économie de données
Le système respecte les enveloppes de connectivité de l'utilisateur (ex: ne pas télécharger de vidéos lourdes sur un réseau mobile cellulaire sans autorisation).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **ContentDeliveryPackage :** Racine d'agrégat représentant l'unité de contenu optimisée pour la livraison, son manifeste et son état de synchronisation.

## 9.2 Entités
*   **OfflineManifest :** Liste ordonnée des fichiers requis pour une autonomie hors-ligne.
*   **DeliveryEndpoint :** Point d'accès réseau utilisé pour distribuer le package.

## 9.3 Value Objects
*   **PackageId :** Identifiant URN du package.
*   **BandwidthProfile :** État courant de la connectivité réseau.
*   **Checksum :** Empreinte SHA-256 du fichier pour validation.
*   **DeliveryStatus :** États du package (`Staged`, `Downloading`, `Cached`, `Outdated`).

## 9.4 Domain Services
*   **ContentCompiler :** Service qui assemble les éléments dispersés du Knowledge Context en un package autonome.
*   **AdaptiveStreamSelector :** Service de gestion de la qualité vidéo dynamique (HLS/DASH).

## 9.5 Domain Events
*   **PackageCompiled :** Le paquet de contenu est prêt à être distribué.
*   **OfflineManifestGenerated :** Le manifeste de synchronisation a été créé.
*   **PackageCachedLocally :** Les fichiers ont été entièrement répliqués sur l'appareil de l'apprenant.
*   **ContentCorruptionDetected :** Échec de validation du hash lors du téléchargement.

---

# 10. Invariants

1.  Le hash cryptographique (`Checksum`) d'un fichier téléchargé doit correspondre exactement à celui inscrit dans l' `OfflineManifest` d'origine.
2.  Un package marqué `Cached` ne peut pas être modifié localement de manière arbitraire ; toute mise à jour de contenu invalide le cache et force un nouveau téléchargement.

---

# 11. Relations avec les autres Bounded Contexts

*   **Knowledge Context :** Fournit les ressources brutes et les références pédagogiques.
*   **Activity Context :** Communique l'ordre des activités à venir pour prioriser les téléchargements en tâche de fond.
*   **Governance Context :** Fournit les limites d'espace de stockage alloué au cache local.

---

# 12. Décisions architecturales

Le Content Delivery Context s'appuie sur des technologies CDN standards (comme Cloudflare ou AWS CloudFront) pour la distribution mondiale, et sur des Service Workers ou bases de données de stockage local (comme IndexedDB, SQLite) au niveau de l'appareil client pour supporter le mode hors-ligne. 

Ces détails techniques sont encapsulés sous les interfaces d'infrastructure de notre domaine.
