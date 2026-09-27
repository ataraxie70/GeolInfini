---
projet: "checkme"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_projet: "aucune — la conception est reprise depuis l'intention"
decisions_coffre: "DEC-C-016 à DEC-C-023, DEC-C-042, DEC-C-082 à DEC-C-086"
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet `checkme`.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** C'est le mécanisme qui applique la règle « aucune promotion silencieuse de statut » : sans ce journal, une possibilité évoquée dans une note finit par être lue comme un choix arrêté.
> Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]], qui recense aussi les six entrées transverses antérieures restées dans les journaux de projet.
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | Un critère de passage franchi, et lui seul |

> [!note] La série `DEC-C-` est globale au coffre ; ce journal n'en porte qu'un segment
> `DEC-C-001` à `DEC-C-005` sont au [[ecoFab/90-pilotage/Journal des décisions|journal d'ecoFab]], `DEC-C-006` à `DEC-C-015` au [[infUb/90-pilotage/Journal des décisions|journal d'infUb]]. Ce journal reprend la suite à `DEC-C-016`.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour, et le corpus ne doit pas faire croire le contraire
> **Néant au 2026-09-10.** Les intentions déclarées par le porteur le 2026-09-10 — produit minimal, présentation à une autorité, cession complète — n'en sont pas davantage : elles sont consignées par `DEC-C-083` comme intentions. Le corpus de `checkme` est le plus avancé du coffre : huit documents de conception, quatre documents de correction, un audit, cinq migrations SQL. Il porte des énoncés qui ressemblent à des décisions — « Décisions P0-4 », « SEC-01 », « Statut : terminé », « baseline canonique ».
> **Aucun d'eux n'est une décision de projet.** Conformément à `DEC-C-014`, une mention portée à l'intérieur d'un document qualifie l'état de ce texte, jamais l'état du projet. Et depuis `DEC-C-016`, ces énoncés sont en outre **tous rouverts**.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-016 — Reprendre la conception de `checkme` depuis l'intention

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | **L'intégralité de la documentation existante de `checkme` est remise en cause.** La conception est reprise depuis le début — depuis l'intention — pour être pensée dans l'ordre, avec le calme et la rigueur d'une démarche d'ingénierie de conception. |
| **Motif** | Énoncé par le porteur. Le corpus a été produit par accumulation de documents successifs puis corrigé par interventions ponctuelles ; l'ordre de conception n'a jamais été instruit pour lui-même. Reprendre depuis l'intention coûte moins cher que de continuer à corriger une base dont les fondations n'ont pas été arbitrées. |
| **Portée** | Tout le corpus, sans exception : les huit documents historiques, les quatre documents issus des interventions P0-1 à P0-4, l'audit, l'analyse approfondie et les cinq migrations SQL. Y compris ce que le corpus appelle « baseline canonique » et « terminé ». |
| **Effet immédiat** | Plus aucun document de `checkme` n'est opposable. Chacun porte désormais `remise_en_cause: true` dans ses propriétés et un encadré de réexamen en tête. Aucun document n'est supprimé pour autant : ils restent l'état de travail antérieur, consultable et cité. |
| **Ce que la décision ne dit pas** | Que le travail accompli serait sans valeur. Il reste le matériau le plus abouti du coffre, et la reprise s'appuiera dessus — mais comme sur une matière à réinstruire, non comme sur un acquis. |
| **Ce qu'elle n'engage pas** | Le calendrier de la reprise, sa méthode, et l'ordre dans lequel les phases seront rouvertes. Rien de tout cela n'est arrêté. |
| **Réversibilité** | Totale sur la forme — les encadrés se retirent. Sans objet sur le fond : c'est une décision de posture du porteur. |
| **Statut** | Active |

### DEC-C-017 — Mettre `checkme` en conformité et dissoudre `files/` et `documents_corriges/`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | `checkme` adopte la structure de phases, la note d'entrée, le journal de décisions et la convention de nommage fixées par `DEC-C-002` et `DEC-C-003`. Les dossiers `files/` et `documents_corriges/` sont **dissous**. |
| **Motif** | `checkme` était le dernier projet avancé du coffre à rester hors conventions. Sa gouvernance propre — `files/` figé, `documents_corriges/` faisant foi — rangeait les documents **par ancienneté d'intervention**, jamais par nature de contenu : le DDD stratégique, l'architecture, la sécurité et l'UX se trouvaient dans le même dossier que l'audit qui les critiquait. |
| **Ce qui remplace la gouvernance dissoute** | La distinction que les deux dossiers portaient n'est pas perdue : elle devient la propriété **`statut_documentaire`**, inscrite dans l'en-tête de chaque note — `Historique` pour les huit documents antérieurs à l'audit, `Baseline canonique` pour les quatre issus des interventions P0. L'information suit désormais le document au lieu de dépendre de son emplacement. |
| **Ce que la dissolution rend faux** | Les règles de travail du [[checkme/99-sources/corpus-herite/Historique des interventions\|registre des interventions]] désignent des dossiers qui n'existent plus, et les documents P0-2 et P0-3 citent leurs sources consultées sous la forme `files/Document_N` — P0-4, lui, n'en cite aucune. **Ces textes n'ont pas été réécrits** : la correspondance ci-dessous en tient lieu. |
| **Portée** | Le dossier `checkme` seul, plus les liens des deux notes de racine — `DEC-C-023`. Aucun contenu n'est déplacé entre projets ; aucun recouvrement avec `infUb`, `ecoFab` ou `synapse` n'est tranché. |
| **Réversibilité** | Faible — un renommage massif casse les liens non gérés. |
| **Statut** | Active |

### DEC-C-018 — Ouvrir sept dossiers de phase, laisser `20` et `60` non créés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Créer `00-intention`, `10-etudes`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `90-pilotage` et `99-sources`. **Ne pas créer** `20-cadrage-strategique` ni `60-implementation`. |
| **Pourquoi `20` reste fermée** | Aucun document du corpus ne traite le cadrage stratégique : ni marché initial, ni modèle économique, ni financement, ni gouvernance de la plateforme. L'analyse approfondie range ces quatre sujets parmi ses **zones d'ombre** — « des sujets que personne n'a mentionnés ». `checkme` est donc passé de l'intention au DDD **sans jamais traverser son cadrage**, et cette absence est un fait de structure, pas un défaut de rangement. |
| **Pourquoi `60` reste fermée** | Aucune ligne de code n'existe : ni Go, ni Next.js, ni test, ni CI. |
| **Le cas des cinq migrations SQL** | Elles sont exécutables, ce qui les rapprocherait de `60`. Elles sont rangées en **annexe de `50-architecture/migrations/`**, aux côtés du document qui les produit et qui seul les explique. Motif : elles n'ont **jamais été exécutées**, aucune base ne les a reçues, et ouvrir `60` afficherait une construction commencée alors qu'elle ne l'est pas — d'autant moins depuis `DEC-C-016`. |
| **Conséquence** | `checkme` présente un profil de phases **continu de `00` à `50`, à une exception près : `20`**. Décrit à la [[checkme/90-pilotage/Carte des phases\|Carte des phases]]. |
| **Réversibilité** | Totale — créer un dossier est trivial ; c'est précisément pourquoi la création se journalise. |
| **Statut** | **Partiellement remplacée par `DEC-C-082`** le 2026-09-10 : les dossiers `10-etudes`, `30-ddd-strategique`, `40-ddd-tactique` et `50-architecture` sont retirés. `00-intention`, `90-pilotage` et `99-sources` restent ouverts |

### DEC-C-019 — Supprimer les trois maquettes HTML

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | `checkme_backoffice.html`, `checkme_ecran_citoyen.html` et `checkme_ecran_citoyen_v2.html` sont **supprimés du coffre**. |
| **Motif** | Décision du porteur, prise dans le cadre de `DEC-C-016` : une maquette est une proposition d'interface, et la reprise de la conception depuis l'intention retire toute valeur d'engagement à ces trois écrans. S'y ajoutait un motif de rangement : trois fichiers `.html` ne sont pas lisibles depuis Obsidian et n'apparaissent ni au graphe, ni à la recherche plein texte. |
| **Ce qui est conservé à la place** | Leur empreinte SHA-256, leur taille, leur date, et **le relevé de ce qu'elles couvraient réellement**, au point 3 de [[checkme/99-sources/Sources originales\|Sources originales]]. Ce relevé a été établi par extraction du texte des trois fichiers **avant** leur suppression. |
| **Ce que la suppression détruit** | Le rendu visuel — palettes, typographies, mise en page. Aucun document ne les décrit. C'est une perte réelle, assumée par la décision. |
| **Fait relevé au passage** | Le relevé contredit le corpus sur un point vérifié : l'analyse approfondie affirme qu'« aucune maquette ne couvre l'état ambigu » et en tire son risque `R11`. **C'est faux** — les deux écrans citoyen portaient un onglet `Ambigu` et un panneau « Plusieurs correspondances » complet. Voir le point 4 du [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]]. |
| **Réversibilité** | **Nulle.** Ces fichiers n'étaient pas sous contrôle de version. L'empreinte permettra de les identifier formellement si une copie réapparaît, rien de plus. |
| **Statut** | Active |

### DEC-C-020 — Renommer les quinze documents, version et numéro en propriété

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Chaque document prend un nom en français lisible, **sans numéro de document ni numéro d'intervention**, et rejoint son dossier de phase. La désignation d'origine est conservée dans la propriété `designation_historique`. |
| **Motif du nom** | `DEC-C-002` : les `MAJUSCULES_SOULIGNÉES` rendent les wikilinks illisibles sans alias. |
| **Motif du retrait des numéros** | Le numéro `Document_3` et le numéro `P0-2` disent **quand** un texte a été écrit, jamais **de quoi** il parle. Le corpus le montre lui-même : `Document_7_Base_De_Donnees` et `Document_P0_4_Modele_Donnees_Migrations` traitent le même objet à deux moments. La chronologie reste lisible par `designation_historique` et par le [[checkme/99-sources/corpus-herite/Historique des interventions\|registre des interventions]]. |
| **Intégrité** | Les quinze documents ont été **déplacés, pas réécrits** : chaque corps est identique à l'octet près, contrôlé par SHA-256 après ajout de l'en-tête, contre l'inventaire d'empreintes établi avant toute manipulation. |
| **Ce qui a été ajouté au-dessus du corps** | L'en-tête de propriétés YAML, l'encadré de réexamen de `DEC-C-016`, et pour quatre documents un encadré signalant un écart précis. Rien d'autre : aucun mot, aucun tableau, aucune structure de titre n'a été touché à l'intérieur des corps. |
| **Réversibilité** | Faible. |
| **Statut** | Active |

#### Correspondance complète ancien chemin → nouveau chemin

| Ancien chemin | Nouvelle note |
| --- | --- |
| `documents_corriges/Document_0_Vision_Principes_Fondateurs.md` | [[Vision et principes fondateurs]] — `00-intention/` |
| `files/Audit_Complet_CheckMe.md` | [[Audit complet du projet]] — `10-etudes/` |
| `analyse_approfondie_checkme.md` | [[Analyse approfondie du projet]] — `10-etudes/` |
| `files/Document_1_DDD_Strategique.md` | [[DDD stratégique]] — `30-ddd-strategique/` |
| `files/Document_3_DDD_Tactique.md` | [[DDD tactique]] — `40-ddd-tactique/` |
| `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md` | [[Stratégie de recherche et de correspondance]] — `40-ddd-tactique/` |
| `files/Document_2_Vision_Architecture.md` | [[Vision d'architecture]] — `50-architecture/` |
| `files/Document_4_Architecture_Logicielle.md` | [[Architecture logicielle]] — `50-architecture/` |
| `files/Document_5_API_Contrats.md` | [[Contrats d'API]] — `50-architecture/` |
| `files/Document_6_Securite.md` | [[Sécurité]] — `50-architecture/` |
| `files/Document_7_Base_De_Donnees.md` | [[Base de données]] — `50-architecture/` |
| `files/Document_8_UX_UI.md` | [[Parcours utilisateur et interfaces]] — `50-architecture/` |
| `documents_corriges/Document_P0_3_Fiabilite_Projection_Consultation.md` | [[Fiabilité de la projection Consultation]] — `50-architecture/` |
| `documents_corriges/Document_P0_4_Modele_Donnees_Migrations.md` | [[Modèle de données et migrations]] — `50-architecture/` |
| `documents_corriges/migrations/*.sql` | `50-architecture/migrations/` — cinq fichiers, inchangés |
| `HISTORIQUE_INTERVENTION.md` | [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]] — `90-pilotage/` |

### DEC-C-021 — Supprimer trois fichiers redondants ou étrangers au projet

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Suppression de `files/Vision_et_Principes_Fondateurs.md`, `files/SKILL.md` et `documents_corriges/README.md`. |
| **`Vision_et_Principes_Fondateurs.md`** | Export de conversation brut de 11 926 octets, **sans un seul titre Markdown**. Il contenait le Document 0 en V0.1 — déjà canonisé en V0.2 par l'intervention P0-1 — précédé de 78 lignes de fragments de discussion. Ces fragments portaient les motifs de plusieurs choix techniques ; **vérification faite avant suppression, ces motifs figurent tous, et plus précisément, dans les documents eux-mêmes** : le choix de Go par la visibilité de package au point 1 de [[Architecture logicielle]], Meilisearch au même point, `SEC-01` au point 3.1 de [[Sécurité]], la règle du `200` systématique au point 2.2 de [[Contrats d'API]]. |
| **`SKILL.md`** | 8 381 octets d'une *skill* Claude générique intitulée `frontend-design`, sans aucun rapport avec `checkme` : conseils de direction artistique adressés à un modèle de langage. L'audit l'avait relevée sous `P2-5` — « ne pas confondre outillage et produit ». |
| **`README.md`** | Notice du dossier `documents_corriges/`, dissous par `DEC-C-017`. Ses cinq énoncés survivent intégralement ailleurs : les règles de travail au [[checkme/99-sources/corpus-herite/Historique des interventions\|registre des interventions]], la liste de la baseline à la [[checkme\|note d'entrée]], l'hypothèse technique P0-4 aux points 2.1, 6 et 11 de [[Modèle de données et migrations]], et l'annonce de P0-5 dans les deux. |
| **Trace conservée** | Nom, taille et empreinte SHA-256 des trois fichiers au point 3 de [[checkme/99-sources/Sources originales\|Sources originales]]. |
| **Réversibilité** | **Nulle** sur les fichiers. Totale sur ce qui comptait : aucun des trois ne portait d'information absente d'un autre document. |
| **Statut** | Active |

### DEC-C-022 — Conserver les deux archives `.zip`, l'arbitrage de suppression n'étant pas rendu

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | `documents_corriges.zip` et `checkme_P0-4_documents_corriges.zip` sont **déplacés en `99-sources`** et conservés. Leur suppression a été proposée et **n'a pas été retenue à ce stade**. |
| **Ce qu'elles contiennent, vérifié fichier par fichier** | `checkme_P0-4_documents_corriges.zip` : dix fichiers, **tous d'empreinte identique** à ceux du coffre — redondance totale. `documents_corriges.zip` : quatre fichiers, dont trois identiques et **un unique**, le `README.md` de 406 octets du 2026-08-02, antérieur à celui que l'intervention P0-4 a remplacé. |
| **Ce que cela corrige** | La note d'entrée précédente affirmait que `documents_corriges.zip` était un « doublon strict, entièrement redondant, vérifié par empreinte SHA-256 sur chaque fichier ». **C'était inexact** : le contrôle avait porté sur les trois documents, pas sur la notice. L'énoncé est rectifié ici et le texte intégral de cette notice est reproduit au point 2 de [[checkme/99-sources/Sources originales\|Sources originales]]. |
| **Exception assumée** | La règle 4 de `99-sources` veut que le dossier ne contienne que des originaux dont une version de travail existe ailleurs. Ces archives sont l'inverse : des **copies de sauvegarde** de fichiers vivants. L'exception est inscrite ici plutôt que passée sous silence. |
| **Décision attendue du porteur** | Les supprimer — leur contenu unique est désormais reproduit dans le registre de provenance — ou les conserver comme sauvegarde hors coffre. |
| **Réversibilité** | Totale. |
| **Statut** | Active |

### DEC-C-023 — Consigner hors de `checkme` ce que l'intervention rend faux

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-06 |
| **Décideur** | Porteur du projet |
| **Décision** | Mettre à jour les deux notes de racine, **en barrant et datant plutôt qu'en effaçant**, et sans réécrire aucune analyse. |
| **[[Index du coffre]]** | `checkme` sort de la liste des projets non conformes · l'exception qui lui était faite — « il porte sa propre gouvernance documentaire, elle doit être respectée telle quelle » — est barrée et datée, cette gouvernance ayant été dissoute par `DEC-C-017` · la maturité annoncée est corrigée par `DEC-C-016`. |
| **[[Cartographie du portefeuille]]** | Les **cinq** liens documentaires de `checkme` sont réécrits vers leurs nouvelles cibles, **alias d'affichage conservés à l'identique** · un sixième lien est ajouté vers [[Modèle de données et migrations]], que la note ignorait puisque P0-4 était resté enfermé dans une archive · la ligne « Maturité » et la ligne « Gouvernance documentaire » sont **barrées, datées et complétées** plutôt que réécrites · le point 5 du point 6 « Ce qu'il reste à instruire » enregistre que `checkme` est désormais conforme et que `synapse` reste seul à instruire. |
| **Ce qui n'a pas été fait** | Aucune analyse, aucun raisonnement, aucune cotation d'une note extérieure n'a été réécrit. Les recouvrements `checkme ∩ infUb`, `checkme ∩ ecoFab` et `checkme ∩ synapse` restent **entiers et non tranchés**. |
| **Réversibilité** | Totale — les énoncés remplacés sont conservés barrés dans le texte. |
| **Statut** | Active |

---

## Contrôle des liens après l'intervention

> [!note] 330 wikilinks résolus sur l'ensemble du coffre, **aucun lien mort**
> Contrôle automatique du 2026-09-06, après tous les renommages. Dix-huit liens courts restent ambigus par homonymie : **tous internes à `ecoFab/`**, et tous pointant vers ses propres notes de pilotage, qu'Obsidian privilégie par proximité de chemin. Aucun n'est dans `checkme/` ni dans les deux notes de racine.
> `checkme` ajoute un **troisième** homonyme à quatre noms — `Journal des décisions`, `Carte des phases`, `Registre des statuts`, `Sources originales`. Conformément à `DEC-C-011`, tout lien vers l'une de ces notes écrit depuis `checkme/` ou depuis la racine emploie le **chemin complet avec alias** : le texte affiché est inchangé, la cible est garantie.

---

### DEC-C-042 — Passe de normalisation rédactionnelle

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les notes de `checkme` sont mises au **registre impersonnel et documentaire** fixé par `DEC-C-034` : aucune première personne, aucune adresse au lecteur, aucun commentaire méta sur l'acte d'écriture, aucune appréciation portée sur l'auteur d'un autre document, aucun texte biffé narrant l'historique des reprises, aucun pictogramme porteur d'information. |
| **Motif** | Le coffre est destiné à être lu par des professionnels et de possibles collaborateurs extérieurs à la conversation qui l'a produit. Toute trace de dialogue y devient une ambiguïté, et une information portée par un pictogramme dépend du rendu du terminal ou de l'imprimante. |
| **Détail des corrections** | Sept notes traitées. Le tableau de maturité de l'[[Analyse approfondie du projet]] notait en **étoiles** sans légende : la notation passe à une échelle chiffrée de 0 à 5, dont l'échelle est désormais énoncée. Les quatre titres du point 9 formulaient des appréciations adressées à l'auteur du corpus — *« remarquablement claire »*, *« exemplaire »* — remplacées par l'énoncé de la propriété constatée. Quarante-quatre pictogrammes de statut retirés au profit du mot qu'ils doublaient. |
| **Portée** | Forme et lisibilité. **Aucune affirmation de fond, aucun chiffre, aucun statut, aucune décision n'est modifié.** Les documents archivés en `99-sources` ne sont pas concernés : une source ne s'édite pas. |
| **Réversibilité** | Faible sans copie de référence ; la présente entrée est la trace de l'amendement. |
| **Statut** | Active |

---

### DEC-C-082 — Verser le corpus hérité en `99-sources` et retirer les dossiers de phase qu'il occupait

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-10 |
| **Décideur** | Porteur du projet |
| **Décision** | Les **quinze documents** du corpus hérité — ceux qu'énumère la table de correspondance de `DEC-C-020` — et les **cinq migrations SQL** sont versés en `99-sources/corpus-herite/` comme **matériau de référence non opposable**. Les dossiers `10-etudes`, `30-ddd-strategique`, `40-ddd-tactique` et `50-architecture`, vidés par le versement, sont **retirés**. `00-intention` reste ouvert et reçoit le document fondateur de `DEC-C-083`. |
| **Motif** | Aligner `checkme` sur le modèle fixé pour `levelup` par `DEC-C-038`, puis suivi par `maSecure` et `Psycho-pass` : un corpus hérité est une référence, non une autorité, et sa place est `99-sources`. Deux motifs de fond s'y ajoutent. **Les dossiers peuplés affichaient comme franchies des phases qui ne l'étaient pas**, au point que la [[checkme/90-pilotage/Carte des phases\|Carte des phases]] devait le démentir par un encadré. **La reprise produira des documents portant naturellement les mêmes titres** que les anciens — *DDD stratégique*, *Sécurité* —, et la coexistence de deux notes homonymes aurait rendu ambigus tous les liens courts qui les visent. |
| **Périmètre retenu, et critère** | La question posée au porteur désignait *« le corpus hérité de checkme (15 notes réparties dans 00, 10, 30, 40 et 50) »*. Ces cinq dossiers n'en contenaient que quatorze : la quinzième, [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]], résidait en `90-pilotage`. **Le critère retenu est l'objet de la question — le corpus hérité, soit les quinze documents — et non l'énumération des dossiers, qui était inexacte.** L'historique des interventions est le registre de l'ancienne gouvernance documentaire, dissoute par `DEC-C-017`, et non une note de pilotage du coffre ; ses séries `P0`, `P1` et `P2` corrigent une architecture que la reprise ne tient plus pour acquise. |
| **Méthode** | Déplacement sans réécriture. Empreinte SHA-256 de chaque fichier entier calculée avant et après : **vingt fichiers sur vingt identiques**. Empreinte d'ensemble du corpus versé consignée au point 4 de [[checkme/99-sources/Sources originales\|Sources originales]]. Aucune propriété n'a été modifiée dans les fichiers versés : la propriété `phase` qu'ils portent désigne le **sujet** de chaque document, non son emplacement, conformément au principe de `DEC-C-014`. |
| **Ce que le contrôle préalable a établi** | Avant tout déplacement, l'empreinte du **corps** de chaque note a été recalculée et comparée à celle que consignait le point 1 de [[checkme/99-sources/Sources originales\|Sources originales]] depuis le 2026-09-06. **Six corps sont identiques. Neuf ne le sont plus.** Pour cinq d'entre eux, l'inversion de la substitution du signe paragraphe opérée par `DEC-C-052` **reconstitue exactement** l'empreinte d'origine : l'écart est entièrement expliqué. Pour les quatre autres — [[Analyse approfondie du projet]], [[DDD stratégique]], [[DDD tactique]] et [[Sécurité]] —, l'écart comprend en outre des retouches que `DEC-C-042` déclare sur sept notes sans les nommer. Il n'est pas reconstituable : les originaux de ces quatre documents n'existent plus dans le coffre, seule leur empreinte subsiste. |
| **Ce que cela corrige** | Le registre de provenance affirmait que *« les quinze correspondent »*. L'énoncé était exact le 2026-09-06 ; il ne l'est plus depuis les passes du 2026-09-08 et du 2026-09-09, qui ont traité ces notes comme des notes de travail. Le registre est rectifié au point 4 de [[checkme/99-sources/Sources originales\|Sources originales]] ; aucune empreinte d'origine n'est effacée. |
| **Liens** | Onze liens écrits en chemin complet vers l'historique des interventions sont reciblés, **alias d'affichage conservés à l'identique** : quatre au présent journal, deux au [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]], deux au registre de provenance, un à la [[checkme\|note d'entrée]], deux à la [[Cartographie du portefeuille]]. Les quatorze autres documents sont visés par des liens courts, qu'Obsidian résout par le nom ; aucun de ces noms n'étant porté par une autre note du coffre, ces liens restent valides sans modification. |
| **Contrôle après l'intervention** | Contrôle automatique de l'ensemble du coffre le 2026-09-10 : **1 104 liens résolus, aucun lien mort**. Vingt liens courts sont ambigus ; **tous visent `Protocole de la vague 0`**, note homonyme dans `ecoFab` et dans `payMe`, et aucun n'est dans `checkme/`. Cette ambiguïté est antérieure à la présente intervention et n'en relève pas. |
| **Ce que la décision ne fait pas** | Elle ne modifie le contenu d'aucun document versé. Elle ne tranche pas le sort des deux archives `.zip` — `DEC-C-022` reste en attente d'arbitrage. Elle n'ouvre ni ne ferme `20-cadrage-strategique` ni `60-implementation`, qui n'ont jamais existé. |
| **Réversibilité** | Élevée — le déplacement inverse rétablit l'arborescence ; les liens courts n'en dépendent pas. |
| **Alternatives écartées** | **Laisser le corpus en place**, proposé au porteur et non retenu : chaque document de la reprise aurait dû porter un nom distinct de son homologue hérité, et les dossiers de phase auraient continué d'afficher une maturité démentie par la carte des phases. |
| **Statut** | Active |

### DEC-C-083 — Ouvrir la reprise par le document fondateur d'intention

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-10 |
| **Décideur** | Porteur du projet |
| **Décision** | La reprise décidée par `DEC-C-016` est engagée. Le [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]], version 0.1, est versé en `00-intention`. Il réécrit l'intention depuis le corpus hérité, consigne l'intention stratégique déclarée par le porteur le 2026-09-10, et rend le verdict du premier maillon de la chaîne de conception : **NON INSTRUIT — programme d'études à écrire**, échéance au **2026-10-31**. |
| **Intentions déclarées consignées** | Construire un produit fonctionnel sur toute la chaîne métier ; le présenter à une autorité publique ; viser, en cas de reprise, la **cession complète** du code, de la documentation et de l'exploitation ; conduire l'étude sur les seules **sources publiques**, le porteur ne disposant d'aucun accès privilégié ; aucune échéance extérieure. Point 3 du document fondateur. **Ce sont des intentions, non des décisions de projet** : aucun jalon ne les a franchies, et aucune n'est inscrite au registre `DEC-P-`. |
| **Calibrage de la chaîne** | **Complète et formalisée**, pour trois motifs dont chacun suffirait : données nominatives soumises à la loi n°001-2021/AN ; destination à une administration qui en exigera la justification ; cession complète, qui impose un dossier transférable. Chaque phase porte un jalon et une échéance, pour prévenir la réinstruction sans fin. |
| **Faits nouveaux, grade `N1`** | Établis le 2026-09-10 lors de la vérification des dénominations institutionnelles, avant tout seuil d'étude. Les concours de l'État disposent d'un dispositif numérique officiel exploité par l'**Agence générale de recrutement de l'État**, dont la couverture du besoin individuel **n'est pas établie**. Le ministère chargé de la fonction publique est dénommé **Ministère des Serviteurs du Peuple** depuis janvier 2026. L'autorité de contrôle des données personnelles est la **Commission de l'informatique et des libertés**. Sources au document fondateur. |
| **Ce que la décision n'engage pas** | Aucune catégorie de publication, aucune autorité cible, aucun mode d'alimentation n'est choisi. `10-etudes` **n'est pas ouverte** : le programme d'études est le maillon suivant, et son versement fera l'objet d'une décision distincte. |
| **Échéance du verdict** | Le jalon 1 du programme d'études se tient **au plus tard le 2026-10-31**. À cette date, l'absence de preuve sur la place disponible et sur le coût d'accès observable vaut réponse négative sur ces deux points. La date se modifie aux conditions de la règle `D3` de la [[Doctrine du coffre]]. Un second verdict *non instruit* sur les mêmes critères vaut rejet. |
| **Réversibilité** | Élevée — le document est non normatif et versionné. |
| **Statut** | Active |

### DEC-C-084 — Verser la version 0.2 du document fondateur, qui intègre trois déclarations du porteur

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-10 |
| **Décideur** | Porteur du projet |
| **Décision** | Le [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] passe en **version 0.2**. Il intègre trois déclarations faites par le porteur le jour même, après lecture de la version 0.1. |
| **Déclaration 1 — la plateforme `e-concours`** | Elle permet **seulement de postuler à un concours et de recevoir son récépissé** ; elle n'offre pas la consultation individuelle du résultat. **Statut : déclaration du porteur**, cohérente avec le fait `N1` que l'Agence générale de recrutement de l'État publie ses résultats sous forme de listes classées par numéro de récépissé, et **à confirmer sur source publique** par le lot « état de l'art ». Effet : la condition de fausseté 2 — *la place est prise* — est écartée pour les concours de l'État sous cette réserve, et ces concours deviennent une catégorie candidate. Aucune catégorie n'est choisie. |
| **Déclaration 2 — l'échéance du jalon 1** | Le porteur confirme le **2026-10-31 comme plafond** ; une date antérieure est admise, et le programme d'études peut en fixer une. |
| **Déclaration 3 — les données de la démonstration** | Le porteur livre une démonstration sur **données fictives** ; l'autorité peut demander une démonstration sur **données réelles**, et le produit reste en mesure de la fournir. **Statut : intention `I8`.** Effet : le produit minimal porte la fonction de **convaincre**, l'étude celle de **réfuter** la thèse ; le produit doit accepter les données réelles de l'autorité dans leurs formats effectifs, et le cadre juridique d'une démonstration sur données réelles doit être prêt avant qu'elle soit demandée. |
| **Ce que la version 0.2 ne change pas** | Le verdict du premier maillon — *non instruit* —, son échéance, les huit lots exigés du programme d'études. Aucune déclaration n'est promue en décision de projet : aucun jalon ne l'autorise. |
| **Points du document modifiés** | Encadré de statut ; point 3, ajout de `I8` ; point 4, constat `C4` et encadré sur le dispositif officiel des concours ; point 5, condition de fausseté 2 ; point 7, deuxième ligne du tableau et point 7.1 ; point 8.2 ; point 8.3 ; point 10.2 ; point 10.3, premier lot ; point 10.4 ; point 12. |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

### DEC-C-085 — Ouvrir la phase `10-etudes` et verser le programme d'études

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-10 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `10-etudes` est créé et reçoit le [[checkme/10-etudes/Programme d'études\|Programme d'études]], version 0.1 : neuf lots `L1` à `L9`, dont un facultatif ; trois jalons ; une variante à ressources contraintes sur huit semaines. |
| **Motif** | Le verdict du premier maillon — *non instruit* — exige un protocole d'acquisition de preuve portant au minimum huit lots nommés au point 10.3 du [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]]. Le porteur a demandé le 2026-09-10 d'engager ce programme. |
| **Contrôle de complétude** | Les huit lots exigés sont présents — annexe A du programme. L'issue **D** est atteignable à chacun des trois jalons — annexe B. Ce contrôle est conduit par l'auteur du programme et ne vaut pas validation indépendante. |
| **Deux lots portés dès l'origine** | `L7` — l'actif, avec un **test de reproductibilité** : si l'émetteur peut ajouter lui-même la consultation individuelle à son dispositif, la cession d'un produit distinct perd son objet. `L8` — le payeur, sur la base duquel le basculement en infrastructure publique sera acté au jalon 3, conformément à la règle `D2`. |
| **Seuils** | **Pré-enregistrés le 2026-09-10**, avant toute collecte, lot par lot, conformément à la règle `D3`. Les conséquences du jalon 1 sont écrites d'avance sous forme de table, point 5.1 du programme. |
| **Règle propre au projet** | **Aucune liste nominative n'entre dans le coffre** : seules leurs métadonnées sont relevées. |
| **Ordonnancement retenu** | `L1` en tête : c'est le test le moins coûteux qui peut arrêter le projet. `L4` avant `L5`, le régime des entretiens devant être établi avant le premier. Les lots documentaires de la vague 2 peuvent commencer dès le jalon 1. |
| **Calendrier** | Jalon 1 au plus tard le 2026-10-31 ; jalon 2 au plus tard six semaines après le jalon 1 ; jalon 3 au plus tard quatre semaines après le jalon 2. |
| **Ce que la décision n'engage pas** | **Aucun lot n'est lancé.** Le lancement de la vague 0 est une décision distincte, à journaliser. Il suppose que le porteur ait pris connaissance des seuils : avant la première collecte, tout seuil peut encore être modifié sans que la modification puisse être motivée par un résultat ; après, il ne se modifie qu'aux conditions de la règle `D3`. Le recours éventuel à la variante à ressources contraintes s'inscrit également avant le lancement. |
| **Réversibilité** | Élevée — une phase ouverte par erreur se referme, la décision annulée restant au journal. |
| **Statut** | Active |

### DEC-C-086 — Lancer la vague 0 du programme d'études, seuils validés et gelés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-10 |
| **Décideur** | Porteur du projet |
| **Décision** | La **vague 0** du [[checkme/10-etudes/Programme d'études\|Programme d'études]] est lancée : `L1`, `L2`, `L3` et la première partie de `L4`. Le porteur **valide les seuils tels qu'ils sont écrits** et retient le **programme complet**, non la variante à ressources contraintes. |
| **Gel du programme** | À compter du lancement, le **corps** du programme — tout le texte situé sous l'en-tête de propriétés — n'est plus modifié. Seuls les champs d'état de l'en-tête évoluent. Empreinte SHA-256 du corps au lancement, 42 105 octets : `84493fe13c869a7e6e5c5398838b5e00313ed8b832dfaf64bf8ea5c104c02c20`. Toute modification ultérieure d'un seuil se consigne ici, datée et motivée par autre chose qu'un résultat, conformément à la règle `D3`. |
| **Contrôle avant gel** | Le fichier a été relu intégralement avant le calcul de l'empreinte. Seul écart constaté depuis son versement : l'alignement des colonnes du tableau des seuils de `L4`, **sans modification d'aucun mot**. |
| **Répartition de la conduite** | **À distance** : `L1` ; `L4`, première partie ; relevé des formats de `L2`. **Par le porteur** : mesure du coût minimal de `L2`, qui exige un téléphone et une connexion mobile ; relevé et codage des commentaires de `L3`, qui exige l'accès aux pages de réseaux sociaux. Les consignes de conduite sont versées en `10-etudes` avant toute collecte du porteur. |
| **Ordre de conduite** | `L1` en premier, conformément au programme. `L2` et `L3` dépendent de `L1` pour leur échantillon, restreint aux catégories non servies ou partiellement servies ; leurs consignes sont prêtes dès le lancement. |
| **Échéance** | Jalon 1 **au plus tard le 2026-10-31**. À cette date, l'absence de preuve sur une question de la vague 0 vaut réponse négative. |
| **Réversibilité** | Faible sur les seuils, par construction. Élevée sur l'ordre de conduite. |
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
