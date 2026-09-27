---
projet: "synapse"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Empreintes d'intégrité des trois documents et trace de la mise en conformité"
fichiers_recus: 3
fichiers_supprimes: 0
cree_le: 2026-09-07
tags:
  - synapse
  - sources
  - provenance
---

# Sources originales

État du dossier `synapse` tel qu'il se présentait avant la mise en conformité du **2026-09-07**, et trace de ce que cette intervention a déplacé et renommé.

> [!info] Ce dossier ne contient aucun fichier, et c'est normal
> `synapse` n'a reçu **aucun document en format fermé** : ses trois documents sont nés en Markdown. Il n'y a donc ni original à conserver en regard d'une version de travail, ni conversion à contrôler. Rien n'a été supprimé non plus.
> Ce registre existe pour une seule chose : **consigner les empreintes d'intégrité** des trois documents, prises avant tout déplacement, de sorte que toute altération ultérieure soit détectable.

---

## 1. Les trois documents reçus

Chaque document a été **déplacé et renommé, jamais réécrit**. Un en-tête de propriétés et un encadré de lecture ont été ajoutés **au-dessus** du corps ; le corps lui-même est resté identique à l'octet près.

Les empreintes ci-dessous ont été calculées **avant** tout déplacement, puis recalculées **après** sur le seul corps de chaque note. **Les trois correspondent.**

| Note actuelle | Fichier d'origine | Identifiant | Taille du corps | SHA-256 du corps |
| --- | --- | --- | --- | --- |
| [[Vision, domaines et architecture cible]] | `SYNAPSE_document_reference_global.md` | `SYNAPSE-REF-001` | 26 665 o | `7045bbadd51bab32d3abfdb4beb7843bb417f8e7679e945538773017260fac38` |
| [[Inclusion des compétences non formelles]] | `SYNAPSE_axe_competences_non_formelles.md` | `SYNAPSE-REF-002` | 14 958 o | `a7ab25465054222803b4e95483b97596d38cf87774ba9619af2344048209e778` |
| [[Dossier de faisabilité]] | `SYNAPSE_dossier_faisabilite.md` | `SYNAPSE-REF-003` | 27 479 o | `96fce9a0e4d31cdbc8f1c364f8d842596d7da92b12312e64b76f46804d5cd3b8` |

**Ce qui a été ajouté au-dessus du corps**, et rien d'autre : l'en-tête de propriétés YAML, et un encadré signalant pour chaque document un écart précis — la réduction de périmètre pour REF-001, les trois questions refermées ailleurs pour REF-002, le statut non contractuel pour REF-003. Aucun mot, aucun chiffre, aucun tableau, aucune structure de titre n'a été touché à l'intérieur des corps.

---

## 2. Ce que la mise en conformité n'a pas fait

- **Aucun fichier supprimé.** Le dossier ne contenait que ces trois documents.
- **Aucune conversion.** Les trois étaient déjà en Markdown.
- **Aucun renvoi interne réécrit.** Les trois documents se citent entre eux par leur identifiant — « REF-001 point 7.2 », « REF-002 point 8.1 » — et ces renvois restent intacts. Le tableau de correspondance est à `DEC-C-026` au [[synapse/90-pilotage/Journal des décisions|Journal des décisions]].
- **Aucun contenu déplacé entre projets**, aucun recouvrement tranché.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Un fichier de `99-sources` est en lecture seule par convention. Toute correction se fait dans la note de travail correspondante.
2. **Toute source entre avec son empreinte.** SHA-256 calculé et consigné à l'archivage, pour détecter toute altération ultérieure.
3. **Toute conversion est contrôlée et chiffrée.** Sans objet pour `synapse` : aucun document n'a été converti.
4. **Ce dossier n'est pas une corbeille.** Il ne contient que des originaux dont une version de travail existe ailleurs dans le projet.
