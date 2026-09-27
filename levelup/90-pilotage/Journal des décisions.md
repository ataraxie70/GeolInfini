---
projet: "levelup"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 6
cree_le: 2026-09-08
tags:
  - levelup
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

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]], qui recense aussi les six entrées transverses antérieures restées dans les journaux de projet.
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-08.** Les éléments du point 11 du [[levelup/00-intention/Document fondateur d'intention|Document fondateur d'intention]] demeurent tous suspendus, y compris ceux pour lesquels le corpus hérité contient une réponse écrite.
> Cela inclut, sans s'y limiter : le nom du produit, le premier public, le premier domaine, le périmètre du produit minimal, le degré d'universalité, le modèle de preuve de compétence, le *Core Domain*, le découpage en contextes bornés, l'architecture, la pile technique et le modèle économique.
>
> **Le corpus hérité ne vaut aucune décision.** Y trouver une spécification de contexte borné ne rend pas ce contexte décidé : il a été produit avant toute étude, et sa validité dépend d'hypothèses non instruites.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-037 — Sortie du code et des artefacts hors du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les dépôts de code, dépendances et sorties de compilation sont **déplacés hors du coffre**, vers `Incubo/_hors-coffre/levelup/`. Aucune suppression n'est faite. |
| **Éléments sortis** | `levelUP_development/` (5,4 Go, dont 5,2 Go de sortie de compilation Rust et 105 Mo de dépendances) · `levelUP_essaie_developpement/` (127 Mo) · `levelUP_development.zip` (30 Mo) · copies de compétences d'agent tierces · `.claude/` · `.codex`. |
| **Motif** | Le dossier pesait **5,6 Go pour 19 324 fichiers**, qu'Obsidian indexe intégralement : recherche, graphe et démarrage s'en trouvaient dégradés, et la table des doublons de noms du coffre était saturée par des fichiers de dépendances. Le coffre est un lieu de conception, pas un dépôt de code. |
| **Précaution appliquée** | La documentation de ces dépôts — 93 documents — a été **récupérée avant leur sortie** et versée en `99-sources/essai-de-developpement/` et `99-sources/depot-de-developpement/`. |
| **Résultat mesuré** | Le dossier `levelup` du coffre passe de **5,6 Go / 19 324 fichiers** à **3,9 Mo / 309 fichiers**. |
| **Portée** | Emplacement des fichiers. Ne préjuge en rien du sort du code lui-même, qui reste une question ouverte du point 11 du document fondateur d'intention. |
| **Réversibilité** | Totale — un déplacement inverse suffit. Le chemin de destination est consigné ci-dessus. |
| **Alternatives écartées** | Supprimer les seuls artefacts régénérables : écarté, la suppression étant définitive là où le déplacement ne l'est pas. Tout conserver : écarté, le coût d'indexation étant supporté à chaque ouverture du coffre. |
| **Statut** | Active |

### DEC-C-038 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 303 documents produits avant l'entrée de `levelup` dans le coffre sont versés en `99-sources` comme **matériau de référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune de ses affirmations, ne dit nulle part ce qui l'invaliderait, et ne cite ni enquête, ni mesure, ni entretien, ni état de l'art. Une architecture d'entreprise bâtie sur des hypothèses non instruites reste bâtie sur des hypothèses non instruites, quelle que soit sa qualité interne. |
| **Conséquence directe** | Les dossiers `30-ddd-strategique`, `40-ddd-tactique` et `50-architecture` **ne sont pas ouverts**, bien que le corpus contienne de quoi les remplir. Les ouvrir afficherait comme franchies des phases qui ne le sont pas. |
| **Ce qui est retenu du corpus** | Trois distinctions de conception — *faire ≠ comprendre*, *comprendre ≠ maîtriser*, *représentation ≠ preuve* — reprises au point 5 du [[levelup/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] comme principes, non comme résultats. |
| **Ce qui est rétrogradé** | Quatre constats du corpus — C2 à C5 du point 3 du même document — passent du statut de fait à celui d'**hypothèse**, faute de toute source. |
| **Portée** | Projet `levelup`. Modèle applicable à tout corpus hérité versé au coffre. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté ; une décision ultérieure peut en promouvoir tout ou partie, à condition d'être journalisée. |
| **Statut** | Active |

### DEC-C-039 — Résolution des trois copies concurrentes du corpus

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | `levelUP_architecture/` devient le **corpus de référence** et est archivé en `99-sources/corpus-architecture/`. Les copies `levelUP_architecture copie/` et `levelUP_architecture.bat/` sont **sorties du coffre**, non détruites, après récupération de leurs fichiers divergents. |
| **Méthode** | Comparaison par empreinte SHA-256, fichier à fichier, sur les 225 fichiers des trois arborescences. |
| **Résultat** | La copie retenue est un **sur-ensemble** des deux autres à quatre fichiers près, et la seule à porter cinq familles de documents — UX/UI, *data*, *technology*, *experience*, *solution* — ainsi que le glossaire métier global. La copie `.bat` portait en outre des noms de fichiers tronqués, caractéristiques d'une copie interrompue. |
| **Récupérations** | Trois fichiers versés en `99-sources/variantes-du-corpus/` : l'audit critique, qui n'existait que dans `copie` ; une version tronquée de l'historique d'intervention, conservée pour mémoire ; et une version **antérieure** de la carte des contextes, qui documente un renommage — *Organization* et *Execution* y sont devenus *Program* et *Activity*, et *Progress* n'existait pas encore. |
| **Écarté** | Un fichier d'échange d'éditeur `.kate-swp`, sans contenu documentaire. |
| **Vérifiabilité** | L'empreinte d'ensemble du corpus de référence est consignée dans [[levelup/99-sources/Sources originales\|Sources originales]] et se recalcule. |
| **Réversibilité** | Totale — les copies sont conservées hors du coffre. |
| **Statut** | Active |

### DEC-C-040 — Nom de code du projet et graphie

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier et le nom de code interne du projet sont `levelup`, en minuscules. La graphie `LevelUP`, employée par le corpus hérité, est traitée comme un **nom de produit provisoire**, distinct du nom de code. |
| **Motif** | Le nom de code doit être stable et sans ambiguïté de casse pour nommer le dossier, les tags et les liens. Les cinq autres projets du coffre suivent la même règle : la casse d'origine du projet est conservée pour le dossier, et le nom de produit reste indécidé. |
| **Portée** | Nom de **code** uniquement. **Ne préjuge en rien** du nom du produit ou de la marque, explicitement suspendu au point 11 du document fondateur d'intention. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-041 — Mise en conformité de `levelup` aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | `levelup` adopte la structure et les conventions du coffre : note d'entrée à la racine du dossier, phases préfixées, journal des décisions, registre des statuts, carte des phases, sources empreintées, wikilinks en chemin complet vers les notes de pilotage. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **Aucune autre**, conformément à `DEC-C-038`. |
| **Documents créés** | [[levelup/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] · [[levelup/90-pilotage/Carte des phases\|Carte des phases]] · [[levelup/90-pilotage/Registre des statuts\|Registre des statuts]] · [[levelup/99-sources/Sources originales\|Sources originales]] · le présent journal · la note d'entrée [[levelup]]. |
| **Registre de rédaction** | Ces documents sont écrits dans le registre impersonnel et documentaire fixé par `DEC-C-034` : aucune première personne, aucune adresse au lecteur, aucun pictogramme, aucun texte biffé. Le corpus archivé en `99-sources` n'y est **pas** soumis : une source ne s'édite pas. |
| **Portée** | Projet `levelup`. Le coffre compte désormais six projets conformes. |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

---

### DEC-C-047 — Ouverture de la phase `10-etudes`

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | La phase `10-etudes` est ouverte et reçoit le [[levelup/10-etudes/Programme d'études\|Programme d'études]] V0.1 : dix lots `L0` à `L9`, quatre jalons, une variante à ressources contraintes sur six semaines. |
| **Motif** | Le [[levelup/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] a rétrogradé quatre constats du corpus en hypothèses et laissé cinq questions entières. Aucune ne se lève par la lecture du corpus : elles exigent un protocole. |
| **Fait nouveau qui commande le programme** | L'instruction du corpus a établi `F6` et `F7` du [[levelup/90-pilotage/Registre des statuts\|Registre des statuts]] : le porteur a construit à la main le système que `levelup` propose d'automatiser, et **ne l'a jamais rempli** — 354 cases vides, aucune date. C'est la seule preuve de **niveau 1** du dossier, et elle admet deux lectures opposées. Le lot `L0` a pour unique objet de les départager, sans autorisation ni dépense. |
| **Deux lots portés dès l'origine** | `L7` — l'actif : ce qui s'accumule, se creuse et appartient. `L8` — le payeur : qui porte la ligne de coût. L'instruction du programme d'`ecoFab` avait établi qu'un programme de recherche instruit spontanément ce qui se demande à des gens et oublie ce qui se possède, la lacune n'apparaissant qu'au jalon où il est trop tard. Elle est ici évitée par construction. |
| **Ordonnancement retenu** | Les deux travaux capables de conclure sans dépense — l'autopsie du système fantôme et l'état de l'art avec autopsie des échecs — sont en **vague 0**, avant le premier jalon. Le programme d'`ecoFab` plaçait son cimetière en vague 2, après un jalon pouvant déjà prononcer l'arrêt ; l'inversion est délibérée. |
| **Portée** | Ouverture de la phase et versement du protocole. **Aucun lot n'est lancé** : le lancement de la vague 0 est une décision distincte, à journaliser. |
| **Réversibilité** | Élevée — une phase ouverte par erreur se referme, la décision annulée restant au journal. |
| **Statut** | Active |

---

## Décision inscrite ailleurs et engageant `levelup`

### DEC-C-061 — Rangement de `Psycho-pass` comme projet distinct

Inscrite au [[Psycho-pass/90-pilotage/Journal des décisions|Journal des décisions de Psycho-pass]] le 2026-09-09, et recensée au [[Journal des décisions du coffre]]. Elle est signalée ici parce qu'elle engage `levelup`.

| Champ | Valeur |
| --- | --- |
| **Ce qu'elle décide** | Au **rangement**, `Psycho-pass` est un projet distinct : dossier propre, journal propre, programme d'études propre. |
| **Ce qu'elle ne décide pas** | Que les deux **produits** doivent rester séparés, partager un composant ou fusionner. Cette question est une décision de projet, et aucun des deux projets n'a franchi son premier jalon. |
| **Ce que `levelup` doit en retenir** | L'analyse [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] établit que la règle de preuve de `levelup` — *expliquer, reproduire, appliquer, corriger, sans aide* — **exclut le questionnaire à choix multiples**, et que l'axiome `A9` classerait un score `Psycho-pass` en représentation, non en preuve. Absorber ce module contraindrait `levelup` à contredire son principe le plus structurant. |
| **Ce qui reste à faire côté `levelup`** | Le lot `L8` de `Psycho-pass` est **conduit conjointement**. Sa deuxième question s'adresse directement à `levelup` : accepte-t-il de réviser `A8` ? S'il le maintient, l'absorption est fermée par construction ; s'il l'assouplit, il doit dire ce qu'il accepte de perdre, et l'inscrire ici. |
| **Renvoi** | Le recouvrement est porté à [[Cartographie du portefeuille]], où il rejoint celui de `levelup` avec `synapse` — les deux portant sur le même axiome `A8`. |

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
| **Preuves** | Lot, mesure, source, et niveau de preuve. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Statut** | Active / Annulée par DEC-?-00M |
```
