---
projet: "gounhri"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est établi, observé, supposé, possible — et ce qui reste explicitement hors décision"
lignes_decidees: 0
cree_le: 2026-09-07
tags:
  - gounhri
  - pilotage
  - statuts
---

# Registre des statuts

> [!info] Ce document n'invente rien
> Tout ce qui suit est extrait des trois documents de `gounhri`. Aucune affirmation, aucun chiffre, aucune hypothèse n'y a été ajouté, et **aucun statut n'y a été promu**.

## L'échelle de statut est celle que le projet s'est donnée

Le point 44 du [[Document d'ouverture]] pose sa propre classification, assortie d'une consigne : *« Ces catégories ne doivent pas être mélangées. »* Elle recouvre celle du coffre presque terme à terme.

| Statut du projet | Définition qu'il en donne | Équivalent au coffre |
| --- | --- | --- |
| **Faits** | Informations vérifiées par des sources fiables | Fait |
| **Observations** | Ce qui est réellement constaté sur le terrain | Fait, de second rang |
| **Hypothèses** | Ce que l'on pense pouvoir être vrai mais qui doit être testé | Hypothèse |
| **Possibilités** | Ce que l'architecture ou le projet pourrait éventuellement devenir | Proposé |
| **Décisions** | Ce qui sera explicitement validé après analyse | Décidé |

Le [[Dossier d'ingénierie humaine]] applique cette échelle **jusque dans son texte** : chaque énoncé y porte sa marque `[F]`, `[O]`, `[H]` ou `[I]`. C'est le seul document du coffre à le faire.

> [!danger] Aucune ligne de ce registre n'est au statut « Décidé », et c'est voulu
> Voir le [[gounhri/90-pilotage/Journal des décisions|Journal des décisions]] : les trois documents se déclarent non décisionnels, et deux consacrent une section entière à énumérer ce qu'ils ne décident pas.

---

## 1. Faits — établis par source citée

### 1.1. Le fait qui structure tout le dossier : l'arrêt d'Ayoba

| Élément | Contenu |
| --- | --- |
| **Ce qui a existé** | MTN, premier opérateur télécom africain, lance en 2019 `Ayoba` — messagerie chiffrée, appels, notes vocales, **continuité SMS** vers les non-équipés, **plus de 22 langues africaines** dont le dioula, 150 canaux de contenu localisé, version web légère, **accès dégroupé sans consommation de forfait**, présence sur 17 marchés |
| **Trajectoire** | 1 million d'utilisateurs actifs mensuels en moins d'un an, ~20 millions fin 2022, **pic à ~35 millions en 2023-2024**. Objectif affiché : 100 millions |
| **Fin** | Retirée des magasins d'applications le **20 mars 2026** |
| **Causes convergentes des analyses** | La gratuité de la donnée achetait de l'installation, pas de l'usage · l'effet réseau des plateformes installées n'a pas été entamé · **au Ghana, les propres équipes de MTN continuaient d'utiliser WhatsApp** |

> [!danger] Ce fait vise directement la stratégie envisagée par le dossier de cadrage
> *« Distribution massive + subvention de données + localisation linguistique + chiffrement + passerelle SMS + contenu local **ne suffisent pas** à déplacer un graphe social installé. »*
> Et le [[Dossier d'ingénierie humaine]] le dit sans détour : cette liste **est exactement celle des atouts** que le [[Dossier stratégique de cadrage]] envisage de mobiliser à ses points 7, 12, 13, 17 et 19. *« Ayoba avait tout cela, à une échelle continentale, avec le bilan d'un opérateur derrière, et a échoué. »*

### 1.2. Le contre-exemple

`Zalo`, au Viêt Nam : environ **77,8 millions d'utilisateurs actifs mensuels en 2024**, plus de 85 % de la population. Conçue pour les appareils bas de gamme et les connexions instables, ancrée dans un usage différencié — travail, relations proches, démarches administratives — et intégrée aux services publics. Point capital relevé : dans les premières années, une majorité d'utilisateurs **préférait encore Messenger**. *« Zalo n'a pas gagné en étant préférée. Elle a gagné en devenant indispensable pour autre chose. »*

### 1.3. Le contexte numérique burkinabè

Selon **DataReportal**, début 2025 : environ **28,1 millions de connexions mobiles**, **5,75 millions d'internautes**, **3,40 millions d'identités d'utilisateurs de réseaux sociaux**, pour une pénétration Internet estimée à **24,2 %**. Le dossier de cadrage assortit lui-même ces chiffres de leur réserve méthodologique : ils *« ne doivent pas être assimilés directement à des personnes uniques ou à des utilisateurs actifs homogènes »*. L'**ARCEP** dispose d'un plan stratégique 2024-2028.

> [!note] Les sources de ce point sont nommées, contrairement à d'autres projets du coffre
> L'annexe D du dossier de cadrage identifie DataReportal, l'ARCEP, la Primature et le ministère de la Transition digitale. C'est l'un des rares endroits du coffre où la règle 3 — *« pas de chiffre sans source »* — est satisfaite.

---

## 2. Les vingt et un invariants candidats — proposés, non arrêtés

Le point 6 du [[Dossier d'ingénierie humaine]] récapitule `I-01` à `I-21`, tirés discipline par discipline. Ils ne sont pas recopiés ici. Quatre méritent d'être connus avant toute conception :

| Réf. | Invariant | Portée |
| --- | --- | --- |
| `I-01` | **Loi du terrain non occupé** — un système social nouveau ne se substitue pas à un système installé sur le même usage ; il ne croît qu'en occupant un usage mal servi, non servi, ou impossible à servir | Conditionne le périmètre entier |
| `I-08` | L'audio est le mode principal ; le texte est le mode d'accessibilité | Conditionne l'architecture et le coût |
| `I-11` | **L'adoption ne se subventionne pas** | Tirée directement du fait Ayoba |
| `I-21` | **Invariant de non-construction** — aucune classification communautaire possible, **même par inférence** | Conditionne le modèle de données |

> [!caution] Le document déclare lui-même que ces invariants ne sont pas tous compatibles
> Quatre tensions sont posées et laissées ouvertes : `I-08` audio contre `I-19` limitation de la diffusion et contre la modération, l'audio étant le format le plus difficile à modérer ; `I-21` contre `I-04`, la modération contextuelle exigeant de connaître des relations que l'invariant interdit de centraliser ; `I-11` contre `I-15`, la barrière du prix du terminal appelant précisément la subvention qu'on écarte ; `I-17` gouvernance emboîtée contre la cohérence de l'expérience.
> *« Ces tensions ne se résolvent pas par arbitrage de bureau. Elles doivent être instruites par prototypes concurrents. »*

---

## 3. Les six interdictions

Le point 4 du [[Dossier d'ingénierie humaine]] énonce ce que les sciences humaines **interdisent**, et non ce qu'elles recommandent. Formulation la plus contraignante du corpus :

1. Ne pas construire un graphe permettant l'**inférence ethnique**.
2. Ne pas modérer **hors contexte relationnel**.
3. Ne pas confondre l'**utilisateur, l'appareil et le numéro**.
4. Ne pas construire une **hiérarchie de navigation profonde**.
5. Ne pas traiter la **vitesse de diffusion comme une performance**.
6. Ne pas conduire la **recherche fondatrice à l'extérieur** du pays.

---

## 4. Hypothèses — dix-neuf, falsifiables, aucune éprouvée

L'annexe A du [[Dossier d'ingénierie humaine]] tient le tableau complet `H-01` à `H-19`, chacune avec sa priorité et sa méthode de test. **Quatre sont cotées critiques** :

| Réf. | Hypothèse | Méthode |
| --- | --- | --- |
| `H-01` | L'échec d'Ayoba tient au caractère **générique**, pas au caractère local | Enquête d'usage et analyse comparative |
| `H-10` | La reconnaissance vocale **n'est pas nécessaire** au démarrage | Prototype vocal sans reconnaissance automatique |
| `H-13` | Profondeur hiérarchique navigable **≤ 2 niveaux** pour une part importante des utilisateurs | Réplication expérimentale |
| `H-16` | Accès féminin majoritairement **via un appareil non possédé** | Enquête ménages |

`H-01` est désignée comme **la charnière de tout le projet**, à tester en priorité. Le partage d'appareil (`H-16`) est désigné comme *« la donnée manquante la plus importante du dossier »*.

> [!warning] Un livrable manque, et le corpus le dit lui-même
> Le point 2.9 du [[Dossier d'ingénierie humaine]] ajoute aux seize livrables du dossier de cadrage un **livrable 0** : *« Inventaire raisonné de ce que le pays ne sait pas sur ses propres usages numériques »* — possession individuelle d'appareil par sexe et milieu, pratiques de partage, langues effectivement utilisées à l'écrit et à l'oral, structure des groupes existants, coût réel par ménage, transfert hors ligne. *« Sans ce socle, toute architecture est bâtie sur des projections. »*

---

## 5. Possibilités — l'espace ouvert, jamais refermé

| Espace | Où | Nombre |
| --- | --- | --- |
| Orientations possibles du projet | Point 41 du [[Document d'ouverture]] | **10**, du réseau social national à l'infrastructure souveraine d'intérêt national |
| Scénarios de projet | Point 22 du [[Dossier stratégique de cadrage]] | **7**, du réseau social minimal à l'écosystème complet |
| Modèles institutionnels | Point 13 de l'ouverture et point 9 du cadrage | **6**, de l'entreprise privée à la fédération |
| Primitives sociales candidates | Point 5 du [[Dossier d'ingénierie humaine]] | **7**, tirées du contexte burkinabè — le *cercle* issu du *grin*, l'*alliance déclarée* issue du *rakiré*, la *palabre*, la *tontine d'infrastructure*, la **radio augmentée** présentée comme la piste principale recommandée à l'étude, le *lien de diaspora*, la *synchronisation de proximité* |

**Aucune de ces options n'est retenue.** C'est la position explicite du corpus, pas un défaut d'instruction.

---

## 6. Décisions — néant, et deux listes qui le disent

| Document | Section | Contenu |
| --- | --- | --- |
| [[Document d'ouverture]] | Point 45 | **28 sujets** volontairement non décidés : nom, marque, modèle économique, statut juridique, gouvernance, propriété, architecture, pile, hébergement, modèle de données, protocole, identité, blockchain, IA, fédération, open source, modération, rôle de l'État, rôle des opérateurs, premier marché, MVP, secret, actif indétrônable, effet réseau, avantage compétitif |
| [[Dossier stratégique de cadrage]] | Point 24 | **21 sujets**, largement les mêmes |
| [[Dossier stratégique de cadrage]] | Point 25 | Le « secret » et l'« actif indétrônable » restent **hors décision** ; le dossier autorise seulement l'exploration de classes d'hypothèses |
| [[Dossier d'ingénierie humaine]] | Point 10 | *« Rien, sauf la méthode »* — trois décisions de **procédure** proposées : lancer la vague 1 avant toute autre étude, inscrire `I-21` au premier rang du modèle de menace, reformuler la question directrice |

---

## 7. Risques

Deux registres, complémentaires. Le point 28 du [[Dossier stratégique de cadrage]] en énumère **huit** : construire trop grand, sous-estimer le coût vidéo, réseau social sans réseau, souveraineté symbolique, gouvernance ambiguë, modération insuffisante, UX trop technique, dépendance à un fournisseur unique.

Le point 8 du [[Dossier d'ingénierie humaine]] en ajoute **douze**, cotés et assortis d'une réponse. Un seul est coté **critique** :

| Réf. | Risque | Gravité | Réponse proposée |
| --- | --- | --- | --- |
| `RH-1` | **Le système devient, par ses données, un instrument de classification communautaire** | **Critique** | `I-21`, modèle de menace prioritaire |
| `RH-4` | Exclusion structurelle des femmes par l'appareil et le partage | Élevée | `I-12`, `I-15`, enquête non mixte |
| `RH-6` | Répétition du scénario Ayoba : installations subventionnées sans usage | Élevée | `I-01`, `I-11`, rétention non subventionnée comme indicateur pivot |
| `RH-10` | Recherche extractive dégradant durablement l'accès au terrain | Moyenne | `I-20`, restitution obligatoire |

---

## 8. Critères d'abandon — proposés, non adoptés

Le point 9 du [[Dossier d'ingénierie humaine]] répond à une demande du point 50 de l'ouverture. Cinq critères, *« délibérément exigeants »* : aucun usage social significatif n'est mal servi · la rétention **non subventionnée** d'un prototype ne dépasse pas un seuil **fixé à l'avance et publié** · l'invariant `I-21` ne peut pas être satisfait architecturalement · le coût d'exploitation d'un système audio-first à l'échelle nationale est hors de portée · les institutions dont la légitimité serait mobilisée **refusent de l'être**.

> [!important] Le document propose la réduction plutôt que l'abandon
> *« Un petit système qui fonctionne est une meilleure démonstration de souveraineté qu'une grande plateforme inutilisée. »*

---

## 9. Frontières — non tranchées

La frontière `ecoFab` / `gounhri` est **explicitement laissée ouverte** par la [[Cartographie du portefeuille]], qui relève par ailleurs que `gounhri` n'est cité par aucun autre projet du coffre.

Le point 36 du [[Document d'ouverture]] pose de son côté la règle de prudence, et elle vaut pour tout le portefeuille : une infrastructure sociale pourrait interagir avec les infrastructures d'information, les services publics, l'identité, les systèmes éducatifs, les paiements — *« mais ces relations doivent être étudiées sans transformer artificiellement tous les projets en un seul système »*.
