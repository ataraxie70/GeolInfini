---
projet: "ecoFab"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Fichiers d'origine conservés intacts, avec empreinte et trace de conversion"
cree_le: 2026-09-06
tags:
  - ecoFab
  - sources
  - provenance
---

# Sources originales

Fichiers reçus dans leur format d'origine, **conservés sans aucune modification**. En cas de doute sur une note du coffre, ce sont ces fichiers qui font foi.

## Inventaire

### `document_fondateur_ouverture_ecosysteme_estudiantin_burkina_v0_1.docx`

| Champ | Valeur |
| --- | --- |
| Format | Word (OOXML) |
| Taille | 54 243 octets |
| SHA-256 | `ce8d6d79957c2723330bb336ab053b78b313a3fbba0cc174164cede272d23420` |
| Archivé le | 2026-09-06 |
| Version | 0.1 |
| Converti vers | [[Document fondateur d'ouverture]] |
| Décision associée | `DEC-C-004` au [[ecoFab/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Écarts connus, non corrigés | Trois, consignés par `DEC-C-036` : une faute d'accent (« Verifier », point 20.1), 108 apostrophes typographiques `’` contraires à `DEC-C-002`, et un « nous » en point 1. Le document est **conservé tel quel** pour préserver l'identité à la source ; leur correction relève d'une V0.2 |

**Contrôle de conversion.** Le texte a été comparé caractère à caractère entre le `.docx` et le Markdown, ponctuation, espaces et casse normalisés : **29 725 caractères de part et d'autre, aucune divergence**.

Ce qui a été traduit, et rien d'autre :

| Élément Word | Rendu Markdown |
| --- | --- |
| `Heading1` / `Heading2` (39 paragraphes) | `#` / `##` |
| `ListBullet` (110 paragraphes) | `-` |
| `QuoteBlock` (4 paragraphes) | `>` |
| Runs en **Consolas** (schémas ASCII) | Blocs de code délimités par ` ``` ` |
| Tableaux | Tableaux Markdown |
| *(ajouté)* | En-tête de propriétés YAML et encadré de provenance |

Aucun mot, aucune ponctuation, aucun tableau et aucun schéma n'a été ajouté, retiré ni reformulé.

### `Programme d'études approfondies`

| Champ | Valeur |
| --- | --- |
| Format d'origine | Markdown — **aucune conversion nécessaire** |
| Version | 0.2 |
| Emplacement | `10-etudes/` → [[Programme d'études approfondies]] |
| Traitement initial | Déplacé depuis la racine du coffre le 2026-09-06 ; corps alors **identique octet pour octet** (38 627 octets), en-tête de propriétés YAML ajouté au-dessus |
| Traitement ultérieur | Corps **amendé le 2026-09-08** par `DEC-C-034` : normalisation rédactionnelle et remise en ordre de la numérotation des sections. La garantie d'identité octet pour octet **ne s'applique plus** |

Aucune copie n'est conservée ici. Ce choix, pris lorsque le corps était encore strictement inchangé, a une conséquence à assumer : **aucun état de référence de ce document n'existe dans le coffre**, et ses amendements successifs ne sont donc traçables que par le [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]]. La [[Document fondateur d'ouverture|conversion du document fondateur]] ne présente pas cette faiblesse, son `.docx` d'origine étant archivé et empreinté.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Un fichier de `99-sources` est en lecture seule par convention. Toute correction se fait dans la note de travail correspondante.
2. **Toute source entre avec son empreinte.** SHA-256 calculé et consigné à l'archivage, pour détecter toute altération ultérieure.
3. **Toute conversion est contrôlée et chiffrée.** Une conversion sans contrôle d'intégrité documenté n'est pas versée au coffre.
4. **Ce dossier n'est pas une corbeille.** Il ne contient que des originaux dont une version de travail existe ailleurs dans le projet.
