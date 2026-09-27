---
projet: "MyWeather"
type: "document-fondateur"
phase: "00-intention"
version: "0.1"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de MyWeather, réécrite depuis le corpus hérité, avec le statut de chaque affirmation"
source_du_fond: "99-sources — deux séances des 2026-04-20 et 2026-04-21"
corpus_herite: "Référence, non opposable"
cree_le: 2026-09-09
tags:
  - MyWeather
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `MyWeather` depuis l'intention. Il ne transforme aucune idée en exigence et ne prend aucune décision.
> Il est **réécrit**, non recopié. Chaque affirmation matérielle porte sa source et son **statut** : fait, hypothèse, principe, possibilité.

---

## 1. Objet et principe de lecture

`MyWeather` possédait, avant son entrée dans le coffre, un corpus de 24 fichiers de documentation et un socle de code, produits en deux séances contiguës les **20 et 21 avril 2026**.

Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit nulle part ce qui l'invaliderait, et **ne cite ni source météorologique, ni source sanitaire, ni dispositif d'alerte existant** — alors qu'il fixe cinq seuils d'alerte destinés à protéger des personnes.

Trois règles gouvernent ce qui suit.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*.
2. **Aucune promotion silencieuse de statut** — un fichier d'accueil qui décrit une architecture ne prouve pas qu'elle existe.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

---

## 2. L'intention fondatrice

> **Développer et déployer une plateforme d'alerte et d'information climatique pour protéger les populations du Burkina Faso contre les risques liés aux changements climatiques.**

Source : `99-sources/work_lab/00-overview/project-context.md`. **Statut : intention** — elle n'a pas à être vraie, elle a à être tenue.

Cinq risques sont nommés : vagues de chaleur, sécheresses, inondations, vagues de poussière liées à l'harmattan, et pluies irrégulières perturbant les cycles culturaux.

### 2.1. Les cinq seuils d'alerte, et pourquoi ils sont reclassés

Le corpus attache à chaque risque un seuil chiffré. **Statut : hypothèses**, enregistrées `H1` à `H5` — aucun n'est adossé à une source.

| # | Risque | Seuil énoncé |
| --- | --- | --- |
| `H1` | Vague de chaleur | Plus de 40 °C pendant trois jours consécutifs |
| `H2` | Sécheresse | Moins de 10 mm sur trente jours |
| `H3` | Inondation | Plus de 50 mm en vingt-quatre heures |
| `H4` | Vague de poussière | Indice de qualité de l'air supérieur à 200 |
| `H5` | Pluies irrégulières | Détection statistique d'anomalie |

> [!danger] Un seuil non sourcé n'est pas une imprécision documentaire
> **Un seuil trop haut laisse passer un événement dangereux. Un seuil trop bas produit des alertes que la population finit par ne plus écouter** — et une population qui a cessé d'écouter ne se rattrape pas.
> Dans le domaine visé, les deux erreurs se paient en vies humaines, et aucune des deux ne se corrige après coup. C'est pourquoi les cinq seuils sont classés hypothèses, et non reproduits comme acquis.

---

## 3. La thèse, énoncée de façon falsifiable

Le corpus n'énonce aucune thèse. Celle qui suit est **reconstruite** à partir du guide de simplification du langage, qui en est le document le plus original.

> **X** — L'information météorologique existe et circule déjà, mais elle est **inexploitable par celui qu'elle vise** : elle emploie un vocabulaire technique, arrive par des canaux que la personne menacée ne fréquente pas, et ne dit pas ce qu'il faut faire. Ce qui manque n'est pas la donnée, c'est sa **traduction et son acheminement**.
>
> **Le marché agit comme si non-X** — les services d'information météorologique continuent de diffuser des bulletins en langage technique, sur des canaux généralistes.

**Statut : hypothèse — non instruite.**

**Condition de fausseté**, à formuler avant toute étude :

> **Si un dispositif d'alerte existant atteint déjà la population visée dans une langue et par un canal qu'elle emploie, la thèse tombe entièrement.**

C'est l'hypothèse `H6`, et le corpus ne cite **aucun dispositif existant** — ce qui la rend d'autant plus fragile : dans un domaine où des institutions publiques et internationales opèrent depuis des décennies, l'absence de recensement n'est pas un indice de terrain libre.

---

## 4. Ce que le corpus apporte

### 4.1. La contribution la plus originale, et elle est inattendue

Sur les 158 Ko de documentation, **90 Ko traitent du seul flux de données**. Et parmi eux, un document de 12 Ko pose une règle qui est la vraie thèse du projet :

> *« Un citoyen ordinaire ne doit pas avoir besoin de dictionnaire pour comprendre la météo. »*

Il en tire une table de conversion à **trois niveaux de lecture**, appliquée concept par concept.

| Niveau technique | Niveau intermédiaire | Niveau très simple |
| --- | --- | --- |
| 314,15 K | 41 °C | *Il fait très chaud* |
| Vent de force 7 Beaufort | Vent fort | *Le vent souffle fort* |
| Précipitations probables | Pluie possible | *Risque de pluie* |

**Statut : principe de conception**, enregistré `P1`. C'est la seule partie du dossier qui traite un problème réel et l'aborde de front.

### 4.2. Un flux de données documenté avec soin

Le corpus distingue explicitement la **forme des données brutes** et celle des **données traitées**, énonce les **règles de transformation** qui mènent de l'une à l'autre, et pose des **contrôles de cohérence** avant toute publication. Pour un système dont la sortie est une alerte, cette discipline est justifiée.

---

## 5. L'écart entre ce que le dossier annonce et ce qui existe

Le fichier d'accueil décrit une architecture complète : interface de programmation, services métier, tâches de fond, tableau de bord React, infrastructure de conteneurs, supervision, suite de tests unitaires, d'intégration et de bout en bout.

L'inspection conduite le 2026-09-09, avant la sortie du code hors du coffre, établit ceci.

| Élément annoncé | État réel | Fait |
| --- | --- | --- |
| Interface de programmation et services | **823 lignes de Python** sur 22 fichiers | `F3` |
| Tableau de bord React | **Un fichier de dépendances.** Les cinq dossiers de sources sont vides | `F4` |
| Tests unitaires, d'intégration, de bout en bout | **Les trois dossiers sont vides** | `F5` |

> [!warning] Ce que cet écart établit, et ce qu'il n'établit pas
> **Il établit** qu'un fichier d'accueil décrivant une architecture ne prouve pas qu'elle existe, et que le socle du projet est un commencement, non une réalisation.
> **Il n'établit pas** de mauvaise foi : un fichier d'accueil rédigé au début d'un projet décrit couramment la cible. Il impose seulement de ne jamais lire ce document comme un état.

---

## 6. Ce que le corpus ne traite pas, et c'est le point le plus lourd

> [!danger] La distribution de l'alerte est absente du dossier
> Le corpus conçoit la **production** de l'alerte avec soin — collecte, transformation, contrôle de cohérence, simplification du langage. Il ne dit **nulle part** :
> par quel **canal** l'alerte parvient à la personne menacée · à quel **coût par message** · dans quelle **langue**, alors que le principe `P1` perd tout effet si l'alerte n'est pas dans celle du destinataire · **ce qu'il advient de qui n'a pas de téléphone connecté** · et ce que la personne avertie est censée **faire**.
>
> Une alerte qui n'arrive pas ne protège personne, quelle que soit la qualité de sa production. C'est l'hypothèse `H7`, et c'est le lot d'étude qui peut prononcer l'arrêt du projet.

---

## 7. Recouvrements avec les autres projets du coffre

| Projet | Nature du recouvrement | Portée |
| --- | --- | --- |
| `infUb` | Les deux **publient une information officielle à date critique**, et posent la question de savoir qui a autorité pour la publier. Une alerte climatique erronée engage celui qui l'émet | **Direct, non instruit** |
| `gounhri` | Une alerte n'atteint sa cible que si elle emprunte un canal réellement fréquenté. `gounhri` traite précisément les cercles, les groupes et les communautés ancrées du Burkina Faso, et pourrait porter la réponse à `H7` | **Direct sur la distribution, non instruit** |
| `ecoFab` | Territoire commun, public partiellement commun | **Faible** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## 8. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

**Les cinq seuils d'alerte** · le canal de distribution · la langue · le premier territoire parmi les treize régions · la conduite à tenir communiquée avec l'alerte · le porteur institutionnel · le modèle économique · la forme juridique · le *Core Domain* · l'architecture, le modèle de données et la pile technique.

Les seuils figurent en tête de cette liste **bien qu'ils soient écrits dans le corpus et codés dans le socle technique** : ils n'ont été adossés à aucune source, et ils sont l'élément du projet dont l'erreur coûte le plus cher.

---

## 9. Ce que la reprise doit produire, et dans quel ordre

```
INTENTION  (le présent document)
   v
ÉTUDE — le terrain est-il libre, les seuils sont-ils fondés, l'alerte atteint-elle sa cible ?
   v
CADRAGE STRATÉGIQUE — porteur, territoire initial, canal, modèle
   v
DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

Le corpus a parcouru ce chemin **à l'envers**, du pipeline de données vers le code, en deux séances. La reprise le parcourt dans l'ordre, et son étude doit pouvoir conclure que le projet **ne doit pas être construit** — notamment si un dispositif existant atteint déjà la population visée.

---

*Version 0.1 — ouverture de la reprise. Le corpus hérité reste consultable en [[MyWeather/99-sources/Sources originales|99-sources]] et n'est opposable en rien.*
