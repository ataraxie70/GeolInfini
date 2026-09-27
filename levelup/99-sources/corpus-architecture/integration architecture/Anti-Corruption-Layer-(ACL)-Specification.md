# Anti-Corruption Layer (ACL) Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Integration Architecture

**Code :** LEVELUP-ARCH-ACL-001

---

# 1. Objet

L'**Anti-Corruption Layer (ACL)** définit les principes, les responsabilités et les mécanismes permettant d'intégrer des systèmes externes à l'écosystème LevelUP sans compromettre son modèle métier, son langage ubiquitaire ni ses principes architecturaux.

L'ACL constitue la frontière officielle entre le domaine LevelUP et les systèmes externes.

---

# 2. Mission

Préserver l'intégrité du modèle métier de LevelUP en traduisant les concepts, données et interactions des systèmes externes vers le langage du domaine, et inversement lorsque cela est nécessaire.

---

# 3. Vision architecturale

LevelUP évolue dans un écosystème composé de nombreuses plateformes, services et référentiels externes.

Chaque système possède son propre vocabulaire, ses propres modèles et ses propres conventions.

L'Anti-Corruption Layer empêche ces modèles externes de pénétrer directement dans les Bounded Contexts de LevelUP.

Toute interaction avec un système externe passe obligatoirement par un ACL dédié.

---

# 4. Définition

Un **Anti-Corruption Layer** est un composant d'intégration chargé de traduire, adapter et isoler les échanges entre LevelUP et un système externe.

Il agit comme un interprète entre deux langages de domaine indépendants.

---

# 5. Principes fondateurs

## Principe 1 — Protection du domaine

Aucun modèle externe ne peut être utilisé directement dans un Bounded Context.

Toute information est traduite vers le langage de LevelUP.

---

## Principe 2 — Préservation du langage ubiquitaire

Les concepts internes de LevelUP ne sont jamais remplacés par ceux des systèmes externes.

Le vocabulaire du domaine reste la référence unique.

---

## Principe 3 — Traduction bidirectionnelle

L'ACL prend en charge :

* l'import des informations vers LevelUP ;
* l'export des informations vers les systèmes externes.

Chaque direction possède ses propres règles de traduction.

---

## Principe 4 — Isolation des dépendances

Les dépendances techniques, protocoles et formats externes sont confinés dans l'ACL.

Les Bounded Contexts restent indépendants des technologies utilisées par les partenaires.

---

## Principe 5 — Neutralité métier

L'ACL traduit et adapte les échanges.

Il ne prend aucune décision métier et ne remplace jamais les règles des Bounded Contexts.

---

# 6. Responsabilités

Un ACL est responsable de :

* la traduction des modèles ;
* l'adaptation des formats ;
* la conversion des identifiants ;
* la gestion des versions des interfaces externes ;
* la validation structurelle des échanges ;
* la transformation des erreurs externes en contrats compréhensibles par LevelUP.

---

# 7. Responsabilités exclues

Un ACL ne doit jamais :

* appliquer les règles métier de LevelUP ;
* valider une compétence ;
* calculer une progression ;
* produire une recommandation ;
* modifier les politiques pédagogiques ;
* accéder directement aux modèles internes d'un autre Bounded Context.

---

# 8. Architecture d'intégration

Les échanges suivent systématiquement le modèle suivant :

```text
Système externe
        │
        ▼
Anti-Corruption Layer
        │
        ▼
Published Language
        │
        ▼
Bounded Context
```

Le chemin inverse suit la même logique lors des exports.

---

# 9. Types d'adaptations

Un ACL peut réaliser notamment :

* traduction terminologique ;
* transformation des structures de données ;
* conversion des formats ;
* adaptation des protocoles ;
* gestion des identifiants externes ;
* normalisation des métadonnées ;
* enrichissement technique nécessaire à l'intégration.

---

# 10. Gouvernance

Chaque système externe possède son propre ACL.

Chaque ACL :

* possède un propriétaire identifié ;
* est documenté ;
* suit un cycle de versionnement ;
* est testé indépendamment ;
* évolue selon les changements du système externe concerné.

Les évolutions d'un ACL ne doivent pas imposer de modifications aux modèles métiers internes.

---

# 11. Relations avec les autres spécifications

L'Anti-Corruption Layer s'appuie sur :

* Integration Architecture Specification ;
* Published Language Specification ;
* Command Architecture Specification ;
* Query Architecture Specification ;
* Event Architecture Specification ;
* Shared Kernel Architecture Specification.

Il constitue le mécanisme officiel de protection des frontières entre LevelUP et les systèmes externes.

---

# 12. Cas d'application

Des ACL peuvent être développés pour intégrer :

* des plateformes d'apprentissage ;
* des fournisseurs de certifications ;
* des plateformes de développement collaboratif ;
* des systèmes de gestion de formation (LMS) ;
* des plateformes de gestion des compétences ;
* des services RH ;
* des catalogues de ressources ;
* des référentiels de connaissances.

Chaque ACL reste spécialisé dans le système auquel il est associé.

---

# 13. Décisions architecturales

Tout échange entre LevelUP et un système externe passe obligatoirement par un Anti-Corruption Layer.

Cette règle garantit que les évolutions des systèmes partenaires n'affectent pas directement les Bounded Contexts de LevelUP, protège le langage ubiquitaire et préserve les principes pédagogiques ainsi que les décisions d'architecture de la plateforme.

L'ACL constitue ainsi le mécanisme officiel d'isolation, de traduction et d'adaptation entre l'écosystème externe et le domaine métier de LevelUP.
