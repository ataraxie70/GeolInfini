---
projet: "INPC-BF"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 2
cree_le: 2026-09-09
tags:
  - INPC-BF
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

La séquence `DEC-C-` est **unique et continue sur tout le coffre**. Une décision dont la portée excède ce projet s'inscrit au [[Journal des décisions du coffre]].

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-09.** Sont notamment suspendus : le rattachement institutionnel, le régime de propriété culturelle collective, les niveaux d'accès et le droit de retrait, l'alignement sur les référentiels patrimoniaux internationaux, le découpage en contextes bornés, et la pile technique.
>
> **Le corpus contient pourtant un découpage en contextes bornés et quatre modèles tactiques**, marqués `Version 0.1` et présentés comme une série d'architecture logicielle. La règle `DEC-C-014` pose qu'aucun statut interne à un document ne vaut décision de projet. Ces éléments sont **classés proposés**.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-065 — Ouvrir l'archive et mettre le projet en convention

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | L'archive `files.zip`, unique contenu du dossier, est **extraite** en `99-sources/documents` et **conservée intacte** à côté. Le projet adopte la structure et les conventions du coffre sous le nom de code **`INPC-BF`**, casse d'origine, conformément à `DEC-C-002`. |
| **Motif de l'extraction** | Le dossier ne contenait **aucun fichier lisible**. Obsidian n'ouvre pas les archives compressées ; un corpus qui ne s'affiche pas ne peut être ni cité, ni relié, ni relu. |
| **Nom** | `INPC-BF` est le sigle employé par le corpus lui-même pour *Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso*. Il est retenu comme **nom de code**. Aucun nom de produit n'est décidé. |
| **Effet de bord constaté, et non corrigé** | L'extraction restitue les horodatages de l'archive, qui portent tous la **même valeur — 2026-08-07 à 14 h 13**. La chronologie interne du corpus est donc **perdue** : l'ordre de production des quatorze documents ne peut être établi par leurs dates. Il ne peut l'être que par les renvois qu'ils se font entre eux. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **`10-etudes` n'est pas ouverte.** |
| **Réversibilité** | Totale — l'archive est intacte. |
| **Statut** | Active |

### DEC-C-066 — Le corpus hérité est une référence, et il est incomplet

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 14 fichiers versés en `99-sources` sont **matériau de référence**, non opposables. **Leur incomplétude est consignée comme un fait vérifié**, et non traitée comme un détail de rangement. |
| **Fait établi** | Le corpus déclare onze documents de fondation conceptuelle — *« la vision, le référentiel conceptuel, la taxonomie, la gouvernance, l'ontologie en six parties, l'ancrage institutionnel »*. L'archive en contient **huit**. Manquent la **charte fondatrice**, le **référentiel conceptuel** et la **taxonomie**. |
| **Gravité** | Ces trois documents sont cités **17, 33 et 34 fois** par les documents présents. Ils portent la vision du projet, la définition de ses objets de pensée et leur classification. Le corpus versé est donc **une ontologie sans son référentiel** et **une architecture sans sa vision**. |
| **Ce que la reprise ne fera pas** | Elle ne reconstituera pas ces documents à partir de leurs citations. Une intention reconstruite depuis des renvois de seconde main serait une invention présentée comme une restitution, ce que la doctrine du coffre proscrit. |
| **Conséquence directe** | Le [[INPC-BF/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] est écrit **sous réserve expresse**, et signale à chaque point ce qui provient d'une source directe et ce qui provient d'une citation. Les dossiers `10` à `60` ne sont pas ouverts. |
| **Ce qui est retenu** | La **séparation stricte du patrimoine et de la technologie**, tenue sur les onze documents de fondation, et le **principe de non-suppression avec coexistence des variantes**. Repris comme principes de conception au registre des statuts. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |
