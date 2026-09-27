---
projet: "synapse"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est établi, ce qui est proposé, ce qui est contesté et ce qui reste ouvert"
lignes_decidees: 0
cree_le: 2026-09-07
tags:
  - synapse
  - pilotage
  - statuts
---

# Registre des statuts

> [!info] Ce document n'invente rien
> Tout ce qui suit est extrait des trois documents de `synapse`. Aucune affirmation, aucun chiffre, aucune hypothèse n'y a été ajouté, et **aucun statut n'y a été promu**. Là où deux documents se contredisent, la contradiction est reproduite telle quelle plutôt qu'arbitrée : l'arbitrage appartient au porteur et s'inscrira au [[synapse/90-pilotage/Journal des décisions|Journal des décisions]].

## Échelle de statut

| Statut | Définition | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Proposé** | Recommandation argumentée d'un document, non arbitrée par le porteur | Oriente, ne décide pas |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Contesté** | Affirmé dans un document, contredit dans un autre, sans arbitrage | **Ne doit être lu ni comme acquis ni comme abandonné** |
| **Ouvert** | Question posée, sans réponse arrêtée | N'autorise rien |
| **Décidé** | Arrêté par le porteur, daté, inscrit au registre `DEC-P-` | Engage |

> [!danger] Aucune ligne de ce registre n'est au statut « Décidé »
> `synapse` n'a **aucune décision de projet inscrite**. Trois décisions sont pourtant annoncées dans un document — voir le point 3 — et le corpus emploie ailleurs le vocabulaire de l'acquis : « décisions actées », « noyau retenu », « liste des retraits ». Ces mentions qualifient l'état d'un texte, jamais l'état du projet — `DEC-C-014`.

---

## 1. Faits — le contexte national vérifié

Le point 2 du [[Dossier de faisabilité]] apporte quatre éléments datés qui n'apparaissent pas dans la référence globale et qui modifient l'analyse de faisabilité.

| # | Fait | Date | Ce qu'il change |
| --- | --- | --- | --- |
| `F1` | Deux datacenters modulaires du cloud gouvernemental inaugurés à Ouagadougou — chantier « zéro donnée à l'extérieur » du ministère de la Transition digitale. Capacité annoncée : 3 000 To, 105 600 Go de mémoire, 28 800 cœurs, plus de 7 000 machines virtuelles. Un datacenter de plus grande envergure est annoncé pour 2028 ; un hébergeur privé local, IKA CLOUD, a été lancé le 31 juillet 2026 | 23 janvier 2026 | **L'hébergement souverain n'est plus un obstacle.** Le dossier recommande un alignement explicite sur le cloud gouvernemental : souveraineté résolue, coût d'infrastructure réduit, point d'ancrage institutionnel gagné |
| `F2` | La loi n°001-2021/AN encadre la protection des données à caractère personnel et les conditions d'hébergement et de traitement | 30 mars 2021 | Le traitement des **profils de mineurs** doit être analysé au regard de ce texte **avant** toute collecte. C'est un préalable, pas une conformité à rattraper |
| `F3` | Le Répertoire général des métiers de la formation professionnelle, couvrant 14 secteurs prioritaires, adopté en conseil des ministres | 30 juillet 2026 | **La taxonomie des métiers ne doit pas être construite, elle doit être importée** |
| `F4` | La transformation digitale nationale est structurée en douze chantiers majeurs | — | Un projet présenté comme la mise en œuvre d'un chantier existant obtient un arbitrage plus rapide qu'une initiative nouvelle. Le rattachement de `synapse` à l'un d'eux est une question stratégique à trancher tôt |

> [!caution] Ces quatre éléments sont donnés comme vérifiés, sans que la source soit citée
> Le point 2 s'intitule « CONTEXTE NATIONAL VÉRIFIÉ » et les dates comme les chiffres sont précis, mais **aucune référence n'est jointe** : ni texte officiel, ni communiqué, ni lien. La règle 3 du coffre — *« pas de chiffre sans source »* — n'est donc pas satisfaite au sens strict. Ces faits sont repris ici tels qu'énoncés, avec cette réserve, et devront être adossés à leur source avant de fonder une décision.

---

## 2. Faits — ce que le projet n'a pas

| # | Fait | Établi par |
| --- | --- | --- |
| `F5` | **Aucune ligne de code, aucune spécification exécutable** | Absence constatée le 2026-09-07 |
| `F6` | **Aucun des quatre actes administratifs du chemin critique n'est engagé** — convention SP/CNC, décision de dépôt documentaire, accès à l'identifiant WURI, désignation des agents habilités | Point 8.3 du [[Dossier de faisabilité]] |
| `F7` | **L'équipe n'est pas connue**, et le langage backend ne peut pas être choisi sans elle | Points 6.2 et 11 du dossier |
| `F8` | **Le financement récurrent est absent de la référence globale et non résolu par le dossier** | Point 8.5 : *« C'est le second qui détermine la survie de la plateforme après la fin du premier financement »* |

---

## 3. Décisions annoncées dans un document, non inscrites au journal

Le point 1 du [[Dossier de faisabilité]] s'intitule « DÉCISIONS ACTÉES » et ferme trois des quatre questions ouvertes du point 8 de [[Inclusion des compétences non formelles]]. **Elles sont consignées ici sans être promues** — `DEC-C-027`.

| Question de REF-002 | Ce que le dossier énonce | Forme employée |
| --- | --- | --- |
| **8.1** Qui habilite les évaluateurs de terrain | Habilitation **institutionnelle en premier lieu**, portée par l'administration. Ouverture ultérieure aux professionnels certifiés reconnus par l'État, sous engagement contractuel | *« Décision : … »* |
| **8.2** Qui paie le constat physique | **Prise en charge publique.** Les constats sont réalisés par des agents déjà présents sur le terrain, sans facturation au titulaire | *« Décision : … »* |
| **8.3** Portée juridique de l'attestation | L'attestation gagnerait à engager au-delà du système, **à condition** que le système soit reconnu et certifié par l'État et qu'une attestation puisse être présentée physiquement à un tiers | *« Position exprimée : … »* — **conditionnelle** |
| **8.4** Articulation formelle avec le SP/CNC | **Rien.** Cette question reste entière | — |

**Deux conséquences que le dossier tire lui-même, et qui pèsent autant que les décisions :**

- Le rythme du projet sur cet axe devient **celui d'une administration**. Le nombre d'agents mobilisables est le plafond réel du niveau `N3`, *« probablement de quelques centaines de constats par an au démarrage, non de milliers »*. Le système doit rester utile même si `N3` reste rare.
- Le coût du constat ne disparaît pas, **il est déplacé vers le temps agent**. Deux exigences en découlent : un acte administratif doit inscrire le constat dans les attributions des agents concernés, faute de quoi la tâche sera traitée comme une surcharge non prioritaire ; et le corps d'agents cible doit être **nommé et non supposé** — candidats à examiner : directions régionales de l'enseignement technique et de la formation professionnelle, chambres régionales de métiers de l'artisanat, agents de l'ANPE.

---

## 4. Contesté — l'architecture, affirmée puis démontée sans arbitrage

C'est la divergence la plus lourde du corpus. Les deux versions coexistent dans le coffre, **aucune n'est arrêtée**.

| Orientation de [[Vision, domaines et architecture cible]] | Verdict du [[Dossier de faisabilité]] point 6 |
| --- | --- |
| Next.js, TypeScript, PWA | **Conservé** — la PWA répond à une contrainte réelle de connectivité |
| Micro-frontends | **Écarté** — suppose plusieurs équipes frontend distinctes |
| Go, Rust, TypeScript et Python en backend | **Réduit à un seul langage** — quatre écosystèmes, bassin de recrutement local très étroit en Rust, facteur de bus critique |
| gRPC, Protocol Buffers, HTTP/2 en interne | **Différé** — friction de débogage sans bénéfice à cette échelle |
| CQRS | **Écarté au démarrage** — prématuré hors domaine à forte charge |
| Bus d'événements | **Réduit** — remplaçable par une table de sortie dans PostgreSQL, ce qui économise un rôle d'exploitation entier |
| Architecture en cellules | **Écarté** — conçue pour des échelles sans rapport avec le besoin |
| PostgreSQL · stockage objet | **Noyau** |
| Redis · Elasticsearch | **Différés** — la recherche plein texte de PostgreSQL suffit plusieurs années |
| Zero Trust, mTLS interne | **Réduit** — TLS, RBAC, chiffrement au repos et journalisation oui ; mTLS entre trois services, prématuré |
| Frontières métier issues du domaine | **Conservé intégralement**, mais comme organisation du code |

> [!note] Le dossier ne présente pas cela comme une contradiction
> Son point 6.1 soutient que l'orientation retenue — *« monolithe modulaire, frontières métier strictes dans le code, PostgreSQL comme socle, un seul langage backend »* — **ne contredit pas** les points 15.2 et 15.6 de la référence globale : elle en conserve les frontières et en diffère le déploiement distribué, ce que le point 24.5 recommande explicitement.
> Le fait demeure que **deux descriptions incompatibles de la pile coexistent dans le coffre**, et qu'un lecteur pressé de la seule référence globale construirait le mauvais système.

---

## 5. Proposé — l'essentiel du dossier de faisabilité

| Proposition | Où | Statut |
| --- | --- | --- |
| Le **noyau en sept composants**, livrable en neuf à douze mois dans l'hypothèse `A` | Point 9 | Proposé |
| Les **neuf retraits de périmètre** — environnements verticaux, débat structuré, vidéo, score de réputation, badges, cellules, pile polyglotte, chaîne éditoriale de revue par les pairs, bus et index en V1 | Point 7. *« Aucun de ces retraits n'est définitif »* | Proposé |
| La **séquence en cinq étapes**, chacune conditionnée à un usage mesuré | Point 10 | Proposé |
| Les **cinq critères d'évaluation**, dont l'exploitation présentée comme décisif : *« c'est ce critère qui tue les plateformes publiques, pas la difficulté technique »* | Point 3 | Proposé |
| L'**échelle universelle de preuve `N0` à `N4`**, la même pour tous, seuls les moyens de capture différant | Point 3 de [[Inclusion des compétences non formelles]] | Proposé |
| Le **pilote sur un métier, une ville, une chambre de métiers**, les métiers du métal cités comme candidat pertinent | Point 10.2 du même document | Proposé |

> [!note] Ce que « proposé » ne veut pas dire
> Ni fragile, ni abandonné. Le [[Dossier de faisabilité]] est le document le plus opérationnel du coffre : il retire, il chiffre, il conditionne. Mais il se déclare **non contractuel**, et rien n'y engage encore le projet.

---

## 6. Ouvert — ce qui bloque, tel que le corpus l'énonce

### 6.1. Les six points de décision restants — point 11 du dossier

| Question | Pourquoi elle bloque |
| --- | --- |
| Quelle structure porte juridiquement le projet | Conditionne les quatre actes administratifs du chemin critique |
| Quel modèle de financement récurrent | Détermine la survie après le premier financement |
| Quel chantier national de rattachement | Détermine la vitesse d'arbitrage |
| Quel établissement pilote pour le dépôt documentaire | Détermine la date de la première livraison utile |
| Quelle équipe réellement disponible | Détermine le langage, la pile et le périmètre atteignable |
| Traitement des profils de mineurs au regard de la loi n°001-2021 | Préalable à toute collecte concernant des élèves |

### 6.2. Les quatre questions que seul le pilote peut trancher — point 10.2 de REF-002

Combien coûte réellement un constat de niveau `N3` ? · Un maître d'atelier accepte-t-il d'attester, et à quelle fréquence ? · **Une attestation `N2` modifie-t-elle effectivement l'accès à une commande ou à un emploi ?** · Quelle proportion des profils atteint une session de certification ?

La troisième est éliminatoire : *« Aucune extension à d'autres métiers ni à d'autres régions tant que la question 3 n'a pas reçu de réponse positive. Sans effet sur l'accès réel au travail, l'axe produit une base de données et rien d'autre. »*

### 6.3. L'articulation formelle avec le SP/CNC — point 8.4 de REF-002

*« Sans acte écrit, l'articulation décrite reste une intention. »* C'est la seule des quatre questions ouvertes de REF-002 qui n'ait reçu aucune réponse.

---

## 7. Risques

Le corpus porte deux registres de risques, de nature différente.

**Cinq risques stratégiques** au point 24 de [[Vision, domaines et architecture cible]] : dilution, sur-gamification, capture institutionnelle, faible adoption, complexité excessive.

**Trois contraintes décisives** au point 8 du [[Dossier de faisabilité]], qui les rendent concrètes :

| Risque | Ce que le dossier en dit |
| --- | --- |
| **Équipe** | *« Facteur de faisabilité principal, absent de REF-001. L'écart entre la pile décrite et une équipe réelle de quatre à six personnes est le risque le plus élevé du projet. »* S'y ajoute une contrainte de contexte : les développeurs expérimentés sont fortement sollicités par le travail à distance rémunéré en devises, et la rotation doit être anticipée |
| **Couverture territoriale** | Le constat de terrain n'est **pas réalisable sur l'ensemble du territoire dans les conditions de sécurité actuelles**. Les indicateurs ne doivent pas traiter l'absence de couverture comme un échec d'adoption |
| **Financement récurrent** | Non résolu. Le coût d'investissement est finançable par projet ; le coût récurrent — hébergement, salaires, temps d'agent, modération — détermine la survie |

> [!important] Le dossier de faisabilité est né du cinquième risque
> Sa note de méthode l'énonce : *« REF-001 point 24.5 identifie la complexité excessive comme risque stratégique ; il ne la traite pas. C'est l'objet de ce dossier. »* Et : *« Un dossier de faisabilité qui conclurait que l'ensemble du périmètre est réalisable en trois phases n'aurait aucune valeur. La fonction de ce document est de retirer. »*

---

## 8. Frontières — non tranchées

Trois recouvrements sont relevés par la [[Cartographie du portefeuille]] et **aucun n'est arbitré** : `ecoFab ∩ synapse` sur les mémoires, thèses et événements de savoir, que le noyau de `synapse` inclut ; `ecoFab ∩ synapse` sur les modules disciplinaires, que `synapse` a au contraire **retirés** de son périmètre ; `checkme ∩ synapse` sur un résultat officiel valant preuve de compétence.

La même cartographie relève par ailleurs, à son point 5 ter, que le noyau de `synapse` — *« champ d'identifiant national prévu mais non bloquant »* — **contredit** `DEC-P-001` d'`ecoFab`, qui fait de l'INE une dépendance sur le chemin critique. L'arbitrage appartient au porteur et n'a pas été rendu ; il porterait sur `ecoFab`, pas sur `synapse`.

> [!note] Par décision du porteur, chaque projet est travaillé séparément
> Les liens entre projets seront établis ensuite. La mise en conformité du 2026-09-07 n'a déplacé aucun contenu entre projets et n'a tranché aucun recouvrement.
