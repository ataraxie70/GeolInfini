---
projet: "levelup"
type: "note-d-entree-projet"
statut_projet: "Programme d'études ouvert — aucun lot lancé, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — levelup est un nom de code interne ; le corpus hérité emploie LevelUP"
corpus_herite: "303 documents en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-08
cree_le: 2026-09-08
tags:
  - levelup
  - moc
---

# levelup

**Moteur de progression** destiné à rendre visible, mesurable et durable la progression réelle d'un individu, dans n'importe quel domaine de connaissance ou de pratique.

> [!warning] `levelup` est un nom de code, pas un nom de produit
> Le corpus hérité emploie la graphie `LevelUP`. Elle est traitée comme un nom de produit **provisoire** : le nom définitif n'est pas décidé. Voir `DEC-C-040`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `10-etudes` — programme d'investigation ouvert le 2026-09-08 |
| Étude | [[levelup/10-etudes/Programme d'études\|Programme d'études]] V0.1 — dix lots, quatre jalons. **Aucun lot lancé** |
| Décisions de projet inscrites | **Aucune** — voir [[levelup/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Six, `DEC-C-037` à `DEC-C-041` et `DEC-C-047`, toutes de rangement ou de méthode |
| Corpus hérité | **303 documents**, archivés et empreintés en [[levelup/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |
| Documents normatifs | Aucun |

---

## Ce que la reprise a changé

`levelup` est entré dans le coffre avec un corpus abondant : une architecture d'entreprise développée, quarante-deux spécifications de contextes bornés, deux essais de développement, et **5,6 Go de code et d'artefacts de compilation**. Trois opérations ont été conduites le 2026-09-08.

| Opération | Effet | Décision |
| --- | --- | --- |
| **Assainissement** | Le code, les dépendances et les sorties de compilation sont sortis du coffre, sans être détruits. Leur documentation — 93 fichiers — a été récupérée avant la sortie. Le dossier passe de **5,6 Go / 19 324 fichiers** à **3,9 Mo / 309 fichiers** | `DEC-C-037` |
| **Résolution des copies** | Le corpus existait en trois exemplaires concurrents. Comparaison par empreinte, fichier à fichier : la copie retenue est un sur-ensemble des deux autres à quatre fichiers près, tous récupérés ou motivés | `DEC-C-039` |
| **Rétrogradation du corpus** | Le corpus devient **matériau de référence**, jamais autorité. La conception est reprise depuis l'intention | `DEC-C-038` |

> [!important] Pourquoi le corpus n'a pas été promu en phases
> Il aurait suffi de verser le DDD stratégique en `30-ddd-strategique` et les paysages techniques en `50-architecture` pour afficher un projet très avancé. Ces documents ont été produits **avant toute étude** : ils ne citent aucune enquête, aucune mesure, aucun entretien, aucun état de l'art, et n'énoncent jamais ce qui les invaliderait.
> Une architecture d'entreprise bâtie sur des hypothèses non instruites reste bâtie sur des hypothèses non instruites, quelle que soit sa qualité interne. Les ouvrir aurait affiché comme franchies des phases qui ne le sont pas.

---

## Navigation

### Phases ouvertes

- [[levelup/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, la thèse falsifiable, les distinctions fondatrices, les recouvrements (V0.1)
- [[levelup/10-etudes/Programme d'études\|Programme d'études]] — `10-etudes` — le protocole, les lots L0 à L9, les jalons, la variante à ressources contraintes (V0.1)
- [[levelup/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage` — le chemin de la reprise et ce qu'ouvre chaque phase
- [[levelup/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage` — toute décision, sa date, son motif, sa réversibilité
- [[levelup/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage` — ce qui est **fait**, **hypothèse**, **principe**, **possibilité**, **décision**
- [[levelup/99-sources/Sources originales\|Sources originales]] — `99-sources` — le corpus hérité, intact, empreinté, non opposable

### Phases non encore créées

`20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation` — voir [[levelup/90-pilotage/Carte des phases\|Carte des phases]]. **Leur création est elle-même une décision à journaliser.**

---

## Le nœud du problème, en une page

**L'intention.** Rendre visible, mesurable et durable la progression réelle d'une personne, quel que soit son domaine. L'objet visé est un moteur de progression, distinct par nature d'un gestionnaire de tâches et d'une plateforme de contenu : il prétend représenter une capacité acquise, non des actions accomplies.

**La contribution solide.** Trois distinctions, qui sont le véritable apport intellectuel du corpus : *faire n'est pas comprendre*, *comprendre n'est pas maîtriser*, *la représentation n'est pas la preuve*. Elles se ramènent à un principe unique — une compétence n'est reconnue qu'à partir de preuves observables, et le système ne doit jamais donner l'illusion d'une maîtrise inexistante.

**La thèse, et sa condition de fausseté.** Le coût d'accès à l'information ayant baissé, la difficulté déterminante serait devenue la transformation du savoir en compétence démontrable. **Ce qui la ferait tomber** : que les personnes visées ne veuillent pas d'une représentation honnête, et donc moins flatteuse, de leur progression. Le corpus pose la rigueur comme une valeur ; il ne vérifie nulle part qu'elle est **désirée**. C'est la question la plus lourde de la reprise, et elle n'est posée nulle part dans les 303 documents.

**Le point le plus coûteux.** L'axiome A5 — *« le moteur est indépendant du domaine étudié »* — engage un moteur universel. Or la preuve de compétence n'a pas la même forme en programmation système, en droit ou en menuiserie. L'universalité est une hypothèse coûteuse posée comme point de départ ; un périmètre initial restreint à un seul domaine reste une possibilité entière.

**Ce qui manque, et que le corpus ne voit pas.** Sa propre critique relève dix écarts, tous situés **en aval** — agrégats, données, applications, sécurité, infrastructure. Aucun ne porte sur l'amont : la preuve que le problème existe, le bénéficiaire nommé, le marché initial, le modèle économique, l'état de l'art. C'est exactement le biais que la reprise corrige.

**Ce que le corpus contient sans le voir.** Le porteur a construit **pour lui-même**, à la main, un tracker de validation à quatre niveaux de maîtrise, avec une règle en quatre conditions — *expliquer, reproduire, appliquer, corriger, sans aide* — et deux échéances de révision. Cet instrument définit opérationnellement la preuve de compétence que les 303 documents d'architecture ne définissent nulle part. **Il n'a jamais été rempli : 354 cases vides, aucune date.** C'est la seule preuve de niveau 1 du dossier, elle admet deux lectures opposées, et le lot `L0` a pour unique objet de les départager. Faits `F6` et `F7` du [[levelup/90-pilotage/Registre des statuts\|Registre des statuts]].

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre**, opposables à tous les projets : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Chaque note indique de quel monde elle parle. Le corpus hérité relève presque entièrement du monde imaginé.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus hérité ne lui confère aucun statut. Toute reprise fixe le statut explicitement.
3. **Pas de chiffre sans source** — le corpus n'en cite aucune ; toute statistique reprise doit être sourcée ou retirée.
4. **Falsifiabilité** — toute hypothèse écrite énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué** — une affirmation reprise indique le chemin du fichier source dont elle provient, afin qu'un lecteur distingue ce qui a été retenu de ce qui a été écarté.

---

## Recouvrement à trancher avant toute modélisation

> [!danger] `levelup` et `synapse` modélisent tous deux la preuve de compétence
> La chaîne structurante de `synapse` est *identité → compétence → **preuve → validation** → réputation → visibilité → opportunité*. Ces trois maillons sont l'objet du principe le plus structurant de `levelup`.
> Une frontière plausible existe — `levelup` **produit** la compétence et sa preuve, `synapse` les **certifie et les met en relation** — et `synapse` s'écarte explicitement d'être un LMS, ce qui la rend praticable. Elle n'est pour autant ni instruite, ni arbitrée, ni inscrite à aucun journal.
> Elle doit être portée à [[Cartographie du portefeuille]] et tranchée **avant** que l'un des deux projets ne modélise son noyau.

> [!important] Un second projet du coffre touche au même axiome — instruit le 2026-09-09
> `Psycho-pass`, plateforme d'évaluation psychotechnique versée au coffre le 2026-09-09, mesure une personne, sert des séances et affiche une progression. L'analyse [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] conclut que les deux projets ne mesurent pas le même objet — une aptitude relativement stable contre une compétence acquise —, et que la règle de preuve de `levelup` **exclut** le questionnaire à choix multiples : une seule de ses quatre conditions est servie, et partiellement.
> `DEC-C-061` en tire une décision de **rangement seulement** : deux dossiers distincts. La question produit relève du lot `L8` de `Psycho-pass`, **conduit conjointement**, dont la deuxième question s'adresse à `levelup` : accepte-t-il de réviser `A8` ?
> Les deux recouvrements — avec `synapse` et avec `Psycho-pass` — portent sur le même axiome. Une réponse donnée à l'un contraint l'autre.

---

## Étape suivante

Lancer la **vague 0** du [[levelup/10-etudes/Programme d'études\|Programme d'études]] — décision à inscrire au journal. Elle porte les deux seuls travaux capables de conclure sans dépenser un entretien :

1. **`L0` — l'autopsie du système fantôme** : pourquoi le tracker n'a-t-il jamais été rempli ? Une semaine, aucune autorisation, aucun recrutement.
2. **`L1` — le cimetière et l'état de l'art** : qui occupe le terrain, qui y est mort, et de quoi ? Deux semaines de travail documentaire.

**Le jalon 1 est atteignable en trois semaines et peut prononcer l'arrêt du projet.** C'est le point le moins cher du programme, et celui qui décide le plus.
