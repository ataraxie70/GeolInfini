---
projet: "Delivery"
type: "note-d-entree-projet"
statut_projet: "Corpus versé en référence — aucune phase d'étude ouverte, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — le corpus emploie le nom de travail « Écosystème de livraison — Burkina Faso » et laisse le nom commercial ouvert"
corpus_herite: "21 fichiers en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - Delivery
  - moc
---

# Delivery

**Infrastructure numérique fédératrice du secteur de la livraison au Burkina Faso** : un système dans lequel les personnes peuvent travailler, les organisations peuvent se créer, et les capacités de livraison peuvent circuler entre elles.

> [!warning] `Delivery` est un nom de dossier, pas un nom de produit
> Le corpus emploie le nom de travail **« Écosystème de livraison — Burkina Faso »** et déclare explicitement que *« le nom commercial définitif est volontairement laissé ouvert »*. `Delivery` est retenu comme nom de code du dossier, casse d'origine, conformément à `DEC-C-002`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `00-intention` et `99-sources` ouvertes le 2026-09-09. **`10-etudes` n'est pas ouverte** |
| Étude | Aucun programme d'études. Le corpus porte un **plan de ce qu'il faut démontrer**, non un protocole pour le démontrer |
| Décisions de projet inscrites | **Aucune** — voir [[Delivery/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Trois, `DEC-C-062` à `DEC-C-064` |
| Corpus hérité | **21 fichiers**, archivés et empreintés en [[Delivery/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |

---

## Ce que la mise en conformité a changé

Le projet occupait un dossier ne contenant **que six archives compressées** : aucun fichier lisible, aucune note, rien qu'Obsidian pouvait afficher. Un corpus enfermé dans des archives n'est pas consultable, et un coffre de conception dont le contenu ne s'ouvre pas ne remplit pas son office.

| Opération | Effet | Décision |
| --- | --- | --- |
| **Ouverture des archives** | Les six livraisons sont extraites en `99-sources/livraisons`, les archives d'origine conservées intactes en `99-sources/archives` | `DEC-C-062` |
| **Mise en convention** | Note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, corpus empreinté | `DEC-C-063` |
| **Rétrogradation du corpus** | Le corpus devient **matériau de référence**, jamais autorité | `DEC-C-064` |

---

## Navigation

### Phases ouvertes

- [[Delivery/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, la thèse, les dix-huit hypothèses reprises et ce qui les invaliderait (V0.1)
- [[Delivery/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage` — le chemin de la reprise et ce qu'ouvre chaque phase
- [[Delivery/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage` — toute décision, sa date, son motif, sa réversibilité
- [[Delivery/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage` — ce qui est **fait**, **hypothèse**, **principe**, **possibilité**, **décision**
- [[Delivery/99-sources/Sources originales\|Sources originales]] — `99-sources` — le corpus hérité, intact, empreinté, non opposable

### Phases non encore créées

`10-etudes`, `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation` — voir [[Delivery/90-pilotage/Carte des phases\|Carte des phases]]. **Leur création est elle-même une décision à journaliser.**

---

## Le nœud du problème, en une page

**L'intention.** Ne pas créer un opérateur logistique de plus, mais une **couche commune** permettant à des acteurs juridiquement et économiquement distincts — indépendants, groupes, agences, entreprises — de conserver leurs propres relations tout en partageant capacités, missions, informations et preuves selon des règles explicites.

**La contribution la plus solide, et elle est méthodologique.** Ce corpus est le seul du coffre, avec celui de `payMe`, à porter **un registre des hypothèses et des preuves** qui sépare explicitement observation, hypothèse, preuve et résultat, et qui pose en règle de lecture qu'*« aucune hypothèse stratégique ne doit devenir un fait simplement parce qu'elle apparaît dans une présentation ou une spécification »*. C'est, mot pour mot, la règle `DEC-C-014` du coffre, formulée indépendamment.

**Ce que ce registre reconnaît lui-même.** Sur ses dix-huit hypothèses, **aucune n'est démontrée**. Leurs statuts se lisent en toutes lettres — *à démontrer*, *à valider*, *à mesurer*, *à valider juridiquement*, *ouverte*, *candidat DDD à valider* — et la colonne « preuve actuelle » n'y contient jamais qu'une mention générique — *« retours terrain »*, *« cas terrain »*, *« cas métier formalisés »* — sans qu'aucun terrain, aucun entretien ni aucune mesure ne soit cité, daté ou situé.

**L'écart réel du dossier.** Il n'est donc pas dans la rigueur de la forme, qui est exemplaire pour un corpus produit hors du coffre. Il est dans le fait que cette forme **décrit un travail de terrain qui n'a pas eu lieu**. Le registre dit correctement ce qu'il faut démontrer ; rien n'a encore été démontré.

**Le point le plus coûteux.** L'hypothèse `H-010` — *« une boucle locale suffisamment dense peut résoudre le démarrage à froid »* — porte le risque de mort d'un système fédérateur : sans densité, l'infrastructure ne sert personne, et la densité ne s'obtient qu'en servant des gens. Le corpus la classe *à démontrer* et n'en tire aucune conséquence sur le périmètre ou le calendrier.

**Ce que la chronologie établit.** Les six livraisons — de la constitution fondatrice au *context map* stratégique, en passant par une revue contradictoire du DDD — ont été produites le **25 août 2026 entre 13 h 23 et 15 h 08**, soit en **une heure quarante-cinq**. La constitution s'y déclare *« BASELINE FONDATRICE — APPROUVÉE POUR LE PASSAGE AU DDD STRATÉGIQUE »*, et le passage a effectivement eu lieu quatorze minutes plus tard.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre**, opposables à tous les projets : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*.
2. **Aucune promotion silencieuse de statut** — un statut `BASELINE` porté à l'intérieur du corpus qualifie l'état de ce texte, jamais l'état du projet.
3. **Pas de chiffre sans source.**
4. **Falsifiabilité** — toute hypothèse écrite énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué** — une affirmation reprise indique le fichier source dont elle provient.

---

## Recouvrements à instruire

| Projet | Nature | Portée |
| --- | --- | --- |
| `payMe` | Les deux visent le **commerce et les échanges du quotidien au Burkina Faso**, et les deux reposent sur une **preuve d'exécution** — de la garde d'un colis ici, du règlement d'une transaction là. Un livreur qui encaisse à la livraison relie directement les deux objets | **Non instruit.** Le lien n'est établi nulle part |
| `gounhri` | Une fédération d'organisations autonomes est une question sociale avant d'être logistique, et `gounhri` traite les cercles et les groupes ancrés | **Non instruit** |
| `maSecure` | Les deux reposent sur un registre de preuves d'exécution appliqué à des acteurs qui ne se font pas confiance *a priori* | **Faible mais réel** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## Étape suivante

**Écrire un programme d'études**, et l'ouvrir en `10-etudes` — décision à inscrire au journal.

Le corpus fournit déjà la matière première : ses dix-huit hypothèses sont formulées, et la colonne *« ce qu'il faut démontrer »* de son registre nomme, hypothèse par hypothèse, la mesure attendue. Ce qui manque est ce qu'un registre ne contient jamais : **l'ordre des lots, le coût de chacun, les jalons, et le seuil chiffré au-delà duquel une hypothèse est abandonnée**.

Deux lots sont exigibles dès la V0.1 au titre de la règle `D2` de la [[Doctrine du coffre]] — un lot **actif**, qui instruit `H-009`, et un lot **payeur**, que le corpus n'aborde nulle part.
