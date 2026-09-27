---
projet: "synapse"
type: "note-d-entree-projet"
objet: "Rendre le capital humain et intellectuel identifiable, vérifiable, visible et connectable"
statut_projet: "Intention et faisabilité instruites — aucune décision de projet inscrite"
territoire: "Burkina Faso"
mise_en_conformite: 2026-09-07
tags:
  - synapse
  - moc
---

# synapse

**Infrastructure nationale numérique de confiance, de visibilité, de preuve et de mise en relation** du capital humain et intellectuel.

Le projet suit une chaîne structurante, posée par sa référence globale et reprise par tous ses documents :

> **identité → compétence → preuve → validation → réputation → visibilité → opportunité**

> [!info] Ce que `synapse` refuse d'être
> Sa référence globale l'écarte explicitement de sept catégories : un réseau social, un CV en ligne, un *job board*, une plateforme de publication, un annuaire, un LMS, un portail administratif. *« Ces fonctions peuvent exister dans le système, mais elles ne constituent pas à elles seules sa raison d'être. »*

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Maturité | **Intention et étude de faisabilité.** Deux phases ouvertes, `00` et `10` — voir [[synapse/90-pilotage/Carte des phases\|Carte des phases]] |
| Décisions de projet inscrites | **Aucune.** Trois sont annoncées dans un document sans y être promues — `DEC-C-027` |
| Corpus | 3 documents, `SYNAPSE-REF-001` à `REF-003`, tous en version 1.0 |
| Artefacts exécutables | **Aucun** — pas de code, pas de spécification exécutable |
| Périmètre de démarrage | Un **noyau de sept composants**, estimé livrable en 9 à 12 mois avec 3 à 6 personnes |
| Points contestés | **1, non arbitré** : l'architecture, décrite puis démontée — [[synapse/90-pilotage/Registre des statuts\|Registre des statuts]] point 4 |
| Points de décision restants | **6**, dont aucun n'est technique — même registre, point 6 |

---

## Le problème traité

La référence globale en distingue six faces : la **fragmentation** du capital humain, le **déficit de confiance** dans ce qu'une personne déclare savoir faire, la **difficulté de mise en relation**, l'**invisibilité de la production intellectuelle**, la **faible visibilité des événements de savoir**, et les **contraintes d'accès** — connectivité, équipement, littératie.

La réponse tient en sept verbes : identifier, prouver, valider, publier, connecter, produire, capitaliser.

> [!important] Le maillon décisif est la preuve, et il exclut par défaut ceux que le projet veut inclure
> [[Inclusion des compétences non formelles]] traite frontalement cette difficulté : la population visée en priorité — soudeurs, mécaniciens, forgerons, tôliers, menuisiers, tisserandes, transformatrices de produits agricoles, apprentis d'atelier — ne rédige pas, ne téléverse pas et ne navigue pas dans une interface.
> Sans traitement, *« le système reproduirait la hiérarchie qu'il prétend corriger »* : au filtre du diplôme se substituerait celui de la littératie numérique, excluant exactement les mêmes personnes. La réponse proposée est une **échelle de preuve `N0` à `N4` identique pour tous**, seuls les moyens de capture différant — le dépôt de code d'un étudiant en informatique et la photographie d'une soudure attestée par un client occupent le même niveau.

---

## Le corpus

### `00-intention`

- [[Vision, domaines et architecture cible]] — `REF-001` : vision, intention, problématique, neuf domaines métiers, acteurs, axes recherche, publications et événements, architecture directrice, gouvernance, risques et trajectoire
- [[Inclusion des compétences non formelles]] — `REF-002` : échelle universelle de preuve, typologie des preuves de terrain, l'atelier comme unité, accessibilité sans littératie, intégrité, questions ouvertes

### `10-etudes`

- [[Dossier de faisabilité]] — `REF-003` : contexte national vérifié, critères d'évaluation, analyse composant par composant, pile technique, retraits, noyau retenu, séquence, points de décision restants

> [!warning] Lire `REF-001` sans `REF-003` conduit à construire le mauvais système
> Le dossier de faisabilité **retire neuf familles de composants** du périmètre de démarrage et réduit la pile technique ligne par ligne. Il se donne cette fonction sans détour : *« Un dossier de faisabilité qui conclurait que l'ensemble du périmètre est réalisable en trois phases n'aurait aucune valeur. La fonction de ce document est de retirer. »*
> Aucun de ces retraits n'est définitif, et **aucun n'est inscrit au journal**.

---

## Le noyau proposé

Sept composants, dans l'hypothèse d'une équipe de trois à six personnes sans mandat institutionnel : identité et comptes, avec champ d'identifiant national **prévu mais non bloquant** · profil et portfolio à historique non effaçable · dépôt, indexation et recherche de mémoires et de thèses sur un à deux établissements, avec embargo · agenda national des événements de savoir · preuves de niveaux `N0` à `N2`, attestations nominatives, **sans score agrégé** · publication d'opportunités, candidature, recherche à facettes · journal d'audit, `RBAC`, séparation entre consultation agrégée et consultation nominative.

*« Tout le reste attend une mesure ou un acte administratif. »*

---

## Pilotage

| Note | Objet |
| --- | --- |
| [[synapse/90-pilotage/Carte des phases\|Carte des phases]] | L'état de chaque phase, la séquence en cinq étapes et ce qui déverrouille l'implémentation |
| [[synapse/90-pilotage/Journal des décisions\|Journal des décisions]] | `DEC-C-024` à `DEC-C-028` — mise en conformité, nommage, non-promotion des décisions annoncées |
| [[synapse/90-pilotage/Registre des statuts\|Registre des statuts]] | Faits vérifiés, décisions annoncées, divergence d'architecture, questions ouvertes, risques |
| [[synapse/99-sources/Sources originales\|Sources originales]] | Empreintes d'intégrité des trois documents |

---

## Comment lire ce projet

1. **Aucun statut interne à un document ne vaut décision de projet.** « Décisions actées », « noyau retenu », « liste des retraits » qualifient l'état d'un texte, jamais celui du projet — `DEC-C-014`.
2. **Les trois documents se citent par leur identifiant** — `REF-001 point 7.2`, `REF-002 point 8.1` — et non par leur nom de note. La correspondance est à `DEC-C-026` au [[synapse/90-pilotage/Journal des décisions\|Journal des décisions]] ; chaque note porte le sien en propriété `identifiant_source`.
3. **Le chemin critique n'est pas technique.** Quatre actes administratifs conditionnent l'essentiel du périmètre, et aucun ne dépend du code. Aucun n'est engagé.
4. **Le critère qui décide n'est pas la difficulté de construction, c'est le coût d'exploitation.** *« C'est ce critère qui tue les plateformes publiques, pas la difficulté technique. »*

---

## Note de positionnement

Le nom **SYNAPSE** est posé par le point 1.1 de la référence globale. Le corpus ne dit pas s'il s'agit d'un nom de code interne ou du nom du produit final ; le dossier du coffre porte la casse minuscule, comme les autres projets.

Le lien avec les autres projets du coffre n'est **pas instruit ici** : par décision du porteur, chaque projet est travaillé séparément. Trois recouvrements restent ouverts avec `ecoFab` et `checkme`, et la [[Cartographie du portefeuille]] relève au surplus que le noyau de `synapse` contredit la décision `DEC-P-001` d'`ecoFab` sur l'identifiant national. Voir le point 8 du [[synapse/90-pilotage/Registre des statuts\|Registre des statuts]].
