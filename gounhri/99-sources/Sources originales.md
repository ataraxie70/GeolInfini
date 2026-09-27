---
projet: "gounhri"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Originaux archivés avant modification, empreintes de réception et empreintes après nettoyage"
fichiers_recus: 3
fichiers_modifies: 2
fichiers_supprimes: 0
cree_le: 2026-09-07
tags:
  - gounhri
  - sources
  - provenance
---

# Sources originales

État du dossier `gounhri` tel qu'il se présentait avant la mise en conformité du **2026-09-07**, et trace exacte de ce que cette intervention a déplacé, renommé et modifié.

> [!info] Aucune conversion, aucune suppression
> `gounhri` n'a reçu aucun document en format fermé : ses trois documents sont nés en Markdown. Aucun fichier n'a été supprimé. **Deux des trois ont en revanche été modifiés** — retrait des fragments de citation automatique, `DEC-C-032` — ce qui rend l'archivage des originaux obligatoire au titre de la règle 6 du coffre.

---

## 1. Les originaux, tels que reçus

> [!important] `originaux-avant-DEC-C-032.zip`
> Archive créée **avant** toute modification, contenant les trois fichiers sous leur nom d'origine et avec leurs octets d'origine. Chacun a été vérifié contre son empreinte de réception **après** entrée dans l'archive : les trois correspondent.
> Le format `.zip` est retenu pour que ces originaux **n'apparaissent pas comme des notes** dans le graphe et la recherche du coffre — même motif qu'à `DEC-C-015` pour `infUb`.

| Champ | Valeur |
| --- | --- |
| Contenu | 3 fichiers, 191 537 octets décompressés |
| Taille de l'archive | 62 178 octets |
| SHA-256 de l'archive | `7523539859be8cf564aee93867c12371cd6278926372be60ca2c70ac5e940db1` |
| Créée le | 2026-09-07, avant application de `DEC-C-032` |

| Fichier d'origine | Taille | SHA-256 de réception |
| --- | --- | --- |
| `document_ouverture_infrastructure_sociale_souveraine_burkina_v0.1.md` | 50 215 o | `9938490dcb044bbe36b7226c5d64a3c09204492aac3c819873e78045a8bf223d` |
| `dossier_strategique_infrastructure_sociale_souveraine_burkina_v0.2.md` | 43 769 o | `02f5da33278eb665d63d693b2f108deaa7f76184e7c89e44b9969771cc3662c2` |
| `volet3_ingenierie_humaine_burkina_v0_1.md` | 97 553 o | `09578963c4c9a22b2ff3f7238cc19b42f7049369cd7b153501c4947d1cb6e077` |

---

## 2. Les versions de travail, après retrait des fragments de citation

| Note actuelle | Phase | Taille du corps | SHA-256 du corps | Fragments retirés |
| --- | --- | --- | --- | --- |
| [[Document d'ouverture]] | `00-intention` | 50 175 o | `df8eecdeacf7ac59c8f344f13ff2de4fa9f2ffe6ddacae6f88986da095568e76` | **1** |
| [[Dossier stratégique de cadrage]] | `20-cadrage-strategique` | 43 348 o | `938985ba2ca3cb8656a330afba0871f90b4b0a01a4ab4566030d33334c760d9e` | **11** |
| [[Dossier d'ingénierie humaine]] | `10-etudes` | 97 553 o | `09578963c4c9a22b2ff3f7238cc19b42f7049369cd7b153501c4947d1cb6e077` | **0** — corps identique à la réception, à l'octet près |

**Nature exacte de la modification.** Le fragment est retiré, **avec au plus l'unique espace qui l'introduisait** ; lorsqu'il occupait seul une ligne, la ligne est retirée. Un fragment se présentait sous la forme `⟨U+E200⟩cite⟨U+E202⟩turn416866search0⟨U+E201⟩` — des caractères Unicode à usage privé encadrant un renvoi vers un jeu de résultats de recherche qui n'existe plus.

**Contrôle appliqué.** Comparaison ligne à ligne avec l'original archivé :

| Contrôle | Résultat |
| --- | --- |
| Lignes modifiées ne contenant pas de fragment | **0** |
| Sauts de ligne Markdown — deux espaces en fin de ligne | **Préservés**, y compris dans les en-têtes de propriétés |
| Décompte des lignes | 1 685 → **1 684** · 1 400 → **1 400** · 999 → **999** |
| Poids retiré | 40 o + 421 o = **461 octets sur 191 537**, soit 0,24 % |
| Caractères à usage privé restants dans `gounhri` | **Aucun** |

**Ce qui n'a pas été touché.** Aucun mot, aucun chiffre, aucun tableau, aucun schéma, aucune structure de titre. Les **références lisibles sont intactes** : l'annexe D du [[Dossier stratégique de cadrage]] nomme toujours DataReportal, l'ARCEP, la Primature et le ministère de la Transition digitale — seul le renvoi illisible qui suivait chaque ligne a disparu.

---

## 3. Correspondance des noms

| Fichier d'origine | Note actuelle |
| --- | --- |
| `document_ouverture_...v0.1.md` | [[Document d'ouverture]] — `00-intention/` |
| `dossier_strategique_...v0.2.md` | [[Dossier stratégique de cadrage]] — `20-cadrage-strategique/` |
| `volet3_ingenierie_humaine_burkina_v0_1.md` | [[Dossier d'ingénierie humaine]] — `10-etudes/` |

Les renvois internes n'ont pas été réécrits : le [[Dossier d'ingénierie humaine]] cite nommément le *« Document d'ouverture v0.1 »* et le *« Dossier stratégique de cadrage v0.2 »*, et les trois documents se citent par numéro de section.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Un fichier de `99-sources` est en lecture seule par convention. Toute correction se fait dans la note de travail correspondante.
2. **Toute source entre avec son empreinte.** SHA-256 calculé et consigné à l'archivage, pour détecter toute altération ultérieure.
3. **Toute conversion est contrôlée et chiffrée.** Sans objet pour `gounhri` : aucun document n'a été converti.
4. **Ce dossier n'est pas une corbeille.** Il ne contient que des originaux dont une version de travail existe ailleurs dans le projet — c'est bien le cas des trois fichiers de l'archive.
