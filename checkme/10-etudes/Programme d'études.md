---
projet: "checkme"
type: "programme-de-recherche"
phase: "10-etudes"
version: "0.1"
statut: "Document de travail — protocole d'investigation, non normatif"
document_parent: "[[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]]"
doctrine: "Intention d'abord ; preuve ensuite ; le programme doit pouvoir conclure « ne pas construire »"
issues_possibles: "A construire tel que décrit / B périmètre réduit / C construire autre chose / D ne pas construire"
jalon_courant: "Vague 0 en cours — L1 conduit le 2026-09-10 ; L2, L3 et L4 à conduire — jalon 1 au plus tard le 2026-10-31"
variante: "Programme complet"
echeance_jalon_1: 2026-10-31
seuils_preenregistres_le: 2026-09-10
seuils_valides_par_le_porteur_le: 2026-09-10
cree_le: 2026-09-10
tags:
  - checkme
  - etudes
  - protocole-de-recherche
  - non-normatif
---

# Programme d'études

Protocole d'acquisition de preuve exigé par le verdict du premier maillon — point 10 du [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

| Élément | Valeur |
| --- | --- |
| Statut | Document de travail — protocole d'investigation, **non normatif** |
| Nature | Lots, méthodes, terrains, jalons, **seuils pré-enregistrés** |
| Ce que le document ne constitue pas | Ni plan de développement, ni cahier des charges, ni engagement de construction |
| Conduite | Une seule personne, le porteur, sans accès privilégié au terrain et sans budget d'enquête — point 3 du document fondateur, `I6` |
| Échéance extérieure au programme | Aucune. Le jalon 1 est plafonné au **2026-10-31** par le verdict du premier maillon |
| Corpus hérité | En [[checkme/99-sources/Sources originales\|99-sources]], **référence non opposable** |

---

## 1. Ce que le programme doit permettre de conclure

| Issue | Contenu |
| --- | --- |
| **A. Construire tel que décrit** | Le coût d'accès est réel dans plusieurs catégories de publication, aucune n'est servie, et une autorité peut recevoir une plateforme commune à plusieurs émetteurs — typiquement le ministère chargé de la transition digitale |
| **B. Périmètre réduit** | Le coût est réel dans une seule catégorie, ou pour un seul émetteur — typiquement l'accès individuel aux résultats des concours de l'État, présenté au ministère chargé de la fonction publique |
| **C. Construire autre chose** | La difficulté réelle n'est pas de trouver sa ligne dans une liste, mais de **trouver la liste**, de **s'y fier** ou d'**y accéder** sans connexion suffisante. Le produit change d'objet ; le recouvrement avec `infUb` doit alors être porté à la [[Cartographie du portefeuille]] |
| **D. Ne pas construire** | Le besoin est déjà servi ; ou le coût d'accès n'est pas observable ; ou l'émetteur peut ajouter lui-même la consultation individuelle à son dispositif, et une cession n'a plus d'objet |

> [!important] Règle de survie du programme
> L'issue **D** doit rester atteignable jusqu'au jalon 3. Deux pressions s'y opposent. Le **corpus hérité**, prêt à coder, fait paraître l'abandon coûteux ; ce coût déjà engagé n'est pas un argument. L'**intention de présenter un produit à un ministère** fait paraître l'étude comme un préalable à franchir ; elle n'est pas un argument non plus. Aucune note de jalon ne peut invoquer l'un ou l'autre.

---

## 2. Le socle — ce qui est déjà établi, et ce qui ne l'est pas

| # | Acquis | Statut et grade | Source |
| --- | --- | --- | --- |
| `S1` | Les concours de l'État disposent d'un dispositif numérique officiel : l'Agence générale de recrutement de l'État (AGRE) exploite `concours.gov.bf`, les candidatures sont reçues en ligne par la plateforme `e-concours`, et les résultats de présélection sont publiés *« par centre et par ordre de numéro récépissé »* | Fait, `N1` | Fait `F10` du [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]] |
| `S2` | Selon le porteur, `e-concours` permet seulement de postuler et de recevoir son récépissé, sans consultation individuelle du résultat | **Déclaration à confirmer** — `L1` la réexamine | Fait `F13` |
| `S3` | La loi n°001-2021/AN encadre le traitement des données à caractère personnel ; son autorité de contrôle est la Commission de l'informatique et des libertés (CIL) | Fait, `N1` | Faits `F3` et `F12` |
| `S4` | Le ministère chargé de la fonction publique est dénommé Ministère des Serviteurs du Peuple depuis janvier 2026 ; le ministère chargé de la transition digitale est le Ministère de la Transition digitale, des Postes et des Communications électroniques | Fait, `N1` | Fait `F11` |
| `S5` | La plateforme universitaire nationale `campusfaso.bf` présente au 2026-09-08 neuf rubriques publiques, dont *Orientations* et *Liste candidature* | Fait, `N1`. **Non établi** : qu'elle permette la consultation individuelle d'un résultat d'orientation | [[Relevé du périmètre CampusFaso]], lot `L7a` d'`ecoFab` |
| `S6` | Consultation contextualisée, identifiant faible jamais seul, résultat *trouvé*, *ambigu* ou *aucun* | **Principes de conception**, non résultats | Point 6 du document fondateur |

**Ce que le socle n'établit pas** : une seule observation d'une personne concernée ; un volume ; un temps ou un coût d'accès ; l'intention d'une quelconque autorité ; le cadre juridique d'une démonstration sur données réelles.

---

## 3. Règles communes à tous les lots

### 3.1. Échelle de preuve

Le programme emploie l'échelle `N0` à `N4` du point 1.2 du document fondateur, dans laquelle **`N4` est le plus fort** : `N1` source publique ou mesure de l'objet, `N2` déclaration directe de la personne concernée, `N3` comportement observé de cette personne, `N4` engagement coûteux et irréversible.

> [!warning] Deux échelles coexistent dans le coffre, et elles sont inversées
> Les programmes d'études de `levelup`, `maSecure` et `payMe` emploient une échelle de niveaux 1 à 4 dans laquelle **le niveau 1 est le plus fort**. Toute mention d'un niveau de preuve dans le présent programme relève de l'échelle `N0` à `N4`.

### 3.2. Application de la règle `D3`

| Obligation | Application au présent programme |
| --- | --- |
| **a. Pré-enregistrement** | Tous les seuils ci-dessous sont écrits et datés le **2026-09-10**, avant toute collecte. Les faits `S1` et `S2` sont antérieurs : ils ont été établis en vérifiant des dénominations, non en conduisant un lot, et `L1` les réexamine sans les tenir pour acquis |
| **b. Matériau brut conservé** | Les commentaires relevés en `L3` et les verbatims de `L5` sont conservés bruts, anonymisés, **séparément de leur codage** |
| **c. Aucun vocabulaire du projet** | Les guides d'entretien et les consignes de relevé n'emploient ni le nom du projet, ni les mots *plateforme*, *application*, *consultation*, *identifiant*, *saisir*, *point d'accès unique* |
| **d. Comptage des infirmations** | Chaque lot rapporte le nombre d'observations qui **contredisent** l'hypothèse qu'il teste. Un lot sans aucune infirmation est signalé comme suspect dans la note de jalon |

**Nature des valeurs chiffrées.** Toutes les valeurs des seuils — pourcentages, durées, volumes, effectifs — sont des **conventions posées avant la collecte**, non des calibrages : aucune mesure antérieure n'existe pour les fonder. Leur fonction est d'interdire qu'une barre soit placée après avoir vu le résultat.

### 3.3. Règles propres à ce projet

1. **Aucune liste nominative n'entre dans le coffre.** Les listes examinées contiennent des noms et des numéros de milliers de personnes. Seules leurs **métadonnées** sont relevées — format, taille, nombre de pages et de lignes, identifiant employé, canal, date. Aucun nom, aucun numéro de récépissé, aucune ligne n'est recopié.
2. **Les échantillons sont tirés selon une règle écrite d'avance**, jamais par commodité : les publications les plus récentes du canal officiel de chaque catégorie, à la date de collecte.
3. **Chaque lot déclare qui peut le conduire.** *À distance* : sur sources publiques, sans téléphone ni présence. *Par le porteur* : exige un téléphone, une connexion mobile, l'accès à des pages de réseau social ou une présence sur le territoire.

---

## 4. Lots de travail

Chaque lot porte sa question, sa méthode, sa sortie et ses **seuils pré-enregistrés**.

> [!note] Deux lots portés dès l'origine, par doctrine
> La règle `D2` de la [[Doctrine du coffre]] impose un lot **actif** et un lot **payeur** dès la première version d'un programme. Ce sont `L7` et `L8`.

### 4.1. Vague 0 — ce qui peut conclure sans autorisation ni dépense

#### `L1` — État de l'art et cimetière

| Champ | Contenu |
| --- | --- |
| **Question** | Pour chaque catégorie de publication nominative, existe-t-il déjà un moyen, officiel ou privé, par lequel une personne obtient sa propre situation à partir d'un identifiant ? Quels dispositifs de ce type se sont arrêtés, et pourquoi ? |
| **Pourquoi en premier** | C'est la condition de fausseté 2 du document fondateur — *la place est prise*. C'est le test le moins coûteux qui décide le plus : documentaire, gratuit, sans autorisation |
| **Catégories examinées, fixées d'avance** | 1. Concours directs de la fonction publique · 2. Concours professionnels · 3. Examens scolaires nationaux — certificat d'études primaires, brevet d'études du premier cycle, baccalauréat · 4. Orientation post-baccalauréat et bourses nationales · 5. Concours des forces de défense et de sécurité · 6. Résultats universitaires |
| **Travaux** | Pour chaque catégorie : l'émetteur ; les canaux officiels ; l'identifiant imprimé sur les listes ; l'existence d'une consultation individuelle — site, application, message SMS, code USSD — et son coût pour la personne ; la dernière session où elle a fonctionné. Les acteurs privés : sites de republication, applications publiées avec leur nombre d'installations, pages de réseaux sociaux. Les dispositifs arrêtés : applications retirées, sites disparus retrouvés dans les archives du web, et leur cause d'arrêt documentée |
| **Examen de la déclaration `S2`** | La plateforme `e-concours`, ses pages d'aide et la fiche de publication de son application sont examinées pour établir si la consultation individuelle d'un résultat y existe |
| **Conduite** | À distance, sauf pour les pages qui ne se lisent qu'avec un navigateur — le porteur les relève alors |
| **Niveau de preuve visé** | `N1` |
| **Coût** | Nul. Quatre à six jours de travail |
| **Sortie** | Matrice datée et sourcée *catégorie × moyen d'accès* ; une fiche par dispositif arrêté |

**Classement de chaque catégorie, défini d'avance**

| Classement | Définition |
| --- | --- |
| **Servie** | Un moyen officiel permet d'obtenir sa situation individuelle, gratuitement ou au coût d'une communication ordinaire, et il a fonctionné à la dernière session observée |
| **Partiellement servie** | Le seul moyen est payant au-delà d'une communication ordinaire, ou il est privé, ou il est officiel mais documenté comme défaillant à la dernière session |
| **Non servie** | Aucun moyen individuel n'existe |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L1-a` | **Les six catégories sont servies** | Condition de fausseté 2 réalisée partout : l'issue **D** est examinée en premier au jalon 1 |
| `L1-b` | Une catégorie est servie | Elle sort du périmètre d'investigation des vagues suivantes |
| `L1-c` | `e-concours` ou son application permet la consultation individuelle du résultat | La déclaration `S2` est **infirmée**, la catégorie 1 est servie, et l'infirmation est comptée |
| `L1-d` | Un acteur privé couvre le besoin dans une catégorie avec un nombre d'installations publié supérieur à 10 000 | La catégorie est classée partiellement servie, et elle ne peut franchir le jalon 2 que si la valeur ajoutée par rapport à cet acteur est énoncée |
| `L1-e` | Au moins deux dispositifs arrêtés ont pour cause documentée l'**absence d'usage** | Chacun est compté comme infirmation de l'hypothèse `C5`, et la note de jalon 1 doit y répondre avant de poursuivre |

#### `L2` — Relevé des listes publiées et mesure du coût d'accès

| Champ | Contenu |
| --- | --- |
| **Question** | Sous quelle forme les listes nominatives sont-elles réellement publiées, et que coûte, au minimum, le fait de retrouver sa ligne — en minutes et en francs CFA ? |
| **Pourquoi** | C'est la condition de fausseté 1 — *le contournement suffit*. Une liste en texte cherchable, légère et facile à trouver ne laisse presque rien à gagner |
| **Échantillon, fixé d'avance** | Au moins **20 publications nominatives** de 2025 ou 2026, les plus récentes du canal officiel de chaque catégorie non servie ou partiellement servie selon `L1`, dont au moins **8** pour les concours de l'État. Si moins de 20 sont accessibles, toutes le sont, et l'écart est rapporté |
| **Relevé par publication** | Format — texte cherchable, image, tableau en ligne, communiqué ; taille du fichier ; nombre de pages et de lignes ; identifiant employé ; canaux de diffusion observés ; nombre de fichiers entre lesquels la publication est répartie |
| **Mesure du coût minimal** | Pour chaque publication, un identifiant tiré au hasard dans la liste est recherché dans des conditions fixées : le téléphone le plus modeste disponible, décrit dans le relevé, sur connexion mobile, en partant de la page d'accueil du canal officiel. Sont mesurés le temps pour trouver la liste, le temps de téléchargement, le temps pour trouver la ligne, et le volume de données consommé, converti en francs CFA au tarif public du forfait de données le moins cher des principaux opérateurs, relevé à la date de mesure. **L'identifiant tiré n'est pas conservé** |
| **Portée de la mesure** | Elle mesure l'**objet**, non la personne. Elle établit un coût minimal, obtenu par quelqu'un qui sait quoi chercher et où ; elle ne dit rien du coût vécu |
| **Conduite** | Relevé des formats : à distance. Mesure du coût : par le porteur |
| **Niveau de preuve visé** | `N1` |
| **Coût** | Le volume de données consommé par les mesures. Trois à quatre jours |
| **Sortie** | Tableau des publications, sans aucune donnée nominative ; médianes de temps, de volume et de coût |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L2-a` — **contournement suffisant** | Au moins **70 %** des publications sont en texte cherchable, **et** le temps médian total est d'au plus **3 minutes**, **et** le volume médian est d'au plus **2 Mo** | Condition de fausseté 1 réalisée au niveau de l'objet |
| `L2-b` — **coût d'accès établi au niveau de l'objet** | Au moins **30 %** des publications sont des images non cherchables, **ou** le temps médian total dépasse **10 minutes**, **ou** le volume médian dépasse **5 Mo** | Le coût minimal est établi, `N1` ; il reste à établir qu'il est vécu |
| `L2-c` — **indéterminé** | Aucun des deux cas | `L3` tranche seul |

**Motif des valeurs.** Conventions au sens du point 3.2. Trois minutes correspondent à l'ordre de grandeur d'une recherche par identifiant sur connexion mobile, attente de chargement comprise ; dix minutes, au triple de ce qu'une personne tolère pour une démarche qu'elle croit simple. Ces valeurs se modifient aux seules conditions de la règle `D3`.

#### `L3` — Traces publiques du coût d'accès

| Champ | Contenu |
| --- | --- |
| **Question** | Les personnes concernées **agissent-elles** pour contourner la difficulté, et la **disent-elles** sans qu'on le leur demande ? |
| **Pourquoi** | C'est le seul moyen, sans accès privilégié, d'atteindre un comportement de la personne concernée, `N3`, et sa déclaration spontanée, `N2` |
| **Terrain** | Les commentaires publics sous les publications de l'échantillon de `L2`, sur les pages officielles des émetteurs et sur les sites d'information qui les relaient ; les offres publiques de vérification de résultats ; les articles de presse signalant un site saturé ou inaccessible le jour d'une publication |
| **Échantillon, fixé d'avance** | Au moins **500 commentaires**, pris dans l'ordre d'affichage, sur les publications de `L2` ; si moins de 500 existent, tous, et l'écart est rapporté |
| **Conduite** | Par le porteur |
| **Niveau de preuve visé** | `N3` pour les actes, `N2` pour les déclarations spontanées |
| **Coût** | Nul. Trois à quatre jours |
| **Sortie** | Commentaires bruts anonymisés, séparés de leur codage ; tableau de codage ; relevé des intermédiaires |

**Codage, défini d'avance**

| Code | Contenu | Grade |
| --- | --- | --- |
| `A` | Demande d'aide pour trouver sa ligne ou celle d'un proche | `N3` — la personne agit |
| `B` | Signalement d'une difficulté d'accès : lien inopérant, site saturé, fichier trop lourd ou illisible, liste introuvable | `N2` |
| `C` | Offre d'intermédiation — vérification proposée, gratuite ou payante | `N3` — un marché se forme |
| `D` | Republication de la liste par un tiers | `N3` |
| `I` | **Infirmation** : la personne indique avoir trouvé facilement et rapidement | Compté contre l'hypothèse |
| `E` | Autre — félicitations, contestation, question sans rapport | Non compté |

Les commentaires rédigés dans une langue que le codeur ne lit pas sont comptés comme *non codés*, et leur nombre est rapporté.

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L3-a` — **coût observable** | La part des codes `A` et `B` atteint au moins **5 %** des commentaires codés, **ou** au moins **3 intermédiaires distincts** proposent une vérification | Le coût d'accès est observé, `N3` |
| `L3-b` — **coût non observé** | La part des codes `A` et `B` est inférieure à **2 %**, **et** aucun intermédiaire n'est relevé | Réponse négative sur le coût d'accès observable, pour les catégories concernées |
| `L3-c` — **contre-indication** | Le nombre de codes `I` dépasse celui des codes `A` et `B` réunis | Signalé comme contre-indication dans la note de jalon 1, quel que soit le reste |

#### `L4` — Cadre juridique, première partie

| Champ | Contenu |
| --- | --- |
| **Question** | Quels textes régissent la publication des résultats, et dans quel cadre une démonstration sur les données réelles d'une autorité peut-elle se tenir ? |
| **Travaux** | Les textes qui organisent la publicité des résultats de concours et d'examens — arrêtés d'admission, publication au Journal officiel, communiqués. Au titre de la loi n°001-2021/AN : la base légale de la publication nominative ; le régime du numéro de la carte nationale d'identité burkinabè et du numéro de récépissé employés comme clés de recherche ; les formalités auprès de la CIL ; la qualité de responsable de traitement ou de sous-traitant lors d'une démonstration sur les listes de l'autorité ; les instructions, la durée de conservation et la destruction à l'issue. Le régime applicable aux entretiens de `L5` |
| **Pourquoi en vague 0** | Le régime des entretiens doit être établi **avant le premier entretien**, et le cadre d'une démonstration sur données réelles doit être prêt avant qu'une autorité la demande — point 8.3 du document fondateur |
| **Conduite** | À distance |
| **Niveau de preuve visé** | `N1` — textes cités à l'article |
| **Coût** | Nul. Trois jours |
| **Sortie** | Note juridique, chaque énoncé rattaché à son texte |

**Seuils pré-enregistrés le 2026-09-10**

| #      | Constat                                                                                                                 | Conséquence pré-écrite                                                                                                           |
| ------ | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `L4-a` | Un texte interdit à l'**autorité elle-même** la consultation individuelle nominative par identifiant pour une catégorie | Issue **D** pour cette catégorie                                                                                                 |
| `L4-b` | Un texte réserve la diffusion des résultats à des canaux désignés                                                       | Le produit ne peut exister que comme **canal officiel de l'autorité** : compatible avec la cession, contrainte portée au cadrage |
| `L4-c` | L'emploi d'un identifiant comme clé de recherche est soumis à une autorisation                                          | Contrainte portée à l'architecture — choix de la clé ; aucun arrêt                                                               |
| `L4-d` | Le régime des entretiens n'est pas établi à la date prévue du premier entretien                                         | `L5` est suspendu jusqu'à ce qu'il le soit                                                                                       |

### 4.2. Vague 1 — les personnes concernées

#### `L5` — Comment une personne apprend sa situation aujourd'hui

| Champ | Contenu |
| --- | --- |
| **Question** | Comment une personne a-t-elle appris sa situation la dernière fois, combien cela lui a-t-il coûté, et qu'a-t-elle fait ? |
| **Recrutement** | Par des canaux publics, sans intermédiaire institutionnel : groupes publics de candidats, abords des lieux d'affichage et de composition, campus. **Douze personnes**, avec des quotas fixés d'avance : au moins 4 relevant des catégories retenues au jalon 1 ; au moins 3 sans téléphone intelligent ou avec un accès limité aux données ; au moins 3 hors de Ouagadougou, l'entretien pouvant se tenir par téléphone ; au moins 2 ayant cherché pour quelqu'un d'autre |
| **Méthode** | Entretien semi-directif ouvert **par le dernier épisode** — *« la dernière fois que vous avez attendu un résultat »* —, jamais par une solution. Reconstitution du parcours : moment de l'annonce, canaux essayés, personnes sollicitées, dépenses, temps écoulé jusqu'à la certitude, erreurs, homonymies, rumeurs, langue. Guide écrit selon la règle `D3-c`, versé au coffre avant le premier entretien |
| **Conduite** | Par le porteur |
| **Niveau de preuve visé** | `N2` pour les récits, `N3` pour les actes décrits avec leur date et leur coût |
| **Coût** | Déplacements et communications. Douze à quinze heures d'entretien |
| **Sortie** | Verbatims bruts anonymisés, séparés de leur codage ; parcours reconstitués ; comptage des infirmations |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L5-a` — **douleur reconnue** | Au moins **6 personnes sur 12** décrivent spontanément, pour leur dernier épisode, une difficulté : plus de **30 minutes** entre l'annonce et la certitude, une dépense, le recours à un tiers, ou une erreur | Critère « aveu de la personne concernée » porté à `N2` |
| `L5-b` — **douleur agie** | Au moins **4 personnes sur 12** ont agi : payé, délégué, ou se sont déplacées | Critère « aveu » candidat à 3, `N3` |
| `L5-c` — **thèse affaiblie** | Au plus **3 personnes sur 12** décrivent une difficulté | Les issues **C** et **D** sont examinées en premier au jalon 2 |

**Si `L5` ne peut pas être conduit** — recrutement impossible, régime juridique non établi —, le jalon 2 se tient sur les seules traces de `L3`, avec la réserve écrite que le critère « aveu » repose sur des traces publiques sans entretien. Cette réserve est reprise dans le verdict du jalon 3.

### 4.3. Vague 2 — l'autorité, l'actif, le payeur, la cession

Ces lots sont documentaires. Ils peuvent commencer dès le jalon 1, en parallèle de la vague 1.

#### `L6` — L'autorité et la voie d'accès

| Champ | Contenu |
| --- | --- |
| **Question** | Quelle autorité peut recevoir le projet, qu'a-t-elle déjà engagé sur ce sujet, et par quelle voie un particulier peut-il lui présenter un produit ? |
| **Travaux** | Documents publics du ministère chargé de la transition digitale — stratégies, programmes de services en ligne, appels à projets, Semaine du numérique ; du ministère chargé de la fonction publique et de l'AGRE — rapports d'activité, évolutions annoncées d'`e-concours` ; des émetteurs retenus au jalon 1. Avis d'appel d'offres portant sur la publication ou la consultation de résultats. Cas documentés de projets extérieurs à l'administration reçus, examinés ou adoptés par ces autorités. Procédures de demande d'audience |
| **Conduite** | À distance |
| **Niveau de preuve visé** | `N1` ; `N3` ou `N4` pour une autorité si elle a déjà engagé une dépense ou un marché sur le sujet |
| **Coût** | Nul. Trois à quatre jours |
| **Sortie** | Fiche par autorité : ce qu'elle a engagé, ce qu'elle annonce, par quelle voie la saisir |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L6-a` | Une autorité conduit ou a lancé un projet de consultation individuelle des résultats dans une catégorie retenue | Pour cette autorité, la place est prise par elle-même : l'issue se reformule en **contribution** à son projet, ou vise une autre autorité |
| `L6-b` | Aucun cas documenté de projet extérieur reçu ou adopté n'est trouvé pour aucune autorité visée | La probabilité d'une cession est inconnue ; ce n'est pas un arrêt, mais la stratégie de présentation devient une question de cadrage de premier rang |
| `L6-c` | Une autorité a inscrit à un budget ou à une stratégie publique l'amélioration des services en ligne aux candidats | Ancrage institutionnel candidat, `N1` — ou `N4` s'il s'agit d'un marché engagé |

#### `L4` — Cadre juridique, seconde partie : la cession

| Champ | Contenu |
| --- | --- |
| **Question** | Par quelle voie juridique une autorité peut-elle recevoir un logiciel produit par un particulier, et à quelles exigences d'hébergement et de sécurité des données de l'État le produit devra-t-il répondre ? |
| **Travaux** | Cession de droits d'auteur, don, licence libre ; règles de la commande publique applicables à la réception d'un logiciel ; acceptation d'un don par une administration ; exigences d'hébergement des données publiques ; forme juridique sous laquelle le porteur peut céder |
| **Conduite** | À distance |
| **Sortie** | Deuxième partie de la note juridique |

**Seuil pré-enregistré le 2026-09-10** — `L4-e` : si **aucune voie** ne permet à une autorité de recevoir le logiciel sans procédure concurrentielle, l'issue « cession » se reformule — publication sous licence libre et adoption par l'autorité — et la reformulation est portée au cadrage. Ce n'est pas un arrêt.

#### `L7` — L'actif : ce qui s'accumule, se creuse et appartient

| Question | Piste à instruire |
| --- | --- |
| **Que s'accumule-t-il ?** | L'**archive structurée** des publications nominatives, consultable dans le temps ; l'**habitude** de consulter au même endroit, chaque nouvelle publication renforçant le réflexe ; la **connaissance des formats** de listes des émetteurs, qui conditionne l'import |
| **Cela se creuse-t-il ?** | Pour une plateforme commune, un effet entre émetteurs et personnes est possible : plus d'émetteurs y publient, plus le réflexe s'installe, plus les autres émetteurs sont incités à y publier. Pour un émetteur unique, cet effet disparaît |
| **À qui cela appartient-il ?** | Les données appartiennent aux émetteurs. Par la cession, le produit appartient à l'autorité. **Le porteur ne conserve aucun actif**, conformément à l'intention `I3` |
| **Tension à instruire** | Une archive durable des résultats entre en conflit avec la limitation de la durée de conservation des données personnelles. La durée légalement admissible commande la valeur de l'archive |
| **Test de reproductibilité** | Que coûterait à l'émetteur, ou à son prestataire, d'ajouter la consultation individuelle à son propre dispositif ? |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L7-a` | L'archive ne peut être conservée au-delà d'une courte durée, et l'émetteur visé est unique | Rien ne se creuse : la position repose sur le seul ancrage institutionnel, qui appartient à l'autorité. La présentation doit alors reposer sur la preuve de valeur et sur le coût évité |
| `L7-b` | L'ajout de la consultation individuelle au dispositif existant de l'émetteur est à la portée de son prestataire en moins d'un trimestre, selon les éléments publics disponibles | La cession d'un produit distinct perd son objet pour cet émetteur : l'issue se reformule en **contribution** — spécification et code ouverts — à son dispositif |

#### `L8` — Le payeur

| Champ | Contenu |
| --- | --- |
| **Question** | Qui porte aujourd'hui une ligne de coût pour ce problème, même cachée ? |
| **Travaux** | Pour la personne : données mobiles, déplacement, intermédiaire, temps — repris de `L2`, `L3` et `L5`. Pour l'émetteur : affichage, insertion des listes dans la presse ou au Journal officiel, traitement des réclamations et des erreurs, hébergement face aux pics de fréquentation, contrats de services par message. Pour l'État : lignes budgétaires publiques des dispositifs existants. Distinction stricte entre **qui subit**, **qui décide** et **qui paie** |
| **Conduite** | À distance, sauf les éléments repris des lots de terrain |
| **Sortie** | Tableau des lignes de coût, chacune avec sa source, et répartition subit, décide, paie |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L8-a` | Aucune ligne de coût n'est portée par l'émetteur ; seule la personne supporte le coût | L'argument d'adoption n'est pas budgétaire mais de qualité du service public ; il est porté au cadrage. Aucun arrêt |
| `L8-b` | Ni la personne ni l'émetteur ne portent de coût établi | Issue **D** — ce constat recoupe nécessairement ceux du jalon 1 ou du jalon 2 |

Le basculement de `checkme` en infrastructure publique, déclaré comme intention au point 8.1 du document fondateur, est **acté au jalon 3** sur la base de ce lot, conformément à la règle `D2`.

#### `L9` — Épreuve comparative sur données fictives — facultative

| Champ | Contenu |
| --- | --- |
| **Question** | Pour une même personne et une même liste, quel écart de temps et d'erreur sépare la recherche dans une liste publiée de l'obtention de sa situation par un identifiant ? |
| **Pourquoi facultative** | Le seuil du critère « bénéfice mesurable » peut être atteint par l'estimation de `L2`. Une mesure avant-après en conditions réelles le porte plus haut, et constitue l'argument le plus direct devant une autorité |
| **Méthode** | Au moins **10 participants**, recrutés par des canaux publics, sur leur propre téléphone. Une liste **fictive** d'au moins 2 000 lignes, au format des listes publiées par l'AGRE, générée sans aucune donnée réelle. Deux tâches, dans un ordre alterné d'un participant à l'autre : retrouver sa ligne dans la liste ; obtenir sa situation par un formulaire de recherche minimal, construit avec un outil existant et **sans développement du produit** |
| **Condition d'ouverture** | Après le jalon 2, et seulement si `L5-a` ou `L3-a` est atteint |
| **Conduite** | Par le porteur |
| **Niveau de preuve visé** | Mesure avant-après chiffrée, sur des personnes concernées |

**Seuils pré-enregistrés le 2026-09-10**

| # | Constat | Conséquence pré-écrite |
| --- | --- | --- |
| `L9-a` — **écart établi** | Le temps médian gagné atteint au moins **2 minutes**, **ou** le taux d'erreur est au moins divisé par deux | Critère « bénéfice mesurable » candidat à 3 |
| `L9-b` — **écart insuffisant** | Le temps médian gagné est inférieur à **30 secondes**, sans écart d'erreur | La valeur n'est pas dans la recherche de la ligne : l'issue **C** est examinée |

---

## 5. Séquencement et jalons

```
VAGUE 0 — Sources publiques, aucune autorisation      L1, L2, L3, L4 première partie
        |
        v  -- JALON 1 — au plus tard le 2026-10-31 ----------------------------
           Quelles catégories ne sont pas servies ?
           Le coût d'accès est-il observable ?
           Sortie possible : issue D, ou restriction du périmètre d'investigation.
        |
VAGUE 1 — Les personnes concernées                     L5
VAGUE 2 — En parallèle, dès le jalon 1                 L4 seconde partie, L6, L7, L8
        |
        v  -- JALON 2 — au plus tard six semaines après le jalon 1 ------------
           La difficulté est-elle reconnue et agie par les personnes concernées ?
           Sortie possible : issue C ou D.
        |
        |  L9, facultatif, après le jalon 2
        v  -- JALON 3 — au plus tard quatre semaines après le jalon 2 ---------
           Une autorité peut-elle recevoir le projet, et par quelle voie ?
           Qu'est-ce qui s'accumule, et qui paie ?
           Sortie : nouveau verdict du premier maillon.
```

### 5.1. Le jalon 1, décidé d'avance

Le jalon 1 rend sur deux questions : la place disponible, établie par `L1`, et le coût d'accès observable, établi par le croisement de `L2` et de `L3`. Les conséquences sont écrites ici, avant toute collecte.

| `L1` | `L2` | `L3` | Conséquence pré-écrite |
| --- | --- | --- | --- |
| Six catégories servies | — | — | Issue **D** examinée en premier |
| Au moins une catégorie non servie ou partiellement servie | Coût établi | Coût observable | Vague 1 ouverte sur ces catégories |
| idem | Indéterminé | Coût observable | Vague 1 ouverte ; `L2` reconduit sur un second échantillon |
| idem | Contournement suffisant | Coût observable | Le coût n'est pas dans la recherche de la ligne, mais ailleurs — trouver la liste, s'y fier, y accéder : l'issue **C** est examinée, et le recouvrement avec `infUb` est porté à la cartographie |
| idem | Coût établi ou indéterminé | Coût non observé | Vague 1 ouverte **à titre de contre-épreuve** : `L5` seul peut encore établir la difficulté ; à défaut au jalon 2, issue **D** |
| idem | Contournement suffisant | Coût non observé | Réponse négative sur le coût d'accès : issue **D** examinée en premier |

**Absence de preuve.** Si, au 2026-10-31, un lot de la vague 0 n'a pas été conduit, l'absence de preuve sur la question qu'il instruit vaut réponse négative — point 10.4 du document fondateur.

### 5.2. Ce que chaque jalon autorise

| Jalon | Ce qu'il permet de lever | Phase qu'il déverrouille |
| --- | --- | --- |
| **1** | Restriction du périmètre d'investigation aux catégories non servies ; arrêt anticipé | Aucune — le projet reste en `10-etudes` |
| **2** | Canaux d'accès à prévoir, dont l'accès sans téléphone intelligent ; langues ; catégories candidates au premier marché | Aucune |
| **3** | **Nouveau verdict du premier maillon** — retenu, retenu sous condition, à reformuler ou rejeté. Le verdict *non instruit* ne peut pas être prononcé une seconde fois sur les mêmes critères | `20-cadrage-strategique`, si le verdict est retenu |
| *après 3* | Première catégorie, autorité visée, origine de la donnée hors démonstration, périmètre du produit minimal, modalités de cession | `30`, puis `40`, `50` et `60` |

Chaque jalon produit une note de jalon versée en `10-etudes`, qui applique les seuils tels qu'ils sont écrits ici.

---

## 6. Variante à ressources contraintes

Si le temps du porteur ne permet pas le programme complet, version resserrée sur **huit semaines**, qui atteint les trois jalons.

| Semaines | Travail | Sortie |
| --- | --- | --- |
| 1 à 3 | `L1` complet ; `L2` réduit à 12 publications ; `L3` réduit à 300 commentaires ; `L4` première partie | Jalon 1 |
| 4 à 7 | `L5` réduit à 8 entretiens — seuils ramenés à 4 sur 8 pour `L5-a`, 3 sur 8 pour `L5-b`, 2 sur 8 pour `L5-c` ; `L6`, `L7`, `L8` et `L4` seconde partie en documentaire | Jalon 2 |
| 8 | Synthèse | Jalon 3, tenu dans la foulée du jalon 2 |

Cette variante ne prétend pas à la représentativité. Elle vise à établir si le problème mérite d'être construit, ce qui est la seule question utile à ce stade. Le recours à la variante est inscrit au journal **avant** le début de la vague 0.

---

## 7. Éthique et conformité

Le programme touche des données personnelles à trois endroits : les listes publiées, les commentaires publics, les entretiens.

- **Listes** : aucune liste, aucune ligne, aucun nom, aucun numéro n'est copié dans le coffre ni conservé ailleurs — point 3.3.
- **Commentaires publics** : relevés sans nom, sans pseudonyme ni lien vers un profil ; seuls sont conservés le texte, la date et l'adresse de la publication commentée. **Aucun auteur de commentaire n'est contacté.**
- **Entretiens** : consentement distinct pour l'entretien, l'enregistrement et la citation ; anonymisation dès la transcription ; table de correspondance conservée **hors du coffre** ; durée de conservation fixée d'avance — jusqu'à six mois après le jalon 3 ; aucun résultat nominatif d'une personne interrogée n'est noté.
- **`L9`** : les données fictives sont générées, jamais dérivées d'une liste réelle.
- Le régime applicable aux entretiens est établi par `L4` **avant le premier entretien**, jamais après.

---

## 8. Risques du programme

| Risque | Effet | Contre-mesure |
| --- | --- | --- |
| **Biais de confirmation du porteur**, qui conduit seul | Les lots confirment l'intention | Seuils pré-enregistrés ; matériau brut conservé pour un recodage ultérieur par un tiers ; comptage des infirmations dans chaque lot |
| **Les traces publiques sur-représentent les personnes connectées** | Les personnes qui supportent le coût le plus élevé — sans téléphone intelligent, sans données — sont invisibles en `L3` | Quota de `L5` ; la limite est écrite dans chaque note de jalon qui s'appuie sur `L3` |
| **La déclaration `S2` oriente la recherche** | `L1` cherche à confirmer qu'`e-concours` s'arrête au récépissé | Seuil `L1-c` écrit d'avance ; l'infirmation est recherchée activement et comptée |
| **Échantillon de complaisance** | Les listes les plus difficiles sont retenues pour prouver le coût | Règle de tirage écrite d'avance : les plus récentes du canal officiel |
| **Le corpus hérité est prêt à coder** | L'étude devient la formalité qui précède une construction déjà décidée | Aucun artefact de conception avant le jalon 3 ; la [[checkme/90-pilotage/Carte des phases\|Carte des phases]] le verrouille |
| **Volatilité institutionnelle** | Une autorité change de nom ou de périmètre pendant l'étude | Désignation par la formule *ministère chargé de…* ; toute dénomination est datée |
| **Le programme ne se clôt pas** | La reprise devient une réinstruction sans fin | Trois jalons plafonnés ; règle de non-renouvellement du verdict *non instruit* |

---

## 9. Ce que ce programme ne décide pas

Il ne tranche ni la première catégorie de publication, ni l'autorité visée, ni l'origine de la donnée hors démonstration, ni le périmètre du produit minimal, ni les canaux, ni les langues, ni l'hébergement, ni les modalités de la cession, ni le *Core Domain*, ni l'architecture. Il détermine seulement **dans quel ordre** et **sur quelle base probatoire** ces décisions pourront être prises.

Il n'engage pas la construction. L'issue **D** reste ouverte jusqu'au jalon 3.

---

## Annexe A. Exigences du verdict du premier maillon → lots

Le point 10.3 du document fondateur exige huit lots. Ils sont tous présents ; un neuvième, facultatif, est ajouté.

| Lot exigé | Lot du programme |
| --- | --- |
| État de l'art et cimetière | `L1` |
| Relevé des listes publiées | `L2` |
| Traces publiques du coût d'accès | `L3` |
| Cadre juridique | `L4`, en deux parties |
| Personnes concernées | `L5` |
| Autorité et voie d'accès | `L6` |
| Actif | `L7` |
| Payeur | `L8` |
| *Non exigé* | `L9` — épreuve comparative, facultative |

## Annexe B. Contrôle du programme au regard de la grille d'arbitrage

Contrôle de complétude conduit par l'auteur du programme. **Il ne vaut pas validation indépendante** : il vérifie que chaque critère de la grille trouve dans le programme un lot et un seuil.

| Critère de la grille | Où le programme y répond |
| --- | --- |
| **Falsifiabilité déclarée** | Chaque lot porte ses seuils, datés du 2026-09-10, avant toute collecte |
| **Ordonnancement par pouvoir de décision** | `L1`, le test le moins coûteux qui peut arrêter le projet, est en tête. Dépendances explicites : `L4` avant `L5` ; jalon 1 avant `L5` ; jalon 2 avant `L9` |
| **Couverture des critères bloquants** | Bénéficiaire nommable : `L5`, `L3`. Bénéfice mesurable : `L2`, `L9`. Aveu de la personne concernée : `L3`, `L5`. Test de retrait : `L3`, `L8`. Effet de réseau et données qui s'accumulent : `L7`. Encastrement : `L6`, `L7`. Barrière réglementaire : `L4`. Ancrage institutionnel : `L6` |
| **Atteignabilité de l'abandon** | Issue **D** atteignable au jalon 1 — `L1-a`, table du point 5.1 —, au jalon 2 — `L5-c` —, au jalon 3 — `L4-a`, `L7-b`, `L8-b` |

## Annexe C. Décisions suspendues → jalon qui les éclaire

| Décision suspendue — point 12 du document fondateur | Éclairée par | Prise au |
| --- | --- | --- |
| Première catégorie de publication | Jalon 1, qui restreint ; jalon 3 | Cadrage |
| Autorité visée | `L6`, jalon 3 | Cadrage |
| Origine de la donnée hors démonstration | `L4`, `L7`, jalon 3 | Cadrage |
| Canaux d'accès et langues | `L5`, jalon 2 | Cadrage, puis architecture |
| Modalités de la cession et forme juridique du porteur | `L4` seconde partie, jalon 3 | Cadrage |
| Hébergement | `L4` seconde partie | Architecture |
| Périmètre du produit minimal | L'ensemble du programme | Cadrage |

---

*Version 0.1 du 2026-09-10 — seuils pré-enregistrés à cette date, avant toute collecte. Toute modification ultérieure d'un seuil suit la règle `D3` de la [[Doctrine du coffre]] : inscrite au journal, datée, et motivée par autre chose que le résultat obtenu.*
