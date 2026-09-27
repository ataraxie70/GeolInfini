---
type: "note-de-pilotage-transverse"
portee: "Coffre entier — décisions dont la portée excède un projet"
objet: "Registre unique des décisions de coffre à portée transverse"
regle_de_numerotation: "Séquence DEC-C- unique et continue sur tout le coffre"
decisions_natives: 4
decisions_recensees: 8
cree_le: 2026-09-08
mis_a_jour_le: 2026-09-12
tags:
  - coffre
  - pilotage
  - decisions
---

# Journal des décisions du coffre

Registre des décisions **dont la portée excède un projet**. Il complète les journaux de projet, il ne les remplace pas.

> [!important] La règle de partage
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : il n'existe qu'un seul compteur, et deux décisions ne portent jamais le même numéro.
> Ce qui change, c'est **l'emplacement** :
> — une décision dont la portée est **le coffre entier, ou plusieurs projets**, s'inscrit **ici** ;
> — une décision dont la portée est **un seul projet** s'inscrit dans le journal de ce projet.
> Le critère est la portée déclarée par la décision elle-même, pas le lieu où le travail a été fait.

> [!warning] Ce registre ne concerne pas les décisions de projet
> Le registre `DEC-P-` — produit, périmètre, technique, gouvernance, économie — reste **exclusivement** dans le journal du projet concerné, et n'existe qu'après un jalon franchi. Aucune décision de projet ne peut être inscrite ici.

---

## Pourquoi ce registre existe

Jusqu'au 2026-09-08, les décisions de coffre à portée transverse étaient inscrites dans le journal du projet où le travail avait eu lieu — le plus souvent `ecoFab`, qui a servi de modèle aux autres. La convention s'était installée sans être décidée.

Elle fonctionnait, mais elle rendait la doctrine du coffre **introuvable** : un lecteur extérieur cherchant la convention de nommage, la règle de contenu de la racine ou la portée du registre `DEC-P-` n'a aucune raison d'ouvrir le journal d'un projet particulier. Une règle opposable qu'on ne trouve pas n'est pas opposable.

---

## Décisions natives

### DEC-C-050 — Séparer les décisions de coffre transverses des décisions de coffre de projet

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Une décision `DEC-C-` dont la portée **excède un projet** s'inscrit désormais dans le présent registre. Une décision `DEC-C-` dont la portée est **un seul projet** reste dans le journal de ce projet. La séquence de numérotation demeure **unique et continue** sur tout le coffre. |
| **Motif** | Six décisions à portée transverse — dont la convention de nommage de tout le coffre et la règle qui interdit à un statut interne de valoir décision de projet — vivaient dans les journaux d'`ecoFab` et d'`infUb`. Elles étaient correctes et journalisées, mais **introuvables pour qui ne connaît pas l'histoire du coffre**. |
| **Ce que la décision ne fait pas** | **Elle ne déplace aucune entrée existante.** Un journal est *append-only* : déplacer une entrée déjà inscrite briserait la continuité de lecture du journal d'origine et invaliderait les renvois qui la citent. Les six entrées antérieures sont **recensées ci-dessous**, avec leur emplacement réel, et restent là où elles ont été écrites. |
| **Effet sur la numérotation** | Aucun. Le compteur reste commun. `DEC-C-050` est la cinquantième décision de coffre du coffre, quel que soit son emplacement. |
| **Critère d'arbitrage** | La **portée déclarée** par la décision elle-même, dans son champ *Portée*. Une décision dont la portée dit « tout le coffre » ou nomme plusieurs projets relève d'ici. Une décision dont la portée nomme un seul projet relève de son journal, **même si elle instaure un modèle reconductible** : un modèle n'est pas une règle tant qu'il n'a pas été promu. |
| **Portée** | Méthode documentaire du coffre. Aucune décision de projet n'est touchée. |
| **Réversibilité** | Élevée — la fusion des deux registres reste possible, et se journaliserait comme la séparation. |
| **Alternatives écartées** | **Déplacer physiquement les six entrées** : écarté, la règle *append-only* l'interdisant et les renvois existants les citant à leur emplacement actuel. **Créer un préfixe distinct** — par exemple `DEC-K-` : écarté, une seconde séquence multipliant les risques de collision pour un gain de lisibilité nul. |
| **Statut** | Active |


### DEC-C-052 — Retirer le signe paragraphe de tout le coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le signe paragraphe est retiré de **tous les documents de travail du coffre** et remplacé par le mot `point`. La règle vaut pour les projets existants et pour tout document à venir. |
| **Motif** | Décision du porteur, qui tient le signe pour un caractère sans portée dans sa rédaction. **Précision de fait** : ce n'est pas un caractère résiduel — c'est le signe typographique français de la section, courant en rédaction juridique et technique. Le motif retenu n'est donc pas l'absence de sens, mais la lisibilité pour un lecteur extérieur, qui n'a pas à connaître une convention pour lire un renvoi. |
| **Antécédent** | `DEC-C-015`, du 2026-09-06, avait retiré le signe des **191 occurrences d'`infUb`** et notait explicitement : *« Le reste du coffre en compte environ 380 de plus et n'est pas traité : ce serait une règle de coffre opposable à tous les projets, qui n'a pas été prise. »* La présente décision **prend cette règle** et étend la portée de `DEC-C-015` à tout le coffre. |
| **Méthode** | Identique à celle de `DEC-C-015`. Substitution par le mot `point`, **masculin comme paragraphe**, ce qui préserve tous les accords — au, du, le, ce. Une suppression sèche aurait laissé des nombres nus, du type « le 19.2 laisse ouverte la question ». |
| **Volume traité** | **738 occurrences dans 42 fichiers.** Les projets concernés sont `ecoFab`, `checkme`, `gounhri`, `synapse`, `levelup`, les trois notes transverses de la racine, et le dossier `payMe`. |
| **Cas grammaticaux** | Six occurrences produisaient un renvoi sans article. Quatre étaient correctes en l'état — « au **point 3 bis** », « cf. point 4 ». **Deux ont été reprises**, le renvoi tombant en début de phrase : « Voir le point 4 ci-dessous » et « Le point 3.0 porte la sienne ». |
| **Ce qui n'a pas été touché** | **Les deux documents gelés** — le document fondateur d'`ecoFab` et le document de référence global d'`infUb` — ne contenaient aucune occurrence : leur garantie d'intégrité est intacte, et aucune archive préalable n'a été nécessaire. **Les sources archivées de `levelup`** conservent 14 occurrences : la règle 1 de `99-sources` interdit de les éditer. |
| **Portée** | Tous les documents de travail du coffre. **Ne s'applique pas** aux documents archivés en `99-sources`, ni à aucun document gelé par une garantie d'intégrité. |
| **Réversibilité** | **Faible.** La substitution inverse ne serait pas fiable : le mot `point` figure aussi dans le texte pour d'autres raisons — « point d'entrée », « point de rupture », « points d'attention ». C'était déjà la réserve de `DEC-C-015`. |
| **Alternatives écartées** | Conserver le signe en le documentant comme convention : écarté, le porteur ayant tranché. Supprimer sans substituer : écarté pour le motif de `DEC-C-015`, les nombres nus. |
| **Statut** | Active |

#### Vérification du 2026-09-09 — portée réelle de `DEC-C-052` sur les corpus

Un effet de bord de cette décision a été constaté sur `payMe` : deux de ses documents sources portaient la substitution, parce qu'ils résidaient à la racine de leur dossier de projet et non en `99-sources` au moment de la passe. Ils y étaient donc traités comme des notes de travail ordinaires. Les originaux ont été rétablis — `DEC-C-081` au journal de `payMe`.

**La portée de cet effet de bord a été mesurée sur l'ensemble des corpus versés le 2026-09-09**, en recherchant la forme substituée `point N` dans chacun.

| Corpus | Occurrences de la forme substituée | Signes paragraphe subsistants |
| --- | --- | --- |
| `Delivery`, `INPC-BF`, `MyWeather`, `Pblog`, `SellComputing` | **0** | 8 pour `INPC-BF`, 0 pour les autres |
| `maSecure`, `Psycho-pass` | 0 | 0 |
| `levelup` | 0 | 14 |
| `payMe` | 0 après rétablissement | 10 |

**Aucun autre corpus n'a été touché.** Les corpus sans signe paragraphe n'en employaient simplement pas, et ceux qui en emploient les ont conservés — ce qui confirme que `99-sources` a bien été épargné par la passe.

> [!note] La règle que ce cas fixe
> Un corpus versé en `99-sources` **après** une passe rédactionnelle de portée générale peut porter les traces de cette passe. **Avant de figer une empreinte, vérifier si les documents ont été touchés alors qu'ils n'étaient pas encore protégés.**

### DEC-C-091 — Corriger la plage de décisions de `survie` au relevé de conformité de l'index

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet, sur sa demande du 2026-09-12 |
| **Décision** | Au relevé de conformité de l'[[Index du coffre]], la colonne *Décisions de coffre* de la ligne `survie` porte `DEC-C-087` à `DEC-C-090`, et non plus `DEC-C-087` à `DEC-C-089`. |
| **Motif** | Le relevé a été écrit lorsque le projet comptait trois décisions de coffre. `DEC-C-090` — versement de la note de référence sur l'architecture des solutions existantes — a été inscrite au journal de `survie` après cette rédaction, le même jour. Le relevé et le journal du projet se contredisaient donc sur un fait vérifiable, dans la note qu'un lecteur extérieur ouvre en premier. |
| **Contrôle** | La séquence `DEC-C-` a été recomptée sur l'ensemble du coffre, journaux de projet compris : elle est unique et continue, `DEC-C-090` est le dernier numéro attribué, et `DEC-C-086`, au journal de `checkme`, reste le dernier antérieur à l'ouverture de `survie`. |
| **Portée** | La seule ligne `survie` du relevé de conformité de l'[[Index du coffre]], note transverse de la racine. Aucun document de projet n'est touché. Aucune décision n'est créée, modifiée ni annulée, et la numérotation demeure inchangée. |
| **Ce que la décision ne fait pas** | Elle **ne promeut aucune règle de tenue** : l'obligation de reprendre le relevé de l'index à chaque décision de coffre nouvelle n'est énoncée nulle part, et sa promotion appartient au porteur. Elle ne porte pas non plus les deux reprises éditoriales conduites le même jour dans `survie` — l'ajout de la note des déclarations fondatrices à la navigation de sa note d'entrée, et l'ajout du champ `mis_a_jour_le` à son journal — qui rétablissent la conformité du projet à ses propres conventions sans rien décider. |
| **Réversibilité** | Élevée — une valeur de cellule. |
| **Alternatives écartées** | **Retirer la plage de numéros du relevé et renvoyer au seul journal du projet** : écarté, cette plage est précisément ce que le relevé existe pour porter, et la supprimer ferait disparaître le défaut en faisant disparaître l'information. **Inscrire la correction au journal de `survie`** : écarté, la portée déclarée est une note transverse de la racine, non le projet, et `DEC-C-050` range une telle entrée ici. |
| **Statut** | Active |

> [!note] Le défaut que ce cas signale
> Un relevé qui recopie une information vivante d'un journal de projet — une plage de numéros, un compte, une date — **périme dès que ce journal s'allonge**. Le cas est signalé, non promu en règle.

### DEC-C-092 — Consigner la filiation d'UnivPlateforme vers `ecoFab` et la propager aux documents qui la contredisaient

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-12 |
| **Décideur** | Porteur du projet, déclaration du 2026-09-12, reproduite à l'identique : *« c'est UnivPlatforme a evoluer vers ecofab aisi que la plus par des projet hors coffre »* |
| **Décision** | Le fait déclaré est consigné et propagé : fait `F14` au [[survie/90-pilotage/Registre des statuts\|registre de survie]], énoncé `AP11` en section 3 quater du [[ecoFab/90-pilotage/Registre des statuts\|registre d'ecoFab]], point 5 quater de la [[Cartographie du portefeuille]]. Les passages qui présentaient UnivPlateforme comme une formulation parallèle laissée non déclarée sont portés à l'état courant dans les quatre notes de `survie` qui la citent. |
| **Motif** | Un document qui énonce ce qui est désormais connu comme faux vaut moins que le silence. Le point 4 du document fondateur de `survie` comptait UnivPlateforme comme la quatrième d'une série de formulations indépendantes, et sa question `Q6` demandait si ce dossier devait entrer au coffre. La déclaration fait de ce dossier l'antécédent d'un projet déjà présent : la série compte quatre formulations écrites mais **trois lignées**, et la question d'entrée au coffre tombe. |
| **Contrôle** | Trois vérifications le 2026-09-12. La documentation d'`ecoFab` ne contient **aucune occurrence** d'UnivPlateforme, ni de la gestion électronique de documents dont le cahier technique traite. La chronologie est cohérente : cahier technique daté du 2026-05-05, document fondateur d'`ecoFab` archivé le 2026-09-06. La correspondance des dossiers de `~/Incubo/` avec les projets du coffre a été relevée dossier par dossier — quinze dossiers pour onze projets, dont dix établis par le nom. |
| **Grade de l'affirmation propagée** | `N2`, et il ne monte pas. La filiation repose sur la seule déclaration du porteur : aucun document ne l'établit de part ni d'autre. Les documents qui la reprennent portent ce grade. |
| **Portée** | Trois projets — `survie`, `ecoFab` et, par l'inventaire, le portefeuille entier — et deux notes transverses de la racine. Aucune décision de projet n'est créée, et le registre `DEC-PF-` n'est pas ouvert : une filiation constatée n'est pas une frontière tranchée. |
| **Ce que la décision ne fait pas** | Elle **ne verse aucun élément** du cahier technique d'UnivPlateforme dans le coffre et ne lui donne aucune autorité : ce cahier ne cite aucune source et arrête une pile technique qu'`ecoFab` n'a pas décidée. Elle **ne modifie pas le verdict** du premier maillon de `survie`, qui repose sur l'absence de bénéficiaire nommable et sur un cimetière dont rien de nommé ne lève la cause de mort principale — ni l'un ni l'autre ne dépend du compte des formulations. Elle **ne tranche pas** le statut des onze dossiers de `~/Incubo/` sans correspondant au coffre, ni le versement de l'antécédent en `99-sources` d'`ecoFab` : ces deux points ouvrent les lignes 8 et 9 du point 6 de la [[Cartographie du portefeuille]]. |
| **Réversibilité** | Élevée — les passages repris sont localisés et datés, et une déclaration contraire du porteur les rouvrirait à l'identique. |
| **Alternatives écartées** | **Ne consigner le fait que dans `survie`** : écarté, le fait concerne d'abord `ecoFab`, dont la documentation ne portait pas son propre antécédent. **Verser le cahier technique d'UnivPlateforme en `99-sources` d'`ecoFab`** : écarté, ce versement est une décision du porteur, que rien n'oblige à prendre pour corriger l'état des documents. **Attendre une trace documentaire de la filiation** : écarté, aucune n'existe de part ni d'autre, et l'attendre laisserait subsister des énoncés connus comme faux. |
| **Statut** | Active |

---

## Décisions transverses recensées

Ces huit décisions ont une portée qui excède un projet et sont inscrites **ailleurs**. Elles ne sont pas déplacées ; le présent tableau les rend trouvables.

| ID | Objet | Portée déclarée | Inscrite dans |
| --- | --- | --- | --- |
| `DEC-C-002` | **Convention de nommage du coffre** — dossiers ASCII à préfixe numérique, notes en français lisible, apostrophe droite uniquement | *« Tout le coffre, tous projets à venir compris »* | [[ecoFab/90-pilotage/Journal des décisions\|Journal d'ecoFab]] |
| `DEC-C-005` | **Règle de contenu de la racine** — index, notes de pilotage transverses, un dossier par projet | *« Racine du coffre »* | [[ecoFab/90-pilotage/Journal des décisions\|Journal d'ecoFab]] |
| `DEC-C-014` | **Aucun statut interne à un document ne vaut décision de projet** — une mention « Accepté » ou « V1.0 » qualifie l'état d'un texte, jamais celui du projet | *« Tout le coffre, tous projets »* | [[infUb/90-pilotage/Journal des décisions\|Journal d'infUb]] |
| `DEC-C-035` | **Déplacement de l'index à la racine** | Racine du coffre | [[ecoFab/90-pilotage/Journal des décisions\|Journal d'ecoFab]] |
| `DEC-C-046` | **Normalisation de la Cartographie du portefeuille** — note transverse | Note transverse de la racine | [[ecoFab/90-pilotage/Journal des décisions\|Journal d'ecoFab]] |
| `DEC-C-049` | **Promotion de trois règles au rang de doctrine de coffre** — voir [[Doctrine du coffre]] | Tous les projets, présents et à venir | [[ecoFab/90-pilotage/Journal des décisions\|Journal d'ecoFab]] |
| `DEC-C-071` | **Les fichiers d'échange d'éditeur sortent du coffre** — un fichier produit par un outil pour son propre usage n'est pas une source, au même titre que le code et les artefacts de compilation traités par `DEC-C-037` | *« Tout le coffre »*, énoncé dans la décision | [[SellComputing/90-pilotage/Journal des décisions\|Journal de SellComputing]] |
| `DEC-C-061` | **`Psycho-pass` est rangé comme projet distinct de `levelup`** — décision de rangement seulement ; la question produit reste ouverte et relève du lot `L8`, conduit conjointement | Deux projets — `Psycho-pass` et `levelup` | [[Psycho-pass/90-pilotage/Journal des décisions\|Journal de Psycho-pass]] |

> [!note] Pourquoi `DEC-C-061` n'est pas une entrée native de ce registre
> Elle a été inscrite au journal de `Psycho-pass` au moment de la mise en conformité de ce projet, où elle prend tout son sens avec les quatre décisions qui l'accompagnent. Un journal étant *append-only*, la déplacer romprait la trace. Elle est donc **recensée** ici, comme les six précédentes.
> Une entrée native serait justifiée le jour où le lot `L8` rendra sur la question **produit** : celle-là engagera deux projets sur le fond, et non seulement leur rangement.

### Un cas mixte, signalé

`DEC-C-034` — passe de normalisation rédactionnelle du dossier `ecoFab` — déclare une portée de projet, mais contient une **convention de lien applicable à tout le coffre** : les quatre noms de notes homonymes dans les huit projets se visent en chemin complet avec alias, la forme courte étant proscrite. La même règle avait été posée localement par `DEC-C-011` pour `infUb`.

Cette convention est donc **opposable de fait et inscrite nulle part comme telle**. Elle est signalée ici ; sa promotion formelle, par une entrée native de ce registre, appartient au porteur.

---

## Ce que ce registre ne contient pas

Les **règles de méthode** — conception et étude — ne sont pas des décisions : elles sont énoncées dans [[Doctrine du coffre]], et leur promotion seule est journalisée ici ou dans un journal de projet.

Les **règles de tenue documentaire** — nommage, statuts, sources, journalisation — sont énoncées dans [[Index du coffre]], et leurs décisions fondatrices sont recensées ci-dessus.

Les **frontières entre projets** relèvent de [[Cartographie du portefeuille]], qui porte le registre distinct `DEC-PF-`.

---

## Modèle d'entrée à recopier

```markdown
### DEC-C-0NN — Titre court à l'impératif

| Champ | Valeur |
| --- | --- |
| **Date** | AAAA-MM-JJ |
| **Décideur** | |
| **Décision** | Ce qui est décidé, en une phrase sans conditionnel. |
| **Motif** | Pourquoi, et sur quelle preuve. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. Si la portée nomme un seul projet, l'entrée n'a pas sa place ici. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Statut** | Active / Annulée par DEC-C-0MM |
```

**Avant d'écrire une entrée ici** : vérifier le dernier numéro attribué **dans l'ensemble du coffre**, journaux de projet compris. La séquence est commune.
