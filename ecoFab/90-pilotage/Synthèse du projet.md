---
projet: "ecoFab"
type: "synthese-de-projet"
phase: "90-pilotage"
objet: "État du projet et bilan du travail conduit, pour un lecteur qui arrive sans historique"
destinataire: "Lecteur extérieur — professionnel, collaborateur possible, évaluateur"
etat_au: 2026-09-09
mis_a_jour_le: 2026-09-09
statut: "Synthèse — ne décide rien, ne remplace aucun document"
tags:
  - ecoFab
  - pilotage
  - synthese
---

# Synthèse du projet

État du projet `ecoFab` et bilan du travail conduit, au **9 septembre 2026**.

Ce document s'adresse à un lecteur qui n'a suivi aucun échange. Il ne décide rien et ne remplace aucun document : il donne l'état, le chemin, et les points ouverts. Le point 9 propose un parcours de lecture.

---

## 1. Le projet en une page

`ecoFab` est un **nom de code**, pas un nom de produit. Le projet vise un **écosystème numérique estudiantin du Burkina Faso** : formaliser ce que les groupes de discussion étudiants font aujourd'hui de façon informelle — transmettre l'information académique, partager des documents, structurer des promotions et des filières.

Il est **en phase d'étude**, avant son premier jalon. Il ne porte **aucune décision de projet active**, aucune architecture, aucune ligne de code, et l'issue *« ne pas construire »* reste atteignable jusqu'à son dernier jalon.

| Élément | Valeur au 2026-09-09 |
| --- | --- |
| Phase | `10-etudes` — vague 0 conduite, jalon 1 rendu partiellement |
| Régime de conduite | **Une seule personne**, le porteur |
| Décisions de projet actives | **Aucune.** La seule jamais inscrite a été annulée le 2026-09-08 |
| Documents | 18 notes, dont un document fondateur gelé et empreinté |
| Faits établis | 16, dont 5 produits par la vague 0. **Aucun n'a été ajouté depuis** |
| Programme d'études | **V0.3** — douze lots, cinq jalons |
| Prochaine échéance | Clôture du jalon 1, avant le 30 septembre 2026 |
| Fenêtre de terrain | **1er octobre – 15 novembre 2026.** La suivante est en octobre 2027 |

### 1.1. La thèse, et ce qui la ferait tomber

**Le candidat retenu comme point d'entrée** est le **programme universitaire** — l'emploi du temps effectif d'une filière et d'une promotion. Il est retenu parce qu'il est le seul objet à avoir une **valeur pour l'utilisateur seul** : un étudiant en tire un bénéfice même si personne d'autre n'a installé l'application. C'est ce qui dispenserait le projet du problème d'amorçage réseau.

**Le déplacement décisif** : la question n'est pas *quel objet*, mais **qui l'alimente**. Le seul producteur dont l'effort **diminue** en s'outillant, et qui n'a besoin de la permission de personne, est le **délégué de promotion**.

**Ce qui ferait tomber la thèse** : si le délégué ne reconnaît ni charge ni gain, la valeur solo s'effondre avec lui, et le projet n'a pas de plan B. C'est le point de rupture unique du modèle. Il se tranche au jalon 2, sur un seuil écrit d'avance.

---

## 2. Le chemin parcouru

| Date | Travail | Trace |
| --- | --- | --- |
| 2026-09-06 | Mise en coffre : conversion du document fondateur, contrôle d'intégrité, structure de phases | `DEC-C-001` à `DEC-C-005` |
| 2026-09-06 | Analyse du point d'entrée : mise en concurrence de sept candidats, découverte du critère de valeur solo | [[Analyse du point d'entrée]] |
| 2026-09-07 | Épreuve du projet contre l'actif indétrônable et la valeur réelle | [[Épreuve de l'actif et de la valeur]] |
| **2026-09-08** | Normalisation rédactionnelle des dix notes, levée de deux collisions d'étiquettes, remise en ordre de la numérotation | `DEC-C-034` |
| **2026-09-08** | **Annulation de `DEC-P-001`** — l'usage de l'identifiant national | Journal des décisions |
| **2026-09-08** | **Programme d'études V0.3** : huit amendements intégrés, deux lots créés, séquencement solo | `DEC-C-048` |
| **2026-09-08** | Protocole de la vague 0, seuils pré-enregistrés | [[Protocole de la vague 0]] |
| **2026-09-08** | **Vague 0 conduite** : `L7a`, `L7b`, `L0` | Trois relevés |
| **2026-09-08** | Note de jalon 1, rendue sur deux questions sur trois | [[Note de jalon 1]] |
| **2026-09-08** | Instruments de la vague 1 et addendum de clôture, tous deux pré-enregistrés | Deux protocoles |
| **2026-09-09** | Second apport oral du porteur, restitué en dix énoncés et **écrit contre lui-même** | [[Relevé d'intention du porteur]] |
| **2026-09-09** | Adoption de sept amendements sur huit ; le huitième est reporté au jalon 2 | `DEC-C-051` |

---

## 3. Ce qui est établi

Seize faits, au [[ecoFab/90-pilotage/Registre des statuts|Registre des statuts]]. Les cinq derniers sont le produit de la vague 0.

### 3.1. Le terrain, avant l'étude

| # | Fait | Portée |
| --- | --- | --- |
| `F1` à `F4` | **WhatsApp est la couche de groupe de la vie étudiante burkinabè.** Le SMS sert d'appoint, Telegram est marginal, aucune plateforme communautaire étudiante nationale n'occupe le terrain | Établi par connaissance directe du porteur, retiré du champ de vérification |
| `F5` | **225 902 étudiants** en 2023/2024, dont 20,9 % dans le privé ; 191 établissements ; 97 191 nouveaux inscrits en L1 ; **+170,2 % en dix ans** | Actualisé en `L0` sur le tableau de bord 2023/2024 |
| `F7`, `F8` | Les années académiques ont chevauché de 2019 à 2024, puis se sont normalisées : 81,3 % → 92,5 % → **97 % au 15/04/2026**, calendrier unique annoncé | Fenêtre d'opportunité, **et menace** — voir le point 5 |
| `F9` à `F11` | CampusFaso occupe le versant administratif · loi n° 001-2021 et déclaration CIL obligatoire · conditions matérielles favorables mais mesurées en abonnements, non en personnes | Contraintes |

### 3.2. Ce que la vague 0 a produit

| # | Fait | Ce qu'il change |
| --- | --- | --- |
| `F12` | **CampusFaso porte la programmation des enseignements.** Modules de gestion de la programmation et des affectations hebdomadaires, lancés à l'Université Joseph Ki-Zerbo le 22/11/2022, en opérationnalisation intégrale depuis février 2025 | **Atteint la prémisse centrale du projet** |
| `F13` | **Aucune source ne montre un accès étudiant à cette programmation.** Les acteurs nommés sont les chefs de département, directeurs et vice-présidents | La distribution reste vacante |
| `F14` | **La cause de mort modale des plateformes comparables est l'incapacité à déplacer un usage installé** — 3 fiches sur 8. Le tarissement du producteur bénévole n'apparaît dans **aucune** | Confirme la stratégie de complémentarité |
| `F15` | Aucun produit d'emploi du temps ne figure au cimetière | Interprétation ouverte |
| `F6`, `F16` | Le parc d'établissements se contracte — six de moins en un an · le dépôt à la Commission de l'Informatique et des Libertés **se fait sur place** | Deux contraintes nouvelles |

---

## 4. Les cinq déplacements produits par le travail

Ce que le dossier disait avant, et ce qu'il dit maintenant.

### 4.1. Le problème n'est peut-être pas celui qu'on croyait

**Avant** : l'emploi du temps est *« absent du versant administratif »*, personne ne le tient, il faut un producteur.
**Maintenant** : il est **produit** par un système national, et **non distribué** aux étudiants.

Le problème passerait donc d'un **problème de production** à un **problème de distribution**. C'est l'issue proposée au jalon 1, et elle est **suspendue à une vérification** : `F12` établit qu'un module est opérationnel, non qu'il est **rempli**. Si le module s'avère opérationnel et vide, la prémisse d'origine retrouve sa force intacte.

### 4.2. Le producteur change de nature

**Avant** : le délégué est le seul **producteur** viable, celui dont l'effort diminue.
**Maintenant** : il serait un **relais de distribution** — il reçoit un document fabriqué ailleurs et le relaie.

La conséquence est immédiate sur le terrain : la première question posée à un délégué n'est plus *« que gagneriez-vous à être mieux outillé ? »* mais **« d'où sort le document que vous recevez ? »**.

### 4.3. Le programme savait mesurer une valeur, pas constituer un actif

L'épreuve du 2026-09-07 a noté le programme lui-même et conclu *« non instruit, programme à compléter »* sur **un seul critère** : aucun de ses dix lots n'instruisait ce que le projet **accumulerait**, ni **qui paierait**.

La V0.3 crée les deux lots manquants — `L10` l'actif, `L11` le payeur — et le seuil est franchi. La cause de l'omission a été nommée : *un programme de recherche instruit spontanément ce qui se demande à des gens, et oublie ce qui se possède.* Elle est devenue une **règle de coffre**, opposable à tous les projets.

### 4.4. Une décision prise sans le pouvoir de la prendre a été retirée

`DEC-P-001` — utiliser l'identifiant national pour distinguer les statuts — était la **seule décision de projet** jamais inscrite. Elle a été **annulée le 2026-09-08**, pour deux motifs dont le second suffisait :

- **sur le fond**, l'identifiant est attribué avant l'orientation, un lycéen en possède un, et la donnée discriminante est l'inscription confirmée, non l'identifiant ;
- **sur la forme**, elle avait été prise **hors de tout jalon**, sur une preuve du plus faible niveau, alors que la doctrine du projet réserve les décisions de projet aux jalons franchis.

L'annulation **n'a créé aucune décision de remplacement** : elle restaure la règle de conception que le lot `L5` portait déjà. Le projet est de nouveau sans décision de projet, ce qui est son état légitime.

### 4.5. Un apport du porteur rouvre le périmètre, et ouvre un arbitrage que le dossier ne peut pas trancher

Le 9 septembre, un second apport oral a été restitué en dix énoncés. Il **ne verse aucun fait** — tout y relève du niveau de preuve le plus faible — mais il déplace deux choses.

**Il désigne une troisième lecture de la chaîne**, que ni la note de jalon ni le protocole n'avaient formulée. Le document qui parvient à l'étudiant serait **fabriqué à la main dans l'UFR**, par le directeur adjoint, sous Excel ou Word — ni maintenu par le délégué, ni produit par un système national, mais **produit localement, artisanalement, hors de tout système**.

Si le terrain le confirmait, la reformulation proposée au jalon 1 tomberait et le candidat d'origine retrouverait sa force. **L'énoncé ne peut pas servir aujourd'hui** : il est de niveau 4, la bascule pré-enregistrée nomme d'autres instruments, et c'est l'énoncé qui sauve le projet, formulé par celui qui le porte, le lendemain du verdict qui l'atteignait. Il est traité comme une **prédiction à vérifier**, et une question a été ajoutée au guide d'entretien pour la tester sans la suggérer.

**Il ouvre un arbitrage de fond**, formulé une fois et laissé ouvert :

> Garder le périmètre étroit préserve la **valeur pour l'utilisateur seul** — donc l'exemption d'amorçage réseau — et laisse le **principe de l'actif en échec**.
> Élargir vers la couche communautaire ouvre **l'effet de réseau**, seul axe d'actif que le point d'entrée retenu ne touchera jamais, et expose le projet à la **cause de mort modale** que le cimetière vient d'établir.

Aucun des deux termes n'est gratuit, et **le dossier ne porte aucune preuve permettant de trancher** : les lots qui la produiraient ne sont pas conduits avant janvier 2027. La conséquence est de calendrier, pas de conviction.

---

## 5. Le bilan probatoire de la vague 0

> **Six infirmations contre deux indices favorables.**

### 5.1. Ce qui contredit le projet

1. **La prémisse centrale est atteinte** — l'emploi du temps n'est pas absent du versant administratif.
2. **Le producteur à conquérir produit peut-être déjà, ailleurs.**
3. **L'acteur à distribution maximale a échoué sur le public exact** — Facebook Campus, 204 universités, arrêté en mars 2022 au motif que *les groupes suffisaient*. C'est la position de WhatsApp, mot pour mot.
4. **La forme « seconde application » est contredite** — Google Currents montre que l'espace séparé perd contre l'outil encastré dans le flux existant.
5. **Aucun produit d'emploi du temps ne figure au cimetière** — la lecture la plus économique est défavorable : l'objet vit à l'intérieur des systèmes institutionnels.
6. **Le fondement chiffré du terrain retenu est plus faible qu'annoncé** — le taux d'effectifs de l'université pivot n'a pas pu être actualisé.

### 5.2. Ce qui va dans le sens du projet

1. **Le risque le plus redouté n'est pas confirmé** — aucune des huit plateformes mortes ne l'est par tarissement de son producteur bénévole. Sous une réserve lourde : le cimetière documentaire est **structurellement aveugle** à cette cause, un dispositif bénévole mourant sans communiqué.
2. **Une plateforme institutionnelle nationale organise son support autour du délégué** — l'Université Virtuelle du Burkina Faso renvoie ses étudiants à *« votre délégué ou responsable de filière »*. Indice, non preuve.

### 5.3. Ce que l'apport du 9 septembre ne change pas à ce bilan

Aucune des six infirmations n'est levée : un énoncé de niveau 4 ne lève pas un fait de niveau 1. L'apport **nuance** `F12` sans l'infirmer, et rend cette nuance testable par une question ajoutée à la lettre `L5`. Il **aggrave** en revanche l'exposition à la cause de mort modale, en demandant de reconstruire la couche de groupe — la position exacte où Facebook Campus est mort.

### 5.4. Ce que ce bilan n'autorise pas à conclure

Il n'autorise **ni à poursuivre sans changement, ni à arrêter**. Aucun seuil pré-enregistré n'a été franchi — ce qui interdit l'arrêt — mais la prémisse a bougé — ce qui interdit de poursuivre à l'identique. D'où l'issue proposée : **reformuler le périmètre**.

---

## 6. L'état des décisions

| Registre | Nombre | État |
| --- | --- | --- |
| **Décisions de projet** `DEC-P-` | 1 inscrite, **annulée** | **Aucune active.** Les 26 suspensions du document fondateur et les 17 lignes de traçabilité du programme demeurent **toutes** ouvertes |
| **Décisions de coffre** `DEC-C-` | 11 | Rangement, conventions, méthode documentaire. Aucune n'engage le produit |

Restent notamment suspendus : le nom du produit, le périmètre, la relation à CampusFaso, le modèle d'identité, le modèle documentaire, le degré de centralisation, la gouvernance, la forme juridique, le modèle économique, la pile technique, l'hébergement, le produit minimal et le *Core Domain*.

---

## 7. Ce qui reste à instruire

| Question | Lot | Jalon | Date atteignable |
| --- | --- | --- | --- |
| **La programmation CampusFaso est-elle remplie, à la maille de la séance ?** | Lettre `L5`, puis `L3` | — | **La plus urgente du projet** |
| L'accès au terrain est-il possible ? | Démarches | Jalon 1 | avant le 30 sept. 2026 |
| Le délégué reconnaît-il une charge et un gain ? | `L3` | Jalon 2 | fin nov. 2026 |
| La chaîne casse-t-elle à l'endroit supposé ? | `L3` | Jalon 2 | fin nov. 2026 |
| La douleur est-elle datée, et distinguée du régime chevauché ? | `L1` | Jalon 2 | fin nov. 2026 |
| Le coût en données autorise-t-il une consultation hebdomadaire ? | `L6` | Jalon 2 | fin nov. 2026 |
| Que le projet accumule-t-il, et à qui cela appartient-il ? | `L10` | Jalon 3a | janv. 2027 |
| Qui porte la ligne de coût ? | `L11` | Jalon 3a | janv. 2027 |
| **Périmètre étroit ou couche communautaire ?** — l'arbitrage du point 4.5 | `L10`, `L11` | **Jalon 3a** | janv. 2027 |
| La perte documentaire est-elle réelle et mesurable ? | `L4` | Jalon 3b | août 2027 |
| Un gain mesurable est-il démontré sur population réelle ? | `L9` | Jalon 4 | printemps 2028 |

> [!warning] Conséquence du régime solo, assumée et écrite
> **L'issue « construire » n'est pas atteignable avant le printemps 2028.** Les jalons 1, 2 et 3a le sont dans les cinq mois. Les deux derniers dépendent de fenêtres saisonnières annuelles.
> Le raccourcir supposerait soit d'ajouter des personnes, soit de renoncer à mesurer la perte documentaire — c'est-à-dire à instruire l'actif.

---

## 8. Ce qui bloque, et ce qui ne bloque pas

### 8.1. Le seul verrou qui ne dépende que du porteur

> **Le dépôt de la déclaration à la Commission de l'Informatique et des Libertés.** Il est **physique** — le dépôt en ligne est annoncé et non effectif — et **aucun entretien n'est licite avant le récépissé**. C'est la seule démarche non délégable, et elle conditionne tout le terrain.

Le régime, l'étendue exacte du blocage, ce qu'il **ne** bloque pas, et ses conséquences **sur le produit** sont traités dans [[Le blocage administratif]]. Trois points en ressortent : le régime est une **déclaration**, non une autorisation ; **prendre contact n'est pas collecter**, donc la voie associative peut s'ouvrir aujourd'hui ; et le produit sera soumis au même régime en plus lourd, ce qui rend la **forme juridique** exigible dès le jalon 3a et non « après le jalon 4 ».

### 8.2. Ce qui ne bloque pas

La **voie associative** de recrutement ne dépend d'aucune autorisation institutionnelle et peut s'ouvrir immédiatement. Le silence d'une administration est traité comme une donnée, non comme un obstacle : les délais constatés sont consignés.

La clôture du jalon 1 n'exige pas que tout ait abouti : l'accessibilité du terrain est l'une de ses questions, et un refus y répond aussi bien qu'un accord.

### 8.3. Trois renoncements actés du régime solo

1. **La représentativité nationale.** L'échantillon portera sur deux ou trois établissements d'une même ville. Aucun résultat ne pourra être présenté comme national.
2. **Le codage par un tiers**, seule contre-mesure externe au biais de confirmation d'un porteur qui souhaite que son projet existe. Remplacé par quatre substituts obligatoires, dont un **double codage à sept jours d'intervalle** dont le taux de désaccord est rapporté.
3. **L'épreuve de valeur dans la même saison**, conditionnée à l'arrivée d'une seconde personne.

---

## 9. Comment lire ce dossier

Pour un lecteur qui arrive sans historique, dans cet ordre. Compter deux heures pour les cinq premiers.

| # | Document | Ce qu'il donne | Statut |
| --- | --- | --- | --- |
| 1 | [[ecoFab]] | La note d'entrée : état, issues possibles, nœud du problème | Navigation |
| 2 | [[Document fondateur d'ouverture]] | L'intention d'origine, le monde à modéliser, les 26 décisions suspendues | **Gelé** en V0.1, empreinté. Mémoire de l'intention |
| 3 | [[Programme d'études approfondies]] | Le protocole : douze lots, cinq jalons, régime de conduite | **V0.3 — source courante** sur ce que le fondateur n'a pas intégré |
| 4 | [[Analyse du point d'entrée]] | Pourquoi l'emploi du temps, et pourquoi le délégué | Niveau de preuve faible, assumé : produit des hypothèses |
| 5 | [[Épreuve de l'actif et de la valeur]] | Le projet et son programme soumis à deux critères externes | A produit le verdict qui a conduit à la V0.3 |
| 6 | [[Relevé du périmètre CampusFaso]] · [[Cimetière et autopsie des échecs]] · [[Trousse de terrain]] | Les trois sorties de la vague 0 | Faits sourcés et datés |
| 7 | [[Note de jalon 1]] · [[Addendum au jalon 1]] | Le verdict, et la règle qui le clôturera | Le second est **pré-enregistré, non renseigné** |
| 8 | [[Relevé d'intention du porteur]] · [[Protocole de la vague 1]] | Le second apport du porteur, et les instruments de la fenêtre d'octobre | Le relevé est **écrit contre l'apport qu'il restitue** |
| 9 | [[ecoFab/90-pilotage/Registre des statuts\|Registre des statuts]] · [[ecoFab/90-pilotage/Journal des décisions\|Journal des décisions]] | Ce qui est fait, hypothèse, possibilité, décision — et la trace de chaque décision | À consulter en cas de doute sur un statut |

### 9.1. Quatre conventions à connaître pour lire sans se tromper

**Rien n'est décidé tant que ce n'est pas au journal.** Une affirmation trouvée dans un document, même affirmative, ne vaut pas décision. Le [[ecoFab/90-pilotage/Journal des décisions\|Journal des décisions]] fait seul foi.

**Deux échelles de preuve coexistent, et elles sont inversées.** Dans le programme, le **niveau 1 est le plus fort**. Dans l'épreuve stratégique, `[N4]` est le plus fort. Chaque mention indique son échelle.

**Les seuils sont pré-enregistrés.** Chaque condition qui déclencherait un abandon est écrite et datée **avant** la collecte. Un seuil réécrit après le résultat n'est pas un seuil : c'est une justification. Trois défauts de seuil ont été relevés au cours de la vague 0 et **laissés en l'état** ; leur reformulation est proposée, non appliquée rétroactivement.

**Le document fondateur est gelé.** Son corps est garanti identique à sa source. Trois écarts de forme y subsistent volontairement, consignés plutôt que corrigés : les corriger romprait la garantie d'intégrité.

---

## 10. Ce que cette synthèse ne fait pas

Elle ne décide rien, ne clôt aucun jalon, ne lève aucune suspension et ne remplace aucun document. En cas de divergence entre elle et un document de travail, **le document de travail fait foi**.

Elle n'est pas un argumentaire. Le point 5 rapporte six infirmations contre deux indices favorables parce que c'est le résultat, et le projet a été construit pour pouvoir conclure qu'il ne faut pas le construire.
