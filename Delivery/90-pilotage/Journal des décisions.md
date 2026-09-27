---
projet: "Delivery"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 3
cree_le: 2026-09-09
tags:
  - Delivery
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | **Un jalon franchi, et lui seul** |

La séquence `DEC-C-` est **unique et continue sur tout le coffre**. Une décision dont la portée excède ce projet s'inscrit au [[Journal des décisions du coffre]].

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'a été prise à ce jour
> **Néant au 2026-09-09.**
>
> **Le corpus en déclare pourtant vingt-huit.** Son registre des décisions porte `DEC-0001` à `DEC-0028`, la plupart au statut `BASELINE`, et sa constitution fondatrice se déclare *« BASELINE FONDATRICE — APPROUVÉE POUR LE PASSAGE AU DDD STRATÉGIQUE »*.
> La règle `DEC-C-014`, opposable à tout le coffre, pose qu'aucun statut interne à un document ne vaut décision de projet : une mention portée à l'intérieur d'un texte qualifie l'état de ce texte, jamais l'état du projet. Ces vingt-huit énoncés sont **classés proposés**.
>
> Cette requalification n'est pas un reproche adressé au corpus. Son propre registre des hypothèses pose la même règle dans les mêmes termes — *« aucune hypothèse stratégique ne doit devenir un fait simplement parce qu'elle apparaît dans une présentation ou une spécification »*. Le corpus énonce donc correctement la règle et la franchit dans le document voisin.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-062 — Ouvrir les archives et rendre le corpus consultable

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les six archives compressées du dossier sont **extraites** en `99-sources/livraisons`. Les archives d'origine sont **conservées intactes** en `99-sources/archives`. |
| **Motif** | Le dossier ne contenait **aucun fichier lisible** : six archives et rien d'autre. Obsidian n'ouvre pas les archives compressées ; un corpus qui ne s'affiche pas ne peut être ni cité, ni relié, ni relu. |
| **Précaution** | L'extraction n'écrase rien et ne modifie aucun contenu. Les archives restent la référence en cas de doute sur ce qui a été livré. |
| **Vérification conduite** | 6 archives, **21 fichiers extraits**, dont 6 en double format Markdown et Word. Le dossier `livraison_foundation` de l'une des archives a été aplati, son contenu rejoignant le même niveau que les autres livraisons. |
| **Réversibilité** | Totale — les archives sont intactes. |
| **Statut** | Active |

### DEC-C-063 — Mise en conformité aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet adopte la structure et les conventions du coffre sous le nom de code **`Delivery`**, casse d'origine, conformément à `DEC-C-002`. |
| **Nom de produit** | **Non décidé.** Le corpus emploie le nom de travail *« Écosystème de livraison — Burkina Faso »* et déclare que *« le nom commercial définitif est volontairement laissé ouvert »*. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **`10-etudes` n'est pas ouverte** : aucun programme d'études n'existe. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-064 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 21 fichiers produits avant l'entrée dans le coffre sont versés en `99-sources` comme **matériau de référence**. La conception est **reprise depuis l'intention**. |
| **Motif, et il diffère de celui des autres projets** | Ce corpus **n'est pas en défaut de méthode** : il déclare le statut de ses affirmations, sépare hypothèse et preuve, énonce ce qu'il faut démontrer, et soumet son propre DDD à une revue contradictoire sur neuf scénarios. Sur ce plan il est, avec `payMe`, le plus avancé du coffre. Son écart est ailleurs : **la colonne « preuve actuelle » de son registre ne cite aucun terrain, aucun entretien, aucune mesure, aucune date.** Elle porte des mentions génériques — *« retours terrain »*, *« cas terrain »*, *« cas métier formalisés »* — qui nomment un travail sans jamais l'attester. |
| **Fait de chronologie** | Les six livraisons ont été produites le **2026-08-25 entre 13 h 23 et 15 h 08**, soit en **une heure quarante-cinq**. La constitution fondatrice, déclarée approuvée pour le passage au DDD stratégique, est horodatée à 13 h 23 ; le DDD stratégique v0.1 l'est à 13 h 40. |
| **Conséquence directe** | Les dossiers `20` à `60` **ne sont pas ouverts**, bien que le corpus contienne un DDD stratégique en deux versions, un langage ubiquitaire et une carte de contextes. Les ouvrir afficherait comme franchies des phases qui ne le sont pas. |
| **Ce qui est retenu** | La **méthode du registre** — séparation explicite de l'observation, de l'hypothèse, de la preuve et du résultat — reprise au [[Delivery/90-pilotage/Registre des statuts\|Registre des statuts]]. C'est la contribution la plus transposable de ce corpus. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |
