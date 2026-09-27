---
projet: "gounhri"
type: "document-d-etude"
phase: "10-etudes"
objet: "Fondations en sciences de l'humain — faits, disciplines, interdictions, primitives sociales, hypothèses falsifiables et programme d'enquête"
version: "0.1"
statut_documentaire: "Document d'étude exploratoire — non décisionnel"
provenance: "volet3_ingenierie_humaine_burkina_v0_1.md"
mise_en_conformite: 2026-09-07
tags:
  - gounhri
  - etudes
  - sciences-humaines
---

> [!important] Ce document conteste l'ordre de difficulté retenu par les deux autres
> Sa thèse directrice : *« La contrainte critique de ce projet n'est ni technique, ni financière, ni juridique. Elle est anthropologique. »* Il reproche aux documents `V0.1` et `V0.2` de traiter la sociologie comme une étude parmi seize autres, alors qu'un graphe social *« ne se décrète pas »*.
> C'est le seul document du coffre à produire des **hypothèses falsifiables numérotées** — dix-neuf, en annexe A — et des **critères d'abandon**. Il ne propose de décider que la méthode : trois décisions de procédure, au point 10.

# Volet 3 — Dossier d'ingénierie humaine

## Fondations en sciences de l'humain pour une infrastructure sociale numérique burkinabè

**Version :** 0.1
**Statut :** Document d'étude exploratoire — non décisionnel
**Position dans le programme :** complète le *Document d'ouverture v0.1* (capture de l'intention) et le *Dossier stratégique de cadrage v0.2* (organisation de l'espace des possibles)
**Nature :** apport de contenu scientifique là où les deux documents précédents n'avaient encore que des intitulés d'étude

> **Principe directeur :** les deux documents existants ont correctement identifié *qu'il faut* une étude des usages, des langues, des communautés et de la gouvernance. Ils ne disent pas encore *ce que l'on sait déjà*. Ce document apporte ce contenu, le confronte au terrain burkinabè, et transforme des intuitions en hypothèses falsifiables.

---

## 0. Objet et méthode de ce document

### 0.1 Le vide que ce document comble

Le dossier v0.2 énumère au point 26 une « Étude A — Sociologie et usages » dont les objectifs tiennent en sept tirets, et au point 6.3 une liste de quatorze formes communautaires (« famille ; quartier ; village ; commune… ») présentées comme « hypothèses fonctionnelles ». Ces listes sont justes mais vides : elles nomment des catégories administratives, pas des institutions sociales observées. Une liste de catégories n'est pas une connaissance ; elle est un tableau de rangement.

Ce document procède autrement. Il part de ce que les disciplines qui étudient l'humain ont effectivement établi — en Afrique de l'Ouest, au Sahel, et au Burkina Faso lui-même — puis en déduit ce que cela **impose**, ce que cela **interdit**, et ce que cela permet de **tester**.

### 0.2 Thèse directrice

> **La contrainte critique de ce projet n'est ni technique, ni financière, ni juridique. Elle est anthropologique.**

Les documents v0.1 et v0.2 traitent la souveraineté, l'architecture et l'économie avec beaucoup de soin, et la sociologie comme une étude parmi seize autres. L'ordre de difficulté réel est probablement inverse. Un datacenter se construit. Un modèle de gouvernance s'écrit. Un graphe social ne se décrète pas : il est le produit d'un tissu de relations préexistantes que le système peut refléter, déformer ou manquer, mais qu'il ne peut pas fabriquer.

La démonstration empirique de cette thèse existe. Elle est récente, africaine, et elle a coûté sept ans à un opérateur disposant de moyens considérables. Elle fait l'objet du point 1.

### 0.3 Convention de classification

Ce document reprend la convention de l'Annexe A du dossier v0.2 :

| Marque | Sens |
|---|---|
| **[F]** | Fait vérifiable, sourcé |
| **[O]** | Observation de terrain rapportée par la littérature |
| **[H]** | Hypothèse plausible non démontrée |
| **[P]** | Possibilité de conception |
| **[R]** | Risque |
| **[I]** | Invariant candidat |
| **[?]** | Lacune de connaissance à combler par enquête |

Aucune décision n'est prise dans ce document. Les propositions de conception (point 5) sont des candidats d'expérimentation, pas des spécifications.

### 0.4 Trois règles d'usage de ce document

1. **Ne pas lire les point 3.1 à point 3.17 comme un catalogue de fonctionnalités.** Chaque discipline y produit des contraintes, pas des idées de features.
2. **Le point 4 prime sur tout le reste.** Il énumère ce que les sciences humaines *interdisent*. Une interdiction bien identifiée vaut mieux que dix bonnes idées.
3. **Le point 9 doit être lu avant le point 5.** Il fixe les conditions dans lesquelles la réponse honnête serait « ne pas construire ce système », ou « en construire un beaucoup plus petit ». Un programme d'étude qui ne peut pas se conclure par un abandon n'est pas un programme d'étude.

---

## 1. Le fait qui doit réorganiser le dossier stratégique

### 1.1 Ayoba (2019–2026)

**[F]** MTN, premier opérateur télécom africain, a lancé en 2019 une application de messagerie et « super-app » nommée Ayoba, explicitement conçue comme réponse africaine à WhatsApp et inspirée de WeChat. Ses caractéristiques :

- messagerie chiffrée de bout en bout, appels voix et vidéo, notes vocales, partage de médias ;
- **continuité SMS** : un utilisateur pouvait écrire à un correspondant sans smartphone, qui recevait un SMS et pouvait répondre par SMS ;
- **plus de 22 langues africaines**, dont le jula (dioula), le haoussa, le swahili, le yoruba, le pidgin ;
- plus de 150 canaux de contenu localisé ;
- une version web légère pour les appareils à faible stockage ;
- **accès dégroupé de données (« zero-rating »)** : les abonnés MTN utilisaient l'application sans consommer leur forfait ;
- présence dans 17 marchés MTN, dont plusieurs pays d'Afrique de l'Ouest.

**[F]** Trajectoire : 1 million d'utilisateurs actifs mensuels en moins d'un an, 2 millions mi-2020, ~20 millions fin 2022, ~30 millions en septembre 2023, pic autour de **35 millions d'utilisateurs actifs mensuels** en 2023-2024. Objectif affiché : 100 millions.

**[F]** Ayoba a été retirée des magasins d'applications le **20 mars 2026** et arrêtée progressivement. MTN a présenté la décision comme une consolidation vers une plateforme unifiée adossée à MoMo.

**[O]** Les analyses de presse spécialisée convergent sur trois causes :

1. **La gratuité de la donnée achetait de l'installation, pas de l'usage.** Une fois l'incitation banalisée, l'engagement retombait. Un analyste a résumé : ce n'était pas de l'adéquation produit-marché, c'était de la curiosité subventionnée.
2. **L'effet réseau des plateformes installées n'a pas été entamé.** Les utilisateurs conservaient WhatsApp parce que leurs correspondants y étaient.
3. **Symptôme le plus significatif :** au Ghana, alors même que MTN promouvait Ayoba, ses propres équipes et les groupes de parties prenantes créés par MTN continuaient d'utiliser WhatsApp. L'opérateur n'a pas réussi à faire migrer ses propres salariés.

### 1.2 Ce que cet échec établit et ce qu'il n'établit pas

**Ce qu'il établit [F/O] :**

> Distribution massive + subvention de données + localisation linguistique + chiffrement + passerelle SMS + contenu local **ne suffisent pas** à déplacer un graphe social installé.

Ce point est décisif parce que la liste ci-dessus **est exactement la liste des atouts que le dossier v0.2 envisage de mobiliser** (point 7 accessibilité multimodale, point 12 interopérabilité, point 13 résilience, point 17 dimension culturelle, point 19 stratégies d'adoption). Ayoba avait tout cela, à une échelle continentale, avec le bilan d'un opérateur derrière, et a échoué.

**Ce qu'il n'établit pas :**

- que rien de local ne peut réussir (voir le point 1.3) ;
- que le zero-rating est inutile (il abaisse une barrière réelle ; il ne crée simplement pas de raison de venir) ;
- qu'un projet burkinabè échouerait pour les mêmes raisons — Ayoba était panafricaine, donc ancrée nulle part en particulier.

**[H] Hypothèse H-01 (centrale) :** l'échec d'Ayoba tient moins à son caractère « africain » qu'à son caractère **générique**. Elle proposait à des utilisateurs déjà servis une alternative fonctionnellement équivalente. Un système qui viserait un usage **aujourd'hui mal servi ou non servi** ne serait pas soumis à la même loi. *Cette hypothèse est la charnière de tout le projet et doit être testée en priorité.*

### 1.3 Le contre-exemple : Zalo (Viêt Nam)

**[F]** Zalo, développée par VNG, est l'application la plus utilisée au Viêt Nam, avec environ 77,8 millions d'utilisateurs actifs mensuels en 2024, soit plus de 85 % de la population.

**[O]** Les facteurs identifiés dans les analyses :

- conception initiale pour **appareils bas de gamme et connexions instables** — contrainte technique assumée comme axe produit, non comme handicap ;
- ancrage dans un **usage différencié** : Zalo s'est imposée d'abord pour le travail, les relations proches, les échanges professionnels et les démarches administratives, tandis que Facebook Messenger gardait le cercle large des « amis » ;
- **intégration aux services publics** : de nombreuses administrations communiquent via Zalo ;
- identification par numéro de téléphone et QR code, sans construction d'un nouveau carnet d'adresses ;
- adoption progressive plutôt que remplacement frontal.

**[O]** Point capital : dans les enquêtes des premières années, une majorité d'utilisateurs *préférait* encore Messenger — parce que le réseau d'amis y était plus grand. Zalo n'a pas gagné en étant préférée. Elle a gagné en devenant **indispensable pour autre chose**.

### 1.4 La loi de conception qui en découle

**[I] Invariant candidat I-01 — la loi du terrain non occupé :**

> Un système social nouveau ne se substitue pas à un système installé sur le même usage. Il ne peut croître qu'en occupant un usage que l'installé sert mal, ne sert pas, ou ne peut pas servir.

Corollaires pour le programme d'étude :

- La question du point 33 du v0.2 (« Quel usage est aujourd'hui mal servi ? ») n'est pas la sixième question. **C'est la première.** Tant qu'elle n'a pas de réponse empirique, aucune décision d'architecture n'a de fondement.
- Les scénarios 1, 2 et 7 du v0.2 (« réseau social minimal », « plateforme multimédia », « écosystème complet ») sont, à ce stade, les moins défendables : ils sont définis par leur périmètre fonctionnel, donc par imitation de l'installé.
- Les scénarios 3 et 6 (« infrastructure sociale », « infrastructure d'identité sociale ») sont les seuls dont la valeur ne dépende pas de la migration d'un graphe existant. Ils méritent une priorité d'étude supérieure à celle que leur donne la matrice du point 23.

---

## 2. Socle factuel burkinabè

Cette section fournit la base chiffrée que les documents v0.1 et v0.2 n'avaient qu'en partie. Elle sert de référence commune à toutes les études ultérieures. Toutes les données sont datées ; leurs limites méthodologiques sont signalées.

### 2.1 Démographie

**[F]** Population estimée à environ 24,2 millions d'habitants (fin 2025). Taux d'urbanisation estimé autour de 34 %, donc **environ deux tiers de la population en milieu rural**.

**[F]** Structure d'âge : plus de 65 % de la population a moins de 25 ans ; environ 43 % a moins de 15 ans. Croissance annuelle proche de 2,5–3 %.

**[F]** Dernier recensement général (RGPH) : novembre-décembre 2019, 20,49 millions d'habitants. Les chiffres postérieurs sont des projections.

**Conséquences de conception :**

- **[I]** L'utilisateur médian n'est pas un adulte urbain équipé. Il est **jeune, rural ou périurbain, et n'a pas connu autre chose que le téléphone comme accès au numérique**.
- **[H] H-02 :** dans une population aussi jeune, l'adoption ne suivra pas le modèle « adultes puis jeunes » mais « jeunes puis parents », avec les adolescents comme vecteurs d'installation et de formation à l'usage pour leurs aînés. Ce mécanisme d'installation intergénérationnelle est un objet d'étude à part entière.
- **[R]** Une population majoritairement mineure impose des obligations de protection de l'enfance dès la conception, pas au moment de la mise à l'échelle.

### 2.2 Connectivité, appareils, coûts

**[F]** Données consolidées fin 2025 (DataReportal / Kepios, croisées ARCEP) :

| Indicateur | Valeur | Lecture |
|---|---|---|
| Connexions mobiles actives | 29,3 millions | ~121 % de la population : ce sont des cartes SIM, pas des personnes |
| Internautes | 5,42 millions | 22,4 % de la population |
| Identités sur réseaux sociaux | 3,90 millions | 16,1 % de la population ; ~72 % des internautes |

**[F]** Comparaison avec 2024-2025 : les identités sociales ont progressé d'environ 750 000 en un an (+16 %), les internautes d'environ 470 000. Le taux de pénétration Internet exprimé en pourcentage est resté quasi stable, la croissance démographique absorbant la croissance des connexions.

**Précautions méthodologiques indispensables [?] :**

- Le taux de 121 % de « pénétration mobile » ne signifie pas que chaque Burkinabè a un téléphone. Le pays compte plusieurs opérateurs et le multi-SIM est courant.
- « Identités de réseaux sociaux » ≠ personnes uniques. Un même individu peut avoir plusieurs comptes ; des comptes sont inactifs.
- **Aucune de ces sources ne mesure le partage d'appareil**, qui est probablement le fait le plus structurant pour la conception (point 3.12 et point 4.3). C'est une lacune que l'enquête devra combler en priorité.

**[?] Données manquantes critiques :** part des téléphones intelligents dans le parc réel ; répartition 2G/3G/4G effectivement utilisée ; dépense mensuelle médiane en données ; taux de partage d'appareil par sexe et par milieu ; part des appareils reconditionnés ; capacité de stockage médiane.

### 2.3 Langues et statut juridique

**[F]** Le Burkina Faso compte une soixantaine de langues. Les principales sont le **mooré** (langue véhiculaire du centre et de la capitale, comprise par une majorité de la population), le **dioula** (véhiculaire de l'ouest et du commerce), le **fulfulde** (peul) et le **bissa**. Le gulmancema et le lyélé font également partie des groupes ayant fait l'objet de travaux linguistiques suivis.

**[F] Fait juridique décisif, sous-exploité par les documents v0.1 et v0.2 :** la révision constitutionnelle adoptée le 6 décembre 2023, formalisée par la loi n°045-2023/ALT du 30 décembre 2023, a fait des **langues nationales les langues officielles** du Burkina Faso, le français et l'anglais devenant langues de travail.

**Portée pour le projet :**

- Le multilinguisme national n'est plus une option d'accessibilité ni un geste culturel. **C'est un cadre juridique.** Un système social national conçu principalement en français serait en décalage avec l'ordre constitutionnel en vigueur.
- **[I] Invariant candidat I-02 :** les langues nationales sont un **prérequis d'architecture**, non une couche de traduction ajoutée après coup. Un système qui stocke du texte français et traduit à l'affichage n'est pas multilingue ; il est francophone avec sous-titres.
- **[F]** Le mooré, le dioula et le fulfulde disposent d'acquis réels : alphabets stabilisés, dictionnaires, grammaires, manuels et supports d'alphabétisation. Ce socle est solide mais insuffisant pour en faire des langues de travail numériques à part entière ; l'écart est une question de moyens, non de capacité intrinsèque des langues.

**[R] Risque politique et social majeur :** le choix des langues prises en charge, leur ordre, leur visibilité relative dans l'interface, et la langue par défaut sont des **actes politiques**. Le mooré est la langue de l'ethnie majoritaire ; le fulfulde est la langue d'une communauté qui, dans le contexte sécuritaire actuel, fait l'objet de stigmatisations documentées. Un système qui traiterait ces langues de manière visiblement inégale produirait un signal politique, quelle que soit l'intention technique. Ce point doit être arbitré par une instance non technique.

### 2.4 Littératie et rapport à l'écrit

**[F]** Le taux d'alphabétisation adulte est bas — les estimations usuelles situent le Burkina Faso parmi les pays sahéliens où il est inférieur à 40 %, avec un écart marqué au détriment des femmes et du milieu rural.

**[O]** Point que le document v0.1 avait correctement pressenti au point 4 : il existe un décalage entre alphabétisation scolaire, alphabétisation numérique et capacité effective à utiliser un téléphone. Des personnes en difficulté avec l'écrit utilisent couramment des applications sociales par apprentissage pratique et imitation.

**Ce que cette observation ne dit pas, et qui est essentiel :** les recherches en interaction homme-machine montrent que la barrière n'est pas seulement l'écrit. Elle est aussi **l'abstraction hiérarchique** (point 3.5). Une interface sans texte peut rester inutilisable si elle exige de naviguer dans des menus emboîtés.

### 2.5 Médias, oralité et précédent radiophonique

**[F]** Le paysage radiophonique burkinabè a été libéralisé à partir de 1991 — Horizon FM fut la première radio privée d'Afrique de l'Ouest. Le pays a ensuite développé un réseau dense de radios commerciales, associatives, communautaires et confessionnelles, jusqu'à l'échelle villageoise, largement animées **en langues nationales**.

**[F]** Le Conseil supérieur de la communication (CSC) attribue les fréquences par appels à candidatures, en indiquant les zones à couvrir et le nombre de radios par catégorie, dans une logique de couverture harmonieuse du territoire.

**[O]** Une étude conduite auprès de personnes déplacées internes par la Fondation Hirondelle, avec l'Université de Sheffield et le Centre national de la recherche scientifique et technologique (CNRST) du Burkina Faso, établit que la radio agit comme **outil de survie**, espace d'échange et de solidarité entre déplacés et communautés hôtes, et qu'elle est jugée digne de confiance en contexte d'incertitude. Sa force tient à trois propriétés : adaptation aux publics, localisation de la diffusion, diffusion multilingue.

**[O]** D'autres travaux documentent le rôle des radios communautaires burkinabè dans la prévention des conflits intercommunautaires et la promotion de la cohésion sociale.

**Conséquence stratégique majeure, absente des v0.1 et v0.2 :**

> **Le Burkina Faso dispose déjà d'une infrastructure sociale décentralisée, multilingue, ancrée localement et jouissant d'une confiance mesurée : la radio de proximité.**

**[H] H-03 :** le chemin le plus court vers une infrastructure sociale numérique nationale n'est pas de construire une plateforme *à côté* de cet écosystème, mais d'en construire la **couche numérique**, en réutilisant sa légitimité, son maillage territorial, ses compétences linguistiques et ses règles d'attribution. Cette hypothèse est développée en point 5.5 ; le présent dossier la tient pour la piste la plus prometteuse qu'il ait produite.

### 2.6 Mobilité, déplacement, retour, diaspora

**[F]** Le Burkina Faso connaît depuis 2015 une crise sécuritaire majeure. Le nombre de personnes déplacées internes est passé de moins de 50 000 en 2019 à environ 2,01 millions en 2023.

**[F]** La dynamique s'est inversée : le plan humanitaire 2026 cible 1,29 million de déplacés internes et plus de 900 000 retournés ; au 30 juin 2026, plus de 1,31 million de personnes avaient regagné leurs localités d'origine, réparties dans 1 034 villages, contre 1,16 million dans 871 localités six mois plus tôt.

**[F]** L'INSD a conduit fin 2024, avec le HCR, l'une des premières enquêtes quantitatives à échantillonnage probabiliste auprès des personnes déplacées et des communautés hôtes (2 156 ménages). C'est une ressource méthodologique et un partenaire naturel pour l'enquête du point 7.

**[F]** Diaspora : les transferts de fonds représentent environ 350 milliards de FCFA par an, soit environ 3 % du PIB. **[?]** Le chiffre officiel de « 16 millions » de Burkinabè de l'extérieur est incompatible avec les données démographiques disponibles et recouvre vraisemblablement les descendants ; il doit être traité comme non exploitable en l'état pour du dimensionnement.

**Conséquences de conception :**

- **[I] Invariant candidat I-03 :** le lieu de résidence est instable. Une identité sociale attachée à un village fixe, à une commune administrative ou à un opérateur télécom déterminé **échouera pour plusieurs millions de personnes**. Le système doit supporter le déplacement, le retour, la double appartenance (village d'origine / lieu d'accueil) et la perte d'appareil sans perte de lien.
- **[H] H-04 :** le corridor Burkina–Côte d'Ivoire est probablement le premier flux relationnel transfrontalier du pays. Une infrastructure sociale qui ignorerait la diaspora ignorerait une part majeure du tissu affectif et économique réel. À l'inverse, le lien migrant/famille est un candidat sérieux d'« usage mal servi » au sens de I-01.

### 2.7 Cadre juridique national

**[F]** La loi n°001-2021/AN du 30 mars 2021 régit la protection des personnes à l'égard du traitement des données à caractère personnel. Elle abroge la loi n°010-2004, élargit le champ aux communications électroniques, et renforce l'autorité de contrôle.

**[F]** L'autorité de contrôle est la **Commission de l'informatique et des libertés (CIL)**, autorité administrative indépendante disposant de pouvoirs réglementaires et de sanction. La déclaration des traitements lui est obligatoire. Le secret professionnel ne lui est pas opposable. Les transferts vers un pays n'assurant pas un niveau de protection adéquat sont encadrés.

**Conséquences :**

- La CIL n'est pas un obstacle à contourner ; c'est un **partenaire d'architecture** à associer dès la phase de conception, avant tout prototype traitant des données réelles.
- **[R]** Un système social national concentre des données sensibles au sens de la loi (opinions, appartenance religieuse, santé, données pouvant révéler l'origine ethnique). Le point 4.1 en tire les conséquences les plus lourdes du présent document.

### 2.8 Cadre régional

**[F]** Le Burkina Faso, le Mali et le Niger ont créé l'Alliance des États du Sahel en septembre 2023, annoncé leur retrait de la CEDEAO le 28 janvier 2024, et adopté le 6 juillet 2024 à Niamey le traité instituant la **Confédération AES**, étendant la coopération de la défense à la diplomatie et au développement, avec l'adoption annoncée d'une stratégie commune en matière de communication.

**Conséquence pour le point 5 du v0.2 (« extension régionale à étudier ») :** le cadre régional pertinent a changé de nature. Toute hypothèse d'extension doit être étudiée dans le cadre AES, avec les questions afférentes : convergence des régimes de protection des données entre les trois États, interconnexion des infrastructures, régime des transferts transfrontaliers, et — question non triviale — **quelle autorité arbitrerait un litige de modération entre trois juridictions**.

**[?]** L'état d'avancement d'une harmonisation numérique AES (protection des données, interconnexion, itinérance, identité) reste à documenter précisément.

### 2.9 Lacunes de connaissance : un livrable en soi

Le dossier v0.2 liste seize livrables (point 34). Il en manque un, qui devrait être le premier :

**Livrable 0 — Inventaire raisonné de ce que le pays ne sait pas sur ses propres usages numériques**, incluant : le taux réel de possession individuelle d'appareil par sexe et milieu ; les pratiques de partage ; les langues effectivement utilisées à l'écrit et à l'oral dans les messageries ; la structure des groupes existants (taille, durée de vie, fonction) ; le coût réel supporté par ménage ; les pratiques de transfert hors ligne de contenus.

Sans ce socle, toute architecture est bâtie sur des projections.

---

## 3. Les disciplines de l'humain, une à une

Chaque section suit le même gabarit : **ce que la discipline établit → ce que cela impose ou interdit → hypothèses falsifiables → méthode d'investigation**.

---

### 3.1 Anthropologie de la parenté et de l'alliance

**Ce que la discipline établit**

**[F]** Le Burkina Faso possède une institution sociale de régulation des tensions largement documentée : la **parenté à plaisanterie**, dite *rakiré* en mooré, *sinankunya* au Mali, *toukpê* en Côte d'Ivoire. Elle autorise, voire oblige, certains groupes — ethnies, patronymes, régions, provinces, villages — à se moquer mutuellement, publiquement, sans conséquence et sans rancune.

**[F]** Au Burkina Faso, elle se décline **entre ethnies** (Mossi/Samo, issue d'alliances guerrières ; Bobo/Peul, entre sédentaires cultivateurs et pasteurs), **entre patronymes**, et **entre territoires**.

**[O]** Les anthropologues l'analysent comme un mécanisme de décrispation, de cohésion et de réconciliation, parfois de nature sacrée. Un enquêté résume sa fonction : elle permet de dire la vérité et d'adresser un reproche à quelqu'un sans le blesser. Elle est mobilisée comme **mécanisme endogène de prévention et de gestion des conflits**, y compris dans des projets de dialogue interreligieux.

**Ce que cela impose ou interdit**

- **[R] Interdiction forte :** un système de modération automatique entraîné sur des corpus étrangers classera le *rakiré* comme **discours haineux à caractère ethnique**. Un échange rituel de moqueries Mossi/Samo présente toutes les caractéristiques de surface d'une attaque identitaire. Une modération naïve supprimerait donc précisément ce que la société burkinabè utilise pour désamorcer les conflits — et le ferait de manière asymétrique et visible, produisant un ressentiment légitime.
- **[I] Invariant candidat I-04 :** **le contexte relationnel est un attribut du message, pas une métadonnée facultative.** Le même énoncé est une insulte ou une alliance selon la relation entre l'émetteur et le destinataire. Toute architecture de modération qui évalue un contenu isolément est structurellement inadaptée au Burkina Faso.
- **[R] Risque symétrique et grave :** l'idée d'encoder la relation à plaisanterie dans le système suppose de **connaître l'ethnie ou le patronyme d'alliance des utilisateurs**. Voir le point 4.1 : cette information ne doit pas être collectée. La solution ne peut donc pas être un registre ethnique. Elle doit être **déclarative, dyadique et réversible** : ce sont les deux parties qui déclarent leur relation entre elles, l'information restant locale à la relation et jamais agrégée.

**Hypothèses falsifiables**

- **H-05 :** une part significative des signalements de « harcèlement » sur les plateformes existantes au Burkina Faso correspond en réalité à des échanges de plaisanterie rituelle mal interprétés par des modérateurs ou des classifieurs non contextualisés. *Testable par audit d'un corpus de signalements avec des anthropologues.*
- **H-06 :** un mécanisme dyadique déclaratif de « relation d'alliance » réduit significativement le taux de faux positifs de modération sans augmenter le taux d'abus. *Testable en A/B sur prototype.*

**Méthode :** entretiens avec anthropologues burkinabè (les travaux d'A. J. Sissao sur les alliances et parentés à plaisanterie constituent une base) ; constitution d'un corpus annoté d'échanges réels en mooré et dioula ; annotation contradictoire par des locuteurs des groupes concernés.

---

### 3.2 Sociologie de la jeunesse et sociabilité urbaine — le *grin*

**Ce que la discipline établit**

**[F]** Le *grin* est une institution sociale ouest-africaine bien étudiée, présente au Burkina Faso, au Mali et en Côte d'Ivoire. C'est **à la fois une entité sociale et spatiale** : un groupe de pairs qui se réunit régulièrement autour du thé, dans un lieu fixe de la rue ou du quartier, pour discuter et « refaire le monde ».

**[O]** Propriétés documentées :

- la composition **traverse les clivages socio-économiques, ethniques et de caste** ;
- les membres sont liés par des formes de solidarité durables, **de l'enfance à l'âge adulte** ;
- il existe une autorité interne (un chef de grin) ;
- une hiérarchie d'ancienneté est matérialisée physiquement, jusque dans l'attribution des sièges, et se recompose à chaque arrivée ;
- le grin est un lieu de **prise de parole publique** et un espace politique réel : la recherche a documenté le rôle des grins de thé dans les campagnes électorales à Ouagadougou ;
- il est suffisamment institutionnalisé pour être compté et organisé — en Côte d'Ivoire, une association affirmait en recenser plus de 18 500.

**Ce que cela impose**

- Le « groupe » des messageries importées est un objet pauvre au regard du *grin* : liste plate de membres, pas de lieu, pas d'ancienneté, pas d'autorité reconnue, pas de mémoire, pas de règle d'entrée. Le *grin* possède les cinq.
- **[I] Invariant candidat I-05 :** l'unité sociale de base à modéliser n'est peut-être **ni l'individu ni « l'ami », mais le cercle persistant, ancré, ordonné par l'ancienneté et doté d'une autorité interne reconnue.** C'est un objet de conception radicalement différent d'un groupe de discussion.
- **[P]** Le point 6.3 du v0.2 propose une liste de communautés (famille, quartier, village, commune, province, établissement, association…). Cette liste est **administrative**. Le *grin* n'y figure pas — alors qu'il est probablement la forme de sociabilité quotidienne la plus dense chez les 15-35 ans, c'est-à-dire chez la majorité démographique du pays.

**Hypothèses falsifiables**

- **H-07 :** les groupes WhatsApp réellement actifs au Burkina Faso ont une structure plus proche du *grin* (ancrage local, ancienneté, chef informel, permanence) que de la liste de contacts. *Testable par enquête sur les groupes existants : durée de vie, mode de création, existence d'un administrateur reconnu socialement, rapport à un lieu physique.*
- **H-08 :** un objet logiciel « cercle » doté d'ancienneté explicite, d'un lieu et d'une autorité interne obtient une rétention supérieure à un « groupe » plat, chez les 15-35 ans. *Testable en prototype comparatif.*
- **[R] Risque de trahison de l'institution :** formaliser une hiérarchie d'ancienneté dans du logiciel peut la **rigidifier**. Dans le grin réel, la pyramide se renégocie en permanence ; codée, elle deviendrait un privilège permanent. Toute implémentation doit préserver la révisabilité.

**Méthode :** ethnographie multi-sites dans plusieurs quartiers de Ouagadougou et de Bobo-Dioulasso, en s'appuyant sur la littérature existante (J. Kieffer, O. P. Hien) ; observation participante ; cartographie des grins et de leurs usages numériques actuels.

---

### 3.3 Sociolinguistique

**Ce que la discipline établit**

**[F]** Situation de **plurilinguisme véhiculaire hiérarchisé** : une soixantaine de langues, trois grands véhiculaires (mooré, dioula, fulfulde), une langue de travail (français) maîtrisée par une minorité — la population francophone est estimée autour de 22 % en 2024, dont une très faible part de locuteurs natifs.

**[F]** Le mooré est une langue **à tons**, comme le dioula. Le fulfulde possède un système de classes nominales complexe.

**[O]** Faits sociolinguistiques structurants pour la conception :

- l'alternance codique (mélange de langues dans un même énoncé) est la norme conversationnelle, pas l'exception ;
- l'écrit en langues nationales existe mais reste peu pratiqué spontanément : beaucoup de locuteurs parlent une langue qu'ils n'écrivent pas ;
- corollaire capital : **l'orthographe standardisée n'est pas la forme sous laquelle les gens écrivent leur langue** lorsqu'ils le font sur un téléphone. Ils translittèrent, souvent selon des conventions personnelles ou françaises.

**Ce que cela impose**

- **[I] Invariant candidat I-06 :** un moteur de recherche, un index ou un système de modération qui suppose une orthographe normalisée en mooré ou dioula **ne trouvera rien**. La tolérance orthographique et phonétique n'est pas un raffinement ; c'est une condition de fonctionnement.
- **[I] Invariant candidat I-07 :** la langue est un attribut **du message et de la relation**, pas du compte. Une même personne écrit à sa mère en mooré vocal, à son collègue en français écrit, à son client en dioula. Un « paramètre de langue » unique par utilisateur est un contresens sociolinguistique.
- **[R]** Voir le point 2.3 : la hiérarchie visible des langues dans l'interface est un acte politique.

**État de l'art technique — évaluation honnête**

**[F]** Les langues du Burkina Faso sont des langues **très peu dotées** au sens du traitement automatique des langues. Les efforts communautaires existent (Masakhane, financements de type Lacuna, initiatives AI4D) mais portent surtout sur d'autres langues africaines.

**[F]** Pour le mandingue (bambara, mutuellement intelligible avec le dioula), la recherche récente identifie un obstacle qui n'est pas technique mais social : **la transcription est un problème difficile parce que peu de locuteurs écrivent la langue, et que ceux qui le peuvent ne le font pas rapidement**. Le goulot d'étranglement de la reconnaissance vocale en langues sahéliennes n'est donc pas le modèle : c'est la production de données annotées.

**[F]** Il existe une capacité de recherche locale sur ces sujets. Des travaux burkinabè ont produit un corpus de 8 522 échantillons audio en **mooré, dioula et fulfulde** pour la reconnaissance des émotions dans la parole, présentés dans un cadre scientifique consacré aux langues peu dotées d'Afrique subsaharienne. L'ordre de grandeur (quelques milliers d'échantillons) indique à la fois l'existence d'une communauté scientifique nationale et la distance qui reste à parcourir.

**Hypothèses falsifiables**

- **H-09 :** un corpus vocal annoté suffisant pour une reconnaissance vocale utilisable en mooré et dioula peut être constitué **à un coût inférieur à celui d'une année d'exploitation d'une plateforme vidéo**, en s'appuyant sur les radios communautaires (archives existantes) et sur un dispositif de contribution rémunérée. *Testable par une étude de coût et un pilote de collecte.*
- **H-10 :** la reconnaissance vocale n'est **pas nécessaire** pour un système audio-first. Les messages vocaux fonctionnent aujourd'hui sans transcription. La transcription n'est requise que pour la recherche, l'indexation et la modération à l'échelle. *Cette hypothèse, si elle est vraie, décale le calendrier IA de plusieurs années et réduit massivement le risque du projet.*

**Méthode :** partenariat avec les laboratoires nationaux et le CNRST ; audit des ressources existantes (alphabets, dictionnaires, corpus d'alphabétisation) ; étude de faisabilité d'un corpus radiophonique.

---

### 3.4 Anthropologie de l'oralité et littératie

**Ce que la discipline établit**

**[O]** Les sociétés à forte tradition orale n'ont pas simplement « moins d'écrit ». Elles organisent la mémoire, l'autorité, la preuve et la relation autrement : la parole y est **située, incarnée, adressée** ; l'auteur d'un énoncé n'est pas séparable de sa voix ; la répétition et la formule ont une fonction mnémonique et normative ; l'autorité d'un propos dépend de qui le porte au moins autant que de son contenu.

**[O]** Le téléphone mobile a produit dans ces sociétés un phénomène remarquable : il a rendu la communication à distance **de nouveau orale**. Le message vocal n'est pas un pis-aller pour analphabètes ; c'est un retour à un régime de communication culturellement dominant, avec la portée de l'écrit.

**Ce que cela impose**

- **[I] Invariant candidat I-08 :** **l'audio n'est pas un mode d'accessibilité. C'est le mode principal.** Le texte est le mode d'accessibilité — pour les lettrés, pour la recherche, pour l'archivage.
  Cette inversion a des conséquences profondes : le stockage est dimensionné par l'audio ; la recherche doit fonctionner sur de l'audio ; la modération doit s'exercer sur de l'audio ; les notifications doivent être audibles ; l'identité peut être vocale.
- **[R] Conséquence économique lourde, non traitée par le v0.2 :** un système audio-first a un profil de coût **radicalement différent** d'un système textuel. L'audio pèse ~100 à 1000 fois plus que le texte équivalent, ne se compresse pas indéfiniment, ne s'indexe pas gratuitement, et sa modération ne peut pas s'appuyer sur des filtres lexicaux. Le point 18 du v0.2 s'inquiète à juste titre du coût de la vidéo ; **le coût de l'audio à l'échelle nationale mérite le même traitement, et il arrive plus tôt.**
- **[P]** Une propriété de l'oralité mérite exploration : la parole est **éphémère par défaut**. Un système qui conserve tout indéfiniment n'est pas neutre culturellement ; il transforme des propos situés en archives opposables. L'expiration par défaut, souvent présentée comme une fonctionnalité de confidentialité, est ici **un choix de fidélité anthropologique**.

**Hypothèses falsifiables**

- **H-11 :** dans les usages burkinabè actuels des messageries, le volume de messages vocaux dépasse celui des messages écrits chez les utilisateurs à faible littératie, et l'écart croît avec l'âge et en milieu rural. *Testable par journal d'usage consenti et entretiens.*
- **H-12 :** une fonction de **réponse vocale à un contenu vocal** dans un fil public (par opposition à un commentaire écrit) augmente significativement la participation des utilisateurs à faible littératie. *Testable en prototype.*

---

### 3.5 Sciences cognitives et ergonomie des interfaces

C'est ici que la littérature scientifique est la plus directement exploitable, et la plus contre-intuitive.

**Ce que la discipline établit [F]**

Les travaux de recherche en interaction homme-machine pour publics peu ou non lettrés (notamment ceux d'I. Medhi-Thies, K. Toyama, E. Cutrell et leurs collaborateurs) ont établi expérimentalement plusieurs résultats :

1. **Les interfaces textuelles sont totalement inutilisables** par les utilisateurs non lettrés. Dans les études, aucun participant, seul ou en groupe, n'a pu naviguer une interface textuelle, même avec encouragement et assistance.
2. **La difficulté ne se réduit pas au texte.** La performance de navigation dans une hiérarchie de menus — **même sans aucun texte** — est prédite par des tests d'abstraction (matrices de Raven), eux-mêmes corrélés au niveau d'éducation. Autrement dit : **la hiérarchie est en soi une barrière cognitive**, indépendamment de la lecture.
3. **Une liste plate paginée bat une hiérarchie.** Dans une comparaison directe sur téléphone tactile entre une hiérarchie à quatre niveaux et une liste de quarante éléments répartie sur sept pages, les utilisateurs non lettrés ont été **plus rapides et plus exacts avec la liste paginée**, alors même qu'elle exige davantage de défilement.
4. **Les interfaces vocales bien conçues surpassent les interfaces à touches** (type serveur vocal à navigation DTMF), pour les utilisateurs peu lettrés **comme pour les lettrés**.
5. Les représentations riches (vidéo en contexte complet, illustrations) améliorent le taux de réussite ; les interfaces vocales améliorent la vitesse et réduisent le besoin d'assistance.
6. Un système de réseau social pour agriculteurs peu lettrés a déjà fait l'objet de recherche publiée (KrishiPustak), ce qui fournit un précédent méthodologique direct.

**Ce que cela impose**

- **[I] Invariant candidat I-09 — proscription de la hiérarchie profonde :** l'architecture d'information doit être **plate et énumérative**, pas arborescente. Cela contredit frontalement les conventions d'interface dominantes (onglets, menus, sous-menus, paramètres imbriqués). C'est probablement la contrainte de conception la plus coûteuse et la plus structurante du projet.
- **[I] Invariant candidat I-10 :** tout parcours critique doit être réalisable **sans lire un mot**, en s'appuyant sur l'audio, l'image en contexte et la position spatiale stable des éléments.
- **[R]** Le point 28 du v0.2 identifie le risque « UX trop technique » et propose comme réponse des « tests utilisateurs réels, y compris avec des personnes faiblement alphabétisées ». C'est insuffisant : **tester tardivement une architecture hiérarchique auprès de publics peu lettrés ne fera que constater l'échec.** La contrainte doit être posée en amont de la conception, pas vérifiée en aval.

**Hypothèses falsifiables**

- **H-13 :** sur un échantillon burkinabè stratifié par niveau de scolarisation, la profondeur hiérarchique maximale navigable sans assistance est ≤ 2 niveaux pour la moitié inférieure de l'échantillon. *Réplication directe d'un protocole existant, à faible coût et haute valeur informative. À conduire en priorité.*
- **H-14 :** la position spatiale stable (un élément toujours au même endroit) est un meilleur repère que l'icône pour les utilisateurs non lettrés. *Testable.*

**Méthode :** réplication des protocoles publiés, en mooré et dioula, avec l'appui d'un laboratoire universitaire burkinabè. Ce travail est peu coûteux, rapide, et conditionne toute la conception ultérieure. **Il constitue le premier livrable à commander.**

---

### 3.6 Psychologie des motivations et de l'engagement

**Ce que la discipline établit**

**[O]** La théorie de l'autodétermination distingue motivation extrinsèque (récompense, incitation) et intrinsèque (autonomie, compétence, relation). Les incitations extrinsèques produisent une adoption rapide et peu durable ; elles peuvent même éroder la motivation intrinsèque lorsqu'elles la remplacent.

**[F]** Le cas Ayoba (point 1.1) est une illustration à l'échelle continentale : la gratuité des données a produit 35 millions d'installations et n'a pas produit d'usage.

**[O]** À l'inverse, les mécanismes d'engagement des plateformes dominantes reposent sur des récompenses variables et une captation de l'attention dont les effets sur le bien-être font l'objet d'une littérature abondante et de préoccupations croissantes.

**Ce que cela impose**

- **[I] Invariant candidat I-11 :** ne pas financer l'adoption par la subvention d'accès seule. La subvention lève une barrière ; elle ne crée pas de raison.
- **[P] Opportunité stratégique réelle :** une infrastructure qui n'a pas pour objectif de maximiser le temps passé dispose d'une liberté de conception que les plateformes commerciales n'ont pas. Le point 18 du v0.2 pose la bonne question (« comment financer sans faire de la captation de données le moteur économique ? »). La réponse a un corollaire de conception : **si le modèle économique ne dépend pas de l'attention, le produit ne doit pas être conçu pour la capter.** C'est un différenciateur défendable et culturellement lisible.
- **[R]** Attention à la naïveté inverse : un système délibérément « ennuyeux » n'est pas adopté non plus. La distinction utile n'est pas engagement contre désengagement, mais **utilité récurrente contre captation compulsive**.

**Hypothèses falsifiables**

- **H-15 :** une proposition de valeur fondée sur une utilité récurrente non ludique (coordination familiale, transfert d'information vérifiée, gestion d'un groupe réel) produit une rétention à 90 jours supérieure à une proposition fondée sur le divertissement, à effort marketing égal, dans le contexte burkinabè.

---

### 3.7 Anthropologie et économie du quotidien

**Ce que la discipline établit**

**[O]** Faits économiques structurants documentés en Afrique de l'Ouest, et à confirmer précisément au Burkina Faso :

- **le prépaiement domine** : l'utilisateur arbitre en permanence entre crédit de communication et autres dépenses du ménage ;
- **le partage d'appareil est massif**, particulièrement au détriment des femmes et en milieu rural : un téléphone peut être un bien de ménage, pas un bien personnel ;
- **l'usage intermédié est courant** : une personne opère le téléphone pour une autre — un jeune pour un aîné, un lettré pour un non-lettré, un vendeur de crédit pour un client ;
- **la distribution hors ligne de contenus est une infrastructure réelle** : transferts Bluetooth, cartes mémoire, kiosques de chargement de musique et de vidéos ;
- **la tontine** est une institution financière endogène robuste : contribution rotative, engagement social, sanction par la réputation, gouvernance par le groupe.

**[F]** Les transferts de la diaspora représentent environ 3 % du PIB, ce qui fait du **lien migrant/famille** un flux économique et affectif de premier ordre.

**Ce que cela impose**

- **[I] Invariant candidat I-12 — dissocier identité, appareil et numéro.** Si le partage d'appareil est aussi répandu que la littérature le suggère, alors un système qui identifie l'utilisateur par le téléphone ou par la carte SIM **identifie le mauvais objet**. Conséquences : sessions multiples sur un appareil, sortie rapide et sûre, séparation des notifications, et pas de contenu sensible affiché sans déverrouillage explicite.
- **[I] Invariant candidat I-13 :** l'usage intermédié doit être **un mode de fonctionnement conçu**, pas un contournement toléré. Cela implique des questions de conception inhabituelles : comment une personne peut-elle consulter ses messages via un tiers sans lui donner accès à tout ? Comment un tiers peut-il aider sans usurper ?
- **[P]** Le transfert hors ligne est un candidat sérieux de **différenciation architecturale** : un système capable de synchroniser par proximité, entre appareils, sans passer par le réseau, résout un problème réel que les plateformes dominantes ne résolvent pas. Il rejoint l'exigence de résilience du point 13 du v0.2.
- **[P]** La tontine est un modèle de financement communautaire déjà légitime. Une infrastructure dont certaines ressources (stockage local, relais de quartier, énergie) seraient financées par contribution rotative de communauté mobiliserait une institution existante plutôt qu'un modèle importé.

**Hypothèses falsifiables**

- **H-16 :** au Burkina Faso, plus de X % des femmes en milieu rural accèdent au numérique via un appareil qu'elles ne possèdent pas. *X à établir ; c'est la donnée manquante la plus importante du dossier.*
- **H-17 :** un mécanisme de transfert de contenus par proximité, sans réseau, est utilisé spontanément si offert, à un taux mesurable.

---

### 3.8 Démographie, mobilité et déplacement

**Ce que la discipline établit** — voir le point 2.1 et point 2.6.

**Ce que cela impose**

- **[I] Rappel de I-03 :** l'identité ne peut pas être attachée à un lieu fixe.
- **[R] Risque spécifique aux populations déplacées :** ces populations sont marginalisées et, comme l'a établi la recherche menée avec le CNRST et la Fondation Hirondelle, **plus vulnérables à la désinformation**. Un système social national qui les atteindrait sans dispositif d'information vérifiée les exposerait davantage.
- **[P]** Inversement, le triptyque **déplacement / retour / reconstruction du lien** est un usage massif, documenté, et aujourd'hui mal servi : retrouver des proches dispersés, savoir si un village est sûr, coordonner un retour, reconstituer un réseau villageois éclaté. Cela relève exactement de I-01 (terrain non occupé).
- **[R] Contrepartie éthique immédiate :** un service de recherche de personnes déplacées est aussi un **outil de localisation de personnes déplacées**. Voir le point 4.1. Cette piste ne peut être explorée qu'avec un modèle de menace explicite et un contrôle par les personnes concernées.

---

### 3.9 Géographie sociale et échelles d'appartenance

**Ce que la discipline établit**

**[O]** Les échelles d'appartenance vécues ne coïncident pas avec le découpage administratif. Le village d'origine, le quartier de résidence, la cour, le marché, la zone de transhumance, la paroisse ou la mosquée, le corridor migratoire vers Abidjan sont des échelles sociales effectives. La commune et la province sont des échelles administratives.

**[F]** Le découpage administratif burkinabè a d'ailleurs été réformé récemment, ce qui illustre le caractère mouvant de ces cadres.

**Ce que cela impose**

- **[I] Invariant candidat I-14 :** ne pas construire la structure sociale du système sur le découpage administratif. Celui-ci change ; les appartenances vécues, moins. Le système doit permettre à des groupes de **se déclarer** plutôt que d'être dérivés d'un référentiel territorial officiel.
- **[H] H-18 :** l'appartenance au **village d'origine** reste opérante pour des personnes qui n'y résident plus depuis des années, y compris pour les migrants en Côte d'Ivoire. Si c'est vrai, la « communauté d'origine » est une primitive plus robuste que la « communauté de résidence ».

---

### 3.10 Sciences de l'information et de la communication — la radio comme institution

Développé en point 2.5. Les implications de conception sont reprises en point 5.5, qui en fait la piste centrale du document.

**Points complémentaires**

**[O]** La radio de proximité possède des propriétés qu'une plateforme numérique met normalement des années à acquérir : légitimité locale, animateurs connus personnellement, compétence linguistique, ancrage territorial, régime d'autorisation clair, et modèle éditorial contrôlé par la communauté.

**[O]** Elle possède aussi des faiblesses documentées : ressources de fonctionnement insuffisantes, personnels précaires souvent bénévoles, faible qualification technique, faible taux de féminisation, et un flou typologique — des radios commerciales ou confessionnelles installées à Ouagadougou se déclarant communautaires.

**[P]** Cette dernière faiblesse est instructive : **le label « communautaire » est déjà l'objet d'une capture**. Toute fédération numérique adossée aux radios devrait donc être accompagnée d'un dispositif de vérification, sous peine de reproduire le même détournement à l'échelle numérique.

---

### 3.11 Anthropologie religieuse

**Ce que la discipline établit**

**[O]** Le Burkina Faso est un pays de pluralisme religieux ancien, avec une majorité musulmane, une minorité chrétienne substantielle et une présence continue des religions traditionnelles, souvent au sein des mêmes familles. La coexistence interreligieuse est un élément fort de l'identité nationale et fait l'objet de programmes explicites de dialogue, qui mobilisent d'ailleurs la parenté à plaisanterie (point 3.1).

**[O]** Les communautés religieuses sont des structures d'organisation sociale de premier plan : elles rassemblent, informent, entraident et arbitrent.

**Ce que cela impose**

- **[R]** Le v0.1 mentionne les communautés religieuses avec la réserve « sous réserve du cadre juridique et de gouvernance applicable ». Cette prudence est justifiée mais insuffisamment spécifiée. Deux risques distincts doivent être séparés :
  1. **risque de contenu** : diffusion de discours d'incitation, dans un contexte où le conflit armé a une dimension religieuse instrumentalisée ;
  2. **risque de données** : l'appartenance religieuse est une donnée sensible au sens de la loi n°001-2021, et **inférable** à partir de l'appartenance à des groupes, des horaires d'activité, ou des contacts. Voir le point 4.1.
- **[P]** Les structures religieuses sont, comme les radios, des institutions de confiance préexistantes. Elles constituent un vecteur d'adoption puissant — et pour la même raison, un vecteur de fracture si le système paraissait en favoriser une.

---

### 3.12 Études de genre

**Ce que la discipline établit**

**[F]** En Afrique subsaharienne, l'écart de genre dans l'adoption de l'internet mobile est passé de 30 % en 2024 à **26 % en 2025** ; environ 230 millions de femmes y restent non connectées. L'écart d'équipement en téléphone est de l'ordre de 7 % et celui d'équipement en téléphone intelligent d'environ 13 % dans les pays à revenu faible et intermédiaire.

**[F]** Donnée décisive : en Afrique subsaharienne, **71 % des femmes possèdent un téléphone mais seulement 32 % possèdent un téléphone intelligent**. L'écart n'est pas d'abord un écart de connexion, c'est un écart d'appareil.

**[F]** Lorsque les femmes possèdent un téléphone intelligent, leur taux d'adoption de l'internet mobile rejoint presque celui des hommes. **La barrière principale identifiée en Afrique subsaharienne est l'accessibilité financière du terminal**, davantage que la littératie — contrairement à l'Asie du Sud, où la littératie domine.

**Ce que cela impose**

- **[I] Invariant candidat I-15 :** le système doit fonctionner pleinement sur un téléphone d'entrée de gamme et, si possible, offrir un mode dégradé fonctionnel sur téléphone non intelligent. Sans cela, il exclut structurellement la majorité des femmes du pays. Ce n'est pas une question d'inclusion déclarative : c'est un facteur d'échec de l'effet réseau, puisque les femmes sont au centre des réseaux familiaux.
- **[R] Risque de sécurité spécifique et sous-estimé :** dans un contexte de partage d'appareil et de normes sociales de contrôle, les fonctions de « présence », d'« accusé de lecture », de statut en ligne, de localisation et d'historique visible peuvent **exposer des femmes à la surveillance domestique**. Ces fonctions, listées sans réserve au point 6.1 du v0.2, doivent faire l'objet d'une analyse de risque de genre avant toute implémentation.
- **[P]** Symétriquement : un système conçu pour l'appareil partagé, avec sortie rapide, notifications discrètes et compartimentation, offrirait aux femmes une garantie que les plateformes dominantes n'offrent pas. C'est un candidat sérieux d'usage non servi.

**Hypothèses falsifiables**

- **H-19 :** au Burkina Faso, la crainte d'être vue par un tiers ayant accès à l'appareil est un frein déclaré à l'usage des messageries par les femmes, à un taux mesurable. *Testable par enquête, avec un protocole d'enquête non mixte.*

---

### 3.13 Science politique et gouvernance des communs

**Ce que la discipline établit**

**[O]** Les travaux sur la gouvernance des ressources communes (E. Ostrom) identifient des principes récurrents des systèmes durables : frontières claires de la communauté, règles adaptées aux conditions locales, participation des usagers à l'élaboration des règles, surveillance par des acteurs redevables, **sanctions graduées**, mécanismes de résolution des conflits accessibles et peu coûteux, reconnaissance du droit de la communauté à s'organiser, et **organisation en niveaux emboîtés** pour les grands systèmes.

**[O]** Ce cadre est directement applicable à la question de gouvernance du point 9 du v0.2, et il **départage les six modèles institutionnels proposés** de manière plus rigoureuse qu'une comparaison qualitative. Les modèles E (fédération) et D (structure indépendante d'intérêt national) sont ceux qui se prêtent le mieux à une gouvernance polycentrique ; le modèle A (entreprise privée nationale) est celui qui s'y prête le moins, sans être disqualifié pour autant.

**[O]** Le Burkina Faso dispose en outre d'institutions de délibération et de résolution des différends endogènes — la palabre, les autorités coutumières, les mécanismes d'alliance (point 3.1) — dont la révision constitutionnelle de décembre 2023 prévoyait par ailleurs l'institution de mécanismes traditionnels et alternatifs de règlement des différends.

**Ce que cela impose**

- **[I] Invariant candidat I-16 :** les sanctions de modération doivent être **graduées et réversibles**, avec un recours accessible. La suppression pure et simple, invisible et sans explication, est le modèle des plateformes dominantes ; c'est aussi celui qui détruit le plus rapidement la confiance dans un système national, où l'utilisateur ne peut pas partir ailleurs.
- **[I] Invariant candidat I-17 :** la gouvernance doit être **emboîtée** : ce qui peut être arbitré à l'échelle d'un cercle ou d'une communauté ne doit pas remonter à une instance nationale. Une instance nationale unique de modération pour 24 millions de personnes est irréaliste opérationnellement et dangereuse politiquement.

**La question de la confiance — traitée comme contrainte d'ingénierie**

Il faut poser ce point avec précision et sans prendre parti sur le fond politique.

**[F]** Le contexte est celui d'une transition militaire, marquée par une crise sécuritaire majeure. Des organisations internationales de défense des droits humains documentent des restrictions à l'égard des médias, de l'opposition et de la société civile ; les autorités mettent en avant les impératifs de sécurité nationale et la souveraineté. Ces appréciations divergent et ce document n'a pas à les trancher.

**Ce qui, en revanche, relève de l'ingénierie et n'est pas une opinion politique :**

> **[I] Invariant candidat I-18 :** l'adoption d'une plateforme de communication dépend de la croyance des utilisateurs qu'elle ne sera pas utilisée contre eux. Cette croyance est un paramètre du système, pas de l'environnement. Elle se construit par des propriétés vérifiables — chiffrement de bout en bout dont l'opérateur ne détient pas les clés, minimisation démontrable, transparence publiée des demandes d'accès, audit indépendant, gouvernance pluraliste — ou elle ne se construit pas.

Les précédents comparatifs vont dans le même sens : les plateformes nationales qui ont réussi (Zalo, KakaoTalk) l'ont fait comme entreprises résolvant des problèmes pratiques, pas comme substituts promus contre des plateformes étrangères ; celles qui ont été poussées comme alternatives officielles à des services bloqués ont, dans plusieurs pays, échoué à gagner la confiance des utilisateurs.

**Recommandation méthodologique :** cette question ne doit pas être traitée en fin de dossier, dans un chapitre de gouvernance. Elle doit être **mesurée dès la première enquête** : ce que les Burkinabè déclarent craindre, ce qu'ils font effectivement pour se protéger, et à quelles institutions ils accordent leur confiance. C'est une donnée d'entrée de la conception.

---

### 3.14 Droit, éthique et gouvernance des données

**Ce que la discipline établit** — voir le point 2.7 pour le cadre national.

**Points spécifiques**

- **[R] Le consentement éclairé est problématique en contexte de faible littératie.** Une politique de confidentialité écrite en français n'informe personne. Un consentement recueilli par une case à cocher n'est pas un consentement au sens de la loi n°001-2021, qui exige qu'il soit spécifique, libre, éclairé et non équivoque. **[P]** Un dispositif de consentement **audio, en langue nationale, par étapes, avec vérification de compréhension** est un objet de recherche à part entière et un livrable possible d'intérêt national — utile bien au-delà de ce projet.
- **[R] Inférence de données sensibles :** la loi protège les données sensibles collectées. Le risque réel d'un réseau social est ailleurs : ces données ne sont pas collectées, elles sont **déduites**. Langue d'usage + graphe de contacts + localisation + horaires d'activité + appartenance à des groupes suffisent à inférer, avec une bonne fiabilité, l'origine ethnique, la religion, l'orientation politique et la situation de déplacement.
- **[P] Souveraineté des données collectives :** les documents v0.1 et v0.2 envisagent une fonction d'archivage du patrimoine culturel. Le droit des données personnelles ne couvre pas le cas d'un savoir, d'un récit ou d'une musique appartenant à une communauté et non à un individu. Des cadres existent pour cela — les principes dits CARE de gouvernance des données autochtones : bénéfice collectif, autorité de contrôle de la communauté, responsabilité, éthique. Ils devraient être étudiés en complément des principes d'ouverture usuels.

---

### 3.15 Santé publique, psychologie de la rumeur, bien-être

**Ce que la discipline établit**

**[O]** La propagation d'une rumeur est classiquement modélisée comme fonction de son **importance** pour le public et de l'**ambiguïté** de la situation. Un contexte de conflit armé, d'accès limité à l'information vérifiée et de déplacement massif maximise les deux termes simultanément.

**[O]** La recherche menée auprès des personnes déplacées burkinabè établit à la fois leur vulnérabilité accrue à la désinformation et l'efficacité de la radio comme source jugée fiable en contexte d'incertitude.

**Ce que cela impose**

- **[R] Risque de premier rang :** un système social national déployé dans ce contexte **accélérerait la circulation des rumeurs** avant d'améliorer la qualité de l'information, sauf conception explicitement contraire. Ce risque est plus grave ici que dans un pays en paix, parce que les rumeurs peuvent porter sur la sécurité de villages, l'identification de personnes, ou l'appartenance communautaire.
- **[I] Invariant candidat I-19 :** dans ce contexte, **la vitesse de diffusion doit être un paramètre de conception, pas une performance à maximiser.** Limites de retransmission, traçabilité de l'origine d'un contenu, friction délibérée sur le partage massif, et priorité donnée aux sources locales identifiées sont des mécanismes à évaluer.
- **[R]** Le bien-être numérique : dans une population dont plus de 40 % est mineure, les questions de protection de l'enfance, d'exposition à des contenus violents (dans un pays en conflit, les images circulent) et de santé mentale ne sont pas des préoccupations importées. Elles sont immédiates.

---

### 3.16 Patrimoine, mémoire et anthropologie du numérique

**[O]** Le point 17 du v0.2 envisage une dimension culturelle et note justement qu'elle « ne doit pas être artificiellement ajoutée » et « doit émerger d'un besoin réellement observé ». Cette prudence est bonne.

**[P]** Un besoin observable existe pourtant : dans un pays où des villages ont été vidés et des populations déplacées, la mémoire des lieux, des récits et des personnes est en train de se perdre matériellement. La documentation audiovisuelle communautaire répond à un besoin réel, non à une ambition patrimoniale abstraite.

**[R]** Mais un enregistrement du patrimoine oral d'un village est simultanément : une ressource culturelle, un corpus d'entraînement linguistique de grande valeur, et une base de données de personnes identifiables dans une zone de conflit. Les trois usages ne peuvent pas être gouvernés par la même règle. Voir le point 3.14 et point 4.1.

---

### 3.17 Anthropologie du design et méthodes participatives

**Ce que la discipline établit**

**[O]** La recherche en technologies pour le développement a produit un corpus de leçons méthodologiques, souvent apprises par l'échec : les solutions conçues à distance échouent ; les pilotes réussissent et ne passent jamais à l'échelle ; la recherche extractive — venir collecter des données, repartir, publier — dégrade durablement la disponibilité des terrains ; la maintenance locale est le facteur limitant plus souvent que la conception.

**[F]** Un précédent directement pertinent existe au Burkina Faso : le programme **W4RA** (Vrije Universiteit Amsterdam) a mené pendant plus d'une décennie de la recherche-action socio-technique de terrain en Afrique de l'Ouest, avec des partenaires locaux dont le **Réseau MARP au Burkina Faso**, et a développé la plateforme **Kasadaka** — un système de services vocaux à bas coût, fondé sur un nano-ordinateur et un modem GSM, conçu explicitement pour des contextes sans Internet, avec réseau dégradé ou coût prohibitif, et pour des locuteurs de langues peu dotées.

**[O]** Le raisonnement fondateur de ce programme mérite d'être cité en substance : dans des régions où l'électricité est limitée, Internet absent et la littératie faible, une politique de développement fondée sur le déploiement d'Internet ne produira pas de résultats dans un horizon prévisible — ce qui ne signifie pas que rien ne peut être fait, mais qu'il faut construire des services adaptés plutôt que transférer une technologie.

**Ce que cela impose**

- **[I] Invariant candidat I-20 :** la recherche de terrain doit être conduite **par des chercheurs burkinabè, avec des institutions burkinabè, et les données doivent rester au Burkina Faso.** C'est une exigence de cohérence : un projet de souveraineté numérique dont la connaissance fondatrice serait produite et détenue à l'extérieur serait souverain en apparence seulement.
- **[P]** Kasadaka fournit un précédent technique concret pour l'hypothèse H-10 (point 3.3) : des services vocaux utiles sont réalisables **sans Internet et sans reconnaissance vocale**, sur le réseau GSM existant. Cela ouvre une voie d'expérimentation rapide et bon marché, très en amont de l'architecture lourde envisagée au point 10 du v0.2.

---

## 4. Ce que les sciences humaines interdisent

Cette section est la plus importante du document. Les point 1 à point 3 produisent des idées ; celle-ci produit des contraintes non négociables. Une interdiction correctement identifiée à ce stade vaut plus qu'une fonctionnalité brillante.

### 4.1 Interdiction n°1 — ne pas construire un graphe permettant l'inférence ethnique

**Le fait.** Le Burkina Faso traverse un conflit armé dans lequel l'appartenance communautaire est instrumentalisée. Des organisations de défense des droits humains documentent des exactions visant en particulier des civils peuls, accusés collectivement de soutenir des groupes armés, ainsi que des déplacements forcés de populations. Ces documentations sont contestées par les autorités ; ce document ne prend pas position sur les faits allégués.

**Le raisonnement d'ingénierie, indépendant de cette controverse.** Un système social national concentrerait, sur l'ensemble de la population :

- le graphe des relations interpersonnelles ;
- la langue effectivement parlée par chacun ;
- la localisation et la mobilité ;
- l'appartenance à des groupes ;
- des enregistrements vocaux permettant l'identification du locuteur et souvent de sa langue.

Ces cinq éléments réunis constituent, **quelles que soient les intentions de ses concepteurs**, un instrument permettant d'identifier et de localiser des groupes de population par appartenance présumée. Aucune politique interne, aucune charte, aucun engagement de gouvernance ne neutralise cette propriété : ce qui existe techniquement peut être exigé légalement, obtenu par compromission, ou hérité par une équipe future.

**[I] Invariant candidat I-21 — invariant de non-construction :**

> Le système ne doit pas être capable de produire une classification communautaire de sa population, y compris par inférence. Cette propriété doit être garantie par l'architecture — par ce qui n'est pas stocké, pas relié, pas centralisé — et non par une règle d'usage.

Conséquences concrètes à étudier :
- pas de champ d'appartenance ethnique, même facultatif, même déclaratif ;
- la langue est un attribut de message, jamais un attribut de profil persistant et interrogeable (cohérent avec I-07) ;
- le graphe social complet ne doit pas être interrogeable par requête transversale, même en interne ;
- la localisation doit être grossière, éphémère, et optionnelle ;
- chiffrement de bout en bout pour les communications interpersonnelles, avec des clés que l'opérateur ne détient pas ;
- les journaux techniques doivent avoir des durées de rétention courtes et vérifiables.

**Ce point doit figurer dans le modèle de menace (« threat model », livrable 7 du v0.2) au premier rang, avant les menaces techniques externes.**

### 4.2 Interdiction n°2 — ne pas modérer hors contexte relationnel

Voir le point 3.1. Un classifieur de contenu appliqué à des échanges de parenté à plaisanterie produira des faux positifs massifs, culturellement aveugles et perçus comme discriminatoires. **Une modération automatique en mooré, dioula ou fulfulde, entraînée sans corpus local annoté par des locuteurs, ne doit pas être déployée.** Il vaut mieux ne pas modérer automatiquement que modérer mal dans une langue que le système ne comprend pas.

### 4.3 Interdiction n°3 — ne pas confondre l'utilisateur, l'appareil et le numéro

Voir le point 3.7 et point 3.12. Tant que le taux réel de partage d'appareil n'est pas mesuré, toute conception postulant « un appareil = une personne » est une hypothèse non vérifiée traitée comme un fait. Si le partage est aussi répandu que la littérature régionale le suggère, cette confusion produirait simultanément une exclusion (les femmes surtout) et un risque de sécurité (exposition domestique).

### 4.4 Interdiction n°4 — ne pas construire une hiérarchie de navigation profonde

Voir le point 3.5. Résultat expérimental établi, réplicable à faible coût, et qui invalide la quasi-totalité des conventions d'interface héritées.

### 4.5 Interdiction n°5 — ne pas traiter la vitesse de diffusion comme une performance

Voir le point 3.15. Dans un contexte de conflit et de forte ambiguïté informationnelle, la viralité n'est pas une métrique de succès, c'est une surface de risque.

### 4.6 Interdiction n°6 — ne pas conduire la recherche fondatrice à l'extérieur

Voir le point 3.17. Incohérence de principe, et perte de la capacité nationale que le projet prétend construire.

---

## 5. Primitives sociales candidates issues du contexte burkinabè

Cette section propose des objets de conception dérivés d'institutions **observées au Burkina Faso**, et non traduits de plateformes étrangères. Ce sont des **candidats d'expérimentation**, marqués **[P]**. Chacun est accompagné du risque de trahison de l'institution qu'il mobilise — car formaliser une institution vivante dans du logiciel la modifie toujours.

### 5.1 Le *cercle* (à partir du *grin*) — remplace « le groupe »

**[P]** Objet social persistant caractérisé par : un ancrage (un lieu, un village d'origine, une cour, un établissement), une ancienneté explicite des membres, une autorité interne reconnue et révisable, une mémoire propre, et une règle d'entrée décidée par le cercle lui-même.

**Ce qu'il remplace :** le « groupe » plat des messageries, sans lieu, sans histoire, sans légitimité interne.
**Risque de trahison :** rigidification de la hiérarchie d'ancienneté (point 3.2). Exige un mécanisme de renégociation.

### 5.2 L'*alliance déclarée* (à partir du *rakiré*) — remplace le filtre de contenu global

**[P]** Relation **dyadique, déclarative, réversible et locale** entre deux personnes ou deux cercles, qui modifie le seuil d'interprétation de leurs échanges mutuels. Aucune donnée d'appartenance n'est stockée ; seule la relation l'est, et seulement entre les parties concernées.

**Ce qu'il remplace :** la modération de contenu hors contexte.
**Risque de trahison :** transformation d'une institution collective en fonctionnalité individuelle ; usage abusif pour légitimer du harcèlement sous couvert d'alliance. Exige un mécanisme de retrait unilatéral immédiat.

### 5.3 La *palabre* (à partir des mécanismes endogènes de règlement des différends) — remplace le recours opaque

**[P]** Procédure de recours **délibérative, lisible et graduée** : le litige est examiné à l'échelle où il est né (cercle, communauté locale), par des personnes identifiées et redevables, avec explication motivée et possibilité d'escalade. Cohérent avec I-16 et I-17, et avec l'orientation constitutionnelle en faveur des mécanismes traditionnels et alternatifs de règlement des différends.

**Ce qu'il remplace :** la suppression automatique sans explication et le formulaire d'appel sans réponse.
**Risque de trahison :** reproduction des rapports de pouvoir locaux au détriment des femmes, des jeunes et des minorités. Exige une voie de recours alternative garantie.

### 5.4 La *tontine d'infrastructure* — remplace la subvention pure

**[P]** Financement par contribution rotative d'une communauté pour une ressource partagée : stockage local, relais de quartier, énergie, appareil partagé. Institution déjà légitime, déjà comprise, déjà gouvernée.

**Ce qu'il remplace :** le zero-rating comme unique levier économique — dont l'échec est documenté (point 1.1).
**Risque de trahison :** création d'une dette sociale envers un opérateur technique ; exclusion des plus pauvres. Exige que la contribution ne conditionne pas l'accès aux fonctions essentielles.

### 5.5 La *radio augmentée* — la piste principale recommandée à l'étude

**[P]** C'est l'hypothèse la plus forte du présent document, et celle à explorer en priorité.

Le Burkina Faso possède déjà une infrastructure sociale nationale décentralisée, multilingue, ancrée localement, dotée d'un régime d'autorisation et jouissant d'une confiance mesurée : le réseau des radios de proximité (point 2.5, point 3.10).

**Proposition d'étude :** ne pas construire une plateforme sociale à côté de cet écosystème, mais **sa couche numérique** :

- chaque radio devient un **nœud** : identité locale, langue locale, animateurs connus, autorité éditoriale existante ;
- les auditeurs contribuent en **audio** — messages vocaux, annonces, questions, témoignages — depuis un téléphone simple, y compris sans Internet, en s'appuyant sur des dispositifs de type Kasadaka déjà éprouvés dans la région ;
- l'antenne reste le canal de diffusion de masse ; le numérique ajoute la **persistance, la recherche, l'adressage et la conversation** ;
- la fédération entre nœuds fournit l'échelle nationale sans centralisation du graphe — ce qui satisfait simultanément I-17 (gouvernance emboîtée) et I-21 (non-construction d'un graphe national exploitable).

**Pourquoi cette piste satisfait I-01 (terrain non occupé) :** elle ne demande à personne de quitter WhatsApp. Elle numérise une relation qui existe déjà et que les plateformes dominantes ne servent pas : la relation entre une communauté locale, sa radio et son territoire — en langue nationale, en audio, à faible débit.

**Risques à instruire sérieusement :** modèle économique des radios déjà fragile (point 3.10) ; capture du label communautaire ; capacité technique et de maintenance des stations ; responsabilité éditoriale ; et la question, non triviale, de savoir si une radio veut réellement devenir un opérateur de plateforme.

### 5.6 Le *lien de diaspora* — candidat d'usage non servi

**[P]** Le corridor Burkina–Côte d'Ivoire et l'ensemble des liens diaspora/famille constituent un flux affectif et économique de premier plan (point 2.6). Les usages associés — envoi de nouvelles, coordination familiale, participation à distance à des cérémonies, transfert de fonds, arbitrage de décisions familiales — sont aujourd'hui répartis entre plusieurs outils qui ne les servent aucun bien.

**À instruire :** est-ce un usage réellement mal servi (I-01), ou seulement un usage important déjà couvert par WhatsApp et les services de transfert existants ? C'est une question empirique, pas une question de conviction.

### 5.7 La *synchronisation de proximité* — différenciateur architectural

**[P]** Transfert et synchronisation de contenus entre appareils proches, sans réseau, en s'appuyant sur une pratique déjà existante (point 3.7). Résout un problème réel — coût des données, couverture inégale, coupures — que les plateformes dominantes ne traitent pas, et converge avec l'exigence de résilience du point 13 du v0.2.

---

## 6. Invariants candidats issus des sciences humaines

Récapitulatif. Ces invariants sont des **propositions à valider**, non des exigences arrêtées. Ils complètent, et parfois contredisent, la liste du point 30 du dossier v0.2.

| Réf. | Invariant candidat | Source |
|---|---|---|
| I-01 | Loi du terrain non occupé : ne pas concurrencer l'installé sur son usage | point 1.4 |
| I-02 | Les langues nationales sont un prérequis d'architecture, pas une couche de traduction | point 2.3 |
| I-03 | L'identité ne peut être attachée à un lieu fixe | point 2.6 |
| I-04 | Le contexte relationnel est un attribut du message | point 3.1 |
| I-05 | L'unité sociale de base est le cercle persistant et ancré, pas l'individu ni l'ami | point 3.2 |
| I-06 | Tolérance orthographique et phonétique obligatoire en langues nationales | point 3.3 |
| I-07 | La langue est un attribut du message et de la relation, pas du compte | point 3.3 |
| I-08 | L'audio est le mode principal ; le texte est le mode d'accessibilité | point 3.4 |
| I-09 | Proscription de la hiérarchie de navigation profonde | point 3.5 |
| I-10 | Tout parcours critique réalisable sans lire | point 3.5 |
| I-11 | L'adoption ne se subventionne pas | point 3.6 |
| I-12 | Dissocier identité, appareil et numéro | point 3.7 |
| I-13 | L'usage intermédié est un mode conçu, pas un contournement | point 3.7 |
| I-14 | Ne pas fonder la structure sociale sur le découpage administratif | point 3.9 |
| I-15 | Fonctionnement plein sur téléphone d'entrée de gamme | point 3.12 |
| I-16 | Sanctions graduées, réversibles, avec recours accessible | point 3.13 |
| I-17 | Gouvernance emboîtée, arbitrage au niveau le plus local possible | point 3.13 |
| I-18 | La confiance est un paramètre du système, construit par des propriétés vérifiables | point 3.13 |
| I-19 | La vitesse de diffusion est un paramètre de conception, pas une performance | point 3.15 |
| I-20 | Recherche fondatrice conduite et détenue au Burkina Faso | point 3.17 |
| I-21 | Invariant de non-construction : pas de classification communautaire possible, même par inférence | point 4.1 |

**Tensions à arbitrer explicitement** — ces invariants ne sont pas tous compatibles :

- **I-08 (audio principal) contre I-19 (limiter la diffusion) et la modération :** l'audio est le format le plus difficile à modérer et le plus coûteux à stocker. Un système audio-first en contexte de conflit est un système difficile à sécuriser.
- **I-21 (pas de graphe exploitable) contre I-04 (contexte relationnel) :** la modération contextuelle exige de connaître des relations que l'invariant de non-construction interdit de centraliser. La sortie possible est la localité stricte de l'information relationnelle, mais elle limite les capacités de détection à l'échelle.
- **I-11 (pas de subvention seule) contre I-15 (accessibilité de l'appareil) :** la barrière principale identifiée est le prix du terminal, qui appelle précisément une subvention. La distinction utile est entre subventionner l'**accès** (utile, insuffisant) et subventionner l'**usage** (inefficace).
- **I-17 (gouvernance emboîtée) contre la cohérence de l'expérience :** la fédération complique l'identité, la recherche et la modération, comme le note justement le point 11 du v0.2.

**Ces tensions ne se résolvent pas par arbitrage de bureau. Elles doivent être instruites par prototypes concurrents.**

---

## 7. Programme d'enquête

### 7.1 Principe

Le dossier v0.2 propose au point 35 un ordre de travaux qui commence par « comprendre les usages réels ». C'est correct. Ce qui manque est le **détail opérationnel** de cette première étape, sans lequel elle risque de se réduire à quelques ateliers à Ouagadougou.

### 7.2 Trois vagues

**Vague 1 — Réplication expérimentale (2 à 3 mois, coût faible)**

Objet : établir les paramètres cognitifs et d'équipement, par des protocoles déjà publiés et validés ailleurs.

- Réplication du protocole hiérarchie contre liste plate, en mooré et en dioula, échantillon stratifié par scolarisation, sexe et milieu (H-13, H-14).
- Mesure du partage d'appareil, par sexe et milieu (H-16) — **la donnée manquante la plus importante du dossier**.
- Mesure du ratio vocal/écrit dans les usages existants (H-11).
- Mesure de la confiance déclarée envers différents types d'institutions et de canaux (point 3.13).

Cette vague est peu coûteuse, rapide, et produit des résultats qui conditionnent toute la conception. **Elle devrait être lancée avant toute autre étude du programme.**

**Vague 2 — Ethnographie et cartographie sociale (6 à 9 mois)**

- Ethnographie des *grins* et des groupes numériques existants dans au moins quatre sites contrastés : un quartier de Ouagadougou, un quartier de Bobo-Dioulasso, une commune rurale non affectée par le déplacement, une zone d'accueil de personnes déplacées ou de retour.
- Ethnographie du corridor migratoire vers la Côte d'Ivoire, des deux côtés.
- Enquête auprès des radios de proximité : pratiques, ressources, rapport au numérique, appétence pour un rôle de nœud (point 5.5).
- Enquête de genre en protocole non mixte (H-19).
- Audit anthropologique d'un corpus de signalements et d'échanges en langues nationales (H-05).

**Vague 3 — Prototypes concurrents et mesure (9 à 12 mois)**

Le point 26-G du v0.2 propose déjà des prototypes concurrents. Ce document précise qu'ils doivent tester des **hypothèses sociales**, pas des périmètres fonctionnels :

| Prototype | Hypothèse testée |
|---|---|
| Cercle ancré vs groupe plat | H-08 (point 3.2) |
| Service vocal sans Internet, type Kasadaka, adossé à une radio | H-03, H-10, point 5.5 |
| Alliance déclarée et modération contextuelle | H-06 (point 3.1) |
| Lien diaspora | H-04, point 5.6 |
| Synchronisation de proximité | H-17 (point 3.7) |

### 7.3 Échantillonnage — exigences minimales

Un échantillon urbain, masculin, scolarisé et connecté produirait exactement le contraire de la connaissance recherchée. Stratification obligatoire sur : milieu (rural / périurbain / urbain), sexe, niveau de scolarisation, statut de déplacement (résident stable / déplacé / retourné), langue première, âge, et **type d'appareil réellement utilisé, possédé ou emprunté**.

### 7.4 Éthique de terrain

- Consentement audio en langue nationale, avec vérification de compréhension (point 3.14).
- **Aucune collecte d'appartenance ethnique ou religieuse**, y compris à des fins de recherche (point 4.1). Si une variable de ce type paraît nécessaire à une analyse, c'est le signe que l'analyse doit être reformulée.
- Données conservées au Burkina Faso, sous responsabilité d'une institution nationale (I-20).
- Déclaration préalable des traitements auprès de la CIL.
- Restitution aux communautés enquêtées, en langue et en format accessibles. Cette obligation n'est pas cosmétique : elle est la contrepartie de la recherche non extractive (point 3.17).

### 7.5 Partenaires nationaux et régionaux mobilisables

**[F]** Ces acteurs existent et ont déjà travaillé sur des objets voisins :

- **INSD** — appareil statistique national ; a conduit avec le HCR une enquête probabiliste auprès des déplacés et des communautés hôtes.
- **CNRST** — a co-dirigé avec l'Université de Sheffield la recherche sur les besoins d'information des personnes déplacées.
- **Universités Joseph Ki-Zerbo et Nazi Boni** — capacité en sciences sociales et en informatique ; des travaux burkinabè sur le traitement de la parole en mooré, dioula et fulfulde ont été présentés dans des cadres scientifiques consacrés aux langues peu dotées d'Afrique subsaharienne.
- **CIL** — autorité de contrôle, à associer en amont.
- **CSC** — régulateur de la communication, détenteur du régime d'attribution des fréquences communautaires.
- **Réseau MARP Burkina Faso** — partenaire de longue date de la recherche-action socio-technique de terrain.
- **Fondation Hirondelle** — expérience documentée de l'information en contexte de crise au Burkina Faso.
- **Réseaux de radios communautaires** et leurs fédérations.
- **Communautés scientifiques ouvertes** (type Masakhane) pour les langues peu dotées, sous réserve de I-20 sur la localisation des données.

### 7.6 Indicateurs et seuils de décision

Le point 27 du v0.2 propose des indicateurs de produit, technique, souveraineté et adoption. Ils sont pertinents mais tous **positifs** : ils mesurent le succès, pas l'échec. Un programme d'étude a besoin de seuils qui déclenchent un arrêt.

Indicateurs complémentaires proposés :

- **Rétention non subventionnée à 90 jours** : rétention mesurée après retrait de toute incitation d'accès. C'est le seul indicateur qui aurait détecté l'échec d'Ayoba avant sept ans.
- **Taux de substitution réelle** : part des interactions qui ont quitté les plateformes existantes, et non qui s'y ajoutent. Un usage additionnel n'est pas une adoption.
- **Densité du réseau égocentré** : nombre de correspondants réellement actifs par utilisateur. Un million d'utilisateurs isolés vaut moins que dix mille cercles complets.
- **Profondeur atteinte par les publics à faible littératie** : part des fonctions accessibles sans lire, effectivement utilisées par ce public.
- **Taux de faux positifs de modération en langues nationales**, mesuré par audit contradictoire.
- **Écart de genre d'usage** au sein du système, comparé à l'écart national.

---

## 8. Risques propres au volet humain

| Réf. | Risque | Gravité | Réponse proposée |
|---|---|---|---|
| RH-1 | Le système devient, par ses données, un instrument de classification communautaire | Critique | I-21, modèle de menace prioritaire (point 4.1) |
| RH-2 | La modération automatique criminalise la parenté à plaisanterie | Élevée | I-04, corpus annoté localement, point 4.2 |
| RH-3 | Accélération de la rumeur en contexte de conflit avant amélioration de l'information | Élevée | I-19, sources locales identifiées, friction sur le partage |
| RH-4 | Exclusion structurelle des femmes par l'appareil et le partage | Élevée | I-12, I-15, enquête non mixte |
| RH-5 | Exposition domestique par les fonctions de présence et de localisation | Élevée | Analyse de risque de genre avant implémentation |
| RH-6 | Répétition du scénario Ayoba : installations subventionnées sans usage | Élevée | I-01, I-11, rétention non subventionnée comme indicateur pivot |
| RH-7 | Déficit de confiance envers l'opérateur, quel qu'il soit | Élevée | I-18, propriétés vérifiables, gouvernance pluraliste |
| RH-8 | Hiérarchie linguistique perçue comme un signal politique | Élevée | Arbitrage par instance non technique, parité de traitement |
| RH-9 | Formalisation logicielle qui rigidifie des institutions vivantes | Moyenne | Réversibilité obligatoire de tous les statuts (point 5) |
| RH-10 | Recherche extractive dégradant durablement l'accès au terrain | Moyenne | I-20, restitution obligatoire |
| RH-11 | Capture du label « communautaire » à l'échelle numérique | Moyenne | Vérification, à l'image du régime d'attribution des fréquences |
| RH-12 | Pilote réussi qui ne passe pas à l'échelle | Moyenne | Tester la maintenance locale dès le prototype, pas la fonctionnalité seule |

---

## 9. Critères d'abandon

Le dossier v0.1 demandait au point 50 des « critères objectifs de validation ou d'abandon ». Voici une première proposition. Elle est délibérément exigeante.

**Le projet devrait être abandonné, ou radicalement réduit, si l'enquête établit que :**

1. **Aucun usage social significatif n'est mal servi.** Si les Burkinabè déclarent et démontrent que leurs besoins de communication, d'expression et de communauté sont couverts par les outils existants, alors la souveraineté seule ne justifie pas la construction d'une plateforme sociale. Elle justifierait éventuellement d'autres investissements — hébergement, identité, interconnexion — mais pas celui-ci.
2. **La rétention non subventionnée d'un prototype ne dépasse pas un seuil fixé à l'avance.** Ce seuil doit être fixé **avant** la mesure, et publié.
3. **L'invariant I-21 ne peut pas être satisfait architecturalement.** S'il s'avère impossible de construire le système sans créer un instrument de classification communautaire exploitable, alors, dans le contexte sécuritaire actuel, le risque excède le bénéfice.
4. **Le coût d'exploitation d'un système audio-first à l'échelle nationale est hors de portée soutenable**, et aucune architecture fédérée ou de proximité ne le ramène dans l'enveloppe.
5. **Les institutions dont la légitimité serait mobilisée refusent d'être mobilisées** — si les radios de proximité, par exemple, ne souhaitent pas devenir des nœuds, la piste point 5.5 tombe et doit être abandonnée plutôt que imposée.

**Réduction plutôt qu'abandon.** Dans plusieurs de ces cas, la conclusion rationnelle n'est pas « ne rien faire » mais « faire beaucoup plus petit » : un service vocal communautaire adossé aux radios, un service de lien diaspora, ou une couche d'identité et d'interopérabilité sans expérience utilisateur propre. Un petit système qui fonctionne est une meilleure démonstration de souveraineté qu'une grande plateforme inutilisée.

---

## 10. Ce que ce document propose de décider maintenant

Rien, sauf la méthode. Trois décisions de procédure seulement :

1. **Lancer la Vague 1 (point 7.2) avant toute autre étude du programme.** Elle est peu coûteuse, rapide, et conditionne l'architecture. Décider d'une architecture avant de connaître le taux de partage d'appareil et la profondeur de navigation utilisable serait construire sur des projections.
2. **Inscrire l'invariant I-21 au premier rang du modèle de menace**, et le traiter comme une contrainte d'architecture et non comme une politique d'usage.
3. **Reformuler la question directrice du programme.** Le v0.2 demande : « Le Burkina Faso peut-il concevoir, opérer et faire adopter un espace social numérique souverain ? » La question que les sciences humaines suggèrent est antérieure :

> **Quelle relation sociale les Burkinabè entretiennent-ils aujourd'hui sans qu'aucun outil ne la serve correctement ?**

Si cette question trouve une réponse empirique solide, l'architecture, l'économie et la gouvernance en découleront. Si elle n'en trouve pas, aucune architecture ne sauvera le projet.

---

## Annexe A — Récapitulatif des hypothèses falsifiables

| Réf. | Hypothèse | Priorité | Méthode |
|---|---|---|---|
| H-01 | L'échec d'Ayoba tient au caractère générique, pas au caractère local | Critique | Enquête d'usage + analyse comparative |
| H-02 | Adoption par diffusion intergénérationnelle descendante | Moyenne | Ethnographie |
| H-03 | La couche numérique des radios est le chemin le plus court | Haute | Enquête radios + prototype |
| H-04 | Le lien diaspora est un usage mal servi | Haute | Enquête corridor CI |
| H-05 | Faux positifs de modération sur la parenté à plaisanterie | Haute | Audit de corpus |
| H-06 | L'alliance déclarée réduit les faux positifs sans accroître les abus | Moyenne | A/B prototype |
| H-07 | Les groupes réels ont une structure de *grin* | Haute | Enquête sur groupes existants |
| H-08 | Le cercle ancré bat le groupe plat en rétention | Haute | Prototype comparatif |
| H-09 | Corpus vocal constituable à coût maîtrisé via les radios | Haute | Étude de coût + pilote |
| H-10 | La reconnaissance vocale n'est pas nécessaire au démarrage | Critique | Prototype vocal sans ASR |
| H-11 | Prédominance du vocal chez les publics à faible littératie | Haute | Journal d'usage consenti |
| H-12 | La réponse vocale accroît la participation | Moyenne | Prototype |
| H-13 | Profondeur hiérarchique navigable ≤ 2 niveaux pour une part importante | Critique | Réplication expérimentale |
| H-14 | La position spatiale stable bat l'icône | Moyenne | Test d'utilisabilité |
| H-15 | L'utilité récurrente bat le divertissement en rétention | Haute | Prototypes concurrents |
| H-16 | Accès féminin majoritairement via appareil non possédé | Critique | Enquête ménages |
| H-17 | Adoption spontanée du transfert de proximité | Moyenne | Prototype |
| H-18 | L'appartenance au village d'origine reste opérante à distance | Moyenne | Enquête migrants |
| H-19 | La crainte d'être vue freine l'usage féminin | Haute | Enquête non mixte |

---

## Annexe B — Glossaire des institutions burkinabè mobilisées

| Terme | Sens |
|---|---|
| *Grin* | Groupe de pairs ancré dans un lieu, réuni autour du thé, à ancienneté ordonnée et autorité interne ; forme majeure de sociabilité urbaine ouest-africaine |
| *Rakiré* (mooré) | Parenté à plaisanterie ; alliance autorisant la moquerie rituelle sans conséquence entre groupes alliés. *Sinankunya* au Mali, *toukpê* en Côte d'Ivoire |
| Palabre | Délibération publique de règlement des différends |
| Tontine | Association d'épargne à contribution rotative, gouvernée par le groupe |
| Radio de proximité | Radio communautaire, associative ou locale, diffusant en langues nationales, sous régime d'autorisation du CSC |
| PDI | Personne déplacée interne |
| CIL | Commission de l'informatique et des libertés, autorité de contrôle des données personnelles |
| CSC | Conseil supérieur de la communication |
| AES | Alliance / Confédération des États du Sahel (Burkina Faso, Mali, Niger) |

---

## Annexe C — Sources principales

**Contexte numérique et connectivité**
- DataReportal / Kepios, *Digital 2026: Burkina Faso* — https://datareportal.com/reports/digital-2026-burkina-faso
- ARCEP Burkina Faso, Observatoire des marchés de la téléphonie mobile et de l'Internet
- GSMA, *Mobile Gender Gap Report 2025* et *2026* — https://www.gsma.com/gender-gap/

**Précédents de plateformes**
- Arrêt d'Ayoba : TechCabal (24/03/2026), MyBroadband (24/03/2026), Businessday NG, Technext, TechFocus24
- Historique et caractéristiques d'Ayoba : communiqués MTN Group
- Zalo : analyses de marché vietnamiennes, données d'usage 2024-2026

**Langues et statut juridique**
- Loi n°045-2023/ALT du 30 décembre 2023 ; révision constitutionnelle du 6 décembre 2023
- LeFaso.net, « Langues officielles et langues de travail : le Burkina Faso invente-t-il un nouveau modèle ? »
- Fasocheck, vérification sur le statut des langues d'enseignement
- Travaux sur les langues peu dotées d'Afrique subsaharienne, dont un corpus mooré / dioula / fulfulde de 8 522 échantillons audio (actes DASSA 2025)
- Recherche sur la transcription du bambara et les corpus de langues mandingues (arXiv 2511.18557)

**Institutions sociales**
- A. J. Sissao, *Alliances et parentés à plaisanterie au Burkina Faso*, Sankofa et Gurli, 2002
- J. Kieffer, « Les jeunes des grins de thé et la campagne électorale à Ouagadougou », *Politique africaine* n°101, 2006
- S. Vincourt & S. Kouyaté, « Ce que "parler au grin" veut dire », *Politique africaine* n°127, 2012
- O. P. Hien, « The Young of the grins de thé and Public Speech Delivery in Burkina Faso », AEGIS 2011

**Médias et information en contexte de crise**
- Fondation Hirondelle / Université de Sheffield (E. Heywood) / CNRST (L. Yaméogo), étude sur les besoins d'information des personnes déplacées internes
- *Radiomorphoses*, « Contribution de radios burkinabè à la prévention de conflits communautaires »
- FAO, Document de politique nationale de la communication pour le développement au Burkina Faso
- AMARC, travaux sur les radios communautaires en Afrique de l'Ouest

**Interfaces et publics peu lettrés**
- I. Medhi, A. Sagar, K. Toyama, « Text-Free User Interfaces for Illiterate and Semi-Literate Users », ICTD 2006
- I. Medhi et al., « Designing Mobile Interfaces for Novice and Low-Literacy Users », CHI 2011
- I. Medhi et al., « A Comparison of List vs. Hierarchical UIs on Mobile Phones for Non-literate Users », INTERACT 2013
- I. Medhi-Thies et al., « KrishiPustak: A Social Networking System for Low-Literate Farmers », MSR India

**Recherche-action et services vocaux en Afrique de l'Ouest**
- W4RA (Vrije Universiteit Amsterdam), programme de recherche-action socio-technique — https://w4ra.org/
- A. Baart et al., plateforme Kasadaka et Voice Service Development Kit
- Partenariat W4RA / Réseau MARP (Burkina Faso)

**Droit et gouvernance**
- Loi n°001-2021/AN du 30 mars 2021 sur la protection des données à caractère personnel
- Traité instituant la Confédération AES, 6 juillet 2024

**Contexte humanitaire et sécuritaire**
- OCHA, plans de réponse humanitaire Burkina Faso
- INSD / HCR, enquête socioéconomique et de protection auprès des PDI et communautés hôtes, T4 2024
- Human Rights Watch, *Rapport mondial 2026*, chapitre Burkina Faso — appréciations contestées par les autorités, citées ici au titre de l'analyse de risque et non comme prise de position

---

## Annexe D — Ce que ce document ne traite pas

Par honnêteté sur ses limites, ce document ne couvre pas :

- l'économie détaillée du stockage et de la bande passante audio à l'échelle nationale (relève du livrable 5 du v0.2) ;
- le droit de la responsabilité des hébergeurs et le régime de coopération avec les autorités judiciaires ;
- la santé mentale et les usages problématiques du numérique chez les adolescents burkinabè, pour lesquels aucune littérature nationale suffisante n'a été trouvée — **[?]** lacune à combler ;
- le handicap et l'accessibilité sensorielle, traités seulement de manière incidente — **[?]** lacune à combler ;
- l'anthropologie des autorités coutumières et leur articulation possible avec une gouvernance de plateforme, sujet sensible qui mérite une étude dédiée ;
- l'état d'avancement réel d'une harmonisation numérique au sein de la Confédération AES.

**Fin du document — Volet 3, version 0.1**
