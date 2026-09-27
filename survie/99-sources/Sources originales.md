---
projet: "survie"
type: "registre-des-sources"
phase: "99-sources"
objet: "Provenance, empreintes d'intégrité et sources citées sans être versées"
regle: "Les sources originales sont intouchables — règle 6 de tenue du coffre"
cree_le: 2026-09-12
mis_a_jour_le: 2026-09-12
tags:
  - survie
  - sources
---

# Sources originales

## 1. Sources versées

| Fichier | Contenu | Provenance | SHA-256 | Décision |
| --- | --- | --- | --- | --- |
| [[survie/99-sources/Déclarations fondatrices du porteur\|Déclarations fondatrices du porteur]] | Quatre déclarations du porteur, du 2026-09-10 à 22:22 UTC au 2026-09-12 à 11:25 UTC, à l'identique | Historique de la session de travail sur ClassRoom | `e6cf57c4570aa563af79d769004844fec50444e5adaaa640d9ad780a6e1918e3` | `DEC-C-088` |

> [!note] Contrôle de fidélité
> Chaque texte a été comparé par programme à l'historique de la session le 2026-09-12 : les quatre sont identiques au caractère près. L'empreinte porte sur le fichier entier, en-tête compris. **Toute modification du fichier invalide l'empreinte.**

---

## 2. Sources citées, non versées

Elles sont citées par le document fondateur et restent à leur emplacement d'origine. Aucune n'est copiée dans le coffre.

| Source | Emplacement | Repère d'intégrité | Pourquoi elle n'est pas versée |
| --- | --- | --- | --- |
| Coffre ClassRoom | `~/Incubo/ClassRoom/`, dépôt Git privé | Commit `4a2d1f12e256f0851765f8c7ebe98d6ee536a775` du 2026-09-12, identique à la branche distante | C'est l'outil personnel du porteur, en usage : il vit dans son propre dépôt, que l'historique Git suffit à empreinter |
| UnivPlateforme | `~/Incubo/UnivPlateforme/`, hors coffre | Fichiers modifiés le 2026-05-05 d'après le système de fichiers | Dossier hors coffre, **antécédent d'`ecoFab`** selon la déclaration du porteur du 2026-09-12, fait `F14` du [[survie/90-pilotage/Registre des statuts\|Registre des statuts]]. Il n'entre pas au coffre à ce titre : la trace de la filiation relève d'`ecoFab`, question `Q6` |

---

## 3. Sources externes

Les neuf sources publiques consultées le 2026-09-12 sont listées, avec leur lien, en fin du [[survie/00-intention/Document fondateur d'intention|Document fondateur d'intention]].
