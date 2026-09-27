---
projet: "Pblog"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est fait, hypothèse, principe, possibilité ou décision — et rien d'autre"
faits: 7
decisions_produit: 0
cree_le: 2026-09-09
tags:
  - Pblog
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
| `F1` | Un document de cadrage a été produit isolément le **2026-04-18 à 18 h 39**. **L'intégralité du dossier d'architecture** l'a été le **2026-06-29 entre 14 h 57 et 16 h 43**, soit en **une heure quarante-six** | Horodatages |
| `F2` | **Le produit a été construit le lendemain**, le 2026-06-30, en **huit enregistrements de code** | Historique du dépôt |
| `F3` | Le produit **existe et est publié** : sept pages, un espace d'administration de contenu, un formulaire de contact, et une version construite prête à être servie | Inventaire du dépôt |
| `F4` | **Quatre contenus sont publiés** : un projet, deux articles et une compétence. Tous datent du 2026-06-30 | Inventaire du contenu |
| `F5` | Le produit a été renommé **deux fois dans la même journée** — d'abord `Sankofa`, puis `Sankofa Arch`. **Ce nom n'apparaît dans aucun document du corpus de conception** | Messages d'enregistrement et recherche sur les 18 documents |
| `F6` | Le dossier s'appelait `oswiser9_Pblog` : un **identifiant de compte** suivi d'une abréviation, non un nom de projet | Nom du dossier à l'entrée |
| `F7` | Le fichier `CLAUDE.md` du corpus est un **lien symbolique vers `AGENTS.md`**, créé le 2026-09-08. Ce n'est pas un document distinct | Inspection du système de fichiers |

> [!important] Ce que `F2` à `F4` établissent, et ce qu'ils n'établissent pas
> **Ils établissent** que `Pblog` est le seul projet du coffre dont le produit ait été effectivement construit et publié. Aucun autre n'a franchi ce pas.
> **Ils n'établissent pas** que la thèse tienne. Un produit publié prouve qu'il a été possible de le construire ; il ne dit rien de son effet sur celui qu'il vise.
> Et `F4` porte une question ouverte : **quatre contenus, tous du jour de la mise en ligne, et aucun depuis.** Voir l'hypothèse `H4`.

---

## 2. Hypothèses — à instruire

Le corpus n'énonce aucune hypothèse comme telle. Celles qui suivent sont **formées par la reprise** en lisant ce que son dossier de fondation tient pour acquis.

| # | Hypothèse | Origine dans le corpus | Ce qui l'invaliderait |
| --- | --- | --- | --- |
| `H1` | Un portfolio de **preuves** est lu, là où un curriculum déclaratif ne l'est pas | Énoncé du problème et moteurs stratégiques | Qu'un recruteur ou un client déclare consulter d'abord un curriculum ou un profil de réseau professionnel, et ne pas ouvrir le reste |
| `H2` | La plateforme **génère des flux de clients et de recruteurs qualifiés** | Moteurs métier du dossier de fondation | Aucune prise de contact issue du site sur une période déterminée |
| `H3` | Elle **réduit le temps de validation des compétences par les tiers** | Idem | Que ce délai ne soit ni mesuré avant, ni mesurable après — ce qui est l'état actuel |
| `H4` | La **charge d'entretien** est soutenable pour une personne seule | Moteur technique — *« la mise à jour du contenu ne doit pas nécessiter de déploiement complexe »* | **Quatre contenus publiés, tous le jour de la mise en ligne, aucun depuis.** L'hypothèse est déjà sous tension |
| `H5` | La **souveraineté numérique** — posséder son propre point d'identité plutôt que dépendre de réseaux tiers — apporte une valeur que le bénéficiaire reconnaît | Moteur stratégique du dossier de fondation | Que l'audience visée se trouve exclusivement sur les réseaux tiers, et n'aille jamais sur un site propre |

> [!danger] `H2` et `H3` sont des objectifs mesurables que rien n'a mesurés
> Le dossier de fondation les pose comme moteurs métier. **Aucune des deux grandeurs n'a été relevée avant la mise en ligne, ni depuis.**
> C'est une occasion manquée et réparable : le produit étant publié, ces mesures sont à portée immédiate, sans autorisation, sans recrutement et sans budget. **Aucun autre projet du coffre n'est dans cette situation.**

---

## 3. Principes de conception — assumés, non prouvés

| # | Principe | Origine |
| --- | --- | --- |
| `P1` | **Remplacer le curriculum déclaratif par un portfolio de preuves** — la plateforme démontre plutôt qu'elle n'affirme | Énoncé du problème, moteurs stratégiques |
| `P2` | **Souveraineté numérique** — posséder son propre point d'identité plutôt que dépendre exclusivement de réseaux tiers | Moteurs stratégiques |
| `P3` | **Entretien minimal** — la mise à jour du contenu ne doit pas exiger un déploiement complexe | Moteurs techniques |
| `P4` | La plateforme **évolue avec son propriétaire** et sert de base durable à sa visibilité | Vision produit du document de cadrage |

`P3` est le seul de ces principes que le produit construit respecte de façon vérifiable : un espace d'administration de contenu a été mis en place, ce qui rend la publication possible sans intervention technique. **`P4` reste à l'épreuve**, et `H4` en porte la mesure.

---

## 4. Possibilités — ouvertes, jamais sélectionnées

**Nom du produit** — `Sankofa Arch` est employé par le code ; il n'a jamais été instruit, ni journalisé, ni écrit dans le corpus de conception.

**Public visé** — recruteurs, clients, collaborateurs techniques. Trois publics énumérés par le dossier de fondation, aucun désigné comme premier, et leurs attentes diffèrent.

**Modèle économique** — absent du corpus. Une plateforme personnelle peut n'en avoir aucun ; encore faut-il le dire.

---

## 5. Décisions

| Registre | Nombre | Renvoi |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | **0** | [[Pblog/90-pilotage/Journal des décisions\|Journal des décisions]] |
| **Décisions de coffre** `DEC-C-` | 4 — `DEC-C-076` à `DEC-C-079` | Idem |

Les choix incorporés au produit construit — pile technique, hébergement, nom — sont **classés proposés** : ils sont réels, mais aucun n'a été instruit ni journalisé.
