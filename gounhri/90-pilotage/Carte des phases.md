---
projet: "gounhri"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'idée à l'implémentation, et critère qui déverrouille chaque phase"
maturite: "Cadrage stratégique et première étude de fond — aucune décision, volontairement"
phases_peuplees: "00 · 10 · 20"
cree_le: 2026-09-07
tags:
  - gounhri
  - pilotage
  - phases
---

# Carte des phases

Le chemin complet que suit `gounhri`, de l'intention jusqu'au code. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent physiquement sur le disque.**

> [!important] La création d'un dossier de phase est une décision
> Elle s'inscrit au [[gounhri/90-pilotage/Journal des décisions|Journal des décisions]]. L'arborescence actuelle est fixée par `DEC-C-030`.

---

## État des phases

| Dossier | Contenu attendu | Statut | Document qui l'ouvre |
| --- | --- | --- | --- |
| `00-intention` | Vision, intention fondatrice, questions ouvertes | **Ouverte** | [[Document d'ouverture]] |
| `10-etudes` | Protocole, terrain, mesures, hypothèses falsifiables | **Ouverte** | [[Dossier d'ingénierie humaine]] |
| `20-cadrage-strategique` | Valeur, scénarios, souveraineté, position, programme d'études | **Ouverte** | [[Dossier stratégique de cadrage]] |
| `30-ddd-strategique` | Domaines, contextes bornés, langage ubiquitaire | **Fermée** | Aucun domaine modélisé |
| `40-ddd-tactique` | Agrégats, entités, événements, invariants | **Fermée** | — |
| `50-architecture` | ADR, données, hébergement, sécurité | **Fermée** | Des possibilités explorées, **aucune retenue** — voir ci-dessous |
| `60-implementation` | Spécifications exécutables, code, tests | **Verrouillée** | Aucune ligne de code |
| `90-pilotage` | Journal, registre des statuts, cartes | **Ouverte** | — |
| `99-sources` | Originaux archivés, empreintes, provenance | **Ouverte** | — |

> [!success] `gounhri` est le seul projet du coffre à progresser sans discontinuité
> `00`, puis `10`, puis `20`. Là où `infUb` a livré `40` et `50` sans jamais ouvrir `20`, où `checkme` est allé jusqu'à `50` en sautant son cadrage, et où `synapse` disperse le sien dans un dossier de faisabilité, **`gounhri` a produit un document propre pour chacune des trois premières phases** — et s'est arrêté là.
> Ce n'est pas un hasard de rangement : c'est la méthode que le projet s'est donnée à lui-même.

> [!warning] `50-architecture` reste fermée alors que le corpus en parle beaucoup
> Les points 37 à 40 du [[Document d'ouverture]] et les points 10 à 13 du [[Dossier stratégique de cadrage]] explorent l'architecture conceptuelle, le choix entre centralisé, fédéré et hybride, l'interopérabilité, le socle open source. **Aucune de ces pistes n'est retenue** : le point 24 range explicitement l'architecture, le protocole et la pile technique parmi les décisions qui doivent rester ouvertes.
> Un dossier `50-architecture` ne devra être créé que pour accueillir le document qui **tranche**. Explorer n'est pas décider.

---

## Le projet s'est donné la même grille que le coffre

L'annexe B du [[Document d'ouverture]] énonce sa propre chaîne de conception, **avant toute mise en conformité** :

```text
CAPTURE DE L'INTENTION → ÉTUDES → HYPOTHÈSES → PREUVES → DÉCISIONS
        → DDD STRATÉGIQUE → ARCHITECTURE → CONCEPTION → IMPLÉMENTATION
```

C'est, aux étapes intermédiaires près, la grille de phases du coffre. Le même document ajoute la règle qui la rend opposable : *« Toute modification substantielle de l'intention devra être identifiable comme une évolution du projet et non comme une réécriture silencieuse de son origine. »*

Son point 44 pose par ailleurs une échelle de statuts — **faits, observations, hypothèses, possibilités, décisions** — assortie d'une consigne : *« Ces catégories ne doivent pas être mélangées. »* C'est exactement la doctrine du [[gounhri/90-pilotage/Registre des statuts|Registre des statuts]], et le [[Dossier d'ingénierie humaine]] l'applique jusque dans son texte, où chaque énoncé porte sa marque `[F]`, `[O]`, `[H]` ou `[I]`.

---

## La trajectoire proposée — douze étapes, non engagées

Le point 35 du [[Dossier stratégique de cadrage]] propose l'ordre recommandé des travaux. **« Construire » y occupe la onzième position sur douze.**

```text
1. Comprendre les usages réels          7. Tester auprès des utilisateurs
2. Formaliser le problème               8. Chiffrer l'économie
3. Cartographier les dépendances        9. Définir l'architecture cible
4. Définir les scénarios               10. Décider du produit réel
5. Étudier gouvernance + droit         11. Construire
6. Prototyper plusieurs hypothèses     12. Exploiter et mesurer
```

> [!warning] Cette trajectoire est une recommandation d'un document non décisionnel
> **Rien n'engage `gounhri` à la suivre**, et son point 34 exige par ailleurs **seize livrables** avant toute décision de construction à grande échelle — étude des usages, cartographie concurrentielle, étude de souveraineté, analyse juridique, modèle de coût, architecture de référence, *threat model*, modèle de gouvernance, prototype UX, prototype technique, rapport d'expérimentation terrain, *business case*, plan de déploiement, plan d'exploitation et de cybersécurité, analyse de dépendances critiques, modèle d'interopérabilité. **Un seul existe** : le [[Dossier d'ingénierie humaine]] couvre le premier.

### Le programme d'enquête qui ouvre réellement `10-etudes`

Le point 7.2 du [[Dossier d'ingénierie humaine]] découpe l'enquête en trois vagues, et désigne celle qui doit venir en premier :

| Vague | Durée | Objet | Priorité |
| --- | --- | --- | --- |
| **1 — Réplication expérimentale** | 2 à 3 mois, coût faible | Paramètres cognitifs et d'équipement : profondeur de navigation utilisable, **partage d'appareil par sexe et milieu**, ratio vocal/écrit, confiance déclarée envers les institutions | *« Devrait être lancée avant toute autre étude du programme »* |
| **2 — Ethnographie et cartographie sociale** | 6 à 9 mois | *Grins* et groupes numériques sur quatre sites contrastés, corridor migratoire vers la Côte d'Ivoire, radios de proximité, enquête de genre en protocole non mixte, audit de corpus de signalements | — |
| **3 — Prototypes concurrents** | 9 à 12 mois | Cinq prototypes testant des **hypothèses sociales**, pas des périmètres fonctionnels | — |

Le partage d'appareil est désigné comme **« la donnée manquante la plus importante du dossier »**.

---

## Ce qui déverrouille les phases suivantes

| Verrou | Ce qu'il faut pour le lever |
| --- | --- |
| **La question directrice n'est pas stabilisée** | Le point 10 du [[Dossier d'ingénierie humaine]] propose de la reformuler : non plus *« le Burkina Faso peut-il concevoir un espace social numérique souverain ? »* mais *« quelle relation sociale les Burkinabè entretiennent-ils aujourd'hui sans qu'aucun outil ne la serve correctement ? »*. La reformulation n'est pas actée |
| **L'hypothèse charnière n'est pas testée** | `H-01` : l'échec d'Ayoba tiendrait à son caractère générique, non à son caractère africain. *« Cette hypothèse est la charnière de tout le projet et doit être testée en priorité »* |
| **Aucune mesure de terrain n'existe** | La vague 1 n'est pas lancée. Dix-neuf hypothèses falsifiables sont écrites, **aucune n'est éprouvée** |
| **Les critères d'abandon ne sont pas adoptés** | Le point 9 du même document en propose cinq, dont un seuil de rétention *« fixé avant la mesure, et publié »*. Ils restent une proposition |
| **Le cadrage juridique et économique n'est pas fait** | Quinze des seize livrables du point 34 manquent |
| **Un critère d'autorisation de décision** | `gounhri` n'en a aucun. Ses documents disent abondamment ce qu'ils ne décident pas ; **aucun ne dit à quelle condition une décision deviendrait légitime** |

---

## Règles de franchissement

1. Une phase ne s'ouvre que par un **document livré** qui en porte le contenu, pas par anticipation.
2. Le franchissement est inscrit au [[gounhri/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les mesures qui le fondent.
3. **Une hypothèse ne devient un fait que par une mesure**, et le projet s'est donné les catégories pour le vérifier — point 44 du [[Document d'ouverture]].
4. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
5. **Peupler un dossier de phase n'ouvre rien** — `DEC-C-014`.
