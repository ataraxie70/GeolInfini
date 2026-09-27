---
projet: "ecoFab"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'idée à l'implémentation, et jalon déverrouillant chaque phase"
phase_courante: "10-etudes"
cree_le: 2026-09-06
tags:
  - ecoFab
  - pilotage
  - phases
---

# Carte des phases

Le chemin complet que suivra `ecoFab`, de l'intention jusqu'au code. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent physiquement sur le disque.**

> [!important] Pourquoi les dossiers futurs ne sont pas créés
> Créer à l'avance un dossier `60-implementation` reviendrait à afficher la construction comme acquise, alors que l'issue **D — ne pas construire** reste ouverte jusqu'au jalon 4. C'est une application directe de la règle *« aucune promotion silencieuse de statut »*.
> **La création d'un dossier de phase est elle-même une décision, à inscrire au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]].**

---

## État des phases

| Dossier | Contenu attendu | Statut | Déverrouillé par |
| --- | --- | --- | --- |
| `00-intention` | Vision, intention fondatrice, monde à modéliser, possibilités ouvertes | **Ouverte** | — |
| `10-etudes` | Protocole de recherche, lots L0→L9, verbatims, mesures, notes de jalon | **Ouverte** | — |
| `20-cadrage-strategique` | Zero-to-One, proposition de valeur, marché initial, actif indétrônable, secret | Verrouillée | **Jalon 4** |
| `30-ddd-strategique` | Domaines et sous-domaines, *core domain*, contextes bornés, *context map*, langage ubiquitaire | Verrouillée | **Jalon 4** |
| `40-ddd-tactique` | Agrégats, entités, objets-valeur, événements de domaine, invariants, politiques | Verrouillée | Cadrage et DDD stratégique validés |
| `50-architecture` | ADR, style architectural, modèle de données, hébergement, protocoles, sécurité | Verrouillée | DDD validé |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | Verrouillée | Architecture validée |
| `90-pilotage` | Journal des décisions, registre des statuts, cartes, notes de jalon | **Ouverte** | — |
| `99-sources` | Fichiers d'origine intacts, empreintes, provenance | **Ouverte** | — |

Statut au **2026-09-06** : phase courante `10-etudes`, **avant jalon 1**.

---

## Les jalons de décision

Repris du point 4 du [[Programme d'études approfondies]] **V0.3**. Le régime de conduite est fixé à **une seule personne** et la fenêtre visée à la **rentrée d'octobre 2026** (`DEC-C-048`).

```
VAGUE 0 — Desk pur, aucune autorisation      8 – 30 septembre 2026
   L7a relevé CampusFaso · L7b cimetière · L0 protocole · L5 lettre
        |
        v  -- JALON 1 -- 30 septembre 2026 ------------------------------
           L'emploi du temps est-il absent du versant administratif ?
           De quoi meurent les plateformes comparables ?
           Sortie possible : reformulation, ou ARRÊT sans dépense.
        |
VAGUE 1 — Fenêtre d'observation      1er octobre – 15 novembre 2026
   L3 délégués d'abord · L1 · L6 embarqué · L2 documentaire
        |
        v  -- JALON 2 -- fin novembre 2026 ------------------------------
           Le délégué reconnaît-il une charge et un gain ?
           Sortie possible : issue C ou D.
        |
VAGUE 2 — Desk d'hiver               décembre 2026 – janvier 2027
   L8 en premier · L10 l'actif · L11 le payeur
        |
        v  -- JALON 3a -- fin janvier 2027 ------------------------------
           Existe-t-il un actif, et quelqu'un pour payer ?
        |
VAGUE 3 — Seconde fenêtre                   juin – juillet 2027
   L4 perte documentaire, mesurée quand elle se produit
        |
        v  -- JALON 3b -- août 2027 -------------------------------------
           Sortie possible : issue B ou D.
        |
VAGUE 4 — Épreuve              rentrée 2027 – printemps 2028
   L9 dispositif semi-manuel sur 1 à 3 promotions
        |
        v  -- JALON 4 -- printemps 2028 ---------------------------------
           Un gain mesurable est-il démontré ?
           Sortie : cadrage stratégique et DDD, ou arrêt.
```

> [!warning] Conséquence du régime solo, à ne pas découvrir plus tard
> **L'issue A n'est pas atteignable avant le printemps 2028.** Les jalons 1, 2 et 3a le sont dans les cinq mois. Les jalons 3b et 4 dépendent de fenêtres qui n'existent qu'une fois par an.
> Le raccourcir supposerait soit d'ajouter des personnes, soit de renoncer à mesurer la perte documentaire — c'est-à-dire à instruire l'actif.

### Ce que chaque jalon autorise

| Jalon | Date atteignable | Décisions qu'il permet de lever | Phase qu'il déverrouille |
| --- | --- | --- | --- |
| **1** | 30 septembre 2026 | Reformulation du périmètre ; arrêt anticipé | — reste en `10-etudes` |
| **2** | fin novembre 2026 | Producteur retenu ; périmètre et frontières ; relation à CampusFaso ; continuité des promotions ; modèle d'identité | — |
| **3a** | fin janvier 2027 | **Nature du projet** — produit, infrastructure publique ou œuvre ; **actif candidat et régime de propriété** ; gouvernance, modération, archivage | — |
| **3b** | août 2027 | Publics retenus ; modèle documentaire et déduplication ; centralisation ou fédération ; structure des communautés | — |
| **4** | printemps 2028 | Premier marché ou établissement cible ; **Core Domain** ; **produit minimal** | `20-cadrage-strategique` et `30-ddd-strategique` |
| *après 4* | — | Forme juridique, modèle économique, pile technique, hébergement, protocole, modèle de données, recours à l'IA ou au fédéré | `40` → `50` → `60` |

---

## Saisonnalité — contrainte de calendrier réel

La vague 1 couvre **octobre-novembre** — constitution des promotions, création des groupes, désignation des délégués. La vague 3 revient en **juin-juillet 2027** pour la fin de cycle, moment où se produit la perte documentaire.

> [!warning] Un programme qui manque ces deux fenêtres observera un régime de croisière et ratera les transitions — qui sont précisément l'objet de l'étude.

**Conséquence de pilotage au 2026-09-08** : la fenêtre s'ouvre dans **trois semaines**. Le [[Protocole de la vague 0]] est écrit et son exécution est engagée. Passée cette fenêtre, la suivante est en octobre 2027.

### État d'exécution de la vague 0

| Travail | Semaine prévue | État au 2026-09-08 | Sortie |
| --- | --- | --- | --- |
| `L7a` relevé du périmètre CampusFaso | S1 | **Conduit** | [[Relevé du périmètre CampusFaso]] — faits `F12` et `F13` |
| `L5` demande écrite d'information | S1 | **Lettre rédigée**, à envoyer | [[Trousse de terrain]] point 7.1 — objet redéfini par `L7a` : le module est-il rempli ? |
| `L0` démarches CIL | S1 à S3 | **Instruites**, dépôt à effectuer | Registre des traitements rédigé. **Dépôt sur place obligatoire** — seule démarche non délégable |
| `L7b` cimetière et autopsie des échecs | S2 | **Conduit** | [[Cimetière et autopsie des échecs]] — 8 fiches, fait `F14`. Aucun seuil franchi |
| `L0` cadre d'échantillonnage et trousse d'entretien | S2 à S3 | **Produits** | [[Trousse de terrain]] — quatre strates, trois consentements, deux lettres, socle actualisé 2023/2024 |
| Note de **jalon 1** | S4 | **Rendue partiellement** | [[Note de jalon 1]] — deux questions sur trois. Issue **proposée** : reformuler le périmètre. Non inscrite |
| Addendum de clôture du jalon 1 | avant le 30 sept. | **Pré-enregistré, à renseigner** | [[Addendum au jalon 1]] — règle de décision écrite le 2026-09-08, constat à porter au fil des retours |

### État de préparation de la vague 1

| Élément | État au 2026-09-08 |
| --- | --- |
| Instruments de collecte | **Produits** — [[Protocole de la vague 1]] : guide `L3` v2, protocole `L1`, grille `L2` |
| Définitions opérationnelles des seuils | **Produites et pré-enregistrées** — point 6 du même protocole |
| Double codage, substitut solo au codage par un tiers | **Défini** — point 6.7 |
| Ouverture de la vague | **Bloquée** par trois verrous : jalon 1 non clos, récépissé CIL non obtenu, fenêtre non ouverte |

---

## Règles de franchissement

1. Une phase ne s'ouvre que par une **note de jalon** datée, versée dans `10-etudes`, concluant explicitement sur l'issue retenue (A, B, C ou D).
2. Le franchissement est inscrit au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les preuves qui le fondent.
3. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
4. Le socle documentaire (point 2 du programme) est **revu à chaque jalon** — plusieurs de ses sources sont antérieures à 2026 et se périment.
