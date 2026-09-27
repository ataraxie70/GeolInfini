---
projet: "infUb"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est FAIT, ce qui est HYPOTHÈSE, ce qui est PROPOSÉ, ce qui est DÉCIDÉ"
regle: "Aucune promotion silencieuse de statut"
cree_le: 2026-09-06
source: "Extraction fidèle du Document de référence global V1.0, de l'Étude comparative V1.0, du DDD tactique V0.1 et du Recueil d'ADR V0.1 — aucun élément ajouté"
tags:
  - infUb
  - pilotage
  - statuts
  - falsifiabilite
---

# Registre des statuts

Tableau de bord de la doctrine. Chaque affirmation du projet est rangée dans **un seul** statut, avec sa source.

> [!info] Ce document n'invente rien
> Tout ce qui suit est extrait des quatre documents d'`infUb`. Aucune affirmation, aucun chiffre, aucune hypothèse n'y a été ajouté, et **aucun statut n'y a été promu**. Là où deux documents se contredisent, la contradiction est reproduite telle quelle plutôt qu'arbitrée : l'arbitrage appartient au porteur et s'inscrira au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]].

## Échelle de statut

| Statut | Définition | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Proposé** | Recommandation argumentée d'un document, non arbitrée par le porteur | Oriente, ne décide pas |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Contesté** | Affirmé dans un document, contredit dans un autre, sans arbitrage | **Ne doit être lu ni comme acquis ni comme abandonné** |
| **Ouvert** | Question posée, sans réponse arrêtée | N'autorise rien |
| **Décidé** | Arrêté par le porteur, daté, inscrit au registre `DEC-P-` | Engage |

**Promotion de statut** : *Ouvert → Proposé* par argumentation documentée ; *Proposé → Décidé* par inscription au journal ; *Contesté → Décidé* par arbitrage explicite. Aucun saut n'est permis, aucune promotion n'est tacite.

> [!danger] Aucune ligne de ce registre n'est au statut « Décidé »
> `infUb` est **en étude et en analyse** : le travail en cours consiste à établir vers quoi le projet peut évoluer et quel produit pourrait en sortir. La ligne « Décidé » existe parce que la doctrine l'exige, pas parce qu'elle est peuplée.
> Les mentions « Accepté » du [[Recueil d'ADR du noyau]] et le titre « Décisions structurantes prises » du point 19.1 du [[Document de référence global]] qualifient **l'état de ces textes**, pas celui du projet — `DEC-C-014`.

---

## 1. Faits — contexte mesuré

Source : point 2 de l'[[Étude comparative et solution cible]]. *« Ce chapitre n'est pas un décor. Chacun de ces chiffres élimine ou impose une option d'architecture. »*

### 1.1. Le plafond d'audience numérique

| # | Indicateur | Valeur | Source | Péremption |
| --- | --- | --- | --- | --- |
| F1 | Population | ~24,2 millions | Digital Report, données 2025 | Faible |
| F2 | **Internautes uniques actifs** | **5,42 millions — 22,4 %** | Digital Report, données 2025 | Moyenne |
| F3 | Utilisateurs de réseaux sociaux | 3,9 millions — 14,3 % | Digital Report, données 2025 | Moyenne |
| F4 | Cartes SIM actives | 29,3 millions (121 %) | Digital Report, données 2025 | Moyenne |
| F5 | Abonnements haut débit mobile | 20,8 millions | Digital Report, données 2025 | Moyenne |
| F6 | Taux d'urbanisation | 33,5 % | Digital Report, données 2025 | Faible |
| F7 | Couverture 4G du territoire | 41,5 % | Analyse e-gouv/ODD, 2025 | Moyenne |

> [!caution] Deux taux de pénétration incompatibles circulent — un seul est utilisable
> ~22 % (internautes uniques, méthodologie Kepios/DataReportal) et ~83 % (abonnements rapportés à la population, méthodologie régulateur). **Les deux sont exacts et mesurent des choses différentes : le second compte des SIM, pas des personnes.**
> *« Toute cible d'audience du projet doit être bâtie sur le premier chiffre. Dimensionner sur 83 % serait une erreur de conception aux conséquences directes. »*

### 1.2. Le plafond de capacité de l'État

| # | Indicateur | Valeur | Lecture de l'étude |
| --- | --- | --- | --- |
| F8 | EGDI 2024 (ONU) | 0,2895 — 175ᵉ sur 193 | En recul (166ᵉ en 2022) |
| F9 | **Indice capital humain (HCI)** | **0,1668** | **Le goulot d'étranglement dominant** |
| F10 | E-participation | 0,2192 — 152ᵉ | Faible culture d'interaction numérique institution/citoyen |
| F11 | Plateformes ministérielles | **59 développées, dont 32 en ligne** | Fragmentation confirmée, et cimetière de plateformes |
| F12 | Couverture RESINA | 93,33 % des chefs-lieux de province (2020) | Actif réseau réel de l'administration |

### 1.3. Sécurité, humanitaire, confiance

| # | Fait | Conséquence énoncée par l'étude |
| --- | --- | --- |
| F13 | ~40 % du territoire échappe au contrôle effectif de l'État ; ~2 millions de déplacés internes | Le rattachement territorial d'une publication devient **instable** : un déplacé reste concerné par deux territoires. Canal vocal et radio ne sont pas optionnels |
| F14 | Circulation documentée de **faux actes administratifs** : fausses circulaires ministérielles (2026), faux avis de recherche, faux démentis attribués à des institutions | C'est le fait qui fonde la fonction de vérification |
| F15 | Environnement médiatique resserré : suspensions de médias et blocages de sites documentés | Contrainte de positionnement — risque `R3` |

### 1.4. Les faits du benchmark mobilisés comme preuve

| # | Fait | Ce qu'il établit |
| --- | --- | --- |
| F16 | **GOV.UK Notify : 7 000 services britanniques adoptés volontairement** | Conquérir l'institution, c'est lui économiser du travail |
| F17 | **EU Voice** : budget européen, équipe compétente, 40 comptes institutionnels — **arrêté** | Ce n'est pas la technique qui tue ces infrastructures, c'est l'absence de propriétaire |
| F18 | Service 3-2-1 (Viamo) : 75 000 appels/mois au Burkina Faso, 7,78 millions au Mali | Le canal vocal atteint réellement les publics hors ligne |

---

## 2. Proposé — l'exploration la plus aboutie du projet

### 2.1. Les quatorze ADR

Rédigés le **2 septembre 2026**, chacun doté de **critères de réouverture mesurés**. Index au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]] ; texte intégral au [[Recueil d'ADR du noyau]].

**Statut : Proposé.** Le recueil les marque « Accepté » — c'est son étiquette interne, et trois d'entre eux (`ADR-011`, `ADR-012`, `ADR-013`) portent même « Accepté, **révisable** ». Au niveau du projet, aucun n'est arrêté : ils ont été écrits **avant toute mesure de terrain**, ce que reconnaît la présence même de critères de réouverture.

> [!note] Ce que « proposé » ne veut pas dire
> Ni fragile, ni provisoire par défaut. C'est le corpus technique le plus construit du coffre après `checkme`, et il est vraisemblable que beaucoup de ces quatorze positions tiennent à l'épreuve. Le statut dit seulement **qu'aucune n'a été arrêtée par le porteur**, et qu'aucune ne peut donc être opposée comme acquise.

### 2.2. Ce sur quoi les deux documents convergent

Source : point 6.1 de l'étude, qui confirme sans y rien opposer : le diagnostic de fragmentation de l'accès, le positionnement d'infrastructure et non de média, les sept règles fondamentales du point 11.2, la séparation avec `checkme`, le socle technique du point 12.1, le refus du feed d'engagement, et la doctrine documentaire en couches.

**Statut : convergence documentaire, pas décision.** Deux documents concordants établissent qu'aucune contradiction n'a été relevée — pas qu'un choix a été arrêté.

---

## 3. Contesté — trois hypothèses structurantes sans arbitrage

> [!danger] Le point le plus important de ce registre
> Le [[Document de référence global]] inscrit ces trois points au point 19.1 parmi les **« décisions structurantes prises »**. L'[[Étude comparative et solution cible]] les **conteste explicitement** au point 6.2, précédents à l'appui. Le document de référence est resté en **V1.0** et n'a pas été amendé.
> **Ni la position du document de référence ni celle de l'étude n'est arrêtée.** Ce sont deux propositions concurrentes — et c'est exactement là que porte l'étude en cours, puisque ces trois points déterminent ce que serait le produit en sortie.

| # | Objet | Position du document de référence | Position de l'étude | Preuve mobilisée par l'étude |
| --- | --- | --- | --- | --- |
| C1 | **L'actif stratégique** | Le réseau structuré des organisations et de leurs publications (point 9.1) | Cet actif est **réplicable par décret** — les institutions ne choisissent pas, elles obéissent. L'actif défendable est **le registre d'habilitation et l'archive canonique vérifiable** | Le test « actif indétrônable » n'est pas passé par la formulation actuelle |
| C2 | **L'ordre de conquête** | Espace citoyen et espace institutionnel, deux univers symétriques (point 14) | **Inversé** : servir l'institution d'abord. L'objectif de la V1 n'est pas « le citoyen vient sur infUb » mais « toute publication institutionnelle qui circule porte un identifiant infUb vérifiable » | `F16` — Notify, 7 000 services |
| C3 | **Le contenu du MVP** | Feed personnalisé, suivi, **commentaires et réponses arborescentes** en P0 (point 15.1) ; vidéo comme bloc natif (point 11.1) | **Retirer les trois** : les plus coûteuses en gouvernance, les moins différenciantes, celles qui portent le risque politique maximal. Remplacer les commentaires par la **question institutionnelle** et le **signal de compréhension** | Coût de modération en langues nationales ; risque politique ; `AM5` sur la vidéo |

**Ce que l'arbitrage engagerait.** `C3` détermine ce qui serait construit en premier : tant qu'il n'est pas rendu, ouvrir `60-implementation` reviendrait à trancher par le code. Voir [[infUb/90-pilotage/Carte des phases|Carte des phases]].

---

## 4. Angles morts — identifiés, traités par une proposition, non arbitrés

Source : point 6.3 de l'étude pour l'identification, point 7 pour le traitement proposé.

| # | Angle mort | Pourquoi il bloquait | Traitement **proposé** | Statut au niveau du projet |
| --- | --- | --- | --- | --- |
| AM1 | **La vérification hors plateforme** | Le cas d'usage dominant est *« j'ai reçu un PDF sur WhatsApp »*. Aucun dispositif n'était prévu | Scellement et page de vérification — point 7.4.3 | **Proposé** — traité techniquement par `ADR-006` et `ADR-007` |
| AM2 | **Le statut juridique de la publication** | Si une publication n'a aucune valeur, pourquoi une institution la ferait-elle ? Les deux documents étaient muets | Statut informatif conçu pour l'opposabilité — point 7.8 | **Proposé** — traité par `ADR-014` |
| AM3 | **La politique d'archivage et de format** | *« Une promesse d'archive sans politique d'archive est une promesse creuse »* | PDF/A + original + extraction texte, conservation illimitée N2/N3, copie chez un tiers — point 7.4.4 | **Proposé**, sans ADR |
| AM4 | **Le coût récurrent et son financeur** | *« C'est ce coût, pas le coût de construction, qui tue les projets »* | Socle mutualisé + services facturés — point 7.9 | **Proposé**, sans ADR — étude économique résiduelle |
| AM5 | **La vidéo comme piège économique** | Le poste qui explose le budget de toute petite infrastructure, et le format le moins consommable sur des connexions burkinabè | Vidéo référencée, non hébergée | **Proposé** — traité par `ADR-011`, que le recueil marque lui-même révisable |

---

## 5. Questions ouvertes du point 19.2 — onze réponses proposées, aucune arrêtée

Le [[Document de référence global]] pose onze questions ouvertes au point 19.2. L'étude y répond une à une au point 10. **Ces réponses sont argumentées et sourcées ; aucune n'est inscrite comme décision.**

| Question | Réponse **proposée** par l'étude | Fondement invoqué | Échéance posée |
| --- | --- | --- | --- |
| Q1 — Statut juridique et gouvernance | Séparation autorité de publication (SGG-CM candidat naturel) / opérateur technique, sous convention à trois clauses non négociables : réversibilité, code du noyau ouvert, neutralité de traitement | Riigi Teataja (EE) ; échec d'EU Voice | **Trancher avant H1** |
| Q2 — Certification des institutions | Quatre niveaux N0–N3. La plateforme **n'accorde pas** la confiance : elle enregistre et rend vérifiable une délégation décidée par l'organisation | DSFR + .gouv.fr ; registre DLT/TRAI | Traité par `ADR-008` — proposé |
| Q3 — Niveau de vérification par type d'organisation | Le niveau dépend du **type d'acte** publié, non du prestige de l'organisation | gov.sg ; 2D-Doc | Traité par `ADR-008` — proposé |
| Q4 — Modération des discussions | **Ne pas ouvrir de discussion publique en V1.** Question institutionnelle + signal de compréhension. Discussion arborescente reportée à H3 sous condition | Coût de modération ; risque politique | Lié à `C3` — **contesté, non arbitré** |
| Q5 — Conservation et archivage | PDF/A + fichier d'origine + extraction texte ; empreinte SHA-256 publiée ; conservation illimitée N2/N3 ; copie chez un tiers ; pas de 404 | Riigi Teataja ; ELI | `AM3` — proposé ; le « pas de 404 » est traité par `ADR-010` |
| Q6 — Granularité de pertinence | **Périmètre déclaré par l'utilisateur, aucune inférence comportementale.** Trois axes : émetteur, type d'acte, public concerné. Multi-territoires autorisé pour les déplacés | Cadre de protection des données ; refus du modèle d'engagement | Proposé |
| Q7 — Mécanismes de distribution réellement utilisés | Par couverture réelle : radio communautaire, IVR/vocal court, SMS, WhatsApp/Facebook, web, API. **À mesurer en H1** | `F18` — service 3-2-1 | Proposé, mesure programmée |
| Q8 — Souveraineté et continuité | Déployable au datacenter national (OCI/Podman, sans service managé propriétaire) mais **non dépendante de lui au démarrage** ; copie d'archive chez un tiers | Datacenters BF 2026 ; doctrine « zéro donnée à l'extérieur » | Proposé |
| Q9 — Signature et preuve | Modèle de preuve dans le schéma **dès la V1** ; scellement et cachet visible en H2 ; vérification SMS/IVR pour les non-connectés | 2D-Doc (FR), CEV TUNTRUST (TN) | Traité par `ADR-006` et `ADR-007` — proposé |
| Q10 — Seuil de bascule vers une recherche dédiée | P95 > 400 ms **ou** corpus > ~500 000 publications **ou** besoin multilingue/phonétique avéré | Principe de coût d'exploitation | Traité par `ADR-012`, que le recueil marque révisable |
| Q11 — Ouverture aux auteurs et producteurs éditoriaux | Après H2 seulement, et **jamais avec le même statut visuel** que les publications institutionnelles. Niveau D à retirer de la trajectoire publiée | Risque de dérive | Proposé |

---

## 6. Registre des risques

Source : point 9 de l'étude, reproduit sans modification de cotation. **Aucune mitigation n'est engagée à ce jour.**

| # | Risque | Probabilité | Impact |
| --- | --- | --- | --- |
| **R1** | **Absence de propriétaire institutionnel** — le projet reste orphelin et s'éteint | Élevée | **Fatal** |
| R2 | Compromission d'un compte institutionnel publiant un faux acte | Moyenne | Fatal pour l'actif |
| R3 | Perception d'organe de communication d'État | Élevée | Grave |
| R4 | Désertion institutionnelle — les organisations ne publient pas | Élevée | **Fatal** |
| **R5** | **Coût récurrent orphelin** après la construction | Élevée | **Fatal** |
| R6 | Capture ou éviction — l'État reproduit le système et écarte le porteur | Moyenne | Grave |
| R7 | Explosion du coût de diffusion avec le succès | Moyenne | Grave |
| R8 | Doublon avec JOBF / LégiBurkina — perçu comme redondant | Moyenne | Grave |
| R9 | Dérive vers le réseau social sous pression d'usage | Moyenne | Grave |
| R10 | Dépendance à un canal tiers pour la distribution | Élevée | Modéré |
| R11 | Inaccessibilité aux publics prioritaires (ruraux, non alphabétisés, déplacés) | Élevée si non traitée | Grave — échec de mission |
| R12 | Instabilité institutionnelle — changement de tutelle ou de doctrine | Élevée | Modéré à grave |

> [!danger] Trois risques fatals, tous de probabilité élevée, aucun couvert
> `R1`, `R4` et `R5`. Aucun n'est technique. Les mitigations que l'étude leur associe — convention d'ancrage signée avant H1, coût marginal de publication proche de zéro, règle des 24 mois couverts — sont des **propositions**, pas des dispositifs en place.

---

## 7. Ouvert — ce que le modèle tactique ne traite pas encore

Source : point 10 du [[DDD tactique du noyau]], reproduit intégralement. *« Honnêteté du périmètre — ces points sont ouverts et ne doivent pas être présumés résolus. »*

| Point ouvert | Quand le trancher |
| --- | --- |
| Fusion et scission d'organisations | Avant l'ouverture à un deuxième secteur (H2) |
| Modèle de quota d'alertes | Avec la convention d'ancrage |
| Multilinguisme du contenu principal | Après mesure de l'usage IVR en H1 |
| Format d'échange d'ingestion (`PUSH` / `PULL`) | Au premier connecteur (H2) |
| Modèle de délégation inter-organisations | Avant H2 |
| Politique de rétention des pièces jointes volumineuses | Après six mois d'exploitation |
| Choix de l'autorité de certification pour N3 | Avant H2 |

---

## 8. Études résiduelles — ce que l'étude ne peut pas trancher

Source : point 11 de l'étude. Ces huit chantiers exigent du terrain ou du droit. **Aucun n'est engagé.**

| Étude | Question restante | Méthode prévue |
| --- | --- | --- |
| Terrain — universités | Combien de publications par établissement et par mois ? Quel délai réel décision → diffusion ? | Observation directe, 2 à 3 établissements, 4 semaines |
| Terrain — citoyens | Comment un étudiant, un candidat ou un parent cherche-t-il réellement une information officielle ? Où échoue-t-il ? | 20 à 30 entretiens contextuels + tests de retrouvabilité |
| Juridique | Quel texte permettrait le régime opposable ? Quelles obligations pour un registre d'habilitation nominatif ? | Avis juridique + consultation CIL |
| **Institutionnelle** | **Le SGG-CM est-il preneur ? Sinon, qui ?** | Sondage institutionnel — **à faire avant tout développement de H1** |
| Économique | Quel abonnement est réellement payable par un lycée, une commune, une université ? | Entretiens tarifaires + modélisation à trois scénarios |
| Distribution | Les opérateurs accepteraient-ils un code court national et des tarifs sociaux ? | Négociation exploratoire, ARCEP en tiers |
| Sécurité | Modèle de menace complet, scénario « compte institutionnel compromis » en n°1 | Analyse de risque formelle + échange amont ANSSI-BF |
| Langues | Quelle qualité en mooré, dioula, fulfuldé pour un script vocal ? | Test avec un partenaire radio sur 20 publications réelles |

---

## 9. Frontières — ce qui relève d'`infUb` et ce qui n'en relève pas

`infUb` se définit par une question, et cette question suffit à poser ses frontières : **« qu'est-ce qui a été publié, par qui, et est-ce encore valable ? »** Le tableau ci-dessous ne sert qu'à lever l'ambiguïté sur ce que le projet couvre, pour que l'étude en cours ne se disperse pas.

| Objet | Relève d'`infUb` ? | Où la frontière est posée |
| --- | --- | --- |
| Vérifier qu'un acte émane de l'autorité qu'il prétend | **Oui — c'est le cœur** | point 7.4 de l'[[Étude comparative et solution cible]] |
| Retrouver une publication identique dix ans plus tard | **Oui** | Archive canonique, point 7.4.4 |
| Savoir qui a autorité pour publier au nom de quoi | **Oui** | Registre d'habilitation, point 7.3 |
| Atteindre les publics hors ligne — radio, IVR, SMS | **Oui, dans le socle** | point 7.5, imposé par les 22,4 % d'internautes |
| Consulter **son propre statut** dans une liste officielle | **Non** — relève de `checkme` | point 7 du [[Document de référence global]] : *« qu'est-ce qui a été publié ? »* contre *« quel est mon statut individuel ? »*. Une publication `infUb` peut **pointer vers** `checkme` sans absorber son domaine |
| Publier le droit — lois, décrets, textes juridiques | **Non** — relève du JOBF et de LégiBurkina | Risque `R8` : périmètre explicitement disjoint. `infUb` traite l'**information opérationnelle datée** (avis, appels, calendriers, échéances) et **se lie** au JOBF plutôt que de le republier |
| Héberger la conversation, la discussion, l'expression | **Non en V1**, et peut-être jamais | Correction n°3 et risque `R9` — reste `contesté` |

> [!note] Le lien vers les autres projets sert à lever une ambiguïté, pas à ouvrir un chantier
> Ces renvois existent pour qu'on sache où s'arrête `infUb` quand son périmètre évoluera. Instruire ce qui se passe **chez** un autre projet est une question de portefeuille, traitée à la [[Cartographie du portefeuille]] — pas ici.
