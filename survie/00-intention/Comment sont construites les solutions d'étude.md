---
projet: "survie"
type: "note-de-reference"
phase: "00-intention"
objet: "Comment sont construites les solutions existantes de prise de notes, de révision, de tutorat par IA, de travail en groupe, de communauté, d'enseignement et de partage de documents"
statut: "Référence — non opposable. Aucune décision, aucun choix d'architecture pour survie"
monde: "Observé — sources documentaires publiques, et constat direct sur ClassRoom"
usage: "Matériau d'entrée du futur lot d'état de l'art, à l'ouverture de 10-etudes"
origine: "Explication donnée au porteur le 2026-09-12 à sa demande, puis vérifiée source par source avant versement"
cree_le: 2026-09-12
mis_a_jour_le: 2026-09-12
tags:
  - survie
  - reference
  - etat-de-l-art
  - architecture
---

# Comment sont construites les solutions d'étude

> [!warning] Ce que la présente note est, et ce qu'elle n'est pas
> Elle décrit **comment d'autres ont construit** leurs outils. Elle est versée pour les études futures, par `DEC-C-090`.
> Elle **ne choisit rien pour `survie`**. Le verdict du premier maillon est *à reformuler* : aucune pile technique, aucune architecture et aucune fonctionnalité ne peuvent être retenues avant qu'une reformulation soit arbitrée. Un choix présenté ici comme courant chez d'autres n'est pas une recommandation.
> Chaque affirmation matérielle porte son grade et sa source, numérotée `S1` à `S23` au point 8. Une affirmation sans source est marquée `[N0 — à vérifier]`.

---

## 1. Le squelette commun

Des outils très différents reposent sur le même empilement de quatre étages. Ce qui les distingue est une poignée de choix faits tôt, et coûteux à défaire.

```
  Saisie          clavier, stylet, photo, voix
     │
  Modèle          ce qu'est une « note » pour le système : fichier, bloc, carte, message
     │
  Stockage        sur l'appareil, sur un serveur, ou les deux
  et synchro
     │
  Services        recherche, révision, partage, IA, notifications
```

L'étage le plus décisif est le **modèle** : il fixe ce que l'outil fera facilement, et ce qu'il ne fera jamais bien. Ce squelette est une grille de lecture proposée pour la présente note, et non un fait sourcé.

---

## 2. Famille par famille

### 2.1. Prise de notes

| Outil | Comment il est construit | Grade |
| --- | --- | --- |
| **Obsidian** | Les notes sont de simples fichiers Markdown dans un dossier de l'appareil. L'application est un éditeur posé dessus, extensible par des plugins en JavaScript | `[N3]` — constaté sur ClassRoom : Dataview et Templater en sont deux plugins |
| **Obsidian Sync** | Synchronisation optionnelle et payante, chiffrée en AES-256 selon l'éditeur | `[N1 — S20]` |
| **Notion** | Tout est un **bloc** : paragraphe, image, liste, ligne de base de données, page elle-même. Chaque bloc a un identifiant aléatoire (UUID v4), des propriétés, la liste ordonnée de ses enfants et un pointeur vers son parent, qui sert à l'héritage des permissions | `[N1 — S1]` |
| **Notion, stockage** | Une base PostgreSQL unique, que l'usage menaçait de saturer dès la mi-2020, puis découpée en 480 fragments (*shards*) | `[N1 — S2]` |
| **Goodnotes** (stylet) | L'écriture manuscrite est reconnue et indexée pour la recherche, comme le texte tapé, le texte des PDF et les pages numérisées. Le français fait partie des langues reconnues | `[N1 — S17]` |
| **Numérisation** | Un moteur d'OCR transforme l'image en texte. Tesseract, libre sous licence Apache 2.0, en est l'exemple le plus répandu ; depuis sa version 4, il repose sur un réseau de neurones de type LSTM | `[N1 — S18]` |

Ce que ces choix impliquent :
- **Fichier sur l'appareil** : les notes survivent à l'outil, mais le travail à plusieurs est faible.
- **Bloc en base sur un serveur** : la collaboration et les bases de données deviennent faciles, mais tout dépend du réseau et de l'entreprise.

C'est une déduction à partir des faits du tableau, et non une source.

### 2.2. Révision et mémorisation

| Élément | Comment il est construit | Grade |
| --- | --- | --- |
| **La carte** | Une question et une réponse, et un algorithme qui décide quand la reposer | Définition |
| **SM-2** | L'algorithme de planification qu'Anki employait avant FSRS | `[N1 — S6]` |
| **FSRS** | Intégré à Anki dans la version 23.10. L'utilisateur fixe une **rétention désirée**, entre 0,70 et 0,97 dans cette version, et le planificateur programme les révisions pour la tenir. Les paramètres du modèle se calculent dans Anki à partir de l'historique de l'utilisateur | `[N1 — S6]` |
| **ClassRoom** | Une version simple, à paliers fixes : les étapes de révision 1 à 3, puis l'état *maîtrisé* | `[N3]` — construit et recetté |

### 2.3. Tuteurs par intelligence artificielle

| Outil | Comment il est construit | Grade |
| --- | --- | --- |
| **ChatGPT, mode étude** | Pas un nouveau modèle, mais des **instructions système** écrites avec des enseignants, des scientifiques et des spécialistes de pédagogie : questions de guidage, gestion de la charge cognitive, retour d'information. OpenAI indique vouloir intégrer ensuite ce comportement directement dans ses modèles | `[N1 — S15]` |
| **NotebookLM** | Répond à partir des documents déposés par l'utilisateur, avec des citations renvoyant aux passages sources | `[N1 — S16]` |
| **La technique sous-jacente** | Génération augmentée par récupération. Les documents sont découpés en passages ; les passages proches de la question sont retrouvés, puis le modèle répond à partir d'eux | Description générale de la technique. Google ne détaille pas son implémentation dans la source consultée `[N0 — à vérifier pour NotebookLM]` |
| **Le coût** | Chaque réponse consomme du calcul, facturé au volume par les fournisseurs de modèles | `[N0 — à vérifier]` : les grilles tarifaires publiques n'ont pas été relevées |

### 2.4. Travail en groupe — la co-édition

Le problème à résoudre : deux personnes modifient la même phrase au même moment, parfois hors ligne.

| Approche | Comment elle fonctionne | Exemple | Grade |
| --- | --- | --- | --- |
| **Transformation opérationnelle** | Les modifications de chaque éditeur sont transformées pour être fusionnées en temps réel, avec un serveur au centre | Google Docs, depuis 2010 | `[N1 — S3]` |
| **CRDT** | Des structures de données conçues pour que les modifications concurrentes fusionnent automatiquement, sans source de vérité centrale. Elles permettent le hors-ligne et l'échange direct entre appareils | Yjs, Automerge | `[N1 — S4, S5]` |
| **Local-first** | La copie des données sur l'appareil est la copie principale ; les serveurs ne tiennent que des copies secondaires. Le terme a été forgé en 2019 par l'essai d'Ink & Switch, qui voit dans les CRDT la fondation d'une nouvelle génération de logiciels | — | `[N1 — S4]` |

### 2.5. Messagerie et communauté

| Outil | Comment il est construit | Grade |
| --- | --- | --- |
| **WhatsApp, chiffrement** | Chiffrement de bout en bout avec le protocole Signal pour les messages, les groupes, les pièces jointes, les notes vocales et les appels, sur toutes les plateformes depuis avril 2016 : le serveur transporte sans pouvoir lire | `[N1 — S7]` |
| **WhatsApp, serveurs** | Écrits en Erlang, langage conçu pour la concurrence et la tolérance aux pannes, avec peu de serveurs très chargés | `[N1 — S8]`, source secondaire tirée d'une présentation d'un ingénieur de WhatsApp |
| **Discord, temps réel** | Écrit en Elixir, qui tourne sur la même machine virtuelle qu'Erlang : chaque connexion d'utilisateur est un processus léger. Le système a tenu 5 millions d'utilisateurs simultanés en 2017 | `[N1 — S9]` |
| **Discord, messages** | Des milliers de milliards de messages, migrés de Cassandra, 177 nœuds, vers ScyllaDB, 72 nœuds. Des services intermédiaires écrits en Rust régulent l'accès aux données les plus sollicitées | `[N1 — S10]` |
| **Le coût réel d'une communauté** | La modération. Yik Yak figure au cimetière d'`ecoFab`, où l'effondrement de la modération est relevé comme la racine de sa mort | `[N1]` — [[Cimetière et autopsie des échecs]], fiche F-04 |

### 2.6. Plateformes pédagogiques

| Outil ou standard | Comment il est construit | Grade |
| --- | --- | --- |
| **Moodle** | Libre, écrit en PHP, sous licence GPL. Son extensibilité passe par des plugins de nombreux types, qui suivent tous la même structure de fichiers. L'établissement l'installe sur ses propres serveurs | `[N1 — S11, S12]` |
| **Canvas** | Libre sous licence AGPLv3, écrit en Ruby on Rails, avec PostgreSQL et Redis. L'éditeur le vend aussi sur abonnement | `[N1 — S13]` |
| **LTI** | Standard de 1EdTech qui permet à une plateforme pédagogique d'intégrer un outil externe : connexion unique, lancement de confiance, transmission du cours et de l'identité de l'étudiant. La version 1.3 repose sur OAuth2, OpenID Connect et les jetons JWT | `[N1 — S14]` |

Pour une « infrastructure », LTI est ce qui permet de **se brancher sur la plateforme de l'établissement** au lieu de la remplacer. C'est une déduction, qui rejoint la leçon du cimetière d'`ecoFab` : compléter l'usage installé plutôt que s'y substituer.

### 2.7. Partage de documents

| Élément | Comment il est construit | Grade |
| --- | --- | --- |
| **Briques** | Stockage de fichiers, OCR, index plein texte, métadonnées (filière, module, année) | Architecture courante `[N0 — à vérifier]` : aucun éditeur de ce type ne publie la sienne dans les sources consultées |
| **Droit d'auteur** | Studocu déclare un système de dépôt automatisé qui tente de refuser les documents non autorisés, et se présente comme intermédiaire neutre | `[N1 — S19]` |
| **Litige** | L'université Érasme de Rotterdam poursuit Studocu pour le droit d'auteur des supports créés par son personnel | `[N1]` — fait `F13` du [[survie/90-pilotage/Registre des statuts\|Registre des statuts]] |

---

## 3. Les cinq choix qui structurent tout

Déduits des faits du point 2. Ce sont des axes de lecture, non des recommandations.

| Choix | Option A | Option B | Ce que cela change |
| --- | --- | --- | --- |
| **Où vivent les données** | Sur l'appareil — Obsidian, *local-first* | Sur un serveur — Notion, Google | Hors-ligne et confidentialité, ou collaboration facile |
| **Ce qu'est une note** | Un fichier texte | Un bloc en base de données | Portabilité, ou richesse des fonctions |
| **Co-édition** | Serveur central — transformation opérationnelle | Fusion sans arbitre — CRDT | Simplicité, ou travail hors ligne |
| **Accès** | Application native | Web, application web installable, SMS | Qualité, ou portée auprès des téléphones modestes et quand les données coûtent cher |
| **IA** | Louer un modèle à la demande | Faire tourner un petit modèle sur l'appareil | Coût à chaque usage, ou confidentialité avec une qualité moindre |

---

## 4. Où passe l'argent, et pourquoi certains meurent

Trois coûts grossissent avec l'usage : les **serveurs** avec le nombre d'utilisateurs, l'**IA** avec chaque question, la **modération** avec la taille de la communauté `[N0 — à vérifier]`, déduction non chiffrée.

| Modèle économique | Exemple | Grade |
| --- | --- | --- |
| Service payant sur un outil gratuit | Obsidian Sync | `[N1 — S20]` |
| Abonnement institutionnel sur un logiciel libre | Canvas | `[N1 — S13]` |
| Gratuit financé par un géant | Offres étudiantes de Google et d'OpenAI | Faits `F9` et `F10` du [[survie/90-pilotage/Registre des statuts\|Registre des statuts]] |
| Gratuit sans revenu | Edmodo, plus de 100 millions d'utilisateurs, fermé en 2022 | `[N1 — S21]` |
| Payant, remplacé par du gratuit | Chegg, 45 % des postes supprimés en 2025, imputés à l'IA | `[N1 — S22]` |

Ce que le *local-first* change au coût : quand l'appareil de l'utilisateur fait le travail, le coût de chaque utilisateur supplémentaire pour l'éditeur est faible. C'est une déduction à partir de S4 `[N0 — à vérifier]` : aucun chiffre de coût d'un éditeur *local-first* n'a été relevé.

---

## 5. Où se situe ClassRoom

Constat direct sur le dépôt ClassRoom, commit `4a2d1f1` `[N3 — S23]`.

| Axe | Position de ClassRoom |
| --- | --- |
| Données | Sur l'appareil, en fichiers Markdown |
| Modèle | Des notes typées par leurs propriétés : séance, fiche, évaluation, annale |
| Services | Un moteur de requêtes (Dataview), des commandes (Templater), des tableaux natifs (Bases), un moteur LMD en JavaScript |
| Synchronisation, co-édition, IA | Aucune |

C'est l'architecture la moins chère à faire vivre et la plus robuste pour une personne seule. C'est aussi la plus difficile à étendre à un groupe, ce qui rejoint le point 2.4.

---

## 6. Questions que la présente note ne tranche pas

Elles sont consignées pour le futur lot d'état de l'art. Ce ne sont **ni des lots ni des seuils** : aucun programme d'études ne peut s'écrire avant l'arbitrage d'une reformulation.

1. Quel est, au Burkina Faso, le coût réel des données mobiles et le parc de téléphones des étudiants ? Ces deux faits commandent l'axe *accès* du point 3.
2. Quelles plateformes pédagogiques les établissements visés utilisent-ils, et acceptent-ils des outils branchés par LTI ?
3. Quel est le coût d'une réponse d'IA aux tarifs publics, et à quel volume d'usage devient-il insoutenable pour un porteur seul ?
4. Les CRDT sont-ils assez mûrs pour un usage hors ligne prolongé, sur des téléphones modestes ?
5. Qui, dans un établissement, a le pouvoir d'autoriser la diffusion des supports de cours ?

---

## 7. Ce que la présente note ne fait pas

Elle ne compare pas les outils entre eux pour en élire un. Elle ne dimensionne rien. Elle ne mesure aucun usage étudiant. Elle ne rend pas franchie la phase `10-etudes`, qui reste fermée, et ne modifie en rien le verdict du [[survie/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

---

## 8. Sources consultées le 2026-09-12

| # | Source |
| --- | --- |
| S1 | [Notion, « The data model behind Notion's flexibility »](https://www.notion.com/blog/data-model-behind-notion) |
| S2 | [Notion, « Herding elephants: lessons learned from sharding Postgres at Notion »](https://www.notion.com/blog/sharding-postgres-at-notion) |
| S3 | [Google Drive Blog, « What's different about the new Google Docs: Making collaboration fast », 21 septembre 2010](https://drive.googleblog.com/2010/09/whats-different-about-new-google-docs.html) |
| S4 | [Ink & Switch, « Local-first software: You own your data, in spite of the cloud », 2019](https://www.inkandswitch.com/essay/local-first/) |
| S5 | [Yjs, dépôt officiel](https://github.com/yjs/yjs) |
| S6 | [Anki, « Changes in 23.10 »](https://changes.ankiweb.net/changes/23.10.html) |
| S7 | [Signal, « WhatsApp's Signal Protocol integration is now complete », avril 2016](https://signal.org/blog/whatsapp-complete/) |
| S8 | [High Scalability, « How WhatsApp Grew to Nearly 500 Million Users, 11,000 cores, and 70 Million Messages a Second »](https://highscalability.com/how-whatsapp-grew-to-nearly-500-million-users-11000-cores-an/) — source secondaire |
| S9 | [Discord, « How Discord Scaled Elixir to 5,000,000 Concurrent Users »](https://discord.com/blog/how-discord-scaled-elixir-to-5-000-000-concurrent-users) |
| S10 | [Discord, « How Discord Stores Trillions of Messages »](https://discord.com/blog/how-discord-stores-trillions-of-messages) |
| S11 | [Moodle Developer Resources, « Plugin types »](https://moodledev.io/docs/5.2/apis/plugintypes) |
| S12 | [Wikipédia, « Moodle »](https://en.wikipedia.org/wiki/Moodle) — source secondaire, pour le langage et la licence |
| S13 | [Instructure, dépôt canvas-lms](https://github.com/instructure/canvas-lms) |
| S14 | [1EdTech, « Learning Tools Interoperability »](https://www.1edtech.org/standards/lti) |
| S15 | [OpenAI, « Introducing study mode », 29 juillet 2025](https://openai.com/index/chatgpt-study-mode/) et [OpenAI Help Center, « Using study mode in ChatGPT »](https://help.openai.com/en/articles/11780217-chatgpt-study-mode-faq) |
| S16 | [Google, « NotebookLM: How to try Google's experimental AI-first notebook »](https://blog.google/technology/ai/notebooklm-google-ai/) |
| S17 | [Goodnotes Support, « Search your notes »](https://support.goodnotes.com/hc/en-us/articles/360000116816-Search-your-notes) et [langues reconnues](https://support.goodnotes.com/hc/en-us/articles/7353727932047-What-languages-does-Goodnotes-support-for-handwriting-recognition-and-search) |
| S18 | [Tesseract, dépôt officiel](https://github.com/tesseract-ocr/tesseract) |
| S19 | [Studocu Help, « How does Studocu handle copyright issues? »](https://help.studocu.com/hc/en-us/articles/360047260632-How-does-Studocu-handle-copyright-issues) |
| S20 | [Obsidian, page Sync](https://obsidian.md/sync) |
| S21 | [EdSurge, « Popular K-12 Tool Edmodo Shuts Down », 16 août 2022](https://www.edsurge.com/news/2022-08-16-popular-k-12-tool-edmodo-shuts-down) |
| S22 | [CNBC, « Chegg slashes 45% of workforce, blames 'new realities of AI' », 27 octobre 2025](https://www.cnbc.com/2025/10/27/chegg-slashes-45percent-of-workforce-blames-new-realities-of-ai.html) |
| S23 | Dépôt ClassRoom, commit `4a2d1f12e256f0851765f8c7ebe98d6ee536a775`, constat direct |

> [!note] Écart avec l'explication orale du 2026-09-12
> La vérification a corrigé un point de l'explication donnée au porteur : chez Discord, l'accès aux messages passe par des services écrits en **Rust**, le temps réel restant en Elixir (S9, S10). Deux affirmations orales ont été ramenées au rang `[N0 — à vérifier]`, faute de source : le fonctionnement interne de NotebookLM et le mécanisme de coût de l'IA.
