---
projet: "checkme"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'idée à la cession, et critère qui déverrouille chaque phase"
maturite: "Études — vague 0 lancée le 2026-09-10 (DEC-C-086), lot L1 conduit ; verdict du premier maillon : non instruit, jalon 1 au plus tard le 2026-10-31"
phases_peuplees: "00 · 10 · 90 · 99"
calibrage: "Chaîne complète et formalisée"
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - pilotage
  - phases
---

# Carte des phases

Le chemin complet que suit `checkme`, de l'intention jusqu'à la cession à une autorité publique. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent physiquement sur le disque.**

> [!important] La création d'un dossier de phase est une décision
> Elle s'inscrit au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]]. L'arborescence actuelle résulte de `DEC-C-018`, partiellement remplacée par `DEC-C-082`.

---

## État des phases

| Dossier | Contenu attendu | Statut | Document qui l'ouvre |
| --- | --- | --- | --- |
| `00-intention` | Vision, problème traité, principes fondateurs, périmètre | **Ouverte — reprise engagée** | [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]], version 0.2 |
| `10-etudes` | Protocole, terrain, mesures, jalons | **Ouverte — vague 0 en cours** | [[checkme/10-etudes/Programme d'études\|Programme d'études]], version 0.1 — `DEC-C-085`, lancé par `DEC-C-086`. Lot `L1` conduit : [[Relevé de l'état de l'art et du cimetière]]. Les deux études du corpus hérité — l'audit et l'analyse approfondie — portent sur les documents, non sur le terrain, et sont en `99-sources` |
| `20-cadrage-strategique` | Valeur, marché initial, position, modèle économique | **Jamais traversée** | Aucun |
| `30-ddd-strategique` | Domaines, contextes bornés, *context map*, langage ubiquitaire | **Fermée** | Aucun. Le DDD stratégique hérité est en `99-sources` — `DEC-C-082` |
| `40-ddd-tactique` | Agrégats, entités, objets-valeurs, événements, invariants | **Fermée** | Aucun. Les deux documents hérités sont en `99-sources` |
| `50-architecture` | ADR, données, hébergement, sécurité, interfaces | **Fermée** | Aucun. Les huit documents hérités et les cinq migrations sont en `99-sources` |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | **Verrouillée** | Aucune ligne de code |
| `90-pilotage` | Journal des décisions, registre des statuts, cartes | **Ouverte** | — |
| `99-sources` | Corpus hérité, provenance, empreintes, trace des fichiers supprimés | **Ouverte** | [[checkme/99-sources/Sources originales\|Sources originales]] |

> [!note] La maturité du projet est celle d'une étude qui n'a pas commencé
> Jusqu'au 2026-09-10, `checkme` peuplait `00`, `10`, `30`, `40` et `50`, sans qu'aucune de ces phases ait été franchie. Le versement du corpus hérité en `99-sources` aligne désormais l'arborescence sur la maturité réelle : **une intention réécrite, un programme d'études versé et non lancé, aucune donnée d'observation, aucune décision de projet.**

---

## Calibrage de la chaîne

**Chaîne complète et formalisée**, de l'intention à l'implémentation, prolongée jusqu'à la présentation et à la cession. Trois motifs, dont chacun suffirait :

1. Le produit traite des **données nominatives**, soumises à la loi n°001-2021/AN portant protection des personnes à l'égard du traitement des données à caractère personnel.
2. Il est destiné à être **examiné, puis éventuellement repris, par une administration**, qui en exigera la justification.
3. La **cession complète** visée par le porteur impose un dossier transférable — code, documentation, exploitation, conformité — que seule une chaîne documentée peut produire.

**Garde-fou.** Chaque phase porte un jalon et une échéance. Le risque `R1` du corpus hérité, requalifié au point 6 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]], n'est plus l'absence de code mais la réinstruction sans fin.

---

## Chemin de la reprise

```
INTENTION ............................ ouverte — Document fondateur d'intention, verdict « non instruit »
   v
ÉTUDE ................................ ouverte — vague 0 en cours, L1 conduit, jalon 1 au plus tard le 2026-10-31
   v
CADRAGE STRATÉGIQUE .................. première catégorie, autorité visée, origine de la donnée, basculement en infrastructure publique
   v
DDD STRATÉGIQUE → DDD TACTIQUE → ARCHITECTURE ..... le corpus hérité y est reconfronté ; la transférabilité est une exigence
   v
IMPLÉMENTATION ....................... produit minimal couvrant toute la chaîne métier
   v
PRÉSENTATION À L'AUTORITÉ
   v
CESSION
```

Les deux dernières étapes ne sont pas des phases du coffre : elles relèvent de l'issue déclarée par le porteur — point 3 du [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]] — et ne créent aucun dossier.

---

## Ce que la reprise doit instruire, phase par phase

| Phase | Matériau disponible en `99-sources` | Ce que la reprise appelle |
| --- | --- | --- |
| `10-etudes` | Deux études du corpus, aucune du terrain | **Programme versé le 2026-09-10** : neuf lots — état de l'art et cimetière en tête —, trois jalons, seuils pré-enregistrés, issue *« ne pas construire »* atteignable à chaque jalon. Reste à lancer la vague 0 |
| `20-cadrage-strategique` | Rien | Première catégorie de publication ; autorité visée ; réponse à la question de l'origine de la donnée ; gouvernance de l'habilitation à publier ; niveau de service ; acte du basculement en infrastructure publique au sens de la règle `D2` |
| `30-ddd-strategique` | Une carte des contextes bornés | La reconfronter au cadrage, une fois celui-ci arbitré |
| `40-ddd-tactique` | Des agrégats détaillés et une stratégie de recherche | À reprendre après `30`, pas avant. La stratégie de recherche héritée — identifiant faible jamais seul, résultat *trouvé*, *ambigu* ou *aucun* — est reprise comme **principe** au point 6 du document fondateur |
| `50-architecture` | Huit documents et cinq migrations jamais exécutées | À reprendre en dernier : c'est la couche la plus dépendante de tout ce qui précède. Deux points contestés y restent à trancher — point 3 du [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]] |

> [!warning] `20-cadrage-strategique` n'a jamais été traversée
> Le corpus hérité est passé de l'intention au DDD stratégique sans arbitrer pour qui, avec qui et avec quel argent le produit se construirait. Recherche plein texte sur l'ensemble du corpus : les termes *modèle économique*, *financement*, *budget*, *rentabilité*, *marché initial* et *monétisation* n'y apparaissent qu'une seule fois, dans une question sans réponse de l'analyse approfondie — *« Qui paie ? L'État ? Les organismes ? Gratuité pour le citoyen — mais qui finance l'infrastructure ? »*
> La déclaration du porteur du 2026-09-10 oriente désormais deux de ces questions — le porteur institutionnel et le financement — sans en trancher aucune. Voir le point 5.1 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]].

---

## Ce qui déverrouille `60-implementation`

| Verrou | Ce qu'il faut pour le lever |
| --- | --- |
| Reprise de la conception (`DEC-C-016`) | Que les phases `00` à `50` soient réinstruites dans l'ordre, et que la reprise soit déclarée close au journal |
| Arbitrage du premier maillon | Qu'un verdict **retenu** remplace le verdict *non instruit* du 2026-09-10, sur la base des preuves apportées par l'étude |
| Cadrage stratégique | Qu'il existe — première catégorie, autorité visée, origine de la donnée, financement, gouvernance |
| Conformité données personnelles | Que le lot juridique ait établi, pour le mode d'alimentation retenu, la base légale, la répartition des responsabilités de traitement et les formalités auprès de la Commission de l'informatique et des libertés |
| Contrats machine | Que l'architecture reprise produise des contrats testables. Ceux qu'attendait l'intervention héritée `P0-4` — `OpenAPI`, `JSON Schemas`, fixtures — n'ont jamais été produits |
| Critère d'autorisation de décision | **Posé** : le programme d'études fixe trois jalons plafonnés et des seuils pré-enregistrés ; le jalon 3 rend un nouveau verdict du premier maillon, seul à pouvoir ouvrir le cadrage |

---

## Jalons et échéances

| Jalon | Objet | Échéance | Source |
| --- | --- | --- | --- |
| Jalon 1 de l'étude | Place disponible et coût d'accès observable : l'absence de preuve à cette date vaut réponse négative sur ces deux points | **Au plus tard le 2026-10-31** — plafond confirmé par le porteur ; une date antérieure est admise | Point 10.4 du document fondateur ; `DEC-C-083` et `DEC-C-084` |
| Jalon 2 de l'étude | La difficulté est-elle reconnue et agie par les personnes concernées ? | Au plus tard six semaines après le jalon 1 | Point 5 du [[checkme/10-etudes/Programme d'études\|Programme d'études]] |
| Jalon 3 de l'étude | Autorité, voie d'accès, actif, payeur, cession — **nouveau verdict du premier maillon** | Au plus tard quatre semaines après le jalon 2 | Idem |

Une échéance se modifie aux conditions de la règle `D3` de la [[Doctrine du coffre]] : inscrite au journal, datée, et motivée par autre chose que le résultat obtenu.

---

## Règles de franchissement

1. Une phase ne s'ouvre que par un **document livré** qui en porte le contenu, pas par anticipation.
2. Le franchissement est inscrit au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les faits qui le fondent.
3. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
4. **Peupler un dossier de phase n'ouvre rien.** Un document rangé dans une phase reste une proposition tant qu'aucune décision ne l'a arrêté — `DEC-C-014`.
5. **Un statut écrit dans un document ne vaut pas décision de projet.** « Terminé », « canonique », « baseline » qualifient l'état d'un texte, jamais celui du projet.
