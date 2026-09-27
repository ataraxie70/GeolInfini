---
projet: "synapse"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'idée à l'implémentation, et critère qui déverrouille chaque phase"
maturite: "Intention et étude de faisabilité — aucune décision de projet inscrite"
phases_peuplees: "00 · 10"
cree_le: 2026-09-07
tags:
  - synapse
  - pilotage
  - phases
---

# Carte des phases

Le chemin complet que suit `synapse`, de l'intention jusqu'au code. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent physiquement sur le disque.**

> [!important] La création d'un dossier de phase est une décision
> Elle s'inscrit au [[synapse/90-pilotage/Journal des décisions|Journal des décisions]]. L'arborescence actuelle est fixée par `DEC-C-025`.

---

## État des phases

| Dossier | Contenu attendu | Statut | Document qui l'ouvre |
| --- | --- | --- | --- |
| `00-intention` | Vision, intention fondatrice, problématique, périmètre | **Ouverte** | [[Vision, domaines et architecture cible]] · [[Inclusion des compétences non formelles]] |
| `10-etudes` | Analyse, faisabilité, contexte vérifié, critères, séquence | **Ouverte** | [[Dossier de faisabilité]] |
| `20-cadrage-strategique` | Valeur, marché initial, position, modèle économique | **Traversée sans dossier** | Aucun document propre — voir ci-dessous |
| `30-ddd-strategique` | Domaines, contextes bornés, *context map*, langage ubiquitaire | **Amorcée sans dossier** | Neuf domaines métiers au point 7 de la référence globale, sans carte des contextes |
| `40-ddd-tactique` | Agrégats, entités, objets-valeurs, événements, invariants | **Jamais abordée** | Aucun agrégat, aucun événement, aucun invariant modélisé |
| `50-architecture` | ADR, données, hébergement, sécurité | **Traversée deux fois, de façon contradictoire** | Aucun document propre — voir ci-dessous |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | **Verrouillée** | Aucune ligne de code |
| `90-pilotage` | Journal des décisions, registre des statuts, cartes | **Ouverte** | — |
| `99-sources` | Empreintes et provenance | **Ouverte** | — |

> [!danger] Le profil de phases est le plus resserré du coffre, et le corpus couvre pourtant bien davantage
> `synapse` n'ouvre que `00` et `10`. Ce n'est pas un signe de retard : ses trois documents traitent conceptuellement des domaines métiers, de la sécurité, de la performance, de l'accessibilité, de la gouvernance et de l'architecture. **Aucun de ces sujets n'a de document propre**, et un dossier de phase ne s'ouvre que par un document livré.
> La maturité réelle du projet est celle de `10-etudes` : une faisabilité instruite, un noyau proposé, **aucune décision inscrite**.

> [!warning] `20-cadrage-strategique` est traversée à l'intérieur du dossier de faisabilité
> Le cadrage stratégique de `synapse` existe, mais il est **réparti dans les points 4, 8, 9, 10 et 11 du [[Dossier de faisabilité]]**, jamais rassemblé dans un document propre.
>
> | Question de cadrage | Où elle est traitée |
> | --- | --- |
> | Moyens et périmètre atteignable | Point 4 — trois scénarios `A`, `B`, `C` ; le dossier est écrit dans l'hypothèse `A`, la seule qui ne dépende d'aucune décision extérieure |
> | Contraintes décisives non techniques | Point 8 — équipe, hébergement, chemin critique administratif, couverture territoriale, financement récurrent |
> | Périmètre de démarrage | Point 9 — sept composants, neuf à douze mois |
> | Trajectoire | Point 10 — cinq étapes, chacune conditionnée à un usage mesuré |
> | Ce qui bloque encore | Point 11 — six points de décision restants |
>
> **Conséquence de pilotage.** Un dossier `20-cadrage-strategique` ne devra être créé que pour accueillir le document qui **tranche** ces six points — pas pour ranger l'existant.

> [!warning] `50-architecture` est traversée deux fois, et les deux versions se contredisent
> Les points 15 à 20 de [[Vision, domaines et architecture cible]] décrivent une pile distribuée : micro-frontends, quatre langages backend, gRPC interne, CQRS, bus d'événements, architecture en cellules, Elasticsearch, Redis, Zero Trust avec mTLS interne.
> Le point 6 du [[Dossier de faisabilité]] reprend cette pile **ligne par ligne** et la réduit : *« monolithe modulaire, frontières métier strictes dans le code, PostgreSQL comme socle, un seul langage backend, extraction en services uniquement lorsqu'une frontière démontre son besoin par la mesure »*.
> Les deux textes coexistent, **aucun arbitrage n'est inscrit**. C'est la divergence la plus lourde du corpus, et elle est portée au point 4 du [[synapse/90-pilotage/Registre des statuts|Registre des statuts]].

---

## La séquence en cinq étapes — un dispositif proposé, non engagé

Le point 10 du [[Dossier de faisabilité]] propose la seule trajectoire écrite du projet. Sa règle tient en une phrase : *« aucune étape ne s'ouvre parce que la précédente est techniquement terminée. Elle s'ouvre parce que la précédente a produit un usage mesuré. »*

> [!warning] Cette trajectoire est la proposition d'un document qui se déclare non contractuel
> Elle est reproduite ici parce qu'elle est le seul dispositif de progression que le corpus ait formulé. **Rien n'engage `synapse` à la suivre.**

| Étape | Contenu | Condition de passage |
| --- | --- | --- |
| **1** | Noyau du point 9, un établissement, agenda national | Dépôt effectif de documents et usage réel de l'agenda |
| **2** | Extension à d'autres établissements, ouverture aux employeurs | Des opportunités sont publiées par des tiers |
| **3** | Pilote preuve de terrain — un métier, une ville, sous convention | Réponse aux quatre questions du point 10.2 de [[Inclusion des compétences non formelles]] |
| **4** | Articulation avec le SP/CNC, passage vers le niveau `N4` | Titres effectivement délivrés à des profils issus du système |
| **5** | Fédération WURI, matching, communautés | Volume atteint et mandat obtenu |

### Le noyau que l'étape 1 doit livrer

Sept composants, estimés livrables en neuf à douze mois dans l'hypothèse `A` : identité et comptes avec champ d'identifiant national prévu mais non bloquant · profil et portfolio à historique non effaçable · dépôt, indexation et recherche de mémoires et de thèses sur un à deux établissements, avec embargo · agenda national des événements de savoir · preuves de niveaux `N0` à `N2` avec attestations nominatives et **sans score agrégé** · publication d'opportunités, candidature et recherche à facettes · journal d'audit, `RBAC` et séparation entre consultation agrégée et consultation nominative.

---

## Le chemin critique n'est pas technique

Le point 8.3 du [[Dossier de faisabilité]] est le constat le plus structurant du corpus : **quatre actes administratifs conditionnent l'essentiel du périmètre, et aucun ne dépend du code.**

| Acte | Ce qu'il conditionne |
| --- | --- |
| Convention avec le SP/CNC | L'articulation avec la certification, donc le niveau `N4` |
| Décision de dépôt des mémoires et thèses, au moins dans un établissement | Le composant central du noyau |
| Autorisation d'accès à l'identifiant WURI | L'étape 5 |
| Désignation des agents habilités au constat de terrain | Le niveau `N3`, donc l'axe des compétences non formelles |

*« Tous doivent être engagés en parallèle du développement, non après. »* Aucun n'est engagé à ce jour.

---

## Ce qui déverrouille `60-implementation`

| Verrou | Ce qu'il faut pour le lever |
| --- | --- |
| **Aucun langage backend n'est choisi** | Le point 6.2 refuse explicitement d'arbitrer sur des critères de performance : le choix dépend de *« ce que l'équipe réellement recrutable à Ouagadougou maîtrise déjà »*. Il suppose donc de connaître l'équipe |
| **L'équipe n'est pas connue** | Point 11 — « quelle équipe réellement disponible » détermine le langage, la pile et le périmètre atteignable |
| **L'architecture n'est pas arbitrée** | Deux versions coexistent ; un document doit trancher, et il ouvrira `50-architecture` |
| **La structure porteuse n'est pas déterminée** | Point 11 — elle conditionne les quatre actes administratifs |
| **Les profils de mineurs ne sont pas instruits** | Point 11 et point 2.2 : préalable légal **avant** toute collecte concernant des élèves, au regard de la loi n°001-2021/AN |
| **Un critère d'autorisation de décision** | `synapse` n'en a aucun : ni jalon, ni niveau de preuve exigé. La séquence du point 10 conditionne le passage d'une étape à l'autre, pas le droit de décider |

---

## Règles de franchissement

1. Une phase ne s'ouvre que par un **document livré** qui en porte le contenu, pas par anticipation.
2. Le franchissement est inscrit au [[synapse/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les mesures qui le fondent.
3. Une étape de la séquence se franchit sur un **usage mesuré**, jamais sur un achèvement technique — c'est la règle du point 10 du dossier de faisabilité.
4. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
5. **Peupler un dossier de phase n'ouvre rien.** Un document rangé en `10-etudes` reste une proposition tant qu'aucune décision ne l'a arrêté — `DEC-C-014`.
