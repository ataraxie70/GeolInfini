---
projet: "Delivery"
type: "carte-des-phases"
phase: "90-pilotage"
objet: "Le chemin de la reprise, ce qu'ouvre chaque phase, et ce qui conditionne son ouverture"
phases_ouvertes: 3
cree_le: 2026-09-09
tags:
  - Delivery
  - pilotage
  - phases
---

# Carte des phases

> [!important] Un dossier de phase n'est créé que lorsque la phase s'ouvre réellement
> Les phases aval sont décrites ici, mais leurs dossiers n'existent pas. **Chaque ouverture de phase est une décision à inscrire au journal.**

---

## 1. État des phases

| Phase | Dossier | État | Ce qui conditionne son ouverture |
| --- | --- | --- | --- |
| **Intention** | `00-intention` | **Ouverte** le 2026-09-09 | Entrée du projet au coffre |
| **Études** | `10-etudes` | **Non créée** | L'écriture d'un programme d'études — lots, jalons, seuils chiffrés, ordre de renoncement |
| **Cadrage stratégique** | `20-cadrage-strategique` | Non créée | Le dernier jalon de ce programme |
| **DDD stratégique** | `30-ddd-strategique` | Non créée | Un bénéficiaire nommé et un marché initial désigné |
| **DDD tactique** | `40-ddd-tactique` | Non créée | Un *Core Domain* arrêté |
| **Architecture** | `50-architecture` | Non créée | Des agrégats et des invariants établis |
| **Implémentation** | `60-implementation` | Non créée | Une architecture décidée et journalisée |
| **Pilotage** | `90-pilotage` | **Ouverte** le 2026-09-09 | Permanente |
| **Sources** | `99-sources` | **Ouverte** le 2026-09-09 | Existence d'un corpus antérieur |

---

## 2. Le chemin

```
INTENTION  (ouverte)
   v
ÉTUDE  —  à ouvrir : le programme reste à écrire
   |        lots obligatoires : actif (H-009), payeur (H-019), démarrage à froid (H-010),
   |        acceptation de l'exposition (H-011), régime juridique (H-013)
   |
   +--- JALONS ------> arrêt possible du projet
   v
CADRAGE STRATÉGIQUE
   v
DDD STRATÉGIQUE  ->  DDD TACTIQUE  ->  ARCHITECTURE  ->  IMPLÉMENTATION
```

---

## 3. Ce que le corpus hérité contient, et où il ne va pas

| Élément du corpus | Phase qu'il semble occuper | Pourquoi il ne l'ouvre pas |
| --- | --- | --- |
| Constitution fondatrice v1.0, registre des décisions | `20-cadrage-strategique` | Produite en amont de toute mesure ; ses 28 décisions sont classées proposées au titre de `DEC-C-014` |
| DDD stratégique v0.1 puis v0.2, langage ubiquitaire, carte de contextes | `30-ddd-strategique` | Produits dix-sept minutes à une heure trente après la constitution, sans contact avec un acteur du secteur |
| Revue contradictoire du DDD, neuf scénarios | `30-ddd-strategique` | Elle éprouve la **cohérence interne** du modèle, ce qui est réel et utile. Elle n'éprouve pas son **adéquation au terrain**, qui reste entière |

> [!warning] Le corpus est une référence, jamais une phase franchie
> `DEC-C-064`. Ces éléments redeviennent exigibles **après le dernier jalon du programme d'études**, et seront alors réinstruits, non promus.

---

## 4. Renvois

- [[Delivery/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — l'intention, la thèse, les dix-huit hypothèses
- [[Delivery/90-pilotage/Journal des décisions\|Journal des décisions]] — trois décisions de coffre, aucune décision de projet
- [[Delivery/90-pilotage/Registre des statuts\|Registre des statuts]] — six faits, dix-huit hypothèses reprises, six principes
- [[Delivery/99-sources/Sources originales\|Sources originales]] — le corpus hérité, intact et empreinté
