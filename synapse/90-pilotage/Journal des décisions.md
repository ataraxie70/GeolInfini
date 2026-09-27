---
projet: "synapse"
type: "journal-des-decisions"
phase: "90-pilotage"
objet: "Trace horodatée de toute décision — aucune décision n'existe si elle n'est pas ici"
decisions_projet: "aucune — trois décisions sont annoncées dans un document, aucune n'est inscrite"
decisions_coffre: "DEC-C-024 à DEC-C-028, DEC-C-045"
cree_le: 2026-09-07
mis_a_jour_le: 2026-09-08
tags:
  - synapse
  - pilotage
  - decisions
---

# Journal des décisions

Registre unique et *append-only* de toutes les décisions du projet `synapse`.

> [!important] Règle fondatrice
> **Une décision qui n'est pas inscrite ici n'existe pas.** C'est le mécanisme qui applique la règle « aucune promotion silencieuse de statut » : sans ce journal, une possibilité évoquée dans une note finit par être lue comme un choix arrêté.
> Le journal est *append-only* : une décision annulée est marquée `Annulée` et conservée, jamais supprimée.

## Deux registres distincts, à ne jamais confondre

| Registre | Préfixe | Portée | Qui décide |
| --- | --- | --- | --- |
| **Décisions de coffre** | `DEC-C-` | Rangement, nommage, conventions, méthode documentaire | Le porteur, à tout moment |

> [!note] Où s'inscrit une décision `DEC-C-` — `DEC-C-050`
> La séquence `DEC-C-` est **unique et continue sur tout le coffre** : un seul compteur, aucun numéro en double.
> Une décision dont la portée est **ce seul projet** s'inscrit ici. Une décision dont la portée **excède un projet** s'inscrit au [[Journal des décisions du coffre]], qui recense aussi les six entrées transverses antérieures restées dans les journaux de projet.
> Avant d'attribuer un numéro, vérifier le dernier attribué **dans l'ensemble du coffre**.
| **Décisions de projet** | `DEC-P-` | Produit, périmètre, technique, gouvernance, économie | Un critère de passage franchi, et lui seul |

> [!note] La série `DEC-C-` est globale au coffre ; la série `DEC-P-` est propre à chaque projet
> `DEC-C-001` à `DEC-C-005` sont au [[ecoFab/90-pilotage/Journal des décisions|journal d'ecoFab]], `DEC-C-006` à `DEC-C-015` au [[infUb/90-pilotage/Journal des décisions|journal d'infUb]], `DEC-C-016` à `DEC-C-023` au [[checkme/90-pilotage/Journal des décisions|journal de checkme]]. Ce journal reprend la suite à `DEC-C-024`.
> Les `DEC-P-` se numérotent projet par projet : `DEC-P-001` d'`ecoFab` n'a aucun rapport avec un futur `DEC-P-001` de `synapse`.

---

## Décisions de projet — `DEC-P-`

> [!danger] Aucune décision de projet n'est inscrite, et trois sont pourtant annoncées ailleurs
> **Néant au 2026-09-07.** Le point 1 du [[Dossier de faisabilité]] s'intitule « DÉCISIONS ACTÉES » et énonce trois décisions qui ferment trois des quatre questions ouvertes du point 8 de [[Inclusion des compétences non formelles]].
> Elles ne sont **pas** reprises ici comme des `DEC-P-`, et elles ne doivent pas l'être ailleurs tant que le porteur ne les a pas inscrites — voir `DEC-C-027`. Elles sont consignées au [[synapse/90-pilotage/Registre des statuts|Registre des statuts]] point 3.

---

## Décisions de coffre — `DEC-C-`

### DEC-C-024 — Mettre `synapse` en conformité avec les conventions du coffre

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Le dossier `synapse` adopte la structure de phases, la note d'entrée, le journal de décisions et la convention de nommage fixées par `DEC-C-002` et `DEC-C-003`. |
| **Motif** | `synapse` était l'avant-dernier projet hors conventions du coffre. Ses trois documents vivaient à plat dans le dossier, sous des noms en `MAJUSCULES_SOULIGNÉES` illisibles en wikilink, sans note d'entrée, sans journal et sans registre — alors qu'ils portent le corpus le plus décidé du coffre après `checkme` : une vision complète, un chapitre d'inclusion et un dossier de faisabilité qui retire du périmètre et arrête un noyau livrable. |
| **Portée** | Le dossier `synapse` seul, plus la mise à jour des liens des deux notes de racine que les renommages auraient cassés — `DEC-C-028`. |
| **Ce qu'elle n'engage pas** | Les **trois recouvrements** relevés à la [[Cartographie du portefeuille]] — `ecoFab ∩ synapse` sur les mémoires, thèses et événements de savoir, `ecoFab ∩ synapse` sur les modules disciplinaires, `checkme ∩ synapse` sur la preuve d'un acquis académique — restent **entiers et non tranchés**. Aucun contenu n'est déplacé entre projets. |
| **Réversibilité** | Faible — un renommage massif casse les liens non gérés. |
| **Statut** | Active |

### DEC-C-025 — Ouvrir quatre dossiers de phase, laisser `20` à `60` non créés

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Créer `00-intention`, `10-etudes`, `90-pilotage` et `99-sources`. **Ne pas créer** `20-cadrage-strategique`, `30-ddd-strategique`, `40-ddd-tactique`, `50-architecture` ni `60-implementation`. |
| **Motif** | Application de `DEC-C-003` : une phase n'existe sur le disque que si un **document propre** l'ouvre. `synapse` en a trois, et ils ouvrent deux phases : l'intention et les études. |
| **Pourquoi `20` reste fermée** | Le cadrage stratégique est **traversé à l'intérieur du [[Dossier de faisabilité]]**, sans document propre : hypothèses de moyens à trois scénarios au point 4, contraintes non techniques décisives au point 8 — équipe, hébergement, chemin critique administratif, couverture territoriale, financement récurrent —, noyau retenu au point 9, séquence en cinq étapes au point 10, points de décision restants au point 11. |
| **Pourquoi `30` et `40` restent fermées** | Le point 7 de [[Vision, domaines et architecture cible]] décompose le système en **neuf domaines métiers**, ce qui est une amorce de découpage stratégique — mais sans carte des contextes bornés, sans langage ubiquitaire formalisé et sans relations entre contextes. Aucun agrégat, aucun événement, aucun invariant n'est modélisé : le DDD tactique n'est pas commencé. |
| **Pourquoi `50` reste fermée** | L'architecture est traversée **dans les deux documents à la fois, et ils divergent** : les points 15 à 20 de la référence globale décrivent une pile distribuée, polyglotte, en cellules, avec CQRS et bus d'événements ; le point 6 du dossier de faisabilité l'écarte, la diffère ou la réduit ligne par ligne au profit d'un monolithe modulaire sur PostgreSQL. Ouvrir `50` supposerait un document qui tranche. Il n'existe pas. |
| **Pourquoi `60` reste fermée** | Aucune ligne de code. |
| **Conséquence** | `synapse` présente le profil de phases le plus resserré du coffre — `00` et `10` — alors que son corpus couvre conceptuellement bien davantage. Décrit à la [[synapse/90-pilotage/Carte des phases\|Carte des phases]]. |
| **Réversibilité** | Totale — créer un dossier est trivial ; c'est précisément pourquoi la création se journalise. |
| **Statut** | Active |

### DEC-C-026 — Renommer les trois documents, l'identifiant `REF` passant en propriété

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Les trois documents prennent un nom en français lisible qui **dit leur contenu**, sans identifiant ni numéro de version. `SYNAPSE-REF-001`, `-002` et `-003` sont conservés dans la propriété `identifiant_source` de chaque note. |
| **Renommages** | `SYNAPSE_document_reference_global.md` → `00-intention/Vision, domaines et architecture cible.md`<br>`SYNAPSE_axe_competences_non_formelles.md` → `00-intention/Inclusion des compétences non formelles.md`<br>`SYNAPSE_dossier_faisabilite.md` → `10-etudes/Dossier de faisabilité.md` |
| **Motif du nom** | `DEC-C-002` : les `MAJUSCULES_SOULIGNÉES` rendent les wikilinks illisibles sans alias. |
| **Pourquoi pas « Document de référence global »** | C'est le titre que le document se donne — et **exactement** le nom que porte déjà [[Document de référence global\|la note d'infUb]] en `00-intention`. Deux notes homonymes dans le graphe auraient imposé le chemin complet à chaque lien, pour un gain nul : un titre qui dit le contenu distingue mieux qu'un titre qui dit le genre du document. C'est déjà la façon dont `infUb` et `ecoFab` nomment leurs notes — « Étude comparative et solution cible », « Recueil d'ADR du noyau », « Programme d'études approfondies ». |
| **Ce qui reste lisible malgré le renommage** | Les trois documents se citent entre eux par leur identifiant — « REF-001 point 7.2 », « REF-002 point 8.1 » — **des centaines de fois dans leurs corps**. Ces renvois n'ont pas été touchés ; la propriété `identifiant_source` et le tableau ci-dessous suffisent à les résoudre. |
| **Intégrité** | Les trois documents ont été **déplacés, pas réécrits** : corps identique à l'octet près, contrôlé par SHA-256 après ajout de l'en-tête, contre les empreintes prises avant toute manipulation. Voir [[synapse/99-sources/Sources originales\|Sources originales]]. |
| **Réversibilité** | Faible. |
| **Statut** | Active |

| Identifiant | Ancien fichier | Note actuelle |
| --- | --- | --- |
| `SYNAPSE-REF-001` | `SYNAPSE_document_reference_global.md` | [[Vision, domaines et architecture cible]] — `00-intention/` |
| `SYNAPSE-REF-002` | `SYNAPSE_axe_competences_non_formelles.md` | [[Inclusion des compétences non formelles]] — `00-intention/` |
| `SYNAPSE-REF-003` | `SYNAPSE_dossier_faisabilite.md` | [[Dossier de faisabilité]] — `10-etudes/` |

### DEC-C-027 — Ne pas promouvoir en décisions de projet les trois « décisions actées » du dossier de faisabilité

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Contexte** | Le point 1 du [[Dossier de faisabilité]] s'intitule « DÉCISIONS ACTÉES » et énonce trois décisions : habilitation **institutionnelle** des évaluateurs de terrain, **prise en charge publique** du constat physique, et une position sur la **portée juridique** de l'attestation. Elles ferment trois des quatre questions ouvertes du point 8 de [[Inclusion des compétences non formelles]]. |
| **Décision** | Elles sont **consignées, non promues**. Elles figurent au point 3 du [[synapse/90-pilotage/Registre des statuts\|Registre des statuts]] avec leur libellé exact et leur origine, au statut « annoncée dans un document, non inscrite au journal ». |
| **Motif** | Deux raisons qui se cumulent. **(1)** `DEC-C-014` : un statut écrit dans un document qualifie l'état de ce texte, jamais celui du projet. **(2)** Le document se déclare lui-même, dans son propre en-tête, *« Document d'analyse, non contractuel »* — il ne peut pas porter d'engagement de projet sans se contredire. |
| **Nuance relevée sur la troisième** | Les deux premières sont formulées en « **Décision :** … ». La troisième ne l'est pas : elle s'énonce « **Position exprimée :** … », et elle est **conditionnelle** — l'attestation gagnerait à engager au-delà du système *à condition que* l'État reconnaisse et certifie le système. La promouvoir telle quelle inscrirait comme acquise une position qui dépend d'un acte extérieur non obtenu. |
| **Ce que la décision ne dit pas** | Que ces trois arbitrages seraient douteux. Ils sont argumentés, et le dossier en tire les conséquences opérationnelles — notamment qu'un acte administratif doit inscrire le constat dans les attributions des agents, faute de quoi la tâche sera traitée comme une surcharge. **Ils sont prêts à être promus** : il y faut une inscription du porteur à ce journal, rien de plus. |
| **Réversibilité** | Totale — promouvoir se fait en écrivant trois entrées `DEC-P-`. |
| **Statut** | Active |

### DEC-C-028 — Consigner hors de `synapse` ce que la mise en conformité rend faux

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-07 |
| **Décideur** | Porteur du projet |
| **Décision** | Mettre à jour les deux notes de racine, **en barrant et datant plutôt qu'en effaçant**, et sans réécrire aucune analyse. |
| **[[Index du coffre]]** | `synapse` devient un lien vers sa note d'entrée · il sort de la liste des projets non conformes, où **`gounhri` reste seul** · l'encadré des conventions enregistre la mise en conformité et renvoie à ce journal. |
| **[[Cartographie du portefeuille]]** | Les trois liens documentaires de `synapse` sont réécrits vers leurs nouvelles cibles, **alias d'affichage conservés à l'identique** · le point 5 du point 6 « Ce qu'il reste à instruire » enregistre que `synapse` est désormais conforme. |
| **Ce qui n'a pas été fait** | Aucune analyse, aucun raisonnement, aucune cotation d'une note extérieure n'a été réécrit. En particulier, la recommandation du point 5 ter de la cartographie — reformuler `DEC-P-001` d'`ecoFab` sur le modèle de `synapse` — **n'est pas exécutée** : elle touche `ecoFab`, hors du périmètre de `DEC-C-024`. |
| **Réversibilité** | Totale — les énoncés remplacés sont conservés barrés dans le texte. |
| **Statut** | Active |

---

### DEC-C-045 — Passe de normalisation rédactionnelle

| Champ | Valeur |
| --- | --- |
| **Date** | 2026-09-08 |
| **Décideur** | Porteur du projet |
| **Décision** | Les notes de `synapse` sont mises au **registre impersonnel et documentaire** fixé par `DEC-C-034` : aucune première personne, aucune adresse au lecteur, aucun commentaire méta sur l'acte d'écriture, aucune appréciation portée sur l'auteur d'un autre document, aucun texte biffé narrant l'historique des reprises, aucun pictogramme porteur d'information. |
| **Motif** | Le coffre est destiné à être lu par des professionnels et de possibles collaborateurs extérieurs à la conversation qui l'a produit. Toute trace de dialogue y devient une ambiguïté, et une information portée par un pictogramme dépend du rendu du terminal ou de l'imprimante. |
| **Détail des corrections** | Trois notes traitées. Quatorze pictogrammes de statut retirés. Une occurrence de première personne du pluriel dans la grille du [[Dossier de faisabilité]] — *« hors de notre contrôle »* — réécrite en *« échappe au contrôle du projet »*, le « nous » supposant un groupe qu'un lecteur extérieur ne peut pas identifier. |
| **Portée** | Forme et lisibilité. **Aucune affirmation de fond, aucun chiffre, aucun statut, aucune décision n'est modifié.** Les documents archivés en `99-sources` ne sont pas concernés : une source ne s'édite pas. |
| **Réversibilité** | Faible sans copie de référence ; la présente entrée est la trace de l'amendement. |
| **Statut** | Active |

---

## Modèle d'entrée à recopier

```markdown
### DEC-?-00N — Titre court à l'impératif

| Champ | Valeur |
| --- | --- |
| **Date** | AAAA-MM-JJ |
| **Décideur** | |
| **Décision** | Ce qui est décidé, en une phrase sans conditionnel. |
| **Motif** | Pourquoi, et sur quelle preuve. |
| **Portée** | Ce que la décision engage — et ce qu'elle n'engage pas. |
| **Réversibilité** | Élevée / moyenne / faible, et à quel coût. |
| **Alternatives écartées** | Et pourquoi. |
| **Critères de réouverture** | Les faits mesurés qui obligeraient à rouvrir. |
| **Statut** | Active / Annulée par DEC-?-00M |
```
