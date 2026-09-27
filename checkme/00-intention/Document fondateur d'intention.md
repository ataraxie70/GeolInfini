---
projet: "checkme"
type: "document-fondateur"
phase: "00-intention"
version: "0.2"
statut: "Document d'ouverture de la reprise — non normatif"
objet: "L'intention de checkme, réécrite depuis le corpus hérité et complétée de l'intention stratégique déclarée par le porteur, avec le statut et le grade de preuve de chaque affirmation"
source_du_fond: "99-sources/corpus-herite — Vision et principes fondateurs, version 0.2"
corpus_herite: "Référence, non opposable"
verdict_d_arbitrage: "NON INSTRUIT — programme d'études versé le 2026-09-10"
echeance_du_verdict: 2026-10-31
cree_le: 2026-09-10
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - intention
  - vision
  - non-normatif
---

# Document fondateur d'intention

> [!warning] Statut du présent document
> Il ouvre la **reprise** de `checkme` depuis l'intention, décidée le 2026-09-06 par `DEC-C-016` et engagée le 2026-09-10 par `DEC-C-083` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]]. Il ne transforme aucune idée en exigence, ne valide aucun acquis du corpus hérité et ne prend aucune décision de projet.
> Il est **réécrit**, non recopié. Chaque affirmation matérielle porte sa source et son **statut** ; celles qui fondent le verdict du point 10 portent en outre leur **grade de preuve**.
> La version 0.2 intègre trois déclarations du porteur du 2026-09-10 — fonctions de la plateforme `e-concours`, échéance du jalon 1, données de la démonstration — inscrites par `DEC-C-084`.

---

## 1. Objet et principe de lecture

`checkme` possède le corpus de conception le plus développé du coffre : quatorze documents allant de la vision au modèle de données, un registre d'interventions et cinq migrations SQL jamais exécutées. Ce corpus a été produit hors de la doctrine du coffre ; son document le plus récent est daté du 2026-08-10, et ses huit documents non datés sont antérieurs à l'audit du 2026-08-02, qui les examine. Il ne cite aucune observation de terrain — ni entretien, ni volume, ni délai mesuré — et n'énonce nulle part ce qui l'invaliderait. Il est versé depuis le 2026-09-10 en `99-sources/corpus-herite/` comme **matériau de référence non opposable** — `DEC-C-082`, et registre de provenance en [[checkme/99-sources/Sources originales|Sources originales]].

Le présent document reprend la chaîne de conception à son premier maillon. Il intègre en outre l'**intention stratégique déclarée par le porteur le 2026-09-10** (point 3), qui ne figure dans aucun document antérieur et qui modifie la destination du projet.

Trois règles gouvernent ce qui suit, reprises des conventions du coffre.

1. **Séparation des trois mondes** — le monde *observé*, le monde *imaginé*, le système *construit*. Le présent document relève presque entièrement du monde imaginé ; les rares faits observés sont signalés comme tels.
2. **Aucune promotion silencieuse de statut** — la présence d'une affirmation dans le corpus hérité ne lui confère aucun statut. Elle est ici reprise, et son statut est fixé explicitement.
3. **Falsifiabilité** — toute hypothèse énonce ce qui l'invaliderait.

### 1.1. Échelle de statut

| Statut | Sens | Ce qu'il autorise |
| --- | --- | --- |
| **Fait** | Établi par observation documentée ou source citée | Peut fonder une décision |
| **Hypothèse** | Proposition à tester, assortie de ce qui l'invaliderait | Structure une étude |
| **Principe** | Règle de conception assumée ; elle n'a pas à être prouvée, elle doit être respectée ou abandonnée explicitement | Oriente la conception, ne prouve rien |
| **Intention** | Objectif déclaré par le porteur ; il n'a pas à être vrai, il a à être tenu | Oriente, ne décide pas |
| **Possibilité** | Trajectoire conservée ouverte, non sélectionnée | Ne doit jamais être lue comme un choix |
| **Décision** | Arrêtée, datée, inscrite au journal sous le préfixe `DEC-P-` | Engage |

Aucune affirmation du présent document n'atteint le statut de décision.

### 1.2. Grades de preuve

Échelle employée pour l'arbitrage du point 10. Une affirmation reprise dans un document aval **conserve son grade d'origine** : un fait ne gagne pas en solidité en changeant de document.

| Grade | Nature |
| --- | --- |
| `N0` | Assertion — aucune source |
| `N1` | Source publique, documentaire, ou cas comparable |
| `N2` | Déclaration directe de la personne concernée |
| `N3` | Comportement observé de la personne concernée — elle a agi |
| `N4` | Engagement coûteux et irréversible — paiement, signature, ressource immobilisée |

---

## 2. L'intention fondatrice

> **Qu'une personne retrouve, en quelques secondes et sans intermédiaire, l'information officielle nominative qui la concerne, à partir de l'identifiant que l'organisme émetteur lui a attribué.**

Source : [[Vision et principes fondateurs]], points 1, 3 et 8, réécrits. **Statut : intention.**

L'objet visé n'est pas la publication — les organismes publient déjà — mais l'**accès individuel** à ce qui est publié. Le point 2 de la vision héritée le formule ainsi : *« Le problème n'est donc pas seulement la publication. Le problème central est l'accès rapide à l'information concernant une personne. »*

Le système ne produit aucune décision administrative. Il en facilite la consultation.

**Champ d'application envisagé** — concours, recrutements, examens, convocations, affectations, admissions, présélections, résultats scolaires, bourses. Source : point 5 de la vision héritée. **Statut : possibilités — aucune catégorie n'est sélectionnée.**

---

## 3. L'intention stratégique déclarée par le porteur

Déclarée le 2026-09-10. Elle n'existe dans aucun document du corpus hérité.

| # | Énoncé | Statut |
| --- | --- | --- |
| `I1` | Construire un premier produit fonctionnel sur **toute la chaîne métier** : de la mise en ligne d'une publication par un organisme jusqu'à la consultation de sa situation par la personne concernée | Intention |
| `I2` | Présenter ce produit à une **autorité publique** — le ministère chargé de la transition digitale, le ministère chargé de la fonction publique, ou une autre autorité — qui, si elle le juge faisable, reprendrait le projet | Intention |
| `I3` | Issue visée en cas de reprise : **cession complète**. Le code, la documentation et l'exploitation sont transférés à l'autorité ; le porteur accompagne la passation, puis se retire | Intention |
| `I4` | Méthode : observer le problème, l'étudier sous toutes ses facettes, construire le produit minimal, puis le présenter | Intention — elle coïncide avec l'ordre de la reprise, point 13 |
| `I5` | Aucune échéance extérieure n'est fixée | Fait déclaratif |
| `I6` | Le porteur ne dispose d'**aucun accès privilégié** au terrain — ni dans un ministère, ni dans un organisme émetteur, ni auprès de candidats. L'étude part des sources publiques | Fait déclaratif |
| `I7` | Motif du choix de `checkme` parmi les projets du coffre : c'est le projet qui dépend le moins d'autorisations pour être lancé, en raison de son caractère neutre | **Hypothèse** — instruite au point 7 |
| `I8` | Données de la démonstration : le porteur livre une démonstration sur **données fictives** ; l'autorité peut demander une démonstration sur **données réelles**, et le produit reste en mesure de la fournir | Intention — conséquences aux points 7.1 et 8.3 |

Le porteur a déclaré le même jour que le projet `infUb` relève de la même démarche — observation, étude, produit minimal, présentation à une autorité. Cette déclaration est consignée au point 11 ; elle n'est pas instruite ici.

### 3.1. Désignation des autorités citées

Les dénominations ministérielles changent au gré des remaniements. Le présent document emploie donc la formule administrative neutre — *ministère chargé de…* — et consigne ci-dessous la dénomination en vigueur, vérifiée le 2026-09-10.

| Désignation employée | Dénomination officielle vérifiée | Grade | Source |
| --- | --- | --- | --- |
| Ministère chargé de la transition digitale | **Ministère de la Transition digitale, des Postes et des Communications électroniques** (MTDPCE) | `N1` | Site officiel du ministère |
| Ministère chargé de la fonction publique | **Ministère des Serviteurs du Peuple** (MSP), depuis le remaniement de janvier 2026. Dénomination antérieure : Ministère de la Fonction publique, du Travail et de la Protection sociale (MFPTPS) | `N1` | Site officiel du ministère ; Financial Afrik, 13 janvier 2026 |
| Autorité de protection des données personnelles | **Commission de l'informatique et des libertés** (CIL), autorité de contrôle de la loi n°001-2021/AN du 30 mars 2021 portant protection des personnes à l'égard du traitement des données à caractère personnel | `N1` | Assemblée nationale ; Association francophone des autorités de protection des données personnelles |

> [!note] Écart relevé dans le corpus hérité
> Le risque `R2` de l'[[Analyse approfondie du projet]] désigne l'autorité de contrôle sous le nom d'*« Autorité de Protection des Données Personnelles »*, qui n'est pas sa dénomination au Burkina Faso. L'[[Audit complet du projet]], point P0-5, la nomme correctement : la CIL.

---

## 4. Le constat qui motive l'intention

Source : point 2 de la vision héritée. Les faits `N1` ci-dessous ont été établis le 2026-09-10 **au cours de la vérification des dénominations du point 3.1**, avant qu'aucun seuil d'étude ne soit écrit. Ils ne sont pas le résultat d'un lot d'étude.

| # | Constat du corpus | Statut et grade | Ce qui manque pour le tenir |
| --- | --- | --- | --- |
| `C1` | Les organismes publient leurs résultats sous forme de listes — PDF, images, communiqués | **Fait**, `N1` pour les concours de l'État : l'Agence générale de recrutement de l'État publie notamment des *« Résultats de présélection après l'écrit par centre et par ordre de numéro récépissé aux concours directs »* | Un relevé des formats réels par catégorie de publication, et notamment la part des listes publiées en **texte cherchable** et la part publiée en **image** |
| `C2` | Ces listes sont parfois très volumineuses | Hypothèse, `N0` | La taille réelle — lignes, pages — d'un échantillon de listes |
| `C3` | La diffusion se fait sur plusieurs canaux : sites, Facebook, WhatsApp, affichage | Hypothèse, `N0` — observable sur sources publiques | Le relevé des canaux d'un échantillon de publications |
| `C4` | Il n'existe aucun point d'accès unique | Hypothèse, `N0`. Pour les concours de l'État, le dispositif officiel **ne la contredit pas** selon la déclaration du porteur : il s'arrête à la candidature et au récépissé — voir l'encadré ci-dessous | Pour chaque catégorie de publication, l'existence ou non d'un point d'accès individuel officiel ; pour les concours de l'État, la confirmation de la déclaration du porteur sur source publique |
| `C5` | Une personne a du mal à retrouver l'information qui la concerne | Hypothèse, `N0` — **c'est l'hypothèse porteuse du projet** | Des traces publiques de cette difficulté — demandes d'aide, intermédiaires rémunérés — et une mesure de temps sur des listes réelles |

> [!important] Le dispositif officiel des concours s'arrête au récépissé
> Les concours de la fonction publique disposent d'un **dispositif numérique officiel**, que le corpus hérité ignore. L'**Agence générale de recrutement de l'État** (AGRE), créée par le décret n°2008-001/PRES/PM/MFPRE du 9 janvier 2008, exploite le portail `concours.gov.bf` ; les candidatures y sont reçues *« en ligne exclusivement sur la plateforme e-concours d'inscription »* ; une application mobile, *eConcoursBF*, est publiée sous un identifiant rattaché à l'ancienne dénomination du ministère chargé de la fonction publique. `N1`.
> **Déclaration du porteur, 2026-09-10** : la plateforme `e-concours` permet **seulement de postuler à un concours et de recevoir son récépissé**. Elle n'offre pas la consultation individuelle du résultat. La déclaration est cohérente avec le fait `N1` que l'AGRE publie ses résultats sous forme de listes classées par numéro de récépissé ; elle reste à confirmer sur source publique par le lot « état de l'art », point 10.3.
> **Conséquence, si elle est confirmée** : pour les concours de l'État, l'accès individuel au résultat manque exactement là où tout le reste existe déjà — un identifiant attribué par un dispositif de l'État, le numéro de récépissé ; des listes publiées dans l'ordre de cet identifiant ; un émetteur rattaché à l'une des deux autorités citées par le porteur. **Statut : possibilité** — la première catégorie de publication reste à choisir au cadrage.
> Le corpus hérité cite le *numéro de récépissé* comme l'identifiant le plus fiable, sans jamais mentionner le dispositif qui l'attribue.

---

## 5. La thèse, énoncée de façon falsifiable

> **X** — Lorsqu'une information officielle nominative est publiée sous forme de liste, le coût de l'accès est supporté par la personne qui cherche sa ligne — temps, déplacement, intermédiaire, incertitude — et non par l'organisme qui publie. Un point d'accès où la personne saisit l'identifiant que l'organisme lui a attribué, et n'obtient que sa propre situation, supprime ce coût sans rien changer à la manière dont l'organisme décide et publie.
>
> **Le marché agit comme si non-X** — les organismes continuent de publier des listes intégrales, et les personnes s'en accommodent.

**Statut : hypothèse — non instruite.**

**Conditions de fausseté**, écrites le 2026-09-10, avant toute collecte :

1. **Le contournement est suffisant.** Si la liste publiée est, pour la majorité des personnes concernées, facile à trouver, publiée en texte cherchable et consultable sur un téléphone, le coût d'accès est marginal et la thèse tombe.
2. **La place est prise.** Si les catégories de publication à fort volume disposent déjà d'un point d'accès individuel officiel, la thèse ne vaut plus que pour les catégories restantes, qui doivent alors être nommées et mesurées. Pour les concours de l'État, la déclaration du porteur écarte ce cas, sous réserve de confirmation — point 4.
3. **Le coût n'a pas de propriétaire public.** Si aucune autorité publique ne tient le coût supporté par la personne pour un problème qui lui incombe, l'issue du point 3 disparaît, quelle que soit la réalité de ce coût.

La condition 2 est la plus lourde, et la moins coûteuse à instruire. Le corpus hérité ne la pose nulle part.

---

## 6. Les principes hérités

Source : point 6 de la vision héritée et [[Stratégie de recherche et de correspondance]]. **Statut : principes de conception.** Ils sont repris sans être promus.

| Principe | Énoncé | Observation |
| --- | --- | --- |
| Neutralité | Le système ne décide jamais ; il diffuse uniquement les informations fournies par les organismes | Principe identitaire du projet. Il est aussi la source de sa dépendance principale — point 7 |
| Responsabilité des organismes | Chaque organisme reste responsable de ses publications, de leur exactitude et de leurs mises à jour | Fonde la répartition des responsabilités au titre de la loi n°001-2021/AN, qui n'est pas instruite |
| Le document officiel reste la preuve | Le produit est l'information structurée ; le document publié par l'organisme fait foi | Tout résultat affiché renvoie au document officiel dont il provient |
| La publication est l'unité | Organisme, catégorie, session, modèle, ensemble d'enregistrements | Choix de modélisation, à reconfronter au terrain |
| La consultation est contextualisée | Une personne consulte toujours une publication précise ; la recherche n'est jamais globale | **Le principe de protection des données le plus structurant du corpus** : il interdit de parcourir l'ensemble des personnes publiées |
| Les identifiants sont définis par l'organisme | Le système ne crée aucun identifiant national | Conforme à la règle `D1` de la [[Doctrine du coffre]] : aucun référentiel national n'est requis |
| Les identifiants ont un niveau de confiance | Numéro de récépissé, numéro de carte nationale d'identité burkinabè (CNIB), matricule, puis nom et prénom | Précisé par la stratégie de recherche héritée : un identifiant faible, comme le nom, ne suffit jamais seul, et le résultat est toujours *trouvé*, *ambigu* ou *aucun* |
| Une personne recherche sa situation | Son statut, sa convocation, son affectation, son résultat — non un document | Distingue `checkme` d'une bibliothèque de documents |
| Indépendance du mode d'intégration | Import de fichier, interface de programmation, connecteur : le mode d'alimentation ne change pas le fonctionnement | Choix de modélisation |
| Pluralité des organismes | Chaque organisme dispose de son espace, sans dépendre d'aucun autre | Oriente vers une plateforme commune. **En tension avec une cession à un seul émetteur**, point 8.2 |

---

## 7. Neutralité et autorisations — l'hypothèse `I7` au regard de la règle `D1`

La règle `D1` de la [[Doctrine du coffre]] pose qu'*« une dépendance qu'on ne signe pas soi-même est une cible, jamais une condition d'existence »*, et se vérifie par deux questions : **qui signe**, et **que fait le système si la signature n'arrive jamais**.

| Étape | Qui signe | Si la signature n'arrive jamais | Lecture au regard de `D1` |
| --- | --- | --- | --- |
| Construire le produit sur des **données fictives** | Personne | Sans objet | Conforme |
| Le démontrer sur des **données réelles**, à la demande de l'autorité — intention `I8` | L'autorité, qui désigne ses listes et en autorise l'usage. Le cadre du traitement pendant la démonstration — qualité de responsable ou de sous-traitant, formalités auprès de la CIL — n'est pas instruit, `N0` | La démonstration reste sur données fictives, qui en sont le livrable de base | Conforme : la démonstration sur données réelles n'est jamais sur le chemin critique |
| Le **présenter** à une autorité | L'autorité, qui accorde ou non une audience | Le projet s'arrête à un démonstrateur documenté | Cible, non condition d'existence |
| Le **céder**, puis l'**exploiter** | L'autorité, qui accepte la cession ; puis chaque organisme émetteur, qui accepte de publier | Aucune personne n'est servie | Dépendance transférée à l'autorité par la cession |

**Conclusion sur `I7`** : l'hypothèse est **exacte jusqu'à la présentation, inexacte au-delà**. Aucune signature de tiers n'est nécessaire pour construire et présenter le produit ; aucune personne réelle ne peut être servie sans qu'un tiers ait signé.

> [!important] La neutralité rend le projet présentable, et elle le rend dépendant
> Par le principe de neutralité, le système ne diffuse que ce que les organismes lui fournissent. Il n'a donc **aucun contenu propre** : sans organisme qui publie, il n'y a rien à consulter.
> La neutralité réduit la surface de conflit avec une administration — le système ne décide rien et ne concurrence aucune prérogative —, et c'est vraisemblablement ce qui la rend acceptable. `N0 — à vérifier`.
> Mais elle exclut, par construction, le mode autonome que la règle `D1` exige d'un projet qui prétend servir des personnes réelles. Cette exclusion n'est pas un défaut de conception : elle est le prix du principe, et elle rend la cession du point 3 **nécessaire**, et non seulement souhaitée.

### 7.1. La question qui commande tout le reste

> **D'où vient la donnée tant qu'aucun organisme n'a accepté de publier ?**

| Réponse | Ce que le projet devient | Dépendance | Compatibilité avec les principes |
| --- | --- | --- | --- |
| **Données fictives** | Un démonstrateur, sans usager | Nulle | Totale, mais aucune preuve d'usage réel n'est possible |
| **Listes déjà publiées**, indexées avec renvoi au document officiel | Un service d'accès utilisable dès le premier jour, sans signature d'organisme | Juridique : le porteur traite des données nominatives qu'il n'a pas reçues de l'organisme | En tension avec la responsabilité des organismes, qui n'ont pas choisi ce canal |
| **Publication par l'organisme lui-même** | Une plateforme conforme à tous les principes | Forte : chaque organisme signe | Totale |

**Réponse du porteur pour la démonstration, 2026-09-10 — intention `I8`.** Le porteur livre une démonstration sur **données fictives** ; l'autorité peut demander une démonstration sur **données réelles**, et le produit doit rester en mesure de la fournir. Une démonstration sur données réelles demandée par l'autorité se fait avec son accord et sur ses propres listes : elle relève de la **troisième** réponse du tableau, non de la deuxième.

**Pour le produit exploité**, la cession complète place la donnée chez l'autorité elle-même, qui publie ses propres listes. La deuxième réponse — l'indexation de listes publiées sans l'accord de l'organisme émetteur — n'est donc requise par aucune étape de l'issue déclarée. Elle n'est ni retenue ni exclue ; elle reste une possibilité.

Le corpus hérité ne pose jamais cette question : il suppose un organisme qui publie. Sa réponse définitive se prend au cadrage. La première pièce juridique de l'étude porte en conséquence sur le cadre d'une démonstration conduite sur les données réelles de l'autorité : qualité de chacun au regard du traitement, instructions, durée de conservation, destruction à l'issue.

---

## 8. L'issue visée — ce que la cession complète implique

### 8.1. Le basculement en infrastructure publique

La règle `D2` de la [[Doctrine du coffre]] pose qu'un projet sans payeur identifiable bascule du statut de produit à celui d'**infrastructure publique ou d'œuvre**, et que ce basculement *« doit être acté explicitement, jamais subi »*.

La déclaration `I3` place `checkme` dans ce cas **dès l'intention** : le projet est conçu pour devenir une infrastructure exploitée par l'État, non un produit exploité par son porteur. **Statut : intention déclarée.** Le basculement sera acté par une décision de projet au jalon de cadrage, une fois le lot « payeur » instruit.

| Question | Conséquence de la cession complète |
| --- | --- |
| **À qui appartient l'actif ?** | À l'autorité cessionnaire. Le porteur ne conserve aucune position propre : la question de l'actif, au sens de la règle `D2`, se pose désormais pour l'État et non pour le porteur |
| **Qui paie ?** | Avant la cession, le porteur seul — construction, hébergement du démonstrateur. Après la cession, l'autorité. Aucun revenu n'est visé |
| **Que doit être le livrable ?** | Non pas seulement un produit qui fonctionne, mais un produit **transférable** : code source, documentation, procédures d'exploitation, dossier de conformité à la loi n°001-2021/AN, hébergement compatible avec les exigences de l'État. **La transférabilité devient une exigence de conception de premier rang** |
| **Par quelle voie ?** | Non instruite. La voie d'accès à l'autorité est le **seul canal de sortie** du projet, et le porteur n'y a pas d'accès déclaré — `I6` |

### 8.2. Deux autorités de nature différente

Les deux autorités citées par le porteur ne sont pas interchangeables.

| Autorité | Nature | Conséquence |
| --- | --- | --- |
| Ministère chargé de la fonction publique, et l'AGRE qui lui est rattachée | **Émetteur** : l'un des plus importants producteurs de listes nominatives de l'État, par les recrutements | Après cession, il exploiterait l'outil sur ses propres données, sans dépendance à un tiers. Il exploite déjà un dispositif numérique qui, selon la déclaration du porteur, s'arrête au récépissé : l'accès individuel au résultat en serait le prolongement direct — point 4, à confirmer |
| Ministère chargé de la transition digitale | **Opérateur d'infrastructures** numériques de l'État, sans listes nominatives propres de cette nature, `N0 — à vérifier` | Après cession, l'outil deviendrait une plateforme commune à plusieurs émetteurs, conformément au principe de pluralité ; la dépendance aux émetteurs demeure, mais interne à l'État |

Le choix entre **un outil pour un émetteur** et **une plateforme pour tous les émetteurs** est une décision de cadrage. **Statut : possibilités.**

### 8.3. Le produit minimal porte deux fonctions, réparties entre le produit et l'étude

Le produit minimal de l'intention `I1` aurait à la fois à **rendre la thèse réfutable** — ce qui exige des personnes réelles cherchant une situation réelle — et à **convaincre une autorité**. Ces deux fonctions ne coïncident pas : un produit sur données fictives peut convaincre, il ne réfute rien.

L'intention `I8` les répartit. **Le produit minimal convainc** : démonstration sur données fictives livrée par le porteur, démonstration sur données réelles à la demande de l'autorité. **L'étude réfute** : la thèse est éprouvée par les traces publiques du coût d'accès et par les entretiens du point 10.3, non par l'usage du produit.

Deux exigences de conception en découlent.

1. **Le produit accepte les données réelles de l'autorité dans leurs formats effectifs**, et non un seul jeu de données fictives taillé pour lui. Sans cette capacité, la flexibilité déclarée par `I8` n'existe pas.
2. **Le cadre juridique d'une démonstration sur données réelles est prêt avant qu'elle soit demandée**, puisque la date de cette demande appartient à l'autorité.

Le périmètre fonctionnel proposé par l'[[Audit complet du projet]], point 10 — un organisme, un administrateur, une publication, un modèle simple, un import de fichier, la publication, l'indexation, la recherche exacte, un journal d'audit minimal — couvre la chaîne métier de `I1`. **Statut : proposé**, à reconfronter après l'étude.

---

## 9. Le corpus hérité — ce qu'il apporte, ce qu'il ne prouve pas

**Ce qu'il apporte.** Une formulation juste du problème — l'accès, non la publication. Les principes de consultation contextualisée et de confiance graduée des identifiants, et le contrat de résultat *trouvé*, *ambigu*, *aucun*, qui constituent sa contribution la plus solide : ils traitent la non-divulgation comme une propriété de conception et non comme un ajout. Un premier découpage du domaine en contextes bornés, à reconfronter après le cadrage. Une discipline de correction — un audit, puis des interventions ordonnées. Un périmètre de produit minimal, point 8.3.

**Ce qu'il ne prouve pas.** Que le coût d'accès existe et qu'il soit significatif. Que la place soit libre : il ne contient aucun état de l'art et ignore le dispositif de l'AGRE. Qu'une autorité le souhaite, et que le porteur puisse l'atteindre. Que son exploitation soit licite, et sous quelle formalité. Les volumes à servir. L'accès des personnes sans téléphone intelligent et la question des langues, que l'analyse approfondie range parmi ses zones d'ombre. L'identité du payeur.

**Ce qu'il fixe avant d'avoir mesuré.** Une architecture de production — monolithe modulaire, séparation de la lecture et de l'écriture, publication transactionnelle des événements, projection reconstructible — arrêtée avant tout dimensionnement ; le risque `R4` de l'analyse approfondie relève cette absence de dimensionnement. Les deux points contestés du corpus — le moteur de l'index de consultation, et la recherche par nom sur l'écran citoyen — relèvent de la phase d'architecture et ne sont pas traités ici. Voir le point 3 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]].

---

## 10. Arbitrage — verdict de porte

### 10.1. Méthode

Le projet est arbitré contre deux principes cumulatifs. **Actif indétrônable** : le projet produit-il une position structurelle difficile à copier ou à déloger ? **Valeur incontestable** : la personne concernée reconnaît-elle elle-même un bénéfice mesurable ? Aucun critère ne peut être noté au-dessus de 2 sur 4 sans preuve `N2`, ni atteindre 4 sans preuve `N3`.

Lorsqu'un projet a **déclaré d'avance** qu'il n'avait pas de preuve, il échoue mécaniquement aux deux seuils ; le noter comme un projet qui prétend être prêt reviendrait à sanctionner sa rigueur. Dans ce seul cas, le verdict est **non instruit**, et c'est le **programme d'acquisition de preuve** qui est jugé à la place du projet.

### 10.2. Conditions d'ouverture du verdict « non instruit »

| Condition | Vérification | Remplie |
| --- | --- | --- |
| Non-instruction déclarée avant l'évaluation | Le corpus hérité la reconnaît lui-même : risque `R4` de l'[[Analyse approfondie du projet]], *« aucun sizing, aucun benchmark »*. La [[Doctrine du coffre]] la relève le 2026-09-09 : *« À instruire. Pas de programme d'études »*. La note d'entrée et la [[checkme/90-pilotage/Carte des phases\|Carte des phases]] la déclarent depuis le 2026-09-06, et leurs versions du 2026-09-10 la maintiennent | Oui |
| Absence de preuve, jamais preuve contraire | Aucune observation de la personne concernée, favorable ou défavorable, n'existe. Le dispositif officiel des concours, point 4, ne couvre pas l'accès individuel au résultat selon la déclaration du porteur : il n'apporte pas de preuve contraire | Oui |
| Échéance portée | Point 10.4 | Oui |

### 10.3. Verdict

> **NON INSTRUIT — programme d'études à écrire.**
> Aucun des deux principes ne peut être noté : les seuils échouent par **absence de preuve**, non par preuve contraire. Aucun programme d'acquisition n'existe encore ; il est l'objet du maillon suivant, et doit contenir au minimum les lots ci-dessous — un par critère bloquant.

| Lot à écrire | Ce qu'il instruit | Critère qu'il débloque | Rang |
| --- | --- | --- | --- |
| **État de l'art et cimetière** | Pour chaque catégorie de publication — concours de l'État, examens scolaires nationaux, universités, bourses, affectations —, les points d'accès individuels officiels et privés existants, et les tentatives abandonnées avec leur cause. Pour les concours de l'État, la confirmation sur source publique de la déclaration du porteur sur `e-concours` | Condition de fausseté 2 ; place disponible | **Premier** : c'est le test le moins coûteux qui décide le plus |
| **Relevé des listes publiées** | Sur un échantillon pré-enregistré : format — texte cherchable ou image —, taille, canaux de diffusion, délai entre publication et disponibilité | Condition de fausseté 1 ; constats `C1` à `C4` | Vague 0 |
| **Traces publiques du coût d'accès** | Demandes d'aide sous les publications, intermédiaires rémunérés, services de vérification proposés contre paiement, indisponibilité des sites le jour d'une publication | Constat `C5` ; aveu de la personne concernée par son **comportement**, `N3`, observable sans accès privilégié | Vague 0 |
| **Cadre juridique** | Formalités auprès de la CIL pour chacune des trois réponses du point 7.1 ; articulation entre l'obligation de publicité des résultats et la minimisation des données ; répartition des responsabilités de traitement ; conditions dans lesquelles l'État peut recevoir un logiciel cédé par un particulier | Point 7.1 ; règle `D1` ; interdit éventuel | Vague 0 pour sa première question |
| **Personnes concernées** | Entretiens avec des personnes ayant récemment cherché leur situation dans une liste, recrutées par des canaux publics, conduits avec un guide qui n'emploie ni le nom ni les concepts du projet | Bénéficiaire nommable ; bénéfice mesuré dans son unité — minutes, francs CFA, déplacements | Après la vague 0 |
| **Actif** | Ce qui s'accumule — archive des publications, habitude de consultation —, si cela se creuse, et à qui cela appartient, dans l'hypothèse de la cession | Principe 1 ; règle `D2` | Programme |
| **Payeur** | Qui porte aujourd'hui une ligne de coût, même cachée : la personne — données mobiles, déplacement, intermédiaire —, l'organisme — affichage, insertion dans la presse, traitement des réclamations, hébergement aux pics de trafic. Distinction explicite entre qui subit, qui décide et qui paie | Règle `D2` ; acte du basculement du point 8.1 | Programme |
| **Autorité et voie d'accès** | Programmes publics existants et projets concurrents internes à l'administration ; dispositifs par lesquels un particulier peut présenter un projet à un ministère ; intérêt de l'autorité, mesuré par ce qu'elle a déjà engagé | Ancrage institutionnel ; canal de distribution, seul canal de sortie du projet | Programme |

Le programme doit en outre porter l'issue **« ne pas construire »** comme une issue explicite, avec des seuils chiffrés et **pré-enregistrés** conformément à la règle `D3` de la [[Doctrine du coffre]].

**Programme versé le 2026-09-10** : [[checkme/10-etudes/Programme d'études|Programme d'études]], version 0.1 — `DEC-C-085`. Les huit lots exigés y figurent, sous les numéros `L1` à `L8`, avec un neuvième lot facultatif.

### 10.4. Échéance

**Le jalon 1 du programme d'études se tient au plus tard le 2026-10-31.** À cette date, l'absence de preuve sur la **place disponible** et sur le **coût d'accès observable** vaut réponse négative sur ces deux points.

Le porteur a confirmé cette échéance le 2026-09-10 comme **plafond** : une date antérieure est admise, et le programme d'études peut en fixer une.

Motif de la date : la vague 0 ne mobilise que des sources publiques et aucune dépense, et le programme d'études de `levelup`, de même nature, est déclaré capable d'atteindre son jalon 1 en trois semaines sans dépense de terrain — point 12 du [[levelup/00-intention/Document fondateur d'intention|document fondateur de levelup]]. S'y ajoutent l'écriture du programme et une marge. La date se modifie aux conditions de la règle `D3` : inscrite au journal, datée, et motivée par autre chose que le résultat obtenu.

**Règle de non-renouvellement.** Un second verdict *non instruit* portant sur les mêmes critères vaut **rejet**.

---

## 11. Recouvrements avec les autres projets du coffre

| Projet | Nature du recouvrement | État |
| --- | --- | --- |
| `infUb` | Frontière posée par le point 7 du [[Document de référence global]] : `infUb` répond à *« qu'est-ce qui a été publié ? »*, `checkme` à *« quel est mon statut individuel ? »*. **Élément nouveau du 2026-09-10** : le porteur déclare que `infUb` relève de la même démarche — produit minimal, puis présentation à une autorité. Les deux projets peuvent donc viser **la même autorité**, le ministère chargé de la transition digitale, avec deux outils complémentaires | Frontière réglée ; **présentation conjointe ou séparée non instruite** — question de portefeuille, portée à la [[Cartographie du portefeuille]] |
| `ecoFab` | Résultats d'examens et de concours universitaires | Partiel, frontière claire |
| `synapse` | Un résultat officiel consulté dans `checkme` est aussi une preuve de compétence exploitable par `synapse` | Non instruit |

---

## 12. Ce qui demeure explicitement non décidé

Aucune décision de projet n'est prise. Sont notamment suspendus :

Le nom du produit · la première catégorie de publication · l'autorité visée · la réponse à la question du point 7.1 hors démonstration, la démonstration étant orientée par l'intention `I8` · le périmètre du produit minimal · les canaux d'accès — web, messagerie SMS, codes USSD — et les langues · l'hébergement · la conformité à la loi n°001-2021/AN · les modalités de la cession · la forme juridique sous laquelle le porteur cède · le *Core Domain* · le découpage en contextes bornés · l'architecture, le modèle de données et la pile technique · les deux points contestés du corpus hérité.

Le découpage en contextes bornés et l'architecture figurent dans cette liste **bien qu'ils existent en détail dans le corpus hérité** : ils ont été produits avant toute étude, et leur validité dépend d'hypothèses non instruites.

---

## 13. Ce que la reprise doit produire, et dans quel ordre

Le corpus hérité a été construit de l'architecture vers le métier. La reprise procède dans l'ordre inverse, et prolonge la chaîne jusqu'à l'issue déclarée par le porteur.

```
INTENTION  (le présent document)
   v
ÉTUDE — la place est-elle libre, le coût est-il réel, la démonstration est-elle licite, l'autorité est-elle atteignable ?
   v
CADRAGE STRATÉGIQUE — première catégorie, autorité visée, origine de la donnée, basculement en infrastructure publique acté
   v
DDD STRATÉGIQUE — Core Domain, contextes bornés, langage ubiquitaire
   v
DDD TACTIQUE — agrégats, invariants, événements
   v
ARCHITECTURE — décisions, données, sécurité, hébergement ; la transférabilité comme exigence
   v
IMPLÉMENTATION — produit minimal couvrant toute la chaîne métier
   v
PRÉSENTATION À L'AUTORITÉ
   v
CESSION
```

**Calibrage retenu : chaîne complète et formalisée.** Trois motifs, dont chacun suffirait. Le produit traite des données nominatives soumises à la loi n°001-2021/AN. Il est destiné à être examiné, puis éventuellement repris, par une administration qui en exigera la justification. La cession complète impose un dossier transférable, que seule une chaîne documentée peut produire.

**Garde-fou.** Chaque phase porte un jalon et une échéance, afin que la reprise ne devienne pas une réinstruction sans fin — risque `R1` de l'analyse approfondie, requalifié au point 6 du [[checkme/90-pilotage/Registre des statuts|Registre des statuts]]. La première échéance est celle du point 10.4.

L'étude peut conclure que le projet **ne doit pas être construit**, ou qu'il doit l'être pour une autre catégorie de publication que celle qui paraît aujourd'hui la plus évidente.

---

## Sources externes consultées le 2026-09-10

- [Ministère de la Transition digitale, des Postes et des Communications électroniques — site officiel](https://www.mdenp.gov.bf/accueil)
- [Ministère des Serviteurs du Peuple — site officiel](https://www.fonction-publique.gov.bf/accueil)
- [Financial Afrik, « Burkina Faso : naissance d'un ministère des "serviteurs du peuple" dans le gouvernement Rimtalba II », 13 janvier 2026](https://www.financialafrik.com/2026/01/13/burkina-faso-naissance-dun-ministere-des-serviteurs-du-peuple-dans-le-gouvernement-rimtalba-ii/)
- [Agence générale de recrutement de l'État — portail des concours](https://www.concours.gov.bf)
- [Plateforme e-concours — inscription en ligne aux concours directs](https://www.econcours.gov.bf/)
- [Application eConcoursBF — fiche de publication](https://play.google.com/store/apps/details?id=bf.mfptps.econcoursbf)
- [Assemblée nationale — loi n°001-2021/AN portant protection des personnes à l'égard du traitement des données à caractère personnel](https://www.an.bf/loip/143)
- [Association francophone des autorités de protection des données personnelles — texte de la loi n°001-2021/AN](https://www.afapdp.org/archives/download-view/burkina-faso-decret-2021-0276-promulguant-la-loi-n001-2021-du-30-mars-2021-portant-protection-des-personnes-a-legard-du-traitement-des-donnees-a-caractere-personnel)

---

*Version 0.2 du 2026-09-10 — ouverture de la reprise, complétée des déclarations du porteur sur la plateforme `e-concours`, l'échéance du jalon 1 et les données de la démonstration. Le corpus hérité reste consultable en `99-sources/corpus-herite/` et n'est opposable en rien.*
