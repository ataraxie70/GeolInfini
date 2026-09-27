---
projet: "SellComputing"
type: "note-d-entree-projet"
statut_projet: "Corpus versé en référence — aucune phase d'étude ouverte, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — trois noms coexistent dans le corpus : Sell Computing, cell computing, Project Atlas"
corpus_herite: "42 fichiers en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - SellComputing
  - moc
---

# SellComputing

**Plateforme de conseil et de vente de matériel informatique**, dont l'intention tient en une phrase reprise du corpus : *« Dis-moi ce que tu fais, je te dis quel ordinateur te convient. »* Le site doit fonctionner comme un **assistant de décision** avant de fonctionner comme une boutique.

> [!warning] Trois noms coexistent dans le corpus, et aucun n'est décidé
> **Sell Computing** dans l'index documentaire, **cell computing** dans les noms de fichiers, **Project Atlas** dans le dossier de fondation d'entreprise. `SellComputing` est retenu comme nom de code du dossier, casse d'origine, conformément à `DEC-C-002`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `00-intention` et `99-sources` ouvertes le 2026-09-09. **`10-etudes` n'est pas ouverte** |
| Décisions de projet inscrites | **Aucune** — voir [[SellComputing/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Trois, `DEC-C-070` à `DEC-C-072` |
| Corpus hérité | **42 fichiers**, archivés et empreintés en [[SellComputing/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |

---

## Ce que la mise en conformité a changé

| Opération | Effet | Décision |
| --- | --- | --- |
| **Mise en convention** | Note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, corpus empreinté. Les trois ensembles documentaires rejoignent `99-sources` | `DEC-C-070` |
| **Sortie de deux fichiers d'échange d'éditeur** | Deux fichiers `.kate-swp` — artefacts temporaires d'éditeur, non documents — sont sortis du coffre sans être détruits | `DEC-C-071` |
| **Rétrogradation du corpus** | Le corpus devient **matériau de référence**, jamais autorité | `DEC-C-072` |

---

## Navigation

- [[SellComputing/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, les trois traitements successifs, l'escalade de périmètre (V0.1)
- [[SellComputing/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage`
- [[SellComputing/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage`
- [[SellComputing/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage`
- [[SellComputing/99-sources/Sources originales\|Sources originales]] — `99-sources`

**Phases non créées** : `10-etudes`, `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation`.

---

## Le nœud du problème, en une page

**L'intention, et elle est bonne.** Le marché vend des marques, des fiches techniques et des promotions ; le corpus propose de vendre **un besoin, un niveau de performance et une recommandation expliquée**. Il nomme trois peurs précises de l'acheteur : mal choisir, le reconditionné, payer pour une marque au lieu d'acheter de la performance. La promesse qui en découle — choix simple, confiance, prix adapté, explication claire — est cohérente avec ces trois peurs.

**Le corpus est le seul du coffre à être construit sur deux mois**, en trois moments distincts, et non en une séance. C'est une différence de nature avec `levelup`, `maSecure`, `Psycho-pass` et `Delivery`.

**Mais ces trois moments ne traitent pas le même objet, et le corpus ne le dit jamais.**

| Moment | Ce qui est produit | Nom employé |
| --- | --- | --- |
| **10 juin 2026**, 12 h 46 → 19 h 18 | Un corpus détaillé — vision, personas, spécification fonctionnelle, modèle de domaine, modèle de données, architecture, interfaces, cahier des charges technique, contrats d'interface, exigences non fonctionnelles, feuille de route — puis, dans les cinquante dernières minutes, sa **condensation** en une série normalisée de douze documents | Sell Computing, cell computing |
| **1er juillet 2026**, 16 h 52 → 21 h 22 | Un **dossier de fondation d'entreprise** en anglais, sous cadre TOGAF, phase 0 : charte de projet, énoncé du problème, vision, mission, identité, modèle conceptuel d'entreprise, modèle de décision, principes, proposition de valeur, parties prenantes, contexte, hypothèses et contraintes, modèle de connaissance | **Project Atlas** |
| **1er juillet 2026**, 21 h 39 | Une proposition de **séparer une méthodologie générale d'architecture** du projet lui-même, ce dernier devenant un simple **cas d'étude** | KCEA, Project Atlas |

**L'escalade de périmètre est datée à la minute.** Dix-sept minutes après avoir achevé le dossier de fondation d'entreprise d'un commerce de matériel informatique, le corpus écrit : *« nous ne sommes plus en train de construire uniquement Project Atlas, nous sommes en train de construire une méthodologie d'architecture »*, et propose de faire du projet la mise en œuvre de référence d'une méthode applicable à *« toute entreprise dont la connaissance est l'actif principal »*.

> [!danger] Le projet a changé trois fois d'échelle en trois semaines, sans qu'aucune preuve nouvelle n'apparaisse
> D'un site de vente conseillée à une entreprise sous cadre TOGAF, puis à une méthodologie universelle dont le commerce n'est plus qu'un exemple. **Aucun des trois documents ne cite d'entretien, de mesure ou de concurrent.**
> Une échelle qui croît sans preuve qui croît est le signe qu'une conception tourne sur elle-même. Le constat est daté et vérifiable ; son interprétation ne l'est pas, et le lot d'étude qui la trancherait reste à écrire.

**La condensation, et ce qu'elle coûte.** La série normalisée du 10 juin est **trois à quatre fois plus courte** que les documents qu'elle normalise : le modèle de domaine passe de 7,4 Ko à 2,7 Ko, l'architecture applicative de 7,9 Ko à 2,4 Ko. Un lecteur qui n'ouvrirait que la série numérotée — ce que son index recommande — **perdrait les deux tiers de la substance** sans que rien ne l'en avertisse.

**Ce que le corpus ne prouve pas.** Que les trois peurs revendiquées existent chez un acheteur réel. Qu'un acheteur préfère un questionnaire de recommandation à un vendeur en boutique. Qu'une plateforme de conseil se distingue durablement d'un comparateur. Et **qui vend, où, à quel stock et à quelle marge** : le corpus conçoit une plateforme de vente sans jamais aborder l'approvisionnement.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre** : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — observé, imaginé, construit.
2. **Aucune promotion silencieuse de statut** — une mention `Version 1.0` ou `Draft` qualifie l'état d'un texte, jamais l'état du projet.
3. **Pas de chiffre sans source.**
4. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué** — et toute citation indique **lequel des trois moments** parle, car ils ne traitent pas le même objet.

---

## Recouvrements à instruire

| Projet | Nature | Portée |
| --- | --- | --- |
| `Psycho-pass` | Les deux reposent sur un **questionnaire qui produit une recommandation** : besoin d'usage ici, niveau d'aptitude là. Le mécanisme est le même, l'objet ne l'est pas | **Faible, non instruit** |
| `Delivery` | Une plateforme de vente a besoin d'une capacité de livraison | **Non instruit** |
| `payMe` | Une plateforme de vente a besoin d'encaisser | **Non instruit** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## Étape suivante

**Trancher l'échelle avant d'écrire quoi que ce soit d'autre.** Le corpus propose trois objets — un site de vente conseillée, une entreprise sous cadre TOGAF, une méthodologie générale d'architecture — et un programme d'études ne peut pas porter les trois à la fois : ils n'ont ni le même bénéficiaire, ni le même payeur, ni le même mode de preuve.

Cette question est un préalable à l'ouverture de `10-etudes`, et elle ne se tranche pas par préférence : elle se tranche en établissant **lequel des trois objets a un acheteur**. C'est le premier lot du programme à écrire, et il est aussi le moins cher.
