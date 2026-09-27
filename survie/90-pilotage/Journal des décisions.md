---
projet: "survie"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 5
cree_le: 2026-09-12
mis_a_jour_le: 2026-09-12
tags:
  - survie
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Sans ce journal, une possibilité évoquée dans une note finit par être lue comme un choix arrêté.
> Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre**. Une décision dont la portée est ce seul projet s'inscrit ici ; une décision dont la portée excède un projet s'inscrit au [[Journal des décisions du coffre]].
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**. Au 2026-09-12, le dernier était `DEC-C-086`, au journal de `checkme`.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-12.** Le verdict du premier maillon est *à reformuler* : point 10 du [[survie/00-intention/Document fondateur d'intention|Document fondateur d'intention]]. Tout ce que liste le point 13 de ce document reste suspendu, y compris le nom du produit, le bénéficiaire premier, le territoire, le périmètre et la pile technique.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-087 — Ouvrir le projet sous un nom de code provisoire

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet, sur sa demande du 2026-09-12. Le nom de code, lui, est proposé à l'ouverture : le porteur ne l'a pas choisi |
| **Décision** | Le projet est ouvert à la racine du coffre sous le nom de code **provisoire** `survie`, avec les seuls dossiers `00-intention`, `90-pilotage` et `99-sources`, conformément à la procédure « Ouvrir un nouveau projet » de l'[[Index du coffre]]. |
| **Motif** | Le porteur a demandé d'ouvrir le projet dans le coffre en déclarant que ni le nom ni le nom de code n'étaient décidés. Or la convention `DEC-C-002` nomme le dossier d'un projet par son nom de code. Le mot est tiré de la déclaration du porteur — *« une vraie boîte de survie »* — pour rester traçable, et il est choisi court pour être renommé à moindre coût. |
| **Ce que la décision ne fait pas** | Elle ne fixe ni le nom du produit, ni le nom de code définitif. Elle n'ouvre aucune autre phase. Elle ne touche à aucun fichier de ClassRoom. |
| **Portée** | Le seul projet `survie`. Son inscription à l'[[Index du coffre]], à la [[Cartographie du portefeuille]] et au relevé de conformité de la [[Doctrine du coffre]] en découle mécaniquement et n'emporte aucune décision de portefeuille. |
| **Réversibilité** | **Élevée.** Renommer le dossier et corriger les liens en chemin complet, soit une vingtaine de liens au 2026-09-12. Précédents : `Pblog`, `DEC-C-076`, et `maSecure`, `DEC-C-054`. |
| **Alternatives écartées** | **Attendre un nom avant d'ouvrir** : écarté, le porteur ayant demandé l'ouverture immédiate. **Un numéro d'ordre comme nom** : écarté, un numéro ne dit rien au lecteur et se confond avec les numéros de lots et de faits. **Un nom qui décrit une solution** : écarté, le verdict du premier maillon pouvant déplacer le périmètre. |
| **Statut** | Active — nom de code **à confirmer par le porteur** |

### DEC-C-088 — Verser les déclarations fondatrices du porteur en `99-sources`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet |
| **Décision** | Les quatre déclarations du porteur qui fondent le projet, du 2026-09-10 au 2026-09-12, sont versées **à l'identique** en [[survie/99-sources/Déclarations fondatrices du porteur\|Déclarations fondatrices du porteur]], avec leur horodatage et l'empreinte SHA-256 du fichier. |
| **Motif** | Le projet n'a pas de corpus hérité : sa seule source d'origine est la parole du porteur. La règle 6 de tenue du coffre veut que les sources originales soient conservées intactes et empreintées, pour qu'une restitution puisse toujours être comparée à son original. |
| **Contrôle** | Chaque texte versé a été comparé par programme à l'historique de la session : les quatre sont identiques, fautes et doubles espaces compris. Aucune apostrophe typographique n'y figure. |
| **Portée** | Sources du projet. Les trois premières déclarations appartiennent au chantier ClassRoom et y sont reprises comme origine de l'intention, non comme documents de ClassRoom. |
| **Réversibilité** | Élevée — un fichier à retirer. |
| **Alternatives écartées** | **Verser une version corrigée** : écarté, une source corrigée n'est plus une source. **Verser l'historique complet de la session** : écarté, il contient surtout le travail sur ClassRoom et des éléments sans rapport avec l'intention. |
| **Statut** | Active |

### DEC-C-089 — Verser le Document fondateur d'intention, version 0.1

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet |
| **Décision** | Le [[survie/00-intention/Document fondateur d'intention\|Document fondateur d'intention]], version 0.1, est versé en `00-intention`. Il rend le verdict du premier maillon : **à reformuler**. |
| **Motif** | La chaîne documentaire du coffre commence par un arbitrage qui décide si le projet a le droit d'exister sous sa forme présente. Le verdict tombe sur deux points : l'intention n'a pas de bénéficiaire nommable, et elle arrive sur un terrain dont la cause de mort principale (l'usage installé) n'est levée par rien de nommé. |
| **Ce que la décision ne fait pas** | Elle ne retient aucune des cinq reformulations du point 11 : toutes restent des **possibilités**. Elle n'ouvre pas `10-etudes`. Elle ne tranche aucune relation avec `ecoFab` ou `levelup`. |
| **Ce qu'elle pré-enregistre** | Les seuils du test du point 14.2, qui mesure l'usage réel de ClassRoom par le porteur pendant six semaines de cours, sont datés du 2026-09-12, avant toute collecte, conformément à la règle `D3` de la [[Doctrine du coffre]]. |
| **Portée** | Le seul projet `survie`. |
| **Réversibilité** | Élevée — une version 0.2 remplace la 0.1 à la reformulation. Le verdict lui-même n'est pas réversible : seule une reformulation arbitrée à son tour peut en rendre un autre. |
| **Alternatives écartées** | **Verdict « non instruit »** : écarté pour les trois motifs du point 10.2, dont l'existence de preuves contraires de grade `N1`. **Verdict « rejeté »** : écarté, des reformulations identifiables contournant les causes de mort relevées. **Commencer par un programme d'études** : écarté, aucun programme ne peut instruire une valeur pour « tout apprenant ». |
| **Statut** | Active |

### DEC-C-090 — Verser une note de référence sur l'architecture des solutions existantes

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet, sur sa demande du 2026-09-12 : *« enregistre cela comme note pour les études futures »* |
| **Décision** | La note [[survie/00-intention/Comment sont construites les solutions d'étude\|Comment sont construites les solutions d'étude]] est versée en `00-intention` comme **référence non opposable**. Elle servira de matériau d'entrée au futur lot d'état de l'art. |
| **Motif** | Le porteur a demandé comment les solutions existantes sont construites, et veut conserver la réponse pour les études futures. La réponse orale a été **vérifiée source par source avant versement** : vingt-trois sources, dont une correction (les services de données de Discord sont écrits en Rust) et deux affirmations ramenées au rang `N0`. |
| **Emplacement** | `00-intention`, et non `10-etudes`. Ouvrir la phase d'études afficherait comme ouverte une phase que le verdict *à reformuler* tient fermée : c'est le motif pour lequel `levelup` n'a pas promu son corpus en phases (`DEC-C-038`). La racine du coffre est exclue par `DEC-C-005`. `99-sources` ne reçoit que des originaux. |
| **Ce que la décision ne fait pas** | Elle ne retient **aucune pile technique ni aucune architecture** pour `survie`. Elle n'ouvre pas `10-etudes`. Elle ne modifie pas le verdict du premier maillon. |
| **Portée** | Le seul projet `survie`. La note intéresse aussi `ecoFab` et `levelup`, sans les engager. |
| **Réversibilité** | Élevée — un fichier à déplacer en `10-etudes` à l'ouverture de cette phase, ou à retirer. |
| **Alternatives écartées** | **Laisser l'explication dans la conversation** : écarté, le porteur demandant sa conservation. **Verser l'explication orale telle quelle** : écarté, elle contenait des affirmations sans source et une inexactitude. |
| **Statut** | Active |

### DEC-C-093 — Verser le relevé du terrain et des points exploitables

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet, sur sa demande du 2026-09-12 : entamer la démarche d'étude par un benchmark technique et stratégique |
| **Décision** | La note [[survie/00-intention/Relevé du terrain et des points exploitables\|Relevé du terrain et des points exploitables]] est versée en `00-intention` comme **référence non opposable**. Elle relève qui occupe le terrain de l'apprenant en Afrique de l'Ouest francophone, ce que l'accès y coûte, et six points potentiellement exploitables. |
| **Périmètre du relevé, fixé par le porteur** | Territoire : **Afrique de l'Ouest francophone**, Burkina Faso au premier plan. Bénéficiaire : **R1 en priorité**, les trois reformulations étant relevées pour permettre l'arbitrage. |
| **Ce que ce périmètre n'est pas** | **Il n'est pas le territoire du projet.** Fixer le terrain d'un relevé ne décide ni du territoire, ni du bénéficiaire, ni du périmètre de `survie` : ces trois points restent au point 13 du [[survie/00-intention/Document fondateur d'intention\|Document fondateur d'intention]], parmi ce qui demeure explicitement non décidé, et la question `Q5` reste ouverte. |
| **Motif** | La reformulation demande quel usage est **mal servi**. Un usage n'est mal servi que par rapport à ce qui le sert déjà : la question ne se répond pas par introspection. Le relevé fournit le seul matériau qui permette d'y répondre sur preuve. |
| **Emplacement** | `00-intention`, et non `10-etudes`, pour le motif même de `DEC-C-090` : ouvrir la phase d'études afficherait comme ouverte une phase que le verdict *à reformuler* tient fermée. |
| **Ce que la décision ne fait pas** | Elle ne retient **aucune reformulation**, **aucune piste** et **aucune architecture**. Les six points du point 5 du relevé sont des possibilités datées, chacune assortie de ce qui la ferait tomber. Elle n'ouvre pas `10-etudes` et ne modifie pas le verdict du premier maillon. |
| **Limites déclarées** | Trois sources n'ont pas pu être consultées et aucun chiffre ne leur est attribué. Le chiffre du coût du gigaoctet date de 2023. Les figures d'occupation institutionnelle reposent sur des sources secondaires. Ces limites sont écrites dans le relevé lui-même. |
| **Portée** | Le seul projet `survie`. Le point `P6` et la reformulation `R2` intéressent `ecoFab` sans l'engager. |
| **Réversibilité** | Élevée — un fichier à déplacer en `10-etudes` à l'ouverture de cette phase, ou à retirer. |
| **Alternatives écartées** | **Ouvrir `10-etudes` pour y conduire un lot d'état de l'art** : écarté, la porte du premier maillon n'est pas franchie. **Relever le terrain mondial sans territoire** : écarté par le porteur, un relevé sans ancrage ne dit rien du coût d'accès réel. **Attendre la reformulation avant tout relevé** : écarté, la reformulation a besoin de ce matériau pour être autre chose qu'une intuition. |
| **Statut** | Active |
