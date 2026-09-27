---
projet: "Psycho-pass"
type: "note-d-entree-projet"
statut_projet: "Programme d'études ouvert — un lot conduit, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — Psycho-pass est un nom de code interne ; trois graphies coexistent dans le corpus"
corpus_herite: "38 documents en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - Psycho-pass
  - moc
---

# Psycho-pass

**Plateforme d'évaluation et d'entraînement** aux épreuves d'aptitude psychotechnique et de culture générale : séances chronométrées, correction automatique, score par catégorie et suivi de progression.

> [!warning] `Psycho-pass` est un nom de code, pas un nom de produit
> Trois graphies coexistent dans le corpus hérité : `Psycho-Pass` dans la documentation, `Psycho-pass` sur le dossier, `psycho-pass` sur le dépôt de code. Aucune n'est décidée. Le lot `L9` du programme d'études instruit le nom, et le fait `F12` consigne que `Psycho-Pass` est déjà le titre d'une série animée diffusée en 2012. Voir `DEC-C-057`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `10-etudes` — programme d'investigation ouvert le 2026-09-09 |
| Étude | [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] V0.1 — dix lots, trois jalons. **Un lot préalable conduit**, aucun autre lancé |
| Décisions de projet inscrites | **Aucune** — voir [[Psycho-pass/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Cinq, `DEC-C-057` à `DEC-C-061`, toutes de rangement ou de méthode |
| Corpus hérité | **38 documents**, archivés et empreintés en [[Psycho-pass/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |
| Documents normatifs | Aucun |

---

## Ce que la mise en conformité a changé

Le projet est entré au coffre sous **deux dossiers séparés** — `Psycho-pass`, 53 Mo, et `_Psycho-pass`, 76 Ko — dont les horodatages établissent qu'ils appartiennent à la même séance de travail. Quatre opérations ont été conduites le 2026-09-09.

| Opération | Effet | Décision |
| --- | --- | --- |
| **Réunion** | Le pack pédagogique de `_Psycho-pass` rejoint `99-sources` ; le dossier vide est supprimé. Le projet ne compte plus qu'une entrée à la racine du coffre | `DEC-C-057` |
| **Assainissement** | Le code, l'outillage, les sorties de compilation et **un fichier d'environnement renseigné** sont sortis du coffre, sans être détruits. Le dossier passe de **51,1 Mo et 241 fichiers** à **381 Ko et 38 fichiers** | `DEC-C-058` |
| **Rétrogradation du corpus** | Le corpus devient **matériau de référence**, jamais autorité. La conception est reprise depuis l'intention | `DEC-C-059` |
| **Ouverture des études** | Phase `10-etudes` ouverte, benchmark conduit immédiatement, programme versé | `DEC-C-060` |

> [!important] Pourquoi le corpus n'a pas été promu en phases
> Il aurait suffi de verser les cinq RFC en `50-architecture` et le schéma de données en `40-ddd-tactique` pour afficher un projet très avancé. Ces documents ont été produits **avant toute étude** : ils ne citent aucune enquête, aucun entretien, aucun état de l'art, aucune source psychométrique, et n'énoncent jamais ce qui les invaliderait.
> Un cahier des charges bâti sur des hypothèses non instruites reste bâti sur des hypothèses non instruites, quelle que soit sa qualité interne.

---

## Navigation

### Phases ouvertes

- [[Psycho-pass/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, la thèse et son démenti partiel, l'état où le travail s'est arrêté (V0.1)
- [[Psycho-pass/10-etudes/Benchmark et état de l'art\|Benchmark et état de l'art]] — `10-etudes` — les acteurs, le coût réel de l'adaptativité, ce que vaut la mesure vendue. **Relevé clos**
- [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] — `10-etudes` — pourquoi les deux projets ne mesurent pas le même objet, et ce que la fusion coûterait
- [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] — `10-etudes` — les dix lots, les trois jalons, l'ordre de renoncement (V0.1)
- [[Psycho-pass/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage` — le chemin de la reprise et ce qu'ouvre chaque phase
- [[Psycho-pass/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage` — toute décision, sa date, son motif, sa réversibilité
- [[Psycho-pass/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage` — ce qui est **fait**, **hypothèse**, **principe**, **possibilité**, **décision**
- [[Psycho-pass/99-sources/Sources originales\|Sources originales]] — `99-sources` — le corpus hérité, intact, empreinté, non opposable

### Phases non encore créées

`20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation` — voir [[Psycho-pass/90-pilotage/Carte des phases\|Carte des phases]]. **Leur création est elle-même une décision à journaliser.**

---

## Le nœud du problème, en une page

**L'intention.** Permettre à une personne de s'entraîner aux épreuves d'aptitude et de culture générale, d'obtenir un score fiable, et de voir sa progression dans le temps.

**La contribution solide.** Un principe de sécurité motivé — *le frontend affiche, le backend décide* — qui pose que le score, la difficulté et les permissions sont établis côté serveur. Il est justifié plutôt qu'affirmé : un score consultable est un score qu'un utilisateur peut vouloir falsifier, et un produit d'évaluation dont le résultat se truque ne mesure rien.

**Le terrain n'est pas libre, et l'occupation s'étend jusqu'au territoire le plus probable du projet.** Une plateforme burkinabè vend depuis janvier 2024 un module psychotechnique en questionnaire à choix multiples, avec corrigés, cours vidéo et sujets, pour **5 000 FCFA par an**. Une plateforme française annonce plus de 820 tests et 10 000 candidats. Le corpus ne cite aucun concurrent et ne contient aucun état de l'art.

**La fonction distinctive exige le public qu'elle est censée produire.** L'adaptativité annoncée est, telle qu'elle est spécifiée, une heuristique de confort qui règle le rythme d'une séance. Un test adaptatif au sens psychométrique exige une banque calibrée, et la littérature situe ce besoin entre **250 et 500 réponses par item** — soit, pour 300 items, de 75 000 à 150 000 passages avant que le moteur ne repose sur autre chose qu'un entier saisi à la main.

**Les deux publics visés ont des intérêts opposés.** Pour le candidat, le gain de score est le service acheté. Pour le recruteur, ce même gain contamine le signal qu'il achète — et la littérature établit que le regain au repassage peut refléter l'habileté à passer le test plutôt que l'aptitude mesurée. Le corpus aligne les six publics sur une seule ligne comme s'ils formaient un marché.

**Le sujet absent.** Le corpus décrit avec précision comment administrer des questions. Il ne dit jamais d'où elles viennent, qui les écrit, ni à quel coût. C'est pourtant le produit : les concurrents ne vendent pas un logiciel, ils vendent un **stock d'items entretenu**. Une plateforme vide fonctionne parfaitement et ne sert à rien.

**Ce que le dossier contient sans le voir.** Le dépôt de code ne porte **aucun commit**, et les quatre derniers fichiers écrits — le 2026-05-16, entre 17 h 16 et 18 h 05 — sont placés à un chemin doublement imbriqué où l'application ne peut pas les charger. Le projet a produit près de quatre-vingt-dix pages de documentation, puis s'est interrompu au premier module métier réel. C'est le seul comportement observé du dossier ; il admet deux lectures opposées, et le lot `L0` a pour unique objet de les départager. Faits `F1` à `F4`.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre**, opposables à tous les projets : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Chaque note indique de quel monde elle parle.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus hérité ne lui confère aucun statut.
3. **Pas de chiffre sans source** — le corpus n'en cite aucune ; toute statistique reprise doit être sourcée ou retirée.
4. **Falsifiabilité** — toute hypothèse écrite énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué** — une affirmation reprise indique le chemin du fichier source dont elle provient.

---

## Recouvrement instruit, et ce qui reste à trancher

> [!important] `Psycho-pass` est rangé séparément de `levelup` ; la question produit reste ouverte
> Les deux projets mesurent une personne, servent des séances et affichent une progression. [[Psycho-pass/10-etudes/Relation à levelup\|Relation à levelup]] établit qu'ils ne mesurent pas le même objet — une aptitude relativement stable contre une compétence acquise — que la règle de preuve de `levelup`, *expliquer, reproduire, appliquer, corriger sans aide*, **exclut le questionnaire à choix multiples**, et que leur seule intersection réelle est un composant que la doctrine range parmi les domaines génériques.
> `DEC-C-061` en tire une décision de **rangement**, et rien de plus : deux dossiers, deux journaux, deux programmes. Que les deux **produits** doivent rester séparés, partager un composant ou fusionner est une décision de projet, elle engage deux projets à la fois, et aucun des deux n'a franchi son premier jalon. Le lot `L8` la porte, conduit conjointement.

---

## Étape suivante

Lancer la **vague 0** du [[Psycho-pass/10-etudes/Programme d'études\|Programme d'études]] — décision à inscrire au journal. Elle porte les trois travaux capables de conclure sans dépenser un entretien.

1. **`L0` — l'autopsie de l'arrêt** : pourquoi le travail s'est-il interrompu au premier module ? Une demi-journée, aucune autorisation.
2. **`L1` — le cimetière** : qui a tenté ce produit et a cessé, et de quoi ? Une semaine de travail documentaire.
3. **`L2` — l'origine du contenu** : d'où viennent les items, à quel coût mesuré, sous quel régime juridique ? Deux semaines. C'est le lot le plus lourd, et le seul dont l'échec arrête le projet à lui seul.

**Le jalon 1 est atteignable en trois à quatre semaines et peut prononcer l'arrêt du projet.** C'est le point le moins cher du programme, et celui qui décide le plus.
