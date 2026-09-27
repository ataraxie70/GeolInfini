---
projet: "gounhri"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_projet: "aucune — les trois documents se déclarent tous non décisionnels"
decisions_coffre: "DEC-C-029 à DEC-C-033, DEC-C-043"
cree_le: 2026-09-07
mis_a_jour_le: 2026-09-08
tags:
  - gounhri
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet `gounhri`.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]], qui recense aussi les six entrées transverses antérieures restées dans les journaux de projet.
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | Un critère de passage franchi, et lui seul |

> [!note] La série `DEC-C-` est globale au coffre ; la série `DEC-P-` est propre à chaque projet
> `DEC-C-001` à `DEC-C-005` sont au [[ecoFab/90-pilotage/Journal des décisions|journal d'ecoFab]], `DEC-C-006` à `DEC-C-015` à celui d'[[infUb/90-pilotage/Journal des décisions|infUb]], `DEC-C-016` à `DEC-C-023` à celui de [[checkme/90-pilotage/Journal des décisions|checkme]], `DEC-C-024` à `DEC-C-028` à celui de [[synapse/90-pilotage/Journal des décisions|synapse]]. Ce journal reprend la suite à `DEC-C-029`.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet, et c'est ici une position tenue, pas un retard
> **Néant au 2026-09-07.** Les trois documents de `gounhri` se déclarent chacun **non décisionnel**, et deux d'entre eux consacrent une section entière à énumérer ce qu'ils ne décident pas : le point 45 du [[Document d'ouverture]] liste **vingt-huit sujets** laissés ouverts, le point 24 du [[Dossier stratégique de cadrage]] en liste **vingt et un**, et son point 25 maintient hors décision le « secret » et l'« actif indétrônable ».
> Le [[Dossier d'ingénierie humaine]] va plus loin : son point 10 s'intitule *« Ce que ce document propose de décider maintenant »* et répond **« Rien, sauf la méthode »** — trois décisions de procédure, aucune de produit.
> `gounhri` est donc le projet du coffre dont l'absence de décision est la plus **délibérée**. Elle ne doit pas être lue comme une immaturité.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-029 — Mettre `gounhri` en conformité avec les conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `gounhri` adopte la structure de phases, la note d'entrée, le journal de décisions et la convention de nommage fixées par `DEC-C-002` et `DEC-C-003`. |
| **Motif** | `gounhri` était le **dernier projet du coffre hors conventions**. Ses trois documents vivaient à plat sous des noms de fichiers longs, en minuscules soulignées, avec le numéro de version dans le nom — `document_ouverture_infrastructure_sociale_souveraine_burkina_v0.1.md` — illisibles en wikilink et impossibles à distinguer dans le sélecteur rapide. |
| **Portée** | Le dossier `gounhri` seul, plus la mise à jour des deux notes de racine — `DEC-C-033`. Aucun contenu n'est déplacé entre projets. |
| **Ce qu'elle n'engage pas** | La frontière `ecoFab` / `gounhri`, que la [[Cartographie du portefeuille]] laisse explicitement ouverte. Le point 36 du [[Document d'ouverture]] pose d'ailleurs lui-même la règle de prudence : les relations avec d'autres infrastructures nationales *« doivent être étudiées sans transformer artificiellement tous les projets en un seul système »*. |
| **Conséquence pour le coffre** | **Les cinq projets sont désormais conformes.** L'[[Index du coffre]] n'a plus d'exception à signaler. |
| **Réversibilité** | Faible — un renommage massif casse les liens non gérés. |
| **Statut** | Active |

### DEC-C-030 — Ouvrir cinq dossiers de phase, laisser `30` à `60` non créés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Créer `00-intention`, `10-etudes`, `20-cadrage-strategique`, `90-pilotage` et `99-sources`. **Ne pas créer** `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture` ni `60-implementation`. |
| **Pourquoi `20` est ouverte, contrairement aux autres projets** | `gounhri` est **le seul projet du coffre à posséder un document de cadrage stratégique propre**. Là où `infUb` traverse son cadrage à l'intérieur d'autres documents, où `synapse` le disperse dans son dossier de faisabilité et où `checkme` ne l'a jamais traversé, `gounhri` a produit un [[Dossier stratégique de cadrage]] qui s'intitule ainsi et se donne pour objet de *« transformer le document d'ouverture en cadre stratégique de pré-conception »*. |
| **Pourquoi `30`, `40` et `50` restent fermées** | Aucun domaine, aucun contexte borné, aucun agrégat, aucune architecture arrêtée. Les points 37 à 40 du [[Document d'ouverture]] et les points 10 à 13 du dossier de cadrage explorent des **possibilités** d'architecture — centralisée, fédérée, hybride — sans en retenir aucune, et le point 24 range l'architecture parmi les décisions qui doivent rester ouvertes. |
| **Pourquoi `60` reste fermée** | Aucune ligne de code, et le point 35 du dossier de cadrage place « Construire » à la **onzième position** sur douze dans son ordre recommandé des travaux. |
| **Conséquence** | `gounhri` présente un profil **continu de `00` à `20`** : le seul du coffre à progresser sans discontinuité, et le seul à s'arrêter exactement là où sa méthode lui dit de s'arrêter. |
| **Réversibilité** | Totale. |
| **Statut** | Active |

### DEC-C-031 — Renommer les trois documents, la version passant en propriété

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Les trois documents prennent le nom que leur donne leur propre titre, **sans numéro de version**, conservé dans la propriété `version`. |
| **Renommages** | `document_ouverture_infrastructure_sociale_souveraine_burkina_v0.1.md` → `00-intention/Document d'ouverture.md`<br>`dossier_strategique_infrastructure_sociale_souveraine_burkina_v0.2.md` → `20-cadrage-strategique/Dossier stratégique de cadrage.md`<br>`volet3_ingenierie_humaine_burkina_v0_1.md` → `10-etudes/Dossier d'ingénierie humaine.md` |
| **Motif du retrait de la version** | Identique à `DEC-C-008` : la version figure déjà en tête de chaque document ; un passage en `V0.3` casserait tous les wikilinks. Le corpus est d'ailleurs déjà **incohérent sur ce point** — deux fichiers écrivaient `v0.1` et `v0.2`, le troisième `v0_1`. |
| **Homonymie vérifiée** | Aucun conflit dans le coffre : `ecoFab` porte « Document fondateur d'ouverture », `synapse` un « Dossier de faisabilité ». Les trois nouveaux noms sont uniques. |
| **Ce qui n'a pas été touché** | Les renvois internes. Le [[Dossier d'ingénierie humaine]] cite nommément le *« Document d'ouverture v0.1 »* et le *« Dossier stratégique de cadrage v0.2 »*, et les trois documents se citent par numéro de section. Ces renvois restent lisibles tels quels. |
| **Réversibilité** | Faible. |
| **Statut** | Active |

### DEC-C-032 — Retirer les douze fragments de citation automatique restés dans les corps

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Contexte** | Deux des trois documents portaient des **fragments de citation automatique** non résolus, construits avec des caractères Unicode à usage privé — `U+E200`, `U+E201`, `U+E202` — de la forme `cite⟨turn416866search0⟩`. Ils s'affichaient en clair au milieu du texte dans Obsidian. |
| **Répartition** | **11** dans le [[Dossier stratégique de cadrage]], portant 15 renvois — dont **6 dans l'annexe D**, celle-là même qui liste les sources. **1** dans le [[Document d'ouverture]], seul sur sa ligne, de la forme `filecite⟨turn0file1⟩⟨L269-L296⟩`. **Aucun** dans le [[Dossier d'ingénierie humaine]], qui cite ses sources correctement en annexe C. |
| **Décision** | Les retirer. Rien d'autre n'est modifié. |
| **Motif** | Ils ne portent **aucune information récupérable** : ils pointent vers un jeu de résultats de recherche qui n'existe plus. Les références lisibles, elles, sont intactes — l'annexe D nomme DataReportal, l'ARCEP, la Primature et le ministère de la Transition digitale, et ces lignes restent entières une fois le fragment retiré. |
| **Nature exacte de la modification** | Le fragment est retiré, **avec au plus l'unique espace qui l'introduisait** ; lorsqu'il occupait seul une ligne, la ligne est retirée. Aucun mot, aucun chiffre, aucun tableau, aucune structure de titre n'a été touché. |
| **Contrôle appliqué** | Comparaison ligne à ligne avec l'original archivé : **aucune ligne dépourvue de fragment n'a été modifiée**. Les sauts de ligne Markdown — deux espaces en fin de ligne — sont **préservés**, y compris dans les en-têtes de propriétés des documents. Décompte des lignes : 1 685 → 1 684 pour le document d'ouverture, **1 400 → 1 400** pour le dossier de cadrage, **999 → 999** pour le dossier d'ingénierie humaine. |
| **Poids** | 40 octets retirés du document d'ouverture, 421 du dossier de cadrage. **461 octets sur 191 537**, soit 0,24 %. |
| **Conséquence sur l'intégrité** | **C'est la première altération du contenu de deux documents de `gounhri`.** Leur corps n'est plus identique à ce qui a été reçu. |
| **Contrepartie** | Les **trois originaux ont été archivés avant modification** dans `99-sources`, sous leur nom et leurs octets d'origine, chacun vérifié contre son empreinte de réception avant d'entrer dans l'archive. Le format `.zip` évite de peupler le graphe de doublons. La règle 6 du coffre est ainsi respectée — précédent `DEC-C-015`. |
| **Réversibilité** | Totale — l'archive permet de reconstituer l'état antérieur à l'octet près. |
| **Statut** | Active |

### DEC-C-033 — Consigner hors de `gounhri` ce que la mise en conformité rend faux

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Mettre à jour les deux notes de racine, **en barrant et datant plutôt qu'en effaçant**, et sans réécrire aucune analyse. |
| **[[Index du coffre]]** | `gounhri` devient un lien vers sa note d'entrée · l'encadré signalant les projets non conformes **disparaît de sa fonction d'alerte** : les cinq projets sont conformes, et l'encadré devient un relevé daté des cinq mises en conformité. |
| **[[Cartographie du portefeuille]]** | Les trois liens documentaires de `gounhri` sont réécrits vers leurs nouvelles cibles, **alias d'affichage conservés à l'identique** · le point 5 du point 6 « Ce qu'il reste à instruire » est marqué comme réglé. |
| **Ce qui n'a pas été fait** | Aucune analyse, aucun raisonnement, aucune cotation d'une note extérieure n'a été réécrit. La frontière `ecoFab` / `gounhri`, que le point 7 de la cartographie laisse ouverte, **reste ouverte**. |
| **Réversibilité** | Totale — les énoncés remplacés sont conservés barrés dans le texte. |
| **Statut** | Active |

---

### DEC-C-043 — Passe de normalisation rédactionnelle

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les notes de `gounhri` sont mises au **registre impersonnel et documentaire** fixé par `DEC-C-034` : aucune première personne, aucune adresse au lecteur, aucun commentaire méta sur l'acte d'écriture, aucune appréciation portée sur l'auteur d'un autre document, aucun texte biffé narrant l'historique des reprises, aucun pictogramme porteur d'information. |
| **Motif** | Le coffre est destiné à être lu par des professionnels et de possibles collaborateurs extérieurs à la conversation qui l'a produit. Toute trace de dialogue y devient une ambiguïté, et une information portée par un pictogramme dépend du rendu du terminal ou de l'imprimante. |
| **Détail des corrections** | Quatre notes traitées. Quatorze pictogrammes de statut retirés. Quatre recommandations du [[Dossier d'ingénierie humaine]] étaient formulées à la première personne — *« le premier livrable que je recommanderais de commander »*, *« celle que je recommanderais d'explorer en priorité »* — réécrites en énoncés impersonnels sans changer leur portée. |
| **Portée** | Forme et lisibilité. **Aucune affirmation de fond, aucun chiffre, aucun statut, aucune décision n'est modifié.** Les documents archivés en `99-sources` ne sont pas concernés : une source ne s'édite pas. |
| **Réversibilité** | Faible sans copie de référence ; la présente entrée est la trace de l'amendement. |
| **Statut** | Active |

---

## Modèle d'entrée à recopier

```markdown
### DEC-?-00N — Titre court à l'impératif

| Champ | Valeur |
| --- | --- |
| **Date** | AAAA-MM-JJ |
| **Décideur** | |
| **Décision** | Ce qui est décidé, en une phrase sans conditionnel. |
| **Motif** | Pourquoi, et sur quelle preuve. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Critères de réouverture** | Les faits mesurés qui obligeraient à rouvrir. |
| **Statut** | Active / Annulée par DEC-?-00M |
```
