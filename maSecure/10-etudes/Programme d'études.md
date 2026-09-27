---
projet: "maSecure"
type: "programme-de-recherche"
phase: "10-etudes"
version: "0.1"
statut: "Document de travail — protocole d'investigation, non normatif"
document_parent: "[[maSecure/00-intention/Document fondateur d'intention|Document fondateur d'intention]]"
doctrine: "Intention d'abord ; preuve ensuite ; le programme doit pouvoir conclure « ne pas construire »"
issues_possibles: "A construire / B périmètre réduit / C construire autre chose / D ne pas construire"
jalon_courant: "avant jalon 1"
cree_le: 2026-09-09
tags:
  - maSecure
  - etudes
  - protocole-de-recherche
  - non-normatif
---

# Programme d'études

Ouverture opérationnelle du point 8 du [[maSecure/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

| Élément | Valeur |
| --- | --- |
| Statut | Document de travail — protocole d'investigation, **non normatif** |
| Nature | Protocole de recherche : lots, méthodes, terrains, jalons, seuils pré-enregistrés |
| Ce que le document ne constitue pas | Ni plan de développement, ni cahier des charges, ni engagement de construction |
| Corpus hérité | 41 fichiers en [[maSecure/99-sources/Sources originales\|99-sources]], **référence non opposable** |

---

## 1. Ce que le programme doit permettre de conclure

| Issue | Contenu |
| --- | --- |
| **A. Construire tel que décrit** | Le problème existe, la valeur est reconnue, la voie est licite, la place est libre |
| **B. Périmètre réduit** | Seule une partie porte une valeur réelle — typiquement la règle et la preuve, sans la garde des fonds |
| **C. Construire autre chose** | Le terrain révèle un problème différent et plus aigu |
| **D. Ne pas construire** | Le besoin est couvert, la voie est fermée, ou la valeur ne justifie pas le coût |

> [!important] Règle de survie du programme
> L'issue **D** doit rester atteignable jusqu'au dernier jalon. Elle est ici difficile à tenir : le corpus représente sept heures de conception détaillée, et l'abandonner coûte davantage que d'abandonner une page blanche. **Ce coût déjà engagé n'est pas un argument** et ne doit apparaître dans aucune note de jalon.

---

## 2. Ce que le socle établit déjà

Le [[Benchmark et cadre réglementaire]], conduit le 2026-09-09, dispense de redécouvrir quatre choses.

| # | Acquis | Portée |
| --- | --- | --- |
| `S1` | **Six acteurs vivants** de tontine numérique sont documentés, dont un **agréé par la Banque centrale** | Le terrain n'est pas vierge. Leur **adoption** reste inconnue |
| `S2` | Le régime UEMOA exige un agrément pour émettre de la monnaie électronique, **capital minimum 300 millions de francs CFA libérés avant délivrance** | La garde des fonds est une dépendance de niveau maximal |
| `S3` | Le cadre de licence a été **reporté six fois en dix-huit mois**, pour « à peine une douzaine d'approbations » | Le délai n'est pas maîtrisable |
| `S4` | Sur vingt fermetures de fintechs africaines documentées, **trois** le sont par défaut de licence, dont une ayant levé 86,1 M$ | Le capital ne dispense pas de l'agrément |

---

## 3. Lots de travail

Chaque lot porte sa question directrice, sa méthode, sa sortie et sa **condition d'invalidation**.

> [!note] Deux lots portés dès l'origine, par doctrine
> La règle `D2` de la [[Doctrine du coffre]] impose que tout programme d'études porte un lot **actif** et un lot **payeur** dès sa première version. Ce sont `L7` et `L8`. Leur absence a coûté un verdict de programme à `ecoFab` ; elle est évitée ici par construction.

### 3.1. Vague 0 — ce qui peut conclure sans dépenser un entretien

#### L1 — La voie sans garde est-elle licite ?

**Question directrice** : un système qui **ordonnance, calcule, prouve et notifie** sans jamais détenir les fonds — l'argent circulant directement entre membres par leurs propres comptes de *mobile money* — relève-t-il d'un régime d'agrément en zone UEMOA ?

**Pourquoi ce lot passe en premier** : c'est la question du point 4.3 du document fondateur d'intention. Elle commande le périmètre, le calendrier, la forme juridique et le modèle économique. Elle est **documentaire, gratuite, et sans autorisation**.

**Travaux** : lecture de l'instruction n° 008-05-2015 et de l'instruction n° 001-01-2024, en cherchant la frontière exacte entre *détenir des fonds*, *initier un paiement* et *donner une instruction*. Examen du statut d'agent ou de distributeur. Relevé du régime applicable à un simple **livre de comptes** qui ne touche à rien. Recherche d'une position publiée de la Banque centrale sur les applications de tontine.

**Sortie** : note qualifiant les trois voies du point 4.3, avec pour chacune le régime applicable et sa source.

**Invalidation, pré-enregistrée** : si **aucune** des trois voies n'est praticable sans agrément préalable, le projet est une entreprise financière réglementée avant d'être un logiciel, et l'issue **D** doit être examinée en priorité.

#### L2 — Les six acteurs sont-ils adoptés, et de quoi meurent ceux qui manquent ?

**Question directrice** : les acteurs relevés au benchmark ont-ils des utilisateurs, et quels dispositifs de tontine numérique se sont arrêtés ?

**Travaux** : pour chacun des six, recherche d'indices d'adoption — nombre d'installations, mentions dans la presse, dernière mise à jour, avis d'utilisateurs, groupes actifs. **Autopsie des arrêts** : le benchmark n'a trouvé aucune tontine dans les vingt fermetures documentées, ce qui n'établit rien, le relevé documentaire étant aveugle aux dispositifs non financés.

**Sortie** : indice d'adoption par acteur, daté ; fiches d'autopsie s'il en existe.

**Invalidation, pré-enregistrée** : si **un acteur au moins** dispose d'une adoption mesurable et couvre le même besoin, la question devient *« qu'apporte `maSecure` de plus ? »*, et le projet ne peut pas franchir le jalon 2 sans y répondre.

### 3.2. Vague 1 — la tontine réelle

#### L3 — Comment une tontine fonctionne-t-elle réellement, et qu'est-ce qui casse ?

**Question directrice** : qui tient les comptes, comment, et que se passe-t-il quand cela va mal ?

**Entrée par le récit, jamais par le produit.** Aucun mot du projet — ni *plateforme*, ni *application*, ni *coffre*, ni *système* — n'est prononcé avant la fin de l'entretien.

**Travaux** : entretiens de membres et de trésoriers de tontines réelles. Reconstitution d'un cycle complet. Recherche du **contournement** : un carnet, un tableau, un groupe de messagerie, une photographie des versements. Description du dernier incident réellement survenu.

**Questions du corpus traitées** : `PB1` à `PB3`.

**Invalidation, pré-enregistrée** : si aucun incident de trésorier n'est rapporté chez plus de **2 personnes sur 10**, `PB1` — le risque humain — n'est pas la douleur dominante, et le projet se recentre.

#### L4 — Le désir de dessaisir le trésorier

**Question directrice** : les membres veulent-ils qu'une personne cesse de détenir l'argent ?

C'est la **condition de fausseté de la thèse**, et elle ne se demande pas directement : personne ne déclare faire confiance à un système inconnu contre une personne connue, ni l'inverse, sans y être conduit.

**Méthode comportementale** : reconstituer avec chaque personne **ce qu'elle a fait** la dernière fois qu'un doute est apparu — a-t-elle changé de trésorier, quitté le groupe, exigé des comptes, ou n'a-t-elle rien fait ? La trace prime sur la déclaration.

**Invalidation, pré-enregistrée** : si plus de la moitié des personnes interrogées préfèrent explicitement un trésorier connu à un système automatique **après avoir décrit un incident vécu**, la thèse tombe entièrement.

#### L6 — Contraintes matérielles et coût du *mobile money*

**Question directrice** : que coûte un cycle complet en frais de transfert, et qui les supporte ?

**Travaux** : relevé des tarifs des opérateurs sur le territoire visé ; simulation du coût d'un cycle pour un groupe type ; part des frais dans la cotisation. Terminal, stockage, dépense mensuelle en données.

**Invalidation, pré-enregistrée** : si les frais d'un cycle dépassent **5 % de la cotisation**, le passage par le numérique coûte plus qu'il n'apporte, et le modèle doit être revu avant toute conception.

### 3.3. Vague 2 — périmètre, actif, payeur

#### L5 — Le public et le territoire

**Question directrice** : sur quel premier marché, petit et dominable, la valeur peut-elle être démontrée ?

Le corpus ne nomme **aucun territoire**. La contrainte réglementaire étant régionale, ce choix commande le régime applicable.

**Invalidation** : si aucun public ne réunit accessibilité et pratique réelle de la tontine, le projet n'a pas de marché initial.

#### L7 — L'actif : ce qui s'accumule, se creuse et appartient

**Question directrice** : que le projet accumulerait-il, cela se creuserait-il à l'usage, et à qui cela appartiendrait-il ?

| Question | Piste à instruire |
| --- | --- |
| **Que s'accumule-t-il ?** | L'**historique de fiabilité** des membres : qui a payé à temps, sur combien de cycles. C'est le seul candidat |
| **Cela se creuse-t-il ?** | Un historique gagne en valeur avec le temps et le nombre de cycles. **Potentiellement oui**, ce qui est rare |
| **À qui appartient-il ?** | Un historique de paiement est une donnée personnelle **et** un embryon de score de crédit. Question juridique lourde, à instruire avant toute modélisation |

**Invalidation** : si l'historique n'est ni conservable, ni appropriable, ni portable, le projet est une commodité et le principe de l'actif n'a aucun chemin de franchissement.

#### L8 — Le payeur

**Question directrice** : qui porte aujourd'hui une ligne de coût pour ce problème, même cachée ?

**Travaux** : la perte sur défaut, le temps du trésorier, le coût des conflits, les frais de transfert déjà payés. Distinction stricte entre **qui subit**, **qui décide** et **qui paie** — dans une tontine, ce sont rarement les mêmes.

**Invalidation** : aucun payeur identifiable ne disqualifie pas le projet, mais le fait basculer vers l'outil gratuit ou le bien commun, ce qui change gouvernance et financement.

### 3.4. Vague 3 — l'épreuve

#### L9 — Épreuve de valeur sur une tontine réelle

**Question directrice** : un dispositif minimal produit-il un gain mesurable ?

**Travaux** : dispositif **manuel ou semi-manuel, sans développement et sans toucher aux fonds**, sur une à trois tontines volontaires, pendant au moins deux cycles complets. Indicateur défini à l'avance, dans l'unité des membres — par exemple le nombre de litiges par cycle, ou le délai moyen de règlement.

**Règle** : aucune expérimentation avant que `L3` et `L4` aient établi que le problème existe et que le dessaisissement est accepté.

---

## 4. Séquencement et jalons

```
VAGUE 0 — Desk pur, aucune autorisation           L1, L2
        |
        v  -- JALON 1 -----------------------------------------------
           Une voie licite existe-t-elle sans agrément préalable ?
           La place est-elle libre ?
           Sortie possible : reformulation du périmètre, ou ARRÊT.
        |
VAGUE 1 — Terrain                              L3, L4, L6
        |
        v  -- JALON 2 -----------------------------------------------
           Le risque de trésorier est-il la douleur dominante ?
           Le dessaisissement est-il accepté ?
           Sortie possible : issue C ou D.
        |
VAGUE 2 — Desk et juridique                    L5, L7, L8
        |
        v  -- JALON 3 -----------------------------------------------
           Un premier marché, un actif, un payeur ?
           Sortie possible : issue B ou D.
        |
VAGUE 3 — Épreuve                                  L9
        |
        v  -- JALON 4 -----------------------------------------------
           Un gain mesurable sur une tontine réelle ?
           Sortie : cadrage stratégique et DDD, ou arrêt.
```

### 4.1. Un ordre imposé

**`L1` avant tout le reste.** Si la voie sans garde n'est pas licite, le projet change de nature avant qu'un seul entretien soit conduit. Le lot est documentaire et ne dépend de personne.

**`L9` ne touche jamais aux fonds**, quelle que soit l'issue de `L1`. Une expérimentation qui détiendrait de l'argent de tiers sans agrément serait illicite, et le programme ne peut pas la prévoir.

---

## 5. Ce qui compte comme preuve

| Niveau | Nature | Usage autorisé |
| --- | --- | --- |
| 1 | Mesure directe, trace observée, texte réglementaire | Peut fonder une décision |
| 2 | Déclaratif convergent sur échantillon contrasté | Peut fonder une décision, avec réserve explicite |
| 3 | Déclaratif isolé | Oriente, ne décide de rien |
| 4 | Intuition du porteur, analogie, conception | Produit des hypothèses, jamais des conclusions |

**L'ensemble du corpus hérité relève du niveau 4.**

> [!warning] Deux échelles de preuve coexistent dans le coffre, et elles sont inversées
> Ici, le **niveau 1 est le plus fort**. Les notes d'épreuve stratégique du coffre emploient une échelle notée `[N0]` à `[N4]` où **`[N4]` est le plus fort**. Toute mention indique de quelle échelle elle relève.

---

## 6. Éthique, conformité, et une contrainte propre à ce projet

Le programme collecte des données personnelles — récits d'incidents, situations financières, différends entre proches. Ces données sont **sensibles au sens ordinaire** : elles décrivent des conflits d'argent dans un cercle social restreint.

- Consentement écrit distinct pour l'entretien, l'enregistrement et la citation.
- Anonymisation dès la transcription ; table de correspondance séparée ; durée de conservation fixée d'avance.
- **Aucune donnée bancaire, aucun montant nominatif, aucun nom de tiers absent de l'entretien.**
- **Aucun litige en cours n'est documenté**, quelle que soit sa valeur pour l'étude.
- Le régime de déclaration dépend du territoire retenu en `L5` ; il est établi **avant la première collecte**, jamais après.

---

## 7. Risques du programme

| Risque | Effet | Contre-mesure |
| --- | --- | --- |
| **Biais de confirmation du porteur** | Le terrain confirme la conception déjà écrite | Seuils pré-enregistrés ; guide d'entretien **sans le vocabulaire du corpus** ; comptage des observations qui contredisent |
| **Coût déjà engagé** | Sept heures de conception rendent l'issue D psychologiquement inatteignable | Interdiction d'invoquer le corpus dans une note de jalon |
| **Le corpus fournit des réponses toutes faites** | Les entretiens confirment le vocabulaire au lieu de le tester | Ni *coffre*, ni *fonds de recouvrement*, ni *quarantaine* dans les guides |
| **La tontine est un objet intime** | Les personnes minimisent les conflits devant un tiers | Entrer par le récit d'un cycle, jamais par le conflit |
| **Dérive vers la conception** | L'étude se transforme en spécification, le corpus servant de modèle | Aucun artefact de conception avant le jalon 4 |

---

## 8. Ce que ce programme ne décide pas

Il ne tranche ni le rapport aux fonds, ni le régime réglementaire, ni le territoire, ni le périmètre, ni le modèle économique, ni la forme juridique, ni le *Core Domain*, ni l'architecture. Il détermine seulement **dans quel ordre** et **sur quelle base probatoire** ces décisions pourront être prises.

Il n'engage pas la construction. L'issue **D** reste ouverte jusqu'au jalon 4.
