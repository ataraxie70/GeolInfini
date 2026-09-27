---
projet: "ecoFab"
type: "note-d-analyse"
phase: "10-etudes"
objet: "Quel objet métier constitue le point d'entrée du produit, et qui l'alimente"
statut: "Analyse — produit des hypothèses, aucune décision"
niveau_de_preuve: "4 (raisonnement et analogie) sauf mentions explicites — oriente, ne conclut pas"
monde: "Monde imaginé — confronté au monde observé par L1, L3, L6, L7"
document_parent: "[[Programme d'études approfondies]]"
lots_concernes: "L1, L3, L6, L7, L9"
cree_le: 2026-09-06
tags:
  - ecoFab
  - etudes
  - point-d-entree
  - core-domain
  - hypotheses
---

# Analyse du point d'entrée

> [!warning] Statut de la présente note
> Elle **ne décide rien**. Selon la hiérarchie de preuve du point 7 du [[Programme d'études approfondies]], l'essentiel de ce qui suit relève du **niveau 4** — raisonnement, analogie, déduction à partir des faits établis. Le niveau 4 *« produit des hypothèses, jamais des conclusions »*.
> Sa fonction est de rendre le point 3.0 **falsifiable** : transformer une intuition défendable en un jeu d'hypothèses qu'un terrain peut casser.

---

## 1. Pourquoi la question du point d'entrée est la question décisive

Le point 2.6 établit un fait qui contraint tout le reste : **WhatsApp est déjà là**, installé, gratuit à l'usage perçu, sans apprentissage, avec tout le carnet d'adresses. Le projet ne se bat pas contre une absence d'outil, il se bat contre un **coût de substitution nul chez le concurrent** et un coût d'adoption non nul chez lui : installation consommant des données, création de compte, apprentissage, et surtout **amorçage réseau**.

Un point d'entrée n'est donc pas la première fonctionnalité à développer. C'est la réponse à une question unique :

> **Qu'est-ce qui fait qu'un étudiant ouvre une seconde application, un mardi ordinaire, alors que son groupe WhatsApp fonctionne ?**

---

## 2. Grille d'évaluation

Six critères. Les trois premiers décident de l'adoption, les trois suivants de la viabilité.

| # | Critère | Pourquoi il est éliminatoire |
| --- | --- | --- |
| **C1** | **Valeur pour l'utilisateur seul** | Un objet sans valeur avant que les autres n'arrivent condamne le produit au démarrage à froid. C'est le critère le plus discriminant, et le plus souvent oublié. |
| **C2** | **Fréquence de consultation** | Crée l'habitude d'ouvrir. Une douleur annuelle ne construit pas un usage. |
| **C3** | **Échec structurel de la messagerie** | Si WhatsApp fait la chose correctement, ou pourrait la faire demain, il n'y a pas de rupture durable. |
| **C4** | **Niveau de dépendance institutionnelle** | Doit être viable en **niveau 3 ou 4** dès le premier jour (règle L5). Un produit qui attend une convention n'est pas un produit. |
| **C5** | **Coût en données mobiles** | Contrainte L6. Le lot le plus susceptible de disqualifier une ambition sans qu'aucune étude d'usage ne l'ait laissé prévoir. |
| **C6** | **Pouvoir structurant** | Le point d'entrée doit forcer à modéliser établissement / UFR / filière / niveau / promotion / rôles — le socle dont tout le reste dépend. |

---

## 3. Les six échecs structurels d'une messagerie

Distinction importante : un échec **contingent** peut être corrigé par une mise à jour du concurrent ; un échec **structurel** découle du modèle « flux de messages » et ne sera jamais corrigé, parce que le corriger reviendrait à cesser d'être une messagerie.

| # | Échec structurel | Conséquence concrète |
| --- | --- | --- |
| **E1** | **Pas d'état courant** | Un flux n'a pas de « version actuelle » d'un objet. Les versions successives d'un même emploi du temps coexistent dans l'historique, et rien n'indique laquelle fait foi. |
| **E2** | **Pas de recherche utile** | Ce qui circule en photo ou en scan est invisible à la recherche textuelle. |
| **E3** | **Pas d'adressage** | Un lien peut désigner un *message*, jamais « l'emploi du temps de L2 Informatique ». |
| **E4** | **Pas de séparation signal / bruit** | L'information officielle et la conversation partagent le même flux. |
| **E5** | **Pas de continuité** | Le groupe meurt avec l'année académique ou avec le compte de son créateur. |
| **E6** | **Pas de rôle** | L'administrateur est une *personne*, jamais une *fonction* transmissible. |

Ces six échecs sont la matière première du projet. **Le meilleur point d'entrée est l'objet qui souffre du plus grand nombre d'entre eux à la fois.**

---

## 4. Mise en concurrence des candidats

Candidats tirés du point 14 du [[Document fondateur d'ouverture]]. Notation : **oui** (critère satisfait) / **partiel** / **non** (critère en échec).

| Candidat | C1 seul | C2 fréq. | C3 échecs | C4 dép. | C5 données | C6 struct. |
| --- | --- | --- | --- | --- | --- | --- |
| **Emploi du temps** | oui | oui — hebdomadaire | oui — **E1 à E6** | partiel — selon le producteur | oui — coût très faible | oui — maximal |
| Ressources documentaires | non — dépôt vide | partiel — par pics | partiel — E2, E3, E5 | oui — dépendance nulle | non — coût **élevé** | partiel — moyen |
| Annonces officielles | oui | non — irrégulière | oui — E1, E3, E4, E5 | non — niveau 2 | oui | oui |
| Forum / entraide | non — forum vide | partiel | partiel — E4 | oui | partiel | non |
| Communautés inter-établissements | non — masse critique | partiel | partiel | oui | partiel | partiel |
| Événements / vie de campus | partiel | non | partiel — E3 | oui | oui | non |
| Annuaire de promotion | partiel | non — très faible | partiel — E6 | oui | oui | partiel |
| **Salle d'étude en ligne** *(candidat ajouté le 2026-09-09, `AM7`)* | **non** — on n'étudie pas à deux tout seul | partiel — saisonnière, avant devoirs et examens | partiel — l'appel de groupe existe ; le manque est en partie contingent | **oui** — niveau 4, meilleur score de tous | **non** — le pire de tous : session synchrone en continu | **non** — n'oblige à modéliser ni établissement, ni filière, ni promotion |

### Ce que la matrice montre

1. **Le point 3.0 tient.** L'emploi du temps est le seul candidat à ne porter aucun « non », et le seul à cumuler les six échecs structurels. Sa force principale n'est d'ailleurs pas celle que le point 3.0 met en avant : c'est **C1**. Un étudiant seul, dont personne d'autre n'a installé l'application, tire déjà une valeur pleine de la consultation de son emploi du temps. Aucun autre candidat n'a cette propriété. **C'est ce qui dispense le projet du problème d'amorçage réseau** — l'obstacle dont L7 doit établir, par le benchmark des échecs documentés, la part réelle dans la mortalité des plateformes communautaires.

2. **Les ressources documentaires sont le meilleur candidat pour la valeur et le pire pour l'entrée.** Elles portent l'hypothèse de valeur HV2 du [[ecoFab/90-pilotage/Registre des statuts|Registre des statuts]], la plus citée du projet — mais un dépôt vide ne vaut rien (C1 en échec) et le téléchargement de cours est précisément ce que le budget données d'un étudiant supporte mal (C5 en échec). C'est un **second temps**, adossé à une base déjà fréquentée, pas une porte d'entrée.

3. **Annonces officielles et emploi du temps ne sont pas deux objets.** Ce sont deux instances du même objet métier : *une information académique datée, versionnée, émise avec autorité vers un contexte académique*. Les traiter séparément dupliquerait le modèle. À fusionner conceptuellement.

4. **Forum et communautés sont éliminés comme entrée**, ce que le programme reconnaît déjà : *« un objet consulté chaque semaine crée une raison d'ouvrir l'application, ce qu'un forum ou un fil d'actualité ne produit pas au démarrage. »*

5. **La salle d'étude en ligne est disqualifiée comme point d'entrée**, plus nettement qu'aucun des sept candidats d'origine : **trois « non »**, dont `C1` — elle exige un pair déjà présent, c'est-à-dire exactement l'amorçage réseau dont l'emploi du temps dispensait le projet — et `C5`, le coût en données d'une session synchrone. Elle est **suspendue à `L6`** : si la mesure directe établit qu'une consultation hebdomadaire de texte est déjà un arbitrage, l'objet sort du dossier sans qu'aucun développement n'ait été engagé. Ce verdict ne dit pas que l'objet est mauvais : il en fait un **second temps**, comme les ressources documentaires. Voir [[Relevé d'intention du porteur]], point 5.4.

---

## 5. Le déplacement : la question n'est pas *quel objet*, mais *qui l'alimente*

Ce déplacement constitue le point central de la présente note.

L'emploi du temps a une valeur solo — **à condition qu'une donnée à jour existe**. Le point d'entrée réel n'est donc pas « consulter », c'est **« quelqu'un maintient »**. Or l'objet présente une asymétrie brutale : **un** producteur pour **cinquante à trois cents** consommateurs. Tout repose sur ce producteur unique.

Le point 3.0 le nomme d'un souffle — *« un responsable de scolarité, un directeur adjoint ou un délégué »* — comme si les trois étaient interchangeables. Ils ne le sont pas du tout.

| Producteur | Dépendance (L5) | Effort pour l'obtenir | Ce qu'il y gagne lui-même | Risque propre |
| --- | --- | --- | --- | --- |
| **Scolarité / DA** | **Niveau 2** — accord établissement par établissement | Élevé : déplace une responsabilité institutionnelle, et engage un régime de preuve sur l'information publiée | **Refait le 2026-09-09, amendement `AM4`.** La v1 portait *« rien d'évident, plutôt une exposition supplémentaire »*. Sous l'hypothèse `AP5` — le directeur adjoint **fabrique déjà** l'emploi du temps à la main, chaque semaine, sous Excel, PowerPoint ou Word — **son effort diminuerait en s'outillant**, ce qui est le critère même retenu au point 5.1 pour élire le délégué. **Hypothèse de niveau 4, non vérifiée** : elle se teste en `L3` | Lenteur, refus majoritaire — l'invalidation explicite de L3. **La dépendance reste niveau 2**, ce qui l'écarte du premier jour quelle que soit sa valeur |
| **Délégué** | **Niveau 4** — aucune | Faible : **il fait déjà ce travail**, dans un média qui perd l'information | Il cesse de répondre trente fois à « c'est quand, le cours ? » | **Renouvellement annuel** du mandat |
| **Étudiants, en contribution libre** | Niveau 4 | Faible | Rien | Aucune autorité : personne ne sait qui dit vrai |

### 5.1. Le programme range le bon producteur du mauvais côté

L'invalidation de **L3** est écrite ainsi : *« si les responsables administratifs refusent majoritairement d'endosser une publication directe, l'axe communication formelle se réduit à un canal de relais outillé. »*

Ce « canal de relais outillé » est traité comme un **repli en cas d'échec**. L'analyse ci-dessus suggère l'inverse : c'est le **seul mode viable au premier jour**, et la publication directe par l'administration est l'**amélioration ultérieure** — exactement la hiérarchie que L5 impose déjà pour l'identité (viable en niveau 3-4 d'abord, niveaux 1-2 ensuite).

Le délégué est par ailleurs le seul producteur dont l'effort **diminue** en adoptant l'outil. Ce point est déterminant : l'outil ne lui demande pas un travail nouveau, il rend moins pénible celui qu'il accomplit déjà. Son adoption ne requiert par ailleurs aucune autorisation préalable.

**Reformulation proposée de la question directrice de L3** — de :
> « Les responsables administratifs accepteraient-ils de publier directement ? »

vers :
> « Où casse aujourd'hui la chaîne administration → délégué → étudiants, et que gagnerait un délégué mieux outillé ? »

La première question mesure une acceptabilité institutionnelle lointaine. La seconde mesure une douleur présente chez une personne identifiable, atteignable sans autorisation.

### 5.2. Conséquence sur la distribution

Si le producteur est le délégué, alors **la cible de recrutement n'est pas l'étudiant mais le délégué** : une personne convaincue équivaut à une promotion entière atteinte, et la distribution emprunte le groupe WhatsApp existant, qui devient **canal de diffusion plutôt que concurrent**. Ce coefficient de levier répond directement à l'axe « Distribution » du point 19.

---

## 6. Exigences de conception qui en découlent

Elles tombent du raisonnement, pas d'un choix technique. Aucune ne préempte l'architecture.

### EX1 — Le rôle doit être modélisé séparément de la personne

Un espace tenu par un délégué qui meurt au renouvellement du mandat **reproduit exactement le défaut E5/E6 de WhatsApp** que le projet prétend corriger. La transmission du rôle n'est donc pas une fonctionnalité de maturité : elle est **constitutive du point d'entrée**. Sans elle, la promesse de continuité est fausse dès la première année.

Cela répond directement à deux questions ouvertes du point 21 : *« qui peut administrer ce contexte lorsque le créateur quitte son rôle ? »* et *« comment gérer le renouvellement des délégués ? »*

### EX2 — Socle récurrent + flux d'exceptions datées

La friction du producteur est le coût de saisie. Or un emploi du temps n'est pas ressaisi chaque semaine : il comporte un **socle récurrent** stable sur le semestre, et un **flux de modifications** ponctuelles. Modéliser les deux séparément fait tomber le coût récurrent à la seule saisie des exceptions — c'est-à-dire précisément ce qui fait mal.

Effet secondaire notable : l'objet « modification datée d'une séance » est aussi ce qui porte la **notification**, donc la valeur qui justifie l'installation.

### EX3 — Lecture sans compte, compte pour la notification

Exiger une inscription au premier contact ajoute une friction là où l'adoption est la plus fragile. Piste à instruire : **consultation libre par lien** (partageable dans le groupe WhatsApp), **compte requis uniquement pour être averti d'un changement**. La notification devient la contrepartie de l'inscription, et non l'inverse.

Conséquence sur L5 : au premier jour, **aucune vérification d'appartenance n'est nécessaire** pour lire. Le niveau 4 est assumé, et la question INE/CampusFaso sort du chemin critique.

### EX4 — Pas de messagerie au départ

Si la conversation reste sur WhatsApp, le produit initial n'a pas besoin de messagerie. Cela retire d'un coup : le coût de développement le plus lourd, la charge de modération (L8), et l'essentiel du risque juridique lié aux contenus. Le point 16 disait déjà « ne pas être un clone de WhatsApp » — la complémentarité n'est pas seulement une posture, c'est une **réduction de périmètre chiffrable**.

---

## 7. Contre-hypothèses — ce qui ferait tomber ce point d'entrée

> [!danger] Section obligatoire
> Règle 4 de la doctrine : *« un lot dont on ne peut pas dire ce qui le ferait échouer n'est pas une étude, c'est une justification. »* La présente note doit pouvoir se retourner contre elle-même.

### CH1 — La douleur est affirmée, pas mesurée

Que les modifications d'emploi du temps soient « un motif récurrent de désorganisation » repose sur la connaissance directe du porteur : **niveau de preuve 4** selon la grille du projet lui-même. Le point 7 interdit d'en tirer une conclusion. Rien ne doit être construit avant que L1 et L3 aient mesuré cette douleur.

### CH2 — La normalisation des calendriers pourrait éroder la douleur

Le fait **F8** est présenté partout comme une opportunité — la rentrée d'octobre redevient un moment collectif national. Il porte aussi une **menace non relevée** dans les documents : si les années académiques se normalisent (97 % au 15/04/2026) et qu'un calendrier unique s'installe durablement, les emplois du temps deviennent plus stables, donc **moins modifiés**, donc **moins douloureux**.

Autrement dit, le même fait qui ouvre la fenêtre de distribution pourrait affaiblir l'hypothèse de valeur. À instruire explicitement : la douleur mesurée en L1 doit être **datée**, et il faut distinguer ce qui relève du chevauchement 2019-2024 de ce qui relève du régime normalisé.

### CH3 — Tension interne au programme entre le point 2.3 et le point 3.0

Le point 2.3 pose une règle : privilégier *« un cœur de domaine que le versant administratif a structurellement peu de raisons d'occuper — la vie communautaire n'est pas un service public à guichet. »*

Or l'emploi du temps **est** de l'information académique officielle. C'est typiquement ce qu'un ministère a des raisons d'occuper, et `services.campusfaso.bf` couvre déjà le suivi de cursus. **Le candidat du point 3.0 satisfait mal le critère posé au point 2.3 du même document.**

Contre-argument, qui ne lève pas entièrement la tension : un emploi du temps est produit **localement**, par UFR, sans standardisation nationale, et change chaque semaine. Un référentiel central absorbe mal ce qui est local et volatil. La bonne formulation n'est donc pas « peu de raisons d'occuper » mais **« peu de capacité à occuper »** — ce qui est une protection plus faible, et surtout **réversible**. À surveiller à chaque jalon, comme le point 2.3 l'exige déjà.

### CH4 — Rien ne garantit la transition vers l'écosystème

Un étudiant qui consulte un emploi du temps et referme l'application n'a rejoint aucun écosystème. Le chemin *emploi du temps → documents → communautés* est supposé, jamais démontré. Il doit devenir une hypothèse explicite, mesurée en L9 — par exemple : quelle proportion des consultants d'emploi du temps dépose ou consulte une ressource dans les huit semaines ?

### CH5 — Le délégué peut refuser

Toute la construction repose sur un producteur bénévole, non rémunéré, en année d'examens. S'il ne saisit pas, l'objet est vide et **C1 s'effondre avec lui** — la valeur solo disparaît. C'est le point de rupture unique du modèle, et il n'a pas de plan B au niveau 4.

---

## 8. Ce qui trancherait — protocole minimal

Ces épreuves relèvent des lots existants ; aucune ne demande de développement.

| # | Question | Lot | Méthode | Ce qui invalide |
| --- | --- | --- | --- | --- |
| T1 | La modification d'emploi du temps est-elle une douleur réelle et datée ? | L1, L3 | Reconstitution sur 3 années académiques, en séparant régime chevauché et régime normalisé | Douleur faible en régime normalisé → **CH2 confirmée**, candidat affaibli |
| T2 | Le délégué reconnaît-il un gain personnel à l'outillage ? | L3 | Entretiens de délégués et sous-délégués, en partant de leur charge et non du produit | Aucun gain perçu → **CH5 confirmée**, plus de producteur au niveau 4 |
| T3 | La chaîne casse-t-elle à l'endroit supposé ? | L3 | Description du circuit réel administration → délégué → étudiants | La rupture est ailleurs → le point d'entrée change d'objet |
| T4 | L'emploi du temps est-il réellement absent du versant administratif ? | L7 | Relevé du périmètre courant de `services.campusfaso.bf`, fonctions faiblement adoptées comprises | Déjà couvert ou annoncé → **CH3 devient bloquante** |
| T5 | Une consultation hebdomadaire est-elle soutenable en données ? | L6 | Mesure directe : terminal, stockage, dépense mensuelle, arbitrages en fin de crédit | Coût dissuasif même pour du texte → tout le projet est touché, pas seulement l'entrée |
| T6 | La transition vers les autres usages se produit-elle ? | L9 | Dispositif semi-manuel sur 1 à 3 promotions volontaires, indicateur fixé à l'avance | Aucune transition → point d'entrée valide, **écosystème non démontré** |

> [!note] Ordre suggéré
> **T4 avant tous les autres.** C'est le seul test purement documentaire : il ne requiert ni autorisation d'accès, ni déclaration CIL, ni entretien. Un échec de T4 rendrait inutile une partie du terrain ; le résultat doit donc être connu avant l'engagement de celui-ci. T4 relève de L7, dont le lancement immédiat n'est bloqué par aucune dépendance.

---

## 9. Ce que la présente note ne décide pas

Elle ne décide **ni le Core Domain, ni le MVP, ni le périmètre** — trois éléments explicitement suspendus jusqu'au **jalon 4** (point 22 du fondateur, Annexe B du programme).

Elle ne promeut aucune hypothèse au rang de fait. Le candidat du point 3.0 sort de cette analyse **renforcé sur sa mécanique d'adoption** (C1, découverte principale de la note) et **fragilisé sur deux points non relevés jusqu'ici** (CH2, CH3).

Elle propose trois amendements au [[Programme d'études approfondies]], qui ne prendront effet que s'ils sont inscrits au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]] :

1. **Reformuler la question directrice de L3** autour de la chaîne réelle et du gain du délégué, plutôt que de l'acceptabilité administrative *(point 5.1)*.
2. **Traiter le mode délégué comme mode principal** et la publication administrative directe comme amélioration ultérieure, par cohérence avec la règle des niveaux de dépendance de L5 *(point 5.1)*.
3. **Ajouter T4 en tête de L7** et le lancer immédiatement, puisqu'il ne dépend d'aucune autorisation *(point 8)*.

---

## 10. Convergence non anticipée avec le projet `infUb`

> [!danger] Section versée le 2026-09-06
> Elle traite du recouvrement entre `ecoFab` et les projets `infUb` et `gounhri` du même coffre. Elle modifie la portée des sections 5 à 9 : **elle ne les invalide pas, mais elle en déplace la conclusion opérationnelle.**

Le coffre contient un second projet, [[infUb]], daté du **2 septembre 2026** — quatre jours avant la présente note. Il porte sur une *infrastructure nationale de publication et de vérification de l'information institutionnelle* au Burkina Faso, et il est **beaucoup plus avancé qu'ecoFab** : benchmark international, solution cible, trajectoire en quatre horizons, [[DDD tactique du noyau|DDD tactique]] et [[Recueil d'ADR du noyau|quatorze ADR acceptés]].

### 10.1. Trois recouvrements directs

| Conclusion de la présente note pour ecoFab | Ce qu'`infUb` a déjà établi | Portée |
| --- | --- | --- |
| Point 5 — Le bon producteur est celui **dont l'effort diminue** ; la conquête porte sur celui qui alimente, non sur celui qui consomme | Correction n°2, *« l'ordre de conquête est inversé »* : *« Conquérir l'institution, c'est offrir un service qui lui économise du travail »*, appuyé sur un précédent documenté — **Notify, 7 000 services adoptés volontairement** | **Convergence indépendante.** Le raisonnement conduit ici relève du niveau 4 ; `infUb` l'étaie par un précédent documenté |
| Point 6 EX1 — Le **rôle** doit être modélisé séparément de la **personne** | Contextes **Habilitation / Publication / Preuve**, et actif stratégique reformulé en *« registre national d'habilitation à publier »* | Déjà **modélisé tactiquement** ailleurs dans le coffre |
| Point 6 EX3/EX4 — Lecture sans compte, pas de messagerie, la notification justifie l'inscription | Horizon **H0** : *« aucun compte citoyen, aucun abonnement, aucun feed, aucun commentaire »* | Même conclusion, atteinte par le benchmark plutôt que par déduction |

### 10.2. Le point qui oblige à s'arrêter

L'horizon **H1** d'`infUb` désigne un secteur pilote, et c'est **l'enseignement supérieur** — le terrain d'ecoFab. Les motifs invoqués sont, mot pour mot, ceux qui fondent ecoFab : population jeune et connectée, information à date critique, douleur documentée d'une information qui se perd, et *« structure hiérarchique naturelle (université → UFR → département → filière) »*.

S'y ajoute une phrase qui répond directement à la question restée ouverte en **L5** d'ecoFab, celle du niveau de dépendance :

> *« L'autorité est **déléguable sans texte nouveau** : un président d'université peut habiliter des publicateurs par décision interne. »*

Si cela se vérifie, la publication d'un emploi du temps par un responsable habilité **ne requiert ni convention MESRSI ni déclaration nouvelle** — elle relève d'une décision interne d'établissement. Le verrou que L5 redoutait ne serait pas là où le programme d'ecoFab le place.

### 10.3. Aucun des trois projets ne cite les autres

Vérifié par recherche sur l'ensemble du coffre : `ecoFab` n'apparaît que dans `ecoFab/`, `infUb` que dans `infUb/`, et `gounhri` n'est cité nulle part. **Trois projets portant sur la circulation et la vérification de l'information au Burkina Faso, dont deux se rejoignent sur le même secteur pilote, s'ignorent mutuellement.**

C'est un risque de conception majeur et immédiat : modéliser trois fois Habilitation, Publication et Preuve, puis découvrir tardivement qu'il fallait un seul socle.

### 10.4. Ce qui doit être tranché avant de poursuivre

La mécanique établie aux sections 2 à 4 tient dans tous les cas — l'emploi du temps reste le seul candidat à valeur solo, donc le seul qui dispense de l'amorçage réseau. **En revanche, la suite dépend entièrement d'une décision de portefeuille qui excède le périmètre de la présente note :**

| Relation possible | Conséquence sur le point d'entrée d'ecoFab |
| --- | --- |
| **A — ecoFab consomme `infUb`** | ecoFab ne remodélise ni Habilitation, ni Publication, ni Preuve : il les consomme, et se concentre sur la couche communautaire que `infUb` exclut explicitement (documents partagés, entraide, communautés disciplinaires). Le point d'entrée reste l'emploi du temps, mais **il n'est plus à construire** |
| **B — ecoFab *est* le pilote H1 d'`infUb`** | ecoFab n'est pas un projet distinct mais la déclinaison étudiante de H1. Son programme d'études se réduit alors aux questions que `infUb` laisse ouvertes |
| **C — Projets réellement indépendants** | Il faut acter les frontières par écrit et accepter une duplication assumée du socle — au minimum sur Habilitation et Publication |

> [!success] Tranché le 2026-09-06 — `DEC-PF-001`
> Le porteur a explicité la relation : **`ecoFab` consomme `infUb`, jamais l'inverse**, et le partage se fait par **audience** — *« quelqu'un hors du monde étudiant peut-il en avoir besoin ? »* — corrigé par un critère de **valeur dans le temps** et un critère de **contrôle par l'émetteur**. Le détail est en [[Cartographie du portefeuille]] point 5 bis.
> C'est une variante de l'option **A**, mais son critère de partage n'est pas la nature juridique de l'information : c'est son audience.
>
> **Conséquence directe sur la présente note.** L'emploi du temps d'une promotion relève d'une audience strictement étudiante et d'une valeur volatile : il **reste dans `ecoFab`** et n'a pas à passer par `infUb` — sauf si l'établissement veut le garder sous contrôle révocable. Les sections 2 à 9 restent donc valides sans amendement.
>
> Les trois amendements proposés au point 9 peuvent désormais être instruits. Ils restent à inscrire au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]] pour prendre effet.
