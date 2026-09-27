---
projet: "levelup"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est FAIT, ce qui est HYPOTHÈSE, ce qui est POSSIBILITÉ, ce qui est DÉCISION"
regle: "Aucune promotion silencieuse de statut"
source: "Extraction du corpus hérité et du Document fondateur d'intention V0.1"
cree_le: 2026-09-08
tags:
  - levelup
  - pilotage
  - statuts
  - falsifiabilite
---

# Registre des statuts

Tableau de bord de la doctrine. Chaque affirmation du projet est rangée dans **un seul** statut, avec sa source.

> [!info] Ce document n'invente rien
> Il extrait et classe ce que portent le corpus archivé en [[levelup/99-sources/Sources originales|99-sources]] et le [[levelup/00-intention/Document fondateur d'intention|Document fondateur d'intention]]. Aucune affirmation, aucun chiffre n'y est ajouté.
> Il porte en revanche un **jugement de statut**, et c'est sa fonction : le corpus hérité présente comme des constats des affirmations qui n'ont aucune source. Le registre les range là où elles doivent l'être.

## Échelle de statut

| Statut | Définition | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Position de conception assumée, à respecter ou à abandonner explicitement | Contraint la conception, ne prouve rien |
| **Possibilité** | Trajectoire conservée ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au [[levelup/90-pilotage/Journal des décisions\|Journal des décisions]] | Engage |

---

## 1. Faits

| # | Fait | Source | Fiabilité |
| --- | --- | --- | --- |
| F1 | Le corpus hérité compte **303 documents**, dont une architecture d'entreprise développée : 4 notes de fondation, 11 d'architecture métier, 9 de DDD stratégique, 42 spécifications de contextes bornés, 5 de noyau partagé, 7 d'architecture d'intégration | Inventaire du 2026-09-08, empreinté | **Élevée** — recomptable |
| F2 | Le corpus existait en **trois copies concurrentes**, dont deux redondantes ; la copie retenue est un sur-ensemble à quatre fichiers près | Comparaison SHA-256, `DEC-C-039` | **Élevée** — vérifiable |
| F3 | Le corpus **ne cite aucune enquête, aucune mesure, aucun entretien, aucun état de l'art** des solutions existantes | Lecture de l'inventaire complet | **Élevée** — infirmable par production d'une source |
| F4 | Le corpus contient sa propre critique, qui relève **dix écarts**, tous situés en aval du métier — agrégats, données, applications, sécurité, infrastructure | `99-sources/variantes-du-corpus/Audit critique du corpus - variante copie.md` | Élevée sur l'existence, **nulle sur le contenu** : cet audit est sans source ni méthode déclarée |
| F5 | Le dossier pesait **5,6 Go pour 19 324 fichiers** avant assainissement, et **3,9 Mo pour 309 fichiers** après | Mesure du 2026-09-08, `DEC-C-037` | **Élevée** |
| F6 | Le porteur a construit **pour lui-même**, à la main, un tracker de validation à quatre niveaux de maîtrise, assorti d'une règle de validation en quatre conditions et de deux échéances de révision à 7 et 30 jours | `99-sources/essai-de-developpement/docs/ref/content/PACK ROADMAP — MAÎTRISE TECHNIQUE SYSTÈME/` | **Élevée** — l'instrument est lisible |
| F7 | **Ce tracker n'a jamais été rempli** : 354 cases vides, zéro sujet validé, zéro sujet en cours, aucune date saisie | Relevé du 2026-09-08, recomptable | **Élevée** — trace observée, **niveau 1** |

> [!warning] Ce que F1 ne dit pas
> Que le corpus soit volumineux et internement cohérent **ne dit rien de sa justesse**. Aucun de ses 303 documents ne repose sur une observation de terrain. Le volume est un fait ; la valeur ne l'est pas.

> [!danger] F6 et F7 sont la preuve la plus forte du dossier, et son ambiguïté centrale
> Le porteur a construit le système fantôme que `levelup` propose d'automatiser, puis ne l'a pas utilisé. C'est un **comportement observé**, de niveau 1, quand tout le reste du corpus relève du niveau 4.
> Deux lectures s'opposent et ne sont pas départagées. **Lecture favorable** : la tenue manuelle était trop coûteuse, ce qui est l'argument même de l'automatisation. **Lecture défavorable** : le besoin était plus faible que le plaisir de concevoir l'instrument — mode d'échec documenté des outils de productivité personnelle, qui expliquerait aussi bien les 354 cases vides que les 303 documents d'architecture.
> Le lot **L0** du [[levelup/10-etudes/Programme d'études|Programme d'études]] a pour seul objet de les départager. Il ne coûte ni autorisation, ni déplacement, ni recrutement, et il peut conclure défavorablement avant toute dépense.
>
> **F7 fournit par ailleurs ce que le corpus ne définit nulle part** : une définition opérationnelle de la preuve de compétence — *expliquer, reproduire, appliquer, corriger, sans aide*. C'est l'objet candidat au cœur du domaine, point 3 du programme.

---

## 2. Hypothèses en attente de test

### 2.1. Hypothèse centrale — la thèse du projet

| Champ | Contenu |
| --- | --- |
| **Énoncé** | Le coût d'accès à l'information ayant fortement baissé, la difficulté déterminante n'est plus de trouver le savoir mais de le **transformer en compétence démontrable** |
| **Statut** | **Hypothèse — non instruite** |
| **Ce qui l'invaliderait** | Que les personnes visées ne reconnaissent pas de valeur à une représentation **honnête, et donc moins flatteuse**, de leur progression, et préfèrent une représentation valorisante |
| **Observation** | Le corpus pose la rigueur comme une valeur ; il ne vérifie nulle part qu'elle est **désirée** par ceux à qui elle s'adresse. C'est la question la plus lourde de la reprise |
| **Source** | point 4 du [[levelup/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] |

### 2.2. Constats du corpus, rétrogradés en hypothèses

Le corpus les présente comme acquis. Aucun ne porte de source.

| # | Affirmation | Ce qui manque pour la tenir |
| --- | --- | --- |
| H1 | L'abondance d'information ne se traduit pas par une augmentation des compétences réelles | Une mesure, sur une population nommée |
| H2 | Les obstacles récurrents sont le point de départ, les fondations, la discipline, la mesure de progression, la confusion activité/apprentissage | Des entretiens, ou des traces d'abandon mesurées |
| H3 | Les outils existants sont fragmentés et ne partagent pas de modèle commun | Un recensement, y compris des échecs documentés |
| H4 | La discipline est essentielle à toute progression durable — **axiome A2 du corpus** | Affirmation sur le comportement humain, vérifiable et non vérifiée. Un axiome n'est pas une preuve |
| H5 | Un moteur indépendant du domaine est atteignable et utile — **axiome A5** | La preuve de compétence n'a pas la même forme en programmation, en droit ou en menuiserie. Hypothèse coûteuse posée comme point de départ |

---

## 3. Principes de conception

Contribution la plus solide du corpus hérité. Ils n'ont pas à être prouvés ; ils ont à être respectés, ou abandonnés par une décision explicite.

| # | Principe | Conséquence |
| --- | --- | --- |
| P1 | **Faire ≠ comprendre** | Le système ne peut pas déduire une compétence d'une activité enregistrée |
| P2 | **Comprendre ≠ maîtriser** | La progression est un processus, jamais un état atteint |
| P3 | **Représentation ≠ preuve** | Les mécanismes de jeu sont une couche d'affichage, jamais une couche de vérité |
| P4 | **Vérité avant motivation** | Le système ne donne jamais l'illusion d'une maîtrise inexistante |
| P5 | **Une compétence n'est reconnue qu'à partir de preuves observables** | Principe le plus structurant. C'est aussi celui qui recouvre `synapse` — voir le point 5 |

Source : `99-sources/corpus-architecture/Foundation/03-Progression-Philosophy.md` point 6, point 7, point 9, et `01-Core-Identity.md` axiomes A7 à A9.

---

## 4. Possibilités ouvertes — aucune n'est sélectionnée

| Sujet | Possibilités énumérées par le corpus |
| --- | --- |
| Public initial | Étudiant · professionnel · autodidacte · organisation · établissement d'enseignement · centre de formation · entreprise — **sept, aucun hiérarchisé** |
| Degré d'universalité | Moteur universel dès le départ · un domaine d'abord, universalité en cible · spécialisation assumée |
| Rôle de l'intelligence artificielle | Accélérateur d'accès · orchestrateur de parcours · évaluateur — le corpus revendique le premier et esquisse les deux autres |
| Modèle de preuve | Le corpus exige la preuve observable sans jamais définir ce qui en constitue une |
| Horizon | Produit · infrastructure ouverte fédérant des parcours de plusieurs institutions |

Le **modèle de preuve** est la possibilité la plus lourde : le projet repose sur le principe P5 et ne dit nulle part ce que le système accepterait comme preuve.

---

## 5. Frontières et recouvrements

| Projet | Nature du recouvrement | Portée |
| --- | --- | --- |
| `synapse` | Sa chaîne structurante est *identité → compétence → **preuve → validation** → réputation → visibilité → opportunité*. Les maillons **compétence, preuve, validation** sont l'objet du principe P5 de `levelup` | **Direct.** Deux projets du même coffre modélisent la preuve de compétence sans se citer |
| `ecoFab` | Son point 12 revendique la connaissance, l'apprentissage collectif et les communautés disciplinaires | **Partiel.** Porte sur les parcours et les ressources, non sur la preuve |

> [!danger] Le partage `levelup` / `synapse` est une possibilité, pas une décision
> Une frontière plausible existe — `levelup` **produit** la compétence et sa preuve, `synapse` les **certifie et les met en relation** — et `synapse` s'écarte explicitement d'être un LMS, ce qui la rend praticable. Elle n'est pour autant ni instruite, ni arbitrée, ni inscrite à aucun journal.
> Elle doit être portée à [[Cartographie du portefeuille]] et tranchée **avant** que l'un des deux projets ne modélise son noyau. Modéliser deux fois la preuve de compétence, puis découvrir qu'il fallait un seul socle, est le risque que la cartographie du portefeuille existe pour éviter.

---

## 6. Décisions

**Décisions de projet : néant.** Voir [[levelup/90-pilotage/Journal des décisions|Journal des décisions]].

Le [[levelup/10-etudes/Programme d'études|Programme d'études]] est ouvert depuis le 2026-09-08 (`DEC-C-047`). **Aucun lot n'est lancé** : le lancement de la vague 0 est lui-même une décision à journaliser.

Cinq décisions de coffre sont actives — `DEC-C-037` à `DEC-C-041` — et portent toutes sur le rangement, jamais sur le produit.

Restent suspendus, y compris là où le corpus hérité contient une réponse écrite : le nom du produit, le premier public, le premier domaine, le périmètre du produit minimal, le degré d'universalité, le modèle de preuve, le rôle de l'intelligence artificielle, le *Core Domain*, le découpage en contextes bornés, l'architecture, la pile technique, le modèle économique et le sort du code sorti du coffre.
