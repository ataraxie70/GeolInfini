---
projet: "survie"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'intention à l'implémentation, et critère qui déverrouille chaque phase"
maturite: "Intention — verdict du premier maillon : à reformuler (2026-09-12)"
phases_peuplees: "00 · 90 · 99"
calibrage: "Chaîne complète, réévaluée à la reformulation"
cree_le: 2026-09-12
mis_a_jour_le: 2026-09-12
tags:
  - survie
  - pilotage
  - phases
---

# Carte des phases

Le chemin que suivrait `survie`, de l'intention à l'implémentation. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent sur le disque.**

> [!important] La création d'un dossier de phase est une décision
> Elle s'inscrit au [[survie/90-pilotage/Journal des décisions|Journal des décisions]]. L'arborescence actuelle résulte de `DEC-C-087`.

---

## État des phases

| Dossier | Contenu attendu | Statut | Document qui l'ouvre |
| --- | --- | --- | --- |
| `00-intention` | Vision, problème traité, principes, arbitrage du premier maillon | **Ouverte — verdict : à reformuler** | [[survie/00-intention/Document fondateur d'intention\|Document fondateur d'intention]], version 0.1. S'y ajoutent deux notes de référence non opposables : [[survie/00-intention/Comment sont construites les solutions d'étude\|Comment sont construites les solutions d'étude]] — `DEC-C-090` — et [[survie/00-intention/Relevé du terrain et des points exploitables\|Relevé du terrain et des points exploitables]] — `DEC-C-093` |
| `10-etudes` | Protocole, terrain, mesures, jalons | **Fermée** | Ne s'ouvre qu'après l'arbitrage d'une reformulation |
| `20-cadrage-strategique` | Valeur, marché initial, position, modèle économique | **Fermée** | — |
| `30-ddd-strategique` | Domaines, contextes bornés, langage ubiquitaire | **Fermée** | — |
| `40-ddd-tactique` | Agrégats, entités, événements, invariants | **Fermée** | — |
| `50-architecture` | Décisions d'architecture, données, hébergement, sécurité | **Fermée** | — |
| `60-implementation` | Spécifications exécutables, code, tests | **Verrouillée** | Aucune ligne de code |
| `90-pilotage` | Journal, registre des statuts, cartes | **Ouverte** | — |
| `99-sources` | Déclarations d'origine, empreintes | **Ouverte** | [[survie/99-sources/Sources originales\|Sources originales]] |

---

## Calibrage de la chaîne

**Chaîne complète**, annoncée le 2026-09-12. Trois questions en décident, et deux répondent « haut » :

| Question | Réponse | Échelle |
| --- | --- | --- |
| Combien de personnes doivent être d'accord ? | Le porteur seul | Basse |
| Que coûte l'erreur ? | Le projet viserait d'autres personnes que le porteur, avec leurs données personnelles, et celles de mineurs si « tout niveau » est maintenu | **Haute** |
| Combien de temps cela doit-il tenir ? | *« Un vrai infrastructure robuste »*, donc plusieurs années | **Haute** |

Une seule réponse haute suffit à monter d'un cran.

**Garde-fou de proportionnalité.** Tant que le verdict est *à reformuler*, aucun maillon au-delà du premier n'est ouvert. **Le calibrage est réévalué à la reformulation**, car une reformulation est un autre projet. Si la reformulation retenue ne sert que le porteur, la chaîne se réduit aux maillons 1 et 6 : c'est l'échelle d'un outil personnel, et ClassRoom en est déjà un.

### Correspondance entre les maillons de la chaîne et les phases du coffre

| Maillon | Question | Où il s'écrit |
| --- | --- | --- |
| 1 — Arbitrage stratégique | Le projet mérite-t-il d'exister ? | `00-intention`, dans le document fondateur |
| 2 — Contre-épreuve | Qu'est-ce qui le tue ? | `10-etudes`, en tête du programme d'études |
| 3 — Cadrage système | Dans quel monde s'insère-t-il ? | `20-cadrage-strategique` |
| 4 — Définition produit | Quoi, pour qui, avec quel effet ? | `20-cadrage-strategique` |
| 5 — Décomposition | En quoi le projet se découpe-t-il ? | `20-cadrage-strategique` et `90-pilotage` |
| 6 — Spécification | Comment, précisément ? | `30-ddd-strategique` et `40-ddd-tactique` |
| 7 — Décisions d'architecture | Qu'est-ce qu'on ne pourra plus défaire ? | `50-architecture` |
| Implémentation | — | `60-implementation` |

---

## Chemin

```
INTENTION ........................ ouverte — verdict « à reformuler »
   v
REFORMULATION .................... trois questions au porteur, point 14.1 du document fondateur
   v
ARBITRAGE DE LA REFORMULATION .... nouveau verdict du premier maillon, version 0.2 du document fondateur
   v
ÉTUDES ........................... seulement si le verdict est « retenu » ou « non instruit, programme valide »
   v
CADRAGE, DDD, ARCHITECTURE ....... fermés
   v
IMPLÉMENTATION ................... verrouillée
```

---

## Ce qui déverrouille la suite

| Étape | Critère de franchissement |
| --- | --- |
| Arbitrer une reformulation | Le porteur a répondu aux trois questions du point 14.1 : un bénéficiaire nommable, un usage mal servi, une relation écrite avec `ecoFab` et `levelup`. Le relevé du terrain fournit le matériau de la deuxième |
| Ouvrir `10-etudes` | Le verdict de la reformulation est *retenu*, *retenu sous condition* ou *non instruit, programme valide* |
| Ouvrir `60-implementation` | Les deux principes du premier maillon sont franchis sur preuve, et les maillons intermédiaires fixés par le calibrage sont écrits |

---

## Jalons et échéances

| Jalon | Date | Contenu |
| --- | --- | --- |
| Clôture du jalon 1 d'`ecoFab` | Au plus tard le 2026-09-30 | Ses résultats alimentent la reformulation R2 ; rien ne s'instruit ici avant |
| Test d'usage de ClassRoom | Six semaines après la première séance réelle de 2026-2027 | Seuils pré-enregistrés au point 14.2 du document fondateur. La condition préalable est levée : le porteur déclare suivre des cours réels et connaître la date (`F20`). **La date reste à inscrire au journal**, et le test ne court pas avant |

---

## Règles de franchissement

1. **Aucune phase ne s'ouvre sans décision journalisée.**
2. **Un verdict se rend sur preuve, jamais sur envie.** Le grade de preuve de chaque affirmation se propage d'un document à l'autre.
3. **La reformulation n'est pas une formalité.** Elle peut conclure que l'intention est déjà portée par `ecoFab` ou par `levelup`, et que le présent projet n'a pas lieu d'exister à part.
