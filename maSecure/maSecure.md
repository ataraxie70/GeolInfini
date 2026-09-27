---
projet: "maSecure"
type: "note-d-entree-projet"
statut_projet: "Reprise depuis l'intention — programme d'études ouvert, benchmark conduit, aucune décision de projet"
nom_de_produit: "NON DÉCIDÉ — maSecure est un nom de code interne"
corpus_herite: "41 fichiers en 99-sources — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - maSecure
  - moc
---

# maSecure

Projet de **tontine sécurisée** : remplacer la confiance placée dans une personne par une confiance placée dans une **règle**, une **preuve** et une **exécution automatique**.

> [!warning] `maSecure` est un nom de code, pas un nom de produit
> Le corpus hérité emploie « MaSecure » et « maSecure ». Le nom du produit n'est pas décidé. Le dossier, qui s'appelait `_maSecure`, a été renommé pour se conformer à la convention du coffre — voir `DEC-C-054`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `10-etudes` — programme ouvert le 2026-09-09 |
| Lots conduits | **Un** : le [[Benchmark et cadre réglementaire]] |
| Décisions de projet | **Aucune** — voir [[maSecure/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Trois, `DEC-C-054` à `DEC-C-056` |
| Corpus hérité | **41 fichiers**, archivés et empreintés en [[maSecure/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |
| Prochaine échéance | **Jalon 1** — atteignable en une semaine, sans autorisation ni dépense |

---

## Le nœud du problème, en une page

**L'intention.** Une tontine repose sur un trésorier qui détient l'argent du groupe. Le projet veut retirer à quiconque le pouvoir d'y toucher, appliquer des règles connues d'avance, et conserver une preuve permanente de chaque versement et de chaque décision.

**La contribution du corpus.** Un principe, et il est solide : **séparer la garde de l'argent, la logique de gestion et le droit de décision**. Il transforme un problème de personne en problème de système.

**La thèse, et ce qui la ferait tomber.** Ce qui casse dans une tontine ne serait pas l'argent mais la confiance dans celui qui le détient. **Ce qui la ferait tomber** : que les membres préfèrent un trésorier qu'ils connaissent à un système qu'ils ne contrôlent pas. Le trésorier n'est pas seulement un risque — c'est une personne responsable devant le groupe, joignable, à qui l'on peut parler. Un système ne rend pas ce service, et le corpus ne vérifie nulle part que la défiance soit partagée.

**Ce que le benchmark a établi, et que le corpus ignore.** **Six acteurs vivants** occupent déjà le terrain, dont un **agréé par la Banque centrale**. Et la conception héritée suppose de **garder de l'argent** — ce qui, en zone UEMOA, exige un agrément dont le capital minimum est de **300 millions de francs CFA libérés avant délivrance**, dans un cadre **reporté six fois en dix-huit mois** pour une douzaine d'approbations.

> [!danger] Le projet, tel qu'il est conçu, est en écart avec la doctrine du coffre
> La règle `D1` pose qu'*« une dépendance qu'on ne signe pas soi-même est une cible, jamais une condition d'existence »*. **Qui signe ?** La Banque centrale. **Que fait le système si la signature n'arrive jamais ?** Rien : sans coffre, il n'y a pas de produit.
> D'où la question qui commande tout le reste, et que le corpus ne pose jamais : **la valeur tient-elle dans la garde de l'argent, ou dans la règle et la preuve ?** Si elle tient dans la règle et la preuve, une voie sans agrément existe. Si elle tient dans la garde, le projet est une entreprise financière réglementée, et son calendrier n'est plus celui d'un logiciel.

**Ce que la chronologie du corpus dit.** Les 41 fichiers ont été produits en **sept heures**, en **trois passes successives** sur les mêmes objets, avec une charte réécrite **quatre fois en quatorze minutes**. Deux lectures s'opposent et le dossier ne les départage pas : une pensée qui se précise vite, ou une conception qui tourne sur elle-même faute de contact avec le terrain.

---

## Navigation

- [[maSecure/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention, la thèse falsifiable, les principes, les recouvrements (V0.1)
- [[Benchmark et cadre réglementaire]] — `10-etudes` — **le premier travail d'étude** : acteurs vivants, cimetière, régime UEMOA
- [[maSecure/10-etudes/Programme d'études\|Programme d'études]] — `10-etudes` — dix lots, quatre jalons, seuils pré-enregistrés (V0.1)
- [[maSecure/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage` — le chemin de la reprise et ce qu'ouvre chaque jalon
- [[maSecure/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage` — toute décision, sa date, son motif
- [[maSecure/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage` — fait, hypothèse, principe, possibilité, décision
- [[maSecure/99-sources/Sources originales\|Sources originales]] — `99-sources` — le corpus hérité, intact, empreinté, non opposable

### Phases non encore créées

`20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation`. **Leur création est elle-même une décision à journaliser.**

---

## Doctrine de travail

S'y ajoutent les **règles de méthode du coffre**, opposables à tous les projets : voir [[Doctrine du coffre]].

1. **Séparation des trois mondes** — observé, imaginé, construit. Le corpus hérité relève presque entièrement du monde imaginé.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus ne lui confère aucun statut. Le corpus déclare des « décisions métier validées » : elles sont classées **proposées**.
3. **Pas de chiffre sans source.**
4. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué** — toute reprise indique le fichier source et laquelle des trois passes le produit.

---

## Étape suivante

Conduire la **vague 0**, qui ne dépend d'aucun tiers et peut arrêter le projet en une semaine.

1. **`L1` — la voie sans garde est-elle licite ?** Lecture des instructions BCEAO pour situer la frontière entre *détenir des fonds*, *initier un paiement* et *donner une instruction*. C'est la question qui commande le périmètre, le calendrier, la forme juridique et le modèle économique.
2. **`L2` — les six acteurs sont-ils adoptés ?** Le benchmark a établi leur existence, pas leur usage.

**Le jalon 1 est atteignable en une semaine et peut prononcer l'arrêt**, avant qu'un seul entretien soit dépensé.
