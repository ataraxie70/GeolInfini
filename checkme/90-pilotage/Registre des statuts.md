---
projet: "checkme"
type: "registre-des-statuts"
phase: "90-pilotage"
objet: "Ce qui est établi, ce qui est proposé, ce qui est contesté et ce qui reste ouvert — après la remise en cause du corpus"
lignes_decidees: 0
cree_le: 2026-09-06
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - pilotage
  - statuts
---

# Registre des statuts

> [!info] Provenance des énoncés
> Les énoncés de ce registre ont quatre origines, et quatre seulement : le corpus hérité ; le contrôle direct des fichiers, les 2026-09-06 et 2026-09-10 ; les sources publiques consultées depuis le 2026-09-10, citées au [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]] et aux relevés de lots de `10-etudes` ; les déclarations du porteur, datées. **Aucun statut n'y est promu.** Là où deux documents se contredisent, la contradiction est reproduite telle quelle plutôt qu'arbitrée : l'arbitrage appartient au porteur et s'inscrit au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

## Échelle de statut

| Statut | Définition | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée, contrôle direct ou source citée | Peut fonder une décision |
| **Proposé** | Recommandation argumentée d'un document, non arbitrée par le porteur | Oriente, ne décide pas |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Contesté** | Affirmé dans un document, contredit dans un autre, sans arbitrage | **Ne doit être lu ni comme acquis ni comme abandonné** |
| **Ouvert** | Question posée, sans réponse arrêtée | N'autorise rien |
| **Décidé** | Arrêté par le porteur, daté, inscrit au registre `DEC-P-` | Engage |

> [!danger] Aucune ligne de ce registre n'est au statut « Décidé », et ce n'est plus seulement une question de doctrine
> Le corpus de `checkme` emploie abondamment le vocabulaire de la décision — « Décisions P0-2 », « SEC-01 », « baseline canonique », « Statut : terminé ». Deux règles s'y opposent, et elles se cumulent.
> **`DEC-C-014`** : un statut écrit dans un document qualifie l'état de ce texte, jamais l'état du projet.
> **`DEC-C-016`** : le porteur a rouvert l'intégralité du corpus. Ce qui aurait pu être promu ne peut plus l'être sans passer par la reprise.

---

## 1. Faits — établis par contrôle direct ou source vérifiée

| # | Fait | Établi par |
| --- | --- | --- |
| `F1` | **Aucun artefact exécutable n'existe** : pas de code Go, pas d'application Next.js, pas d'`OpenAPI`, pas de test, pas de CI, pas d'environnement déployé | [[Analyse approfondie du projet]] point 8.2, et vérification de l'arborescence le 2026-09-06 |
| `F2` | **Les cinq migrations SQL n'ont jamais été exécutées.** Elles existent comme annexe d'un document de conception ; aucune base ne les a reçues | Contrôle direct — aucune trace d'exécution, aucun environnement |
| `F3` | **La loi n°001-2021/AN du 30 mars 2021 existe et est correctement citée** par [[Sécurité]] : protection des personnes à l'égard du traitement des données à caractère personnel, elle remplace la loi de 2004 | Vérification externe conduite par l'[[Audit complet du projet\|audit]], point P0-5 |
| `F4` | **Le corpus ne contient qu'une seule occurrence de vocabulaire économique**, dans une question sans réponse de l'analyse approfondie | Recherche plein texte sur l'ensemble du projet, 2026-09-06 |
| `F5` | **L'intervention P0-4 a bien été réalisée** — document daté du 2026-08-10, cinq migrations, notice à jour — mais elle était restée enfermée dans une archive `.zip` jusqu'à son extraction le 2026-09-06 | Contrôle d'empreinte fichier par fichier |
| `F6` | **`checkme` est nommé par `infUb`**, qui lui pose une frontière explicite : `infUb` répond à « qu'est-ce qui a été publié ? », `checkme` à « quel est mon statut individuel ? » | Point 7 du [[Document de référence global]] d'`infUb` |
| `F7` | **Le corpus hérité est versé en `99-sources/corpus-herite/`** — quinze documents et cinq migrations, déplacés sans réécriture, vingt empreintes identiques avant et après. Les dossiers `10`, `30`, `40` et `50` sont retirés | `DEC-C-082` ; contrôle d'empreinte, 2026-09-10 |
| `F8` | **Neuf des quinze corps hérités ne correspondent plus à leur empreinte du 2026-09-06.** Cinq sont reconstitués à l'octet près par l'inversion de la substitution de `DEC-C-052` ; quatre portent en outre des retouches de forme non reconstituables, et leur original n'existe plus dans le coffre | Point 4.2 de [[checkme/99-sources/Sources originales\|Sources originales]] |
| `F9` | **Le porteur a déclaré le 2026-09-10 son intention stratégique** : produit fonctionnel sur toute la chaîne métier, présentation à une autorité publique, cession complète en cas de reprise, étude conduite sur les seules sources publiques, aucune échéance extérieure. Le fait est la déclaration ; son contenu est une **intention**, non une décision | Point 3 du [[checkme/00-intention/Document fondateur d'intention\|Document fondateur d'intention]] ; `DEC-C-083` |
| `F10` | **Les concours de l'État disposent d'un dispositif numérique officiel.** L'Agence générale de recrutement de l'État, créée par le décret n°2008-001/PRES/PM/MFPRE du 9 janvier 2008, exploite `concours.gov.bf` ; les candidatures sont reçues en ligne exclusivement par la plateforme `e-concours` ; une application mobile est publiée. Ce dispositif **ne permet pas** la consultation individuelle d'un résultat — fait `F13`, confirmé par le lot `L1` | Sources publiques consultées le 2026-09-10, grade `N1` — point 4 du document fondateur |
| `F11` | **Dénominations en vigueur** : Ministère de la Transition digitale, des Postes et des Communications électroniques ; Ministère des Serviteurs du Peuple, nouvelle dénomination depuis janvier 2026 du ministère chargé de la fonction publique | Sites officiels des deux ministères ; Financial Afrik, 13 janvier 2026, grade `N1` |
| `F12` | **L'autorité de contrôle de la loi n°001-2021/AN est la Commission de l'informatique et des libertés** (CIL) | Assemblée nationale ; Association francophone des autorités de protection des données personnelles, grade `N1` |
| `F13` | **Le porteur déclare que la plateforme `e-concours` permet seulement de postuler à un concours et de recevoir son récépissé**, sans consultation individuelle du résultat. **Confirmée le 2026-09-10 par le lot `L1`, grade `N1`** : le code public de la plateforme ne porte aucune route ni aucun libellé de résultat, sa foire aux questions officielle n'en traite dans aucune de ses vingt-neuf entrées, et la fiche de l'application la décrit comme un outil d'inscription | Déclaration du porteur, 2026-09-10 ; `DEC-C-084` ; [[Relevé de l'état de l'art et du cimetière]], point 4 |
| `F14` | **Le porteur déclare deux précisions à son intention** : l'échéance du jalon 1 au 2026-10-31 est un plafond, une date antérieure étant admise ; la démonstration est livrée sur données fictives, l'autorité pouvant demander une démonstration sur données réelles — intention `I8` | Déclaration du porteur, 2026-09-10 ; `DEC-C-084` |
| `F15` | **L'État a lui-même mis en service une consultation individuelle des résultats d'examen.** Le ministère chargé de l'enseignement de base a ouvert en juin 2026 `resultats.examens.gov.bf` : résultats du certificat d'études primaires, sessions 2023 à 2026, par numéro de procès-verbal et date de naissance ; étendu en juillet 2026 à l'entrée en sixième. Présenté comme une innovation de service public. Ni brevet, ni baccalauréat, ni concours | Lot `L1`, grade `N1` — publications du ministère, presse, code public de la plateforme |
| `F16` | **Classement des catégories au 2026-09-10** : deux éléments servis — certificat d'études primaires, orientation post-baccalauréat par `campusfaso.bf` — ; sept non servis — concours directs, concours professionnels, brevet, baccalauréat, bourses nationales, concours des forces de défense et de sécurité, résultats universitaires. Aucun acteur privé de plus de 10 000 installations ; aucun dispositif arrêté documenté | Lot `L1`, point 9 du relevé |
| `F18` | **Le porteur déclare que la chaîne de publication de la fonction publique passe par le papier puis par un réseau social.** Le ministère imprime, photocopie et photographie ses propres listes, puis les publie sur Facebook ; son site officiel ne sert pas les résultats. **Il n'existe aucun lieu où un candidat puisse se déplacer pour consulter.** Le fait est la déclaration ; son contenu reste à établir par `L2` | Déclaration du porteur, 2026-09-27, grade `N2` |
| `F19` | **Le porteur déclare que le recrutement en master et les résultats universitaires sont publiés sur des tableaux d'affichage dans les universités**, dont l'université Joseph Ki-Zerbo à Ouagadougou, ce qui impose un déplacement physique. Le coût d'accès diffère donc selon la catégorie : déplacement pour l'université, dépendance à un réseau social pour la fonction publique | Déclaration du porteur, 2026-09-27, grade `N2` |
| `F20` | **Le porteur déclare que la publication papier comporte une première page portant un cachet**, qui annonce la publication. Il en fait une exigence : cette page doit servir de référence directe au statut affiché | Déclaration du porteur, 2026-09-27, grade `N2` |
| `F21` | **Le porteur a arbitré `CR-01` le 2026-09-27** : la publication est habilitée, les comptes de publication sont créés par l'administrateur de la plateforme à la demande et après vérification, un individu ne peut pas s'inscrire lui-même. La vérification établit que l'entité émettrice est d'accord, au courant et responsable des données. Le fait est l'arbitrage ; **son inscription au journal sous un identifiant `DEC-P-` reste à faire** | Déclaration du porteur, 2026-09-27 ; [[checkme/90-pilotage/Registre des contradictions\|Registre des contradictions]] |
| `F22` | **Le porteur déclare que les listes publiées portent, pour chaque candidat, le nom, la date de naissance, le numéro de CNIB et un identifiant de session** — pour les concours, le numéro de récépissé. Il précise que ces listes sont ouvertes à la consultation sur les réseaux sociaux. Il présente ce point comme un fait qu'il connaît | Déclaration du porteur, 2026-09-27, grade `N2` — **à confirmer par lecture de la structure d'une publication, sans ouvrir aucune liste nominative** |
| `F17` | **Comparables étrangers** : la Côte d'Ivoire offre en 2026 la consultation individuelle des résultats de ses concours de la fonction publique par numéro d'inscription, conçue et exploitée par un prestataire privé ; la République du Congo diffuse une application de résultats d'examen installée plus de 500 000 fois | Lot `L1`, point 8 du relevé, grade `N1` — analogies, hors seuils |

---

## 2. Proposé — tout le corpus, sans exception

> [!important] Ce que « proposé » veut dire ici
> Ni faux, ni fragile, ni abandonné. Le corpus de `checkme` est le plus construit du coffre, et il est vraisemblable qu'une grande part en sera reprise telle quelle. Mais **rien n'y engage le projet**, et depuis `DEC-C-016` chaque ligne est à réinstruire.

| Ce que le corpus présente comme arrêté | Où | Statut réel |
| --- | --- | --- |
| Monolithe modulaire, CQRS léger pour la Consultation | [[Vision d'architecture]] | Proposé |
| Go pour le backend, `Meilisearch` pour l'index, *transactional outbox* | [[Architecture logicielle]] | Proposé |
| Contrats des API citoyen et organisme, format des événements | [[Contrats d'API]] | Proposé |
| Décisions de sécurité `SEC-01` et suivantes — sessions opaques Redis, *rate-limiting* par couple, critère de recherche jamais journalisé en clair | [[Sécurité]] | Proposé |
| Schéma PostgreSQL, index de recherche, usage de Redis | [[Base de données]] | Proposé |
| Recherche exacte par défaut, identifiant faible jamais seul, résultat `trouvé` / `ambigu` / `aucun` | [[Stratégie de recherche et de correspondance]] — P0-2 | Proposé |
| Livraison *at-least-once*, projecteurs idempotents, statuts d'indexation, reconstruction par génération | [[Fiabilité de la projection Consultation]] — P0-3 | Proposé |
| PostgreSQL seul pour le MVP, empreinte `HMAC-SHA-256` calculée par l'application | [[Modèle de données et migrations]] — P0-4 | Proposé |

---

> [!note] Les contradictions ont désormais leur propre registre
> Depuis le 2026-09-27, les oppositions entre énoncés et les menaces nées de la rencontre de deux exigences sont portées au [[checkme/90-pilotage/Registre des contradictions|Registre des contradictions]]. Le présent point 3 conserve les deux divergences du corpus hérité, qui restent non arbitrées.

## 3. Contesté — deux divergences réelles, aucune arbitrée

### 3.1. Le moteur de l'index de Consultation — trois réponses circulent

C'est la divergence la plus lourde du corpus, parce qu'elle touche la brique dont dépend le cœur de valeur du produit.

| Réponse | Où elle est écrite | Date |
| --- | --- | --- |
| **`Meilisearch`** | [[Vision d'architecture]], [[Architecture logicielle]], [[Contrats d'API]], [[Sécurité]], [[Base de données]] — cinq documents | 2026-08-02 et avant |
| **Ouvert, à trancher** | [[Fiabilité de la projection Consultation]] : *« choix définitif de stockage exact : PostgreSQL, Meilisearch configuré strictement ou autre index »* | 2026-08-02 |
| **PostgreSQL seul** | [[Modèle de données et migrations]] : *« Le modèle vise un MVP PostgreSQL. Il ne dépend pas d'un moteur de recherche externe. »* | 2026-08-10 |

**Aucun des cinq documents historiques n'a été amendé** après P0-4. Le corpus affirme donc simultanément deux architectures de lecture incompatibles, et rien n'indique laquelle prévaut.

> [!caution] Un quatrième moteur circule, et il n'a jamais été choisi par personne
> L'[[Analyse approfondie du projet|analyse approfondie]] attribue au projet **Elasticsearch** — dans son tableau de *stack*, dans deux de ses diagrammes, et dans son risque `R8` « Elasticsearch comme *single point of failure* ».
> **Aucun document de conception ne retient Elasticsearch.** [[Architecture logicielle]] le mentionne une fois, pour l'écarter au profit de Meilisearch, jugé d'« empreinte bien plus légère ». Vérifié par recherche plein texte : `Elasticsearch` n'apparaît nulle part ailleurs dans le corpus. Le risque `R8` porte donc sur une brique que le projet n'a jamais adoptée.

### 3.2. La recherche par nom sur l'écran citoyen

Les deux maquettes citoyen, supprimées le 2026-09-06, ne différaient pas seulement par leur habillage : **elles ne proposaient pas les mêmes critères de recherche.**

| Maquette | Critères offerts au citoyen |
| --- | --- |
| `checkme_ecran_citoyen.html` | *Numéro de récépissé* **ou** *Numéro CNIB* **ou** *Nom & Prénom* |
| `checkme_ecran_citoyen_v2.html` | *Numéro CNIB* **ou** *Numéro de récépissé* — pas de recherche par nom |

C'est exactement la ligne de partage de P0-2 : l'identifiant faible ne doit jamais servir de critère unique. **La question reste entière** et devra être tranchée à la reprise : l'écran citoyen propose-t-il, ou non, une entrée par nom, et sous quelles conditions de désambiguïsation ?

---

## 4. Écarts relevés dans le corpus — constats, non arbitrages

| # | Écart | Constat |
| --- | --- | --- |
| `E1` | **Le périmètre de P0-4 a été réduit sans être retracé** | La sortie attendue était *« OpenAPI, JSON Schemas, migrations initiales, fixtures »*. Le livrable ne porte que le modèle de données et les migrations, et range l'API publique en hors périmètre. **OpenAPI, JSON Schemas et fixtures ne sont ni faits, ni reportés dans une intervention nommée** : ils sont orphelins |
| `E2` | **Le registre des interventions est en retard d'une intervention** | Il porte P0-4 en « À faire » et s'arrête sur *« prochaine intervention autorisée : P0-4 »*, alors que P0-4 est daté du 2026-08-10. Laissé intact : c'est le registre du porteur — voir l'encadré de [[checkme/99-sources/corpus-herite/Historique des interventions\|la note]] |
| `E3` | **L'analyse approfondie affirme à tort que l'état « ambigu » n'est pas maquetté** | Son risque `R11` énonce que *« le citoyen n'a aucune idée de ce que signifie ce résultat »*. **Contrôle fait sur les fichiers avant leur suppression** : les deux écrans citoyen portaient un onglet `Ambigu` et un panneau complet — *« Plusieurs correspondances… ajouter un second identifiant pour affiner la recherche »*, avec champ de saisie et bouton *Affiner la recherche*. Le risque `R11` tombe ; les autres lacunes UX qu'elle relève — erreur réseau, chargement, mode dégradé — sont, elles, confirmées |
| `E4` | **La grille de phases du coffre n'a pas de phase pour l'UX** | Le document hérité [[Parcours utilisateur et interfaces]] a été rangé en `50-architecture` faute de mieux, jusqu'à son versement en `99-sources`. La question se reposera lorsque la reprise produira un document de parcours. Ce n'est pas une erreur de rangement mais un manque de la grille, signalé ici plutôt que résolu par un dossier inventé |
| `E5` | **L'analyse approfondie désigne l'autorité de contrôle sous un nom qui n'est pas le sien** | Son risque `R2` nomme une *« Autorité de Protection des Données Personnelles »*. L'autorité instituée par la loi n°001-2021/AN est la Commission de l'informatique et des libertés — fait `F12` —, que l'audit nomme correctement au point P0-5 |

---

## 5. Ouvert — ce que la reprise devra instruire

### 5.1. Le cadrage stratégique

Détaillé à la [[checkme/90-pilotage/Carte des phases|Carte des phases]]. **Aucune de ces questions n'a de réponse dans le corpus.** La déclaration du porteur du 2026-09-10 — fait `F9` — en oriente deux, sans en trancher aucune.

| Question de cadrage | État au 2026-09-10 |
| --- | --- |
| Porteur institutionnel et mandat | **Orienté par l'intention** : une autorité publique reprenant le projet par cession complète. L'autorité n'est pas choisie ; les deux autorités citées sont de nature différente — point 8.2 du document fondateur |
| Financement | **Orienté par l'intention** : le porteur seul jusqu'à la cession, l'autorité ensuite. Aucun revenu visé. Le basculement en infrastructure publique, au sens de la règle `D2`, reste à acter au jalon de cadrage |
| Gouvernance de l'habilitation à publier | Ouvert |
| Marché initial — première catégorie de publication | Ouvert. Les concours de l'État sont une **catégorie candidate** : selon le porteur, le dispositif officiel s'arrête au récépissé — fait `F13`, à confirmer. L'identifiant y est déjà attribué par l'État et les résultats sont publiés dans son ordre — fait `F10` |
| Niveau de service | Ouvert |

### 5.1 bis. La question qui commande tout le reste

**D'où vient la donnée tant qu'aucun organisme n'a accepté de publier ?** Trois réponses — données fictives, listes déjà publiées indexées avec renvoi au document officiel, publication par l'organisme lui-même — dessinent trois projets différents. Le corpus ne pose jamais la question. Point 7.1 du [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

**Orientée par l'intention `I8` pour la démonstration** : données fictives livrées par le porteur, données réelles à la demande de l'autorité et sur ses propres listes. Pour le produit exploité, la cession complète place la donnée chez l'autorité. L'indexation de listes publiées sans l'accord de l'émetteur n'est requise par aucune étape de l'issue déclarée ; elle n'est ni retenue ni exclue. **Réponse définitive au cadrage.**

### 5.2. Les zones d'ombre relevées par l'analyse approfondie

Reprises telles quelles, sans y rien ajouter : internationalisation (le Burkina compte environ 70 langues), accessibilité `USSD` pour les citoyens sans smartphone, sauvegarde et reprise après sinistre, cycle de vie et durée de consultabilité des publications, fraude d'un organisme compromis, mesure d'adoption sans traçage du citoyen.

### 5.3. La conformité aux données personnelles — l'intervention P0-5, jamais engagée

Le cadre légal est cité ; la conformité n'est pas instruite. L'audit énumère ce qui manque : base légale par cas d'usage, répartition responsable de traitement / sous-traitant entre `checkme` et les organismes, formalités ou autorisations CIL, notice d'information citoyen, durées de conservation par type de donnée, procédure d'exercice des droits, procédure de violation de données, localisation des données et sauvegardes, purge effective.

### 5.4. Les interventions P1 et P2, aucune engagée

Huit interventions `P1` — frontières Go, cache Redis, IAM organismes, webhooks HMAC, *rate limiting* mobile et NAT, schéma opérationnel, imports massifs, UX — et cinq `P2`. Toutes restent au statut « À faire » du [[checkme/99-sources/corpus-herite/Historique des interventions|registre des interventions]]. Depuis `DEC-C-016`, leur pertinence même est à réexaminer : plusieurs corrigent une architecture qui n'est plus acquise.

---

## 6. Risques

Le registre de risques du projet est celui de l'[[Analyse approfondie du projet|analyse approfondie]], points 10.1 à 10.3 — treize risques cotés, `R1` à `R13`. Il n'est pas recopié ici. Trois lignes appellent une correction depuis la remise en cause :

| Risque | Ce que la reprise change |
| --- | --- |
| `R1` — « tout est documentaire, rien n'est exécutable », crainte d'une paralysie par analyse | **Le risque s'aggrave en apparence et change de nature en réalité.** Reprendre la conception depuis l'intention éloigne encore le premier artefact exécutable. Mais `R1` visait un corpus figé qu'on n'osait pas exécuter ; la reprise, elle, est un mouvement. Le vrai risque devient celui de la boucle : réinstruire sans jamais clore |
| `R8` — « Elasticsearch comme *single point of failure* » | **Sans objet en l'état** : aucun document ne retient Elasticsearch. La question de fond — que se passe-t-il si l'index de lecture tombe ? — reste entière, et se pose désormais sur PostgreSQL ou Meilisearch selon l'arbitrage du point 3.1 |
| `R11` — « état ambigu non maquetté » | **Infirmé** par contrôle direct — voir l'écart `E3` |

---

## 7. Frontières — non tranchées

Trois recouvrements sont relevés par la [[Cartographie du portefeuille]] et **aucun n'est arbitré** : `checkme ∩ infUb` sur la publication générale contre la publication nominative — seule frontière déjà écrite par un porteur de projet ; `checkme ∩ ecoFab` sur les résultats d'examens et de concours ; `checkme ∩ synapse` sur un résultat officiel valant preuve de compétence.

> [!note] Par décision du porteur, chaque projet est travaillé séparément
> Les liens entre projets seront établis ensuite. La mise en conformité du 2026-09-06 n'a déplacé aucun contenu entre projets et n'a tranché aucun recouvrement.

**Élément nouveau du 2026-09-10.** Le porteur déclare que `infUb` relève de la même démarche que `checkme` — produit minimal, puis présentation à une autorité. Les deux projets peuvent donc viser la même autorité avec deux outils complémentaires. La présentation conjointe ou séparée est une question de portefeuille, **non instruite**.

---

## 8. Hypothèses et intentions de la reprise

Portées par le [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]], qui en donne l'énoncé complet, la source et le grade de preuve. Reprises ici pour que le registre soit complet ; aucune n'est promue.

| # | Énoncé | Statut | Grade | Point du document fondateur |
| --- | --- | --- | --- | --- |
| `X` | Le coût de l'accès à une liste nominative est supporté par la personne qui cherche sa ligne ; un point d'accès par identifiant le supprime sans changer la manière dont l'organisme publie | Hypothèse porteuse — trois conditions de fausseté écrites le 2026-09-10 | `N0` | 5 |
| `C2` · `C3` · `C5` | Listes volumineuses ; diffusion multicanal ; difficulté de la personne à retrouver sa situation | Hypothèses, rétrogradées de l'état de constat | `N0` | 4 |
| `C4` | Absence de point d'accès unique | Hypothèse, **établie élément par élément** par `L1` : **contredite** pour le certificat d'études primaires et l'orientation post-baccalauréat — `F15`, `F16` — ; **non contredite** pour les sept autres éléments, dont les concours de l'État — `F13` confirmée | `N1` | 4 |
| `I7` | `checkme` est le projet du coffre qui dépend le moins d'autorisations | Hypothèse **exacte jusqu'à la présentation, inexacte au-delà** | Analyse au regard de la règle `D1` | 7 |
| `I1` à `I4` | Produit sur toute la chaîne métier ; présentation à une autorité ; cession complète ; méthode | Intentions | — | 3 |
| `I8` | Démonstration livrée sur données fictives ; démonstration sur données réelles à la demande de l'autorité | Intention | — | 3, 7.1 et 8.3 |

**Verdict du premier maillon** : *non instruit*, échéance au **2026-10-31**. Point 10 du document fondateur. Le protocole d'acquisition de preuve est versé le 2026-09-10 : [[checkme/10-etudes/Programme d'études|Programme d'études]] — `DEC-C-085`. **Ses seuils sont pré-enregistrés à cette date** ; aucune collecte n'a commencé.
