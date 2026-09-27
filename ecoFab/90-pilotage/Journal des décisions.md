---
projet: "ecoFab"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: "1 inscrite, annulée le 2026-09-08 — aucune décision de projet active"
decisions_coffre: 12
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-08
tags:
  - ecoFab
  - pilotage
  - decisions
  - adr
---

# Journal des décisions

Registre unique et append-only de toutes les décisions du projet.

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
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-06.** Les 26 éléments du point 22 du [[Document fondateur d'ouverture]] et les 14 lignes de l'Annexe B du [[Programme d'études approfondies]] demeurent tous suspendus. La première entrée `DEC-P-` ne pourra être écrite qu'après une note de jalon.
> Cela inclut, sans s'y limiter : le nom du produit, le périmètre, la relation à CampusFaso, le modèle d'identité, le modèle documentaire, le degré de centralisation, la gouvernance, la forme juridique, le modèle économique, la stack, l'hébergement, le MVP et le Core Domain.

| ID | Date | Décision | Jalon | Statut |
| --- | --- | --- | --- | --- |
| `DEC-P-001` | 2026-09-06 | Utiliser l'INE de CampusFaso pour distinguer les statuts | **Aucun — prise hors jalon** | **Annulée le 2026-09-08** |

### DEC-P-001 — Utiliser l'INE pour distinguer les statuts

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Utiliser l'**identifiant national de l'étudiant**, généré par CampusFaso, pour distinguer sur le hub un étudiant réellement inscrit en université d'un inscrit non étudiant ou d'un élève de lycée. |
| **Motif** | Le hub accueille étudiants, futurs étudiants et lycéens (journées portes ouvertes, renseignement sur les filières). Il faut un moyen de séparer ces statuts. |
| **Jalon** | **Aucun.** L'Annexe B du [[Programme d'études approfondies]] plaçait « modèle d'identité et de vérification » au **jalon 2**, non franchi. Le point 22 du [[Document fondateur d'ouverture]] la listait parmi les 26 décisions suspendues. |
| **Niveau de preuve** | 4 — intuition de conception. Le point 7 du programme n'autorise une décision qu'à partir du niveau 2. |
| **Statut** | **Annulée le 2026-09-08** — voir l'acte d'annulation ci-dessous |

> [!danger] Trois objections documentées, toutes issues du lot L5 du programme
> **1. L'INE ne discrimine pas ce qu'on lui demande de discriminer.** L5 établit : *« L'INE est attribué au moment de la création du compte, **avant l'orientation**. Un bachelier non orienté, ou orienté puis parti dans le privé, possède un INE sans être inscrit là où l'INE le suggère. »* Un lycéen qui a créé son compte CampusFaso pour s'orienter **possède déjà un INE**. L'INE sépare donc « a un compte CampusFaso » de « n'en a pas » — et non « étudiant inscrit » de « élève », qui est l'usage visé.
> **2. La donnée utile n'est pas l'identifiant.** L5 : *« la donnée discriminante n'est pas l'identifiant, c'est **l'inscription confirmée** dans un établissement, une filière et un niveau donnés — précisément la donnée que CampusFaso détient et qu'aucun tiers ne peut lire sans autorisation. »*
> **3. La décision crée une dépendance de niveau 1, la plus forte.** Lire le référentiel national suppose une **convention MESRSI** et une **déclaration CIL** ; le délai est administratif, pas technique. Or la règle de conception de L5 est explicite : *« le projet doit être viable au niveau 3 ou 4 dès le premier jour »*, et *« un modèle dont l'existence dépend d'une convention ministérielle non signée n'est pas un modèle, c'est une attente. »*
>
> **Ce que l'objection ne dit pas** : que l'INE soit inutile. Il peut rester la **cible** (niveau 1), à condition qu'un mode dégradé de niveau 3 ou 4 — justificatif contrôlé, ou cooptation par le délégué — soit viable dès le premier jour et ne dépende d'aucune signature.

#### Annulation de DEC-P-001 — 2026-09-08

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Acte** | `DEC-P-001` est **annulée**. Conformément à la règle *append-only*, elle est conservée intégralement ci-dessus, avec ses trois objections. |
| **Motif** | Deux motifs distincts, et le second suffirait seul. **(1) Sur le fond** : les trois objections du lot L5 ne sont pas levées — l'INE est attribué avant l'orientation, donc un lycéen en possède un ; la donnée discriminante est l'inscription confirmée et non l'identifiant ; et la lire crée une dépendance de niveau 1, la plus forte. **(2) Sur la forme** : la décision a été prise **hors de tout jalon**, sur une preuve de **niveau 4**, alors que le point 7 du programme n'autorise une décision qu'à partir du niveau 2 et que l'Annexe B plaçait le modèle d'identité au jalon 2. Une décision prise sans le pouvoir de la prendre ne se corrige pas, elle se retire. |
| **Effet** | L'état **sans décision de projet** est restauré. La question du modèle d'identité et de vérification retourne au **jalon 2**, où l'Annexe B la plaçait. |
| **Ce que l'annulation ne fait pas** | **Elle ne crée aucune décision de remplacement.** L'INE comme cible de niveau 1, assortie d'un mode dégradé de niveau 3 ou 4 viable dès le premier jour, n'est pas une décision : c'est la **règle de conception que le lot L5 porte déjà** dans le programme. L'annulation la restaure au lieu de la créer. Inscrire une `DEC-P-002` hors jalon répéterait exactement le vice que la présente annulation corrige. |
| **Conséquence sur le programme** | La question de l'interopérabilité CampusFaso **sort du chemin critique**. Combinée à l'exigence EX3 de l'[[Analyse du point d'entrée]] — lecture libre par lien, compte requis seulement pour la notification — aucune vérification d'appartenance n'est nécessaire au premier jour. En régime solo, L5 se réduit à une demande écrite d'information, dont le délai de réponse est lui-même une donnée. Voir le point 3.1 du [[Programme d'études approfondies]], lot L5. |
| **Réversibilité** | Élevée. Rien n'a été construit sur cette décision. Une décision d'identité pourra être prise au jalon 2, sur preuve de niveau 1 ou 2. |
| **Statut de l'entrée** | Acte d'annulation — **définitif**. `DEC-P-001` reste consultable et marquée annulée. |

> [!important] Après cette annulation, `ecoFab` ne porte plus aucune décision de projet
> Les 26 éléments du point 22 du [[Document fondateur d'ouverture]] et les 17 lignes de l'Annexe B du [[Programme d'études approfondies]] sont **tous** suspendus, sans exception. La première `DEC-P-` légitime ne pourra être écrite qu'après une note de jalon datée.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-001 — Nom de code du projet : `ecoFab`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier et le nom de code interne du projet sont `ecoFab`. |
| **Motif** | Un identifiant stable est nécessaire pour nommer le dossier, les tags et les liens, avant que le produit n'ait de nom. |
| **Portée** | Nom de **code** uniquement. **Ne préjuge en rien** du nom du produit, de la plateforme ou de la marque, qui reste explicitement non décidé (point 22 du fondateur). |
| **Réversibilité** | Élevée en début de projet, décroissante à mesure que les wikilinks et tags s'accumulent. |
| **Réserve** | Graphie à confirmer : les échanges initiaux portent aussi *ecoFAb* et *ecofabe*. |
| **Statut** | Active |

### DEC-C-002 — Convention de nommage du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Dossiers en ASCII minuscules préfixés d'un nombre à deux chiffres (`00-intention`, `10-etudes`, `90-pilotage`). Notes en français lisible, accents autorisés, apostrophe droite `'` uniquement. |
| **Motif** | Le préfixe numérique garantit l'ordre d'affichage dans l'explorateur, indépendamment de l'alphabet. Les titres lisibles rendent les wikilinks intelligibles sans alias. L'apostrophe droite écarte toute confusion avec l'apostrophe typographique `’` dans les cibles de liens. |
| **Portée** | Tout le coffre, tous projets à venir compris. |
| **Réversibilité** | Faible une fois les wikilinks posés — un renommage massif casse les liens non gérés par Obsidian. |
| **Statut** | Active |

### DEC-C-003 — Arborescence par phases, phases futures non créées

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Seules les phases actives existent sur le disque : `00-intention`, `10-etudes`, `90-pilotage`, `99-sources`. Le chemin complet jusqu'à l'implémentation est **décrit** dans [[ecoFab/90-pilotage/Carte des phases\|Carte des phases]] sans être créé. |
| **Motif** | Créer `60-implementation` avant le jalon 4 afficherait la construction comme acquise alors que l'issue **D — ne pas construire** reste ouverte. Application directe de la règle *« aucune promotion silencieuse de statut »*. |
| **Portée** | Projet `ecoFab`. Modèle reconductible aux projets suivants. |
| **Réversibilité** | Totale — créer un dossier est trivial ; c'est précisément pourquoi la création doit être journalisée. |
| **Statut** | Active |

### DEC-C-004 — Conversion du document fondateur en Markdown

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Le document fondateur `.docx` est converti en Markdown natif. L'original est archivé **intact** dans `99-sources`, avec son empreinte SHA-256 (voir [[ecoFab/99-sources/Sources originales\|Sources originales]]). |
| **Motif** | Un `.docx` dans un coffre Obsidian n'est ni éditable, ni recherchable, ni liable : il est invisible au graphe et à la recherche plein texte, ce qui exclurait de fait le document le plus important du projet. |
| **Contrôle appliqué** | Comparaison caractère à caractère, ponctuation et casse normalisées : **29 725 caractères, aucune divergence**. Le corps du document est strictement inchangé ; seuls l'en-tête de propriétés et l'encadré de provenance ont été ajoutés au-dessus. |
| **Portée** | Fichier `document_fondateur_ouverture_ecosysteme_estudiantin_burkina_v0_1.docx`. |
| **Réversibilité** | Totale — l'original archivé fait foi en cas de doute. |
| **Statut** | Active |

### DEC-C-005 — Élargir la règle de contenu de la racine aux notes transverses

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | La racine du coffre contient l'index, **les notes de pilotage transverses**, et un dossier par projet. `DEC-C-003` disait « un index et des dossiers de projet » ; la règle est élargie, pas remplacée. |
| **Motif** | La découverte de trois projets se recouvrant a rendu nécessaire une note de portefeuille qui n'appartient à aucun d'eux. La loger dans `ecoFab/` l'aurait faussement rattachée à un seul projet ; créer un dossier `00-portefeuille/` aurait fait passer pour un projet ce qui n'en est pas un. |
| **Portée** | Racine du coffre. Une note transverse doit porter sur le coffre entier ou sur plusieurs projets ; elle n'est pas un fourre-tout. |
| **Réversibilité** | Élevée — une note transverse peut être rattachée à un projet si son objet se réduit à celui-ci. |
| **Statut** | Active |

### DEC-C-034 — Passe de normalisation rédactionnelle du dossier `ecoFab`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les notes du dossier `ecoFab` sont réécrites dans un registre **impersonnel et documentaire** : suppression de la première personne, des adresses au lecteur, du commentaire méta sur l'acte d'écriture, des appréciations portées sur l'auteur d'un autre document, et du texte biffé narrant l'historique des reprises. Les pictogrammes de statut sont remplacés par leur équivalent en toutes lettres. |
| **Motif** | Le dossier est destiné à être lu par des professionnels et de possibles collaborateurs extérieurs à la conversation qui l'a produit. Toute trace de dialogue y devient une ambiguïté : le lecteur cherche l'interlocuteur, le contexte manquant, le sous-entendu. Un pictogramme, de surcroît, dépend du rendu du terminal ou de l'imprimante. |
| **Portée** | Toutes les notes de `ecoFab/`, **sauf** [[Document fondateur d'ouverture]] — voir `DEC-C-036`. `Index du coffre` est traité au même titre, ayant résidé dans `ecoFab/99-sources` jusqu'à `DEC-C-035`. Aucune affirmation de fond, aucun chiffre, aucun statut n'est modifié. |
| **Corrections de fond incluses** | Références de section amputées de leur `point ` rétablies ; section `3.0` du programme, qui précédait la section `3`, remise en ordre sans changer son numéro d'appel ; collision des étiquettes `V1`–`V4` levée par le préfixe `HV` sur les hypothèses de valeur du [[ecoFab/90-pilotage/Registre des statuts\|Registre des statuts]] ; inversion des deux échelles de preuve signalée au point 7 du programme. |
| **Convention de lien ajoutée** | Quatre noms de notes étant identiques dans les cinq projets — `Journal des décisions`, `Carte des phases`, `Registre des statuts`, `Sources originales` — tout wikilink qui les vise **s'écrit désormais en chemin complet avec alias**. La forme courte est proscrite : Obsidian la résout par proximité de dossier, comportement implicite qui se rompt au premier déplacement de note. Convention inscrite dans [[Index du coffre]], applicable à tout le coffre. |
| **Réversibilité** | Faible sans copie de référence : le [[ecoFab/99-sources/Sources originales\|corps du programme d'études n'est pas archivé]]. La présente entrée est donc la seule trace de l'amendement. |
| **Alternatives écartées** | Réécrire aussi les documents des quatre autres projets : écarté pour cette passe, les mêmes défauts y étant présents mais non encore inventoriés. |
| **Statut** | Active |

### DEC-C-035 — Déplacement de `Index du coffre` à la racine

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | La note [[Index du coffre]] est déplacée de `ecoFab/99-sources/` vers la **racine du coffre**. |
| **Motif** | Son emplacement contredisait trois règles écrites : `DEC-C-003` et `DEC-C-005`, qui placent l'index à la racine ; la règle 4 de `99-sources`, qui réserve ce dossier aux originaux dont une version de travail existe ailleurs ; et sa propre première phrase, qui décrit la racine comme contenant cet index. Un index de coffre rangé dans les sources d'un seul projet le rattache faussement à ce projet. |
| **Portée** | Emplacement du fichier uniquement. Aucun contenu n'est déplacé entre projets, aucune frontière n'est tranchée. |
| **Effet sur les liens** | Nul. Le nom `Index du coffre` est unique dans le coffre ; les cinq liens entrants venus des autres projets continuent de résoudre. |
| **Réversibilité** | Totale. |
| **Statut** | Active |

### DEC-C-036 — Le document fondateur n'est pas corrigé, ses écarts sont consignés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Le [[Document fondateur d'ouverture]] est **exclu de la passe `DEC-C-034`** et conservé strictement en l'état. Ses trois écarts connus sont consignés sans être corrigés. |
| **Écarts consignés** | Une faute d'accent — « Verifier » au point 20.1 ; 108 apostrophes typographiques `’`, contraires à `DEC-C-002` ; un « nous » au point 1, contraire au registre impersonnel appliqué au reste du dossier. |
| **Motif** | `DEC-C-004` garantit que le corps du document est identique à son `.docx` d'origine, contrôle à l'appui — 29 725 caractères, aucune divergence. Corriger fût-ce une apostrophe romprait cette garantie, qui vaut davantage que les trois écarts qu'elle protège. La règle 1 de `99-sources` pose par ailleurs qu'une source ne s'édite pas. |
| **Portée** | **Corps** du document, version V0.1. L'encadré de provenance et l'en-tête de propriétés, ajoutés à la mise en coffre et déclarés comme ne faisant pas partie du document, restent modifiables : leurs deux wikilinks ont été réécrits en chemin complet le 2026-09-08 au titre de `DEC-C-034`, sans toucher aux 29 725 caractères contrôlés. |
| **Voie de correction** | Ouverture d'une **V0.2**, qui devra traiter simultanément ces trois écarts et la désynchronisation de fond relevée au point 1 des écarts documentaires de [[ecoFab]], puis produire un nouveau contrôle d'intégrité. Non engagée. |
| **Réversibilité** | Sans objet — aucune modification n'est faite. |
| **Statut** | Active |

---

### DEC-C-046 — Passe de normalisation de la Cartographie du portefeuille

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | La note transverse [[Cartographie du portefeuille]] est mise au registre impersonnel de `DEC-C-034`, mise à jour pour six projets, et ses défauts de structure sont corrigés. |
| **Corrections de forme** | Treize passages **biffés** narraient l'historique des reprises ; ils sont remplacés par l'énoncé de l'état courant, la traçabilité restant assurée par les références `DEC-C-` déjà présentes. Seize pictogrammes retirés. Les auto-références passent de « cette note » à « la présente note ». |
| **Corrections de structure** | La matrice des recouvrements du point 3 était **coupée en deux par une ligne vide** et ne se rendait pas comme un tableau unique. Les sous-sections du point 1 étaient numérotées 1.0, 1.2, 1.3 puis 1.1 ; elles sont remises en ordre de 1.1 à 1.5, aucune référence externe ne les citant. |
| **Corrections de fond** | Le portefeuille passe de cinq à **six projets** avec l'entrée de `levelup` : nouvelle section point 1.3, troisième famille de lecture, deux lignes ajoutées à la matrice des recouvrements, et un septième point à instruire — **la frontière `levelup` / `synapse` sur la preuve de compétence**, qui est le recouvrement le plus lourd du portefeuille et n'est écrit nulle part. |
| **Portée** | Note transverse de la racine. Aucune relation entre projets n'est tranchée. |
| **Réversibilité** | Faible sans copie de référence ; la présente entrée est la trace de l'amendement. |
| **Statut** | Active |

---

### DEC-C-048 — Programme d'études V0.3 : intégration des huit amendements et régime de conduite

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Le [[Programme d'études approfondies]] passe en **V0.3**. Les huit amendements proposés par [[Analyse du point d'entrée]] (point 9, trois amendements) et [[Épreuve de l'actif et de la valeur]] (point 11, cinq amendements) sont **adoptés et prennent effet**. Le régime de conduite est fixé à **une seule personne**, et la fenêtre visée à la **rentrée d'octobre 2026**. |
| **Motif** | Les huit amendements étaient motivés, gratuits ou peu coûteux, et sans effet depuis leur formulation faute d'inscription au journal. Deux d'entre eux — la création d'un lot « actif » et d'un lot « payeur » — étaient la condition du verdict rendu le 2026-09-07 : *« non instruit, programme à compléter »*, sur le seul critère `P3 = 1`. |
| **Lots créés** | `L10` — l'actif : ce qui s'accumule, se creuse et appartient. `L11` — le payeur : qui porte la ligne de coût. Aucun des dix lots de la v0.2 ne les instruisait, et les deux décisions correspondantes du point 22 seraient donc arrivées au jalon 4 sans preuve. |
| **Lot scindé** | `L7` devient `L7a` — relevé du périmètre CampusFaso — et `L7b` — cimetière et autopsie des échecs. Les deux passent en **vague 0**, alors que la v0.2 les plaçait en vague 2, **après un jalon pouvant déjà prononcer l'arrêt**. |
| **Lot réécrit** | `L3` : la question directrice passe de l'acceptabilité administrative à la chaîne réelle et au gain du délégué ; le mode délégué devient le **mode principal**, la publication administrative directe devenant l'amélioration ultérieure ; l'ordre interne « délégués d'abord » est rendu non négociable. |
| **Séquencement** | Quatre vagues calées sur deux fenêtres saisonnières, avec le jalon 3 scindé en **3a** (desk d'hiver, janvier 2027) et **3b** (seconde fenêtre, août 2027). `L8` est ordonné avant `L10`, et `L10` avant toute conservation de corpus. |
| **Conséquence assumée** | En régime solo, **l'issue A n'est pas atteignable avant le printemps 2028**. Les jalons 1, 2 et 3a le sont dans les cinq mois. Le point 4.1 l'énonce plutôt que de le laisser découvrir. |
| **Renoncements actés** | Trois, énoncés au point 5.2 et à reporter dans chaque note de jalon : la **représentativité nationale**, le **codage par un tiers** — seule contre-mesure externe au biais de confirmation, remplacée par quatre substituts obligatoires — et la conduite de `L9` dans la même saison. |
| **Écart documentaire clos** | La matrice de traçabilité des **14 axes de recherche du point 20.1** du fondateur vers les lots est produite en Annexe A. Aucun axe n'est sans lot ; deux le sont partiellement, et délibérément. |
| **Écart documentaire maintenu** | La désynchronisation entre le fondateur V0.1 et le programme V0.3 subsiste, le fondateur étant gelé par `DEC-C-004` et `DEC-C-036`. Le point 10.1 acte explicitement que **le programme est la source courante** sur les objets que le fondateur n'a pas intégrés. |
| **Portée** | Protocole d'investigation. **Aucune décision de projet n'est prise** : le programme détermine dans quel ordre et sur quelle base probatoire elles pourront l'être. |
| **Réversibilité** | Élevée pour le contenu. Faible pour le calendrier : la fenêtre d'octobre 2026 ne se rouvre qu'en octobre 2027. |
| **Statut** | Active |

---

### DEC-C-049 — Promotion de trois règles au rang de doctrine de coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Trois règles de conception et d'étude sont promues au rang de **doctrine de coffre** et deviennent **opposables à tous les projets**, présents et à venir. Elles sont consignées dans la note transverse [[Doctrine du coffre]]. |
| **Règle D1** | **Une dépendance qu'on ne signe pas soi-même est une cible, jamais une condition d'existence.** Origine : deux arrivées indépendantes — les quatre niveaux de dépendance du lot L5 d'`ecoFab`, et le *« champ d'identifiant national prévu mais non bloquant »* du noyau de `synapse`. Portée réelle : toute dépendance dont la levée appartient à un tiers, non le seul identifiant national. |
| **Règle D2** | **Tout programme d'études porte un lot « actif » et un lot « payeur ».** Origine : une démonstration par l'échec — le programme d'`ecoFab` noté `P3 = 1` et déclaré *« non instruit, programme à compléter »* sur ce seul critère — puis une application préventive dans le programme de `levelup`, qui les porte dès sa V0.1. |
| **Règle D3** | **Les seuils d'invalidation sont pré-enregistrés**, avec trois obligations d'accompagnement : verbatims bruts conservés pour recodage ultérieur, guide d'entretien sans le vocabulaire du projet, comptage des infirmations. Origine : tous les projets du coffre sont conduits par la personne qui souhaite qu'ils existent, le plus souvent seule ; le codage par un tiers n'y est pas disponible. |
| **Motif commun** | Chacune des trois a **déjà coûté quelque chose dans ce coffre** : `D1` une décision produit annulée, `D2` un verdict de programme, `D3` la disparition de la seule contre-mesure externe au biais de confirmation. Une règle dont l'absence a été payée une fois n'a pas à l'être une seconde. |
| **Condition d'entrée appliquée** | Trois conditions cumulatives, énoncées dans la note de doctrine : atteinte au moins deux fois indépendamment ou démontrée par l'échec de son absence ; formulable sans nommer de projet ; opposable donc vérifiable. Les trois règles les satisfont. |
| **Non-rétroactivité** | La doctrine ne rend fautif aucun document antérieur au 2026-09-08. Elle s'applique à toute version produite après sa promotion. Quatre projets n'ont pas encore de programme d'études : `D2` et `D3` leur deviendront opposables au moment où ils en écriront un. |
| **Règle candidate non promue** | La loi de conception du point 2 de [[Cartographie du portefeuille]] — *on ne déplace pas un usage installé en offrant mieux ; on s'installe sur un usage mal servi, auprès de celui dont on allège le travail* — est consignée dans la note de doctrine comme **candidate**, et reste **non opposable**. Sa promotion appartient au porteur. |
| **Portée** | Méthode de conception et d'étude. **Aucune décision de projet n'est prise, aucune frontière entre projets n'est tranchée.** |
| **Réversibilité** | Élevée — le retrait d'une règle se journalise comme sa promotion. |
| **Statut** | Active |

---

### DEC-C-051 — Adoption des amendements du relevé d'intention du 2026-09-09

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les amendements `AM1` à `AM7` du [[Relevé d'intention du porteur]] sont **adoptés et prennent effet**. `AM8` est **reporté au jalon 2**, conformément à la fenêtre que le relevé lui assigne lui-même. |
| **Motif** | Le relevé restitue un apport oral du porteur en dix énoncés `AP1` à `AP10`, tous de niveau de preuve 4. Ses amendements ne promeuvent aucun énoncé : ils **outillent le terrain pour les tester**. Deux d'entre eux — `AM2` et `AM3` — portent une date limite au 1er octobre : ajouter des questions à un guide d'entretien avant le premier entretien se journalise ; les ajouter après en avoir conduit trois contamine la série. |
| **`AM1` — appliqué** | Les dix énoncés sont versés au **point 3 ter** du [[ecoFab/90-pilotage/Registre des statuts\|Registre des statuts]], sous l'intitulé « Précisions du porteur — 2026-09-09 », avec leur statut et **sans promotion**. |
| **`AM2` — appliqué** | Deux questions ajoutées au bloc « origine du document » du guide `L3` v2, numérotées **`4a` et `4b`** et non 5 et 6 : renuméroter aurait décalé les questions 11, 16, 17 et 20, que les définitions opérationnelles **pré-enregistrées** du point 6 citent nommément. La numérotation alphabétique préserve chaque renvoi intact et évite de réécrire un seuil. |
| **`AM3` — appliqué** | Trois questions ajoutées au protocole `L1` point 4.2, qui mesurent des **traces** et non des opinions : nombre de groupes et leur fonction, conservation des documents, suppression faute de place. Les deux dernières servent `L4` et `L6` embarqué. |
| **`AM4` — appliqué** | La ligne « Scolarité / DA » du point 5 de l'[[Analyse du point d'entrée]] est refaite sous l'hypothèse `AP5`. La colonne « ce qu'il y gagne lui-même » ne porte plus « rien d'évident ». **La dépendance reste niveau 2**, ce qui écarte ce producteur du premier jour quelle que soit sa valeur. |
| **`AM5` — appliqué** | Sixième question ajoutée à la lettre `L5` : les modules sont-ils déployés au-delà de l'UJKZ, et les établissements privés entrent-ils dans leur périmètre ? C'est le test le moins coûteux de `AP2`. |
| **`AM6` — appliqué** | Un relevé des canaux et associations étudiants est ouvert au point 5.2 du [[Protocole de la vague 1]], rattaché à `L2` réduit. **Travail sur sources publiques, hors du champ de la déclaration CIL** : c'est le seul travail utile disponible pendant le blocage administratif, et il prépare la voie associative de recrutement. |
| **`AM7` — appliqué** | La **salle d'étude en ligne** (`AP9`) entre comme **huitième candidat** de la matrice du point 4 de l'[[Analyse du point d'entrée]], avec sa notation : trois « non », dont `C1` et `C5`. Elle est **disqualifiée comme point d'entrée** et **suspendue à `L6`**. |
| **`AM8` — reporté** | La règle de conception candidate — *une fonction n'entre au périmètre que si elle corrige un échec structurel de la messagerie* — n'est pas versée. Le relevé lui assigne le **jalon 2**, et une règle de frontière prise avant tout terrain serait une décision de périmètre déguisée. |
| **Ce que la décision ne fait pas** | **Aucun énoncé `AP` n'est promu.** Aucun seuil pré-enregistré n'est modifié. Aucune décision de projet n'est prise, et l'arbitrage central que l'apport ouvre — périmètre étroit contre couche communautaire — **n'est pas tranché** : les lots qui le trancheraient, `L10` et `L11`, ne sont pas conduits avant janvier 2027. |
| **Rangement corrigé** | Le relevé avait été versé à la **racine** du dossier `ecoFab`, alors que sa propriété déclare `phase: 10-etudes` et que la convention réserve la racine à la note d'entrée. Il est déplacé en `10-etudes/`. |
| **Portée** | Instruments de collecte et rangement documentaire. |
| **Réversibilité** | Élevée pour `AM1`, `AM4` à `AM7`. **Faible pour `AM2` et `AM3` après le 1er octobre** : un guide ne se modifie plus une fois la série commencée. |
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
| **Preuves** | Lot, mesure, source. Niveau de preuve (1 à 4) selon le point 7 du programme. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Statut** | Active / Annulée par DEC-?-00M |
```

> [!tip] Rappel sur le niveau de preuve exigé
> Une décision de projet ne peut se fonder que sur une preuve de **niveau 1** (mesure directe ou trace observée) ou de **niveau 2** (déclaratif convergent sur échantillon stratifié, avec réserve explicite). Le niveau 3 oriente une investigation ; le niveau 4 — intuition, analogie, exemple personnel — **produit des hypothèses, jamais des conclusions**.
