---
projet: "maSecure"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin de la reprise, de l'intention à l'implémentation, et condition d'ouverture de chaque phase"
phase_courante: "10-etudes"
cree_le: 2026-09-09
tags:
  - maSecure
  - pilotage
  - phases
---

# Carte des phases

Le chemin que suivra la reprise de `maSecure`. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent sur le disque.**

> [!important] Pourquoi les phases aval ne sont pas ouvertes, alors que le corpus les remplirait
> Le corpus hérité contient un catalogue d'API, une matrice de rôles et permissions, un modèle de données, une architecture en quatre couches, des workflows métier, une stratégie de sécurité, un plan de tests, un plan de déploiement et un plan d'exploitation. Ouvrir `50-architecture` pour les y verser afficherait la phase comme franchie alors qu'elle ne l'est pas : ces documents ont été produits **en sept heures, sans aucune étude et sans avoir lu un seul texte réglementaire**.
> **La création d'un dossier de phase est elle-même une décision, à inscrire au [[maSecure/90-pilotage/Journal des décisions|Journal des décisions]].**

---

## État des phases

| Dossier | Contenu attendu | Statut | Ouvert par |
| --- | --- | --- | --- |
| `00-intention` | Intention, thèse falsifiable, principes, recouvrements | **Ouverte** | `DEC-C-054` |
| `10-etudes` | Benchmark, protocole, lots, jalons, notes de jalon | **Ouverte** | `DEC-C-056` |
| `20-cadrage-strategique` | Bénéficiaire, marché initial, position défendable, actif | Verrouillée | Jalon 3 |
| `30-ddd-strategique` | *Core Domain*, contextes bornés, langage ubiquitaire | Verrouillée | Jalon 4 |
| `40-ddd-tactique` | Agrégats, invariants, événements, machines à états | Verrouillée | DDD stratégique validé |
| `50-architecture` | Décisions d'architecture, données, sécurité, exploitation | Verrouillée | DDD tactique validé |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | Verrouillée | Architecture validée |
| `90-pilotage` | Décisions, statuts, cartes | **Ouverte** | `DEC-C-054` |
| `99-sources` | Corpus hérité intact et empreinté | **Ouverte** | `DEC-C-055` |

Statut au **2026-09-09** : phase courante `10-etudes`, **aucune décision de projet**, un seul lot conduit — le benchmark.

---

## L'ordre de la reprise est l'inverse de celui du corpus

```
CORPUS HÉRITÉ                          REPRISE
(sept heures, le 2026-06-09)           (ordre d'instruction)

  Formalisation de l'idée                INTENTION            00
      v                                      v
  Charte de fonctionnement               ÉTUDE                10
      v                                      v
  Cahiers des charges                    CADRAGE              20
      v                                      v
  Modèle de données, rôles               DDD STRATÉGIQUE      30
      v                                      v
  Architecture, API                      DDD TACTIQUE         40
      v                                      v
  Sécurité, tests, exploitation          ARCHITECTURE         50
                                             v
                                         IMPLÉMENTATION       60
```

Les deux colonnes portent des noms voisins et ne disent pas la même chose : à gauche, un contenu écrit ; à droite, une phase franchie sur preuve.

---

## Les jalons

```
VAGUE 0 — Desk pur, aucune autorisation           L1, L2
        |                                    L1 = régime réglementaire
        |                                    L2 = adoption des acteurs
        v  -- JALON 1 -----------------------------------------------
           Une voie licite existe-t-elle sans agrément préalable ?
           La place est-elle libre ?
           Sortie possible : reformulation, ou ARRÊT.
        |
VAGUE 1 — Terrain                              L3, L4, L6
        |
        v  -- JALON 2 -----------------------------------------------
           Le risque de trésorier est-il la douleur dominante ?
           Le dessaisissement est-il accepté ?
           Sortie possible : issue C ou D.
        |
VAGUE 2 — Desk et juridique                    L5, L7, L8
        |
        v  -- JALON 3 -----------------------------------------------
           Un premier marché, un actif, un payeur ?
           Sortie possible : issue B ou D.       Déverrouille 20.
        |
VAGUE 3 — Épreuve                                  L9
        |
        v  -- JALON 4 -----------------------------------------------
           Un gain mesurable sur une tontine réelle ?
           Sortie : DDD, ou arrêt.               Déverrouille 30.
```

### Ce que chaque jalon autorise

| Jalon | Décisions qu'il permet de lever | Phase qu'il déverrouille |
| --- | --- | --- |
| **1** | **Rapport aux fonds** — garde ou non-garde · régime réglementaire visé · reformulation du périmètre · arrêt anticipé | — reste en `10-etudes` |
| **2** | Douleur retenue · public visé · acceptation du dessaisissement | — |
| **3** | Territoire et premier marché · actif candidat et régime de propriété · nature du projet et payeur · forme juridique | `20-cadrage-strategique` |
| **4** | *Core Domain* · produit minimal · règles de fonctionnement | `30-ddd-strategique` |
| *après 4* | Modèle économique, pile technique, architecture, hébergement | `40` puis `50` puis `60` |

> [!warning] Le jalon 1 peut arrêter le projet en une semaine
> `L1` et `L2` sont documentaires, gratuits et sans autorisation. Si aucune des trois voies du point 4.3 du [[maSecure/00-intention/Document fondateur d'intention|Document fondateur d'intention]] n'est praticable sans agrément préalable, le projet est une entreprise financière réglementée avant d'être un logiciel — et cela se sait avant d'avoir dépensé un entretien.

---

## Règles de franchissement

1. Une phase ne s'ouvre que par une **note de jalon** datée, concluant explicitement sur l'issue retenue.
2. Le franchissement est inscrit au [[maSecure/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et ses preuves.
3. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée **conservée au journal**.
4. **Un document du corpus hérité ne franchit aucune phase.** Sa reprise se fait par réécriture, avec citation de son chemin source, de sa passe, et fixation explicite de son statut.
