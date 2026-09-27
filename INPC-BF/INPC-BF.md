---
projet: "INPC-BF"
type: "note-d-entree-projet"
statut_projet: "Corpus versé en référence — corpus incomplet, aucune phase d'étude ouverte, aucune décision de projet"
nom_de_produit: "INPC-BF — Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso. Sigle employé par le corpus, non décidé comme nom de produit"
corpus_herite: "14 fichiers en 99-sources sur les 17 que le corpus déclare — référence, non opposable"
mise_en_conformite: 2026-09-09
cree_le: 2026-09-09
tags:
  - INPC-BF
  - moc
---

# INPC-BF

**Infrastructure de mémoire du patrimoine culturel vivant du Burkina Faso.** L'objet n'est ni une application ni un site : c'est un **corpus de connaissances vivantes**, structuré pour survivre aux technologies qui le porteront successivement, sur un horizon que le corpus formule en décennies voire en siècles.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Phase | `00-intention` et `99-sources` ouvertes le 2026-09-09. **`10-etudes` n'est pas ouverte** |
| Décisions de projet inscrites | **Aucune** — voir [[INPC-BF/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Décisions de coffre | Deux, `DEC-C-065` et `DEC-C-066` |
| Corpus hérité | **14 fichiers** sur les **17 que le corpus déclare**. Archivé et empreinté en [[INPC-BF/99-sources/Sources originales\|99-sources]]. **Aucun n'est opposable** |
| **Intégrité du corpus** | **Incomplète.** Trois documents fondateurs manquent — voir ci-dessous |

> [!danger] Trois documents fondateurs sont absents de l'archive
> Le corpus déclare onze documents de fondation conceptuelle : *« la vision, le référentiel conceptuel, la taxonomie, la gouvernance, l'ontologie en six parties, l'ancrage institutionnel »*. L'archive en contient **huit**.
> Manquent la **charte fondatrice**, le **référentiel conceptuel** et la **taxonomie** — c'est-à-dire la vision du projet, la définition de ses objets de pensée, et leur classification.
> Ces trois documents sont cités **17, 33 et 34 fois** par les documents présents. L'ontologie qui formalise les relations entre ces objets est là ; les objets, eux, ne le sont pas.
> **Aucune reprise sérieuse de l'intention n'est possible tant qu'ils ne sont pas retrouvés ou reconstitués.** C'est le premier travail du projet, et il précède tout le reste.

---

## Ce que la mise en conformité a changé

| Opération | Effet | Décision |
| --- | --- | --- |
| **Ouverture de l'archive et mise en convention** | Le dossier ne contenait qu'une archive compressée, `files.zip`. Elle est extraite en `99-sources/documents`, l'archive conservée intacte. Note d'entrée, phases préfixées, journal, registre des statuts, carte des phases | `DEC-C-065` |
| **Rétrogradation du corpus et constat d'incomplétude** | Le corpus devient **matériau de référence**, et son incomplétude est consignée comme un fait vérifié | `DEC-C-066` |

---

## Navigation

- [[INPC-BF/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] — `00-intention` — l'intention telle qu'elle est reconstituable, et ce qui manque pour la tenir (V0.1)
- [[INPC-BF/90-pilotage/Carte des phases\|Carte des phases]] — `90-pilotage`
- [[INPC-BF/90-pilotage/Journal des décisions\|Journal des décisions]] — `90-pilotage`
- [[INPC-BF/90-pilotage/Registre des statuts\|Registre des statuts]] — `90-pilotage`
- [[INPC-BF/99-sources/Sources originales\|Sources originales]] — `99-sources` — le corpus hérité, intact, empreinté, non opposable

**Phases non créées** : `10-etudes`, `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture`, `60-implementation`.

---

## Le nœud du problème, en une page

**L'intention.** Capturer le patrimoine culturel du Burkina Faso — langues nationales, groupes ethniques, royaumes, traditions orales, savoirs, croyances, arts — selon un cycle sans fin et sans suppression : identifier, collecter, qualifier, documenter, valider, conserver, publier, enrichir, archiver. Les versions et les variantes y **coexistent** au lieu de s'écraser.

**La discipline la plus remarquable du corpus.** La **séparation stricte du patrimoine et de la technologie** est tenue jusqu'au bout : sur les onze documents de fondation, aucun nom de technologie, aucun format de fichier, aucun outil ne s'y glisse. Le premier document de la série d'architecture annonce d'ailleurs cette rupture explicitement, en disant qu'il *« rompt délibérément avec cette discipline »* parce qu'il change de nature. Pour un projet à horizon pluridécennal, cette discipline est la bonne, et elle est rare.

**Le corpus contient son propre audit, et cet audit est sévère.** Un document dédié relève six manques structurels : la gouvernance n'existe pas comme concept, le consentement et les savoirs restreints sont absents, la propriété intellectuelle est sous-spécifiée, les standards d'interopérabilité ne sont pas mentionnés, le cadre juridique burkinabè est absent, et la pérennité concrète du projet n'est pas traitée.

**Le corpus a répondu à trois de ces six manques, et pas aux autres.** La charte de gouvernance et d'éthique traite la gouvernance ; les contextes bornés *Consentement et Droits* et *Accès* traitent le consentement, les régimes de propriété et les niveaux d'accès ; la charte d'ancrage institutionnel traite le rattachement. En revanche, les cadres internationaux nommés par l'audit — **le consentement libre, préalable et éclairé, la norme CIDOC-CRM, le Dublin Core, les cinq domaines de la Convention UNESCO de 2003** — n'apparaissent **dans aucun document du corpus, uniquement dans l'audit lui-même**. La recommandation d'alignement international n'a pas été suivie.

**Le point le plus lourd.** L'audit pose que le principe d'ouverture — *« le patrimoine appartient à tous »* — entre en tension avec l'existence de savoirs initiatiques, sacrés ou réservés, qu'un détenteur peut vouloir conserver sans les rendre publics. Cette tension touche la **légitimité du projet auprès des détenteurs de savoir**, et elle ne se résout pas par la modélisation : elle se tranche avec les communautés concernées, sur le terrain.

**Et pourtant, l'essentiel manque.** La charte fondatrice, le référentiel conceptuel et la taxonomie sont absents de l'archive, alors que tout le corpus s'y adosse. Le projet, tel qu'il est versé au coffre, est **une ontologie sans son référentiel** et **une architecture sans sa vision**.

---

## Doctrine de travail

*S'y ajoutent les **règles de méthode du coffre** : voir [[Doctrine du coffre]].*

1. **Séparation des trois mondes** — observé, imaginé, construit.
2. **Aucune promotion silencieuse de statut.**
3. **Pas de chiffre sans source** — les chiffres du corpus sur les langues et les groupes ethniques n'en citent aucune.
4. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.
5. **Le corpus est cité, jamais invoqué.**

---

## Recouvrements à instruire

| Projet | Nature | Portée |
| --- | --- | --- |
| `gounhri` | Infrastructure sociale numérique souveraine du Burkina Faso, traitant les cercles, les groupes et les communautés ancrées. Un patrimoine vivant est porté par des communautés vivantes | **Direct, non instruit** |
| `infUb` | Les deux modélisent une **autorité de publication** et une **validation institutionnelle** : qui a le droit de dire qu'une information fait foi | **Direct, non instruit** — et c'est le recouvrement le plus précis |
| `synapse` | La validation d'un savoir détenu par une personne rejoint la validation d'une compétence | **Faible** |

Ces recouvrements sont portés à [[Cartographie du portefeuille]].

---

## Étape suivante

**Retrouver ou reconstituer les trois documents fondateurs absents** — la charte fondatrice, le référentiel conceptuel et la taxonomie. Tant qu'ils manquent, l'intention du projet n'est connue que par les citations qu'en font les documents survivants, ce qui est une source de seconde main.

Cette recherche précède toute autre chose, y compris l'écriture d'un programme d'études. Si les documents sont introuvables, leur reconstitution devient elle-même le premier lot d'étude, et elle devra être conduite en sachant qu'elle **réinvente** plutôt qu'elle ne restitue.
