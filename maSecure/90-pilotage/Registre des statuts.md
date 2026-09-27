---
projet: "maSecure"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est FAIT, ce qui est HYPOTHÈSE, ce qui est PRINCIPE, ce qui est POSSIBILITÉ, ce qui est DÉCISION"
regle: "Aucune promotion silencieuse de statut"
cree_le: 2026-09-09
tags:
  - maSecure
  - pilotage
  - statuts
  - falsifiabilite
---

# Registre des statuts

Tableau de bord de la doctrine. Chaque affirmation du projet est rangée dans **un seul** statut, avec sa source.

> [!info] Ce document n'invente rien
> Il extrait et classe ce que portent le corpus archivé, le [[maSecure/00-intention/Document fondateur d'intention|Document fondateur d'intention]] et le [[Benchmark et cadre réglementaire]].
> Il porte en revanche un **jugement de statut**, et c'est sa fonction : le corpus présente comme des décisions et des constats des affirmations qui n'ont aucune source.

## Échelle de statut

| Statut | Définition | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée, texte cité ou source publiée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Position de conception assumée, à respecter ou abandonner explicitement | Contraint la conception, ne prouve rien |
| **Possibilité** | Trajectoire conservée ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au [[maSecure/90-pilotage/Journal des décisions\|Journal des décisions]] | Engage |

---

## 1. Faits

| # | Fait | Source | Fiabilité |
| --- | --- | --- | --- |
| F1 | Le corpus hérité compte **41 fichiers**, produits en **sept heures le 2026-06-09**, en **trois passes successives** sur les mêmes objets | Horodatages, [[maSecure/99-sources/Sources originales\|Sources originales]] | **Élevée** — recomptable |
| F2 | La charte de fonctionnement a été réécrite **quatre fois en quatorze minutes**, en taille croissante | Horodatages | **Élevée** |
| F3 | Le corpus **ne cite aucune enquête, aucune mesure, aucun entretien, aucun état de l'art, aucun texte réglementaire** | Lecture de l'inventaire | **Élevée** — infirmable par production d'une source |
| F4 | Le corpus déclare des *« décisions métier validées »* et prétend *« figer les spécifications »* | `analyses_conception/04_points_ambigus_questions.md` | **Élevée.** Classées **proposées** par `DEC-C-014` |
| F5 | **Six acteurs vivants** de tontine numérique sont documentés en Afrique de l'Ouest et sur le marché francophone, **dont un agréé par la Banque centrale** | [[Benchmark et cadre réglementaire]] | **Élevée** sur l'existence, **nulle sur l'adoption** |
| F6 | **Le capital minimum d'un établissement de monnaie électronique en zone UEMOA est de 300 millions de francs CFA**, entièrement libéré en numéraire **avant** délivrance de l'agrément. Les placements en dépôts à vue doivent représenter au moins 75 % de l'encours | BCEAO, instruction n° 008-05-2015 | **Élevée** — texte |
| F7 | Le cadre de licence des services de paiement a été **reporté six fois** depuis le 1er mai 2025, pour « à peine une douzaine d'approbations » en dix-huit mois | Launch Base Africa, 28/08/2026 | Élevée sur les dates, **moyenne sur le décompte** |
| F8 | Sur **vingt fermetures** de fintechs africaines documentées, **trois** le sont par défaut de licence, dont une ayant levé **86,1 M$** | The Condia | Élevée sur les cas, **aveugle aux dispositifs non financés** |

> [!danger] Ce que F5 et F6 changent au projet
> Le corpus conçoit un **coffre** qui reçoit et conserve les fonds. En zone UEMOA, cela relève de la monnaie électronique ou des services de paiement, donc d'un agrément que **le porteur ne signe pas**.
> C'est un écart avec la règle `D1` de la [[Doctrine du coffre]], et il porte sur le mécanisme central. La question qui en découle — **la valeur tient-elle dans la garde, ou dans la règle et la preuve ?** — est la première du programme, et le corpus ne la pose jamais.

> [!warning] Ce que F5 n'établit pas
> Que les six acteurs soient **adoptés**. Leur existence est documentée, leur usage ne l'est pas. C'est l'objet du lot `L2`.

---

## 2. Hypothèses en attente de test

### 2.1. Hypothèse centrale — la thèse du projet

| Champ | Contenu |
| --- | --- |
| **Énoncé** | Dans une tontine, ce qui casse n'est pas l'argent mais la **confiance dans la personne qui le détient** |
| **Statut** | **Hypothèse — non instruite** |
| **Ce qui l'invaliderait** | Que les membres préfèrent un trésorier connu à un système qu'ils ne contrôlent pas, **après avoir décrit un incident vécu** |
| **Observation** | Le trésorier n'est pas seulement un risque : c'est une **personne responsable devant le groupe**, joignable. Un système ne rend pas ce service. Le corpus pose la défiance comme acquise sans jamais la vérifier |
| **Lot** | `L4` |

### 2.2. Les cinq problèmes du corpus, rétrogradés en hypothèses

Le corpus les présente comme des constats. Aucun ne porte de source.

| # | Affirmation | Ce qui manque | Lot |
| --- | --- | --- | --- |
| PB1 | Le risque humain — le trésorier disparaît ou détourne | Une mesure de fréquence, ou des récits documentés | `L3` |
| PB2 | Le manque de traçabilité des versements | Une observation de tontines réelles | `L3` |
| PB3 | Les conflits d'ordre, de retard et d'exclusion | Idem | `L3` |
| PB4 | La difficulté pour les personnes peu lettrées | Une mesure du public réellement visé | `L5` |
| PB5 | L'absence de mécanisme de sécurité collective | Idem | `L3` |

---

## 3. Principes de conception

Contribution la plus solide du corpus. Ils n'ont pas à être prouvés ; ils ont à être respectés, ou abandonnés par une décision explicite.

| # | Principe | Conséquence |
| --- | --- | --- |
| P1 | **Séparer la garde de l'argent, la logique de gestion et le droit de décision** | Transforme un problème de personne en problème de système. C'est l'apport du corpus |
| P2 | **La règle est connue d'avance et appliquée sans intervention** | Le groupe choisit à la création ; le système exécute |
| P3 | **Toute décision laisse une trace de la règle qui l'a produite** | Registre en ajout seul, non modifiable |
| P4 | **Les humains proposent, votent, valident ou consultent — ils ne manipulent pas les fonds** | Répartition des droits, indépendante de la question de la garde |

Source : `99-sources/prod-docs/analyse_formalisation_idee_vision/analyse1.md`.

---

## 4. Possibilités ouvertes — aucune n'est sélectionnée

| Sujet | Possibilités |
| --- | --- |
| **Rapport aux fonds** | Le système ne les touche jamais · adossement à un établissement agréé · agrément propre. **La plus lourde du dossier** |
| Territoire | Aucun n'est nommé par le corpus. Le régime réglementaire en dépend |
| Public | Tontines familiales · professionnelles · associatives · de quartier |
| Modèle de règles | Automatique · par vote · hybride au choix du groupe |
| Traitement du défaut | Retard, suspension, quarantaine, exclusion — quatre états proposés, aucun validé |

---

## 5. Décisions

**Décisions de projet : néant.** Voir [[maSecure/90-pilotage/Journal des décisions|Journal des décisions]].

Trois décisions de coffre sont actives — `DEC-C-054` à `DEC-C-056` — et portent sur le rangement et la méthode, jamais sur le produit.

Restent suspendus, y compris là où le corpus contient une réponse écrite et détaillée : le rapport aux fonds, le régime réglementaire, le territoire, le public, le périmètre, les règles de fonctionnement, le modèle économique, la forme juridique, le *Core Domain* et l'architecture.
