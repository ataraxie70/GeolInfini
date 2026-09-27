---
projet: "levelup"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin de la reprise, de l'intention à l'implémentation, et condition d'ouverture de chaque phase"
phase_courante: "10-etudes"
cree_le: 2026-09-08
tags:
  - levelup
  - pilotage
  - phases
---

# Carte des phases

Le chemin que suivra la reprise de `levelup`, de l'intention jusqu'au code. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent sur le disque.**

> [!important] Pourquoi les phases aval ne sont pas ouvertes, alors que le corpus les remplirait
> Le corpus hérité contient un DDD stratégique, quarante-deux spécifications de contextes bornés et sept notes d'architecture d'intégration. Ouvrir `30-ddd-strategique` pour les y verser afficherait la phase comme franchie alors qu'elle ne l'est pas : ces documents ont été produits **avant toute étude**, à partir d'hypothèses qui n'ont jamais été instruites. C'est l'application directe de la règle *« aucune promotion silencieuse de statut »*, et le motif de `DEC-C-038`.
> **La création d'un dossier de phase est elle-même une décision, à inscrire au [[levelup/90-pilotage/Journal des décisions|Journal des décisions]].**

---

## État des phases

| Dossier | Contenu attendu | Statut | Ouvert par |
| --- | --- | --- | --- |
| `00-intention` | Intention, thèse, distinctions fondatrices, frontières, recouvrements | **Ouverte** | `DEC-C-041` |
| `10-etudes` | Protocole de recherche, lots, terrain, mesures, notes de jalon | **Ouverte** | `DEC-C-047` |
| `20-cadrage-strategique` | Bénéficiaire, marché initial, position défendable, secret, actif | Verrouillée | Jalon de fin d'étude |
| `30-ddd-strategique` | *Core Domain*, contextes bornés, *context map*, langage ubiquitaire | Verrouillée | Cadrage validé |
| `40-ddd-tactique` | Agrégats, entités, objets-valeur, événements, invariants, politiques | Verrouillée | DDD stratégique validé |
| `50-architecture` | Décisions d'architecture, données, sécurité, infrastructure, exécution | Verrouillée | DDD tactique validé |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | Verrouillée | Architecture validée |
| `90-pilotage` | Décisions, statuts, cartes | **Ouverte** | `DEC-C-041` |
| `99-sources` | Corpus hérité intact et empreinté | **Ouverte** | `DEC-C-038` |

Statut au **2026-09-08** : phase courante `10-etudes`, **aucune décision de projet**, **aucun lot lancé**. Le lancement de la vague 0 est une décision distincte.

---

## L'ordre de la reprise est l'inverse de celui du corpus

Le corpus hérité a été construit de l'architecture vers le métier : les contextes bornés, les spécifications d'intégration et les paysages techniques existent, la preuve que le problème existe n'existe pas. La reprise procède dans l'ordre opposé.

```
CORPUS HÉRITÉ                          REPRISE
(ordre de production)                  (ordre d'instruction)

  Foundation                             INTENTION            00
      v                                      v
  Business Architecture                  ÉTUDE                10
      v                                      v
  DDD stratégique                        CADRAGE              20
      v                                      v
  Contextes bornés                       DDD STRATÉGIQUE      30
      v                                      v
  Architecture d'intégration             DDD TACTIQUE         40
      v                                      v
  Paysages techniques                    ARCHITECTURE         50
      v                                      v
  Essais de développement                IMPLÉMENTATION       60
```

Les deux colonnes portent les mêmes noms et ne disent pas la même chose : à gauche, un contenu écrit ; à droite, une phase franchie sur preuve. Le corpus alimente la colonne de droite comme **matériau**, jamais comme validation.

---

## Ce que `10-etudes` doit établir

Le [[levelup/10-etudes/Programme d'études|Programme d'études]] V0.1 instruit cinq questions que le corpus hérité laisse entières, plus deux que le corpus ne pose pas du tout.

| # | Question | Pourquoi elle est bloquante |
| --- | --- | --- |
| Q1 | Le problème existe-t-il, et qui le subit assez pour agir ? | Les constats C2 à C5 du document fondateur d'intention sont des hypothèses sans source |
| Q2 | Une représentation **honnête** de la progression est-elle désirée ? | C'est la condition de fausseté de la thèse. Le corpus pose la rigueur comme une valeur sans vérifier qu'elle est recherchée |
| Q3 | Quel premier public et quel premier domaine ? | Sept publics énumérés, aucun hiérarchisé, aucun marché initial désigné |
| Q4 | L'universalité du moteur est-elle atteignable, et à quel coût ? | L'axiome A5 engage lourdement ; la preuve de compétence n'a pas la même forme d'un domaine à l'autre |
| Q5 | Qui occupe déjà ce terrain, et pourquoi les solutions existantes échouent-elles ? | Aucun état de l'art dans les 303 documents, aucune autopsie d'échec |
| Q6 | Que le projet accumulerait-il, cela se creuse-t-il, à qui cela appartient-il ? | Question du principe de l'actif, que le corpus ne pose jamais |
| Q7 | Qui porte une ligne de coût pour ce problème ? | Question du payeur, que le corpus ne pose jamais |

| Question | Lot du programme |
| --- | --- |
| Q1 | L0, L2 |
| Q2 | **L4** — le lot le plus déterminant |
| Q3 | L6 |
| Q4 | L3, L5 |
| Q5 | **L1** |
| Q6 | **L7** |
| Q7 | **L8** |

> [!warning] Condition de validité du programme d'études
> Il doit pouvoir conclure que le projet **ne doit pas être construit**. Un programme qui ne peut plus produire cette issue n'instruit rien : il justifie un corpus déjà écrit.
> Le programme V0.1 satisfait cette condition : son **jalon 1 est atteignable en trois semaines**, sans autorisation ni dépense de terrain, et il peut prononcer l'arrêt.

---

## Règles de franchissement

1. Une phase ne s'ouvre que par une **note de jalon** datée, concluant explicitement sur l'issue retenue.
2. Le franchissement est inscrit au [[levelup/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les preuves qui le fondent.
3. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
4. **Un document du corpus hérité ne franchit aucune phase.** Sa reprise dans une note de travail se fait par réécriture, avec citation de son chemin source et fixation explicite de son statut.
