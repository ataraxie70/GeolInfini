---
projet: "Psycho-pass"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 12
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - Psycho-pass
  - pilotage
  - statuts
---

# Registre des statuts

Table de référence de tout ce que le projet affirme. Une affirmation absente de ce registre n'a **aucun statut** et ne peut fonder aucune décision.

## Échelle employée

| Statut | Sens | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée, mesure reproductible ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Position de conception assumée | Se respecte ou s'abandonne explicitement, ne se prouve pas |
| **Possibilité** | Trajectoire conservée ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au journal | Engage |

---

## 1. Faits — établis et vérifiables

### 1.1. Faits sur le corpus lui-même

Tous vérifiés le 2026-09-09 par inspection directe des fichiers, avant leur déplacement.

| # | Fait | Comment il a été établi |
| --- | --- | --- |
| `F1` | Le corpus a été produit en **deux séances** : le 2026-05-15 de **12 h 51 à 18 h 04**, puis le 2026-05-16 de **17 h 16 à 18 h 05** | Horodatages de modification, relevés fichier par fichier |
| `F2` | Le dépôt Git ne porte **aucun commit**. La branche `main` existe ; ses 22 entrées sont non suivies | `git log` retourne *« votre branche actuelle 'main' ne contient encore aucun commit »* |
| `F3` | Le code applicatif compte **13 fichiers source**. Le backend chargé par l'application expose **un seul contrôleur**, celui de l'état de santé | Recensement des fichiers `.ts`, `.tsx` et `.prisma` hors dépendances et hors cache ; lecture de `apps/backend/src/app.module.ts` |
| `F4` | Les **quatre derniers fichiers écrits** du projet — modules `prisma` et `users` du 2026-05-16 — sont placés à `apps/backend/apps/backend/src/`, chemin **doublement imbriqué**, et `UsersModule` n'est importé par aucun module de l'application | Comparaison des chemins et lecture des imports de `app.module.ts` |
| `F5` | Le cache de compilation `apps/frontend/.next` occupait **51 Mo** pour **deux fichiers source** d'interface | Mesure de volume et recensement des sources |
| `F6` | Un fichier `.env` **renseigné** — chaîne de connexion de base de données, deux secrets de signature de jetons — résidait dans le coffre. Il diffère de `.env.example` et ne porte pas de valeur de remplacement | Comparaison des deux fichiers ; les valeurs n'ont pas été transcrites |
| `F7` | L'archive `Psycho-pass.zip` est un **état antérieur strict** de `prod-docs` : sur 13 fichiers communs, **7 identiques et 6 divergents**, et **aucun fichier ne lui est propre**. Les divergences resserrent des choix — *« Node.js avec Express ou NestJS »* devient *« NestJS avec Node.js et TypeScript »* | Comparaison par empreinte SHA-256, fichier à fichier, puis lecture des différences |

> [!important] Ce que `F1` à `F4` établissent ensemble
> Le projet a produit une documentation de conception complète — cinq RFC, deux MUST, un backlog, un pack pédagogique de onze documents — puis s'est arrêté **au premier module métier réel**, écrit à un emplacement où l'application ne peut pas le charger, et jamais raccordé.
> Ce n'est pas un jugement porté sur le travail : c'est l'état où il s'est interrompu, et il est daté. Son interprétation, elle, n'est pas établie — voir l'hypothèse `H6`.

### 1.2. Faits sur le terrain, établis par le benchmark

Sources citées au [[Psycho-pass/10-etudes/Benchmark et état de l'art|Benchmark et état de l'art]], toutes consultées le 2026-09-09.

| # | Fait | Portée |
| --- | --- | --- |
| `F8` | **Le terrain est occupé jusque dans le territoire le plus probable.** Au moins quatre plateformes francophones vendent la préparation aux tests psychotechniques, dont **`prepaconcoursbf.com` au Burkina Faso**, active depuis novembre 2021, qui propose le module psychotechnique en questionnaire à choix multiples pour **5 000 FCFA par an**, payable par Orange Money, ajouté le 2024-01-03 | Décisif — le corpus ne cite aucun concurrent |
| `F9` | `psychotechniquetest.fr` annonce **plus de 820 tests**, **plus de 10 000 candidats accompagnés**, des offres à **49 €**, et se positionne **par éditeur de test** et **par employeur** | Déclaratif d'éditeur, non audité |
| `F10` | La calibration d'une banque d'items pour un test **réellement adaptatif** exige de l'ordre de **250 à 500 réponses par item**, les gains d'exactitude étant substantiels de 250 à 500 et décroissants au-delà. Les échantillons de 100 à 300 produisent des erreurs de calibration élevées | Décisif — porte sur la fonction distinctive revendiquée |
| `F11` | Le regain de score au repassage d'un test d'aptitude cognitive est estimé à **d = 0,26** sans préparation et **d = 0,64** avec préparation. La littérature pose explicitement que ce gain peut refléter l'**habileté à passer le test** plutôt que l'aptitude mesurée | Décisif — porte sur la valeur vendue |
| `F12` | **`Psycho-Pass` est une série animée japonaise** de Production I.G, diffusée d'octobre 2012 à mars 2013. Dans la fiction, le « Psycho-Pass » est l'évaluation produite par un système qui mesure en continu l'état mental des citoyens et en tire un « coefficient de criminalité » | Porte sur le nom, non sur le produit |

---

## 2. Hypothèses — à instruire, avec leur condition de fausseté

| # | Hypothèse | Origine | Ce qui l'invaliderait |
| --- | --- | --- | --- |
| `H1` | Les candidats subissent une **dispersion** des ressources d'entraînement entre plusieurs sites | `cdc/psycho_pass_cahier_des_charges_mvp.md`, point 4 — énoncé sans source | Que les candidats interrogés nomment spontanément une ou deux ressources et s'en satisfassent |
| `H2` | Les candidats reçoivent **peu de retours sur leurs erreurs** | Même source | Que les ressources employées fournissent déjà des corrigés, ce que `F8` et `F9` rendent probable |
| `H3` | La difficulté des ressources existantes est **mal calibrée** | Même source | Que les candidats ne rapportent pas ce grief, ou qu'ils ne sachent pas l'évaluer |
| `H4` | Les candidats n'ont **aucune vision claire de leurs progrès** | Même source | Que le score brut d'un test blanc leur suffise |
| `H5` | Une difficulté qui s'ajuste aux réponses **apporte une valeur perçue** supérieure à une progression fixe | Point 5 du cahier des charges — posé comme principe | Que les candidats préfèrent une difficulté **prévisible et calquée sur l'épreuve réelle**, ce que la logique du concours rend plausible |
| `H6` | L'arrêt du travail établi par `F4` traduit un **abandon**, et non une interruption | Aucune — hypothèse formée à la lecture des dates | Une reprise du travail, ou une raison externe documentée. **Deux lectures opposées restent ouvertes** : une conception qui s'épuise à la première difficulté d'exécution, ou une interruption sans rapport avec le projet |

> [!warning] Le corpus présente `H1` à `H4` comme des constats
> Ils sont ici **rétrogradés en hypothèses**. Aucun des 38 fichiers archivés ne cite d'enquête, de mesure ou d'entretien. Cette rétrogradation déplace le projet de la phase d'architecture vers la phase d'étude.

---

## 3. Principes de conception — assumés, non prouvés

| # | Principe | Origine | Observation |
| --- | --- | --- | --- |
| `P1` | **Le frontend affiche, le backend décide** — le score, la difficulté et les permissions sont établis côté serveur, jamais recalculés côté client | `README` du dépôt et `RFC-001`, point 4.2 | **La contribution la plus solide du corpus.** Elle est motivée : un score consultable est un score qu'un utilisateur peut vouloir falsifier |
| `P2` | La logique métier est **testée et versionnée** avant d'être livrée | `must/psycho_pass_must_002_securite_qualite.md` | Arbitrage assumé, non instruit |
| `P3` | L'interface doit fonctionner sur ordinateur, tablette et téléphone | `cdc/Cahier des Charges — Plateforme.md`, point 1 | Arbitrage assumé. Le territoire n'étant pas décidé, sa portée réelle est indéterminée |

---

## 4. Possibilités — ouvertes, jamais sélectionnées

**Publics** — étudiants · candidats aux concours · recruteurs · centres de formation · écoles · entreprises. Six publics énumérés par le cahier des charges sans hiérarchie ni premier bénéficiaire nommé.

**Territoires** — aucun n'est nommé nulle part dans le corpus. Le fait `F8` rend le Burkina Faso probable, sans que rien ne l'établisse.

**Modèles économiques** — aucun n'est évoqué. Le corpus range explicitement *paiement et abonnement* hors du produit minimal, sans dire ce qui les remplace.

**Origine du contenu** — le corpus décrit une interface d'administration permettant d'ajouter des questions. Il ne dit **jamais** d'où viennent les questions, qui les écrit, ni à quel rythme.

---

## 5. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[Psycho-pass/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 5 — `DEC-C-057` à `DEC-C-061` | Idem, toutes de rangement ou de méthode |

Aucune affirmation du présent registre, hormis les faits, n'atteint le statut de décision.
