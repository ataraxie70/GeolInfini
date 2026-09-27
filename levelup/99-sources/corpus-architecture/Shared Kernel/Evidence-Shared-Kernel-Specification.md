# Evidence Shared Kernel Specification

**Version :** 1.0 (Draft)

**Statut :** Shared Kernel

**Catégorie :** Architecture Foundation

**Code :** LEVELUP-SK-EVIDENCE-001

---

# 1. Objet

L'**Evidence Shared Kernel** définit le modèle universel de représentation des preuves au sein de l'architecture LevelUP.

Il fournit un langage commun permettant à tous les Bounded Contexts producteurs et consommateurs de représenter, échanger et interpréter les preuves de manière cohérente.

L'Evidence Shared Kernel ne produit aucune preuve.

Il définit uniquement leur structure, leurs propriétés et leurs contrats d'échange.

---

# 2. Mission

Fournir un modèle partagé permettant de représenter toute preuve démontrant objectivement une connaissance, une compétence, une réalisation ou une validation dans l'écosystème LevelUP.

---

# 3. Vision architecturale

Dans LevelUP, aucune affirmation de compétence ne possède de valeur en elle-même.

Toute compétence, connaissance ou réalisation doit pouvoir être justifiée par une ou plusieurs preuves objectives, traçables et vérifiables.

L'Evidence constitue ainsi l'unité fondamentale de confiance de la plateforme.

---

# 4. Définition

Une **Evidence** est une représentation normalisée d'un fait observable produit par un système, une activité ou une évaluation démontrant objectivement un acquis.

Une Evidence décrit un événement.

Elle n'interprète jamais cet événement.

---

# 5. Principes fondateurs

## Principe 1 — Une Evidence représente un fait

Une Evidence décrit un événement objectivement observable.

Elle ne contient aucune interprétation métier.

---

## Principe 2 — Une Evidence possède toujours une origine

Chaque Evidence est produite par un contexte, un système ou un organisme identifiable.

---

## Principe 3 — Une Evidence est traçable

Son origine, sa date de production et son contexte doivent pouvoir être retrouvés.

---

## Principe 4 — Une Evidence est vérifiable

Chaque preuve doit pouvoir être vérifiée selon les mécanismes définis par son producteur.

---

## Principe 5 — Une Evidence est immuable

Une fois publiée, son contenu ne peut être modifié.

Toute évolution donne lieu à une nouvelle version ou à une nouvelle Evidence.

---

# 6. Producteurs

Une Evidence peut être produite notamment par :

* Assessment Context ;
* Activity Context ;
* Progress Context ;
* Certification Context ;
* Portfolio Import Services ;
* Connecteurs externes ;
* Services d'intégration ;
* Plateformes partenaires.

---

# 7. Consommateurs

Une Evidence peut être consommée notamment par :

* Portfolio Context ;
* Analytics Context ;
* Recommendation Context ;
* Search Context ;
* Reporting Services.

---

# 8. Structure conceptuelle

```text
Evidence
│
├── Evidence Identifier
├── Evidence Type
├── Producer
├── Source
├── Timestamp
├── Confidence Level
├── Verification Metadata
├── Reference
├── Version
└── Additional Metadata
```

---

# 9. Attributs communs

Toute Evidence possède au minimum :

* un identifiant unique ;
* un type ;
* un producteur ;
* une source ;
* une date de production ;
* une référence vers l'événement d'origine ;
* un niveau de confiance ;
* des informations de vérification ;
* une version ;
* des métadonnées complémentaires.

---

# 10. Confidence Level

Le niveau de confiance exprime la crédibilité accordée à une preuve.

Il constitue une information descriptive.

Il ne remplace jamais les décisions métier des contextes consommateurs.

Le Shared Kernel ne fixe pas les niveaux exacts ; il impose seulement l'existence d'un mécanisme de qualification de la confiance.

---

# 11. Verification Metadata

Les informations de vérification peuvent inclure notamment :

* identifiant de validation ;
* organisme émetteur ;
* examinateur ;
* signature ;
* empreinte numérique ;
* mécanisme de contrôle ;
* références externes.

Le contenu exact dépend du contexte producteur.

---

# 12. Contrat d'échange

Toute Evidence publiée dans l'écosystème LevelUP respecte les garanties suivantes :

* structure commune ;
* origine identifiable ;
* immutabilité ;
* traçabilité ;
* versionnement ;
* possibilité de vérification.

---

# 13. Éléments exclus

L'Evidence Shared Kernel ne définit pas :

* les règles d'évaluation ;
* les niveaux de compétence ;
* les politiques de validation ;
* les décisions pédagogiques ;
* les calculs de progression ;
* les agrégations de preuves.

Ces responsabilités restent dans leurs Bounded Contexts respectifs.

---

# 14. Évolution

Toute évolution du modèle Evidence suit les règles définies dans le **Shared Kernel Architecture Specification**.

Les modifications doivent préserver la compatibilité avec les contextes consommateurs ou faire l'objet d'un versionnement explicite.

---

# 15. Décisions architecturales

L'Evidence Shared Kernel constitue le premier modèle partagé officiel de LevelUP.

Il instaure un langage commun autour de la notion de preuve et garantit que tous les contextes de la plateforme manipulent des informations homogènes, traçables et vérifiables.

Cette normalisation renforce la cohérence de l'architecture, facilite les échanges entre Bounded Contexts et permet au Portfolio, à l'Analytics et aux autres services transverses de raisonner sur des preuves indépendamment de leur origine, tout en laissant à chaque contexte métier la responsabilité de produire et d'interpréter ces preuves.
