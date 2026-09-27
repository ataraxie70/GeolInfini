---
projet: "MyWeather"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_produit: 0
decisions_coffre: 3
cree_le: 2026-09-09
tags:
  - MyWeather
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
> **Néant au 2026-09-09.** Sont notamment suspendus : les cinq seuils d'alerte, le canal de distribution, la langue, le premier territoire, le modèle économique, la forme juridique, l'architecture et la pile technique.
>
> **Le corpus arrête pourtant cinq seuils chiffrés et une pile technique complète.** La règle `DEC-C-014` pose qu'aucun statut interne à un document ne vaut décision de projet. Ces éléments sont **classés proposés** — d'autant que les seuils ne citent aucune source.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-073 — Mise en conformité aux conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le projet adopte la structure et les conventions du coffre sous le nom de code **`MyWeather`**, casse d'origine, conformément à `DEC-C-002`. |
| **Nom de produit** | **Non décidé.** `MyWeather` est employé par le corpus comme nom de projet ; rien n'indique qu'il ait été retenu comme nom de produit, et il n'est ni en français ni dans une langue nationale du territoire visé. |
| **Phases ouvertes** | `00-intention`, `90-pilotage`, `99-sources`. **`10-etudes` n'est pas ouverte** : aucun programme d'études n'existe. |
| **Réversibilité** | Élevée aujourd'hui, décroissante à mesure que les wikilinks s'accumulent. |
| **Statut** | Active |

### DEC-C-074 — Sortie du code et de l'outillage hors du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Le code applicatif, les fichiers de dépendances, l'infrastructure de conteneurs et la configuration de supervision sont **déplacés hors du coffre**, vers `Incubo/_hors-coffre/myweather/`. **Aucune suppression n'est faite.** La documentation de conception est récupérée avant la sortie et versée en `99-sources`. |
| **Motif** | Application du précédent `DEC-C-037`, établi sur `levelup`. Un coffre de conception n'héberge pas de code applicatif. |
| **Vérification conduite** | Comptage avant et après. **61 fichiers avant, 61 après** — 24 dans le coffre, 37 hors du coffre. Aucun fichier n'est perdu. |
| **Ce que la sortie révèle** | L'inspection du code déplacé établit un écart entre ce que le fichier d'accueil annonce et ce qui existe. **823 lignes de Python** sur 22 fichiers ; le tableau de bord React se réduit à **un fichier de dépendances**, tous ses dossiers de sources étant vides ; les **trois dossiers de tests — unitaires, intégration, bout en bout — sont vides**. Faits `F3` à `F5`. |
| **Réversibilité** | Totale — les copies sont conservées hors du coffre. |
| **Statut** | Active |

### DEC-C-075 — Le corpus hérité est une référence, non une autorité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-09 |
| **Décideur** | Porteur du projet |
| **Décision** | Les 24 fichiers de documentation versés en `99-sources` sont **matériau de référence**, non opposables. La conception est **reprise depuis l'intention**. |
| **Motif** | Le corpus a été produit hors de la doctrine du coffre : il n'énonce le statut d'aucune affirmation, ne dit pas ce qui l'invaliderait, et ne cite **ni source météorologique, ni source sanitaire, ni dispositif d'alerte existant** — alors qu'il fixe cinq seuils d'alerte destinés à protéger des personnes. |
| **Gravité propre à ce projet** | Un seuil d'alerte non sourcé n'est pas une imprécision documentaire. Un seuil trop haut laisse passer un événement dangereux ; un seuil trop bas produit des alertes que la population cesse d'écouter. **Les deux erreurs coûtent des vies dans le domaine visé**, et aucune des deux ne se corrige après coup. |
| **Fait de chronologie** | Le corpus a été produit en **deux séances contiguës** : le 2026-04-20 à partir de 20 h 26, et le 2026-04-21 jusqu'à 16 h 29. |
| **Conséquence directe** | Les dossiers `10` à `60` **ne sont pas ouverts**, bien que le corpus contienne une architecture globale, un pipeline de données détaillé et un socle de code. |
| **Ce qui est retenu** | Le **guide de simplification du langage météorologique** et sa règle — *« un citoyen ordinaire ne doit pas avoir besoin de dictionnaire pour comprendre la météo »* — repris comme principe de conception au registre des statuts. C'est la contribution la plus originale du dossier. |
| **Réversibilité** | Élevée — le corpus est intact et empreinté. |
| **Statut** | Active |
