---
projet: "infUb"
type: "etude-comparative"
phase: "10-etudes"
version: "1.0"
date_du_document: 2026-09-02
statut: "Étude approfondie — benchmark international et proposition de solution cible"
territoire: "Burkina Faso"
document_amont: "[[Document de référence global]]"
documents_enfants: "[[DDD tactique du noyau]] · [[Recueil d'ADR du noyau]]"
portee_decisionnelle: "Couvre transversalement les 12 études du point 20 du document de référence, au niveau des arbitrages structurants"
ce_document_n_est_pas: "Un cahier des charges, ni une spécification technique détaillée"
tags:
  - infUb
  - etudes
  - benchmark
  - solution-cible
---

> [!info] Note de provenance — ajoutée par la mise en coffre, ne fait pas partie du document
> Fichier reçu **déjà en Markdown** : aucune conversion. Déplacé depuis la racine du dossier `infUb/` et renommé ; le corps ci-dessous est **identique octet pour octet** à l'original (93 099 octets), seul l'en-tête de propriétés ci-dessus a été ajouté. Empreinte et provenance : [[infUb/99-sources/Sources originales|Sources originales]]. Décision `DEC-C-008` au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]].

---

# ÉTUDE COMPARATIVE ET SOLUTION CIBLE

## Infrastructure nationale de publication et de vérification de l'information institutionnelle — Burkina Faso

| Élément | Valeur |
|---|---|
| **Statut** | Étude approfondie — benchmark international et proposition de solution cible |
| **Version** | 1.0 |
| **Date** | 2 septembre 2026 |
| **Documents amont** | `00_DOCUMENT_FONDATEUR_V0.1.md`, `DOCUMENT_DE_REFERENCE_GLOBAL_V1.0.docx` |
| **Nature** | Analyse critique, benchmark (Occident, Asie, Afrique), architecture de solution, trajectoire |
| **Portée décisionnelle** | Couvre transversalement les 12 études du point 20 du document de référence, au niveau des arbitrages structurants |
| **Ce document n'est pas** | Un cahier des charges, ni une spécification technique détaillée |

> **Note de lecture.** Cette étude est délibérément critique. Elle confirme une grande partie du cadrage existant, mais elle conteste explicitement trois hypothèses structurantes du document de référence (l'actif stratégique visé, la composition du MVP, l'ordre de conquête des utilisateurs). Chaque contestation est argumentée par des précédents documentés. Les points où le benchmark est muet ou contradictoire sont signalés comme tels plutôt que comblés par affirmation.

---

## Sommaire

1. Méthode et positionnement de l'étude
2. Le contexte burkinabè comme contrainte de conception
3. Grille d'analyse : les six fonctions d'une infrastructure d'information institutionnelle
4. Benchmark international — fiches et analyse
5. Enseignements transférables et anti-modèles
6. Diagnostic critique du projet
7. Solution cible proposée
8. Trajectoire en quatre horizons
9. Registre des risques
10. Réponses argumentées aux questions ouvertes (point 19.2)
11. Études résiduelles
12. Sources

---

# 1. Méthode et positionnement de l'étude

## 1.1. Ce que le dossier existant a déjà réglé

Le document fondateur et le document de référence global ont produit un socle solide qu'il ne faut pas rouvrir :

- **Le diagnostic du problème** — fragmentation de l'accès, et non de la production — se vérifie sur le benchmark. La plupart des projets africains d'information publique se trompent ici et attaquent la production de contenu.
- **La distinction publication canonique / canal de diffusion** est la bonne primitive métier. Elle est confirmée par tous les modèles matures étudiés (ELI en Europe, Riigi Teataja en Estonie, Légifrance en France).
- **La séparation information / expression** (principe 6.5) est une décision de conception majeure que la plupart des plateformes publiques n'ont jamais su tenir.
- **Le refus du feed d'engagement** (point 12 du fondateur) protège l'actif à long terme.
- **Le choix architectural** — monolithe modulaire, hexagonal, Go/PostgreSQL, outbox transactionnel — est proportionné à une petite équipe et à un contexte d'exploitation contraint. Rien dans le benchmark ne justifie de le rouvrir.

## 1.2. Ce que l'étude ajoute

Trois choses que les documents amont ne traitent pas et qui déterminent la viabilité :

1. **La preuve d'authenticité hors plateforme.** Les documents affirment qu'« un canal externe n'est jamais propriétaire de la publication canonique », mais ne disent jamais comment un citoyen qui reçoit un PDF par WhatsApp — le cas dominant au Burkina Faso — peut vérifier quoi que ce soit. C'est le trou central du dispositif, et c'est aussi, comme on le verra, l'endroit où se trouve la fonction la plus défendable du projet.
2. **L'ordre de conquête.** Les documents traitent citoyens et institutions comme deux « univers » symétriques. Ils ne le sont pas. L'un est un marché à conquérir contre Facebook, WhatsApp et TikTok ; l'autre est une adoption administrative. Se tromper d'ordre est le mode d'échec le plus fréquent du benchmark.
3. **La question du porteur.** Le point 19.2 laisse ouverte la question du statut juridique et de la gouvernance. Le benchmark montre que c'est cette question, et non la technique, qui tue les infrastructures d'information publiques.

## 1.3. Méthode

L'étude procède en quatre temps :

```text
Contraintes mesurées du terrain burkinabè
            ↓
Grille fonctionnelle (6 fonctions cardinales élargies)
            ↓
Benchmark : quel modèle couvre quelle fonction, à quel coût, avec quel résultat
            ↓
Recomposition : quelle combinaison est viable ICI, dans quel ordre
```

Le benchmark n'est pas un catalogue d'inspiration. Chaque modèle est retenu pour **une fonction précise qu'il a résolue mieux que les autres**, ou pour **un échec documenté dont il faut tirer une règle**.

---

# 2. Le contexte burkinabè comme contrainte de conception

Ce chapitre n'est pas un décor. Chacun de ces chiffres élimine ou impose une option d'architecture.

## 2.1. Le plafond d'audience numérique

| Indicateur | Valeur | Source / date |
|---|---|---|
| Population | ~24,2 millions | Digital Report, données 2025 |
| Internautes uniques actifs | **5,42 millions — 22,4 %** | Digital Report, données 2025 |
| Utilisateurs de réseaux sociaux | 3,9 millions — 14,3 % | Digital Report, données 2025 |
| Cartes SIM actives | 29,3 millions (121 %) | Digital Report, données 2025 |
| Abonnements haut débit mobile | 20,8 millions | Digital Report, données 2025 |
| Abonnés fibre | 229 000 | Digital Report, données 2025 |
| Taux d'urbanisation | 33,5 % | Digital Report, données 2025 |
| Couverture 4G du territoire | 41,5 % | Analyse e-gouv/ODD, 2025 |

> **Avertissement méthodologique.** On rencontre au Burkina Faso deux « taux de pénétration internet » incompatibles : ~22 % (internautes uniques, méthodologie Kepios/DataReportal) et ~83 % (abonnements internet mobile rapportés à la population, méthodologie régulateur). Les deux sont exacts et mesurent des choses différentes : le second compte des SIM, pas des personnes. **Toute cible d'audience du projet doit être bâtie sur le premier chiffre.** Dimensionner sur 83 % serait une erreur de conception aux conséquences directes (infrastructure surdimensionnée, canaux hors-ligne négligés, hypothèses d'adoption fausses).

**Conséquence de conception n°1 :** le plafond théorique d'une interface web/PWA est de ~5,4 millions de personnes, très majoritairement urbaines. Une infrastructure « nationale » qui n'existerait que sur le web dessert structurellement moins d'un quart du pays. **La distribution hors-web n'est pas une extension de la feuille de route : c'est une exigence du MVP.**

## 2.2. Le plafond de capacité de l'État

| Indicateur | Valeur | Lecture |
|---|---|---|
| EGDI 2024 (ONU) | **0,2895 — 175ᵉ sur 193** | En recul (166ᵉ en 2022) |
| Moyenne africaine EGDI | 0,4247 | Le pays est nettement sous la moyenne du continent |
| Indice services en ligne (OSI) | 0,3376 | Offre de services numérisés faible |
| Indice infrastructure (TII) | 0,3640 | Contrainte réelle mais pas la première |
| **Indice capital humain (HCI)** | **0,1668** | **Le goulot d'étranglement dominant** |
| E-participation | 0,2192 — 152ᵉ | Faible culture d'interaction numérique institution/citoyen |
| Plateformes ministérielles développées | 59, dont 32 en ligne | Fragmentation confirmée, et cimetière de plateformes |
| Couverture RESINA | 93,33 % des chefs-lieux de province (2020) | Actif réseau réel de l'administration |

**Conséquence de conception n°2 :** le HCI à 0,1668 dit que la contrainte n° 1 n'est ni le réseau ni le budget, mais **la capacité à produire et à opérer**. Un système qui demande à chaque institution de former un webmestre, de rédiger en HTML ou d'apprendre une interface complexe ne sera pas adopté. Le coût marginal de publier doit tendre vers zéro, et la première interface d'ingestion doit être **ce que les agents savent déjà faire** : envoyer un e-mail avec un PDF en pièce jointe.

**Conséquence de conception n°3 :** les « 59 plateformes développées dont 32 en ligne » sont l'aveu du problème que le projet veut résoudre — et simultanément la preuve que construire une plateforme de plus n'est pas la réponse. Ce qui manque n'est pas une plateforme : c'est **une couche que les plateformes existantes peuvent utiliser**.

## 2.3. Le contexte sécuritaire et humanitaire

Environ 40 % du territoire échappe au contrôle effectif de l'État et environ 2 millions de personnes sont déplacées internes. C'est un fait de conception, pas un aléa.

- L'information la plus vitale (état civil, scolarité, aide, retour, sécurité) concerne précisément les populations les moins connectées et les plus mobiles.
- La notion de **rattachement territorial** d'une publication (point « informations territoriales » du fondateur) devient instable : une personne déplacée de Djibo à Ouahigouya reste concernée par les deux territoires.
- Le canal vocal et le canal radio ne sont pas des « nice to have » : ce sont les seuls canaux qui atteignent ces publics.

## 2.4. L'écosystème de confiance dégradé

Le Burkina Faso connaît une circulation documentée de faux actes administratifs : fausses circulaires ministérielles ayant donné lieu à des menaces de poursuites (2026), faux avis de recherche attribués aux forces de sécurité, faux démentis et fausses annonces attribuées à des institutions républicaines. Des structures de fact-checking locales (Fasocheck) documentent régulièrement ces cas.

Parallèlement, l'environnement médiatique s'est resserré : suspensions de médias et blocages de sites d'information ont été documentés par des organisations de défense de la presse.

**Conséquence de conception n°4 :** ces deux faits tirent dans le même sens. La demande sociale la plus aiguë aujourd'hui n'est pas « où trouver l'information » (Facebook y répond mal mais y répond) — c'est **« cette information est-elle authentique et est-elle encore valable ? »**. Aucun réseau social ne peut répondre à cette question. C'est le seul terrain où une infrastructure institutionnelle a un avantage structurel absolu.

**Conséquence de conception n°5 :** dans ce même contexte, une plateforme d'information adossée à l'État portera une **présomption de partialité**. La gouvernance doit être conçue pour désamorcer cela dès le premier jour, faute de quoi le projet sera lu comme un organe de communication. Ce point est traité au point 7.8.

## 2.5. Les actifs nationaux mobilisables (et déjà existants)

Le projet n'arrive pas sur un terrain vide. Ignorer ces actifs serait une faute stratégique.

| Actif | État | Implication pour le projet |
|---|---|---|
| **JOBF + LégiBurkina** (jobf.gov.bf, legiburkina.gov.bf) | Lancés le 15 nov. 2024 par le SGG-CM et le ministère de la Transition digitale, gratuits | **Le domaine juridique est déjà pris.** Le projet ne doit pas republier les textes de loi : il doit s'y **lier**. Et le SGG-CM est un candidat naturel d'institution d'ancrage. |
| **Datacenters souverains** | Deux datacenters modulaires inaugurés le 23 janvier 2026 à Ouagadougou (3 000 To, 28 800 cœurs, 105 600 Go RAM, 7 000+ VM), doctrine « zéro donnée à l'extérieur », 3ᵉ prévu 2028 | La question « où héberger » (point 19.2) a une réponse politique déjà donnée. Le projet doit être **conçu pour y être déployable**, sans en dépendre au démarrage. |
| **RESINA** | Réseau de l'administration, 93,33 % des chefs-lieux de province | Canal de distribution intra-administration existant. |
| **ANSSI-BF + loi cybersécurité** | Agence opérationnelle, cadre légal adopté | Interlocuteur d'homologation obligatoire, pas optionnel. |
| **CIL** | Autorité de protection des données, loi de 2004 | Cadre daté mais opposable. Voir point 10. |
| **data.gov.bf** | Portail open data | Point d'interopérabilité et précédent de format. |
| **Service 3-2-1 / Studio Yafa** | Serveur vocal interactif gratuit, code court **321** sur Orange, 3 à 5 langues, **~75 000 appels/mois** au Burkina (contre 7,78 M/mois au Mali via Studio Tamani) | **Canal existant, opérationnel, multilingue, gratuit pour l'usager, et massivement sous-utilisé au Burkina.** C'est le canal du dernier kilomètre déjà construit. |
| **Radios communautaires** | Densité forte, premier média du pays | Relais de diffusion à équiper, pas à concurrencer. |
| **Mobile money** | Orange Money / Moov Money, pénétration élevée en zone UEMOA | Rail de paiement disponible si un modèle économique en a besoin. |

> **Le fait le plus important de ce chapitre** : au Burkina Faso, un canal vocal national gratuit multilingue existe déjà et fait 75 000 appels par mois, pendant que le même dispositif fait 7,78 millions d'appels par mois au Mali. L'écart n'est pas technique. Il est éditorial : **il n'y a pas assez de contenu utile et à jour à y verser.** C'est exactement le problème que l'infrastructure proposée résout — à condition qu'elle soit conçue pour alimenter ce canal, et non pour lui faire concurrence.
---

# 3. Grille d'analyse : les six fonctions d'une infrastructure d'information institutionnelle

Le document de référence identifie quatre fonctions cardinales (publication, recherche, distribution, persistance). L'étude du benchmark impose d'en distinguer **six**, parce que deux d'entre elles — la preuve d'autorité et l'interopérabilité — sont précisément celles qui déterminent qui survit.

| # | Fonction | Question à laquelle elle répond | Pourquoi elle est séparable |
|---|---|---|---|
| **FN1** | **Autorité** | *Qui a le droit de parler au nom de cette institution, et comment le prouver ?* | C'est la seule fonction qui ne peut pas être répliquée par un acteur privé. Elle est adossée à un acte juridique. |
| **FN2** | **Canonicité & persistance** | *Quel est l'objet de référence, quelle est sa version en vigueur, existera-t-il dans dix ans ?* | Produit un actif cumulatif : les liens émis pointent vers elle, le coût de rupture croît avec le temps. |
| **FN3** | **Découverte** | *Où est l'information que je cherche ?* | Fonction concurrentielle : Google, Facebook et les portails la remplissent déjà partiellement. |
| **FN4** | **Distribution** | *Comment l'information atteint-elle celui qu'elle concerne ?* | Fonction opérationnelle et coûteuse (SMS, IVR, push). Fortement mutualisable. |
| **FN5** | **Relation** | *Comment le citoyen suit-il, réagit-il, questionne-t-il ?* | La plus coûteuse en gouvernance et modération, la moins différenciante. |
| **FN6** | **Interopérabilité** | *Comment les autres systèmes consomment-ils cette information ?* | Détermine le coût de sortie et donc la défendabilité réelle. |

*Les résumés par modèle qui suivent notent chaque fonction sur l'échelle de 0 à 3 du tableau de synthèse, point 4.4 : 3 fonction pleinement résolue, 2 résolue partiellement, 1 marginale, 0 absente.*

**Le principe d'analyse est le suivant :** un modèle ne « réussit » pas globalement. Il réussit sur un sous-ensemble de fonctions, et sa viabilité tient à ce que **chaque fonction qu'il porte ait de la valeur seule**. Les systèmes qui ont tenté de livrer FN1 à FN6 simultanément et d'un bloc sont ceux qui figurent dans la colonne des échecs.

---

# 4. Benchmark international

## 4.1. Occident

### 4.1.1. Estonie — Riigi Teataja (Journal officiel électronique)
**Fonctions couvertes : FN1 = 1 · FN2 = 3 · FN3 = 2 · FN6 = 2**

Publication électronique parallèle au papier à partir du 1er juin 2002, dernière édition papier le 31 mai 2010 : **la version électronique est devenue la version officielle**, pas une copie de courtoisie. Publié par le ministère de la Justice et du Numérique, hébergé et opéré techniquement par le RIK (Centre des registres et systèmes d'information). Le service offre la recherche plein texte, la recherche dans les textes originaux, une **chronologie permettant de retrouver l'état du droit à une date donnée**, l'accès aux projets de loi et à leur procédure, et un abonnement à des notifications par e-mail.

**Ce qui est transférable :** le versionnement temporel comme fonction de premier niveau, et surtout la **dissociation entre l'autorité éditoriale (le ministère) et l'opérateur technique (le RIK)**. C'est le montage de gouvernance le plus directement réutilisable pour infUb.

**Ce qui ne l'est pas :** le périmètre. Riigi Teataja est un journal officiel juridique. Au Burkina Faso, cette fonction est **déjà occupée** par JOBF et LégiBurkina depuis novembre 2024.

### 4.1.2. Royaume-Uni — GOV.UK (domaine unique) et GOV.UK Notify
**GOV.UK : FN1 = 3 · FN2 = 2 · FN3 = 3 — Notify : FN4 = 3 · FN6 = 3**

Deux enseignements distincts, souvent confondus.

**Le domaine unique.** GOV.UK a consolidé des centaines de sites ministériels sous un seul domaine et une seule plateforme éditoriale (Whitehall Publisher). L'effet de confiance ne vient pas d'un badge : il vient du fait que **l'adresse elle-même est la preuve**. Le coût, en revanche, a été considérable et n'est atteignable que par un État disposant d'une agence numérique centrale forte — condition absente au Burkina Faso (EGDI 175ᵉ).

**GOV.UK Notify** est le modèle le plus important du benchmark pour ce projet. C'est une **plateforme partagée de notification** (e-mail, SMS, courrier) que n'importe quel service public peut consommer en libre-service : plus de 7 000 services, 6,7 milliards de messages depuis mai 2016, plus de 35 M£ d'économies annuelles estimées. Publiée en open source, elle a été réimplantée au Canada (GC Notify : 321 services, 75 M+ notifications), en Australie (déploiement en **huit semaines pour environ 150 000 AUD**), et au Brésil et aux États-Unis.

> **Règle extraite :** une plateforme qui rend un service *à l'administration* s'adopte, se finance et s'exporte ; une plateforme qui demande à l'administration de changer ses pratiques *pour le bien du citoyen* s'impose par décret ou ne s'impose pas. Notify a été adopté volontairement par 7 000 services. C'est le modèle d'adoption à copier.

### 4.1.3. France — DSFR, marque de l'État et 2D-Doc
**FN1 = 3**

Deux dispositifs français répondent directement à la question de la preuve d'autorité.

**Le DSFR (Système de Design de l'État).** Par circulaire du 7 juillet 2023, tout nouveau site ou application mis à disposition du public par l'État doit obligatoirement utiliser le DSFR **et** être accessible sur une URL en `.gouv.fr`. Symétriquement, **l'usage du DSFR est formellement interdit aux collectivités et aux acteurs privés**. L'objectif est explicite : donner au citoyen une assurance visuelle et technique qu'il est sur un site officiel, en réponse à la désinformation.

> **Règle extraite :** l'identité visuelle officielle est un actif à protéger par l'interdiction autant que par l'obligation. Une charte que tout le monde peut utiliser ne prouve rien.

**Le 2D-Doc (cachet électronique visible).** Un code-barres 2D imprimé sur un document officiel contient les données essentielles du document et une **signature cryptographique de l'émetteur**. Il permet de vérifier l'authenticité du document **hors ligne, à partir d'une photo, sans accéder au système émetteur**. Le dispositif est adossé à un écosystème d'autorités de certification et a été repris hors de France, notamment par TUNTRUST en Tunisie (CEV 2D-DOC).

> **Règle extraite — la plus importante de l'étude :** la preuve d'authenticité doit voyager avec le document, pas rester sur la plateforme. Un document scellé reste vérifiable même quand il circule sur WhatsApp, même imprimé, même en photo dégradée, même sans réseau. C'est la seule architecture de confiance compatible avec la réalité de la circulation de l'information au Burkina Faso.

### 4.1.4. Australie — GovCMS
**FN1 = 2 · FN2 = 1 · FN6 = 2**

Plateforme mutualisée de gestion de contenu et d'hébergement opérée par le ministère des Finances, « conçue par le gouvernement, pour le gouvernement » : **plus de 300 sites pour plus de 100 agences**, en modèle **cost-recovery** (recouvrement des coûts), avec conformité de sécurité, accessibilité WCAG 2.1 AA et disponibilité 99,95 %. Deux offres : SaaS (tout géré) ou PaaS (l'agence garde une équipe technique).

**Ce qui est transférable :** le modèle économique. Le cost-recovery mutualisé permet à une petite agence d'accéder au même niveau de sécurité qu'une grande. C'est le seul modèle de financement du benchmark qui soit à la fois soutenable et politiquement neutre.

### 4.1.5. Union européenne — ELI, et l'échec d'EU Voice
**ELI : FN2 = 3 · FN6 = 3 — EU Voice : contre-modèle**

**ELI (European Legislation Identifier)** normalise un identifiant pérenne et un jeu de métadonnées pour les textes publiés par les journaux officiels européens, avec expression en données liées. C'est la formalisation la plus aboutie du principe « identité canonique » que le projet a déjà posé au point 13.1.

**EU Voice / EU Video** est le contre-modèle décisif. Le Contrôleur européen de la protection des données a lancé en 2022 un pilote d'instances **Mastodon et PeerTube** pour les institutions européennes : plateformes sociales décentralisées, souveraines, respectueuses de la vie privée. Le pilote a fonctionné — 40 comptes institutionnels sur EU Voice, dont des commissaires et des eurodéputés — et il a **fermé le 18 mai 2024**. Motif officiel : malgré les efforts pour lui trouver un nouveau foyer, l'EDPS n'a pas réussi à obtenir « une nouvelle propriété » capable de maintenir les serveurs au niveau requis.

> **Règle extraite :** une infrastructure d'information publique ne meurt pas d'un défaut technique ni d'un défaut d'adoption. Elle meurt **faute de propriétaire institutionnel obligé de la maintenir**. La question du porteur (point 19.2, Q1) n'est pas une question de conformité à régler plus tard : c'est la première condition de survie.

## 4.2. Asie

### 4.2.1. Inde — DigiLocker, UMANG, et le registre DLT
**DigiLocker : FN2 = 3 · FN6 = 3 — DLT : FN1 = 3**

**DigiLocker** dépasse **724 millions d'utilisateurs enregistrés** (72,43 crore) et UMANG **116,6 millions** (11,66 crore). DigiLocker n'est pas un réseau : c'est un **coffre de documents émis par des autorités, vérifiables par un tiers**. Sa valeur ne vient pas d'une audience mais du fait qu'un document DigiLocker est *accepté* par les administrations, les banques et les employeurs.

> **Règle extraite :** l'adoption massive vient de l'**acceptabilité** du document, pas de l'attractivité de l'interface. Rendre une publication *opposable* ou *acceptée* vaut mille fonctionnalités sociales.

**Le registre DLT du régulateur télécom (TRAI)** est le modèle le plus sous-estimé du benchmark. L'Inde a imposé l'enregistrement obligatoire, sur un registre distribué, de **toute entité émettrice de SMS et de tout en-tête (sender ID)**, avec pré-approbation des modèles de messages. Résultat : un SMS institutionnel non enregistré n'atteint plus le réseau. C'est un **registre national d'autorité d'émission** — exactement la fonction FN1, appliquée au canal le plus universel.

> **Transposition directe au Burkina Faso :** un registre national des émetteurs institutionnels autorisés, adossé aux opérateurs (Orange, Moov, Telecel) et à l'ARCEP, aurait un effet anti-usurpation immédiat, mesurable, et ne nécessite aucune adoption citoyenne.

### 4.2.2. Singapour — gov.sg, Postman.gov.sg
**FN1 = 3 · FN4 = 3**

Singapour a résolu la vérifiabilité par la **contrainte de domaine** : toute communication officielle passe par des adresses `.gov.sg`, et le gouvernement publie une procédure explicite permettant à un citoyen de vérifier qu'un canal WhatsApp ou Telegram « gov.sg » est authentique. **Postman.gov.sg**, l'équivalent local de Notify, mutualise l'envoi de masse (SMS, e-mail) pour toutes les agences.

**Ce qui est transférable :** la doctrine de **canal unique vérifiable** — un seul point de vérité pour répondre à « ce message vient-il vraiment de l'État ? ». Ce que Singapour fait par une politique de domaine, le Burkina Faso peut le faire par un registre public consultable et un code court.

### 4.2.3. Chine — le modèle des comptes officiels
**FN4 = 3 · FN5 = 3 · FN2 = 1 (nul en pratique)**

Le modèle des *official accounts* (WeChat) est le plus proche cousin fonctionnel de ce que décrit le projet : une organisation dispose d'un espace vérifié, publie des articles longs avec permalien, et les citoyens s'abonnent. C'est aussi le modèle qui a réellement absorbé la communication institutionnelle d'un grand pays.

**Ce qu'il faut en retenir :** la primitive « compte officiel vérifié + article permanent + abonnement » fonctionne à très grande échelle et ne nécessite pas d'algorithme de recommandation.

**Ce qu'il faut en refuser :** l'identité institutionnelle y est accordée par un **opérateur privé**, la persistance dépend de sa politique, et la recherche transversale est faible. C'est précisément la dépendance que le projet cherche à sortir. Le modèle est à répliquer dans sa forme, pas dans son montage.

### 4.2.4. Corée du Sud, Japon — les guichets unifiés
**FN3 = 2 · FN5 = 2**

Government24 (Corée) et les portails équivalents relèvent d'une catégorie différente : ce sont des **guichets de démarches**, pas des registres d'information. Ils sont pertinents pour CheckMe (« quel est mon statut ? ») et non pour l'infrastructure de publication (« qu'est-ce qui a été publié ? »). La distinction posée au point 11 du document fondateur est confirmée par le benchmark et doit être tenue fermement.

## 4.3. Afrique

### 4.3.1. Rwanda — Irembo
**FN5 = 3 — modèle de gouvernance et d'accompagnement**

Irembo est une société privée, avec participation de l'État, liée par un **accord de 25 ans** pour numériser et maintenir les services publics sur une plateforme unique. Le modèle économique repose sur une **commission par demande payante aboutie** : si les citoyens n'utilisent pas, Irembo ne gagne rien. Plus de 100 services en ligne. Et surtout : **4 000 agents ou « ambassadeurs numériques »** répartis dans le pays, qui accompagnent physiquement les citoyens sans équipement ni compétence numérique.

**Limite documentée et essentielle :** avec des prestataires externes, la plateforme a plafonné autour de 40 services — « ça ne se développait pas, donc ce n'était pas durable ». L'internalisation des équipes a été la condition de la suite, dans un pays qui comptait « à peine 100 développeurs » cinq ans plus tôt.

> **Deux règles extraites :** (a) le **maillage humain d'accompagnement** est un composant de l'infrastructure, pas un service annexe — c'est ce qui permet à un dispositif numérique de servir une population majoritairement non connectée ; (b) une infrastructure nationale ne peut pas être sous-traitée sur la durée : **la capacité doit être internalisée**.

**Limite de transposition :** le modèle de commission d'Irembo repose sur des démarches *payantes*. L'information institutionnelle est gratuite par nature. **Le modèle économique d'Irembo n'est pas transposable tel quel** — point traité au point 7.9.

### 4.3.2. Kenya, Ghana — la consolidation par guichet
Les études comparatives Rwanda / Kenya / Ghana convergent sur un constat : la consolidation en guichet unique améliore la lisibilité mais déplace le problème vers l'**intégration arrière** avec les systèmes métiers, et vers la **capacité de maintenance**. Là encore, ce sont des plateformes de transaction, pas d'information.

### 4.3.3. Sénégal — New Deal Technologique
Stratégie numérique nationale lancée le 24 février 2025, articulée autour de la souveraineté et de l'inclusion numériques. Pertinence pour le projet : c'est le voisin comparable qui a le plus formalisé une doctrine de souveraineté ; le vocabulaire, les montages institutionnels et les arbitrages cloud y sont observables en temps réel.

### 4.3.4. Sahel — le service 3-2-1 (Viamo) et les studios de la Fondation Hirondelle
**FN4 = 3 pour les publics non connectés**

Serveur vocal interactif gratuit accessible par code court (**321** sur Orange au Mali et au Burkina, 325 sur Airtel au Niger), contenus en 3 à 5 langues nationales, adossé à des studios de production radio locaux. Volumes : **7,78 millions d'appels mensuels au Mali** (Studio Tamani, mars 2020, 627 958 numéros uniques), 227 989 au Niger, et **~75 000 seulement au Burkina Faso** (Studio Yafa). Le public visé inclut explicitement les zones sans couverture radio ni internet.

> **Règle extraite :** le canal vocal court, gratuit et multilingue est le seul canal numérique qui atteigne aujourd'hui les publics ruraux, non alphabétisés et déplacés du Sahel. Il existe déjà au Burkina Faso et il est sous-alimenté. Une infrastructure d'information institutionnelle qui produit des contenus structurés et datés est exactement ce qui lui manque.

## 4.4. Tableau de synthèse du benchmark

| Modèle | FN1 Autorité | FN2 Canonicité | FN3 Découverte | FN4 Distribution | FN5 Relation | FN6 Interop. | Statut |
|---|:--:|:--:|:--:|:--:|:--:|:--:|---|
| Riigi Teataja (EE) | 2 | 3 | 2 | 1 | 0 | 2 | Pérenne, 24 ans |
| JOBF / LégiBurkina (BF) | 2 | 2 | 1 | 0 | 0 | 0 | Actif depuis 2024 |
| GOV.UK (UK) | 3 | 2 | 3 | 1 | 0 | 2 | Pérenne, coûteux |
| GOV.UK Notify (UK) | 1 | 0 | 0 | 3 | 0 | 3 | Pérenne, réexporté ×4 |
| DSFR + .gouv.fr (FR) | 3 | 0 | 0 | 0 | 0 | 1 | Pérenne, obligatoire |
| 2D-Doc / CEV (FR, TN) | 3 | 2 | 0 | 0 | 0 | 2 | Pérenne, réexporté |
| GovCMS (AU) | 2 | 1 | 0 | 0 | 0 | 2 | Pérenne, cost-recovery |
| ELI (UE) | 1 | 3 | 2 | 0 | 0 | 3 | Norme adoptée |
| **EU Voice (UE)** | 2 | 1 | 0 | 2 | 3 | 2 | **Fermé mai 2024** |
| DigiLocker (IN) | 3 | 3 | 1 | 2 | 0 | 3 | 724 M utilisateurs |
| Registre DLT / TRAI (IN) | 3 | 0 | 0 | 2 | 0 | 2 | Obligatoire, efficace |
| gov.sg / Postman (SG) | 3 | 1 | 1 | 3 | 1 | 2 | Pérenne |
| Comptes officiels (CN) | 2 | 1 | 1 | 3 | 3 | 0 | Dominant, non souverain |
| Irembo (RW) | 2 | 1 | 1 | 2 | 3 | 2 | Pérenne, PPP 25 ans |
| Service 3-2-1 (Sahel) | 1 | 0 | 1 | 3 | 1 | 1 | Actif, sous-alimenté au BF |

*Légende, échelle de 0 à 3 : **3** fonction pleinement résolue — **2** résolue partiellement — **1** marginale — **0** absente*

**Lecture du tableau :** aucune ligne n'est pleine. **Aucun pays au monde n'a livré FN1 à FN6 dans un seul système.** Les dispositifs pérennes sont ceux qui ont fait deux ou trois fonctions très bien. Le seul du tableau qui ait tenté de couvrir large d'un coup, EU Voice, est aussi le seul qui soit fermé.
---

# 5. Enseignements transférables et anti-modèles

## 5.1. Les huit règles issues du benchmark

| # | Règle | Origine | Conséquence pour le projet |
|---|---|---|---|
| **RG1** | Une infrastructure d'information meurt faute de **propriétaire institutionnel**, pas faute de technique ou d'adoption. | EU Voice (fermé 2024) | Trancher le porteur avant la V1, pas après. |
| **RG2** | La preuve d'authenticité doit **voyager avec le document**, pas rester sur la plateforme. | 2D-Doc (FR, TN) | Sceller les publications dès le modèle de données. |
| **RG3** | Une plateforme qui rend service **à l'administration** s'adopte volontairement ; une plateforme qui lui demande de changer pour le citoyen exige un décret. | GOV.UK Notify (7 000 services), GovCMS (100 agences) | Concevoir infUb d'abord comme un service aux institutions. |
| **RG4** | L'adoption vient de l'**acceptabilité** du document, pas de l'attractivité de l'interface. | DigiLocker (724 M) | Chercher l'opposabilité progressive, pas les métriques d'engagement. |
| **RG5** | Le **maillage humain** d'accompagnement est un composant de l'infrastructure. | Irembo (4 000 agents) | Budgéter des relais humains, pas seulement des serveurs. |
| **RG6** | Une infrastructure nationale ne se sous-traite pas durablement : la capacité doit être **internalisée**. | Irembo (plafond à 40 services) | Prévoir le transfert de compétence dès le pilote. |
| **RG7** | L'identité officielle se protège par l'**interdiction** autant que par l'obligation. | DSFR (usage interdit hors État) | Le marquage infUb doit être juridiquement protégé. |
| **RG8** | Le **canal vocal court multilingue** est le seul canal numérique atteignant les publics ruraux et déplacés du Sahel. | 3-2-1 / Studios Hirondelle | La sortie IVR est une exigence, pas une option. |

## 5.2. Les quatre anti-modèles

**A1 — La plateforme sociale d'État.** EU Voice a échoué avec un budget européen, une équipe compétente et 40 comptes institutionnels de haut niveau. Le mode d'échec n'est pas l'adoption : c'est l'absence de propriétaire prêt à porter le coût récurrent. Toute fonction du projet qui relève de « faire un réseau social mieux fait » hérite de ce risque sans hériter d'aucun avantage.

**A2 — La plateforme de plus.** Le Burkina Faso compte déjà 59 plateformes ministérielles développées dont 32 en ligne. La 60ᵉ n'est pas la solution du problème créé par les 59 premières, quelle que soit sa qualité. Le projet ne peut se justifier qu'en étant **une couche que les autres consomment**, mesurable par le nombre de systèmes tiers qui en dépendent.

**A3 — La « pilotite ».** Le mode d'échec dominant identifié dans la littérature sur le financement des infrastructures publiques numériques : des pilotes qui fonctionnent, ne passent jamais à l'échelle, et meurent quand le financement de projet s'arrête. Le remède documenté n'est pas un meilleur pilote : c'est de rendre **le coût récurrent finançable avant** de lancer le pilote.

**A4 — L'angle mort de la maintenance.** « La maintenance est souvent un art perdu au sein des gouvernements, ce qui conduit à un cercle vicieux où de brillants outils numériques neufs sont créés pour ensuite tomber en désuétude. » Les rares chiffres publics disponibles donnent l'ordre de grandeur : Pix au Brésil, **4 M USD de construction pour 14 M USD de maintenance annuelle**. Le coût récurrent domine le coût initial, souvent d'un facteur 3 ou plus par an.

---

# 6. Diagnostic critique du projet

## 6.1. Ce qui est confirmé sans réserve

- Le diagnostic (fragmentation de l'accès), le positionnement (infrastructure, pas média), les sept règles fondamentales du point 11.2, la séparation avec CheckMe, le socle technique du point 12.1, le refus du feed d'engagement, et la doctrine documentaire en couches.

## 6.2. Trois hypothèses structurantes à corriger

### Correction n°1 — L'actif stratégique visé n'est pas le bon

> **Hypothèse actuelle (point 9.1)** : « Le réseau structuré des organisations et de leurs publications, avec leur identité, leurs autorisations, leur historique, leurs relations de pertinence, leurs abonnements et leurs canaux de distribution. »

Cet actif est **réplicable par décret**. Si l'État décide demain de créer sa propre plateforme, le réseau d'organisations bascule en un arrêté. Un réseau d'institutions publiques n'est pas un effet de réseau au sens de Thiel : les institutions ne choisissent pas librement, elles obéissent. Le test « actif indétrônable » n'est donc pas passé par la formulation actuelle.

**Trois actifs réellement défendables**, par ordre de solidité :

| Actif | Pourquoi il est défendable | Comment il s'accumule |
|---|---|---|
| **1. Le registre d'habilitation** (qui peut publier au nom de quoi, avec quelle preuve) | Adossé à des actes juridiques réels, il devient une **dépendance d'autres systèmes** (opérateurs, banques, employeurs, médias) qui l'interrogent pour vérifier | Chaque nouvelle habilitation enregistrée augmente le coût de reconstitution |
| **2. L'archive et l'identifiant canonique** | Les liens émis (SMS, WhatsApp, radio, presse, sites tiers) pointent vers lui. Le coût de rupture croît avec le stock de liens en circulation | Effet de cliquet : chaque publication ancienne rend la substitution plus coûteuse |
| **3. Les intégrations SI** | Coût de sortie technique et contractuel pour chaque système connecté | Croît avec le nombre de connecteurs en production |

**Ce qui n'est pas un actif :** l'audience citoyenne, le nombre d'abonnés, l'interface, le design system, le volume de commentaires. Tout cela est reproductible en six mois par un acteur mieux doté.

> **Reformulation proposée de l'actif stratégique :** *« Le registre national d'habilitation à publier et l'archive canonique des publications institutionnelles — c'est-à-dire la capacité, pour n'importe quel système ou n'importe quel citoyen, de vérifier qu'un acte donné émane bien de l'autorité qu'il prétend, et de le retrouver identique dix ans plus tard. »*

### Correction n°2 — L'ordre de conquête est inversé

Le document de référence traite l'espace citoyen et l'espace institutionnel comme deux univers symétriques (point 14). Ils ne le sont pas.

- Conquérir le citoyen, c'est affronter Facebook, WhatsApp et TikTok sur leur terrain, avec 22,4 % d'internautes et 14,3 % d'utilisateurs de réseaux sociaux comme marché total. C'est une bataille d'attention, coûteuse et perdue d'avance à court terme.
- Conquérir l'institution, c'est offrir un service qui lui économise du travail. C'est ce qu'a fait Notify : **7 000 services adoptés volontairement**.

**Le renversement stratégique proposé :** ne pas viser à *remplacer* Facebook comme lieu de lecture, mais à devenir **le fournisseur de preuve et de permalien que Facebook, WhatsApp, les radios et la presse utilisent**. L'objectif de la V1 n'est pas « le citoyen vient sur infUb » ; c'est « toute publication institutionnelle qui circule au Burkina Faso porte un identifiant infUb vérifiable ».

Le document fondateur esquisse déjà cette idée (« rediriger vers la source officielle », principe 6.7), mais le MVP du point 15.1 ne la suit pas : il construit un feed, des abonnements et des commentaires — c'est-à-dire une audience — avant d'avoir construit la preuve.

### Correction n°3 — Le MVP contient les mauvaises fonctions

Le MVP P0 (point 15.1) inclut le feed personnalisé, le suivi et **les commentaires et réponses arborescentes**. Ce sont, dans l'ordre :

- les fonctions les **plus coûteuses en gouvernance** (modération, en français et en langues nationales, sur des sujets institutionnels sensibles, avec une équipe réduite) ;
- les **moins différenciantes** (Facebook le fait mieux, gratuitement) ;
- celles qui portent le **risque politique maximal** — un espace de commentaires ouvert sous des publications d'État, dans un contexte de tensions et de contraintes sur la parole publique, expose le projet à devenir soit un espace censuré (ce qui détruit sa crédibilité), soit un espace incontrôlé (ce qui détruit son acceptabilité institutionnelle) ;
- celles qui **contredisent le principe 6.5** en pratique, même si elles le respectent en théorie : un fil de commentaires sous un communiqué devient visuellement le communiqué.

**Recommandation ferme : retirer les commentaires publics arborescents du MVP.** Les remplacer par deux mécanismes moins coûteux et plus utiles :

1. **La question institutionnelle** — un citoyen pose une question rattachée à une publication ; elle n'est pas publique tant que l'institution émettrice n'y a pas répondu ; la paire question/réponse publiée devient elle-même une publication institutionnelle secondaire, versionnée et recherchable. Cela transforme un coût de modération en **production d'information utile**, et respecte strictement la séparation information/expression.
2. **Le signal de compréhension** — « information claire / information incomplète / lien mort » : un retour non textuel, non modérable, exploitable comme métrique qualité par l'émetteur.

La discussion arborescente ouverte reste dans la trajectoire (niveau C/D), pas dans le socle.

## 6.3. Cinq angles morts à combler

| # | Angle mort | Pourquoi c'est bloquant |
|---|---|---|
| **AM1** | **La vérification hors plateforme** | Le cas d'usage réel dominant est « j'ai reçu un PDF sur WhatsApp ». Aucun dispositif prévu. C'est pourtant la fonction à plus forte valeur immédiate au Burkina Faso. |
| **AM2** | **Le statut juridique de la publication** | Si une publication infUb n'a aucune valeur, pourquoi une institution la ferait-elle ? Si elle en a une, quelle responsabilité en cas d'erreur ou de retard ? Les deux documents sont muets. Traité au point 7.8. |
| **AM3** | **La politique d'archivage et de format** | La promesse de persistance (point 6.4 du fondateur) n'a aucune contrepartie opérationnelle : pas de durée de conservation, pas de format pérenne, pas de plan de sortie, pas de dépôt légal. Une promesse d'archive sans politique d'archive est une promesse creuse. |
| **AM4** | **Le coût récurrent et son financeur** | Le document liste une « étude économique » (point 20) mais aucune décision. Or c'est ce coût, pas le coût de construction, qui tue les projets (règle A4). |
| **AM5** | **La vidéo comme piège économique** | Le point 11.1 fait de la vidéo un type de bloc natif. Héberger et servir de la vidéo est le poste qui explose le budget de toute petite infrastructure — et c'est aussi le format le moins consommable sur des connexions burkinabè coûteuses. Recommandation : **la vidéo est référencée, pas hébergée, jusqu'à démonstration contraire.** |

---

# 7. Solution cible proposée

## 7.1. Reformulation du positionnement

> **infUb est le registre national d'autorité et l'archive canonique de l'information institutionnelle burkinabè, et le service qui alimente en information vérifiable tous les canaux par lesquels les citoyens s'informent déjà.**

Trois différences avec la formulation actuelle :
- « registre et archive » plutôt que « plateforme de publication et de découverte » : cela nomme l'actif, pas l'interface ;
- « alimente les canaux existants » plutôt que « couche commune entre producteurs et citoyens » : cela assume que le citoyen n'est pas obligé de venir ;
- « vérifiable » entre dans la définition : c'est le mot que le dossier actuel n'emploie jamais et qui porte toute la valeur.

## 7.2. Architecture fonctionnelle cible : quatre blocs autonomes

Le principe directeur, tiré du benchmark : **chaque bloc doit avoir de la valeur seul et être utilisable sans les autres**. C'est ce qui permet de démarrer petit, d'être adopté progressivement, et de survivre à l'abandon partiel.

```text
┌──────────────────────────────────────────────────────────────┐
│  BLOC A — REGISTRE D'AUTORITÉ                                │
│  Organisations, habilitations, publicateurs, preuves         │
│  Utilisable seul par : opérateurs télécoms, banques,         │
│  employeurs, médias, autres plateformes                      │
└──────────────────────────────────────────────────────────────┘
                            ↓ fonde
┌──────────────────────────────────────────────────────────────┐
│  BLOC B — PUBLICATION CANONIQUE & PREUVE                     │
│  Identifiant pérenne, versions, validité, scellement,        │
│  archive, page publique légère, API de vérification          │
│  Utilisable seul par : toute institution qui veut un         │
│  permalien officiel à coller sur Facebook                    │
└──────────────────────────────────────────────────────────────┘
                            ↓ alimente
┌──────────────────────────────────────────────────────────────┐
│  BLOC C — DIFFUSION MULTICANALE                              │
│  Sortie SMS / IVR / e-mail / RSS-JSON / webhooks /           │
│  publication assistée vers réseaux sociaux / bulletin radio  │
│  Utilisable seul par : toute institution qui a déjà          │
│  ses contenus ailleurs                                       │
└──────────────────────────────────────────────────────────────┘
                            ↓ personnalise
┌──────────────────────────────────────────────────────────────┐
│  BLOC D — RELATION CITOYENNE                                 │
│  Recherche publique, suivi, boîte de réception,              │
│  question institutionnelle                                   │
│  Le seul bloc qui suppose une audience. Le dernier construit.│
└──────────────────────────────────────────────────────────────┘
```

Le document de référence construit essentiellement D en premier (feed, suivi, commentaires) avec un peu de B. **L'étude recommande l'ordre A → B → C → D.**

## 7.3. Bloc A — Le registre d'habilitation

### 7.3.1. Le principe fondateur

> **La plateforme n'accorde pas la confiance. Elle enregistre et rend vérifiable une délégation d'autorité décidée par l'organisation elle-même.**

Cette formulation est une protection juridique et politique majeure : infUb ne « certifie » personne, ne juge personne, n'exclut personne sur le fond. Elle constate, horodate, publie et rend vérifiable un acte que l'organisation a produit. C'est le rôle d'un greffe, pas d'un jury.

### 7.3.2. Les quatre niveaux d'habilitation

| Niveau | Nom | Preuve exigée | Ce que l'organisation peut faire | Ce que le citoyen voit |
|---|---|---|---|---|
| **N0** | Référencée | Aucune — inscription au registre | Rien. Existe comme entité citable. | Fiche d'organisation, mention explicite « non habilitée à publier » |
| **N1** | Vérifiée | Existence légale (IFU, RCCM, arrêté ou décret de création) + contrôle d'un canal officiel (domaine ou adresse institutionnelle) | Publier des informations générales | Marque « organisation vérifiée » + date et nature de la preuve |
| **N2** | Habilitée | N1 + **acte nominatif de désignation des publicateurs signé par l'autorité de l'organisation** + convention d'usage | Publier des actes engageants (avis, appels, calendriers, décisions) | Marque « publication habilitée » + identité de la fonction signataire (pas de la personne) |
| **N3** | Scellée | N2 + certificat cryptographique de l'organisation | Émettre des publications **scellées et vérifiables hors ligne** | Cachet vérifiable + page de vérification publique |

**Points de conception importants :**

- La **révocation** est aussi importante que l'octroi et doit être aussi rapide. Toute habilitation a une date de fin et une procédure de révocation d'urgence (< 1 h). Un compte institutionnel compromis qui publie un faux communiqué détruirait l'actif principal du projet en une journée.
- Le registre est **public et interrogeable par API** : c'est ce qui le rend consommable par des tiers (opérateurs, banques, médias) et donc défendable.
- Le registre publie son **historique** : qui était habilité à quelle date. Sans cela, on ne peut pas vérifier a posteriori une publication ancienne.
- **N3 est différé mais contraint le modèle de données dès la V1** : empreinte du document, horodatage, chaîne de preuve, identité de l'émetteur au moment de l'acte.

### 7.3.3. Extension à haute valeur : le registre des émetteurs de messages

Transposition directe du registre DLT indien et de la doctrine gov.sg : **le registre A doit aussi enregistrer les canaux officiels déclarés d'une organisation** — numéro court, en-tête SMS, page Facebook, canal WhatsApp, nom de domaine, compte TikTok.

Effet immédiat, sans aucune adoption citoyenne requise : n'importe qui — un journaliste, une radio, un citoyen, un agent — peut vérifier en une requête si le canal qui diffuse une information est bien un canal déclaré de l'institution. C'est la réponse la plus directe aux faux communiqués et faux avis de recherche documentés.

## 7.4. Bloc B — Publication canonique, preuve et archive

### 7.4.1. L'identifiant canonique

Le point 13.1 pose le principe sans le spécifier. Proposition, inspirée d'ELI :

```text
Forme longue (pérenne, sémantique, lisible) :
   /bf/{secteur}/{organisation}/{type-acte}/{année}/{numéro}

Exemple :
   /bf/education-superieure/ujkz/calendrier/2026/012

Forme courte (partageable, SMS, radio, oral) :
   infub.bf/p/7K3M9

Version :
   /bf/education-superieure/ujkz/calendrier/2026/012/v2
   (la forme sans version résout toujours vers la version en vigueur)
```

**Exigences non négociables :**
- L'identifiant ne change jamais, même en cas de changement de nom, de fusion ou de suppression de l'organisation.
- Une publication retirée renvoie un **statut**, jamais un 404 : « retirée le … », « remplacée par … », « expirée le … ». Le lien mort est l'ennemi principal de l'actif n°2.
- La forme courte doit être **dictable à la radio et saisissable au clavier d'un téléphone simple** : alphabet réduit sans caractères ambigus (pas de 0/O, 1/I/l).

### 7.4.2. Le modèle de validité — la fonction différenciante

Aucun réseau social ne peut répondre à « cette information est-elle encore valable ? ». C'est la fonction qui justifie à elle seule l'existence du projet aux yeux d'un citoyen.

Toute publication porte quatre dates distinctes, et non une :

| Date | Sens | Usage |
|---|---|---|
| `publiee_le` | Mise à disposition | Tri chronologique |
| `effet_le` | Entrée en vigueur | « À partir de quand cela s'applique-t-il ? » |
| `echeance_le` | Date limite d'action | **Alerte et priorisation** : c'est la date qui compte pour un candidat, un étudiant, un soumissionnaire |
| `fin_validite_le` | Fin d'effet | Bascule automatique en état « expirée » |

Et un état explicite, affiché avant le contenu : `EN VIGUEUR` / `À VENIR` / `ÉCHÉANCE PROCHE` / `EXPIRÉE` / `REMPLACÉE PAR …` / `RETIRÉE LE …`.

> Le cycle de vie du point 11.3 est confirmé, mais il décrit le workflow de production. Ce tableau décrit **l'état perçu par le citoyen**, qui est une projection différente et plus importante pour l'usage.

### 7.4.3. Le scellement et la vérification hors plateforme (comble AM1)

C'est la proposition centrale de cette étude. Trois dispositifs complémentaires, du plus simple au plus fort :

**V1 — La page de vérification publique.** Toute publication a une page publique ultra-légère qui affiche : l'émetteur, l'état de validité, la date, l'empreinte du document, et l'historique des versions. Coût : nul, c'est déjà dans le périmètre.

**V2 — Le code de vérification par SMS et par voix.** Un citoyen envoie le code court d'une publication au numéro court national, et reçoit en retour : émetteur, objet, état de validité, date. Le même service en IVR, en français et en langues nationales. **Ce dispositif fonctionne sur un téléphone à touches, sans internet, sans alphabétisation avancée.** C'est le canal de vérification qui couvre les 77 % de la population non connectée.

**V3 — Le cachet électronique visible (modèle 2D-Doc).** Tout document officiel émis via infUb porte un code 2D contenant ses données essentielles et la signature de l'émetteur. Vérification possible **hors ligne, à partir d'une photo, y compris sur un document imprimé**. C'est le dispositif qui suit le PDF dans son voyage sur WhatsApp.

> **C'est la fonctionnalité qui devrait être livrée en premier, avant le feed, avant les abonnements, avant les commentaires.** Elle répond à un besoin documenté et immédiat (faux communiqués, faux avis de recherche, fausses circulaires), elle ne demande aucun changement de comportement au citoyen, elle est impossible à répliquer pour un acteur privé, et elle crée un usage pour les institutions dès la première publication.

### 7.4.4. La politique d'archive (comble AM3)

Sans ces décisions, le principe 6.4 du document fondateur est déclaratif :

- **Format de dépôt** : PDF/A pour les documents ; conservation systématique du fichier d'origine tel que déposé ; extraction texte séparée pour la recherche et pour les canaux vocaux.
- **Durée** : conservation illimitée par défaut pour les publications de niveau N2/N3 ; les pièces jointes volumineuses (vidéo) suivent une politique distincte.
- **Intégrité** : empreinte SHA-256 de chaque fichier calculée au dépôt, publiée, et re-vérifiée périodiquement.
- **Réversibilité** : export complet du registre et de l'archive dans un format documenté et ouvert, exécutable à tout moment. C'est à la fois une garantie de souveraineté et l'argument qui rend une convention avec l'État signable.
- **Continuité** : une copie de l'archive doit exister hors du système de production, dans une institution distincte (Archives nationales, université, opérateur national), avec un protocole de reprise. Une archive à copie unique n'est pas une archive.

## 7.5. Bloc C — La diffusion multicanale et le dernier kilomètre

### 7.5.1. Le principe

> **infUb ne demande pas au citoyen de changer de canal. Il rend l'information disponible, structurée et vérifiable dans le canal que le citoyen utilise déjà.**

C'est l'application directe du principe 6.7 du document fondateur, mais poussée jusqu'à sa conséquence : la sortie multicanale n'est pas un module d'intégration périphérique, **c'est le produit**.

### 7.5.2. Les canaux, par ordre de couverture réelle

| Canal | Population atteinte | Rôle | Coût |
|---|---|---|---|
| **Radio communautaire** (via bulletin structuré prêt à lire, généré automatiquement) | La plus large du pays | Diffusion de masse, langues nationales | Quasi nul pour infUb ; le coût est chez le partenaire |
| **IVR / serveur vocal** (modèle 3-2-1, code court, langues nationales) | Ruraux, non alphabétisés, déplacés | Consultation et vérification | Modéré ; partenariat plutôt que construction |
| **SMS** (avec en-tête déclaré au registre) | ~toute la population disposant d'une SIM | Alerte à échéance, vérification | **Coût réel par message — poste à modéliser** |
| **WhatsApp / Facebook / TikTok** | 3,9 M utilisateurs | Découverte et relais, avec permalien et marquage | Faible |
| **Web / PWA** | ≤ 5,4 M internautes | Lecture complète, recherche, dépôt | Faible |
| **API / webhooks / flux** | Systèmes tiers, médias, agrégateurs | Réutilisation — **la mesure de succès du projet** | Faible |
| **RESINA / intranet administratif** | Agents publics, chefs-lieux de province | Diffusion interne à l'administration | Faible |

### 7.5.3. Décisions de conception imposées par ce tableau

- **Le poids de page est un NFR chiffré, pas une intention.** Cible : page de publication complète (hors pièces jointes) **< 100 Ko**, utilisable en 2G, lisible sans JavaScript. Le point 14.4 dit « connexion modeste » ; il faut un nombre.
- **Toute publication produit automatiquement quatre représentations** : le document complet, un résumé court (≤ 320 caractères, pour SMS et réseaux sociaux), un script vocal (pour IVR et radio), et un enregistrement structuré (pour API et agrégateurs). La production de ces représentations est un service rendu à l'institution — c'est ce qui rend infUb adopté (règle R3).
- **Le multilinguisme est une propriété de la diffusion, pas de la rédaction.** Exiger des institutions qu'elles rédigent en mooré, dioula et fulfuldé bloquerait l'adoption. Le modèle réaliste : rédaction en français, traduction du résumé court et du script vocal, d'abord humaine via les partenaires radio, éventuellement assistée ensuite. Le champ de langue existe dès la V1 même si une seule langue est remplie.
- **La vidéo est référencée, pas hébergée** jusqu'à démonstration d'un besoin et d'un financement (comble AM5).

## 7.6. Bloc D — La relation citoyenne, repensée

### 7.6.1. Remplacer le feed par une boîte de réception

Le mot « feed » porte tout le modèle qu'on veut éviter. Proposition : **la boîte de réception institutionnelle**, ordonnée par des critères déclarés et vérifiables, jamais par l'engagement :

```text
Ordre de tri (déterministe, explicable, affiché à l'utilisateur) :
  1. Alertes de l'émetteur (rares, contingentées, journalisées)
  2. Échéance proche concernant un périmètre suivi
  3. Nouveauté dans un périmètre suivi
  4. Nouveauté dans un périmètre géographique déclaré
  5. Publications générales récentes
```

Deux propriétés que ne peut pas offrir un réseau social, et qui sont la vraie proposition de valeur : **l'ordre est explicable** (l'utilisateur peut savoir pourquoi il voit un élément) et **rien n'est masqué** (l'absence d'algorithme de sélection signifie que tout ce qui concerne le périmètre déclaré est présent).

### 7.6.2. Le contingentement des alertes

Une infrastructure de notification institutionnelle meurt de deux façons : personne ne l'utilise, ou tout le monde marque tout comme urgent. Il faut un **quota d'alertes par organisation et par période**, avec journal public de l'usage. C'est un mécanisme de gouvernance, pas une fonctionnalité.

### 7.6.3. Le périmètre déclaré plutôt que le profil déduit

Le point 19.2 demande « quelle granularité de pertinence est utile sans devenir intrusive ». Réponse proposée : **aucune déduction comportementale**. L'utilisateur déclare son périmètre (établissement, filière, commune de résidence, commune d'origine, statut) ; le système n'infère rien de sa navigation. C'est plus simple à construire, conforme au cadre de protection des données, et cohérent avec le refus du modèle d'engagement. Cas particulier à prévoir explicitement : **les personnes déplacées peuvent déclarer plusieurs territoires simultanément.**
## 7.7. Architecture technique : confirmations, corrections, ajouts

### 7.7.1. Confirmé

| Choix | Verdict | Motif |
|---|---|---|
| Monolithe modulaire + hexagonal | **Confirmé** | Proportionné à une équipe réduite et à une exploitation contrainte. Aucun élément du benchmark ne justifie le distribué. |
| Go | **Confirmé** | Binaire unique, empreinte mémoire faible, déploiement simple — décisif si le déploiement cible est un datacenter national avec des ressources comptées. |
| PostgreSQL source de vérité | **Confirmé** | |
| Outbox transactionnel | **Confirmé** | Indispensable au principe « une panne de distribution n'annule pas une publication » (point 11.2). |
| Stockage objet S3-compatible | **Confirmé** | |
| PWA responsive comme premier canal | **Confirmé**, avec NFR de poids | |
| OCI / Podman | **Confirmé** | Portabilité vers le datacenter souverain. |

### 7.7.2. Corrections proposées

| Point | Décision du dossier | Correction | Motif |
|---|---|---|---|
| **Keycloak** | Socle de référence | Garder **OIDC comme contrat**, différer Keycloak. Démarrer avec une implémentation légère ou un fournisseur OIDC minimal. | Keycloak impose une JVM, de la mémoire et une charge d'exploitation permanente pour un bénéfice nul tant qu'il n'y a pas de fédération d'identité réelle. Le contrat OIDC préserve la substitution ultérieure sans coût. |
| **Recherche PostgreSQL** | « Moteur dédié seulement si besoin démontré » | **Confirmé**, avec critère de sortie chiffré : `tsvector` + `unaccent` + `pg_trgm` jusqu'à ce que le P95 de la recherche dépasse 400 ms ou que le corpus dépasse ~500 000 publications. | Le point 19.2 demande « à partir de quelles métriques ». Voici le seuil. |
| **Vidéo native** | Bloc de contenu de premier niveau | **Référencée, pas hébergée**, en V1 et V2. | Poste de coût qui tue les petites infrastructures ; format le moins consommable sur données payantes. |
| **Commentaires arborescents** | P0 du MVP | **Hors MVP**, remplacés par la question institutionnelle et le signal de compréhension. | point 6.2, correction n°3. |
| **Feed personnalisé** | P0 du MVP | **Boîte de réception à tri déterministe**, périmètre déclaré uniquement. | point 7.6. |

### 7.7.3. Ajouts obligatoires

| Ajout | Pourquoi il ne peut pas être différé |
|---|---|
| **Modèle de preuve dès la V1** (empreinte, horodatage, identité de l'émetteur au moment de l'acte, chaîne d'habilitation applicable à cette date) | Le scellement N3 peut être différé, mais il **contraint le schéma de données**. Le rétro-ajouter obligerait à recalculer l'histoire, ce qui est impossible pour une archive à valeur probante. |
| **Résolveur d'identifiants séparé du site** | Le permalien doit survivre à un changement complet d'application. C'est la condition matérielle de l'actif n°2. |
| **Journal d'audit inaltérable** (append-only, empreinte chaînée, exportable) | Sans lui, aucune réponse crédible à « qui a publié ce faux communiqué ? ». C'est l'exigence de sécurité n°1 du projet, avant le chiffrement et avant l'IAM. |
| **Double validation et 2FA obligatoires pour N2/N3** | Un compte institutionnel compromis publiant un faux acte est le seul scénario capable de détruire l'actif en une journée. |
| **Génération automatique des quatre représentations** (document, résumé court, script vocal, enregistrement structuré) | C'est le service rendu à l'institution, donc le moteur d'adoption. |
| **Export complet documenté** | Condition de réversibilité, exigence de souveraineté, et argument de négociation avec l'État. |

## 7.8. Gouvernance et statut juridique (comble AM2, répond à la règle RG1)

### 7.8.1. Le montage recommandé

Le benchmark donne un patron réutilisable : **Riigi Teataja est publié par un ministère et opéré techniquement par un centre distinct (RIK)**. C'est la séparation à reproduire.

| Rôle | Titulaire cible | Fonction |
|---|---|---|
| **Autorité de publication** | Une institution d'ancrage. Candidat naturel : le **SGG-CM**, qui porte déjà JOBF et LégiBurkina et dont le métier *est* l'acte de publication officielle. Alternative : le ministère chargé de la transition digitale / l'ANPTIC. | Donne la légitimité de l'acte, arrête la doctrine d'habilitation |
| **Opérateur technique** | La structure porteuse du projet, sous convention | Construit, exploite, maintient, fait évoluer |
| **Autorité de contrôle** | ANSSI-BF (homologation sécurité) + CIL (données personnelles) | Homologuent, contrôlent |
| **Tiers d'archive** | Archives nationales ou institution universitaire | Détient la copie de continuité |

### 7.8.2. Les trois clauses non négociables

Elles protègent simultanément le projet et l'intérêt public — c'est ce qui les rend signables.

1. **Réversibilité.** Export complet du registre et de l'archive, dans un format documenté, exécutable à tout moment par l'autorité de publication. Sans cette clause, aucune institution sérieuse ne confiera son information à un tiers ; avec elle, la conversation devient possible.
2. **Ouverture du code du noyau.** Le registre, le résolveur et le format de publication sous licence ouverte. Motif stratégique, pas idéologique : cela déplace la valeur de la propriété du code vers l'exploitation et la donnée, ce qui rend la capture hostile sans intérêt et l'adoption institutionnelle sans risque. C'est le mécanisme qui a permis à Notify d'être réimplanté quatre fois.
3. **Neutralité de traitement.** Règles d'habilitation publiques, identiques pour toutes les organisations d'un même niveau, décisions motivées et contestables. C'est la seule protection contre la lecture du projet comme organe de communication (point 2.4, conséquence n°5).

### 7.8.3. Le statut juridique de la publication — la décision à prendre

C'est l'arbitrage le plus important du dossier, et il n'a jamais été posé :

| Option | Contenu | Conséquence |
|---|---|---|
| **(a) Informative** | La publication infUb est une **copie fidèle référencée** d'un acte dont l'original reste ailleurs. Aucune valeur juridique propre. | Démarrage immédiat, sans texte réglementaire. Responsabilité limitée. Valeur perçue plus faible. |
| **(b) Opposable** | La publication infUb **est** l'acte, ou vaut publication officielle. | Valeur maximale, mais exige un texte réglementaire, une homologation, une assurance de continuité de service, et engage la responsabilité de l'État sur les pannes. |

> **Recommandation ferme : commencer en (a), concevoir pour (b).** Le statut informatif permet de démarrer sans attendre un décret — condition de survie d'un projet porté par une petite équipe. Mais toutes les exigences de (b) — scellement, audit inaltérable, archive répliquée, disponibilité mesurée, réversibilité — doivent être satisfaites dès la V1, de sorte que le passage en (b) soit une **décision politique et non un chantier technique**. C'est exactement la trajectoire du Riigi Teataja : huit ans en parallèle du papier avant de devenir la version officielle.

### 7.8.4. Le régime de responsabilité

À écrire noir sur blanc dans la convention, et à afficher publiquement :
- L'organisation émettrice est **seule responsable du contenu** qu'elle publie.
- L'opérateur est responsable de la **disponibilité, de l'intégrité et de la traçabilité**, pas de l'exactitude.
- Une rectification ne supprime jamais l'historique ; elle ajoute une version et un motif.
- Le retrait d'une publication laisse une **trace publique** (date, autorité du retrait), jamais un vide.

## 7.9. Modèle économique et soutenabilité (comble AM4)

### 7.9.1. Ce que le benchmark interdit

- **La publicité** : détruit le positionnement, réintroduit la logique d'engagement, disqualifie le projet auprès des institutions. Exclue.
- **Le paywall citoyen** : contredit la mission et le principe 6.3. Exclu.
- **La commission par transaction (modèle Irembo)** : non transposable — l'information institutionnelle est gratuite, il n'y a rien à commissionner. Le modèle Irembo fonctionne parce qu'il porte des démarches payantes.
- **Le financement bailleur exclusif** : c'est le mécanisme d'échec A3/A4 (« pilotite » + coût récurrent orphelin). Utilisable pour la construction, jamais pour l'exploitation.

### 7.9.2. Le modèle recommandé : socle mutualisé + services facturés

Trois sources, dans cet ordre de priorité :

| Source | Modèle | Inspiration | Robustesse |
|---|---|---|---|
| **1. Abonnement institutionnel mutualisé** | Chaque organisation habilitée contribue à un niveau modeste et différencié selon sa taille — cost-recovery, pas profit. Ce que paie une grande administration finance l'accès d'un lycée rural. | **GovCMS** (100+ agences, cost-recovery) | Élevée si adossée à une ligne budgétaire ; faible si dépendante d'arbitrages annuels |
| **2. Diffusion facturée à l'émetteur** | Le SMS et l'IVR ont un coût réel par message. L'émetteur paie sa diffusion sortante ; la consultation et la vérification restent gratuites pour le citoyen. | **GOV.UK Notify**, Postman.gov.sg | Élevée : proportionnelle à l'usage, donc auto-régulée (et cela contingente naturellement les alertes) |
| **3. Vérification pour tiers professionnels** | Les banques, employeurs, écoles et assureurs paient déjà pour lutter contre la fraude documentaire. Une API de vérification d'actes officiels a une valeur marchande immédiate. | **2D-Doc / Certigna** (FR), **DigiLocker** (IN) | Élevée : marché existant, valeur mesurable, sans conflit avec la mission |

**Principe de tarification structurant :** *tout ce qui est consultation, recherche et vérification par un citoyen est gratuit et le restera. Tout ce qui est diffusion sortante, intégration et vérification automatisée pour un tiers professionnel est facturé.* Cette ligne est simple, défendable publiquement, et cohérente avec la mission.

### 7.9.3. La structure de coût à modéliser

Le benchmark impose de raisonner en **coût récurrent d'abord** (Pix : 4 M USD de construction, 14 M USD/an de maintenance).

| Poste | Nature | Commentaire |
|---|---|---|
| Équipe (5 à 7 personnes) | **Récurrent, dominant** | C'est le poste principal, très loin devant l'infrastructure. Toute modélisation qui ne le place pas en tête est fausse. |
| Hébergement et stockage | Récurrent, modéré | Réduit si déploiement au datacenter national ; à négocier tôt |
| **SMS / IVR** | Récurrent, **variable et non maîtrisé** | Le seul poste qui peut exploser avec le succès. D'où la facturation à l'émetteur (source 2). |
| Bande passante vidéo | Récurrent, explosif | Neutralisé par la décision « vidéo référencée » |
| Accompagnement / relais humains | Récurrent | Composant d'infrastructure (règle RG5), pas dépense annexe |
| Sécurité, homologation, audit | Récurrent | Obligatoire (ANSSI-BF) |

> **Règle de décision proposée : ne pas lancer le pilote tant que 24 mois de coût récurrent ne sont pas couverts.** C'est le remède documenté à la « pilotite ». Un pilote réussi qui meurt au mois 14 détruit plus de crédibilité qu'il n'en crée, et brûle le capital de confiance institutionnelle qui est précisément l'actif du projet.

---

# 8. Trajectoire en quatre horizons

Chaque horizon a une **condition de passage vérifiable**. Le passage ne se fait pas au calendrier mais au critère.

## H0 — « Le registre et le permalien » (0 à 4 mois)

**Livré :** Bloc A (registre d'organisations, habilitations, canaux officiels déclarés) + Bloc B minimal (identifiant canonique, résolveur, page publique légère, dépôt de document avec empreinte, page de vérification, code court, historique de versions).

**Non livré :** aucun compte citoyen, aucun abonnement, aucun feed, aucun commentaire, aucune vidéo.

**Utilisateur cible :** l'institution et le relais (journaliste, radio, agent, association) — pas le citoyen final.

| Critère de passage | Seuil |
|---|---|
| Organisations habilitées N1 ou N2 | ≥ 10 |
| Publications canoniques déposées | ≥ 200 |
| Permaliens infUb effectivement repris sur des canaux tiers | ≥ 50 |
| Requêtes de vérification (page ou API) | ≥ 500 / mois |
| Délai médian entre décision institutionnelle et publication | ≤ 48 h |

## H1 — « Le pilote sectoriel » (4 à 12 mois)

**Secteur pilote recommandé : l'enseignement supérieur.**

Motifs — c'est le seul secteur qui coche tous les critères :
- population jeune, la plus connectée du pays, donc mesurable ;
- information à **date critique** (inscriptions, réinscriptions, calendriers, bourses, résultats, orientations) : l'échéance a un coût réel pour l'usager, donc la valeur est immédiatement démontrable ;
- douleur documentée : l'information circule aujourd'hui sur des pages Facebook, se perd, et devient introuvable un mois plus tard ;
- l'autorité est **déléguable sans texte nouveau** : un président d'université peut habiliter des publicateurs par décision interne ;
- structure hiérarchique naturelle (université → UFR → département → filière) qui exerce exactement le modèle de périmètre déclaré ;
- articulation naturelle avec **CheckMe** sur les résultats — la démonstration de la complémentarité posée au point 11 du document fondateur.

**Livré :** Bloc C (SMS, e-mail, flux, publication assistée vers réseaux sociaux, bulletin radio, résumé et script vocal générés) + Bloc D minimal (recherche publique, suivi de périmètre, boîte de réception).

| Critère de passage | Seuil |
|---|---|
| Établissements publiant régulièrement | ≥ 5 |
| Citoyens avec périmètre déclaré | ≥ 5 000 |
| Part des publications de l'établissement passant par infUb | ≥ 60 % |
| Publications retrouvées après 6 mois par un utilisateur non abonné (test) | ≥ 80 % de succès |
| Réduction mesurée du délai d'accès à une information d'échéance | mesurée, quel que soit le résultat |
| Financement du coût récurrent | **24 mois couverts** |

## H2 — « La preuve et l'extension » (12 à 30 mois)

**Livré :** scellement N3 et cachet visible ; vérification par SMS et IVR en langues nationales ; API d'ingestion pour les SI institutionnels (push / pull / reference du point 13.2) ; archive répliquée chez un tiers ; extension à 2 ou 3 secteurs supplémentaires (concours et recrutements publics, collectivités territoriales, santé publique).

| Critère de passage | Seuil |
|---|---|
| Systèmes tiers consommant l'API | ≥ 5 |
| Vérifications de documents / mois | ≥ 10 000 |
| Publications scellées | ≥ 30 % du flux N2 |
| Copie d'archive vérifiée chez un tiers | oui |
| Homologation sécurité | obtenue |

## H3 — « L'institutionnalisation » (30 mois +)

**Livré :** statut juridique consolidé, éventuel passage de la publication en régime opposable, déploiement au datacenter souverain, interopérabilité nationale, ouverture des niveaux B et C de la trajectoire du point 17, et — seulement à ce stade — examen de l'ouverture des discussions publiques.

> **Recommandation sur le point 17 :** retirer le « NIVEAU D — couches sociales » de la trajectoire publiée. Il n'apporte rien à la démonstration, il fragilise la proposition de valeur « ce n'est pas un réseau social » auprès des institutions, et il attire une méfiance politique disproportionnée par rapport à un bénéfice hypothétique et lointain. Le garder dans les réflexions internes, pas dans le document de référence.

---

# 9. Registre des risques

| # | Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|---|
| **R1** | **Absence de propriétaire institutionnel** — le projet reste orphelin et s'éteint | Élevée | Fatal | Convention d'ancrage signée avant H1 ; clauses de réversibilité et code ouvert pour rendre la signature possible ; ne pas dépendre d'un décret pour démarrer |
| **R2** | **Compromission d'un compte institutionnel** publiant un faux acte | Moyenne | Fatal pour l'actif | 2FA + double validation N2/N3 ; audit inaltérable ; révocation < 1 h ; historique public des rectifications ; procédure de crise écrite et testée |
| **R3** | **Perception d'organe de communication d'État** | Élevée | Grave | Neutralité de traitement écrite et publique ; aucune fonction éditoriale propre ; ouverture aux organisations non étatiques dès N1 ; refus des commentaires modérés en V1 (évite le procès en censure) ; publication des règles et des décisions d'habilitation |
| **R4** | **Désertion institutionnelle** — les organisations ne publient pas | Élevée | Fatal | Coût marginal de publication ≈ 0 (ingestion par e-mail + PDF) ; service rendu immédiat (résumé, script vocal, relais automatique) ; pilote sectoriel où la douleur est vive |
| **R5** | **Coût récurrent orphelin** après la construction | Élevée | Fatal | Règle des 24 mois couverts ; trois sources de revenus dont deux proportionnelles à l'usage ; refus du financement bailleur pour l'exploitation |
| **R6** | **Capture ou éviction** — l'État reproduit le système et écarte le porteur | Moyenne | Grave | Valeur dans l'exploitation et la donnée, pas dans le code ; internalisation progressive de la capacité (règle R6) ; position d'opérateur conventionné plutôt que de propriétaire |
| **R7** | **Explosion du coût de diffusion** avec le succès | Moyenne | Grave | Facturation de la diffusion sortante à l'émetteur ; contingentement des alertes ; vidéo référencée |
| **R8** | **Doublon avec JOBF / LégiBurkina** — perçu comme redondant | Moyenne | Grave | Périmètre explicitement disjoint : le juridique appartient au JOBF, infUb traite l'**information opérationnelle datée** (avis, appels, calendriers, échéances) et **se lie** au JOBF plutôt que de le republier |
| **R9** | **Dérive vers le réseau social** sous pression d'usage | Moyenne | Grave | Retirer le niveau D de la trajectoire publiée ; inscrire les contraintes du point 12 du fondateur comme invariants d'architecture, pas comme intentions |
| **R10** | **Dépendance à un canal tiers** pour la distribution (Facebook, WhatsApp) | Élevée | Modéré | Assumée et bornée : ces canaux sont des relais, jamais l'autorité ; le permalien et la vérification restent chez infUb |
| **R11** | **Inaccessibilité aux publics prioritaires** (ruraux, non alphabétisés, déplacés) | Élevée si non traitée | Grave (échec de mission) | IVR et radio en H1/H2, pas en H3 ; NFR de poids de page ; périmètre multi-territoires pour les déplacés |
| **R12** | **Instabilité institutionnelle** — changement de gouvernement, de ministère de tutelle, de doctrine | Élevée | Modéré à grave | Ancrage sur une administration permanente (SGG-CM) plutôt que sur un cabinet ; valeur d'usage démontrée et documentée ; réversibilité |

---

# 10. Réponses argumentées aux questions ouvertes (point 19.2)

| Question ouverte | Réponse proposée | Fondement |
|---|---|---|
| **Q1. Quel statut juridique et quelle gouvernance ?** | Séparation autorité de publication (SGG-CM en candidat naturel) / opérateur technique (structure porteuse), sous convention à trois clauses non négociables : réversibilité, code du noyau ouvert, neutralité de traitement. **Trancher avant H1.** | Riigi Teataja (EE) ; échec d'EU Voice |
| **Q2. Quel mécanisme de certification des institutions ?** | Quatre niveaux N0–N3. Principe : la plateforme **n'accorde pas** la confiance, elle enregistre et rend vérifiable une délégation décidée par l'organisation. Habilitation nominative par acte de l'autorité, datée, révocable en < 1 h, historisée. | DSFR + .gouv.fr ; registre DLT/TRAI |
| **Q3. Quel niveau de vérification par type d'organisation ?** | Preuve d'existence légale (IFU, RCCM, arrêté) + contrôle d'un canal officiel pour N1 ; acte de désignation signé pour N2 ; certificat cryptographique pour N3. Le niveau n'est pas fonction du prestige de l'organisation mais du **type d'acte** qu'elle veut publier. | gov.sg ; 2D-Doc |
| **Q4. Quelle politique de modération des discussions ?** | **Ne pas ouvrir de discussion publique en V1.** Question institutionnelle (non publique tant que non répondue) + signal de compréhension non textuel. La discussion arborescente est reportée à H3 sous condition. | Coût de modération ; risque politique ; point 6.5 du fondateur |
| **Q5. Quelle politique de conservation et d'archivage ?** | PDF/A + fichier d'origine + extraction texte ; empreinte SHA-256 publiée ; conservation illimitée par défaut pour N2/N3 ; copie chez un tiers institutionnel ; export complet documenté. Pas de 404 : toute ressource retirée renvoie un statut. | Riigi Teataja ; ELI |
| **Q6. Quelle granularité de pertinence ?** | **Périmètre déclaré par l'utilisateur, aucune inférence comportementale.** Trois axes : émetteur, type d'acte, public concerné (territoire / établissement / statut). Multi-territoires autorisé (déplacés). | Cadre de protection des données ; refus du modèle d'engagement |
| **Q7. Quels mécanismes de distribution sont réellement utilisés ?** | Par ordre de couverture réelle : radio communautaire, IVR/vocal court, SMS, WhatsApp/Facebook, web, API. La question doit être **mesurée** en H1 par canal, mais l'ordre de priorité est déjà imposé par les 22,4 % d'internautes. | Service 3-2-1 (75 k appels/mois au BF, 7,78 M au Mali) |
| **Q8. Quelle architecture de souveraineté et de continuité ?** | Conçue pour être déployable au datacenter national (OCI/Podman, sans dépendance à un service managé propriétaire), mais **non dépendante de lui au démarrage**. Copie d'archive chez un tiers distinct. Export complet à tout moment. | Datacenters BF 2026 ; doctrine « zéro donnée à l'extérieur » |
| **Q9. Quels mécanismes de signature et de preuve ?** | Modèle de preuve dans le schéma **dès la V1** (empreinte, horodatage, identité de l'émetteur et chaîne d'habilitation à la date de l'acte). Scellement cryptographique et cachet visible en H2. Vérification par SMS/IVR pour les non-connectés. | 2D-Doc (FR), CEV TUNTRUST (TN) |
| **Q10. À partir de quelles métriques une recherche dédiée ?** | Seuil : P95 de la recherche > 400 ms **ou** corpus > ~500 000 publications **ou** besoin multilingue/phonétique avéré. Avant cela, PostgreSQL `tsvector` + `unaccent` + `pg_trgm`. | Principe de coût d'exploitation |
| **Q11. Quand ouvrir aux auteurs et producteurs éditoriaux ?** | Après H2 seulement, et **jamais avec le même statut visuel** que les publications institutionnelles. L'ouverture du niveau C est possible ; le niveau D est à retirer de la trajectoire publiée. | Risque de dérive ; point 12 du fondateur |

---

# 11. Études résiduelles

Ce que cette étude **ne peut pas** trancher et qui exige du terrain ou du droit :

| Étude | Question précise restante | Méthode |
|---|---|---|
| **Terrain — universités** | Combien de publications par établissement et par mois ? Quels formats ? Qui les produit aujourd'hui ? Quel est le délai réel décision → diffusion ? | Observation directe dans 2 à 3 établissements, sur 4 semaines, avec relevé du flux Facebook existant |
| **Terrain — citoyens** | Comment un étudiant, un candidat à un concours ou un parent cherche-t-il réellement une information officielle aujourd'hui ? Où échoue-t-il ? | 20 à 30 entretiens contextuels + tests de retrouvabilité sur cas réels |
| **Juridique** | Quel texte permettrait le passage en régime opposable ? Quelles obligations la loi de 2004 sur les données personnelles impose-t-elle à un registre d'habilitation nominatif ? Quel est le régime applicable à un archivage à valeur probante ? | Avis juridique + consultation CIL |
| **Institutionnelle** | Le SGG-CM est-il preneur ? Sinon, qui ? Quelle est la forme conventionnelle disponible en droit burkinabè (convention de partenariat, délégation de service public, GIP) ? | Sondage institutionnel préalable — **à faire avant tout développement de H1** |
| **Économique** | Quel montant d'abonnement institutionnel est réellement payable par un lycée, une commune, une université ? Quel volume de vérifications professionnelles (banques, employeurs) est mobilisable ? | Entretiens tarifaires + modélisation à trois scénarios |
| **Distribution** | Les opérateurs (Orange, Moov, Telecel) accepteraient-ils un code court national et des tarifs sociaux ? Viamo et les studios sont-ils partenaires possibles pour l'IVR ? | Négociation exploratoire, avec l'ARCEP en tiers |
| **Sécurité** | Modèle de menace complet, avec le scénario « compte institutionnel compromis » en scénario n°1. Exigences d'homologation ANSSI-BF. | Analyse de risque formelle + échange amont ANSSI-BF |
| **Langues** | Quel volume de traduction est soutenable ? Quelle qualité en mooré, dioula, fulfuldé pour un script vocal ? | Test avec un partenaire radio sur 20 publications réelles |

---

# 12. Ce qu'il faut retenir

1. **Le problème est bien posé, mais l'actif visé est mal nommé.** L'actif défendable n'est pas le réseau d'organisations — copiable par décret — mais **le registre d'habilitation et l'archive canonique vérifiable**.
2. **La fonction à livrer en premier n'est pas la publication : c'est la vérification.** « Ce document est-il authentique et encore valable ? » est la question à laquelle aucun réseau social ne peut répondre, à laquelle le contexte burkinabè donne une urgence documentée, et qui ne demande aucun changement de comportement au citoyen.
3. **L'ordre de conquête doit être inversé.** Servir l'institution d'abord, comme Notify a servi 7 000 services britanniques. L'audience citoyenne vient après, ou vient d'elle-même par les canaux existants.
4. **Trois fonctions doivent sortir du MVP** : les commentaires arborescents, le feed personnalisé et la vidéo hébergée. Elles coûtent cher, ne différencient pas, et portent le risque politique et budgétaire maximal.
5. **La distribution hors-web est une exigence du socle, pas une extension.** Avec 22,4 % d'internautes, une infrastructure « nationale » qui n'existe que sur le web n'est pas nationale.
6. **La question du porteur doit être tranchée avant le pilote.** EU Voice avait un budget européen, une équipe compétente et 40 comptes institutionnels : il est mort faute de propriétaire. C'est le mode d'échec le plus probable ici aussi.
7. **Le coût récurrent domine tout.** Ne pas lancer le pilote sans 24 mois d'exploitation couverts.

---

# 13. Sources

**Contexte Burkina Faso**
- [Burkina Faso Digital Report — Le Kiosque Digital du Burkina](https://lekiosquedigitalduburkina.com/2026/02/01/burkina-faso-digital-report-2026/) — population, internautes, SIM, réseaux sociaux, urbanisation
- [Transformation digitale et ODD Burkina Faso — analyse de la performance pays (Goodwill Afrika, 2025)](https://goodwillafrika.org/wp-content/uploads/2025/11/B9-Performance-et-recommandations-Egouv_ODD-BF-v3_1.pdf) — EGDI, OSI, HCI, TII, RESINA, plateformes ministérielles, contexte sécuritaire
- [Souveraineté numérique : le Premier ministre inaugure deux datacenters — Primature du Burkina Faso](https://primature.gov.bf/souverainete-numerique-le-premier-ministre-inaugure-deux-datacenters/) — capacités, doctrine « zéro donnée à l'extérieur »
- [LégiBurkina et le Journal Officiel du Burkina Faso lancent deux plateformes digitales — Digital Magazine BF](https://digitalmagazine.bf/2024/11/22/legiburkina-et-le-journal-officiel-du-burkina-faso-lancent-deux-plateformes-digitales-innovantes-pour-la-diffusion-de-linformation-juridique/)
- [Le Parlement burkinabé adopte la loi sur la cybersécurité — Agence Ecofin](https://www.agenceecofin.com/securite/1007-120192-le-parlement-burkinabe-adopte-la-loi-sur-la-cybersecurite)
- [ANSSI Burkina Faso](https://www.anssi.bf/) · [ARCEP Burkina Faso — Observatoire](https://www.arcep.bf/observatoire/) · [Commission de l'Informatique et des Libertés](https://www.presidencedufaso.bf/commission-de-linformatique-de-des-libertes-cil/)
- [Burkina : repassage à froid sur les fake ayant ciblé des institutions républicaines — Fasocheck](https://fasocheck.org/fact-checking/burkina-repassage-a-froid-sur-les-fake-ayant-cible-des-institutions-republicaines/) · [Le Burkina menace de poursuites après une fausse circulaire — La Nouvelle Tribune](https://lanouvelletribune.info/2026/07/le-burkina-menace-de-poursuites-apres-une-fausse-circulaire-sur-les-expatries/) · [Burkina/Cybercriminalité : de faux avis de recherche — Wakat Séra](https://www.wakatsera.com/burkina-cybercriminalite-de-faux-avis-de-recherche/)
- [Burkina Faso — RSF](https://rsf.org/en/country/burkina-faso)
- [Radio + Mobile : combinaison gagnante pour informer les populations au Sahel — Fondation Hirondelle](https://hirondelle.org/fr/notre-actualite/1123-sahel-des-millions-d-appels-chaque-mois-pour-ecouter-nos-programmes-par-telephone-mobile-avec-viamo) · [Service 3-2-1 — Odess](https://www.odess.io/en/initiative/service-3-2-1/)

**Modèles occidentaux**
- [State Gazette (Riigi Teataja) — RIK, Estonie](https://www.rik.ee/en/other-services/state-gazette) · [Riigi Teataja — Wikipedia](https://en.wikipedia.org/wiki/Riigi_Teataja)
- [The international reach of UK's Notify service — Public Digital](https://public.digital/pd-insights/blog/2023/03/the-international-reach-of-uks-notify-service) · [GOV.UK Notify is sending messages for more than 1 500 services — GDS](https://gds.blog.gov.uk/2019/12/20/gov-uk-notify-is-sending-messages-for-more-than-1500-services-across-the-public-sector/)
- [Périmètre d'application — Système de Design de l'État (DSFR)](https://www.systeme-de-design.gouv.fr/version-courante/fr/premiers-pas/perimetre-d-application)
- [2D-DOC — France Titres (ANTS)](https://ants.gouv.fr/nos-missions/les-solutions-numeriques/2d-doc) · [Cachet électronique visible TN CEV 2D-DOC — TUNTRUST](https://www.tuntrust.tn/fr/nos-produits/cachet-electronique-visible-tn-cev-2d-doc) · [Visible Digital Seal](https://vdsic.org/visible-digital-seal/)
- [Why GovCMS — Gouvernement australien](https://www.govcms.gov.au/why-govcms)
- [EDPS decentralised social media pilot: the end of a successful story](https://www.edps.europa.eu/press-publications/press-news/press-releases/2024/edps-decentralised-social-media-pilot-end-successful-story) · [EDPS launches pilot phase of two social media platforms (2022)](https://www.edps.europa.eu/press-publications/press-news/press-releases/2022/edps-launches-pilot-phase-two-social-media_en)
- [European Legislation Identifier — EUR-Lex](https://eur-lex.europa.eu/eli-register/what_is_eli.html)

**Modèles asiatiques**
- [DigiLocker — portail officiel](https://www.digilocker.gov.in/) · [India expands digital government through UMANG and DigiLocker — Biometric Update](https://www.biometricupdate.com/202608/india-expands-digital-government-through-umang-and-digilocker-access-layers)
- [Detailed guide on DLT registration for SMS in India — Plivo](https://www.plivo.com/blog/dlt-registration/) · [India DLT registration — Infobip](https://www.infobip.com/docs/essentials/asia-registration/dlt-registration)
- [How can I check if a gov.sg channel on WhatsApp or Telegram is authentic — gov.sg](https://ask.gov.sg/govsg/questions/cm1kchz4v001mx0ww995wyrf3) · [PostmanGovSg — GovTech Singapore](https://www.tech.gov.sg/technews/postman-gov-sg-putting-the-mass-in-mass-comms/)
- [The Complete Guide to WeChat Official Accounts — AppInChina](https://appinchina.co/blog/what-are-wechat-official-accounts-the-complete-guide-to-creating-and-using-wechat-official-accounts/)

**Modèles africains**
- [The Irembo model in Rwanda — Public Digital](https://public.digital/pd-insights/signals/signals-5/the-irembo-model-in-rwanda)
- [Assessing the Effectiveness of E-Governance in Public Service Delivery: Rwanda, Kenya, Ghana](https://www.researchgate.net/publication/394236310_Assessing_the_Effectiveness_of_E-Governance_in_Public_Service_Delivery_A_Comparative_Study_of_Digitization_Efforts_in_Rwanda_Kenya_and_Ghana)
- [Lancement du New Deal Technologique — Sénégal Numérique SA](https://senegalnumeriquesa.sn/actualites/lancement-du-new-deal-technologique-une-strat%C3%A9gie-pour-la-souverainet%C3%A9-et-l%E2%80%99inclusion) · [Décryptage : le New Deal Technologique en quatre points — Africa Check](https://africacheck.org/fr/fact-checks/fiches-dinformation/decryptagesenegal-new-deal-technologique-4-points)
- [Projets télécoms et numériques : les pays de l'AES œuvrent pour un avenir commun — Agence Ecofin](https://www.agenceecofin.com/actualites-numerique/1811-123509-projets-telecoms-et-numeriques-les-pays-de-l-aes-uvrent-pour-un-avenir-commun)

**Standards, financement et soutenabilité**
- [Building Block Approach — GovStack Specification](https://specs.govstack.global/architecture/2.0.0/4-interoperability-architecture/4.4-building-block-approach) · [Build a Digital Public Infrastructure — GovStack Implementation Playbook](https://specs.govstack.global/implementation-playbook/development/strategy-and-management/build-a-digital-public-infrastructure-dpi)
- [We need an open conversation about the costs of digital public infrastructure — Digital Impact Alliance](https://dial.global/an-open-conversation-dpi-costs/)
- [Sustainable Funding Challenges — New America](https://www.newamerica.org/insights/financing-digital-public-infrastructure/sustainable-funding-challenges/)
- [DPI, building blocks and digital public goods — Digital Public Goods Alliance / GovStack](https://www.digitalpublicgoods.net/DPI-DPG-BB-Definitions.pdf)
