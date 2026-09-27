---
projet: "maSecure"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 3
cree_le: 2026-09-09
tags:
  - maSecure
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]].
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-09.** Tous les éléments du point 7 du [[maSecure/00-intention/Document fondateur d'intention|Document fondateur d'intention]] demeurent suspendus, y compris ceux pour lesquels le corpus hérité contient une réponse écrite et détaillée.
> Cela inclut, sans s'y limiter : le rapport aux fonds, le régime réglementaire visé, le territoire, le premier public, le périmètre du produit minimal, les règles de retard et d'exclusion, le modèle économique, la forme juridique, le *Core Domain*, l'architecture et la pile technique.
>
> **Le corpus déclare pourtant des décisions.** Un document de la troisième passe énonce *« figeant les spécifications métier »* sous un tableau de *« Décisions Métier »*. La règle `DEC-C-014`, opposable à tout le coffre, pose qu'aucun statut interne à un document ne vaut décision de projet. Ces énoncés sont **classés proposés**.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-054 — Nom de code, renommage du dossier et mise en conformité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `_maSecure` est renommé **`maSecure`**, et le projet adopte la structure et les conventions du coffre : note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, sources empreintées, liens en chemin complet vers les notes de pilotage. |
| **Motif du renommage** | La convention `DEC-C-002` pose que le dossier de projet porte **le nom de code, casse d'origine**, sans préfixe. Le tiret bas initial n'était documenté nulle part. Aucun wikilink ne visait encore ce dossier : le renommage ne casse rien, et il ne coûtera jamais moins cher qu'aujourd'hui. |
| **Observation conservée** | L'espace de travail parent contient d'autres dossiers ainsi préfixés — `_Psycho-pass`, `_peogo`, `_Synapse` — et `_Synapse` coexiste avec le projet `synapse` déjà versé au coffre. Le tiret bas semble marquer un dossier d'origine, hors coffre. **Cette hypothèse n'est pas vérifiée** et ne vaut que pour mémoire. |
| **Nom de produit** | **Non décidé.** Le corpus emploie « MaSecure » et « maSecure ». `maSecure` est un **nom de code**, au même titre que `ecoFab` et `levelup`. |
| **Phases ouvertes** | `00-intention`, `10-etudes`, `90-pilotage`, `99-sources`. **Aucune autre**, conformément à `DEC-C-055`. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-055 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 41 fichiers produits avant l'entrée dans le coffre sont versés en `99-sources` comme **matériau de référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit pas ce qui l'invaliderait, et ne cite **ni enquête, ni mesure, ni entretien, ni état de l'art, ni texte réglementaire** — alors même qu'il conçoit un dispositif qui garde de l'argent en zone réglementée. |
| **Fait de chronologie** | L'ensemble a été produit en **sept heures le 2026-06-09**, en **trois passes successives** sur les mêmes objets, avec une charte de fonctionnement réécrite **quatre fois en quatorze minutes**. Les horodatages établissent une succession, non trois versions concurrentes. |
| **Comparaison conduite** | Aucun doublon strict. Huit sujets sont traités par plus d'une passe, et **aucune passe n'est un sur-ensemble des deux autres** : la divergence se tranche par réinstruction, jamais par ancienneté. La version 4 de la charte fait référence, étant la plus tardive et la plus complète. |
| **Conséquence directe** | Les dossiers `20` à `60` **ne sont pas ouverts**, bien que le corpus contienne un catalogue d'API, une matrice de rôles, un modèle de données et un plan d'exploitation. Les ouvrir afficherait comme franchies des phases qui ne le sont pas. |
| **Ce qui est retenu** | Le **principe de séparation** — garde de l'argent, logique de gestion, droit de décision — repris au point 2.2 du document fondateur d'intention comme principe de conception, non comme résultat. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |

### DEC-C-056 — Ouverture de la phase `10-etudes` et conduite immédiate du benchmark

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | La phase `10-etudes` est ouverte. Le [[Benchmark et cadre réglementaire]] est **conduit immédiatement**, sur sources publiques, avant l'écriture du reste du programme. Le [[maSecure/10-etudes/Programme d'études\|Programme d'études]] V0.1 y est versé. |
| **Motif de l'ordre** | Le benchmark ne dépend d'aucune autorisation et peut rendre le reste inutile. C'est la leçon tirée d'`ecoFab`, dont le programme plaçait le cimetière en vague 2, **après un jalon pouvant déjà prononcer l'arrêt**. |
| **Résultat du benchmark** | Deux faits que le corpus ignore. **Six acteurs vivants** de tontine numérique, dont un **agréé par la Banque centrale**. Et un régime UEMOA exigeant, pour garder des fonds, un agrément dont le **capital minimum est de 300 millions de francs CFA libérés avant délivrance**, dans un cadre **reporté six fois en dix-huit mois**. |
| **Conséquence sur la doctrine** | Le projet, tel que le corpus le conçoit, est **en écart avec la règle `D1`** de la [[Doctrine du coffre]] : la garde des fonds est une dépendance que le porteur ne signe pas, et sans elle il n'y a pas de produit. L'écart porte sur le mécanisme central. |
| **Lots portés par doctrine** | `L7` — l'actif — et `L8` — le payeur — sont présents dès la V0.1, conformément à la règle `D2`. |
| **Seuils** | Les conditions d'invalidation sont **pré-enregistrées** lot par lot, conformément à la règle `D3`, et ne se réécrivent pas après avoir vu le résultat. |
| **Portée** | Protocole d'investigation. **Aucune décision de projet n'est prise.** |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

---

## Modèle d'entrée à recopier

```markdown
### DEC-?-0NN — Titre court à l'impératif

| Champ | Valeur |
| --- | --- |
| **Date** | AAAA-MM-JJ |
| **Décideur** | |
| **Décision** | Ce qui est décidé, en une phrase sans conditionnel. |
| **Motif** | Pourquoi, et sur quelle preuve. |
| **Preuves** | Lot, mesure, source, et niveau de preuve. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Statut** | Active / Annulée par DEC-?-0MM |
```
