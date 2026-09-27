---
projet: "Pblog"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 4
cree_le: 2026-09-09
tags:
  - Pblog
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

La séquence `DEC-C-` est **unique et continue sur tout le coffre**. Une décision dont la portée excède ce projet s'inscrit au [[Journal des décisions du coffre]].

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-09**, et cette mention appelle une précision propre à ce projet.
>
> **Le produit est construit et publié.** Sept pages, un espace d'administration de contenu, quatre contenus, un formulaire de contact, huit enregistrements de code le 2026-06-30. La pile technique est arrêtée dans les faits, le nom `Sankofa Arch` est employé, l'hébergement est choisi.
> **Ces choix sont réels, ils ne sont pas décidés au sens du coffre.** Aucun n'a été instruit, aucun n'a franchi de jalon, aucun n'est adossé à une mesure. La règle `DEC-C-014` pose qu'aucun statut interne à un document — ni, ici, aucun état du produit — ne vaut décision de projet.
> Ils sont donc **classés proposés**, et le registre `DEC-P-` reste vide. Une décision inscrite ici devrait porter son motif et sa preuve ; ceux-là n'en ont pas.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-076 — Renommer le dossier

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `oswiser9_Pblog` est renommé **`Pblog`**. |
| **Motif** | La convention `DEC-C-002` pose que le dossier de projet porte **le nom de code du projet**. `oswiser9_Pblog` est un identifiant de compte suivi d'une abréviation : il nomme un dépôt, pas un projet. Le préfixe est retiré selon la même logique que `DEC-C-054`, qui avait retiré le tiret bas de `_maSecure`. |
| **Pourquoi maintenant** | Aucun wikilink ne visait ce dossier : le renommage ne casse rien, et il ne coûtera jamais moins cher qu'aujourd'hui. |
| **Nom de produit** | **Non décidé.** Le code emploie **`Sankofa Arch`**, adopté en deux temps le 2026-06-30 — d'abord `Sankofa`, puis `Sankofa Arch`. **Ce nom n'apparaît dans aucun document du corpus de conception.** Il n'a pas été retenu comme nom de code du dossier, précisément parce qu'il n'a jamais été instruit ni journalisé. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-077 — Mise en conformité aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet adopte la structure et les conventions du coffre : note d'entrée, phases préfixées, journal, registre des statuts, carte des phases, sources empreintées. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **`10-etudes` n'est pas ouverte** : aucun programme d'études n'existe. |
| **Observation conservée** | Le fichier `CLAUDE.md` du corpus est un **lien symbolique vers `AGENTS.md`**, créé le 2026-09-08. Ce n'est pas un document mais un renvoi ; il est conservé en l'état et signalé, car un inventaire qui le compterait comme un fichier distinct serait faux. |
| **Réversibilité** | Élevée. |
| **Statut** | Active |

### DEC-C-078 — Sortie du site, du dépôt et des artefacts hors du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le site, son dépôt de code, ses dépendances, ses sorties de construction et sa configuration d'éditeur sont **déplacés hors du coffre**, vers `Incubo/_hors-coffre/pblog/`. **Aucune suppression n'est faite.** La documentation de conception est récupérée avant la sortie. |
| **Motif** | Application du précédent `DEC-C-037`, établi sur `levelup`. |
| **Précaution particulière à ce projet** | **Le dépôt porte huit enregistrements réels**, tous du 2026-06-30, contrairement à ceux de `Psycho-pass` — vide — et de `levelup`. Le déplacement conserve le dossier `.git` intact : **aucun historique n'est rompu**. C'est la raison pour laquelle le dépôt est déplacé et non reconstitué. |
| **Vérification conduite** | Comptage avant et après. **247 entrées avant, 247 après** — 21 dans le coffre, 226 hors du coffre. Le dossier passe de **2,1 Mo à 152 Ko**. |
| **Ce que la sortie conserve dans le coffre** | Les 18 documents de conception, l'index d'architecture et le fichier de consignes d'agent. |
| **Réversibilité** | Totale — les copies sont conservées hors du coffre, dépôt compris. |
| **Statut** | Active |

### DEC-C-079 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 21 entrées versées en `99-sources` sont **matériau de référence**, non opposables. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit pas ce qui l'invaliderait, et ne cite **ni enquête, ni mesure, ni entretien, ni état de l'art** — alors qu'il fixe des objectifs mesurables tels que *« générer des flux de clients et de recruteurs qualifiés »* et *« réduire le temps de validation des compétences par les tiers »*. |
| **Fait de chronologie** | Un document de cadrage produit isolément le **2026-04-18 à 18 h 39**, puis **l'intégralité du dossier d'architecture le 2026-06-29 entre 14 h 57 et 16 h 43** — soit en **une heure quarante-six** —, puis la construction du site le **2026-06-30** en huit enregistrements. |
| **Conséquence directe** | Les dossiers `10` à `60` **ne sont pas ouverts**, bien que le corpus contienne un dossier de fondation en neuf documents, un cycle d'architecture en quatre phases, une architecture de données, une architecture applicative et une pile technique — **et bien que le produit existe et soit publié**. |
| **Pourquoi la construction n'ouvre pas `60-implementation`** | Un produit construit prouve qu'il était possible de le construire. Il ne prouve pas que la thèse tienne. Ouvrir la phase d'implémentation afficherait comme franchies les cinq phases qui la précèdent, dont aucune ne l'est. |
| **Ce qui est retenu** | L'**intention** — remplacer le curriculum déclaratif par un portfolio de preuves — et les **trois familles de moteurs** que le dossier de fondation distingue : stratégiques, métier, techniques. Repris au registre des statuts. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |
