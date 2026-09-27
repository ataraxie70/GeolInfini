---
projet: "synapse"
type: "document-de-reference"
phase: "00-intention"
objet: "Vision, intention, problématique, domaines métiers, acteurs, architecture directrice, gouvernance et trajectoire d'évolution"
identifiant_source: "SYNAPSE-REF-001"
version: "1.0"
statut_documentaire: "Référence stratégique et conceptuelle — se déclare ni cahier des charges contractuel, ni spécification d'implémentation"
provenance: "SYNAPSE_document_reference_global.md"
mise_en_conformite: 2026-09-07
tags:
  - synapse
  - intention
  - vision
---

> [!warning] Le périmètre décrit ici a été réduit par le dossier de faisabilité
> Le [[Dossier de faisabilité]] (REF-003) retire du périmètre de démarrage neuf familles de composants décrites dans ce document — environnements de travail verticaux, débat structuré, hébergement vidéo, score de réputation agrégé, badges, architecture en cellules, pile polyglotte, chaîne éditoriale de revue par les pairs, bus d'événements avec Elasticsearch et Redis en V1 — et écarte, diffère ou réduit la majeure partie de la pile technique des points 15 et 16. Son point 6 y oppose une orientation unique : **monolithe modulaire, un seul langage backend, PostgreSQL comme socle**.
> **Aucun de ces retraits n'est définitif, et aucun n'est inscrit au journal.** Ce document reste la référence de la cible ; il ne décrit plus le périmètre de démarrage. Le lire avec le dossier de faisabilité à côté.

# SYNAPSE — DOCUMENT DE RÉFÉRENCE GLOBAL
## Vision, intention, problématique, périmètre, orientations et cible du système

**Identifiant :** SYNAPSE-REF-001  
**Version :** 1.0  
**Statut :** Document de référence stratégique et conceptuel  
**Nature :** Document fondateur de synthèse  
**Périmètre :** Vision, motivation, domaines, acteurs, proposition de valeur, architecture directrice, stratégie de rétention et trajectoire d’évolution

---

## 0. Note de méthode

Ce document consolide les orientations développées au cours des différentes analyses de SYNAPSE : identité et confiance, Proof of Skill, portfolio vivant, validation, réputation, mentorat, matching, opportunités, publications scientifiques et intellectuelles, valorisation des chercheurs/auteurs/penseurs, thèses et mémoires, événements académiques, workspaces professionnels, communautés, gouvernance, sécurité, performance, accessibilité et architecture distribuée.

Il ne constitue pas encore un cahier des charges contractuel ni une spécification d’implémentation détaillée. Il fixe le **sens du système**, son **périmètre conceptuel**, les **principes qui doivent rester stables**, ainsi que les orientations qui devront guider les futurs RFC, dossiers fonctionnels et décisions d’architecture.

---

# 1. IDENTITÉ DU PROJET

## 1.1 Nom

**SYNAPSE**

## 1.2 Nature

SYNAPSE est conçu comme une **infrastructure nationale numérique de confiance, de visibilité, de preuve et de mise en relation**.

Il ne doit pas être considéré comme :

- un simple réseau social ;
- un simple CV en ligne ;
- un simple job board ;
- une simple plateforme de publication ;
- un simple annuaire ;
- un LMS ;
- un portail administratif.

Ces fonctions peuvent exister dans le système, mais elles ne constituent pas à elles seules sa raison d’être.

## 1.3 Formulation synthétique

> **SYNAPSE doit rendre le capital humain et intellectuel identifiable, vérifiable, visible, connectable et exploitable.**

---

# 2. VISION

## 2.1 Vision générale

SYNAPSE a pour ambition de créer une infrastructure dans laquelle une personne peut construire une trajectoire numérique durable autour de ce qu’elle **sait**, de ce qu’elle **produit**, de ce qu’elle **a prouvé**, de ce que d’autres **ont validé**, de ce qu’elle **publie** et de ce à quoi elle peut **contribuer professionnellement ou intellectuellement**.

La plateforme doit ainsi établir une continuité entre :

**identité → compétence → preuve → validation → réputation → visibilité → opportunité → expérience → progression.**

Cette chaîne constitue l’un des principes structurants du projet.

## 2.2 Vision nationale

À l’échelle nationale, SYNAPSE doit contribuer à construire une représentation plus utile du capital humain et intellectuel : non pas uniquement par les diplômes, les titres ou les déclarations, mais par les **preuves, productions, validations, contributions et relations professionnelles**.

## 2.3 Vision institutionnelle

Le système doit également fournir aux institutions une infrastructure capable de :

- publier ;
- vérifier ;
- valoriser ;
- organiser ;
- relier ;
- observer ;
- auditer.

Il doit permettre de mieux faire circuler la connaissance et d’établir davantage de confiance entre les acteurs.

---

# 3. INTENTION FONDATRICE

L’intention profonde du projet est de réduire l’écart entre :

- ce qu’une personne sait réellement faire ;
- ce qu’elle peut prouver ;
- ce que les autres peuvent vérifier ;
- ce que les institutions peuvent reconnaître ;
- et les opportunités auxquelles elle peut réellement accéder.

Cette intention se prolonge au-delà de la compétence professionnelle.

SYNAPSE doit aussi traiter l’écart entre :

- la recherche produite et sa visibilité ;
- les travaux académiques et leur diffusion ;
- les auteurs et leur audience ;
- les événements scientifiques et leur accessibilité ;
- les institutions productrices de connaissance et leur rayonnement.

---

# 4. PROBLÉMATIQUE

## 4.1 Fragmentation du capital humain

Les compétences sont dispersées entre :

- parcours universitaires ;
- formations ;
- expériences de terrain ;
- apprentissage autonome ;
- communautés ;
- projets personnels ;
- contributions collectives.

Le CV classique réduit cette richesse à une représentation statique.

## 4.2 Déficit de confiance

Une déclaration de compétence n’est pas équivalente à une compétence démontrée.

Le système doit donc pouvoir distinguer :

- déclaration ;
- preuve ;
- validation ;
- certification ;
- réputation.

## 4.3 Difficulté de mise en relation

Les entreprises, institutions et porteurs de projets doivent pouvoir identifier des personnes pertinentes à partir de signaux plus riches qu’un titre ou quelques mots-clés.

## 4.4 Invisibilité de la production intellectuelle

Les chercheurs, auteurs, penseurs, laboratoires et institutions produisent des contenus qui peuvent rester dispersés, difficiles à rechercher et difficiles à suivre.

Les thèses, mémoires, articles, essais, soutenances et conférences doivent être considérés comme des objets numériques de première classe.

## 4.5 Faible visibilité des événements de savoir

Les soutenances, colloques, séminaires, journées scientifiques et grands événements thématiques peuvent être difficiles à découvrir hors des réseaux institutionnels immédiats.

SYNAPSE doit donc construire une **mémoire et un agenda du savoir**.

## 4.6 Contraintes d'accès

La solution doit être compatible avec :

- mobilité dominante ;
- terminaux hétérogènes ;
- connectivité variable ;
- faible débit ;
- interruptions de réseau.

L’accessibilité n’est donc pas une fonction secondaire.

---

# 5. RÉPONSE GLOBALE

SYNAPSE répond à la problématique par sept capacités fondamentales.

## 5.1 Identifier

Construire une identité durable et un niveau de confiance associé.

## 5.2 Prouver

Associer des compétences à des artefacts et réalisations réelles.

## 5.3 Valider

Permettre à des mentors, pairs ou institutions habilités de vérifier les preuves.

## 5.4 Publier

Rendre visibles les productions scientifiques, académiques, professionnelles et intellectuelles.

## 5.5 Connecter

Mettre en relation personnes, institutions, communautés, projets et opportunités.

## 5.6 Produire

Permettre des environnements de travail spécialisés dans lesquels les utilisateurs peuvent réellement construire et collaborer.

## 5.7 Capitaliser

Transformer les interactions, expériences et contributions en historique réutilisable.

---

# 6. ACTEURS DU SYSTÈME

## 6.1 Individus

- étudiants ;
- apprenants ;
- diplômés ;
- autodidactes ;
- professionnels ;
- chercheurs ;
- enseignants-chercheurs ;
- écrivains ;
- penseurs ;
- mentors.

## 6.2 Acteurs économiques

- entreprises ;
- recruteurs ;
- consultants ;
- startups ;
- porteurs de projets ;
- organisations professionnelles.

## 6.3 Acteurs scientifiques et culturels

- universités ;
- écoles ;
- laboratoires ;
- centres de recherche ;
- revues ;
- bibliothèques ;
- maisons d’édition ;
- organisateurs de conférences.

## 6.4 Acteurs institutionnels

- administrations ;
- organismes publics ;
- programmes nationaux ;
- structures d’appui ;
- responsables de gouvernance.

## 6.5 Acteurs techniques

- administrateurs ;
- opérateurs ;
- responsables sécurité ;
- responsables données ;
- modérateurs ;
- mainteneurs.

---

# 7. DOMAINES MÉTIERS

SYNAPSE doit être structuré autour de domaines clairement séparés.

## 7.1 Identité et confiance

Objets :

- identité ;
- compte ;
- rôle ;
- credential ;
- session ;
- politique ;
- révocation.

Objectif :

> établir la confiance minimale nécessaire à tous les autres domaines.

## 7.2 Compétences et preuves

Objets :

- compétence ;
- preuve ;
- artefact ;
- livrable ;
- version ;
- validation.

Objectif :

> transformer une compétence déclarée en compétence démontrable.

## 7.3 Portfolio et trajectoire

Objets :

- profil ;
- parcours ;
- portfolio ;
- expérience ;
- contribution ;
- historique.

Objectif :

> construire une représentation dynamique de la trajectoire.

## 7.4 Réputation et capital social

Objets :

- badge ;
- recommandation ;
- réputation ;
- relation ;
- mentorat ;
- contribution.

Objectif :

> créer des signaux de confiance issus d’actions réelles.

## 7.5 Opportunités et matching

Objets :

- opportunité ;
- stage ;
- mission ;
- projet ;
- appel ;
- candidature ;
- sélection ;
- retour d’expérience.

Objectif :

> réduire la friction entre compétence et opportunité.

## 7.6 Recherche, publication et rayonnement

Objets :

- article ;
- thèse ;
- mémoire ;
- ouvrage ;
- essai ;
- chercheur ;
- auteur ;
- laboratoire ;
- revue ;
- citation.

Objectif :

> rendre la production intellectuelle trouvable, crédible et durablement visible.

## 7.7 Événements de savoir

Objets :

- soutenance ;
- conférence ;
- colloque ;
- séminaire ;
- atelier ;
- semaine thématique ;
- semaine du numérique ;
- journée scientifique.

Objectif :

> constituer un agenda et une mémoire numérique du savoir.

## 7.8 Communautés et workspaces

Objets :

- communauté ;
- workspace ;
- projet ;
- tâche ;
- discussion ;
- mentorat ;
- contribution.

Objectif :

> créer des espaces de production correspondant aux réalités des métiers.

## 7.9 Gouvernance, audit et conformité

Objets :

- règle ;
- politique ;
- permission ;
- audit ;
- incident ;
- décision ;
- révocation.

Objectif :

> rendre le système gouvernable à l’échelle nationale.

---

# 8. AXE RECHERCHE, AUTEURS ET PENSEURS

Cet axe est une composante structurante de SYNAPSE.

## 8.1 Chercheurs

Le système doit permettre de construire une présence numérique autour :

- des domaines de recherche ;
- publications ;
- projets ;
- laboratoires ;
- interventions ;
- travaux dirigés ou encadrés lorsque pertinent ;
- événements.

## 8.2 Écrivains

Les auteurs doivent pouvoir disposer d’un espace où leurs productions et interventions peuvent être structurées et découvertes.

## 8.3 Penseurs

Le système doit pouvoir accueillir des productions intellectuelles qui ne relèvent pas exclusivement de la publication académique.

## 8.4 Institutions scientifiques

Universités et laboratoires doivent pouvoir présenter leurs productions et activités.

---

# 9. AXE THÈSES, MÉMOIRES ET PUBLICATIONS

## 9.1 Principe

Une thèse ou un mémoire ne doit pas être considéré comme un fichier isolé.

Il doit être un objet relié à :

- son auteur ;
- son institution ;
- sa formation ;
- son encadrement ;
- son domaine ;
- sa soutenance ;
- ses mots-clés ;
- ses éventuelles publications dérivées.

## 9.2 Cycle de vie

Le système peut représenter :

**brouillon → soumis → en revue → validé → publié → archivé**

selon le contexte institutionnel.

## 9.3 Embargo

Le système doit pouvoir distinguer :

- contenu public ;
- contenu institutionnel ;
- contenu sous embargo ;
- contenu privé.

## 9.4 Versionnement

Toute évolution significative doit pouvoir être représentée sans effacer silencieusement l’historique.

---

# 10. AXE ÉVÉNEMENTS ET DIFFUSION DU SAVOIR

Le calendrier intellectuel national doit être un objet de premier ordre.

## 10.1 Événements visés

- soutenances ;
- conférences ;
- colloques ;
- séminaires ;
- ateliers ;
- forums ;
- hackathons ;
- semaines scientifiques ;
- semaine du numérique.

## 10.2 Cycle événementiel

**préparation → publication → inscription/suivi → tenue → archive → restitution**

## 10.3 Après l'événement

L'événement peut produire :

- présentation ;
- vidéo ;
- support ;
- résumé ;
- publications associées ;
- personnes intervenantes ;
- références.

Le système construit ainsi une mémoire durable.

---

# 11. AXE PROFESSIONNEL ET ÉCONOMIQUE

## 11.1 Problème

Les acteurs professionnels n’ont pas seulement besoin de visibilité. Ils ont besoin de réduire :

- le temps de recherche ;
- le coût de sélection ;
- le risque de mauvais recrutement ;
- l’incertitude sur les compétences.

## 11.2 Réponse

SYNAPSE doit leur fournir des signaux structurés :

- preuves ;
- validations ;
- expériences ;
- réputation ;
- contributions ;
- recommandations.

## 11.3 Matching

Le matching doit rapprocher :

**besoin ↔ compétences ↔ preuves ↔ expérience ↔ disponibilité ↔ contexte**

et non simplement :

**mots-clés ↔ mots-clés**.

## 11.4 Explicabilité

Le système doit pouvoir expliquer pourquoi un profil est proposé.

---

# 12. AXE SOCIO-PROFESSIONNEL ET WORKSPACES

La logique de rétention ne doit pas être construite sur un feed générique.

Elle doit être construite sur des **espaces de pratique**.

## 12.1 Exemples

### Informatique
- environnement de code ;
- dépôt de projets ;
- revue ;
- challenges ;
- collaboration.

### Économie / finance
- données ;
- tableaux de bord ;
- simulations ;
- analyses.

### Droit
- dossiers ;
- recherche documentaire ;
- simulation de plaidoirie ;
- jurisprudence.

### Recherche
- espace de travail scientifique ;
- bibliographie ;
- publications ;
- collaboration ;
- suivi de projet.

## 12.2 Principe

Le système doit se rapprocher du **travail réel**, plutôt que reproduire les conventions d’un réseau social.

---

# 13. DÉBAT STRUCTURÉ ET PENSÉE COLLECTIVE

Pour les domaines intellectuels, les commentaires linéaires sont insuffisants.

Le système doit pouvoir représenter :

- thèse ;
- argument ;
- contre-argument ;
- preuve ;
- objection ;
- clarification ;
- synthèse.

L’objectif est de faire du débat une **construction de connaissance**, et non une accumulation de commentaires.

---

# 14. STRATÉGIE DE RÉTENTION

La rétention doit être une conséquence de la valeur.

## 14.1 Boucle centrale

**Contribuer → être vérifié → être visible → obtenir une opportunité → progresser → contribuer davantage**

## 14.2 Pour un étudiant

- construire son portfolio ;
- obtenir des preuves ;
- trouver un mentor ;
- participer à des communautés ;
- découvrir des opportunités.

## 14.3 Pour un chercheur

- publier ;
- valoriser ses travaux ;
- annoncer ses événements ;
- développer son réseau ;
- accroître sa visibilité.

## 14.4 Pour un recruteur

- rechercher ;
- filtrer ;
- vérifier ;
- contacter ;
- recruter ;
- évaluer.

## 14.5 Pour une institution

- publier ;
- valoriser ;
- organiser ;
- archiver ;
- mesurer.

---

# 15. PRINCIPES DE CONCEPTION TECHNIQUE

## 15.1 API-first

Les contrats doivent être définis avant les interfaces dépendantes.

## 15.2 Domain-driven

Les frontières techniques doivent refléter les frontières métier.

## 15.3 Event-driven

Les événements doivent représenter les faits importants du système.

## 15.4 CQRS

La logique d’écriture et la logique de lecture peuvent être séparées lorsque le domaine le justifie.

## 15.5 Architecture polyglotte

Chaque type de charge doit utiliser le moteur de stockage adapté.

## 15.6 Cell-based

Le système doit pouvoir limiter les effets d’une panne à une cellule.

---

# 16. ARCHITECTURE TECHNIQUE DIRECTRICE

## 16.1 Frontend

Orientation retenue :

**Next.js + TypeScript**

avec :

- architecture modulaire ;
- PWA ;
- design system ;
- chargement progressif ;
- éventuellement micro-frontends pour les grands domaines.

## 16.2 Backend

Orientation :

- Go pour les services métier généraux ;
- Rust lorsque les contraintes de performance le justifient ;
- TypeScript pour certains BFF/outils ;
- Python principalement pour data, automatisation et outillage.

## 16.3 Communication

Le cœur interne doit privilégier :

- gRPC ;
- Protocol Buffers ;
- HTTP/2.

Les interfaces publiques peuvent utiliser une façade HTTP lorsque la compatibilité l’exige.

## 16.4 Données

### PostgreSQL
Source de vérité transactionnelle.

### Redis
Cache, états temporaires et accélération.

### Elasticsearch
Recherche et découverte.

### Object Storage
Artefacts, documents, médias et preuves volumineuses.

### Event Bus
Propagation et relecture des événements métier.

---

# 17. ARCHITECTURE LOGIQUE

```text
                 ┌─────────────────────────┐
                 │      Utilisateurs       │
                 └────────────┬────────────┘
                              │
                     Web / Mobile / PWA
                              │
                     ┌────────▼────────┐
                     │ API Gateway/BFF │
                     └────────┬────────┘
                              │
     ┌────────────────────────┼────────────────────────┐
     │                        │                        │
┌────▼─────┐            ┌─────▼─────┐            ┌────▼─────┐
│ Identity │            │ Portfolio │            │ Research │
└──────────┘            └───────────┘            └──────────┘
     │                        │                        │
┌────▼─────┐            ┌─────▼─────┐            ┌────▼─────┐
│ Evidence │            │ Reputation│            │ Events   │
└──────────┘            └───────────┘            └──────────┘
     │                        │                        │
     └────────────────────────┼────────────────────────┘
                              │
                       ┌──────▼──────┐
                       │ Event Bus   │
                       └──────┬──────┘
                              │
             ┌────────────────┼────────────────┐
             │                │                │
       ┌─────▼─────┐    ┌────▼─────┐    ┌────▼────────┐
       │ PostgreSQL│    │  Redis   │    │ Elasticsearch│
       └───────────┘    └──────────┘    └─────────────┘
                              │
                       Object Storage
```

---

# 18. SÉCURITÉ

SYNAPSE doit être traité comme une infrastructure sensible.

## 18.1 Principes

- Zero Trust ;
- moindre privilège ;
- identité de service ;
- séparation des responsabilités ;
- audit systématique.

## 18.2 Contrôles

- TLS 1.3 ;
- mTLS interne ;
- sessions courtes ;
- RBAC ;
- chiffrement au repos ;
- rotation des secrets ;
- contrôle des accès ;
- journalisation.

## 18.3 Traçabilité

Les opérations sensibles doivent être capables de répondre aux questions :

- qui ?
- quoi ?
- quand ?
- sur quelle donnée ?
- avec quelle autorisation ?
- depuis quel service ?
- quelle décision en a résulté ?

---

# 19. PERFORMANCE

## 19.1 Principe

La performance doit être mesurée, non supposée.

## 19.2 Principaux leviers

- cache ;
- indexation ;
- pagination ;
- compression ;
- lecture dérivée ;
- traitements asynchrones ;
- réduction des appels réseau ;
- chargement différé.

## 19.3 CPU

Les calculs lourds doivent être limités sur les chemins interactifs.

## 19.4 RAM

La mémoire doit être utilisée pour :

- cache ;
- état de session ;
- projections chaudes ;
- buffers nécessaires.

## 19.5 I/O

Les accès disque et réseau doivent être réduits par :

- cache ;
- stockage objet adapté ;
- lecture indexée ;
- traitements batch ;
- événements asynchrones.

---

# 20. ACCESSIBILITÉ

## 20.1 Contraintes de conception

Le système doit fonctionner sur :

- terminaux modestes ;
- réseaux variables ;
- faible bande passante ;
- interruptions temporaires.

## 20.2 PWA

La couche web doit pouvoir fournir :

- cache local ;
- installation ;
- consultation partielle hors ligne ;
- synchronisation différée lorsque pertinente.

## 20.3 Interface

Les écrans doivent privilégier :

- simplicité ;
- lisibilité ;
- densité raisonnable ;
- faible poids réseau ;
- parcours courts.

---

# 21. GOUVERNANCE DES CONTENUS

Tous les contenus ne doivent pas avoir le même niveau de publication.

Le système doit distinguer :

| Niveau | Exemple | Contrôle |
|---|---|---|
| Public | profil public | faible |
| Communautaire | discussion | modération |
| Professionnel | portfolio / mission | validation selon contexte |
| Académique | mémoire / article | validation éditoriale/institutionnelle |
| Sensible | document sous embargo | accès restreint |
| Administratif | décision / audit | contrôle renforcé |

---

# 22. GOUVERNANCE INSTITUTIONNELLE

SYNAPSE doit prévoir des responsabilités explicites pour :

- propriété du système ;
- gouvernance des données ;
- sécurité ;
- publication ;
- validation ;
- modération ;
- exploitation ;
- audit.

Le système doit éviter qu’une capacité critique puisse être exercée sans responsabilité identifiable.

---

# 23. ÉVOLUTION DU SYSTÈME

## 23.1 Phase initiale

Le noyau doit rester concentré sur :

**Identité + preuve + portfolio + publication + recherche + opportunité**

## 23.2 Extension

Puis viennent :

**événements + mentorat + communautés + workspaces**

## 23.3 Maturité

Enfin :

**cellules + gouvernance avancée + interopérabilité + recommandations + analyse nationale**

Cette progression protège le projet contre une explosion prématurée du périmètre.

---

# 24. RISQUES STRATÉGIQUES

## 24.1 Dilution

Risque : devenir une plateforme qui fait tout sans exceller dans rien.

Réponse :

> conserver la preuve, la confiance et l'utilité comme centre de gravité.

## 24.2 Sur-gamification

Risque : transformer la réputation en jeu de points.

Réponse :

> chaque signal de réputation doit correspondre à une action vérifiable.

## 24.3 Capture institutionnelle

Risque : concentration excessive du pouvoir de validation ou de visibilité.

Réponse :

> responsabilités séparées, audit et politiques explicites.

## 24.4 Faible adoption

Risque : utilisateurs qui ne trouvent pas de valeur immédiate.

Réponse :

> commencer par des parcours concrets : preuve, publication, opportunité.

## 24.5 Complexité excessive

Risque : architecture trop ambitieuse pour les premiers usages.

Réponse :

> distribuer progressivement ; conserver les frontières métier dès le début mais ne déployer la complexité nécessaire qu’au moment où elle produit une valeur réelle.

---

# 25. INDICATEURS STRATÉGIQUES

SYNAPSE ne doit pas être mesuré uniquement par le nombre de comptes.

Les indicateurs doivent porter sur :

### Confiance
- proportion de profils vérifiés ;
- preuves validées ;
- révocations ;
- incidents.

### Production
- preuves déposées ;
- projets terminés ;
- contributions ;
- publications.

### Recherche
- thèses indexées ;
- mémoires ;
- publications ;
- chercheurs actifs ;
- événements scientifiques.

### Opportunités
- offres publiées ;
- candidatures ;
- matches ;
- missions conclues.

### Engagement utile
- mentorats actifs ;
- contributions dans les workspaces ;
- publications récurrentes ;
- retours d’expérience.

### Performance
- latence ;
- disponibilité ;
- taux d’erreur ;
- temps de synchronisation ;
- poids des parcours critiques.

---

# 26. VISION CIBLE

À maturité, SYNAPSE doit permettre à un même système de relier :

```text
PERSONNE
   │
   ├── identité
   ├── compétences
   ├── preuves
   ├── expériences
   ├── réputation
   ├── mentorat
   │
   ├── publications
   ├── recherches
   ├── événements
   │
   ├── communautés
   ├── workspaces
   │
   └── opportunités
            │
            ▼
       PRODUCTION
            │
            ▼
       RETOUR D'EXPÉRIENCE
            │
            ▼
       NOUVELLES PREUVES
```

Le système doit ainsi devenir une boucle d’apprentissage, de production et de confiance.

---

# 27. ORIENTATION FONDAMENTALE

Le principe qui doit rester stable à travers toutes les futures évolutions est le suivant :

> **SYNAPSE ne doit pas chercher d’abord à attirer des utilisateurs ; il doit chercher à devenir utile à des acteurs qui ont déjà une activité réelle à accomplir.**

L’étudiant veut progresser.  
Le chercheur veut publier et être visible.  
L’auteur veut être découvert.  
Le penseur veut diffuser ses idées.  
Le mentor veut transmettre.  
L’entreprise veut identifier et recruter.  
L’institution veut publier, organiser et valoriser.  
Le gouvernement veut disposer d’une infrastructure fiable et gouvernable.

SYNAPSE doit devenir l’espace commun où ces activités peuvent se rencontrer.

---

# 28. CONCLUSION

SYNAPSE est appelé à dépasser la logique d’une application individuelle pour devenir une **infrastructure nationale du capital humain, intellectuel et professionnel**.

Sa valeur fondamentale repose sur cinq propriétés :

**Confiance — Preuve — Visibilité — Connexion — Production**

La plateforme doit :

- rendre les compétences vérifiables ;
- rendre les personnes visibles ;
- rendre les recherches trouvables ;
- rendre les publications durables ;
- rendre les événements accessibles ;
- rendre les opportunités découvrables ;
- rendre les communautés productives ;
- rendre les décisions auditables.

L’architecture technique doit rester au service de cette finalité. La sécurité, la performance, l’accessibilité et la résilience ne sont pas des couches ajoutées après coup : elles sont des propriétés fondamentales du système.

La prochaine série de documents doit donc dériver de ce document de référence, et non l’inverse :

**Vision → Domaines → Modèle métier → RFC → Architecture → Conception détaillée → Implémentation → Déploiement → Gouvernance.**
