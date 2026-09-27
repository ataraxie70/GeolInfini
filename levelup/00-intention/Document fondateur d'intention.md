---
projet: "levelup"
type: "document-fondateur"
phase: "00-intention"
version: "0.1"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de levelup, réécrite depuis le corpus hérité, avec le statut de chaque affirmation"
source_du_fond: "99-sources/corpus-architecture/Foundation — quatre notes"
corpus_herite: "Référence, non opposable"
cree_le: 2026-09-08
tags:
  - levelup
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `levelup` depuis l'intention. Il ne transforme aucune idée en exigence, ne valide aucun acquis du corpus hérité et ne prend aucune décision.
> Il est **réécrit**, non recopié. Chaque affirmation matérielle porte sa source dans le corpus archivé et son **statut** : fait, hypothèse, possibilité. Ce qui a été écarté est nommé et motivé au point 9.

---

## 1. Objet et principe de lecture

`levelup` possédait, avant son entrée dans le coffre, un corpus de 303 documents comprenant une architecture d'entreprise, un découpage en contextes bornés, des spécifications d'intégration et deux essais de développement. Ce corpus a été produit hors de la doctrine du coffre : il n'énonce pas le statut de ses affirmations, ne dit pas ce qui l'invaliderait, et ne distingue pas le monde observé du monde imaginé.

La reprise consiste donc à **repartir de l'intention** et à réinstruire la chaîne dans l'ordre, en se servant du corpus comme matériau. Le présent document est le premier maillon.

Trois règles gouvernent ce qui suit, reprises des conventions du coffre.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Le présent document relève presque entièrement du monde imaginé.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus hérité ne lui confère aucun statut. Elle est ici reprise, et son statut est fixé explicitement.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

### 1.1. Échelle de statut employée

| Statut | Sens | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Possibilité** | Trajectoire conservée ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au journal | Engage |

Aucune affirmation du présent document n'atteint le statut de décision.

---

## 2. L'intention fondatrice

> **Rendre visible, mesurable et durable la progression réelle d'un individu, dans n'importe quel domaine de connaissance ou de pratique.**

Source : `corpus-architecture/Foundation/01-Core-Identity.md`, point 1. **Statut : intention** — elle n'a pas à être vraie, elle a à être tenue.

L'objet visé est un **moteur de progression**, distinct par nature d'un gestionnaire de tâches et d'une plateforme de diffusion de contenu. La distinction porte sur ce que le système prétend représenter : non pas des actions accomplies, mais une capacité acquise.

L'intention se décline en une mission et une devise, toutes deux issues de la même source :

- **Mission** — permettre à une personne de développer des compétences réelles par une approche structurée fondée sur la discipline, la rigueur et la maîtrise progressive des fondamentaux.
- **Devise architecturale** — *« La discipline construit les fondations. Les fondations rendent la progression durable. »*

---

## 3. Le constat qui motive l'intention

Source : `corpus-architecture/Foundation/02-Vision-Programe.md` point 2 et `03-Business-Motivation.md` point 1 à point 4.

| # | Constat | Statut | Ce qui manque pour le tenir |
| --- | --- | --- | --- |
| C1 | L'accès à l'information est devenu abondant et peu coûteux, notamment par l'intelligence artificielle | **Fait** — observable, mais aucune source n'est citée dans le corpus | Une source datée ; le constat est banal, sa **quantification** ne l'est pas |
| C2 | Cette abondance ne se traduit pas automatiquement par une augmentation des compétences réelles | **Hypothèse** — présentée comme un constat, jamais mesurée | Une mesure, sur une population nommée |
| C3 | Les obstacles récurrents sont : savoir par où commencer, construire des fondations, tenir une discipline, mesurer une progression réelle, distinguer l'activité de l'apprentissage | **Hypothèse** — liste d'intuitions, aucune enquête | Des entretiens, ou des traces d'abandon mesurées |
| C4 | La valeur se déplace de la possession du savoir vers sa transformation en capacité | **Hypothèse — c'est la thèse du projet** | Voir le point 4 |
| C5 | Les outils existants sont fragmentés et ne partagent pas de modèle commun | **Hypothèse** — aucun recensement dans le corpus | Un état de l'art, y compris des échecs |

> [!danger] Le corpus hérité présente C2 à C5 comme des constats
> Ils sont ici **rétrogradés en hypothèses**. Aucune des 303 sources archivées ne cite d'enquête, de mesure ou d'entretien. Cette rétrogradation est le principal effet de la reprise sur le fond, et elle n'est pas cosmétique : elle déplace le projet de la phase d'architecture vers la phase d'étude.

---

## 4. La thèse, énoncée de façon falsifiable

> **X** — Le coût d'accès à l'information ayant fortement baissé, la difficulté déterminante n'est plus de trouver le savoir mais de le **transformer en compétence démontrable**. Un système qui structure cette transformation, et qui refuse d'afficher une maîtrise qu'il ne peut pas prouver, apporte une valeur que ni un gestionnaire de tâches, ni une plateforme de contenu, ni un assistant conversationnel n'apportent.
>
> **Le marché agit comme si non-X** — l'essentiel de l'offre continue de se concentrer sur l'accès au contenu et sur la gratification, et non sur la preuve de compétence.

**Statut : hypothèse — non instruite.**

**Condition de fausseté**, à formuler avant toute étude : si les personnes visées ne reconnaissent pas de valeur à une représentation *honnête et donc moins flatteuse* de leur progression, et préfèrent une représentation valorisante, la thèse tombe entièrement. Le corpus hérité pose la rigueur comme une valeur ; il ne vérifie jamais qu'elle est **désirée** par ceux à qui elle s'adresse.

C'est la question la plus lourde que la reprise ait à instruire, et le corpus hérité ne la pose nulle part.

---

## 5. Les distinctions fondatrices

Source : `corpus-architecture/Foundation/03-Progression-Philosophy.md`, point 6, point 7 et point 9. Ces trois distinctions sont la contribution la plus solide du corpus hérité. **Statut : principes de conception** — elles n'ont pas à être prouvées, elles ont à être respectées ou abandonnées explicitement.

| Distinction | Énoncé | Conséquence de conception |
| --- | --- | --- |
| **Faire ≠ comprendre** | Exécuter une tâche ne démontre pas la compréhension ; lire un chapitre ne garantit pas sa maîtrise | Le système ne peut pas déduire une compétence d'une activité enregistrée |
| **Comprendre ≠ maîtriser** | La maîtrise exige une pratique répétée et une capacité de réemploi en contexte varié | La progression est un processus, jamais un état atteint |
| **Représentation ≠ preuve** | Niveaux, badges, points d'expérience et arbres de progression facilitent l'engagement ; ils ne prouvent rien | Les mécanismes de jeu sont une couche d'affichage, jamais une couche de vérité |

Ces trois distinctions se ramènent à un principe unique, qui est le cœur du projet :

> **Une compétence n'est reconnue qu'à partir de preuves observables, et le système ne doit jamais donner l'illusion d'une maîtrise inexistante.**

Source : `01-Core-Identity.md`, axiomes A7 et A8, et principe *« Vérité avant motivation »*.

---

## 6. Les axiomes hérités

Le corpus énonce dix axiomes fondateurs (`01-Core-Identity.md`, point 6). Ils sont repris ici **sans être promus** : ils décrivent une position de conception, pas un résultat établi. Deux d'entre eux engagent lourdement et méritent d'être signalés.

| Axiome | Énoncé | Observation |
| --- | --- | --- |
| A1 | `levelup` est un moteur de progression, non un gestionnaire de tâches | Frontière d'identité |
| A2 | La discipline est essentielle à toute progression durable | **Hypothèse déguisée en axiome.** Affirmation sur le comportement humain, vérifiable, non vérifiée |
| A3 | La rigueur prime sur la vitesse de progression | Arbitrage assumé |
| A4 | Les fondations précèdent les notions avancées | Arbitrage assumé |
| A5 | Le moteur est indépendant du domaine étudié | **L'axiome le plus coûteux du projet.** Voir ci-dessous |
| A6 | Parcours, programmes, routines et missions sont des concepts métier distincts | Choix de modélisation |
| A7 | Une tâche réalisée ne constitue pas une preuve de compétence | Principe de vérité |
| A8 | Une compétence n'est reconnue qu'à partir de preuves observables | Principe de vérité — le plus structurant |
| A9 | Les mécanismes de jeu sont des représentations, non des preuves | Principe de vérité |
| A10 | La progression réelle prime sur la gratification immédiate | Arbitrage assumé |

> [!warning] A5 — l'universalité est une ambition, pas une propriété acquise
> *« Le moteur doit pouvoir fonctionner avec n'importe quel domaine de connaissance ou de pratique. »* Un moteur indépendant du domaine est plus difficile à construire, plus difficile à valider, et **plus difficile à rendre utile** qu'un moteur spécialisé : la preuve de compétence en programmation système, en droit ou en menuiserie n'a pas la même forme. L'universalité doit être instruite comme une hypothèse coûteuse, et non posée comme un point de départ. Un périmètre initial restreint à **un seul domaine**, avec l'universalité comme cible ultérieure, reste une possibilité entière.

---

## 7. Publics envisagés

Source : `02-Vision-Programe.md` point 3 et `03-Business-Motivation.md` point 6. **Statut : possibilités — aucune n'est sélectionnée.**

Étudiant · professionnel · autodidacte · organisation · établissement d'enseignement · centre de formation · entreprise.

Sept publics dont les besoins, les capacités de paiement et les exigences de preuve diffèrent radicalement. Le corpus les énumère sans les hiérarchiser et sans nommer de premier bénéficiaire. **Aucun marché initial n'est désigné**, ce qui est cohérent avec le stade du projet mais devra être tranché avant toute conception.

---

## 8. Frontières — ce que `levelup` n'est pas

Source : `03-Business-Motivation.md` point 8. Frontières de réflexion, pas interdictions techniques.

- Un gestionnaire de tâches — il ne se limite pas à organiser des actions.
- Une plateforme de formation — il ne se limite pas à diffuser du contenu.
- Un outil de gamification — il ne confond pas récompense et compétence.

---

## 9. Le corpus hérité — ce qu'il apporte, ce qu'il ne prouve pas

Le corpus archivé en [[levelup/99-sources/Sources originales|99-sources]] contient une architecture d'entreprise développée : quatre notes de fondation, onze notes d'architecture métier, neuf notes de DDD stratégique, quarante-deux spécifications de contextes bornés répartis en quatre paysages, cinq notes de noyau partagé, sept notes d'architecture d'intégration.

**Ce qu'il apporte** : un vocabulaire métier posé, un découpage en contextes bornés déjà réfléchi, et surtout les trois distinctions du point 5, qui sont la véritable contribution intellectuelle du projet.

**Ce qu'il ne prouve pas** : que quiconque a ce problème. Le corpus ne cite aucune enquête, aucune mesure, aucun entretien, aucun état de l'art des solutions existantes, et n'énonce jamais ce qui l'invaliderait. Une architecture d'entreprise construite sur des hypothèses non instruites reste une architecture d'entreprise construite sur des hypothèses non instruites, quelle que soit sa qualité interne.

**Ce qu'il contient sans le voir** : un instrument que le porteur a construit pour lui-même — un tracker de validation à quatre niveaux, assorti d'une règle en quatre conditions — et qu'il **n'a jamais rempli** : 354 cases vides, aucune validation, aucune date. C'est le seul comportement observé du dossier, et la seule preuve de niveau 1 qu'il contienne. Le point 2.2 du [[levelup/10-etudes/Programme d'études|Programme d'études]] l'instruit ; les faits F6 et F7 du [[levelup/90-pilotage/Registre des statuts|Registre des statuts]] le consignent.

### 9.1. Les dix écarts que le corpus s'attribue à lui-même

Le corpus contient sa propre critique — `variantes-du-corpus/Audit critique du corpus - variante copie.md` — qui relève dix écarts. Ils sont repris ici comme **constats à réinstruire**, non comme vérités : cet audit est rédigé à la première personne, sans source ni méthode déclarée.

Absence de conception des agrégats · absence d'*event storming* · absence de dictionnaire métier global · absence d'architecture de données · absence de couche applicative · absence d'architecture d'intelligence artificielle · absence de vue d'exécution · absence d'architecture de sécurité · contextes de plateforme insuffisamment justifiés face aux domaines cœur · maturité nulle sur l'infrastructure.

> [!note] Ce que l'audit hérité ne relève pas
> Ses dix écarts portent tous sur ce qui **manque en aval** — agrégats, données, applications, infrastructure. Aucun ne porte sur ce qui manque **en amont** : la preuve que le problème existe, le bénéficiaire nommé, le marché initial, le modèle économique, et l'état de l'art des solutions concurrentes. L'audit conclut d'ailleurs à « 10/10 » sur la vision et « 5/10 » sur la préparation au développement, sans jamais interroger le fondement de la vision elle-même. C'est le biais que la reprise a précisément pour objet de corriger.

---

## 10. Recouvrements avec les autres projets du coffre

> [!danger] Recouvrement direct avec `synapse`, à instruire avant toute conception
> `synapse` est défini comme une *« infrastructure de confiance, de visibilité, de preuve et de mise en relation du capital humain »*, structurée par la chaîne **identité → compétence → preuve → validation → réputation → visibilité → opportunité**.
> Les trois maillons **compétence, preuve, validation** sont exactement l'objet de l'axiome A8 de `levelup`. Deux projets du même coffre modélisent donc la preuve de compétence, sans se citer.
> `synapse` s'écarte explicitement d'être un LMS, ce qui laisse un partage possible — `levelup` **produit** la compétence et la preuve, `synapse` les **certifie et les met en relation**. Cette frontière est une **possibilité**, non une décision. Elle doit être portée à [[Cartographie du portefeuille]] et tranchée avant que l'un des deux ne modélise son noyau.

Un recouvrement plus faible existe avec `ecoFab`, dont le point 12 du document fondateur revendique la connaissance et l'apprentissage collectif. Il porte sur les parcours et les ressources, non sur la preuve de compétence, et paraît de second rang.

---

## 11. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

Le nom du produit et de la marque · le premier public et le premier domaine · le périmètre du produit minimal · le modèle économique · la forme juridique · le degré d'universalité effectivement visé · le modèle de preuve de compétence · le rôle exact de l'intelligence artificielle · le *Core Domain* · le découpage en contextes bornés · l'architecture applicative, de données et d'infrastructure · la pile technique · le sort du code sorti du coffre.

Le découpage en contextes bornés figure dans cette liste **bien qu'il existe dans le corpus hérité** : il y a été produit avant toute étude de terrain, et sa validité dépend d'hypothèses non instruites.

---

## 12. Ce que la reprise doit produire, et dans quel ordre

Le corpus hérité a été construit de l'architecture vers le métier. La reprise procède dans l'ordre inverse.

```
INTENTION  (le présent document)
   v
ÉTUDE — le problème existe-t-il, pour qui, et à quel coût le subit-il ?
   v
CADRAGE STRATÉGIQUE — bénéficiaire, marché initial, position défendable, secret
   v
DDD STRATÉGIQUE — Core Domain, contextes bornés, langage ubiquitaire
   v
DDD TACTIQUE — agrégats, invariants, événements
   v
ARCHITECTURE — décisions, données, sécurité, infrastructure
   v
IMPLÉMENTATION
```

La phase d'étude est ouverte depuis le 2026-09-08 : voir le [[levelup/10-etudes/Programme d'études|Programme d'études]], qui porte dix lots, quatre jalons et une variante à ressources contraintes. Il peut conclure que le projet **ne doit pas être construit**, et son jalon 1 est atteignable en trois semaines sans aucune dépense de terrain.

---

*Version 0.1 — ouverture de la reprise. Le corpus hérité reste consultable en `99-sources` et n'est opposable en rien.*
