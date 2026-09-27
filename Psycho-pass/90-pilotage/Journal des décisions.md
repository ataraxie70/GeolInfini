---
projet: "Psycho-pass"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 5
cree_le: 2026-09-09
tags:
  - Psycho-pass
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
> **Néant au 2026-09-09.** Tous les éléments du point 8 du [[Psycho-pass/00-intention/Document fondateur d'intention|Document fondateur d'intention]] demeurent suspendus, y compris ceux pour lesquels le corpus hérité contient une réponse écrite et détaillée : le nom du produit, le territoire, le premier public, le périmètre du produit minimal, le modèle économique, l'origine du contenu, la pile technique et l'architecture.
>
> **Le corpus déclare pourtant des décisions.** Le `RFC-001` porte la mention *« décisions structurantes du projet »* et le `README` du dépôt énonce un ordre de priorité documentaire opposable — `must/`, puis `rfc/`, puis `backlog/`, puis `cdc/`, puis `prompt-pack/`. La règle `DEC-C-014`, opposable à tout le coffre, pose qu'aucun statut interne à un document ne vaut décision de projet. Ces énoncés sont **classés proposés**.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-057 — Nom de code, mise en convention et réunion des deux dossiers

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet entre au coffre sous le nom de code **`Psycho-pass`** et adopte les conventions de rangement : note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, sources empreintées. Le dossier racine `_Psycho-pass` est **absorbé** : son contenu rejoint `99-sources/pack-pedagogique`, et le dossier vide est supprimé. |
| **Motif du nom retenu** | La convention `DEC-C-002` pose que le dossier porte **le nom de code, casse d'origine**. Le dossier d'origine s'écrit `Psycho-pass` ; cette graphie est conservée sans modification. |
| **Graphies observées** | Trois coexistent dans le corpus : `Psycho-Pass` dans la documentation et le `README`, `Psycho-pass` sur le dossier et l'archive, `psycho-pass` sur le dépôt de code. **Aucune n'est un nom de produit décidé.** |
| **Motif de la réunion** | Les deux dossiers portaient le même projet. Le pack pédagogique de `_Psycho-pass` a été produit le 2026-05-15 à 14 h 58, entre le *prompt-pack* de 14 h 53 et l'archive de 15 h 06 : il s'insère dans la même séance, et non dans un travail séparé. Le tiret bas initial n'était documenté nulle part, et l'observation conservée sous `DEC-C-054` — un tiret bas semblant marquer un dossier d'origine hors coffre — reste **non vérifiée**. |
| **Phases ouvertes** | `00-intention`, `10-etudes`, `90-pilotage`, `99-sources`. **Aucune autre**, conformément à `DEC-C-059`. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-058 — Sortie du code, des artefacts et du fichier de secrets hors du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dépôt de code, ses dépendances, ses sorties de compilation, son outillage et son fichier d'environnement sont **déplacés hors du coffre**, vers `Incubo/_hors-coffre/psycho-pass/`. **Aucune suppression n'est faite.** La documentation est récupérée avant la sortie et versée en `99-sources`. |
| **Motif** | Application du précédent `DEC-C-037`, établi sur `levelup`. Un coffre de conception n'héberge ni sources compilées ni caches de construction : `apps/frontend/.next` occupait **51 Mo pour deux fichiers source d'interface**. |
| **Motif distinct et prioritaire** | Le dépôt contenait un fichier `.env` renseigné, portant une chaîne de connexion de base de données et deux secrets de signature de jetons. Un coffre de notes est fait pour être lu, synchronisé et partagé ; il n'est pas un lieu de conservation de secrets. Ce motif aurait suffi seul. |
| **Vérification conduite** | Comptage avant et après. **253 fichiers avant, 253 après** — 38 dans le coffre, 215 hors du coffre. Le coffre passe de **51,1 Mo à 381 Ko**. Aucun fichier n'est perdu. |
| **Ce que la sortie ne coûte pas** | Le dépôt Git ne porte **aucun commit** : la branche `main` existe, les 22 entrées sont non suivies. Aucun historique n'est donc rompu par le déplacement, puisqu'il n'en existe aucun. |
| **Réversibilité** | Totale — les copies sont conservées hors du coffre. |
| **Statut** | Active |

### DEC-C-059 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 38 fichiers produits avant l'entrée dans le coffre sont versés en `99-sources` comme **matériau de référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit pas ce qui l'invaliderait, et ne cite **ni enquête, ni mesure, ni entretien, ni état de l'art, ni source psychométrique** — alors qu'il conçoit un instrument de mesure de l'aptitude cognitive. |
| **Fait de chronologie** | L'ensemble a été produit en **deux séances** : le 2026-05-15 de 12 h 51 à 18 h 04, puis le 2026-05-16 de 17 h 16 à 18 h 05. La documentation de conception, le *prompt-pack*, le pack pédagogique et le socle technique tiennent dans la première. |
| **Comparaison conduite** | L'archive `Psycho-pass.zip` a été ouverte et comparée par empreinte à `prod-docs`. Elle en est un **état antérieur strict** : aucun fichier ne lui est propre, sept sont identiques, six divergent. `prod-docs` fait donc référence. |
| **Conséquence directe** | Les dossiers `20` à `60` **ne sont pas ouverts**, bien que le corpus contienne cinq RFC, deux MUST, un backlog technique, un schéma de données et un socle de code. Les ouvrir afficherait comme franchies des phases qui ne le sont pas. |
| **Ce qui est retenu** | La règle *« le frontend affiche, le backend décide »*, reprise au point 5.1 du document fondateur d'intention comme principe de conception défendable et motivé, non comme résultat. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |

### DEC-C-060 — Ouverture de la phase `10-etudes` et conduite immédiate du benchmark

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | La phase `10-etudes` est ouverte. Le [[Psycho-pass/10-etudes/Benchmark et état de l'art\|Benchmark et état de l'art]] est **conduit immédiatement**, sur sources publiques, avant l'écriture du reste du programme. Le [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] V0.1 y est versé. |
| **Motif de l'ordre** | Le benchmark ne dépend d'aucune autorisation et peut rendre le reste inutile. Précédent `DEC-C-056`, établi sur `maSecure`. |
| **Résultat du benchmark** | Trois faits que le corpus ignore. Le terrain est **occupé jusque dans le territoire le plus probable** — une plateforme burkinabè vend le module psychotechnique 5 000 FCFA par an depuis janvier 2024. La fonction adaptative revendiquée exige une **calibration de 250 à 500 réponses par item**, que le produit ne peut obtenir qu'après avoir acquis le trafic que cette fonction est censée produire. Et les deux publics visés — candidats et recruteurs — ont des intérêts **opposés** sur la mesure vendue. |
| **Conséquence sur la doctrine** | La règle `D2` de la [[Doctrine du coffre]] impose qu'un programme d'études porte un lot **actif** et un lot **payeur**. Ils sont `L6` et `L7`. La règle `D1` n'est pas en écart : aucune signature de tiers ne conditionne l'existence du produit. |
| **Seuils** | Les conditions d'invalidation sont **pré-enregistrées** lot par lot, conformément à la règle `D3`, et ne se réécrivent pas après avoir vu le résultat. |
| **Portée** | Protocole d'investigation. **Aucune décision de projet n'est prise.** |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

### DEC-C-061 — `Psycho-pass` est rangé comme projet distinct de `levelup`, sans que la question produit soit tranchée

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Au **rangement**, `Psycho-pass` est un projet distinct : dossier propre, journal propre, programme d'études propre. Il n'est ni un sous-dossier de `levelup`, ni un lot de son programme. |
| **Portée exacte, et sa limite** | Cette décision porte sur l'organisation documentaire, **et sur elle seule**. Elle ne dit pas que les deux produits doivent rester séparés, ni qu'ils doivent fusionner, ni que l'un doit fournir l'autre. Cette question-là est une **décision de projet**, et aucun jalon des deux projets n'est franchi. |
| **Motif du rangement séparé** | Trois motifs, exposés en détail dans [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]]. Les deux projets ne mesurent pas le même objet — une aptitude relativement stable contre une compétence acquise. Ils n'ont pas la même définition de la preuve, et celle de `levelup` **exclut** le questionnaire à choix multiples. Ils ne visent pas le même bénéficiaire. |
| **Motif de méthode** | Ranger séparément est **réversible** : deux dossiers se réunissent. Ranger ensemble ne l'est pas au même coût, et surtout impose au lecteur une thèse — celle de l'unité des deux projets — qu'aucun travail n'a établie. Le rangement ne doit pas trancher ce que l'étude n'a pas tranché. |
| **Ce qui trancherait la question produit** | Le lot `L8` du [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]], à conduire conjointement avec `levelup`, et dont l'issue est portée à [[Cartographie du portefeuille]]. |
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
