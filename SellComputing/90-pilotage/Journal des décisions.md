---
projet: "SellComputing"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 3
cree_le: 2026-09-09
tags:
  - SellComputing
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
> **Néant au 2026-09-09.** Sont notamment suspendus : **l'échelle même du projet** — site de vente conseillée, entreprise sous cadre TOGAF, ou méthodologie générale d'architecture —, le nom du produit, le premier public, le périmètre du produit minimal, l'approvisionnement, le modèle économique, l'architecture et la pile technique.
>
> **Le corpus contient pourtant un modèle de décision, des principes d'entreprise et une feuille de route de produit minimal.** La règle `DEC-C-014` pose qu'aucun statut interne à un document ne vaut décision de projet. Ces éléments sont **classés proposés**.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-070 — Mise en conformité aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet adopte la structure et les conventions du coffre sous le nom de code **`SellComputing`**, casse d'origine, conformément à `DEC-C-002`. Les trois ensembles documentaires rejoignent `99-sources` sans être réorganisés entre eux. |
| **Nom de produit** | **Non décidé.** Trois noms coexistent : *Sell Computing* dans l'index documentaire, *cell computing* dans les noms de fichiers, *Project Atlas* dans le dossier de fondation d'entreprise. Aucun n'a été retenu, et le corpus ne signale nulle part qu'il en change. |
| **Motif de la conservation des trois ensembles** | Ils ne traitent pas le même objet à la même échelle. Les fusionner effacerait l'escalade de périmètre que leur séparation rend visible, laquelle est un fait du dossier. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **`10-etudes` n'est pas ouverte** : l'échelle du projet doit être tranchée d'abord. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-071 — Sortir les fichiers d'échange d'éditeur hors du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Deux fichiers `.kate-swp` sont **déplacés hors du coffre**, vers `Incubo/_hors-coffre/sellcomputing/`. **Aucune suppression n'est faite.** |
| **Motif** | Un fichier d'échange d'éditeur est un **artefact temporaire**, non un document. La règle 6 du coffre pose que `99-sources` conserve des **originaux** ; un fichier d'échange n'en est pas un, et sa présence fausserait l'inventaire comme l'empreinte. |
| **Portée** | Ce précédent vaut pour tout le coffre au même titre que `DEC-C-037` sur le code et les artefacts de compilation : un fichier produit par un outil pour son propre usage n'est pas une source. |
| **Réversibilité** | Totale — les fichiers sont conservés hors du coffre. |
| **Statut** | Active |

### DEC-C-072 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 42 fichiers produits avant l'entrée dans le coffre sont versés en `99-sources` comme **matériau de référence**. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit pas ce qui l'invaliderait, et ne cite **ni enquête, ni mesure, ni entretien, ni état de l'art, ni concurrent** — alors qu'il conçoit un commerce sur un marché occupé. |
| **Fait de chronologie** | Trois moments distincts, sur deux mois : le **2026-06-10** de 12 h 46 à 19 h 18, le **2026-07-01** de 16 h 52 à 21 h 39, et le **2026-08-10** à 21 h 23 pour l'archivage. **C'est le seul corpus hérité du coffre à ne pas avoir été produit en une séance.** |
| **Fait d'escalade** | Les trois moments ne traitent pas le même objet : un site de vente conseillée, puis une entreprise sous cadre TOGAF, puis une méthodologie générale d'architecture dont le commerce n'est qu'un cas d'étude. **La dernière bascule est écrite dix-sept minutes après l'achèvement de la précédente**, et aucune preuve nouvelle ne l'accompagne. |
| **Fait de condensation** | La série normalisée du 10 juin est **trois à quatre fois plus courte** que les documents qu'elle normalise, et son index recommande de la lire seule. Un lecteur qui le ferait perdrait les deux tiers de la substance. |
| **Conséquence directe** | Les dossiers `10` à `60` **ne sont pas ouverts**, bien que le corpus contienne un modèle de domaine, un modèle de données, une architecture applicative, des contrats d'interface et une feuille de route. |
| **Ce qui est retenu** | L'**intention** — vendre un besoin et une recommandation expliquée plutôt qu'une marque et une fiche technique — et les **trois peurs de l'acheteur** qu'elle prétend traiter. Repris comme intention et hypothèses au registre des statuts. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |
