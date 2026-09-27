---
projet: "infUb"
type: "document-de-reference"
phase: "00-intention"
version: "1.0"
date_du_document: 2026-09-02
statut: "Document de référence global pour ouverture d'études approfondies — non normatif"
territoire: "Burkina Faso"
document_enfant: "[[Étude comparative et solution cible]]"
source_originale: "99-sources/DOCUMENT_DE_REFERENCE_GLOBAL_INFRASTRUCTURE_INFORMATION_INSTITUTIONNELLE_V1.0.docx"
converti_le: 2026-09-06
integrite_verifiee: "22607 caractères — identique à la source, aucune divergence"
tags:
  - infUb
  - intention
  - reference
  - non-normatif
---

> [!info] Note de provenance — ajoutée par la mise en coffre, ne fait pas partie du document
> Ce fichier est la conversion Markdown intégrale du `.docx` original, archivé sans modification dans [[infUb/99-sources/Sources originales|Sources originales]].
> Le corps du document ci-dessous est **strictement inchangé** : aucun mot, aucune ponctuation, aucun tableau ni schéma n'a été ajouté, retiré ou reformulé. Seule la mise en forme Word — titres, puces, listes numérotées, tableaux, police monospace des schémas — a été traduite en Markdown, et l'en-tête de propriétés ci-dessus ajouté.
> **Contrôle** : 22 607 caractères de part et d'autre, ponctuation et marqueurs de structure normalisés, **aucune divergence**. Décision `DEC-C-009` au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]].
> Toute modification de fond ouvre une version 1.1 et doit être consignée au journal.

---

**DOCUMENT DE RÉFÉRENCE GLOBAL**

**Infrastructure nationale de publication, de découverte et de diffusion de l’information au Burkina Faso**

*De l’intention fondatrice à la trajectoire d’infrastructure nationale*

| **Élément** | **Valeur** |
|---|---|
| Statut | Document de référence global pour ouverture d’études approfondies |
| Version | 1.0 |
| Date | 2 septembre 2026 |
| Nature | Synthèse stratégique, métier, architecture, UX/UI, MVP et expérimentation |
| Territoire cible | Burkina Faso |
| Méthode directrice | Doctrine Zero-to-One + stratégie/gouvernance + DDD + architecture d’ingénierie |
| Positionnement | Infrastructure d’information, pas média généraliste et pas réseau social classique |
| Finalité | Servir de base de travail pour experts, études sectorielles, conception avancée et validation terrain |

| **Note de lecture** Ce document n’a pas vocation à remplacer les documents spécialisés du projet. Il les relie. Il expose l’évolution de l’idée, les décisions accumulées, le système visé, les hypothèses encore ouvertes et les études qu’il faut maintenant conduire. Toute conclusion présentée comme provisoire doit rester révisable à la lumière des études et de la bêta. |
|---|

# Sommaire directeur

1. Objet et statut du document

1. Genèse et évolution de l’idée

1. Intention fondatrice

1. Problème structurel

1. Vision cible et résultat attendu

1. Ce que le projet est / n’est pas

1. Positionnement par rapport à l’existant et aux canaux actuels

1. Modèle stratégique de l’infrastructure

1. Actif stratégique et position Zero-to-One

1. Architecture métier et DDD

1. Modèle tactique de la publication

1. Architecture d’ingénierie

1. Données et contrats d’intégration

1. Frontend, UX/UI et Design System

1. MVP bêta et vertical slice

1. Expérimentation terrain

1. Trajectoire d’évolution de l’infrastructure

1. Gouvernance et documentation officielle

1. Décisions prises et décisions encore ouvertes

1. Programme d’études approfondies recommandé

1. Résultat attendu des études

1. Conclusion de cadrage

# 1. Objet et statut du document

Le présent document constitue le dossier de passage du projet vers des études plus approfondies. Il rassemble, dans une seule vue cohérente, les éléments produits depuis le document fondateur jusqu’aux étapes de DDD, architecture, UX/UI, spécification du MVP, implémentation et expérimentation.

Il ne doit pas être interprété comme un cahier des charges définitif. Il sert de document-cadre : il donne aux experts humains et aux outils spécialisés un modèle commun du problème à étudier, des choix déjà effectués, des hypothèses à vérifier et des frontières à respecter.

| **Statut architectural** Le projet dispose déjà d’une intention, d’une vision, de frontières métier, d’une première architecture et d’un MVP définis. Il reste cependant à valider plusieurs hypothèses par le terrain, les contraintes institutionnelles, la sécurité, la gouvernance, le contexte juridique, les usages citoyens et les études d’échelle. |
|---|

# 2. Genèse et évolution de l’idée

L’idée n’est pas née comme un projet de réseau social ou de média. Elle est partie d’un constat beaucoup plus précis : les informations utiles au citoyen existent déjà, mais elles sont dispersées entre sites institutionnels, plateformes spécialisées, pages sociales, PDF, canaux de messagerie et republications.

La première formulation se rapprochait d’une plateforme de publications officielles : concours, recrutements, examens, inscriptions, communiqués, calendriers universitaires, informations administratives et autres informations destinées à une population identifiable.

Au fil de la conception, la vision s’est élargie. Le système ne doit plus être limité à un simple catalogue de communiqués : à terme, toute organisation au Burkina Faso pourrait disposer d’une présence structurée, publier ses informations et maintenir une relation informationnelle avec les citoyens qui la suivent.

Cette évolution ne transforme pas immédiatement le produit en réseau social. Elle définit une trajectoire : commencer par une infrastructure à forte valeur institutionnelle, bâtir la couche de confiance et de publication, puis ouvrir progressivement d’autres catégories de producteurs et, éventuellement, des formes d’expression éditoriale ou sociale plus larges.

## 2.1. Formulation initiale

| **Point de départ** Créer un point de consultation fiable pour retrouver les informations publiées par les institutions et les organisations, plutôt que demander au citoyen de mémoriser tous les sites, pages et canaux où elles publient. |
|---|

## 2.2. Évolution vers une infrastructure

- La publication devient un objet canonique, pas seulement un post dans un fil.

- L’institution devient un objet de premier niveau, avec identité, autorisations et historique.

- La recherche devient une fonction fondamentale, indépendante des abonnements.

- La distribution devient ciblée mais ne doit pas enfermer l’information publique.

- L’historique et la validité deviennent des propriétés natives.

- Les réseaux externes restent des canaux de découverte ou de relais, jamais l’autorité de la publication.

- Le système doit pouvoir accueillir progressivement d’autres types d’organisations sans réécrire son noyau.

# 3. Intention fondatrice

Construire une infrastructure numérique nationale permettant aux organisations autorisées de publier une information structurée, identifiable, durable et distribuable, et permettant à tout citoyen de retrouver cette information indépendamment de son abonnement à l’organisation ou du canal par lequel il l’a découverte.

| **Question fondamentale du projet** Comment créer au Burkina Faso un point de référence informationnel où une personne peut retrouver une information relative au pays, à une institution, une organisation, une ville, un secteur, un établissement ou une activité, sans devoir connaître au préalable le canal d’origine ? |
|---|

# 4. Problème structurel

Le problème traité est moins la production d’information que sa fragmentation. Une institution peut publier sur son site, sur Facebook, dans un PDF, par WhatsApp ou via une autre plateforme. Une information peut ensuite être recopiée ou relayée ailleurs. Le citoyen doit faire lui-même le travail de localisation, de comparaison et de vérification.

## 4.1. Frictions identifiées

- Difficulté à retrouver une publication passée.

- Dépendance à l’abonnement à une page sociale.

- Visibilité très limitée d’anciens communiqués noyés dans les fils.

- Multiplication des sources institutionnelles.

- Diffusion par republication sans toujours connaître la source canonique.

- Difficulté à distinguer une version actuelle d’une version ancienne.

- Absence d’un point national de recherche transversal.

- Information institutionnelle mélangée au bruit social et aux contenus sans rapport.

# 5. Vision cible et résultat attendu

La vision cible est celle d’une infrastructure nationale de présence et d’information des organisations au Burkina Faso. Elle doit devenir progressivement un point névralgique de découverte, de publication, de suivi et d’accès aux informations pertinentes.

| **Vision citoyenne** « L’information relative aux institutions, organisations et activités du Burkina Faso que je recherche peut être retrouvée ici ; et les informations qui me concernent peuvent m’être distribuées. » |
|---|

| **Vision organisationnelle** « Une organisation peut disposer d’un espace structuré, publier ses informations et atteindre directement les publics qui ont choisi de la suivre, tout en restant retrouvable publiquement. » |
|---|

## 5.1. Résultat attendu à long terme

- Un registre informationnel national couvrant progressivement l’ensemble du territoire.

- Une présence numérique structurée pour les administrations, institutions, entreprises, associations et autres organisations admissibles.

- Un moteur de recherche transversal de l’information publiée.

- Des flux personnalisés selon les relations de suivi et le contexte.

- Une mémoire des versions et corrections.

- Des canaux d’intégration avec les systèmes institutionnels existants.

- Une base pouvant accueillir ultérieurement de nouvelles infrastructures sans modifier le cœur de confiance et de publication.

# 6. Ce que le projet est / n’est pas

| **Le projet est** | **Le projet n’est pas** |
|---|---|
| Infrastructure nationale d’information | Un média d’actualité généraliste |
| Point de référence pour publications organisationnelles | Un réseau social libre sans cadre |
| Système de publication + recherche + distribution | Un simple agrégateur de contenus |
| Plateforme à source institutionnelle identifiable | Une reproduction de Facebook, TikTok ou X |
| Infrastructure interopérable | Un remplacement obligatoire des SI existants |
| Système avec ouverture progressive | Une plateforme de publication citoyenne sans contrôle |

Le produit peut adopter certaines conventions ergonomiques familières des réseaux sociaux — carte de publication, média, vidéo, commentaires, suivi — sans adopter leur finalité sociale. L’objectif est de réduire la friction d’usage, pas de reproduire leur modèle.

# 7. Positionnement par rapport à l’existant et aux canaux actuels

Le projet doit coexister avec les plateformes existantes. Il ne cherche pas à supprimer les sites institutionnels, les plateformes métiers ou les réseaux sociaux. Il cherche à devenir une couche transversale de publication et de référence.

| **Système / canal** | **Rôle actuel** | **Rôle potentiel dans l’écosystème cible** |
|---|---|---|
| Site institutionnel | Publication directe | Source ou canal complémentaire |
| Facebook | Découverte et relais | Canal de découverte vers la publication canonique |
| TikTok | Découverte rapide / republication | Canal externe de découverte |
| WhatsApp | Diffusion conversationnelle | Canal de relais |
| Plateformes sectorielles | Gestion spécialisée | Système métier / partenaire |
| Infrastructure cible | Couche commune | Référence de publication, recherche, suivi et distribution |
| CheckMe | Consultation d’un statut individuel | Capacité complémentaire pouvant être liée à une publication |

La relation avec CheckMe est particulièrement importante : l’infrastructure répond à la question « qu’est-ce qui a été publié ? », tandis que CheckMe répond à « quel est mon statut individuel ? ». Une publication peut donc pointer vers CheckMe sans absorber son domaine.

# 8. Modèle stratégique de l’infrastructure

```text
Institution / organisation
        ↓
Identité + certification + autorité
        ↓
Publication canonique
        ↓
Contexte / pertinence
        ↓
Recherche + distribution
        ↓
Citoyen
        ↓
Suivi / interaction / téléchargement
```

## 8.1. Les quatre fonctions cardinales

| **Fonction** | **Question utilisateur** | **Responsabilité** |
|---|---|---|
| Publication | Qui publie quoi ? | Créer, valider, versionner |
| Recherche | Où est l’information ? | Retrouver l’information publique |
| Distribution | Qu’est-ce qui me concerne ? | Personnaliser et notifier |
| Persistance | Quelle est la bonne version ? | Conserver historique, validité et provenance |

# 9. Actif stratégique et position Zero-to-One

La doctrine utilisée dans le projet impose de viser une position structurellement difficile à copier plutôt qu’un simple produit. Elle demande également de vérifier deux principes non négociables : actif indétrônable et valeur réelle incontestable. Dans ce projet, l’actif stratégique potentiel n’est pas l’application elle-même.

## 9.1. Actif stratégique potentiel

| **Actif proposé** Le réseau structuré des organisations et de leurs publications, avec leur identité, leurs autorisations, leur historique, leurs relations de pertinence, leurs abonnements et leurs canaux de distribution. |
|---|

Plus l’infrastructure accumule d’organisations, de publications fiables, de relations sémantiques et d’usage citoyen, plus sa valeur devient cumulative. L’actif peut donc survivre à une évolution importante de l’interface ou de l’application.

## 9.2. Validation à poursuivre

- Actif indétrônable : hypothèse forte mais encore à éprouver par gouvernance, adoption institutionnelle et accumulation de réseau.

- Valeur réelle incontestable : à démontrer par expérimentation comparative chez institutions et citoyens.

# 10. Architecture métier et DDD

Le Core Domain provisoire identifié est la « fédération de l’information institutionnelle ». Il couvre la chaîne qui transforme une information produite par une source reconnue en objet canonique, contextualisé, distribuable et retrouvable.

| **Contexte** | **Responsabilité** | **Statut provisoire** |
|---|---|---|
| Identité institutionnelle | Représenter les organisations | Supporting |
| Certification / autorisation | Établir qui peut publier | Supporting |
| Publication institutionnelle | Produire / maintenir les publications canoniques | Core |
| Pertinence / classification | Rattacher une publication à son contexte | Core / Supporting à trancher |
| Distribution | Acheminer l’information | Core / Supporting à trancher |
| Recherche / découverte | Retrouver les publications | Supporting lié au Core |
| Suivi / préférences | Personnaliser le flux | Supporting |
| Interaction | Commentaires / réponses | Supporting |
| Intégration | Connecter les SI / canaux externes | Generic / Supporting |
| Audit | Tracer les opérations | Supporting |

# 11. Modèle tactique de la publication

La publication est l’Aggregate Root central du cycle institutionnel. Son identité canonique survit à ses versions.

```text
Publication
├── PublicationVersion
├── ContentBlocks
│   ├── TEXT
│   ├── IMAGE
│   ├── VIDEO
│   └── DOCUMENT
├── PublicationScope
├── Provenance
└── Attachments
```

## 11.1. Publication multimédia

La publication adopte les conventions éditoriales familières des réseaux sociaux : texte, affiche/image, vidéo, documents et présentation dans un ordre éditorial. Un PDF peut être consulté et téléchargé directement. Une nouvelle version remplace l’ancienne sans détruire l’historique.

## 11.2. Règles fondamentales

- Une publication possède une source institutionnelle.

- Une publication publiée respecte l’autorisation applicable.

- L’identité canonique demeure stable pendant toute la vie de la publication.

- Une publication publique reste recherchable sans abonnement.

- Un canal externe n’est jamais propriétaire de la publication canonique.

- Une panne de distribution ne doit pas annuler une publication valide.

- Un commentaire n’a pas l’autorité de la source institutionnelle.

## 11.3. Cycle de vie

```text
DRAFT → SUBMITTED → APPROVED → PUBLISHED
                            ├→ REVISED → PUBLISHED
                            ├→ SUPERSEDED
                            ├→ CANCELLED
                            └→ EXPIRED / ARCHIVED
```

# 12. Architecture d’ingénierie

La première trajectoire technique repose sur une architecture hexagonale et un monolithe modulaire. Cette décision vise à préserver la séparation des responsabilités sans imposer prématurément une architecture distribuée.

```text
Interfaces
   ↓
Application / Use Cases
   ↓
Domain
   ↑
Adapters / Infrastructure
```

## 12.1. Socle technique de référence

| **Composant** | **Choix de référence** | **Principe** |
|---|---|---|
| Backend | Go | Modulaire, portable, performances prévisibles |
| Transactionnel | PostgreSQL | Source de vérité |
| Stockage de fichiers | S3-compatible object storage | Découplage des binaires |
| IAM | Keycloak / OIDC | Identité séparée de l’autorisation métier |
| Asynchrone | Transactional Outbox | Propagation après commit |
| Frontend | Web responsive / PWA | Premier canal citoyen et institutionnel |
| Conteneurs | OCI / Linux, Podman privilégié | Portabilité et reproductibilité |
| Recherche | PostgreSQL au départ | Moteur dédié seulement si besoin démontré |

## 12.2. Résilience

- Recherche et feed sont des projections reconstructibles.

- Les workers peuvent être rejoués.

- Les événements inter-contextes sont idempotents.

- La publication n’attend pas la réussite de chaque canal secondaire.

- Backup et restauration font partie des critères de qualité.

# 13. Données et contrats d’intégration

La donnée possède un propriétaire métier unique. Les API ne doivent pas exposer les tables internes. Les contrats externes sont versionnés et isolés par des Anti-Corruption Layers.

```text
PublicationPublished
      ↓
Transactional Outbox
      ↓
Consumers
 ├── Search
 ├── Feed
 ├── Notification
 └── Integration
```

## 13.1. Identité canonique

Chaque publication possède un identifiant stable. Les canaux externes peuvent référencer cet identifiant mais ne créent pas une nouvelle identité métier.

## 13.2. Synchronisation

| **Mode** | **Principe** |
|---|---|
| Direct | L’organisation publie directement dans l’infrastructure. |
| Push | Un système externe envoie la publication via contrat. |
| Pull | L’infrastructure récupère depuis un système autorisé. |
| Reference | L’infrastructure référence une source sans en devenir la copie complète. |

# 14. Frontend, UX/UI et Design System

L’expérience est conçue autour de deux univers : citoyen et institution. Ils partagent le même langage visuel mais des responsabilités différentes.

## 14.1. Espace citoyen

```text
Accueil
Recherche
Résultats
Publication
Document
Discussion
Suivis
Profil
```

## 14.2. Espace institutionnel

```text
Dashboard
Publications
Composer
Médias / Documents
Portée / Validité
Aperçu
Validation / Publication
```

## 14.3. Design System

- Foundations : couleur, typographie, espacement, rayon, élévation, motion, breakpoint.

- Primitives : boutons, champs, badges, avatars, tabs, skeletons, modals.

- Composants métier : identité institutionnelle, publication, document, validité, historique, commentaire.

- Patterns : feed, résultats, détail de publication, composer institutionnel.

## 14.4. Règles UX

- La source institutionnelle est visible immédiatement.

- La lecture du contenu prime sur les compteurs et réactions.

- La recherche est une fonction de premier niveau.

- Le suivi personnalise la distribution sans conditionner l’accès public.

- L’interface doit rester utilisable sur mobile et connexion modeste.

- Le preview institutionnel et le rendu public partagent le même renderer.

- Les états loading, empty, error et degraded font partie du contrat d’interface.

# 15. MVP bêta et vertical slice

Le MVP n’est pas la plateforme nationale complète. Il doit prouver une chaîne verticale complète avec une ou plusieurs institutions pilotes.

```text
Institution
   ↓
Publication
   ↓
Texte + Image + PDF
   ↓
Validation
   ↓
Canonicalisation
   ↓
Événement
   ↓
Recherche / Feed
   ↓
Citoyen
   ↓
Consultation / Suivi / Discussion
```

## 15.1. Fonctionnalités P0

- Certification institutionnelle initialement administrée manuellement.

- Création, soumission, approbation, publication et révision.

- Publication multimédia.

- Recherche de publications publiques.

- Feed général et personnalisé.

- Suivi d’une institution ou cible autorisée.

- Commentaires et réponses arborescentes.

- Historique des versions.

- Consultation/téléchargement des PDF.

- Audit et observabilité.

## 15.2. Hors périmètre du MVP

- Réseau social généraliste.

- Publication citoyenne libre.

- Recommandation algorithmique complexe.

- Certification entièrement automatisée.

- Intégration exhaustive de tous les systèmes publics.

- Architecture microservices obligatoire.

- Application native obligatoire.

- Monétisation complexe.

# 16. Expérimentation terrain

La bêta doit tester le modèle et pas seulement le logiciel. Elle compare, lorsque possible, les pratiques habituelles aux parcours de la bêta.

| **Hypothèse** | **Mesure principale** | **Décision possible** |
|---|---|---|
| Retrouvabilité | Succès / temps de recherche | Confirmer / modifier |
| Interface familière | Temps d’apprentissage | Conserver / revoir |
| Multimédia | Usage / compréhension | Conserver / réduire |
| Suivi | Pertinence du flux | Confirmer / revoir |
| Historique | Compréhension de la version | Confirmer / revoir |
| Canal transverse | Intérêt institutionnel | Confirmer / revoir |
| Source canonique | Confiance et compréhension | Confirmer / revoir |

## 16.1. Scénarios prioritaires

- Retrouver une publication sans abonnement.

- Identifier la source institutionnelle.

- Vérifier si l’information est encore valide.

- Télécharger le document officiel.

- Suivre une institution.

- Comprendre une modification de version.

- Participer à une discussion arborescente.

- Publier une communication multimédia depuis une institution.

# 17. Trajectoire d’évolution de l’infrastructure

La vision long terme est désormais plus large que le seul registre de communiqués. Elle reste cependant progressive et gouvernée.

```text
NIVEAU A
Institutions publiques / privées certifiées
        ↓
NIVEAU B
Organisations, associations, entreprises et établissements
        ↓
NIVEAU C
Auteurs / professionnels / producteurs éditoriaux admissibles
        ↓
NIVEAU D — éventuel
Couches sociales ou infrastructures spécialisées
```

L’ouverture de nouveaux producteurs doit préserver la qualité de l’information. La plateforme ne doit pas évoluer vers un flux où le volume et l’engagement cachent l’information utile.

# 18. Gouvernance et documentation officielle

Le projet est organisé autour d’une documentation en couches. Chaque document possède une responsabilité et ne doit pas devenir une copie du projet entier.

| **Document** | **Rôle** |
|---|---|
| Document fondateur | Vision, intention, principes, trajectoire |
| Décisions stratégiques | Arbitrages et évolutions de positionnement |
| DDD stratégique | Core Domain, Bounded Contexts, langage métier |
| DDD tactique | Agrégats, invariants, événements, objets métier |
| Architecture | Structure d’ingénierie et frontières techniques |
| ADR | Décisions techniques et critères de réouverture |
| Spécifications | Périmètre fonctionnel et non fonctionnel du produit |
| UX/UI / Design System | Modèle d’expérience et contrat visuel |
| Expérimentation | Hypothèses, protocole, résultats |
| Jalons | Mémoire courte des grands pas du projet |
| Présent document | Vue de référence commune pour ouvrir des études approfondies |

# 19. Décisions prises et décisions encore ouvertes

## 19.1. Décisions structurantes prises

- Le projet est une infrastructure d’information et non un média généraliste.

- Les publications sont canoniques et indépendantes de leurs canaux.

- Une publication publique reste retrouvable sans abonnement.

- L’institution et son autorité de publication sont distinctes du compte utilisateur.

- Le multimédia est natif : texte, image, vidéo, PDF et documents.

- Les commentaires sont arborescents mais n’ont pas l’autorité de la source.

- Recherche et feed sont des projections reconstructibles.

- Le MVP est un vertical slice.

- Le monolithe modulaire est privilégié au départ.

- Le frontend partage un renderer entre preview et lecture publique.

- Le système doit pouvoir coexister avec Facebook, TikTok, WhatsApp et les SI existants.

- CheckMe est une capacité complémentaire pour les statuts individuels.

## 19.2. Questions ouvertes

- Quel statut juridique et quelle gouvernance doivent encadrer une infrastructure nationale de référence ?

- Quel mécanisme de certification des institutions est suffisamment fiable et praticable ?

- Quel niveau de vérification convient aux différents types d’organisations ?

- Quelle politique de modération des discussions faut-il adopter ?

- Quelle politique de conservation et d’archivage est appropriée ?

- Quelle granularité de pertinence est utile sans devenir intrusive ?

- Quels mécanismes de distribution sont réellement utilisés par les citoyens ?

- Quelles architectures de souveraineté, d’hébergement et de continuité doivent être retenues à l’échelle nationale ?

- Quels mécanismes de signature, provenance et preuve d’intégrité sont nécessaires à terme ?

- À partir de quelles métriques une recherche dédiée devient-elle nécessaire ?

- Quand et comment ouvrir l’infrastructure aux auteurs ou producteurs éditoriaux ?

# 20. Programme d’études approfondies recommandé

Ce document doit maintenant servir de brief commun pour plusieurs études spécialisées. L’objectif n’est pas de tout résoudre ici, mais d’organiser les questions qui permettront de transformer l’hypothèse actuelle en solution optimale.

| **Étude** | **Question centrale** | **Livrable attendu** |
|---|---|---|
| Étude sectorielle Burkina Faso | Comment circule aujourd’hui l’information institutionnelle ? | Cartographie des canaux, acteurs et flux |
| Étude utilisateurs | Comment citoyens et institutions recherchent-ils / publient-ils ? | Profils, parcours, irritants, besoins |
| Étude institutionnelle | Qui peut publier et selon quelles règles ? | Modèle de gouvernance et certification |
| Étude juridique | Quel cadre pour publication, archivage, données et responsabilité ? | Matrice de conformité |
| Étude sécurité | Comment garantir authenticité, intégrité et séparation des rôles ? | Modèle de menace + contrôles |
| Étude souveraineté | Où et comment héberger à long terme ? | Architecture d’hébergement et continuité |
| Étude UX | Quelle interface fonctionne avec les usages réels ? | Tests, recommandations et prototypes |
| Étude informationnelle | Comment classer et distribuer sans bruit ? | Taxonomie, pertinence, règles de feed |
| Étude recherche | Comment rendre toute publication retrouvable ? | Modèle de recherche et indexation |
| Étude réseau / distribution | Quels canaux atteignent effectivement les citoyens ? | Stratégie omnicanale |
| Étude économique | Quel modèle de fonctionnement durable ? | Business / sustainability model |
| Étude architecture à l’échelle | Comment évoluer de la bêta à l’infrastructure nationale ? | Roadmap d’architecture |

# 21. Résultat attendu des études

Les études approfondies doivent permettre de transformer ce dossier de conception en un ensemble de décisions validées, mesurées et adaptées au contexte du Burkina Faso.

| **Résultat global recherché** Obtenir une architecture institutionnelle, métier, informationnelle, juridique, UX, technique et économique suffisamment robuste pour déployer une première infrastructure pilote crédible, puis définir une trajectoire nationale réaliste. |
|---|

## 21.1. Critères de maturation

- Le problème prioritaire est démontré par observations indépendantes.

- La valeur pour les institutions et citoyens est mesurable.

- Le modèle de certification est explicite.

- La publication canonique et son cycle de vie sont stabilisés.

- La taxonomie et la pertinence sont testées.

- La sécurité et la gouvernance sont documentées.

- Le MVP est techniquement reproductible.

- Le pilote produit des métriques exploitables.

- Les décisions nationales sont distinguées des hypothèses de produit.

- La trajectoire d’échelle est compatible avec les capacités réelles disponibles.

# 22. Conclusion de cadrage

Le projet a évolué d’une idée de consultation de communiqués vers une proposition beaucoup plus structurante : une infrastructure nationale capable d’accueillir les publications des organisations, de leur donner une identité institutionnelle, de les rendre retrouvables durablement, de les distribuer selon les contextes et de maintenir une relation informationnelle avec les citoyens.

La direction de long terme est ambitieuse, mais elle ne doit pas conduire à surcharger le premier produit. La première version doit prouver la chaîne fondamentale avec des institutions et des citoyens réels. Le système devra pouvoir apprendre du terrain sans casser son socle.

| **Point de passage** Ce document constitue désormais le point d’entrée recommandé pour toute expertise extérieure, étude sectorielle ou analyse spécialisée. Toute étude future devrait explicitement indiquer quelles hypothèses elle confirme, infirme ou modifie, et dans quel document de gouvernance la nouvelle décision doit être enregistrée. |
|---|
