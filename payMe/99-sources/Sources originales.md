---
projet: "payMe"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — non opposable, mais méthodiquement conforme"
empreinte: "43de11ae01368ed03e30b05c3370952a317089460ddb5a688f1f91eb500a7d98"
cree_le: 2026-09-09
tags:
  - payMe
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `payMe` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité — mais le motif diffère
> Ces documents ne sont pas opposables, **et ce n'est pas parce qu'ils manqueraient de méthode**. Ils en ont plus que tout autre corpus hérité du coffre. Ils ne le sont pas parce qu'**aucun jalon n'a été franchi** et que toutes leurs preuves sont documentaires : aucun commerçant, aucun payeur n'a été interrogé.
> Voir `DEC-C-068` au [[payMe/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Fichier | Taille | Nature |
| --- | --- | --- |
| `etude-strategique-payout-v1.md` | 50 Ko | **Étude stratégique — déconstruction du secteur et test de faisabilité.** Cinq parties : verdict, déconstruction du secteur, test de l'actif indétrônable, réglementation, reformulation et plan de preuve. Dix-huit sections |
| `etude-strategique-v1-addendum.md` | 17 Ko | **Addendum** — corrige une surestimation de l'étude, mesure la couverture réelle au Burkina Faso, reformule la position défendable |
| `06-revision-plan-preuve-v1.1.md` | 14 Ko | **Révision du plan de preuve** — corrige la lecture du chiffre de sortie en espèces, pose la taxonomie du retrait, compresse le terrain de soixante-trois heures à seize |
| `05-note-faisabilite-technique-pispi.md` | 13 Ko | **Note de faisabilité technique** — distingue le modèle de transfert du modèle de paiement, pose la question de l'initiation par un tiers, décrit un protocole d'épreuves sur l'environnement de test, et **réordonne le plan** |
| **Total** | **92 Ko** | **4 fichiers** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
43de11ae01368ed03e30b05c3370952a317089460ddb5a688f1f91eb500a7d98
```

> [!warning] Le corpus a changé le 2026-09-09, et l'empreinte avec lui
> **État antérieur** : trois documents, empreinte `bec71fb631b12f1ef1e10b8f644c87862e2e54605ab584b01d377d92795ef045`, relevée le 2026-09-09 à 20 h 49.
> **État courant** : quatre documents, empreinte ci-dessus, relevée le même jour à 21 h 30.
> Trois faits distincts expliquent ce changement, et ils sont détaillés sous `DEC-C-081` au [[payMe/90-pilotage/Journal des décisions|Journal des décisions]] : un document ajouté, l'addendum restauré dans sa version d'origine, et un original remis en place après avoir été déposé sous un nom accidentel.
> **L'empreinte antérieure est conservée ici** : elle date l'état sur lequel les premières notes de la vague 0 ont été écrites.

---

## 1 bis. Ce que la restauration des originaux a corrigé

Deux des quatre documents portaient, jusqu'au 2026-09-09, une version dont les **signes paragraphe avaient été remplacés** par le mot `point` — six occurrences au total, quatre dans l'addendum et deux dans la révision du plan de preuve.

Cette substitution résultait de `DEC-C-052`, qui avait retiré le signe paragraphe de tout le coffre. À cette date, **les documents de `payMe` n'étaient pas encore en `99-sources`** : ils résidaient à la racine du dossier de projet et ont été traités comme des notes de travail ordinaires.

Le traitement était défendable alors ; il ne le serait plus aujourd'hui, la règle 1 de ce dossier posant que rien ne s'y édite. **Les originaux sont donc rétablis**, et les versions substituées sont conservées hors du coffre, en `Incubo/_hors-coffre/payme-versions-modifiees/`.

> [!note] Ce cas fixe une règle pour les projets à venir
> Un corpus versé en `99-sources` **après** une passe rédactionnelle de portée générale peut porter les traces de cette passe. Avant de figer une empreinte, il vaut de vérifier si le document a été touché alors qu'il n'était pas encore protégé.

---

## 2. Chronologie

Les documents portent leurs propres dates : l'étude et son addendum sont datés du **1er septembre 2026**, la révision du plan de preuve leur est postérieure et s'appuie sur un état de fait arrêté au **8 septembre 2026**. La **note de faisabilité technique** porte la mention *« Version 1.0 · Septembre 2026 »* et a été versée au coffre le **2026-09-09 à 21 h 08**.

Les horodatages de fichier indiquent un dépôt au coffre le **2026-09-09 à 14 h 55**. Cette date est celle du versement, **non celle de la rédaction** ; en cas de divergence, les dates portées à l'intérieur des documents font foi.

> [!note] Un document fondateur v0.1 est cité mais absent
> L'étude se présente comme une *« réponse au document fondateur v0.1 »* et renvoie à ses points 5, 6, 9.1 à 9.7, 14, 21, 27 et 35. **Ce document n'est pas dans le corpus versé.**
> L'absence est moins grave que celle constatée sur `INPC-BF` : l'étude cite systématiquement ce qu'elle reprend, et la position du document v0.1 a de toute façon été **abandonnée** au point 2 du [[payMe/00-intention/Document fondateur d'intention|Document fondateur d'intention]]. Elle est néanmoins consignée.

---

## 3. Ce que ce corpus fait, et qu'aucun autre corpus hérité du coffre ne fait

1. **Il étiquette chaque affirmation.** Quatre étiquettes, définies dès l'avertissement méthodologique : `[FAIT]` — vérifié auprès d'une source officielle référencée —, `[HYPOTHÈSE]` — plausible, à tester —, `[ANALYSE]` — raisonnement construit sur des faits, pouvant être contesté — et `[INCONNU]` — question ouverte que l'étude n'a pas pu trancher.
2. **Il cite ses sources, nommées et datées.** Textes officiels, listes de participants arrêtées à une date, statistiques de banque centrale, précédents régionaux, adresses vérifiables.
3. **Il assortit ses hypothèses d'un critère de mort explicite**, et écrit : *« si le critère est atteint, l'hypothèse est abandonnée sans négociation »*.
4. **Il déclare chercher à casser sa propre intention** : *« ce document ne cherche pas à valider l'intention fondatrice. Il cherche à la casser. Ce qui survivra sera solide. »*
5. **Il se corrige deux fois.** Deux de ses trois documents n'ont pour objet que de corriger le premier — une surestimation sur la couverture du dispositif, puis une lecture trop rapide du chiffre de sortie en espèces. Chaque correction est motivée et laisse voir ce qui a changé.
6. **Il réfute son propre actif candidat** avant d'en proposer trois autres, classés et argumentés.

---

## 4. Ce qui lui manque, et c'est la seule chose

> [!danger] Aucun commerçant, aucun payeur n'a été interrogé
> Toutes les preuves du dossier sont **documentaires**. Or la question dont tout dépend — le retrait d'espèces est-il subi ou choisi ? — ne se tranche que par le terrain : un rapport de banque centrale compte des retraits, **il n'enregistre pas leur cause**.
> Le corpus le sait. Il écrit : *« c'est exactement le genre de question qu'aucune donnée publique ne résoudra, et qu'une poignée d'entretiens résout en une semaine »*, et il réduit son protocole de soixante-trois heures à seize pour rendre ce travail atteignable.

---

## 5. Point de rédaction consigné, non corrigé

Le corpus classe trois actifs candidats au moyen d'une **notation par étoiles pleines et vides**, de `★★★★★` à `★★★☆☆`, **sans légende**. Un lecteur extérieur ne peut pas savoir sur quelle échelle porte le compte, ni ce que vaut une étoile.

Conformément à la règle de ce dossier, **la source n'est pas modifiée**. Les notes de travail du projet n'emploient pas cette notation : elles nomment le rang et son motif. Voir `DEC-C-067`.

---

## 6. Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver une position formulée, des actifs classés et un plan de preuve ne rend rien décidé.
3. **Toute citation porte son chemin et son document.** Les quatre documents se contredisent sur plusieurs points, chacun assumé comme une correction ; citer sans dire lequel parle rend la citation trompeuse.
4. **En cas de divergence, le document le plus tardif fait référence** — la note de faisabilité technique d'abord, la révision du plan de preuve ensuite, puis l'addendum, l'étude en dernier. C'est la seule exception à la règle générale du coffre selon laquelle la divergence se tranche par réinstruction : ici, les documents ultérieurs **déclarent expressément** corriger le précédent.
