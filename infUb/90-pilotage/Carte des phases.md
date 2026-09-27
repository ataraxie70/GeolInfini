---
projet: "infUb"
type: "carte-de-pilotage"
phase: "90-pilotage"
objet: "Chemin complet de l'idée à l'implémentation, et critère qui déverrouille chaque phase"
maturite: "Étude et analyse — aucune décision de produit arrêtée"
phases_peuplees: "00 · 10 · 40 · 50"
horizon_courant: "avant H0 — trajectoire proposée, non engagée"
cree_le: 2026-09-06
tags:
  - infUb
  - pilotage
  - phases
  - horizons
---

# Carte des phases

Le chemin complet que suit `infUb`, de l'intention jusqu'au code. **Toutes les phases sont décrites ici ; seules les phases ouvertes existent physiquement sur le disque.**

> [!important] La création d'un dossier de phase est une décision
> Elle s'inscrit au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]]. L'arborescence actuelle est fixée par `DEC-C-007`.

---

## État des phases

| Dossier | Contenu attendu | Statut | Document qui l'ouvre |
| --- | --- | --- | --- |
| `00-intention` | Vision, intention fondatrice, problème structurel, positionnement | **Ouverte** | [[Document de référence global]] |
| `10-etudes` | Benchmark, terrain, mesures, arbitrages structurants | **Ouverte** | [[Étude comparative et solution cible]] |
| `20-cadrage-strategique` | Zero-to-One, actif stratégique, marché initial, modèle économique | **Traversée sans dossier** | Aucun document propre — voir ci-dessous |
| `30-ddd-strategique` | Domaines, *core domain*, contextes bornés, *context map*, langage ubiquitaire | **Traversée sans dossier** | Aucun document propre — voir ci-dessous |
| `40-ddd-tactique` | Agrégats, entités, objets-valeur, événements, invariants, machines à états | **Ouverte** | [[DDD tactique du noyau]] |
| `50-architecture` | ADR, modèle de données, hébergement, sécurité | **Ouverte** | [[Recueil d'ADR du noyau]] — 14 ADR **proposés** |
| `60-implementation` | Spécifications exécutables, code, tests, déploiement | **Verrouillée** | Aucune ligne de code. Déverrouillée par le passage de **H0** |
| `90-pilotage` | Journal des décisions, registre des statuts, cartes | **Ouverte** | — |
| `99-sources` | Fichiers d'origine intacts, empreintes, provenance | **Ouverte** | — |

> [!danger] Une phase peuplée n'est pas une phase franchie
> Au **2026-09-06**, `infUb` est **en étude et en analyse** : le travail porte sur ce vers quoi le projet peut évoluer et sur le produit qui pourrait en sortir. **Aucune décision de produit n'est arrêtée** — `DEC-C-014`.
> Les dossiers `40` et `50` sont peuplés parce que des documents de ce **type de contenu** existent, pas parce que le projet aurait atteint ce stade de maturité. Ils ont été écrits **par anticipation**, avant toute mesure de terrain : le [[Recueil d'ADR du noyau]] le reconnaît lui-même en dotant chaque ADR de critères de réouverture.
> **La maturité réelle du projet est celle de `10-etudes`.** Le classement par dossier dit de quoi un document parle ; il ne dit pas où en est le projet.

> [!warning] Un profil de phases discontinu, et c'est voulu
> `infUb` a livré `40` et `50` **sans jamais avoir ouvert `20` ni `30`**. Ce n'est pas un oubli de rangement : ces deux phases ont été **traversées à l'intérieur d'autres documents**, sans jamais produire de document propre.
>
> | Phase sautée | Où son contenu se trouve réellement |
> | --- | --- |
> | `20-cadrage-strategique` | point 8 « Modèle stratégique » et point 9 « Actif stratégique et position Zero-to-One » du [[Document de référence global]] ; point 6 « Diagnostic critique » et point 7 « Solution cible » de l'[[Étude comparative et solution cible]] ; le modèle économique au point 7.9 |
> | `30-ddd-strategique` | point 10 « Architecture métier et DDD » du document de référence ; point 1 « Langage ubiquitaire » et point 2 « Carte des contextes » du [[DDD tactique du noyau]] |
>
> **Conséquence de pilotage.** Le cadrage stratégique d'`infUb` est le seul contenu du projet dont **deux versions concurrentes coexistent** sans arbitrage : celle du document de référence et celle, contradictoire, de l'étude (point 6.2). Un dossier `20-cadrage-strategique` ne devra être créé que pour accueillir le document qui tranche — pas pour ranger l'existant.

---

## Les quatre horizons — un dispositif proposé, non engagé

`infUb` n'a pas de jalons d'étude. L'[[Étude comparative et solution cible]] lui propose au point 8 **quatre horizons assortis de critères de passage chiffrés** : *« Le passage ne se fait pas au calendrier mais au critère. »*

> [!warning] Cette trajectoire est une proposition de l'étude, pas un plan arrêté
> Elle est reproduite ici parce qu'elle est le seul dispositif de progression que le corpus ait formulé, et parce que ses seuils sont utiles à l'analyse en cours. **Rien n'engage `infUb` à la suivre**, et ce qui sortira réellement du projet reste ouvert — voir [[infUb|la note d'entrée]].

```text
AVANT H0 — cadrage, étude, DDD, ADR                      ← position au 2026-09-06
        │
        ▼  ── H0 — « Le registre et le permalien » ────────────  0 à 4 mois
           Bloc A (registre d'habilitation) + Bloc B minimal
           (identifiant canonique, resolveur, empreinte, verification)
           Ni compte citoyen, ni abonnement, ni feed, ni commentaire, ni video
        │
        ▼  ── H1 — « Le pilote sectoriel » ───────────────────  4 à 12 mois
           Secteur pilote recommande : l'enseignement superieur
           Bloc C (SMS, e-mail, flux, radio, IVR) + Bloc D minimal
        │
        ▼  ── H2 — « La preuve et l'extension » ──────────────  12 a 30 mois
           Scellement N3, API d'ingestion, archive repliquee,
           extension a 2 ou 3 secteurs supplementaires
        │
        ▼  ── H3 — « L'institutionnalisation » ───────────────  30 mois +
           Statut juridique consolide, datacenter souverain,
           interoperabilite nationale
```

### Critères de passage, tels qu'ils sont chiffrés dans l'étude

| Horizon | Critère | Seuil |
| --- | --- | --- |
| **H0** | Organisations habilitées N1 ou N2 | ≥ 10 |
| | Publications canoniques déposées | ≥ 200 |
| | Permaliens `infUb` repris sur des canaux tiers | ≥ 50 |
| | Requêtes de vérification (page ou API) | ≥ 500 / mois |
| | Délai médian décision institutionnelle → publication | ≤ 48 h |
| **H1** | Établissements publiant régulièrement | ≥ 5 |
| | Citoyens avec périmètre déclaré | ≥ 5 000 |
| | Part des publications de l'établissement passant par `infUb` | ≥ 60 % |
| | Publications retrouvées après 6 mois par un non-abonné | ≥ 80 % de succès |
| | Réduction du délai d'accès à une information d'échéance | mesurée, quel que soit le résultat |
| | **Financement du coût récurrent** | **24 mois couverts** |
| **H2** | Systèmes tiers consommant l'API | ≥ 5 |
| | Vérifications de documents par mois | ≥ 10 000 |
| | Publications scellées | ≥ 30 % du flux N2 |
| | Copie d'archive vérifiée chez un tiers | oui |
| | Homologation sécurité | obtenue |

> [!danger] Deux conditions bloquantes se situent **avant** H0, et ne sont pas des critères techniques
> L'étude les pose au point 11 et au point 12 :
> 1. **Le porteur institutionnel doit être trouvé avant le pilote.** *« EU Voice avait un budget européen, une équipe compétente et 40 comptes institutionnels : il est mort faute de propriétaire. C'est le mode d'échec le plus probable ici aussi. »* Le sondage institutionnel est explicitement à faire **avant tout développement de H1**.
> 2. **Le coût récurrent domine tout.** *« Ne pas lancer le pilote sans 24 mois d'exploitation couverts. »*
>
> Aucune des deux n'est engagée. Voir le risque `R1` au [[infUb/90-pilotage/Registre des statuts|Registre des statuts]].

---

## Ce qui déverrouille `60-implementation`

Le [[Recueil d'ADR du noyau]] et le point 9 du [[DDD tactique du noyau]] décrivent un socle qui **paraît** prêt à coder — arborescence de paquets, règles de dépendance vérifiables, machines à états, invariants numérotés. **La phase reste fermée**, et pas pour une raison technique : les trois corrections du point 6.2 de l'étude portent sur le **contenu du premier livrable**, c'est-à-dire précisément sur ce qui serait construit en premier.

Coder avant d'avoir tranché reviendrait à trancher par le code — et l'objet de l'étude en cours est justement d'établir **ce qui doit sortir du projet**.

| Verrou | Ce qu'il faut pour le lever |
| --- | --- |
| Arbitrage des trois corrections du point 6.2 | Une décision `DEC-P-001` au [[infUb/90-pilotage/Journal des décisions\|Journal des décisions]] — la première du projet |
| Porteur institutionnel | Sondage institutionnel — étude résiduelle point 11 |
| Coût récurrent couvert | Modélisation à trois scénarios — étude résiduelle point 11 |
| **Un critère d'autorisation de décision** | `infUb` n'en a aucun : ni jalon, ni niveau de preuve exigé. Tant qu'il n'existe pas, rien ne peut formellement passer de « proposé » à « décidé » |

---

## Règles de franchissement

1. Une phase ne s'ouvre que par un **document livré** qui en porte le contenu, pas par anticipation.
2. Le franchissement d'un horizon se constate sur les **critères chiffrés** ci-dessus, pas sur le calendrier.
3. Le franchissement est inscrit au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et les mesures qui le fondent.
4. Une phase ouverte par erreur se referme : le dossier est retiré et la décision annulée est **conservée au journal**, jamais effacée.
5. Les quatorze ADR portent chacun des **critères de réouverture mesurés**. Ils sont à relire à chaque passage d'horizon : un ADR écrit avant `H0` dont le critère de réouverture est atteint en `H1` doit être rouvert, pas défendu.
6. **Peupler un dossier de phase n'ouvre rien.** Un document rangé en `50-architecture` reste une proposition tant qu'aucune décision ne l'a arrêté — `DEC-C-014`.
