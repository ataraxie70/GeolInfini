DDD Tactique — Patrimoine & Connaissance

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Série Architecture Logicielle, document 2

---

Préambule

La cartographie stratégique a fixé les frontières entre six bounded contexts. Ce document entre dans le premier d'entre eux, Patrimoine & Connaissance, le domaine cœur qui porte le contenu patrimonial lui-même. Il répond à une question que la stratégie ne pose jamais : à l'intérieur de cette frontière, quelles sont les unités de cohérence, quelles règles chacune impose-t-elle à elle-même, et par quel événement fait-elle savoir au reste du système ce qui vient de se produire.

Comme le document précédent, celui-ci ne redéfinit rien de l'ontologie. Il organise, au niveau tactique, ce qu'elle a déjà établi pour les neuf entités que ce contexte porte : Patrimoine, Connaissance, Version, Traduction, Tradition, Rite, Valeur, Langue, Objet.

---

1. Les agrégats retenus

Un agrégat, au sens du DDD tactique, est un ensemble d'entités et de value objects modifié comme un tout, à travers une seule racine, qui seule garantit que ses invariants restent respectés à chaque changement. Cinq agrégats sont retenus dans ce contexte.

1.1. Pourquoi Patrimoine n'est pas un agrégat

Patrimoine n'apparaît, dans cette conception tactique, comme la racine d'aucun agrégat. L'ontologie l'a déjà annoncé en sa Partie IV, section 5 : la Tradition, la Valeur et la Langue héritent du Patrimoine, ce qui signifie qu'aucune d'elles n'est un patrimoine plus un supplément, mais qu'elles *sont* chacune une forme de patrimoine à part entière. Patrimoine devient ici un type de référence partagé — une identité commune que Tradition, Valeur et Langue portent chacune — plutôt qu'un agrégat que ces trois-là viendraient compléter. Un agrégat « Patrimoine » unique, qui aurait tenté de contenir toutes les traditions, toutes les valeurs et toutes les langues du système, aurait par ailleurs constitué exactement l'anti-patron que le DDD tactique met en garde en premier : un agrégat démesuré, source de contention permanente entre toutes les équipes qui y touchent.

1.2. Les cinq agrégats

- **Connaissance**, contenant Version et Traduction comme entités internes.
- **Tradition**, portant également le Rite comme spécialisation, conformément à l'héritage déjà établi par l'ontologie.
- **Valeur**.
- **Langue**.
- **Objet**.

Chacun est détaillé ci-dessous.

---

2. Connaissance

2.1. Racine et identité

Connaissance est la racine. Son identité, ConnaissanceId, ne change jamais et ne se confond avec aucune des versions ou traductions qu'elle porte.

2.2. Entités internes

**Version.** Une déclinaison de contenu, identifiée par VersionId, propre à cette Connaissance et n'ayant aucun sens en dehors d'elle. Conformément à la Partie III de l'ontologie, chaque Version porte son propre contenu et, si nécessaire, son propre statut épistémique.

**Traduction.** Une transposition linguistique, identifiée par TraductionId, référençant une LangueId cible.

2.3. Value objects

- **StatutÉpistémique** : une des quatre valeurs fixées par le référentiel conceptuel — Fait documenté, Tradition orale, Interprétation, Analyse contemporaine. Obligatoire sur la Connaissance elle-même et sur chaque Version.
- **PatrimoineRef** : une référence à l'un des trois agrégats qui portent l'identité de patrimoine — TraditionId, ValeurId ou LangueId. Ce value object matérialise la relation « décrit » sans jamais faire porter à Connaissance le contenu de l'agrégat référencé.
- **SourceRef** : une référence légère vers le contexte Provenance & Contexte, qui ne contient qu'un identifiant et une désignation suffisante pour l'affichage, jamais la source complète.

2.4. Invariants

- Une Connaissance ne peut être créée sans au moins un PatrimoineRef, conformément à la cardinalité « 1..n patrimoines par connaissance » déjà fixée par l'ontologie.
- Une Connaissance ne peut être créée sans au moins un SourceRef, conformément à l'interdiction posée par l'ontologie en sa Partie IV : aucune connaissance n'existe sans source.
- Une Connaissance ne peut être créée sans StatutÉpistémique renseigné.
- Le contenu initial d'une Connaissance, une fois créé, n'est jamais modifié. Toute évolution du contenu prend exclusivement la forme d'une nouvelle Version ajoutée à la collection existante, jamais d'une réécriture.
- Aucune Version ni aucune Traduction, une fois ajoutée, n'est retirée de l'agrégat.

2.5. Opérations exposées

- `ProposerConnaissance` — crée l'agrégat avec son contenu initial, ses PatrimoineRef, ses SourceRef et son StatutÉpistémique. Aucune opération de création n'est valide si l'un de ces éléments manque.
- `AjouterVersion` — ajoute une nouvelle Version, avec son propre StatutÉpistémique.
- `AjouterTraduction` — ajoute une nouvelle Traduction vers une LangueId cible.

Aucune opération de modification ou de suppression du contenu existant n'est exposée par cet agrégat. Ce choix n'est pas un oubli : c'est la traduction directe du principe de non-suppression posé par l'ontologie dès sa Partie I.

2.6. Référencement externe d'une Version précise

La relation « concerne », par laquelle un avis de validation du contexte Gouvernance & Validation vise une Version précise plutôt que la Connaissance dans son ensemble, exige qu'une Version reste adressable depuis l'extérieur de l'agrégat, bien qu'elle n'en soit pas la racine. Cette adressabilité passe par un value object composite, **VersionRef**, qui associe toujours ConnaissanceId et VersionId ensemble. Aucun autre contexte ne peut référencer une Version par son seul VersionId, ce qui garantit qu'elle demeure toujours resituée dans son agrégat d'appartenance.

2.7. Événements de domaine

- `ConnaissanceProposée`
- `VersionAjoutée`
- `TraductionAjoutée`

---

3. Tradition (incluant le Rite)

3.1. Racine et identité

Tradition est la racine. Son identité, TraditionId, sert également d'identité de patrimoine au sens de PatrimoineRef.

3.2. Value object de spécialisation

**NatureTradition** distingue une Tradition générique d'un Rite, conformément à l'héritage posé par l'ontologie : le Rite ne devient pas un agrégat séparé, il reste une Tradition portant cette nature particulière, avec les propriétés supplémentaires qu'elle implique — une séquence ou une structure descriptible, une occasion ou un motif.

3.3. Propriétés et références externes

- **CommunautésAppartenance** : liste de CommunautéRef, conformément à la relation « appartient à ». Cardinalité 1..n.
- **CommunautésPratiquantes** : liste distincte de CommunautéRef, conformément à la relation « est pratiqué par ». Cette liste n'est jamais confondue avec la précédente : seule l'appartenance engage l'autorité de consentement définie par la charte de gouvernance, la pratique ne l'engage pas.
- **LieuRef** optionnel, conformément à « se situe à ».
- **DériveDe** : une référence optionnelle vers une autre TraditionId d'origine.
- **VariantesDe** : une liste de références vers d'autres TraditionId apparentées, relation symétrique.

3.4. Invariants

- Au moins une CommunautéAppartenance, toujours, conformément à la cardinalité fixée par l'ontologie.
- Un Rite (nature = Rite) porte obligatoirement une description de sa séquence ou de sa structure, conformément à sa définition dans le référentiel conceptuel ; une Tradition générique n'y est pas tenue.

3.5. Événements de domaine

- `TraditionEnregistrée`
- `VarianteDéclarée`
- `FiliationDéclarée`

---

4. Valeur

4.1. Racine et identité

Valeur est la racine, identifiée par ValeurId, servant également d'identité de patrimoine.

4.2. Propriétés

- Désignation, description de sa signification.
- **TraditionsPortantes** : liste de TraditionRef, conformément à la relation « est transmise par ». Cardinalité 1..n : une Valeur enregistrée sans aucune tradition qui la porte n'a pas de sens dans ce système.

4.3. Invariant

- Au moins une TraditionRef à la création. Une Valeur ne peut être proposée seule, sans qu'une tradition ne la porte déjà.

4.4. Événement de domaine

- `ValeurEnregistrée`

---

5. Langue

5.1. Racine et identité

Langue est la racine, identifiée par LangueId, servant également d'identité de patrimoine.

5.2. Propriétés

- Désignation, aire de pratique.
- **CommunautésLocutrices** : liste de CommunautéRef, conformément à « est parlée par ». Cardinalité 1..n.
- **FamilleLinguistiqueRef** optionnelle, conformément à « dérive de » appliqué à la langue en tant que patrimoine.

5.3. Une langue à deux usages distincts

Le mot « langue » recouvre, dans ce contexte, deux réalités qu'il faut se garder de confondre. La Langue-agrégat, décrite ici, est un patrimoine documenté pour lui-même : son vocabulaire, sa littérature orale, ses locuteurs. La langue dans laquelle une Connaissance est rédigée est un usage instrumental de cette même entité, exprimé à travers une simple LangueId référencée par la Connaissance, jamais à travers une copie de l'agrégat. Une Connaissance rédigée en mooré référence ainsi le même agrégat Langue que celui qui documente le mooré comme patrimoine linguistique à part entière ; il n'existe qu'une seule vérité sur ce qu'est cette langue, jamais deux versions divergentes selon l'usage qu'on en fait.

5.4. Événement de domaine

- `LangueEnregistrée`

---

6. Objet

6.1. Racine et identité

Objet est la racine, identifiée par ObjetId.

6.2. Propriétés

- **PatrimoineIncarné** : un unique PatrimoineRef, obligatoire, fixé à la création et immuable. Un objet dont le patrimoine incarné changerait ne serait plus le même objet : un tel changement doit être représenté par l'enregistrement d'un nouvel Objet, jamais par la modification de celui-ci.
- **DétenteurCourant** : une référence optionnelle vers une Personne ou une Institution, conformément à « est détenu par ». Cardinalité 0..1, exactement comme fixé par l'ontologie.
- **LieuRef** courant, conformément à « se situe à ».
- **HistoriqueDeDétention** : une liste, jamais purgée, des détenteurs successifs, chacun avec sa période et le motif de son changement.

6.3. Invariants

- Le PatrimoineIncarné ne change jamais après création.
- Un changement de DétenteurCourant ajoute toujours une entrée à HistoriqueDeDétention ; il ne la remplace ni ne l'efface, conformément au principe de non-suppression.

6.4. Opérations exposées

- `EnregistrerObjet`
- `ChangerDétenteur` — clôt l'entrée courante de l'historique et en ouvre une nouvelle, sans jamais supprimer la précédente.

6.5. Événements de domaine

- `ObjetEnregistré`
- `DétenteurChangé`

---

7. Références externes : la discipline commune aux cinq agrégats

Aucun des cinq agrégats de ce contexte ne contient, à l'intérieur de ses propres limites, un autre agrégat appartenant à un contexte différent. Une Communauté, une Personne, une Institution, un Lieu, une Source ne sont jamais importés tels quels : ils sont toujours représentés par une référence légère — un identifiant accompagné, tout au plus, d'une désignation suffisante pour l'affichage. Cette discipline traduit directement, au niveau tactique, les patrons de la carte de contexte : le Service Hôte Ouvert d'Acteurs & Représentation et de Provenance & Contexte n'expose jamais plus que ce dont ce contexte a réellement besoin pour fonctionner.

---

8. Repositories

Chaque agrégat racine dispose de son propre repository, seul point d'accès à sa persistance : ConnaissanceRepository, TraditionRepository, ValeurRepository, LangueRepository, ObjetRepository. Aucun repository ne permet de charger une Version ou une Traduction indépendamment de la Connaissance qui les porte, conformément à leur statut d'entités internes plutôt que d'agrégats.

---

9. Ce que ce document ne couvre pas encore

- La façon dont une `ConnaissanceProposée` s'articule avec le contexte Provenance & Contexte, qui porte la Contribution à l'origine de cette proposition, relève du processus transverse déjà annoncé par la cartographie stratégique, pas de cet agrégat lui-même.
- La façon dont un avis de validation, une autorisation ou un niveau d'accès viennent, depuis d'autres contextes, se rattacher à une Connaissance ou à une Version n'est pas non plus traitée ici : cet agrégat expose seulement ce qui doit rester adressable pour que ces autres contextes puissent le faire.
- Aucun schéma de stockage, aucun choix de base de données, aucune technologie de sérialisation n'est déterminé par ce document.

---

10. Suite

Les cinq autres bounded contexts restent à traiter au même niveau tactique : Gouvernance & Validation, Consentement & Droits, Accès, Acteurs & Représentation, Provenance & Contexte. Gouvernance & Validation est le candidat naturel pour la suite immédiate : c'est lui qui référence le plus directement les VersionRef et PatrimoineRef que ce document vient de définir.
