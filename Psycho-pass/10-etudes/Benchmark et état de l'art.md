---
projet: "Psycho-pass"
type: "releve-de-lot"
phase: "10-etudes"
objet: "Qui occupe le terrain, ce que coûte réellement un test adaptatif, et ce que vaut la mesure vendue"
monde: "Monde observé — relevé documentaire, aucune donnée personnelle"
niveau_de_preuve: "1 sur les acteurs et la littérature ; 4 sur les conséquences pour le projet"
date_du_releve: 2026-09-09
statut: "Relevé clos"
tags:
  - Psycho-pass
  - etudes
  - benchmark
  - psychometrie
---

# Benchmark et état de l'art

Premier travail d'étude du projet, conduit avant tout autre parce qu'il peut rendre le reste inutile. Sources publiques, aucune autorisation requise.

---

## 1. Résultat en une phrase

> **Le terrain est occupé jusque dans le territoire le plus probable ; la fonction distinctive revendiquée — l'adaptativité — exige une calibration que le produit ne peut obtenir qu'après avoir acquis le public que cette fonction est censée attirer ; et les deux publics visés ont des intérêts opposés sur la mesure vendue.**

---

## 2. Le terrain est occupé

Quatre plateformes relevées au 2026-09-09 sur le marché francophone.

| Acteur | Territoire | Ce qu'il fait | Point notable |
| --- | --- | --- | --- |
| **prepaconcoursbf.com** | **Burkina Faso** | Préparation aux concours directs et professionnels : questionnaires à choix multiples en ligne, cours vidéo, sujets en PDF avec corrigés. Couvre la logique, le verbal, le numérique, l'aptitude, le raisonnement, l'orthographe, la grammaire et la conjugaison | **L'acteur le plus proche.** Actif depuis au moins novembre 2021. Module psychotechnique ajouté le **2024-01-03**, vendu **5 000 FCFA** en abonnement annuel, payable par Orange Money |
| **psychotechniquetest.fr** | France | Entraînement ciblé, corrigés détaillés, suivi de progression | Annonce **820+ tests**, **10 000+ candidats**, offres à **49 €** en paiement unique. Se positionne **par éditeur** (SHL, Maki, Criteria) et **par employeur** (RATP, BNP Paribas, Deloitte) |
| **concours-formation.fr** | France | Tests psychotechniques gratuits en ligne, avec corrigés et statistiques | Le gratuit occupe déjà le premier échelon |
| **psychotechniqua.com** | France | Tests pour concours, en ligne et en PDF | — |

Au-dessus de ces plateformes se tient une seconde catégorie, que le corpus ignore également : les **éditeurs d'instruments** — SHL, Central Test, AON, Hogrefe, AssessFirst, Criteria. Ils ne vendent pas de l'entraînement mais des tests validés aux recruteurs, et leur validation scientifique est leur position.

> [!danger] Ce que cela établit
> Le corpus hérité ne cite **aucun** de ces acteurs, ne mentionne **aucun** concurrent, et ne contient **aucun** état de l'art. Il conçoit une architecture complète pour un terrain qu'il n'a jamais regardé.
> Un acteur burkinabè vend déjà, depuis plus de deux ans, le module que le produit minimal décrit — au prix d'environ **8 euros par an**. La question n'est donc plus *« ce service manque »* mais **« il existe et il est bon marché — qu'apporte celui-ci de plus, et qui paierait la différence ? »**. Le dossier n'y répond pas.

---

## 3. L'adaptativité — la contrainte que le corpus ne voit pas

### 3.1. Ce que le corpus appelle adaptatif

Le cahier des charges pose une règle en trois lignes : *bonne réponse, la difficulté augmente légèrement ; mauvaise réponse, elle baisse légèrement ; réponse trop lente, pénalité légère.* La difficulté d'une question est portée par un entier dans le schéma de données — `difficulty Int @default(1)` — et rien n'indique d'où vient cet entier.

C'est une **heuristique de confort** : elle règle le rythme de la séance. Elle ne mesure rien.

### 3.2. Ce qu'un test adaptatif exige réellement

Un test adaptatif au sens psychométrique repose sur une banque d'items **calibrés** : chaque question porte des paramètres estimés — difficulté, pouvoir discriminant — obtenus en la faisant passer à un échantillon.

> **La littérature situe le besoin entre 250 et 500 réponses par item**, les gains d'exactitude étant substantiels de 250 à 500 et décroissants au-delà. Des échantillons de 100 à 300 réponses par item produisent des erreurs de calibration élevées, et l'application des tests adaptatifs à petite échelle est explicitement décrite comme limitée par cette difficulté.

### 3.3. Le démarrage à froid, chiffré

L'ordre de grandeur se calcule directement. Une banque modeste de **300 items** exige, au seuil bas de 250 réponses par item, **75 000 réponses** avant que le moteur ne repose sur autre chose qu'un entier saisi à la main ; au seuil haut de 500, **150 000**.

> [!danger] La fonction distinctive exige le public qu'elle est censée produire
> Le produit revendique l'adaptativité comme sa différence. L'adaptativité réelle exige un volume de passages que seul un public déjà acquis peut fournir. Et ce public, le benchmark montre qu'il dispose déjà d'alternatives, dont une gratuite et une à huit euros par an.
> Deux issues seulement, et le corpus n'en instruit aucune. **Soit** l'adaptativité annoncée reste l'heuristique de confort, et il faut alors cesser de la présenter comme une mesure. **Soit** elle est réelle, et il faut nommer d'où viennent les 75 000 premières réponses.

---

## 4. La mesure vendue — ce que la littérature en dit

### 4.1. Le regain au repassage est établi, son sens ne l'est pas

Repasser un test d'aptitude cognitive améliore le score. La méta-analyse situe ce regain à **d = 0,26** sans préparation, et **d = 0,64** avec préparation.

La même littérature pose la limite explicitement : lorsque le gain de score reflète une amélioration de l'**habileté à passer le test** sans croissance parallèle de l'aptitude sous-jacente, les inférences tirées des passages ultérieurs sont compromises. Le gain reste valide dans la mesure où le candidat développe réellement des compétences pertinentes, ou surmonte des facteurs étrangers à la mesure — l'anxiété face au test, par exemple.

**Le sens du gain n'est donc pas tranché par la littérature elle-même.** Il dépend de ce que l'entraînement a produit.

### 4.2. Les deux publics visés ont des intérêts opposés

Le cahier des charges nomme dans la même liste les **candidats** et les **recruteurs**. Ce sont les deux extrémités d'une même transaction, et l'entraînement ne leur rend pas le même service.

| Public | Ce que l'entraînement lui apporte | Ce qu'il lui coûte |
| --- | --- | --- |
| **Candidat** | Un gain de score réel et mesuré. C'est exactement ce qu'il achète, et l'argument commercial d'un concurrent le formule sans détour : *« +28 points gagnés en moyenne après 2 semaines »* | Rien |
| **Recruteur** | Rien | Le gain **contamine le signal** qu'il achète. Un candidat entraîné et un candidat capable deviennent moins distinguables |

> [!important] Une plateforme ne peut pas servir les deux sans le dire
> Vendre l'entraînement au candidat et la mesure au recruteur revient à vendre à l'un la dégradation de ce qui est vendu à l'autre. Ce n'est pas rédhibitoire : des acteurs vivent de chaque côté, et certains des deux en séparant strictement leurs offres. Mais c'est un arbitrage, il est structurant, et **le corpus ne le voit pas** : il aligne les six publics sur une seule ligne comme s'ils formaient un marché.

---

## 5. Le contenu — le sujet absent du dossier

Le corpus décrit avec précision comment **administrer** des questions : une interface pour créer, modifier, supprimer, catégoriser, fixer la difficulté et ajouter des explications. Le schéma de données porte un modèle `Question` complet.

Il ne dit **jamais** d'où viennent les questions, qui les écrit, à quel rythme, ni à quel coût.

C'est pourtant le sujet principal. Le concurrent français annonce **820 tests** ; le concurrent burkinabè vend des sujets corrigés. Aucun des deux ne vend un logiciel : ils vendent un **stock d'items entretenu**. Une plateforme vide fonctionne parfaitement et ne sert à rien.

Trois voies existent, aucune n'est instruite, et chacune emporte un régime différent.

| Voie | Ce qu'elle suppose | Difficulté principale |
| --- | --- | --- |
| **Rédaction propre** | Un travail d'écriture continu, et une compétence de rédaction d'items | Le coût récurrent, et la calibration du point 3 |
| **Reprise d'annales de concours** | Que les sujets soient publics et librement réutilisables | À vérifier texte par texte ; un sujet d'examen n'est pas nécessairement libre de droits |
| **Reprise d'items d'éditeurs** | Rien de licite | Les instruments des éditeurs sont leur actif ; leur reproduction est le contentieux le plus prévisible du secteur |

---

## 6. Le nom — un fait à consigner, sans conséquence tranchée

`Psycho-Pass` est le titre d'une série animée japonaise de Production I.G, diffusée d'octobre 2012 à mars 2013. Dans cette fiction, le « Psycho-Pass » désigne l'évaluation produite par un système qui mesure en continu l'état mental des citoyens et en dérive un « coefficient de criminalité » servant à les juger.

Deux observations, l'une et l'autre matérielles.

1. **Le nom est celui d'une œuvre tierce active**, exploitée commercialement. La disponibilité juridique du signe pour une plateforme d'évaluation n'a pas été examinée et ne relève pas d'un relevé documentaire.
2. **La connotation est celle d'un système qui juge des personnes sur un score.** Pour un produit qui mesure des personnes et leur attribue un score, cette référence n'est pas neutre — elle est soit un atout d'évocation, soit exactement le procès que le produit aura à subir.

`Psycho-pass` est traité comme un **nom de code**, au même titre que `ecoFab`, `levelup` et `maSecure`. Aucun nom de produit n'est décidé.

---

## 7. Ce que ce relevé déplace dans le projet

| Ce que le corpus supposait | Ce que le relevé établit |
| --- | --- |
| Le service manque | Il existe, y compris localement, depuis plus de deux ans, à environ huit euros par an |
| L'adaptativité est une fonctionnalité à coder | C'est un problème de données, dont le coût d'amorçage se compte en dizaines de milliers de passages |
| Candidats et recruteurs forment un public | Ce sont deux publics dont les intérêts s'opposent sur l'objet même du produit |
| Le contenu se gère | Le contenu **est** le produit, et son origine n'est nulle part |

---

## 8. Ce que ce relevé ne fait pas

Il ne prononce aucune issue et n'inscrit aucune décision. Il n'établit pas que les quatre plateformes relevées **soient réellement adoptées** : leur existence et leurs tarifs sont documentés, leur audience ne l'est pas, et les chiffres de `psychotechniquetest.fr` sont des déclarations d'éditeur non auditées.

Il ne qualifie juridiquement ni le nom, ni la réutilisation d'annales : ces deux points excèdent un relevé documentaire et sont portés au [[Psycho-pass/10-etudes/Programme d'études|Programme d'études]].

Il n'a pas ouvert le fichier `cdc/CAHIER DES CHARGES FONCTIONNEL ET TECHNIQUE.pdf`, dont la version Markdown de même titre a seule été lue.

---

## Sources

Toutes consultées le **2026-09-09**.

**Acteurs**

- [Prépa Concours-BF, page des tests psychotechniques](https://www.prepaconcoursbf.com/index.php/guruPrograms/3-concours-directs/122-tests-psychotechniques-sujets-psychotechniques-logique-verbale-numerique-aptitude-raisonnement-orthographe-grammaire-conjugaison)
- [Psychotechnique France](https://psychotechniquetest.fr/)
- [Concours-Formation, tests psychotechniques gratuits](https://concours-formation.fr/tests-psychotechniques-gratuits/)
- [Psychotechniqua, tests pour concours](https://www.psychotechniqua.com/test-psychotechnique-concours/)
- [Concours-Formation, tests psychotechniques en recrutement d'entreprise](https://concours-formation.fr/tests-psychotechniques-recrutement-entreprises/) — recense les éditeurs
- [SHL, catalogue d'évaluations](https://www.shl.com/products/assessments/)

**Calibration et tests adaptatifs**

- [Ertuna, Glas et Atar, *A Comparison of Item Selection Methods and Parameter Estimation Approaches for Online Calibration in Computerized Adaptive Testing*, 2026](https://doi.org/10.1177/00131644261478843)
- [Shen et coll., *A two-step item bank calibration strategy based on 1-bit matrix completion for small-scale computerized adaptive testing*, British Journal of Mathematical and Statistical Psychology, 2024](https://bpspsychub.onlinelibrary.wiley.com/doi/10.1111/bmsp.12340)
- [*Accounting for item calibration error in computerized adaptive testing*, PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC11947018/)

**Effets d'entraînement et de repassage**

- [Hausknecht et coll., *Retesting in Selection: A Meta-Analysis of Coaching and Practice Effects for Tests of Cognitive Ability*, Cornell eCommons](https://ecommons.cornell.edu/bitstreams/4fbba765-0d9c-4940-8492-66fecaca5227/download)
- [Scharfen et coll., *Retest effects in cognitive ability tests: a meta-analysis*](https://gwern.net/doc/iq/2018-scharfen.pdf)
- [Woods et coll., *A critical review of the use of cognitive ability testing for selection*, Journal of Occupational and Organizational Psychology, 2024](https://bpspsychub.onlinelibrary.wiley.com/doi/10.1111/joop.12470)

**Nom**

- [*Psycho-Pass*, Wikipédia anglophone](https://en.wikipedia.org/wiki/Psycho-Pass)
- [*Psycho-Pass*, Science Fiction Encyclopedia](https://sf-encyclopedia.com/entry/psycho-pass)
