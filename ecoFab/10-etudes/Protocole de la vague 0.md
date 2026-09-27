---
projet: "ecoFab"
type: "protocole-operationnel"
phase: "10-etudes"
version: "1.0"
objet: "Protocole exécutable de la vague 0 — L7a, L7b et L0 — à conduire avant le 30 septembre 2026"
document_parent: "[[Programme d'études approfondies]]"
lots_couverts: "L7a, L7b, L0 ; seuils pré-enregistrés pour L1, L3, L6"
regime: "Une seule personne"
date_butoir: 2026-09-30
statut: "Protocole — les seuils qu'il contient sont pré-enregistrés et ne se réécrivent pas"
cree_le: 2026-09-08
tags:
  - ecoFab
  - etudes
  - protocole
  - vague-0
---

# Protocole de la vague 0

Document **exécutable**. Il ne discute pas, il décrit ce qui doit être fait, par qui, avec quoi, et à quelle date.

| Élément | Valeur |
| --- | --- |
| Lots couverts | `L7a`, `L7b`, `L0` — et les seuils pré-enregistrés de `L1`, `L3`, `L6` |
| Fenêtre | **8 – 30 septembre 2026.** La vague 1 s'ouvre le 1er octobre et ne se rouvre qu'en octobre 2027 |
| Conduite | Une seule personne |
| Sortie attendue | Note de **jalon 1** datée, concluant sur l'issue retenue |
| Ce qu'il ne fait pas | Aucun entretien n'est conduit en vague 0. Aucune donnée personnelle n'est collectée avant que le point 4 ne soit exécuté |

> [!danger] Les seuils de ce document sont pré-enregistrés
> Ils constituent la contre-mesure **(a)** du point 5.2 du [[Programme d'études approfondies]], rendue obligatoire par l'absence de codage par un tiers en régime solo.
> **Un seuil réécrit après avoir vu le résultat n'est pas un seuil, c'est une justification.** Toute modification ultérieure d'un seuil de ce document doit être inscrite au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]], datée, et motivée par autre chose que le résultat obtenu.

---

## 1. Calendrier de la vague 0

| Semaine | Dates | Travail | Sortie |
| --- | --- | --- | --- |
| **S1** | 8 – 14 sept. | `L7a` relevé CampusFaso — **en premier, avant tout le reste** · envoi de la demande écrite `L5` · ouverture des démarches CIL | Carte datée du périmètre occupé · lettre envoyée · dossier CIL déposé |
| **S2** | 15 – 21 sept. | `L7b` cimetière et autopsie des échecs · construction du cadre d'échantillonnage | Fiches d'autopsie · cadre d'échantillonnage |
| **S3** | 22 – 28 sept. | Guide d'entretien · formulaires de consentement · demandes d'autorisation · prise de contact avec les premiers délégués | Trousse d'entretien complète · rendez-vous calés pour la semaine du 1er octobre |
| **S4** | 29 – 30 sept. | Rédaction de la **note de jalon 1** | Note datée, conclusion explicite |

> [!important] Pourquoi `L7a` passe en premier
> C'est le seul travail de la vague 0 qui puisse rendre tout le reste inutile, et il coûte une semaine. S'il conclut que l'emploi du temps est déjà couvert par le versant administratif, il n'y a aucune raison de construire un cadre d'échantillonnage.

---

## 2. `L7a` — Relevé du périmètre réellement occupé

> [!success] Lot conduit le 2026-09-08
> Sortie versée : [[Relevé du périmètre CampusFaso]]. Le seuil du point 2.4 a été appliqué **tel qu'écrit** ; le relevé a révélé un cas que ce seuil n'anticipait pas — production occupée, distribution non — et cette lacune est signalée sans être corrigée en cours de route, conformément à la règle `D3` de la [[Doctrine du coffre]]. La reformulation du seuil relève de la note de jalon 1.

**Question** : l'emploi du temps est-il absent de `services.campusfaso.bf` ?

### 2.1. Sources à relever, dans cet ordre

1. `campusfaso.bf` — pages d'accueil, procédure de candidature, gestion de dossier.
2. `services.campusfaso.bf` — inventaire **exhaustif** des services listés, y compris ceux qui ne sont pas mis en avant.
3. Présentation officielle de la cellule technique CampusFaso, version la plus récente disponible.
4. `service-public.gov.bf` — notice CampusFaso.
5. Communications du MESRSI des douze derniers mois : feuille de route, annonces de nouveaux services, marchés publics le cas échéant.
6. Sites et intranets d'un échantillon d'IESR : au moins deux publiques, une privée, une grande école.

### 2.2. Grille de relevé

Une ligne par fonction observée. Le relevé porte sur ce qui **existe**, pas sur ce qui est utile.

| Colonne | Contenu attendu |
| --- | --- |
| Fonction | Intitulé exact tel qu'il apparaît |
| Emplacement | URL ou document, avec la date de consultation |
| Statut | Disponible · annoncée · en projet · mentionnée sans être accessible |
| Adoption apparente | Indice observable — mention dans une actualité, tutoriel, plainte publique, silence complet |
| Recouvre l'emploi du temps ? | **oui / partiellement / non**, et sur quel critère |

### 2.3. Ce qui compte comme recouvrement

L'emploi du temps est réputé **couvert** si, et seulement si, une fonction accessible ou annoncée permet à un étudiant de connaître **les séances d'une semaine donnée pour sa filière et sa promotion**, et d'être informé d'une modification.

Ne comptent pas comme recouvrement : un calendrier académique annuel, une liste d'unités d'enseignement, un relevé de notes, un planning d'examens.

### 2.4. Seuil pré-enregistré

| Résultat | Conclusion |
| --- | --- |
| Aucune fonction ne couvre l'emploi du temps, ni disponible ni annoncée | Le candidat du point 3.0 tient. **Poursuivre.** |
| Une fonction le couvre, disponible | **CH3 devient bloquante.** Le candidat au cœur du domaine tombe. Un autre point d'entrée doit être cherché parmi les objets du point 14 **avant** tout entretien |
| Une fonction le couvre, annoncée mais non livrée | Le candidat est **fragilisé, non abattu**. La contre-hypothèse CH3 passe de tension à risque daté. Poursuivre, en inscrivant la surveillance du périmètre à chaque jalon |

---

## 3. `L7b` — Cimetière et autopsie des échecs

> [!success] Lot conduit le 2026-09-08
> Sortie versée : [[Cimetière et autopsie des échecs]]. Huit fiches, **aucun seuil franchi**. Deux défauts de la grille sont signalés sans être corrigés — le seuil `M4` est sans quantificateur, et la modération manque à la liste des causes. Leur reformulation relève de la note de jalon 1.

**Question** : qui a déjà tenté ceci, et de quoi est-il mort ?

### 3.1. Critères d'inclusion

Est retenu tout dispositif qui a visé **la communication ou la documentation d'une communauté étudiante ou scolaire**, et qui est aujourd'hui arrêté, abandonné ou sans usage constatable. Priorité aux cas d'Afrique de l'Ouest, puis aux cas comparables par contrainte — connectivité limitée, financement public, portage institutionnel.

Sont explicitement recherchés :
- les plateformes de campus déployées puis abandonnées ;
- les environnements numériques de travail institutionnels sans adoption ;
- les réseaux sociaux nationaux ou sectoriels arrêtés — le cas **Ayoba** est déjà documenté au coffre et sert de référence ;
- les projets financés par bailleur et arrêtés à la fin du financement.

### 3.2. Grille d'autopsie

Une fiche par cas. Sans cause de mort datée et sourcée, la fiche n'est pas versée.

| Champ | Contenu |
| --- | --- |
| Nom, pays, période | Dates de lancement et d'arrêt |
| Porteur | Institution, entreprise, association, projet financé |
| Promesse initiale | En une phrase, telle qu'annoncée |
| Ce qui a été livré | Ce qui existait effectivement |
| **Cause de mort** | Une seule cause dominante, argumentée |
| Source | Lien, article, rapport, avec date |
| Ce que cela dit à `ecoFab` | Une phrase, sans complaisance |

### 3.3. Classement des causes de mort

Chaque fiche est rangée dans **une seule** catégorie.

> [!warning] Correction d'une collision d'étiquettes — 2026-09-08
> La première rédaction de cette grille notait les causes `C1` à `C6`. L'[[Analyse du point d'entrée]] emploie déjà `C1` à `C6` pour ses **six critères d'adoption** — valeur solo, fréquence, échec structurel, dépendance, coût en données, pouvoir structurant. Deux jeux d'étiquettes identiques désignaient donc deux choses différentes dans le même projet.
> Les causes de mort sont renotées **`M1` à `M6`**. **Aucun seuil n'est modifié** : seule l'étiquette change, et les seuils du point 3.4 conservent exactement leur portée. Cette correction ne relève pas de la règle `D3`, qui porte sur les seuils, non sur leur notation.

| Code | Cause dominante |
| --- | --- |
| **M1** | Incapacité à faire migrer un usage installé qui fonctionne déjà |
| **M2** | Tarissement du producteur de contenu — bénévole, non rémunéré, non remplacé |
| **M3** | Dépendance institutionnelle non obtenue ou retirée |
| **M4** | Coût d'usage pour l'utilisateur — données, terminal, stockage |
| **M5** | Fin de financement, absence de modèle économique |
| **M6** | Absence de propriétaire du produit après le lancement |

### 3.4. Seuils pré-enregistrés

Sur un minimum de **huit fiches** versées.

| Résultat | Conclusion |
| --- | --- |
| **M2 est la cause dominante dans la moitié des cas ou plus** | **CH5 passe de risque à fait.** Le modèle « délégué outillé » doit être revu **avant** l'ouverture de la fenêtre. La vague 1 est suspendue jusqu'à reformulation |
| **M1 est la cause dominante dans la moitié des cas ou plus** | Le point 2.6 est confirmé de l'extérieur. Le coût d'adoption doit être rechiffré, et l'exigence EX3 — lecture sans compte — devient non négociable |
| **M4 dominante** | `L6` cesse d'être un lot embarqué et redevient un lot propre, conduit avant toute promesse documentaire |
| Moins de huit fiches trouvables | **C'est un résultat, pas un échec** : l'absence de cadavres documentés signifie soit que le terrain est neuf, soit que les échecs ne sont pas documentés. Les deux se distinguent en cherchant les *annonces de lancement* sans suite |

---

## 4. `L0` — Ce qui rend les entretiens licites et utiles

> [!success] Lot conduit le 2026-09-08
> Sortie versée : [[Trousse de terrain]]. Socle statistique actualisé sur 2023/2024, cadre d'échantillonnage à quatre strates, registre des traitements, trois formulaires de consentement et deux lettres, rédigés pour être employés tels quels.
> **Trois choses restent à exécuter par le porteur** : le dépôt CIL, qui est physique ; le choix nominatif des établissements des strates B et C ; et le premier rendez-vous, qui ne dépend d'aucune autorisation par la voie associative.

### 4.1. Démarches de conformité — à ouvrir en semaine 1

La loi n° 001-2021/AN du 30 mars 2021 régit le traitement des données à caractère personnel au Burkina Faso, et la Commission de l'Informatique et des Libertés exige une **déclaration préalable des traitements**. Elle s'applique au programme de recherche lui-même, dès le premier entretien enregistré.

| Démarche | Quand | Objet |
| --- | --- | --- |
| Déclaration préalable auprès de la CIL | **Semaine 1** | Traitement de recherche : entretiens, verbatims, contacts |
| Registre des traitements | Semaine 1 | Finalité, catégories de données, durée de conservation, destinataires |
| Politique de minimisation | Semaine 1 | Aucun identifiant national, aucune donnée de scolarité nominative n'est collectée |

**Le délai de réponse de la CIL est inconnu et n'est pas maîtrisable.** Il est traité comme une donnée du programme, pas comme un aléa : la date de dépôt et la date de réponse sont consignées. Si la réponse n'est pas parvenue au 1er octobre, seuls les entretiens **non enregistrés et sans collecte de contacts** peuvent être conduits, sur notes manuscrites anonymes.

### 4.2. Cadre d'échantillonnage

Construit à partir de l'annuaire statistique du MESRSI le plus récent, obtenu en semaine 2.

**Contrainte de régime solo** : deux à trois établissements d'une même ville. Le point 5.2 du programme a acté que **la représentativité nationale est abandonnée**. Le cadre ci-dessous vise le contraste, pas la représentativité.

| Strate | Cible | Motif |
| --- | --- | --- |
| Une grande université publique | 6 à 8 délégués | Effectifs massifs, chevauchement historique des années, cas le plus dur |
| Un établissement privé | 2 à 3 délégués | Promotions petites, calendrier souvent régulier — cas contrastant |
| Une grande école | 2 à 3 délégués | Structure différente, nomenclature souvent non « UFR » |
| Scolarité ou direction adjointe | 2 à 3 personnes | **Après** les délégués, jamais avant |

**Total visé : 10 à 12 délégués, 2 à 3 responsables.** C'est le plafond de capacité d'une personne sur la fenêtre.

### 4.3. Guide d'entretien — délégués

> [!danger] Règle absolue de ce guide
> **Aucun mot du projet n'y figure.** Ni *plateforme*, ni *application*, ni *outil*, ni *cercle académique*, ni *écosystème*, ni *emploi du temps numérique*. Un entretien qui nomme la solution obtient une réponse de politesse, et la réponse de politesse est toujours favorable.
> L'entrée se fait par **la charge de la personne**, jamais par le produit.

**Ouverture — le rôle et sa charge**

1. Comment êtes-vous devenu délégué ? Depuis quand ?
2. Racontez-moi votre semaine dernière : qu'avez-vous eu à transmettre, et à qui ?
3. Combien de fois vous a-t-on redemandé une information que vous aviez déjà transmise ? Sur quoi portait-elle ?
4. Que se passe-t-il quand vous n'êtes pas disponible ?

**Le point de rupture de la chaîne**

5. Comment recevez-vous l'information de l'administration ? Par quel canal exactement ?
6. Décrivez le dernier changement de dernière minute que vous avez eu à répercuter. Quand ? Combien de temps avant la séance ?
7. Qu'est-ce qui s'est mal passé, la dernière fois ?
8. Y a-t-il eu des étudiants qui n'ont pas eu l'information ? Comment l'avez-vous su ?

**La trace — ce qui compte plus que les déclarations**

9. Montrez-moi, si vous l'acceptez, comment vous vous y prenez aujourd'hui. *(observation, sans capture ni copie)*
10. Avez-vous déjà mis en place quelque chose de votre côté — un fichier, un tableau, un second groupe, un carnet ? Est-ce que vous l'avez tenu ?
11. Est-ce que quelqu'un avant vous avait mis en place quelque chose ? Qu'en reste-t-il ?

**La fin de mandat et la continuité**

12. Que se passera-t-il quand vous ne serez plus délégué ? Qu'est-ce qui se transmet ?
13. Qu'est-il arrivé à ce que votre prédécesseur avait accumulé ?

**Le gain — posé en dernier, et jamais en premier**

14. S'il y avait une seule chose de moins à faire dans ce rôle, laquelle choisiriez-vous ?
15. Y a-t-il quelque chose que vous aimeriez que les étudiants puissent trouver sans vous le demander ?

**Embarqué — `L6`, huit minutes en fin d'entretien**

16. Quel téléphone utilisez-vous ? Quelle capacité de stockage vous reste-t-il, approximativement ?
17. Comment rechargez-vous vos données, et combien dépensez-vous par mois ?
18. Quand le crédit manque en fin de mois, qu'est-ce que vous cessez d'utiliser en premier ?

### 4.4. Ce qui est cherché, et qui ne se demande pas

Trois observations valent davantage que toutes les réponses, et aucune ne s'obtient par une question directe.

| Observation | Ce qu'elle établit | Où elle apparaît |
| --- | --- | --- |
| **Un contournement bricolé et tenu** — un fichier, un tableau, un second groupe | Comportement révélé : la douleur est réelle et coûte assez pour qu'on agisse | Questions 10 et 11 |
| **Un contournement bricolé et abandonné** | Le coût de tenue dépasse le bénéfice — c'est l'argument de l'outillage, mais c'est aussi le risque `M2` du cimetière | Questions 10 et 11 |
| **Une exaspération spontanée**, non sollicitée, sur la répétition | La charge est vécue, pas déduite | Questions 2 et 3 |

### 4.5. Consentement

Trois consentements **distincts**, recueillis séparément et par écrit : pour l'entretien, pour l'enregistrement, pour la citation. Un refus sur l'un n'entraîne pas les autres.

Mentions obligatoires : finalité de la recherche, absence de lien avec un produit commercialisé, durée de conservation, droit de retrait sans justification, anonymisation dès la transcription, et coordonnées du responsable du traitement.

**Pour les mineurs** — hypothèse ouverte si le volet lycéen est instruit : autorisation parentale ou de l'établissement, et protocole distinct. Aucun mineur n'est interrogé en vague 1.

### 4.6. Autorisations institutionnelles

Demandes à adresser en semaine 3, en parallèle, sans attendre de réponse pour poursuivre :

- Présidences d'université et directions d'UFR des établissements retenus.
- Directions des établissements privés et des grandes écoles retenus.
- Associations étudiantes, comme **voie alternative** si les autorisations institutionnelles n'arrivent pas.

**Seuil pré-enregistré** : si aucune autorisation n'est obtenue au 1er octobre, le programme bascule sur la voie associative et le recrutement direct de délégués — **avant** la vague 1, jamais pendant. Ce basculement est journalisé.

---

## 5. Seuils pré-enregistrés de la vague 1

Écrits maintenant, avant le premier entretien, conformément à la contre-mesure **(a)** du point 5.2.

| Lot | Hypothèse testée | Seuil d'invalidation | Conséquence si franchi |
| --- | --- | --- | --- |
| **L3** | Le délégué reconnaît une charge et un gain à l'outillage | **Moins de 6 délégués sur 10** décrivent spontanément la charge **et** reconnaissent un gain | Le producteur de niveau 4 n'existe pas. **C1 s'effondre**, donc la valeur solo, donc l'exemption d'amorçage réseau. Le modèle n'a pas de plan B — **issue C ou D** |
| **L3** | La chaîne casse là où le projet le suppose | La rupture décrite est **ailleurs** dans plus de la moitié des cas | Le point d'entrée change d'objet |
| **L1** | La disparition d'un groupe en fin d'année est vécue comme une perte | **Moins de 4 sur 10** décrivent une perte concrète et nommable | L'axe « mémoire et continuité » perd son fondement |
| **L1** | La douleur de la modification est datée et distinguée du régime chevauché | La douleur décrite se rapporte **uniquement** à la période 2019-2024 | **CH2 confirmée** : la normalisation érode la douleur. Le candidat est affaibli, la fenêtre de valeur se referme |
| **L6** | Le coût en données autorise une consultation hebdomadaire | Le coût est jugé dissuasif **même pour du texte** par plus de la moitié | Tout le projet est touché, pas seulement le point d'entrée |

**Comptage des infirmations** — contre-mesure **(d)**. Chaque lot rapporte le nombre d'observations qui **contredisent** l'hypothèse. Un lot qui n'en rapporte aucune est traité comme suspect, et son échantillon est réexaminé avant d'être versé.

---

## 6. Note de jalon 1 — plan imposé

> [!success] Note rendue partiellement le 2026-09-08
> Sortie versée : [[Note de jalon 1]]. Les points 1 à 3 et 5 à 7 du plan ci-dessous sont traités ; **le point 4 ne l'est pas** — les démarches CIL et les autorisations dépendent de tiers et ne sont pas exécutées. La troisième question du jalon reste ouverte et sera close par un addendum daté avant le 30 septembre.
> **Aucune décision n'est inscrite au journal.** L'issue est proposée, non retenue.

Rédigée les 29 et 30 septembre. Elle conclut, elle ne rapporte pas.

1. **Ce qui a été fait**, avec les dates réelles.
2. **`L7a`** — carte du périmètre occupé, et verdict au regard du seuil du point 2.4.
3. **`L7b`** — nombre de fiches versées, cause de mort dominante, et verdicts au regard des seuils du point 3.4.
4. **`L0`** — état des démarches CIL, autorisations obtenues et **refusées**, cadre d'échantillonnage arrêté.
5. **Les infirmations rencontrées** — ce qui, dans la vague 0, contredit le projet. Section obligatoire ; « aucune » est une réponse qui doit être justifiée.
6. **Issue retenue** : poursuivre · reformuler le périmètre · **arrêter**. Une seule, explicitement nommée.
7. **Ce qui reste non instruit**, et à quel jalon.

La note est versée en `10-etudes`, et son franchissement inscrit au [[ecoFab/90-pilotage/Journal des décisions|Journal des décisions]] avec son motif et ses preuves.

---

## 7. Ce que ce protocole ne fait pas

Il ne conduit aucun entretien, ne collecte aucune donnée personnelle, et ne préjuge d'aucune issue. Il ne lève aucune des 26 suspensions du point 22 du [[Document fondateur d'ouverture]].

Il rend possible une décision au 30 septembre 2026 — **y compris la décision d'arrêter**, qui est à ce jalon la moins coûteuse qu'elle sera jamais.
