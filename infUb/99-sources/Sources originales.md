---
projet: "infUb"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Fichiers d'origine conservés intacts, avec empreinte et trace de conversion"
fichiers_verses: "6 reçus — 4 conservés, 2 supprimés ; 3 originaux archivés en .zip avant modification"
cree_le: 2026-09-06
tags:
  - infUb
  - sources
  - provenance
---

# Sources originales

Les six fichiers reçus dans le dossier `infUb`, tels qu'ils s'y trouvaient avant la mise en conformité du **2026-09-06** — quatre conservés, deux supprimés et tracés au point 3. En cas de doute sur une note du coffre, ce sont ces fichiers qui font foi.

Toutes les empreintes ci-dessous ont été calculées **avant** tout déplacement, tout renommage et toute conversion.

---

## 1. Le document amont — converti

### `DOCUMENT_DE_REFERENCE_GLOBAL_INFRASTRUCTURE_INFORMATION_INSTITUTIONNELLE_V1.0.docx`

| Champ | Valeur |
| --- | --- |
| Format | Word (OOXML) |
| Taille | 51 285 octets |
| SHA-256 | `a64e3e3af6c5666b9db7a59322cce120111f42eb97b1da0c562e938a59565c59` |
| Archivé le | 2026-09-06 |
| Version | 1.0 — 2 septembre 2026 |
| Converti vers | [[Document de référence global]] — `00-intention/` |
| Décision associée | `DEC-C-009` au [[infUb/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Écarts connus, non corrigés | Deux paragraphes du corps — la note de lecture du point 1 et les visions citoyenne et organisationnelle du point 7 — sont rendus en **tableaux dégénérés d'une seule colonne sans corps**, fidèlement à la structure de tableau du `.docx` d'origine. Le rendu est disgracieux ; la correction romprait la garantie d'identité de `DEC-C-009` et relève d'une version 1.1 |
| Conservé ici | **Oui** — le `.docx` reste dans ce dossier, intact |

**Contrôle de conversion.** Le texte a été comparé caractère à caractère entre le `.docx` et le Markdown, espaces, séparateurs de tableau et marqueurs de structure normalisés **des deux côtés** : **22 607 caractères de part et d'autre, aucune divergence**.

Ce qui a été traduit, et rien d'autre :

| Élément Word | Nombre | Rendu Markdown |
| --- | --- | --- |
| `Heading1` / `Heading2` | 23 / 24 | `#` / `##` |
| `ListBullet` | 106 | `-` |
| `ListNumber` | 22 | `1.` — Markdown renumérote à l'affichage, comme Word |
| Tableaux | 19 | Tableaux Markdown |
| Runs en **Courier New** | 9 schémas ASCII | Blocs de code délimités par ` ``` ` |
| `<w:br/>` | 89 | Retours à la ligne |
| Gras / italique | — | `**` / `*` |
| *(ajouté)* | — | En-tête de propriétés YAML et encadré de provenance |

Le document ne contient **aucune image et aucun hyperlien** : rien n'a donc pu être perdu à ce titre. Aucun mot, aucune ponctuation, aucun tableau et aucun schéma n'a été ajouté, retiré ni reformulé.

---

## 2. Les trois documents Markdown — modifiés le 2026-09-06, originaux archivés

Ces fichiers étaient déjà en Markdown : **aucune conversion n'était nécessaire.** Ils ont d'abord été déplacés dans leur dossier de phase et renommés selon `DEC-C-008`, corps intact. Ils ont ensuite été **modifiés** par le retrait du signe paragraphe (`DEC-C-015`), qui est la première altération de leur contenu.

### 2.1. Les originaux, tels que reçus

> [!important] `originaux-markdown-avant-DEC-C-015.zip`
> Archive créée **avant** la modification, contenant les trois fichiers sous leur nom d'origine et avec leurs octets d'origine. Chacun a été vérifié contre son empreinte de réception avant d'entrer dans l'archive.
> Le format `.zip` est retenu pour que ces originaux **n'apparaissent pas comme des notes** dans le graphe et la recherche du coffre — c'était l'objection qui avait fait renoncer au doublon lors de la mise en conformité. Elle ne tient plus dès lors que la version de travail diverge : la règle 6 du coffre exige alors un original conservé.

| Champ | Valeur |
| --- | --- |
| Taille de l'archive | 3 fichiers, 182 864 octets décompressés |
| SHA-256 de l'archive | `2b41ba4363fc025f8bae221925a9b24412a364d964c2f05ebbe12a413d53a82f` |
| Créée le | 2026-09-06, avant application de `DEC-C-015` |

| Fichier d'origine | Taille | SHA-256 de réception |
| --- | --- | --- |
| `ETUDE_COMPARATIVE_ET_SOLUTION_CIBLE_V1.0.md` | 93 099 o | `cd13b28ef2b5e3d25eee98001217b0ff654a85430e618c351bac502f1c17b05c` |
| `DDD_TACTIQUE_NOYAU_V0.1.md` | 54 599 o | `a3dfb844f8f742aab4efd5521967f3c86d201b3d99d07ca75c4d2e784d9daffb` |
| `ADR_NOYAU_001_A_014_V0.1.md` | 35 166 o | `e44b9ccc8e3c79f9bb4d9715b8f0f9c79cdd409da2e45735dc40adade6a33cfa` |

### 2.2. Les versions de travail, après retrait du signe paragraphe

| Note de travail | Taille du corps | SHA-256 du corps | Signes retirés |
| --- | --- | --- | --- |
| [[Étude comparative et solution cible]] — `10-etudes/` | 93 254 o | `cee7681675624f90262fae20adc7f83c34c28c3fe7178461d1673c35c15fc708` | 40 |
| [[DDD tactique du noyau]] — `40-ddd-tactique/` | 54 706 o | `33a25569683b0e9bd5e579b062865e3b0fba021fc84c396fbbfef276290990ce` | 32 |
| [[Recueil d'ADR du noyau]] — `50-architecture/` | 35 288 o | `45e170cde73b8b3af92d5a7462819b8ac0c79a51d44e52fb71cbd5ce2492404a` | 38 |

**Nature exacte de la modification.** Une substitution mécanique et unique : le signe paragraphe, suivi de ses espaces éventuelles, remplacé par le mot `point`. Aucune autre transformation. Les renvois multiples consécutifs — du type « 7.3, 7.4, 7.7 » précédés chacun du signe — ont été compactés en `points 7.3, 7.4 et 7.7` pour éviter la répétition du mot ; neuf cas au total sur l'ensemble d'`infUb`.

**Ce que la modification n'a pas touché.** Aucun mot, aucun chiffre, aucun tableau, aucun schéma, aucune structure de titre. Le corps s'allonge de 155, 107 et 122 octets, exactement l'écart entre les caractères retirés et le mot ajouté.

---

## 3. Deux fichiers supprimés — trace conservée

> [!info] Supprimés le 2026-09-06 sur décision du porteur — `DEC-C-013`
> Ils ne portaient aucune information du projet. Leur trace est conservée ici et **nulle part ailleurs** : c'est le seul enregistrement de leur passage dans le coffre.

| Fichier supprimé | Taille | SHA-256 |
| --- | --- | --- |
| `Étude cible infUb.html` | 14 571 o | `bc5b27ab12fdf99f1d18adfd66d0c7b9a05e5a460b056af8951ab9fe4ee8906a` |
| `Noyau tactique infUb.html` | 14 571 o | `da00b9a2ce450d8cafd0a5fa112776e86786ceef6aa0478ab73f11daca3a096b` |

**Ce que ces fichiers contenaient.** Rien du projet. C'étaient des **coquilles de chargement d'artifacts `claude.ai`** : la page ne portait que les métadonnées du service et un script de chargement, le contenu étant récupéré en ligne à l'ouverture. Recherche des termes du domaine — titre de l'étude, `Habilitation`, `infUb` — dans les deux fichiers : **zéro occurrence**. Hors connexion, ils n'affichaient aucun texte. Les deux faisaient exactement la même taille et ne différaient que par leur identifiant d'artifact.

**Ce que la suppression ne détruit pas.** Le contenu que ces deux artifacts affichaient en ligne est celui de l'[[Étude comparative et solution cible]] et du [[DDD tactique du noyau]], présents dans le coffre en Markdown. Rien d'unique n'a été perdu.

**Ce qu'il reste possible de faire.** Si l'export réel de l'un des deux artifacts est récupéré un jour, il entrera ici comme une source à part entière, avec sa propre empreinte et une version de travail dans la phase concernée.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Un fichier de `99-sources` est en lecture seule par convention. Toute correction se fait dans la note de travail correspondante.
2. **Toute source entre avec son empreinte.** SHA-256 calculé et consigné à l'archivage, pour détecter toute altération ultérieure.
3. **Toute conversion est contrôlée et chiffrée.** Une conversion sans contrôle d'intégrité documenté n'est pas versée au coffre.
4. **Ce dossier n'est pas une corbeille.** Il ne contient que des originaux dont une version de travail existe ailleurs dans le projet. Un fichier versé qui ne remplit pas cette condition est instruit, puis supprimé ou complété — jamais laissé en dépôt. Le point 3 en garde la trace.
