---
projet: "checkme"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, provenance, empreintes d'intégrité, archives conservées et trace des fichiers supprimés"
statut_du_corpus: "Référence — aucun document n'est opposable"
emplacement_du_corpus: "99-sources/corpus-herite/ — versé le 2026-09-10 par DEC-C-082"
fichiers_supprimes: 6
archives_conservees: 2
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `checkme` dans le coffre, conservé en `corpus-herite/` comme **matériau de référence**, et trace de tout ce que les interventions du 2026-09-06 et du 2026-09-10 ont déplacé, renommé ou supprimé.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils sont conservés parce qu'ils portent un travail réel, et parce que la reprise de `checkme` s'appuie sur eux comme **référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie — `DEC-C-016` et `DEC-C-082` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].
> Ce dossier déroge sur un point à la règle 4 ci-dessous : pour le corpus hérité, la version de travail **n'existe pas encore** ; elle est à construire par la reprise, qui commence au [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]]. La dérogation est temporaire et nommée.

> [!info] `checkme` n'a aucun document converti
> Contrairement à `ecoFab` et `infUb`, ce projet n'a reçu aucun `.docx` ni aucun format fermé : ses documents sont **nés en Markdown**. Il n'y a donc ici aucun contrôle de conversion à produire. Ce dossier sert à trois choses : conserver le **corpus hérité**, consigner les **empreintes d'intégrité** de tout ce qui a été déplacé, et garder la **trace de ce qui a été supprimé**.

---

## 1. Empreintes d'intégrité des quinze documents déplacés

Le 2026-09-06, chaque document a été **déplacé et renommé, jamais réécrit**. Un en-tête de propriétés et un encadré de réexamen ont été ajoutés **au-dessus** du corps ; le corps lui-même était resté identique à l'octet près.

Les empreintes ci-dessous ont été calculées **avant** tout déplacement, puis recalculées **après** sur le seul corps de chaque note : le 2026-09-06, les quinze correspondaient. **Au 2026-09-10, neuf ne correspondent plus**, du fait de deux passes rédactionnelles ultérieures — détail et reconstitution au point 4.2.

| Note actuelle | Chemin d'origine | Taille du corps | SHA-256 du corps |
| --- | --- | --- | --- |
| [[Vision et principes fondateurs]] | `documents_corriges/Document_0_Vision_Principes_Fondateurs.md` | 7 887 o | `24c85b7ce6bb52ea08bd7b20ef728ffe53d9ea17cce28fe06a840bd79ac80b86` |
| [[Audit complet du projet]] | `files/Audit_Complet_CheckMe.md` | 25 178 o | `0120505f9ea09575977e6ebf78d7fdf5de9a15a6a6d07affdf359f48e77ff334` |
| [[Analyse approfondie du projet]] | `analyse_approfondie_checkme.md` | 26 990 o | `1f6479dc42b9e810b0cd86e3d2f1a76382f387c84cc0db9674c9f672fd51a95e` |
| [[DDD stratégique]] | `files/Document_1_DDD_Strategique.md` | 17 802 o | `965091aef35a1a0dd84046454cb83b9a6aabcfbeff6df3019cb1e13ed497bb6d` |
| [[DDD tactique]] | `files/Document_3_DDD_Tactique.md` | 21 322 o | `cc4cff2ec18891b7a7b72b854d593a0265d5ce911ef56c659372c742a7c42dc8` |
| [[Stratégie de recherche et de correspondance]] | `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md` | 18 157 o | `3c5d4028f28e23ae45bf2c869ef5eb585fd4177e419e91a918df72b2dfecd2be` |
| [[Vision d'architecture]] | `files/Document_2_Vision_Architecture.md` | 14 165 o | `964388f866cf9bcc3137817bd6cc350bfa437f62bbafe680c51c6a549018e289` |
| [[Architecture logicielle]] | `files/Document_4_Architecture_Logicielle.md` | 11 034 o | `8dafbd4903269b027faa00c445e3fcb32070ab8b745eef1f54874976a89b8548` |
| [[Contrats d'API]] | `files/Document_5_API_Contrats.md` | 8 171 o | `9eb0298364e498078130d2aa9f56bd556851ab30da34d4e9b1ae3531dc42cfb3` |
| [[Sécurité]] | `files/Document_6_Securite.md` | 10 202 o | `23c2ecbf5aeaa12064f832fb1735ad3ab0858a4d8b6ce001ecfd34664a741e38` |
| [[Base de données]] | `files/Document_7_Base_De_Donnees.md` | 13 020 o | `a182d365fbe67b558bc22f70d341f201ba8bcded46a4b8ee017f6e553086d2d7` |
| [[Parcours utilisateur et interfaces]] | `files/Document_8_UX_UI.md` | 10 352 o | `8a6eedf87b0c6f0cdaab721612672b5bcdbc97216782389370e2d9c4db7f2569` |
| [[Fiabilité de la projection Consultation]] | `documents_corriges/Document_P0_3_Fiabilite_Projection_Consultation.md` | 21 652 o | `b6624e0bc6a8781ccd64a754aa52de4a5732079d61c2e275665f0a1c2f07f26a` |
| [[Modèle de données et migrations]] | `documents_corriges/Document_P0_4_Modele_Donnees_Migrations.md` | 14 765 o | `79abdae372cf5226b229f2f74c29ecb92b090583e97f93539308f9273d2ec34e` |
| [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]] | `HISTORIQUE_INTERVENTION.md` | 8 730 o | `919559990c44ac4e8be6c9dc99bea54007a4221c70a41936fdf37fce63ee3f0d` |

**Les cinq fichiers `.sql`** ont été déplacés sans aucune modification, en-tête compris — ce ne sont pas des notes :

| Fichier | Taille | SHA-256 |
| --- | --- | --- |
| `001_extensions_and_schemas.sql` | 101 o | `304fdaf94ea33fd5a086dedfe3209a899794afd718327c727236e284112d9918` |
| `002_publications.sql` | 5 107 o | `ca2d65afa1218f7f994dbc5ff912de10487ddffa87fd95680ac80b899ba97d8f` |
| `003_outbox.sql` | 2 507 o | `7db318bfc1a606c17034ec4fbb7e2e8f0b8333dd6ae2899148ff7be3a3caa6aa` |
| `004_consultation.sql` | 5 498 o | `d2c8a68194add96a6b61201fb14effe978878e4be8c6d424a62d45511dac90d3` |
| `005_integrity_indexes.sql` | 4 942 o | `990be64a43912924c46c81b60ae83e8a6b15da92767dadf53fe459588afe0b13` |

---

## 2. Les deux archives conservées

Conservées par `DEC-C-022`, l'arbitrage de suppression n'ayant pas été rendu. Elles sont ici **par exception** à la règle 4 : ce ne sont pas des originaux mais des **copies de sauvegarde** de fichiers vivants.

| Archive | Taille | SHA-256 |
| --- | --- | --- |
| `checkme_P0-4_documents_corriges.zip` | 29 166 o | `5a8673bf4625f38a5fec29da1741763471067be41dd1cb0d57a5fd822c241947` |
| `documents_corriges.zip` | 17 297 o | `f7dbf1814f611769d4456c2b681823876678cef0c9c0cf7aa503568e707e62c6` |

**Contrôle de redondance, fichier par fichier.** `checkme_P0-4_documents_corriges.zip` contient dix fichiers, **tous d'empreinte identique** à ceux repris au point 1 : redondance totale, aucun contenu unique. `documents_corriges.zip` en contient quatre : trois identiques, et **un seul fichier unique dans tout le coffre**, la notice de 406 octets que l'intervention P0-4 a remplacée.

> [!important] Le seul contenu unique des deux archives, reproduit intégralement
> `documents_corriges/README.md`, 406 octets, 2026-08-02, SHA-256 `3657db8da63cd3737fcb0828584d17ad04dd335fe872ec66c46fd54f2623bb2c` :
>
> ```markdown
> # Documents corriges checkMe
>
> Ce dossier contient les documents refondus ou corriges apres l'audit du projet checkMe.
>
> Regle principale :
>
> - ne pas modifier le dossier `files/` ;
> - lire `files/` uniquement comme reference historique ;
> - produire ici les versions corrigees, une intervention a la fois ;
> - commencer par P0-1, puis avancer strictement dans l'ordre defini dans `HISTORIQUE_INTERVENTION.md`.
> ```
>
> Les deux archives peuvent désormais être supprimées sans aucune perte : c'est la seule chose qu'elles portaient et qui n'existait nulle part ailleurs.

---

## 3. Les six fichiers supprimés — trace conservée

> [!info] Supprimés le 2026-09-06 sur décision du porteur — `DEC-C-019` et `DEC-C-021`
> Leur trace est conservée ici et **nulle part ailleurs** : c'est le seul enregistrement de leur passage dans le coffre.

| Fichier supprimé | Taille | Date | SHA-256 |
| --- | --- | --- | --- |
| `files/checkme_backoffice.html` | 16 688 o | 2026-08-02 16:08 | `537964f28ad9d3de06ef650cc55e293f162cec50f6c488defaa660877e4985f6` |
| `files/checkme_ecran_citoyen_v2.html` | 19 092 o | 2026-08-02 16:14 | `6c7b931d56b20ae59ccabb4bc09931ec9f8c03b5c8de660508353120de35a101` |
| `files/checkme_ecran_citoyen.html` | 19 359 o | 2026-08-02 17:30 | `8affaf8d852fbeadc9bb3bdc3beccda6f7a94804ac457bd083d8dbf75a94f4e8` |
| `files/Vision_et_Principes_Fondateurs.md` | 11 926 o | — | `0a6af9a569dcca7a6b6589b020689becd16780db24889d89906a847d9a7a6293` |
| `files/SKILL.md` | 8 381 o | — | `464641c1450357485b50652e8f5bd783f30c585da6688677c6ad531122760bd1` |
| `documents_corriges/README.md` | 1 328 o | — | `0220fe3b971a782ab604a13a4d7e23b95ba908f9fb25d898d3bd3297c97ca0dd` |

### 3.1. Ce que couvraient les deux écrans citoyen

Relevé établi **par extraction du texte des deux fichiers avant leur suppression**. Les deux portaient la même ossature : un sélecteur d'aperçu à cinq onglets — **`Accueil`, `Formulaire`, `Trouvé`, `Ambigu`, `Aucun résultat`** —, un accueil listant quatre publications d'exemple avec filtres par catégorie (*Toutes, Concours, Bourses, Résultats scolaires, Recrutements*), un écran de résultat positif portant la mention *« VÉRIFIÉ checkMe »* avec nom, statut et centre d'affectation, un panneau d'ambiguïté — *« Plusieurs correspondances… ajouter un second identifiant pour affiner la recherche »* — et une proposition facultative de création de compte.

**Ce qui les distinguait**, au-delà de l'habillage :

| | `checkme_ecran_citoyen.html` | `checkme_ecran_citoyen_v2.html` |
| --- | --- | --- |
| Critères de recherche offerts | Récépissé **ou** CNIB **ou** **Nom & Prénom** | CNIB **ou** récépissé — **pas de nom** |
| Critère d'affinage en cas d'ambiguïté | Numéro CNIB | Numéro de récépissé |
| Typographie de titrage | `Space Grotesk` | `Zilla Slab` |
| Traitement de la page | Carte à angles arrondis | Fond texturé, carte « façon récépissé » |

Le fichier nommé `v2` est **le plus ancien des deux**, d'une heure et quart. La divergence sur la recherche par nom est portée au point 3.2 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]] comme question ouverte.

### 3.2. Ce que couvrait le back-office

> [!warning] Relevé incomplet, et il faut le dire
> Le texte de `checkme_backoffice.html` **n'a pas été extrait avant sa suppression**. Ce qui suit provient de son seul titre — *« checkMe — Back-office organisme »* — et de la description qu'en donne l'[[Analyse approfondie du projet|analyse approfondie]] au point 7.2 : liste des publications, création d'une publication, import CSV ; sans gestion des agents, sans paramètres, sans écran de détail, sans états d'erreur.
> Cette description n'a pas pu être contrôlée. Elle est reproduite comme un témoignage, pas comme un fait.

### 3.3. Les trois fichiers Markdown supprimés

**`files/Vision_et_Principes_Fondateurs.md`** — export de conversation brut, **sans un seul titre Markdown** sur ses 11 926 octets. Il contenait le Document 0 en version 0.1 à partir de sa ligne 79, précédé de 78 lignes de fragments de discussion. La version 0.2 canonisée par l'intervention P0-1 en est l'extraction propre : c'est [[Vision et principes fondateurs]]. Les motifs de conception que portaient les fragments ont été **recherchés un à un dans le corpus avant la suppression** et s'y trouvent tous, exprimés plus précisément — choix de Go par la visibilité de package et rejet d'Elasticsearch au profit de Meilisearch dans [[Architecture logicielle]], `SEC-01` dans [[Sécurité]], règle du `200` systématique dans [[Contrats d'API]].

**`files/SKILL.md`** — *skill* Claude générique nommée `frontend-design`, 8 381 octets de conseils de direction artistique adressés à un modèle de langage. Sans aucun rapport avec `checkme` ; l'audit l'avait relevée sous `P2-5`.

**`documents_corriges/README.md`** — notice du dossier dissous par `DEC-C-017`. Ses cinq énoncés survivent : les règles de travail au [[checkme/99-sources/corpus-herite/Historique des interventions|registre des interventions]], la liste de la baseline à la [[checkme|note d'entrée]], l'hypothèse technique P0-4 aux points 2.1, 6 et 11 de [[Modèle de données et migrations]], l'annonce de P0-5 dans les deux.

---

## 4. Versement du corpus hérité — 2026-09-10

Décidé par `DEC-C-082`. Les quinze documents du point 1 et les cinq migrations SQL sont réunis en `corpus-herite/`, les migrations dans son sous-dossier `migrations/`. Les dossiers de phase qu'ils occupaient sont retirés.

### 4.1. Inventaire et empreintes au versement

| Emplacement | Fichiers | Volume |
| --- | --- | --- |
| `corpus-herite/` | 15 notes | 245 513 o |
| `corpus-herite/migrations/` | 5 fichiers `.sql` | 18 155 o |
| **Total** | **20** | **263 668 o** |

Le déplacement s'est fait sans réécriture : l'empreinte SHA-256 de chaque fichier entier, calculée avant et après, est **identique pour les vingt fichiers**.

**Empreinte d'ensemble de `corpus-herite/`** — SHA-256 calculée sur les fichiers de `corpus-herite/` triés par nom dans l'ordre des points de code, puis sur ceux de `migrations/` dans le même ordre ; pour chaque fichier, son chemin relatif en UTF-8, un octet nul, son contenu, un octet nul :

```
cf57804dea049fe7a4873465dd5c6e8db597ef330e006738ee0107ba25fb438b
```

Toute altération d'un fichier ou d'un nom de fichier du corpus versé modifie cette empreinte. Empreinte de chaque note, **fichier entier, en-tête compris** — c'est la référence à opposer à toute altération postérieure au 2026-09-10 :

| Note | Taille | SHA-256 du fichier entier |
| --- | --- | --- |
| [[Analyse approfondie du projet]] | 28 287 o | `0fec5ce7689d07a53c0012cd17a427baa9c62f154b475ccc510c8220e956bd2f` |
| [[Architecture logicielle]] | 11 968 o | `f4bd3629664efbf107ff7482b719cdfba0f3f23f731ed530fe5dc286acd7c3a2` |
| [[Audit complet du projet]] | 26 049 o | `803a3689533022d3054db50fcb2b36c27df396efb0e0cc1a1ab24be906c330be` |
| [[Base de données]] | 13 951 o | `a4d8e3042cb1dc8966cc0fb8ad77f8b9602cf898e2f663741421b9bba20454f5` |
| [[Contrats d'API]] | 9 097 o | `38771fdb9d742d4418ae4b49e9e9ab9c285efc006e307742e5c35261248d1ffe` |
| [[DDD stratégique]] | 18 700 o | `cba7794a83c33b98743a8140a1af826befa2888bb4ba2212c872d8ee65bc4906` |
| [[DDD tactique]] | 22 306 o | `31b887eadaf8232f0d6c237c3b1ec4fc469d60e01d5c71aee14f40245a5819d8` |
| [[Fiabilité de la projection Consultation]] | 22 604 o | `693b3ae51995710a4c7f1c12a419b4805bbdd60565c62aed290ab41ae6c8b6cb` |
| [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]] | 10 489 o | `14a2d1383e731471ff88df4b5e700c6f19e2aa511c9948ed9ce603f4a67c3f57` |
| [[Modèle de données et migrations]] | 16 261 o | `b34843a33e5e09620c2cd5c83e9373b71467e48c68cccdc6e84718fbb6ea25cf` |
| [[Parcours utilisateur et interfaces]] | 11 617 o | `0de0df2e7c52cf1d5b792b11bac3b10a44a999574a335b478bb86b37a9302ce5` |
| [[Sécurité]] | 11 158 o | `3a426799e9c98f949465b662c69f3bead05db0b2fe00e9b1eeb4e98dee05e516` |
| [[Stratégie de recherche et de correspondance]] | 19 107 o | `dcabebddc7c57d737f4d535c6d766c9f172c7d1bf3fd1cba433e05e119c0fb6a` |
| [[Vision d'architecture]] | 15 113 o | `a625b4ec2f7a87e2f536cd4478ffc3ed54f69962ee3df7b705c86dac5067b3c7` |
| [[Vision et principes fondateurs]] | 8 806 o | `c84c3656eafd47035f95a9a2346bfc94cbf453441ab0830ec5059bceebcc76ab` |

Les cinq fichiers `.sql` portent les empreintes du point 1, **inchangées depuis le 2026-09-06**.

### 4.2. Contrôle des corps contre les empreintes du point 1

Avant le versement, le corps de chaque note — le texte situé sous l'en-tête de propriétés et sous les encadrés ajoutés par le coffre — a été isolé, et son empreinte comparée à celle du point 1.

| Note | État du corps au 2026-09-10 | Cause établie |
| --- | --- | --- |
| [[Vision et principes fondateurs]] · [[Audit complet du projet]] · [[Stratégie de recherche et de correspondance]] · [[Fiabilité de la projection Consultation]] · [[Modèle de données et migrations]] · [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]] | **Identique** — six notes | — |
| [[Vision d'architecture]] · [[Architecture logicielle]] · [[Contrats d'API]] · [[Base de données]] · [[Parcours utilisateur et interfaces]] | **Divergent, reconstitué exactement** — cinq notes | Substitution du signe paragraphe par le mot `point`, opérée par `DEC-C-052`. Remplacer, dans le corps actuel, le mot « point » suivi d'un numéro par le signe paragraphe accolé au numéro, et le mot « points » par le signe doublé, **restitue l'empreinte d'origine à l'octet près** |
| [[DDD stratégique]] · [[DDD tactique]] · [[Sécurité]] | **Divergent, non reconstituable** — trois notes | La même substitution, à laquelle s'ajoutent des retouches de forme que son inversion ne défait pas. Elles sont attribuables à `DEC-C-042`, qui déclare sept notes traitées sans les nommer — attribution plausible, non démontrée |
| [[Analyse approfondie du projet]] | **Divergent, non reconstituable** — une note | Les retouches que `DEC-C-042` déclare sur ce document même : échelle chiffrée substituée aux étoiles, quatre titres du point 9 reformulés, pictogrammes retirés. Le corps ne contient aucune occurrence de la forme substituée par `DEC-C-052` |

> [!important] Ce que ce contrôle établit sur les quatre documents non reconstituables
> Le texte versé n'est pas l'original : c'est l'original **retouché dans sa forme** par des passes journalisées, qui déclarent n'avoir modifié aucune affirmation de fond. **Cette déclaration ne peut plus être vérifiée caractère à caractère**, les originaux de ces quatre documents n'existant plus dans le coffre ; seule leur empreinte du 2026-09-06 subsiste au point 1.
> Les passes du 2026-09-08 et du 2026-09-09 ont traité ces notes comme des notes de travail, ce qu'elles étaient alors. Le versement du 2026-09-10 les protège désormais par la règle 1 ci-dessous.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Un fichier de `99-sources` est en lecture seule par convention. Toute correction se fait dans la note de travail correspondante.
2. **Toute source entre avec son empreinte.** SHA-256 calculé et consigné à l'archivage, pour détecter toute altération ultérieure.
3. **Toute conversion est contrôlée et chiffrée.** Sans objet pour `checkme` : aucun document n'a été converti.
4. **Ce dossier n'est pas une corbeille.** Il ne contient que des originaux dont une version de travail existe ailleurs. Deux exceptions sont nommées : les deux archives `.zip` du point 2, inscrites à `DEC-C-022` et à trancher ; et le corpus hérité du point 4, dont la version de travail est à construire par la reprise — exception temporaire, inscrite à `DEC-C-082`.
