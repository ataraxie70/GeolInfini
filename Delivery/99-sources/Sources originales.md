---
projet: "Delivery"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — aucun document n'est opposable"
empreinte: "4f47642ca674e3dc32b202aadbaf34192c1e2ad338c360b99d15071df27c03e8"
cree_le: 2026-09-09
tags:
  - Delivery
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `Delivery` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils sont conservés parce qu'ils portent un travail réel et méthodiquement conduit, et parce que la reprise s'appuie sur eux comme **référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-064` au [[Delivery/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Emplacement | Fichiers | Nature |
| --- | --- | --- |
| `archives/` | 6 | Les six archives compressées d'origine, **intactes**. Elles font foi sur ce qui a été livré |
| `livraisons/` | 15 | Le contenu extrait des six archives : 7 documents en Markdown, 6 en Word, plus les deux registres transversaux |
| **Total** | **21** | **499 Ko** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
4f47642ca674e3dc32b202aadbaf34192c1e2ad338c360b99d15071df27c03e8
```

### 1.1. Les six livraisons, dans leur ordre de production

| Heure | Livraison | Contenu |
| --- | --- | --- |
| **13 h 23** | `livraison-foundation-v1.0` | Constitution fondatrice v1.0, registre des décisions v1.0, registre des hypothèses et des preuves v1.0, note de lecture |
| **13 h 40** | `livraison-ddd-v0.1` | DDD stratégique v0.1, et les deux registres repris |
| **14 h 27** | `livraison-ddd-validation-v0.1` | Revue contradictoire du DDD stratégique, sur neuf scénarios métier |
| **14 h 38** | `livraison-ddd-v0.2` | DDD stratégique v0.2, issu de la revue |
| **14 h 55** | `livraison-langage-ubiquitaire-v0.1` | Langage ubiquitaire |
| **15 h 06** | `livraison-context-map-v0.1` | Carte de contextes stratégique |

Chaque document existe en **Markdown et en Word**. Les deux formats sont conservés ; le Markdown fait référence pour la citation, le Word documente ce qui a été effectivement remis.

> **L'ensemble du corpus a été produit en une heure quarante-cinq**, le 25 août 2026.

---

## 2. Ce que ce corpus fait mieux que les autres corpus hérités du coffre

Ce point est consigné parce qu'il commande le traitement de la reprise, et qu'il distingue ce dossier de `levelup`, `maSecure` et `Psycho-pass`.

1. **Il déclare le statut de ses affirmations.** Une échelle explicite — `BASELINE`, `DECISION`, `HYPOTHESIS`, `OPEN`, `EVIDENCE`, `SUPERSEDED` — est posée dès la première page de la constitution fondatrice.
2. **Il sépare hypothèse et preuve** dans un registre dédié, dont la règle de lecture énonce qu'*« aucune hypothèse stratégique ne doit devenir un fait simplement parce qu'elle apparaît dans une présentation ou une spécification »*. C'est la règle `DEC-C-014` du coffre, formulée indépendamment et antérieurement.
3. **Il énonce ce qu'il reste à démontrer**, hypothèse par hypothèse, dans une colonne dédiée.
4. **Il soumet son propre modèle de domaine à une revue contradictoire** sur neuf scénarios, dont la capacité indisponible après proposition, l'acceptation sans prise en charge et le transfert de garde.
5. **Il déclare ce qu'il n'est pas** : la constitution précise qu'elle *« ne constitue ni un cahier des charges, ni une spécification technique, ni une définition du MVP, ni une validation juridique, ni une preuve que les hypothèses de marché sont déjà démontrées »*.

---

## 3. Et ce qu'il ne fait pas

> [!danger] La colonne des preuves ne renvoie à rien de vérifiable
> Sur dix-huit hypothèses, la colonne « preuve actuelle » porte exclusivement des mentions génériques : *« retours terrain »*, *« cas terrain »*, *« cas métier formalisés »*, *« modèle conceptuel »*, *« proposition stratégique »*, *« besoin métier explicite »*, *« hypothèse de lancement »*.
> **Aucun entretien n'est daté. Aucun acteur n'est nommé. Aucune mesure n'est chiffrée. Aucun échantillon n'est décrit.**
> Un registre qui dit correctement ce qu'il faut démontrer, mais dont les preuves ne renvoient à rien de vérifiable, atteste d'une **intention de rigueur**, pas d'un travail de terrain. C'est l'écart de ce dossier, et il est le seul — ce qui le rend d'autant plus net.

Le corpus n'aborde par ailleurs **jamais** le consentement à payer : aucune des dix-huit hypothèses n'y touche, et aucune des vingt-huit décisions déclarées n'y consacre d'entrée.

> [!warning] Le corpus déclare des décisions qu'il n'a pas le pouvoir de prendre
> Son registre porte `DEC-0001` à `DEC-0028`, la plupart au statut `BASELINE`, et la constitution se déclare *« BASELINE FONDATRICE — APPROUVÉE POUR LE PASSAGE AU DDD STRATÉGIQUE »*, passage qui a eu lieu dix-sept minutes plus tard.
> La règle `DEC-C-014` pose qu'aucun statut interne à un document ne vaut décision de projet. Ces vingt-huit énoncés sont **classés proposés**, et aucun n'est inscrit au registre `DEC-P-`.
> La contradiction n'est pas imputée au corpus sans nuance : il pose lui-même cette règle dans son registre des hypothèses, et la franchit dans le document voisin.

---

## 4. Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver un DDD stratégique, un langage ubiquitaire ou une carte de contextes ne rend rien décidé.
3. **Les archives font foi.** En cas de doute sur un fichier extrait, l'archive correspondante de `archives/` est la référence.
4. **Toute citation porte son chemin et sa livraison.**
