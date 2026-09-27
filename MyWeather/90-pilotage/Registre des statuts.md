---
projet: "MyWeather"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 6
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - MyWeather
  - pilotage
  - statuts
---

# Registre des statuts

Table de référence de tout ce que le projet affirme. Une affirmation absente de ce registre n'a **aucun statut**.

| Statut | Sens | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Position de conception assumée | Se respecte ou s'abandonne explicitement |
| **Possibilité** | Trajectoire ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au journal | Engage |

---

## 1. Faits — établis et vérifiables

Tous vérifiés le 2026-09-09 par inspection directe, avant et après la sortie du code.

| # | Fait | Comment il a été établi |
| --- | --- | --- |
| `F1` | Le corpus a été produit en **deux séances contiguës** : le 2026-04-20 à partir de 20 h 26 et le 2026-04-21 jusqu'à 16 h 29 | Horodatages |
| `F2` | La documentation de conception compte **158 Ko sur 13 documents**, dont **90 Ko consacrés au seul flux de données** — forme des données brutes, forme des données traitées, règles de transformation, contrôles de cohérence, guide de simplification du langage | Mesure et lecture |
| `F3` | Le code applicatif compte **823 lignes de Python** réparties sur 22 fichiers | Comptage après sortie du coffre |
| `F4` | Le **tableau de bord React annoncé** se réduit à un fichier de dépendances. Les cinq dossiers de sources — composants, pages, services, magasin d'état, utilitaires — sont **vides** | Inventaire des fichiers |
| `F5` | Les **trois dossiers de tests** — unitaires, intégration, bout en bout — sont **vides**, alors que le fichier d'accueil annonce une suite de tests | Idem |
| `F6` | **Aucune source n'est citée** pour les cinq seuils d'alerte, ni pour les ordres de grandeur du contexte — population, nombre de régions et de départements, plages de température | Recherche sur les 24 fichiers |

> [!danger] Ce que `F6` engage, et pourquoi il est plus grave ici qu'ailleurs
> Un seuil d'alerte non sourcé n'est pas une imprécision documentaire. **Un seuil trop haut laisse passer un événement dangereux ; un seuil trop bas produit des alertes que la population cesse d'écouter** — et une population qui a cessé d'écouter ne se rattrape pas.
> Les cinq seuils du corpus sont donc classés **hypothèses**, et le lot d'étude qui doit les instruire est le second du programme à écrire.

---

## 2. Les cinq seuils, reclassés en hypothèses

Source : fichier d'accueil du corpus et `work_lab/00-overview/project-context.md`. **Statut : hypothèses, aucune source citée.**

| # | Risque | Seuil énoncé par le corpus | Ce qui manque pour le tenir |
| --- | --- | --- | --- |
| `H1` | Vague de chaleur | Plus de 40 °C pendant **trois jours consécutifs** | Une source sanitaire liant ce seuil à une surmortalité observée au Sahel |
| `H2` | Sécheresse | Moins de **10 mm sur trente jours** | Une source agronomique liant ce seuil à une perte de récolte |
| `H3` | Inondation | Plus de **50 mm en vingt-quatre heures** | Une source hydrologique tenant compte du relief et du drainage local |
| `H4` | Vague de poussière | Indice de qualité de l'air supérieur à **200** | Une source sanitaire, et la disponibilité effective de la mesure sur le territoire |
| `H5` | Pluies irrégulières | Détection statistique d'anomalie | Une définition de l'anomalie, et une série de référence |

---

## 3. Hypothèses de fond — à instruire

Formées par la reprise ; le corpus ne les énonce pas.

| # | Hypothèse | Ce qui l'invaliderait |
| --- | --- | --- |
| `H6` | **Aucun dispositif d'alerte climatique n'occupe déjà le terrain** au Burkina Faso | Qu'un service météorologique national, un dispositif international ou un opérateur de téléphonie diffuse déjà ces alertes. **Le corpus n'en cite aucun, ce qui rend cette hypothèse d'autant plus fragile** |
| `H7` | Une alerte produite **atteint** la personne menacée | Qu'aucun canal accessible n'existe pour la part de la population sans téléphone connecté, ou que le coût par message rende la diffusion insoutenable |
| `H8` | Une population avertie **agit** en conséquence | Que l'alerte soit reçue et sans effet, faute de moyen d'action — ce qui est la question la plus lourde et la moins technique du dossier |

> [!warning] `H7` est le lot qui peut prononcer l'arrêt
> Le corpus conçoit avec beaucoup de soin la **production** de l'alerte : collecte, transformation, contrôle de cohérence, simplification du langage. Il ne traite **nulle part sa distribution** — ni le canal, ni le coût par message, ni la langue, ni ce qui advient de qui n'a pas de téléphone.
> Une alerte qui n'arrive pas ne protège personne, quelle que soit la qualité de sa production.

---

## 4. Principes de conception — assumés, non prouvés

| # | Principe | Origine |
| --- | --- | --- |
| `P1` | **Un citoyen ordinaire ne doit pas avoir besoin de dictionnaire pour comprendre la météo** — trois niveaux de lecture, du technique au très simple, avec une table de conversion | `work_lab/02-data-flow/simple-language.md` |
| `P2` | Les données brutes et les données traitées ont **deux formes distinctes et documentées**, reliées par des règles de transformation explicites | `work_lab/02-data-flow/` |
| `P3` | Le flux de données porte des **contrôles de cohérence** avant toute publication | `work_lab/02-data-flow/coherence-checks.md` |

`P1` est la contribution la plus originale du dossier, et la seule que la reprise adopte sans réserve : elle traite un problème réel — l'écart entre le vocabulaire météorologique et celui du destinataire — que le reste du corpus ne pose nulle part comme tel.

---

## 5. Possibilités — ouvertes, jamais sélectionnées

**Canal de diffusion** — aucun n'est nommé. Message court, application, radio, relais communautaire, affichage : le corpus n'en évoque aucun.

**Langue** — le corpus est en français. Le territoire visé en compte plusieurs autres, et le principe `P1` perd tout effet si l'alerte n'est pas dans la langue du destinataire.

**Premier territoire** — le corpus mentionne treize régions et trois cent un départements sans en désigner aucun comme point de départ.

**Modèle économique** — absent du corpus. Un service d'alerte de santé publique peut relever d'un financement public, international ou philanthropique ; aucune de ces voies n'est évoquée.

---

## 6. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[MyWeather/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 3 — `DEC-C-073` à `DEC-C-075` | Idem |
