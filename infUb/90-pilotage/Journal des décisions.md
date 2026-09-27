---
projet: "infUb"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_projet: "aucune — le projet est en étude et en analyse"
decisions_coffre: "10 plus DEC-C-044"
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-08
tags:
  - infUb
  - pilotage
  - decisions
  - adr
---

# Journal des décisions

Registre unique et append-only de toutes les décisions du projet `infUb`.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** C'est le mécanisme qui applique la règle *« aucune promotion silencieuse de statut »* : sans ce journal, une possibilité évoquée dans une note finit par être lue comme un choix arrêté.
> Le journal est **append-only** : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]], qui recense aussi les six entrées transverses antérieures restées dans les journaux de projet.
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | Un critère de passage franchi, et lui seul |

> [!note] La série `DEC-C-` est globale au coffre, ce journal ne la contient pas en entier
> Les décisions de coffre sont numérotées d'une seule suite pour tout le coffre. `DEC-C-001` à `DEC-C-005` ont été prises avant l'arrivée d'`infUb` et sont inscrites au [[ecoFab/90-pilotage/Journal des décisions|journal d'ecoFab]]. Ce journal reprend la suite à `DEC-C-006`.
> Cette dispersion est un effet de bord du fait que le coffre n'a pas de journal transverse. Elle est signalée ici plutôt que corrigée : regrouper les décisions de coffre dans une note de racine serait une décision à part entière, qui toucherait `ecoFab`.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-06.** `infUb` est **en étude et en analyse** : le travail en cours consiste à établir vers quoi le projet peut évoluer et quel produit pourrait en sortir. Rien n'est arrêté — ni le périmètre, ni le contenu du premier livrable, ni l'actif visé, ni la gouvernance, ni le modèle économique, ni la forme juridique, ni le porteur.
> La maturité documentaire du projet ne doit pas être lue comme de l'avancement décisionnel : `infUb` porte un modèle tactique et un recueil d'ADR **sans avoir franchi aucun jalon**. Ces documents sont **anticipés**, pas acquis.

> [!important] Un statut écrit dans un document n'est pas une décision de projet
> Le [[Recueil d'ADR du noyau]] marque ses quatorze entrées « Accepté », et le [[Document de référence global]] intitule son point 19.1 « Décisions structurantes prises ». **Ces mentions qualifient l'état d'un texte, pas l'état du projet.** Elles ne sont pas reprises ici comme des `DEC-P-`, et ne doivent pas l'être ailleurs. Voir `DEC-C-014`.

### Index du recueil d'ADR — statuts internes au document, non promus

Les quatorze ADR sont l'exploration technique la plus aboutie du projet. Leur texte complet — contexte, options écartées, conséquences et **critères de réouverture** — est au [[Recueil d'ADR du noyau]] et nulle part ailleurs. L'index ci-dessous sert la navigation ; **la colonne de droite reproduit l'étiquette que le recueil se donne à lui-même**.

| ADR | Objet | Étiquette au recueil |
| --- | --- | --- |
| `ADR-001` | Schéma d'identifiant canonique et code court | Accepté |
| `ADR-002` | Résolveur d'identifiants découplé de l'application | Accepté |
| `ADR-003` | Habilitation comme agrégat distinct de l'organisation | Accepté |
| `ADR-004` | Instantané d'habilitation embarqué plutôt que jointure vivante | Accepté |
| `ADR-005` | État de validité calculé, jamais persisté | Accepté |
| `ADR-006` | Sérialisation canonique JCS et empreinte SHA-256 dès la V1 | Accepté |
| `ADR-007` | Journal de preuve append-only chaîné | Accepté |
| `ADR-008` | Niveaux d'habilitation et plafonnement par la vérification | Accepté |
| `ADR-009` | Versions publiées immuables ; correction = nouvelle version | Accepté |
| `ADR-010` | Pas de 404 : toute ressource retirée renvoie un état | Accepté |
| `ADR-011` | Vidéo référencée, non hébergée | Accepté, **révisable** |
| `ADR-012` | Recherche PostgreSQL avec seuil de sortie chiffré | Accepté, **révisable** |
| `ADR-013` | OIDC comme contrat, Keycloak différé | Accepté, **révisable** |
| `ADR-014` | Publication à statut informatif, conçue pour l'opposabilité | Accepté |

**Statut au niveau du projet : proposé.** Chaque ADR porte des critères de réouverture mesurés — c'est précisément la mention qui reconnaît qu'il a été écrit avant toute mesure de terrain.

### Une contradiction que l'étude a laissée ouverte

Le [[Document de référence global]] énumère au point 19.1 douze « décisions structurantes ». L'[[Étude comparative et solution cible]] en **conteste explicitement trois** au point 6.2, précédents documentés à l'appui, et le document de référence est resté en **V1.0** sans être amendé.

| Point du point 19.1 | Ce que l'étude oppose | Où |
| --- | --- | --- |
| L'actif stratégique est le réseau des organisations et de leurs publications (point 9.1) | Cet actif est **réplicable par décret** ; l'actif défendable serait le registre d'habilitation et l'archive canonique | Correction n°1 |
| Espace citoyen et espace institutionnel sont deux univers symétriques (point 14) | L'ordre de conquête serait **inversé** : servir l'institution d'abord, comme Notify l'a fait pour 7 000 services britanniques | Correction n°2 |
| Commentaires arborescents, feed et vidéo native en P0 (points 15.1 et 11.1) | Ces trois fonctions seraient les plus coûteuses, les moins différenciantes et les plus risquées politiquement | Correction n°3 |

Ces trois points sont des **hypothèses concurrentes**, dans les deux sens : ni la version du document de référence ni celle de l'étude n'est arrêtée. Ils déterminent ce que serait le premier livrable — voir le [[infUb/90-pilotage/Registre des statuts|Registre des statuts]].

> [!note] `infUb` n'a pas de dispositif de jalons
> `ecoFab` conditionne ses décisions de projet à des jalons d'étude. `infUb` n'a pas d'équivalent : l'étude lui propose **quatre horizons `H0` à `H3` assortis de critères de passage chiffrés** (point 8), qui conditionneraient le passage d'un horizon au suivant. Ce dispositif est lui-même une **proposition non arrêtée**, et il ne couvre pas la question de savoir quand une décision peut être prise.
> **Combler ce manque est un chantier de méthode ouvert** : sans critère explicite d'autorisation, `infUb` n'a aucun moyen formel de faire passer quoi que ce soit de « proposé » à « décidé ».

---

## Décisions de coffre — `DEC-C-`

### DEC-C-006 — Mettre `infUb` en conformité avec les conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `infUb` adopte la structure de phases, la note d'entrée, le journal de décisions et la convention de nommage fixées par `DEC-C-002` et `DEC-C-003`. |
| **Motif** | L'[[Index du coffre]] relevait que quatre projets sur cinq avaient été versés sans structure de phases, sans note d'entrée et sans journal, et que leurs fichiers contrevenaient à `DEC-C-002`. `infUb` étant le projet le plus décidé du coffre après `checkme`, l'écart entre sa maturité et son rangement était le plus coûteux. |
| **Réserve levée** | L'index conditionnait la mise en conformité à *« une décision préalable sur les frontières »*. Cette réserve est levée sur un point précis, et sur celui-là seul : **la mise en conformité ne déplace aucun contenu entre projets, ne fusionne rien et ne tranche aucun recouvrement.** Elle range `infUb` à l'intérieur de son propre dossier. |
| **Portée** | Dossier `infUb` uniquement, plus la mise à jour des liens des deux notes de racine que les renommages auraient cassés. |
| **Ce qu'elle n'engage pas** | Les **quatre recouvrements directs `ecoFab ∩ infUb`** relevés à la [[Cartographie du portefeuille]] — enseignement supérieur comme secteur pilote, calendriers universitaires, triplet habilitation/publication/preuve, autorité déléguée — restent **entiers et non tranchés**. |
| **Réversibilité** | Moyenne. Les renommages sont faits et les liens de la racine réécrits ; revenir en arrière suppose de refaire les deux. |
| **Statut** | Active |

### DEC-C-007 — Ouvrir six dossiers de phase, laisser `20`, `30` et `60` non créés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Créer `00-intention`, `10-etudes`, `40-ddd-tactique`, `50-architecture`, `90-pilotage` et `99-sources`. **Ne pas créer** `20-cadrage-strategique`, `30-ddd-strategique` ni `60-implementation`. |
| **Motif** | Application de `DEC-C-003` : une phase n'existe sur le disque que si elle est réellement ouverte. `40` et `50` le sont, chacune par un document livré — le [[DDD tactique du noyau]] et les quatorze ADR. |
| **Pourquoi `20` et `30` restent fermées** | Elles ont été **traversées à l'intérieur d'autres documents, sans produire de document propre** : le cadrage stratégique est aux points 8 et 9 du [[Document de référence global]] et aux points 6 et 7 de l'[[Étude comparative et solution cible]] ; la carte des contextes bornés est au point 10 du document de référence et au point 2 du DDD tactique. Créer un dossier vide afficherait un livrable qui n'existe pas. |
| **Pourquoi `60` reste fermée** | Aucune ligne de code n'existe. Le point 9 du DDD tactique décrit un **découpage modulaire cible**, ce qui est de l'architecture, pas de l'implémentation. |
| **Conséquence** | `infUb` présente un profil de phases **discontinu** — `00`, `10`, `40`, `50` — assumé et décrit à la [[infUb/90-pilotage/Carte des phases\|Carte des phases]]. |
| **Réversibilité** | Totale — créer un dossier est trivial ; c'est précisément pourquoi la création doit être journalisée. |
| **Statut** | Active |

### DEC-C-008 — Renommer les quatre documents, la version en propriété et non dans le nom

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Les quatre documents prennent un nom en français lisible, **sans numéro de version**, et rejoignent leur dossier de phase. |
| **Renommages** | `ETUDE_COMPARATIVE_ET_SOLUTION_CIBLE_V1.0.md` → `10-etudes/Étude comparative et solution cible.md`<br>`DDD_TACTIQUE_NOYAU_V0.1.md` → `40-ddd-tactique/DDD tactique du noyau.md`<br>`ADR_NOYAU_001_A_014_V0.1.md` → `50-architecture/Recueil d'ADR du noyau.md`<br>`DOCUMENT_DE_REFERENCE_GLOBAL_..._V1.0.docx` → `00-intention/Document de référence global.md` *(conversion, `DEC-C-009`)* |
| **Motif du nom** | `DEC-C-002` : les `MAJUSCULES_SOULIGNÉES` rendent les wikilinks illisibles sans alias. |
| **Motif du retrait de la version** | Trois raisons. **(1)** La version figure déjà dans l'en-tête de propriétés et dans le corps du document. **(2)** Un passage en V1.1 casserait tous les wikilinks pointant vers le fichier. **(3)** Le recueil nommé `001_A_014` devrait être renommé au quinzième ADR. Précédent : `ecoFab` ne porte de version dans aucun nom de fichier. |
| **Intégrité** | Les trois documents Markdown ont été **déplacés, pas réécrits** : corps identique octet pour octet, contrôlé par SHA-256 après ajout de l'en-tête. Voir [[infUb/99-sources/Sources originales\|Sources originales]]. |
| **Conséquence** | Les liens de [[Cartographie du portefeuille]] et de [[Analyse du point d'entrée]] ont été réécrits vers les nouvelles cibles ; **les alias d'affichage sont conservés à l'identique**, le texte visible de ces deux notes est inchangé. |
| **Réversibilité** | Faible — un renommage massif casse les liens non gérés. |
| **Statut** | Active |

### DEC-C-009 — Convertir le document de référence global en Markdown

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Le `.docx` de référence est converti en Markdown natif. L'original est archivé **intact** en `99-sources` avec son empreinte SHA-256. |
| **Motif** | Identique à `DEC-C-004` pour `ecoFab` : un `.docx` dans un coffre Obsidian n'est ni éditable, ni recherchable, ni liable. Il est invisible au graphe et à la recherche plein texte — ce qui excluait de fait le document amont d'`infUb`, et explique que la [[Cartographie du portefeuille]] ait dû relever, parmi ce qu'il lui restait à instruire, que ce document *« n'a pas été lu »*. |
| **Contrôle appliqué** | Comparaison caractère à caractère, espaces, séparateurs de tableau et marqueurs de structure normalisés des deux côtés : **22 607 caractères de part et d'autre, aucune divergence**. |
| **Ce qui a été traduit** | `Heading1` / `Heading2` (47) → `#` / `##` · `ListBullet` (106) → `-` · `ListNumber` (22) → `1.` · 19 tableaux → tableaux Markdown · runs en **Courier New** (9 schémas ASCII) → blocs de code · `<w:br/>` → retours à la ligne · gras et italique → `**` et `*`. |
| **Ce qui a été ajouté** | L'en-tête de propriétés YAML et l'encadré de provenance, au-dessus du corps. Rien d'autre. Aucun mot, aucune ponctuation, aucun tableau ni schéma n'a été ajouté, retiré ni reformulé. |
| **Réversibilité** | Totale — l'original archivé fait foi en cas de doute. |
| **Statut** | Active |

### DEC-C-010 — Verser les deux fichiers `.html` en sources sans les supprimer

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Contexte** | `Étude cible infUb.html` et `Noyau tactique infUb.html` (14 571 octets chacun, empreintes distinctes) sont des **coquilles de chargement d'artifacts `claude.ai`**. Leur contenu est chargé par script depuis le service : hors ligne, ils ne contiennent **aucun texte du projet**. Vérifié par recherche des termes du domaine dans les deux fichiers — zéro occurrence. |
| **Décision** | Les archiver en `99-sources` avec leur empreinte, **signalés comme inertes**. Ne pas les supprimer. |
| **Motif** | Supprimer un fichier versé par le porteur n'est pas un arbitrage de rangement. L'archivage préserve la trace sans laisser croire à un document. |
| **Exception assumée** | La règle 4 de `99-sources` veut que le dossier ne contienne *« que des originaux dont une version de travail existe ailleurs »*. Ces deux fichiers n'en ont pas. L'exception est inscrite ici et rappelée dans [[infUb/99-sources/Sources originales\|Sources originales]] plutôt que passée sous silence. |
| **Décision attendue du porteur** | Les supprimer, ou les remplacer par l'export réel du contenu des deux artifacts — auquel cas ils deviendraient de vraies sources. |
| **Statut** | **Annulée par `DEC-C-013`** — l'arbitrage a été rendu le jour même : suppression. Conservée ici, comme toute décision annulée. |

### DEC-C-011 — Écrire en chemin complet les liens rendus ambigus par les homonymes

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Contexte** | La convention d'ouverture d'un projet impose à chaque projet un `90-pilotage/Journal des décisions.md` et un `90-pilotage/Carte des phases.md`. Dès le deuxième projet conforme, ces noms deviennent des **homonymes**. `infUb` en crée quatre : `Journal des décisions`, `Carte des phases`, `Registre des statuts`, `Sources originales`. |
| **Problème** | Obsidian résout un lien court par proximité de chemin. Depuis une note de la **racine** du coffre, `ecoFab/90-pilotage/` et `infUb/90-pilotage/` sont à égale distance : la cible atteinte n'est pas garantie. |
| **Décision** | **(a)** Les liens des deux notes de racine qui visaient les notes d'`ecoFab` sont réécrits en chemin complet avec alias — le texte affiché est inchangé. **(b)** À l'intérieur de `infUb/`, tout lien vers l'une de ces quatre notes est écrit en chemin complet avec alias. |
| **Non traité, et pourquoi** | Les liens courts internes à `ecoFab/` sont laissés tels quels : ils visent des notes du même projet, qu'Obsidian privilégie par proximité. **À vérifier dans Obsidian** ; si la résolution part vers `infUb/`, le même traitement s'applique — mais c'est une intervention sur `ecoFab`, hors du périmètre de `DEC-C-006`. |
| **Portée** | Ne modifie **aucun texte affiché** : seules les cibles de liens changent. |
| **Réversibilité** | Totale. |
| **Statut** | Active |

---

### DEC-C-012 — Consigner hors d'`infUb` ce que la mise en conformité rend faux

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Contexte** | Trois notes extérieures à `infUb/` portaient soit des liens que les renommages auraient cassés, soit des énoncés d'état que la mise en conformité rendait faux. |
| **Décision** | Les mettre à jour, **en barrant et datant plutôt qu'en effaçant**, et sans réécrire aucune analyse. |
| **[[Index du coffre]]** | `infUb` devient un lien vers sa note d'entrée · l'encadré « Seul `ecoFab` suit les conventions » est reformulé pour dire l'état réel · le lien `DEC-C-002` est écrit en chemin complet vers le journal d'`ecoFab`. |
| **[[Cartographie du portefeuille]]** | Les quatre liens documentaires d'`infUb` sont réécrits vers leurs nouvelles cibles, **alias d'affichage conservés à l'identique** · le `.docx` devient un lien vers la note convertie · deux liens vers le journal d'`ecoFab` sont écrits en chemin complet · les points 1, 4 et 5 du point 6 « Ce qu'il reste à instruire » sont marqués de leur avancement. |
| **[[Analyse du point d'entrée]]** *(ecoFab)* | Trois liens vers les documents d'`infUb` réécrits ; **le texte affiché est inchangé**. Aucune autre modification d'une note d'`ecoFab`. |
| **Ce qui n'a pas été fait** | Aucune analyse, aucun raisonnement, aucune cotation d'une note extérieure n'a été réécrit. Le point 2 du point 6 de la cartographie — la question du porteur d'`infUb` — reste ouvert et intact. |
| **Contrôle** | La lecture du document de référence a permis de répondre au point 1 du point 6. L'affirmation portée en retour a été **vérifiée par recherche dans le document converti** avant d'être écrite : une seule occurrence du monde étudiant, les « calendriers universitaires » du point 2.1. |
| **Réversibilité** | Totale — les énoncés remplacés sont conservés barrés dans le texte. |
| **Statut** | Active |

---

### DEC-C-013 — Supprimer les deux fichiers `.html` inertes

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | `Étude cible infUb.html` et `Noyau tactique infUb.html` sont **supprimés du coffre**. Leur nom, leur taille et leur empreinte SHA-256 sont conservés au point 3 de [[infUb/99-sources/Sources originales\|Sources originales]]. |
| **Motif** | Ils ne portaient aucune information du projet : coquilles de chargement d'artifacts `claude.ai`, vides hors connexion, zéro occurrence des termes du domaine. `DEC-C-010` les avait archivés en attendant cet arbitrage ; l'arbitrage est rendu. |
| **Ce qui n'est pas perdu** | Le contenu que ces artifacts affichaient en ligne est celui de l'[[Étude comparative et solution cible]] et du [[DDD tactique du noyau]], présents dans le coffre en Markdown. |
| **Portée** | Ces deux fichiers. `DEC-C-010` est marquée annulée et conservée. |
| **Réversibilité** | Nulle sur les fichiers eux-mêmes — ils n'étaient pas sous contrôle de version. **Totale sur ce qui comptait** : l'empreinte permet d'identifier formellement les fichiers si l'un d'eux réapparaît. |
| **Statut** | Active |

### DEC-C-014 — Aucun statut interne à un document ne vaut décision de projet

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Contexte** | La mise en conformité avait d'abord présenté les quatorze ADR d'`infUb` comme des décisions techniques prises, au motif que le recueil les marque « Accepté ». C'était une **promotion silencieuse de statut** — exactement ce que la règle 2 du coffre interdit. |
| **Décision** | Une mention portée à l'intérieur d'un document — « Accepté », « Décisions structurantes prises », « V1.0 » — qualifie **l'état de ce texte**, jamais l'état du projet. Seul le porteur arrête une décision de projet, et elle n'existe qu'inscrite au registre `DEC-P-`. |
| **Application immédiate** | `infUb` n'a **aucune** décision de projet. Les quatorze ADR, la solution cible en quatre blocs, la trajectoire en quatre horizons et les douze points du point 19.1 sont classés **proposés** ou **contestés**, jamais arrêtés. Repris en conséquence : la [[infUb\|note d'entrée]], la [[infUb/90-pilotage/Carte des phases\|Carte des phases]], le [[infUb/90-pilotage/Registre des statuts\|Registre des statuts]], et la ligne « Décisions arrêtées » d'`infUb` dans les deux notes de racine — barrée et datée, jamais effacée. |
| **Ce que la règle ne dit pas** | Que ces documents vaudraient moins. Le corpus d'`infUb` reste le plus abouti du coffre après `checkme` ; il est **exploratoire**, ce qui est son statut normal en phase d'étude. |
| **Portée** | Tout le coffre, tous projets. Ne touche pas le registre `DEC-C-` : ranger, nommer et convertir des fichiers relève de la méthode documentaire, que le porteur arrête à tout moment. |
| **Réversibilité** | Sans objet — c'est une règle de lecture, pas un choix technique. |
| **Statut** | Active |

---

### DEC-C-015 — Retirer le signe paragraphe de tous les documents d'`infUb`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Le signe paragraphe est un caractère indésirable dans le coffre. Il est retiré de **tous** les documents d'`infUb` et remplacé par le mot `point`. |
| **Motif** | Décision du porteur. La substitution par un mot plutôt qu'une suppression sèche a été retenue parce que les 191 occurrences étaient toutes des renvois de section : les retirer sans rien mettre à la place aurait laissé des nombres nus — « le 19.2 laisse ouverte la question » — et `point`, masculin comme `paragraphe`, préserve tous les accords : au, du, le, ce. |
| **Portée** | `infUb` seul, 8 fichiers, **191 occurrences**. Le reste du coffre en compte environ 380 de plus et n'est **pas** traité : ce serait une règle de coffre opposable à tous les projets, qui n'a pas été prise. |
| **Traitement des renvois multiples** | Neuf séries consécutives ont été compactées pour éviter la répétition du mot : « 7.3, 7.4, 7.7 » précédés chacun du signe deviennent « points 7.3, 7.4 et 7.7 ». |
| **Ce qui n'a pas été touché** | Aucun mot, aucun chiffre, aucun tableau, aucun schéma, aucune structure de titre. Le `.docx` archivé n'a pas été modifié — il n'a jamais contenu ce caractère, et la règle 1 de `99-sources` l'interdirait. |
| **Conséquence sur l'intégrité** | **C'est la première altération du contenu des trois documents de fond.** Leur corps n'est plus identique à ce qui a été reçu, et l'engagement pris à `DEC-C-008` cesse de valoir pour eux. |
| **Contrepartie** | Les trois originaux ont été **archivés avant modification** dans `99-sources`, sous leur nom et leurs octets d'origine, chacun vérifié contre son empreinte de réception. L'archive est au format `.zip` pour ne pas peupler le graphe de doublons — c'était l'objection qui avait fait renoncer au doublon à `DEC-C-008`, et elle ne tient plus dès lors que la version de travail diverge. La règle 6 du coffre est ainsi respectée. |
| **Réempreinte** | Anciennes et nouvelles empreintes des trois corps consignées au point 2 de [[infUb/99-sources/Sources originales\|Sources originales]]. |
| **Réversibilité** | Totale — l'archive permet de reconstituer l'état antérieur à l'octet près. La substitution inverse, elle, ne serait **pas** fiable : le mot `point` figure aussi dans le texte pour d'autres raisons. |
| **Statut** | Active |

---

### DEC-C-044 — Passe de normalisation rédactionnelle

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les notes de `infUb` sont mises au **registre impersonnel et documentaire** fixé par `DEC-C-034` : aucune première personne, aucune adresse au lecteur, aucun commentaire méta sur l'acte d'écriture, aucune appréciation portée sur l'auteur d'un autre document, aucun texte biffé narrant l'historique des reprises, aucun pictogramme porteur d'information. |
| **Motif** | Le coffre est destiné à être lu par des professionnels et de possibles collaborateurs extérieurs à la conversation qui l'a produit. Toute trace de dialogue y devient une ambiguïté, et une information portée par un pictogramme dépend du rendu du terminal ou de l'imprimante. |
| **Détail des corrections** | Six notes traitées. Dix-neuf pictogrammes de statut retirés. La matrice de benchmark du point 4.4 de l'[[Étude comparative et solution cible]] notait en cercles pleins et vides, avec une légende placée **après** le tableau : la notation passe à une échelle chiffrée de 0 à 3, plus lisible et lisible à voix haute. Une appréciation — *« juste et rare »* — remplacée par le constat vérifiable qui la fondait. |
| **Portée** | Forme et lisibilité. **Aucune affirmation de fond, aucun chiffre, aucun statut, aucune décision n'est modifié.** Les documents archivés en `99-sources` ne sont pas concernés : une source ne s'édite pas. |
| **Réversibilité** | Faible sans copie de référence ; la présente entrée est la trace de l'amendement. |
| **Statut** | Active |

---

### DEC-C-053 — Passe structurelle : trois collisions d'étiquettes et une notation sans légende

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Trois défauts de structure de l'[[Étude comparative et solution cible]] sont corrigés. Ils avaient échappé à la passe de ton de `DEC-C-044`, qui portait sur le registre de rédaction et non sur la cohérence des étiquettes. |
| **Défaut 1 — collision `F`** | Le préfixe `F` désignait **deux séries incompatibles** dans le même projet : les **six fonctions** d'une infrastructure d'information dans l'étude — Autorité, Canonicité, Découverte, Distribution, Relation, Interopérabilité — et les **dix-huit faits établis** au [[infUb/90-pilotage/Registre des statuts\|Registre des statuts]]. Le chevauchement portait sur `F1` à `F6`. |
| **Correction 1** | Les six fonctions deviennent **`FN1` à `FN6`**, 44 occurrences, toutes contenues dans l'étude. Le préfixe `F` reste aux **faits**, ce qui aligne `infUb` sur la convention déjà employée par `ecoFab`. L'étude ne référence aucun fait `F7` et suivants : le renommage n'a touché aucune autre série. |
| **Défaut 2 — deux séries `R` dans le même fichier** | L'étude portait `R1` à `R8` comme **règles** extraites du benchmark au point 5, et `R1` à `R12` comme **risques** au point 9. Deux séries homonymes dans un seul document, ce qui est plus sévère que la collision inter-documents du défaut 1. |
| **Correction 2** | Les huit règles deviennent **`RG1` à `RG8`**. Le préfixe `R` reste aux **risques**, qui sont la série citée hors de l'étude — par la note d'entrée, la [[infUb/90-pilotage/Carte des phases\|Carte des phases]], le [[infUb/90-pilotage/Registre des statuts\|Registre des statuts]] et le [[Recueil d'ADR du noyau]]. Les deux renvois en prose — *« répond à la règle R1 »*, *« règle R5 »* — sont repris. |
| **Défaut 3 — notation sans légende** | Les résumés par modèle notaient chaque fonction en losanges, de un à trois, **sans aucune légende**, sur **68 occurrences**. La passe du 2026-09-08 avait converti le tableau de synthèse du point 4.4 en échelle chiffrée de 0 à 3 sans toucher ces résumés : le document portait donc **deux notations concurrentes pour la même grandeur**, l'une définie, l'autre non. |
| **Correction 3** | Les losanges passent à l'**échelle chiffrée de 0 à 3** du tableau de synthèse, et une légende est ajoutée avant le premier résumé. Le défaut avait été introduit par une correction partielle : il est signalé comme tel. |
| **Portée** | Étiquettes et notation d'un seul document. **Aucune affirmation, aucun chiffre, aucun statut, aucune décision n'est modifié** : une note de 2 devient un 2, une règle `R3` reste la même règle sous le nom `RG3`. |
| **Ce qui n'a pas été touché** | Le [[Document de référence global]], gelé par `DEC-C-009`. Les séries `AM`, `PR`, `ZN`, `H`, `INV` et `C`, sans collision constatée. |
| **Réversibilité** | Élevée — les renommages sont mécaniques et réversibles ; la conversion de notation ne l'est pas, l'information étant identique mais la forme perdue. |
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

> [!tip] Pour une décision d'architecture, ce modèle ne suffit pas
> `infUb` tient ses décisions techniques au format ADR complet — **contexte, options considérées, décision, conséquences, critères de réouverture**. Une quinzième décision d'architecture s'écrit au [[Recueil d'ADR du noyau]] et s'indexe ici, elle ne s'écrit pas ici.
