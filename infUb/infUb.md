---
projet: "infUb"
type: "note-d-entree-projet"
statut_projet: "Étude et analyse — aucune décision de produit arrêtée"
nom_de_produit: "NON DÉCIDÉ — infUb est un nom de code interne"
territoire: "Burkina Faso"
core_domain: "Publication canonique, habilitation et preuve — proposé, non arrêté"
mise_en_conformite: 2026-09-06
tags:
  - infUb
  - moc
---

# infUb

**Infrastructure nationale de publication et de vérification de l'information institutionnelle**, au Burkina Faso.

Le projet répond à une seule question, posée par le citoyen comme par le système tiers : *« Cette information émane-t-elle bien de l'autorité qu'elle prétend, et est-elle encore valable ? »*

> [!warning] `infUb` est un nom de code, pas un nom de produit
> Le nom de la plateforme et de la marque n'est pas décidé. Le nom de code est celui du dossier et des tags.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Maturité | **Étude et analyse.** L'objet du travail en cours : établir vers quoi le projet peut évoluer, et quel produit pourrait en sortir |
| Décisions de produit prises | **Aucune** — voir [[infUb/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Dossiers peuplés | `00` · `10` · `40` · `50` — profil **discontinu**, et une phase peuplée n'est pas une phase franchie. Voir [[infUb/90-pilotage/Carte des phases\|Carte des phases]] |
| Corpus technique | 14 ADR rédigés, marqués « Accepté » **au recueil** — statut au niveau du projet : **proposé** |
| Points de cadrage contestés | **3, aucun arbitré** — voir [[infUb/90-pilotage/Registre des statuts\|Registre des statuts]] point 3 |
| Documents | 4, dont un converti depuis Word |

> [!danger] Rien n'est décidé, et le corpus technique ne doit pas faire croire le contraire
> `infUb` porte un modèle tactique et quatorze ADR alors qu'**il n'a franchi aucun jalon et n'a fait aucune mesure de terrain**. Ces documents sont **anticipés**, pas acquis : la mention « Accepté » que le recueil se donne qualifie l'état d'un texte, pas celui du projet — `DEC-C-014`.
> Trois questions non techniques restent entières, et chacune peut changer ce que le projet devient :
> 1. **Que faut-il livrer en premier ?** Les trois corrections du point 6.2 de l'étude portent sur le contenu du premier livrable. Ni la version du document de référence ni celle de l'étude n'est arrêtée.
> 2. **Qui porte l'infrastructure ?** `R1`, probabilité élevée, impact fatal. *« EU Voice avait un budget européen, une équipe compétente et 40 comptes institutionnels : il est mort faute de propriétaire. »*
> 3. **Qui en paie l'exploitation ?** `R5`, probabilité élevée, impact fatal. *« Ne pas lancer le pilote sans 24 mois d'exploitation couverts. »*

---

## Ce qui peut sortir du projet — ouvert

Le corpus met plusieurs sorties possibles sur la table, sans en retenir aucune. Les nommer est l'objet de l'étude en cours.

| Sortie possible | Ce que ce serait | D'où elle vient |
| --- | --- | --- |
| **A — Le noyau de vérification seul** | Registre d'habilitation, identifiant canonique, empreinte, page de vérification. Pas de compte citoyen, pas de feed. L'usager est l'institution et le relais | `H0` de l'étude, point 8 — et sa thèse centrale : *« la fonction à livrer en premier n'est pas la publication, c'est la vérification »* |
| **B — La plateforme du document de référence** | Espace citoyen et espace institutionnel symétriques, feed personnalisé, abonnements, commentaires arborescents, vidéo native | points 15.1 et 11.1 du [[Document de référence global]] |
| **C — La plateforme corrigée** | B, moins les commentaires arborescents, le feed et la vidéo hébergée ; plus la question institutionnelle et le signal de compréhension | Correction n°3 de l'[[Étude comparative et solution cible]], point 6.2 |
| **D — L'infrastructure complète** | Les quatre blocs — habilitation, publication et preuve, diffusion multicanale, relation citoyenne | point 7.2 de l'étude |
| **E — Une couche, pas une plateforme** | Ce que les 59 plateformes ministérielles existantes appelleraient, plutôt qu'une soixantième | Conséquence de conception n°3, point 2.2 : *« ce qui manque n'est pas une plateforme, c'est une couche que les plateformes existantes peuvent utiliser »* |

> [!warning] Aucun document d'`infUb` n'envisage de ne rien construire
> C'est une observation, pas un reproche : les quatre documents partent tous du principe que quelque chose sera bâti. Si l'étude en cours doit pouvoir conclure autrement, cette issue doit être **écrite quelque part** — sans quoi elle ne sera jamais atteignable.

---

## Les quatre horizons — proposés par l'étude, non engagés

L'étude propose que `infUb` progresse non par jalons mais par **horizons à critères de passage chiffrés**. *« Le passage ne se fait pas au calendrier mais au critère. »* **Rien n'engage le projet à suivre cette trajectoire.**

| Horizon | Contenu | Durée | Utilisateur cible |
| --- | --- | --- | --- |
| **H0** | Le registre et le permalien — habilitation, identifiant canonique, empreinte, vérification | 0 à 4 mois | L'institution et le relais, **pas le citoyen** |
| **H1** | Le pilote sectoriel — enseignement supérieur recommandé ; SMS, e-mail, radio, IVR | 4 à 12 mois | + le citoyen |
| **H2** | La preuve et l'extension — scellement N3, API d'ingestion, archive répliquée | 12 à 30 mois | + les SI tiers |
| **H3** | L'institutionnalisation — statut juridique, datacenter souverain | 30 mois + | — |

Seuils détaillés à la [[infUb/90-pilotage/Carte des phases|Carte des phases]].

---

## Navigation

### Phases ouvertes

- [[Document de référence global]] — `00-intention` — l'intention fondatrice, le problème structurel, le positionnement, la trajectoire (V1.0, converti du Word)
- [[Étude comparative et solution cible]] — `10-etudes` — benchmark Occident / Asie / Afrique, diagnostic critique, solution cible en quatre blocs, quatre horizons (V1.0)
- [[DDD tactique du noyau]] — `40-ddd-tactique` — agrégats, invariants `INV-xx`, deux machines à états, modèle relationnel d'esquisse (V0.1)
- [[Recueil d'ADR du noyau]] — `50-architecture` — les quatorze décisions, avec leurs critères de réouverture (V0.1)
- [[infUb/90-pilotage/Carte des phases|Carte des phases]] — `90-pilotage` — l'état des phases, les horizons et leurs seuils
- [[infUb/90-pilotage/Journal des décisions|Journal des décisions]] — `90-pilotage` — toute décision, sa date, son motif, sa réversibilité
- [[infUb/90-pilotage/Registre des statuts|Registre des statuts]] — `90-pilotage` — ce qui est **fait**, **décidé**, **proposé**, **contesté**, **ouvert**
- [[infUb/99-sources/Sources originales|Sources originales]] — `99-sources` — les six fichiers d'origine, intacts et empreintés

### Phases non créées

`20-cadrage-strategique` et `30-ddd-strategique` ont été **traversées sans produire de document propre** ; `60-implementation` est verrouillée. Voir `DEC-C-007` et la [[infUb/90-pilotage/Carte des phases|Carte des phases]].

---

## Doctrine de travail

Les quatre règles du coffre s'appliquent. Trois règles propres à `infUb` s'y ajoutent, tirées de ses propres documents :

1. **Un invariant sans origine documentée est un invariant inventé.** *« Il doit être supprimé ou justifié. »* Chaque invariant du modèle tactique porte un identifiant `INV-xx` et référence le principe dont il découle.
2. **Chaque ADR nomme les faits — mesurés, pas ressentis — qui obligeraient à le rouvrir.** *« Elle évite qu'une décision prise sous contrainte devienne un dogme, et qu'une décision saine soit rouverte à chaque désaccord d'humeur. »*
3. **Les règles de dépendance sont testables, pas orales.** *« Ces règles sont testables par un test d'architecture qui échoue à la compilation du build, pas par une convention orale. »*

---

## Le nœud du problème, en une page

**Ce qui est acquis.** Le diagnostic tient : 59 plateformes ministérielles développées dont 32 en ligne, l'information institutionnelle éclatée sur des pages Facebook, et une circulation documentée de faux actes administratifs — fausses circulaires, faux avis de recherche. Le positionnement — infrastructure, pas média, pas réseau social — est confirmé sans réserve par l'étude.

**Le plafond est mesuré, et il commande l'architecture.** 22,4 % d'internautes uniques. Une infrastructure « nationale » qui n'existerait que sur le web dessert structurellement moins d'un quart du pays : **la distribution hors-web est une exigence du socle, pas une extension**. Et l'indice de capital humain à 0,1668 dit que la contrainte dominante n'est ni le réseau ni le budget mais la capacité à produire : le coût marginal de publier doit tendre vers zéro, et la première interface d'ingestion doit être **ce que les agents savent déjà faire — envoyer un e-mail avec un PDF**.

**Le renversement proposé, et non tranché.** L'objectif de la V1 n'est pas « le citoyen vient sur infUb » mais « toute publication institutionnelle qui circule au Burkina Faso porte un identifiant infUb vérifiable ». Autrement dit : ne pas remplacer Facebook comme lieu de lecture, mais devenir **le fournisseur de preuve et de permalien que Facebook, WhatsApp, les radios et la presse utilisent**. Le cas d'usage dominant n'est pas la consultation d'un feed, c'est *« j'ai reçu un PDF sur WhatsApp — est-il vrai ? »*.

**L'actif défendable, et non tranché.** Pas le réseau d'organisations : il est réplicable par décret, les institutions n'ayant pas le choix d'y être. Mais **le registre d'habilitation et l'archive canonique** — la capacité, pour n'importe quel système ou n'importe quel citoyen, de vérifier qu'un acte émane bien de l'autorité qu'il prétend, et de le retrouver identique dix ans plus tard.

**Ce qui reste entier.** Qui porte l'infrastructure, et qui en paie l'exploitation. Le benchmark est sans ambiguïté sur ce point : ce n'est pas la technique qui tue ces projets.

---

## Points d'attention relevés à la mise en conformité

> [!note] Observations de rangement, pas décisions
> Relevées le 2026-09-06 en lisant les quatre documents. Elles n'engagent rien ; elles signalent des ruptures de chaîne à lever.

1. **Le document amont le plus cité est absent du coffre.** L'[[Étude comparative et solution cible]] et le [[DDD tactique du noyau]] déclarent tous deux `00_DOCUMENT_FONDATEUR_V0.1.md` — ou « Document fondateur V0.1 » — parmi leurs documents amont. **Ce fichier n'existe nulle part dans le coffre.** Il est pourtant cité **31 fois** dans les trois documents, et la table de traçabilité du [[Recueil d'ADR du noyau]] y rattache directement quatre ADR par des références de la forme `principe fondateur 6.2` et `principe fondateur 6.4`. **La chaîne de traçabilité de ces ADR pointe donc vers un document que personne ne peut ouvrir.** C'est le manque le plus sérieux relevé ici.

2. **Désynchronisation de version, comme chez `ecoFab`.** Le [[Document de référence global]] est en **V1.0**, l'étude qui le corrige aussi en **V1.0**, et le document de référence n'a **pas** été amendé. Trois de ses « décisions structurantes prises » (point 19.1) sont contredites au point 6.2 de l'étude. **Le document de référence n'est donc plus le document le plus à jour sur son propre objet** — sans qu'aucun des deux ne le signale.

3. **Le titre lui-même a glissé, sans être harmonisé.** Le `.docx` s'intitule *« Infrastructure nationale de publication, de découverte et de **diffusion** de l'information »*. L'étude, la [[Cartographie du portefeuille]] et l'[[Index du coffre]] disent *« publication et de **vérification** »*. Ce glissement de la diffusion vers la vérification **est** la Correction n°2. Les deux titres coexistent.

4. **Une recommandation explicite n'a pas été appliquée.** L'étude recommande de retirer le *« NIVEAU D — couches sociales »* de la trajectoire publiée, au motif qu'il *« fragilise la proposition de valeur "ce n'est pas un réseau social" auprès des institutions »*. Il figure toujours au point 17 du document de référence.

5. **Trois ADR portent la mention « accepté, révisable ».** `ADR-011` (vidéo référencée), `ADR-012` (recherche PostgreSQL), `ADR-013` (OIDC, Keycloak différé). La nuance est de leur auteur ; elle rappelle que même à l'intérieur du recueil, tout n'a pas le même degré de solidité.

6. **`infUb` n'a aucun critère d'autorisation de décision.** `ecoFab` conditionne ses décisions de produit à des jalons d'étude et exige un niveau de preuve minimal. `infUb` n'a ni l'un ni l'autre : les horizons `H0` à `H3` conditionnent le passage d'une étape à la suivante, pas la prise de décision. **Tant que ce dispositif n'existe pas, rien ne peut formellement passer de « proposé » à « décidé »** — c'est le chantier de méthode le plus immédiat.

7. **Deux fichiers `.html` supprimés.** `Étude cible infUb.html` et `Noyau tactique infUb.html` étaient des coquilles de chargement d'artifacts `claude.ai`, vides hors connexion. Supprimés le 2026-09-06 (`DEC-C-013`) ; nom, taille et empreinte conservés au point 3 de [[infUb/99-sources/Sources originales|Sources originales]].
