---
projet: "payMe"
type: "releve-de-lot"
phase: "10-etudes"
lot: "L1"
objet: "Vérifier si l'état de connexion à la plateforme de paiements instantanés a changé depuis la date de référence du corpus, et ce qu'il advient au 30 septembre 2026"
monde: "Monde observé — relevé documentaire, aucune donnée personnelle"
niveau_de_preuve: "1 sur la liste officielle et les échéances ; 2 sur les motifs de Wave"
date_du_releve: 2026-09-09
statut: "Relevé clos, avec une lacune nommée"
tags:
  - payMe
  - etudes
  - vague-0
  - reglementation
---

# Relevé de l'état de connexion — lot `L1`

Premier lot de la vague 0 effectivement conduit. Il est documentaire, ne dépend d'aucune autorisation, et **conditionne l'interprétation du lot `L0`** : la question posée aux personnes interrogées n'a pas le même sens selon ce que la plateforme couvre au moment de l'entretien.

---

## 1. Résultat en une phrase

> **La composition burkinabè au 2 avril 2026 est confirmée à la source et vaut neuf institutions dont un seul émetteur de monnaie électronique ; une liste plus récente existe, datée du 31 juillet 2026, dont le contenu n'a pas pu être obtenu ; et l'absence de Wave, que le corpus tenait pour transitoire, est désormais documentée comme reposant en partie sur un conflit de modèle économique — ce qui affaiblit l'hypothèse selon laquelle la cause `A` disparaîtrait au 30 septembre.**

---

## 2. La liste du 2 avril 2026, vérifiée à la source

Le corpus hérité affirmait neuf institutions au Burkina Faso. **La vérification a été conduite sur le document officiel lui-même**, et non sur les reprises de presse.

| Institution | Catégorie |
| --- | --- |
| Banque de l'Union Burkina Faso | Banque |
| BOA | Banque |
| Coris Bank | Banque |
| Ecobank | Banque |
| Orabank | Banque |
| UBA | Banque |
| **Orange Money** | **Monnaie électronique** |
| Baobab | Établissement de paiement ou microfinance |
| Cofina | Établissement de paiement ou microfinance |

Le document porte la mention `BURKINA (9)`.

**N'y figurent pas** : Wave, Moov Money, Telecel Money, Coris Money, Sank Money.

> [!important] Le fait `F4` du registre des statuts est confirmé à la source primaire
> Le corpus hérité l'énonçait sans que la liste ait été ouverte. Elle l'a été. **Six participants sur neuf sont des banques, et un seul émetteur de monnaie électronique est connecté.**
> Une reprise de presse relevée au cours de ce lot mentionne Moov Money parmi les participants ; la lecture du document officiel établit que cette mention concerne **un autre pays de l'Union**, non le Burkina Faso. La reprise de presse est écartée.

---

## 3. Une liste plus récente existe, et son contenu n'a pas été obtenu

> [!warning] Lacune nommée, et non comblée
> La page officielle de la banque centrale annonce une **liste des participants arrêtée au 31 juillet 2026**, postérieure de près de quatre mois à celle sur laquelle le corpus s'appuie.
> **Son contenu n'a pas pu être récupéré** au cours du présent relevé : le document n'a pas été atteint aux adresses tentées.
> **La composition burkinabè au 31 juillet 2026 est donc inconnue.** Elle n'est pas supposée identique à celle d'avril, et aucune conclusion n'est tirée de cette absence.

**Ce que cette lacune impose au lot `L0`.** Rien ne peut être affirmé sur l'évolution de la couverture entre avril et juillet. En particulier, il n'est **pas établi** qu'un second émetteur de monnaie électronique se soit connecté au Burkina Faso, ni que ce ne soit pas le cas.

**Ce qu'il reste à faire, et qui est simple.** Obtenir ce document — par téléchargement direct depuis la page officielle, ou en le demandant. C'est un travail de quelques minutes pour qui accède à la page, et il doit être fait **avant** de coder les entretiens du lot `L0`.

---

## 4. L'échéance, et son historique de report

| Date | Événement |
| --- | --- |
| 30 septembre 2025 | Lancement de la plateforme, 45 établissements connectés |
| 30 juin 2026 | Échéance de connexion initialement fixée |
| **25 juin 2026** | **Report annoncé**, cinq jours avant l'échéance |
| **30 septembre 2026** | Échéance pour les **banques, les émetteurs de monnaie électronique et les établissements de paiement** |
| **30 juin 2027** | Échéance pour les **institutions de microfinance** supervisées par la Commission bancaire |

**État au 24 juin 2026**, publié par la banque centrale : **80 participants connectés**, et **74 institutions en phase de test réel** pour l'ouverture des services au public.

> [!note] Le report de juin est le énième d'une série, et le corpus l'avait relevé
> `maSecure` a établi de son côté que le cadre a été **reporté six fois en dix-huit mois**. Le report du 25 juin 2026 s'inscrit dans cette série. **Rien n'établit que celui du 30 septembre 2026 sera tenu**, et le lot `L0` ne doit pas être conduit en supposant qu'il le sera.

---

## 5. Le fait qui déplace le lot `L0` — l'absence de Wave n'est pas seulement technique

Le corpus hérité traitait l'absence des grands émetteurs comme un retard d'intégration, appelé à se résorber à l'échéance. **Un relevé du 24 août 2026 documente les motifs, et ils ne vont pas tous dans ce sens.**

| Motif | Nature | Ce qu'il implique pour l'échéance |
| --- | --- | --- |
| Prérequis techniques en cours de finalisation ; seules des *« informations préliminaires sur le processus d'intégration »* auraient été reçues ; une dérogation avait été accordée | **Déclaré par l'opérateur** | Transitoire — se résorbe |
| Attente de clarifications réglementaires, partagée par plusieurs acteurs importants | Supposé par des analystes | Transitoire |
| Statut particulier dans certains pays, compliquant l'intégration directe | Supposé | Transitoire |
| Intégration possible par une entité bancaire distincte plutôt qu'en qualité d'émetteur de monnaie électronique | Supposé | Transitoire, mais par une autre voie |
| **La gratuité des transferts sur la plateforme entre en collision directe avec le modèle historique de l'opérateur, fondé sur la facturation des transferts** | **Supposé — et structurel** | **Non transitoire.** Un acteur dont le revenu repose sur ce que la plateforme rend gratuit a un intérêt à ne pas s'y connecter |

> [!danger] Ce que ce dernier motif fait à l'hypothèse centrale du corpus
> Le corpus posait que la **cause `A`** du retrait subi — *« la personne est sur un autre opérateur »* — serait *« en voie de résolution »* par l'échéance du 30 septembre, et en tirait que le marché du projet se refermerait si la cause `A` dominait.
> **Ce raisonnement supposait que tous les émetteurs se connecteraient.** Si un acteur majeur a un intérêt économique structurel à ne pas le faire, la cause `A` **ne disparaît pas** : elle persiste pour la part de la population servie par cet acteur.
> Cela ne rend pas le projet plus solide — cela **change ce que le lot `L0` doit mesurer**. Il ne suffit plus de distinguer `A` de `B` : il faut, dans la cause `A`, distinguer **l'opérateur concerné**, parce que certains se connecteront et d'autres peut-être pas.

**Conséquence portée au protocole du lot `L0`, et pré-enregistrée avant toute collecte** : la question `P3` de l'instrument payeur est complétée d'un relevé de l'opérateur concerné lorsque la cause `A` est codée. Voir le [[payMe/10-etudes/Protocole de la vague 0|Protocole de la vague 0]], point 4.3.

---

## 6. Ce que ce relevé établit pour la suite

| # | Fait | Effet sur le lot `L0` |
| --- | --- | --- |
| `F9` | La composition burkinabè au 2 avril 2026 est **confirmée à la source primaire** : neuf institutions, six banques, **un seul émetteur de monnaie électronique** | Le socle du corpus tient |
| `F10` | Une liste arrêtée au **31 juillet 2026** existe ; **son contenu n'a pas été obtenu** | À obtenir **avant** le codage des entretiens |
| `F11` | L'échéance du 30 septembre 2026 résulte d'un **report annoncé le 25 juin 2026**, cinq jours avant l'échéance précédente. Au 24 juin : **80 connectés, 74 en test réel** | Ne pas conduire `L0` en supposant l'échéance tenue |
| `F12` | L'absence de Wave repose en partie sur un **conflit de modèle économique** : la gratuité des transferts sur la plateforme heurte un revenu fondé sur leur facturation | **La cause `A` ne disparaîtra pas uniformément.** L'instrument doit relever l'opérateur |

Ces quatre faits sont portés au [[payMe/90-pilotage/Registre des statuts|Registre des statuts]].

---

## 7. Ce que ce relevé ne fait pas

Il ne prononce aucune issue et n'inscrit aucune décision de projet.

Il **n'établit pas** la composition de la liste au 31 juillet 2026, et ne suppose rien à son sujet.

Il **n'établit pas** que Wave restera absent : les motifs relevés sont déclarés par l'opérateur pour les uns, supposés par des analystes pour les autres. Le motif structurel — le conflit de modèle — est le plus lourd de conséquences et **le moins bien établi** : il est classé hypothèse, non fait.

Il ne mesure aucune adoption : l'existence d'une connexion ne dit rien de l'usage qui en est fait.

---

## Sources

Toutes consultées le **2026-09-09**.

- [BCEAO, *Liste des participants autorisés à ouvrir les services de PI-SPI au public*, arrêtée au 2 avril 2026](https://www.bceao.int/sites/default/files/2026-04/Liste-des-participants_PI-SPI_2%20avril_2026.pdf) — **document officiel, lu directement**
- [BCEAO, page « Liste des participants autorisés à ouvrir les services de PI-SPI au public »](https://www.bceao.int/fr/communique-presse/liste-des-participants-autorises-ouvrir-les-services-de-pi-spi-au-public) — annonce la liste arrêtée au 31 juillet 2026
- [BCEAO, *Prolongation du délai de connexion à PI-SPI*](https://www.bceao.int/fr/communique-presse/prolongation-du-delai-de-connexion-a-pi-spi) — report du 25 juin 2026
- [Financial Afrik, *UEMOA : la BCEAO repousse les échéances de connexion au système de paiement instantané PI-SPI*, 25 juin 2026](https://www.financialafrik.com/2026/06/25/breaking-news-uemoa-la-bceao-repousse-les-echeances-de-connexion-au-systeme-de-paiement-instantane-pi-spi/)
- [Agence Ecofin, *UEMOA : les banques ont jusqu'à fin septembre pour intégrer le paiement instantané*](https://www.agenceecofin.com/actualites-finance/2506-139633-uemoa-les-banques-ont-jusqu-a-fin-septembre-pour-integrer-le-paiement-instantane)
- [OSIRIS, *Wave face à la plateforme PI-SPI et l'interopérabilité : refus ou dilemme stratégique ?*, 24 août 2026](https://www.osiris.sn/wave-face-a-la-plateforme-pi-spi-et-l-interoperabilite-refus-ou-dilemme.html)
- [FinancesAO, *PI-SPI : la BCEAO actualise sa liste au 2 avril 2026*](https://financesao.com/bceao-pi-spi-participants-autorises-avril-2026/)
- [leFaso.net, *Neuf banques et institutions désormais autorisées au Burkina Faso*](https://lefaso.net/spip.php?article144889=)
