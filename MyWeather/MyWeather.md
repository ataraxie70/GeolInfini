---
projet: "MyWeather"
type: "note-d-entree-projet"
statut_projet: "Corpus versé en référence — aucune phase d'étude ouverte, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — MyWeather est un nom de code interne"
corpus_herite: "24 fichiers en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - MyWeather
  - moc
---

# MyWeather

**Plateforme d'alerte et d'information climatique du Burkina Faso**, destinée à protéger les populations contre cinq risques : vagues de chaleur, sécheresses, inondations, vagues de poussière et pluies irrégulières.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `00-intention` et `99-sources` ouvertes le 2026-09-09. **`10-etudes` n'est pas ouverte** |
| Décisions de projet inscrites | **Aucune** — voir [[MyWeather/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Trois, `DEC-C-073` à `DEC-C-075` |
| Corpus hérité | **24 fichiers**, archivés et empreintés en [[MyWeather/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |

---

## Ce que la mise en conformité a changé

| Opération | Effet | Décision |
| --- | --- | --- |
| **Mise en convention** | Note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, corpus empreinté | `DEC-C-073` |
| **Assainissement** | Le code, l'outillage et l'infrastructure de conteneurs sortent du coffre, sans être détruits. La documentation de conception — 24 fichiers — est récupérée avant la sortie. Le dossier passe de **61 à 24 fichiers** | `DEC-C-074` |
| **Rétrogradation du corpus** | Le corpus devient **matériau de référence**, jamais autorité | `DEC-C-075` |

---

## Navigation

- [[MyWeather/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, les seuils d'alerte, l'écart entre l'annonce et l'état (V0.1)
- [[MyWeather/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage`
- [[MyWeather/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage`
- [[MyWeather/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage`
- [[MyWeather/99-sources/Sources originales\|Sources originales]] — `99-sources`

**Phases non créées** : `10-etudes`, `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation`.

---

## Le nœud du problème, en une page

**L'intention.** Développer une plateforme d'alerte et d'information climatique pour protéger les populations du Burkina Faso. Le corpus nomme cinq risques et leur attache à chacun un **seuil d'alerte chiffré** : plus de 40 °C pendant trois jours consécutifs pour la chaleur, moins de 10 mm sur trente jours pour la sécheresse, plus de 50 mm en vingt-quatre heures pour l'inondation, un indice de qualité de l'air supérieur à 200 pour la poussière, et une détection statistique pour les anomalies de pluie.

**La contribution la plus solide, et elle est inattendue.** Sur les 158 Ko de documentation de conception, **90 Ko sont consacrés au flux de données** : la forme des données brutes, celle des données traitées, les règles de transformation, les contrôles de cohérence, et un **guide de simplification du langage météorologique**. Ce dernier document pose une règle qui est la vraie thèse du projet :

> *« Un citoyen ordinaire ne doit pas avoir besoin de dictionnaire pour comprendre la météo. »*

Il en tire une table de conversion à trois niveaux de lecture, où *« 314,15 K »* devient *« 41 °C »* puis *« il fait très chaud »*. **C'est la partie du dossier qui aborde un vrai problème, et aucune autre plateforme météorologique du corpus n'est citée comme le faisant.**

**Ce que le dossier annonce et qui n'existe pas.** Le fichier d'accueil décrit une architecture complète — interface de programmation, services, tâches de fond, tableau de bord React, infrastructure de conteneurs, suite de tests. L'état réel du code au 2026-09-09 :

| Élément annoncé | État réel |
| --- | --- |
| Interface de programmation et services | **823 lignes de Python**, réparties sur 22 fichiers |
| Tableau de bord React | **Un fichier de dépendances, et rien d'autre.** Tous les dossiers de sources sont vides |
| Suite de tests — unitaires, intégration, bout en bout | **Les trois dossiers sont vides** |

**Ce que le corpus ne prouve pas.** Que les seuils chiffrés soient les bons — aucun n'est adossé à une source météorologique, sanitaire ou agronomique. Que quiconque attende cette alerte, ni par quel canal elle arriverait à une population dont une part n'a pas de téléphone connecté. Et que le service n'existe pas déjà : **aucun service météorologique national, aucun dispositif d'alerte existant n'est cité**, alors que l'alerte climatique est un domaine où des institutions publiques et internationales opèrent depuis des décennies.

**Le point le plus lourd.** Une alerte qui n'atteint pas la personne menacée ne protège personne. Le corpus conçoit avec soin la **production** de l'alerte — collecte, transformation, contrôle de cohérence, simplification — et ne traite nulle part sa **distribution** : ni le canal, ni le coût par message, ni la langue, ni ce qui se passe pour qui n'a pas de téléphone.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre** : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — observé, imaginé, construit.
2. **Aucune promotion silencieuse de statut** — un fichier d'accueil qui décrit une architecture ne prouve pas qu'elle existe.
3. **Pas de chiffre sans source** — règle particulièrement engageante ici : les cinq seuils d'alerte n'en citent aucune.
4. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué.**

---

## Recouvrements à instruire

| Projet | Nature | Portée |
| --- | --- | --- |
| `infUb` | Les deux **publient une information officielle** à date critique, et posent la question de qui a autorité pour la publier. Une alerte climatique est une information dont l'autorité engage | **Direct, non instruit** |
| `gounhri` | Une alerte n'atteint sa cible que si elle emprunte un canal réellement fréquenté, et `gounhri` traite les cercles et les groupes ancrés | **Direct sur la distribution, non instruit** |
| `ecoFab` | Territoire commun, public partiellement commun | **Faible** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## Étape suivante

**Écrire un programme d'études**, et l'ouvrir en `10-etudes` — décision à inscrire au journal. Trois lots s'imposent avant tout autre, et aucun ne demande d'autorisation.

1. **Le terrain est-il libre ?** Recenser les dispositifs d'alerte climatique existants au Burkina Faso et dans la sous-région — services météorologiques nationaux, dispositifs internationaux, opérateurs de téléphonie. Le corpus n'en cite aucun.
2. **Les seuils sont-ils fondés ?** Retrouver, pour chacun des cinq risques, la source météorologique, sanitaire ou agronomique qui justifie le seuil retenu — ou constater qu'il n'y en a pas.
3. **L'alerte atteint-elle qui elle vise ?** Établir par quel canal, à quel coût par message, dans quelle langue, et ce qu'il advient de la personne qui n'a pas de téléphone connecté.

Le troisième lot est celui qui peut prononcer l'arrêt : une alerte qui n'arrive pas ne protège personne, quelle que soit la qualité de sa production.
