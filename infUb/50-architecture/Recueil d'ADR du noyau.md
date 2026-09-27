---
projet: "infUb"
type: "recueil-adr"
phase: "50-architecture"
version: "0.1"
date_du_document: 2026-09-02
statut: "Recueil de décisions techniques — première série, 14 ADR acceptés"
adr_couverts: "ADR-001 à ADR-014"
portee: "Identité, habilitation, preuve, validité et socle"
document_amont: "[[Étude comparative et solution cible]] (points 7.3, 7.4 et 7.7) · [[DDD tactique du noyau]]"
format: "Contexte · Options considérées · Décision · Conséquences · Critères de réouverture"
tags:
  - infUb
  - architecture
  - adr
  - decisions
---

> [!info] Note de provenance — ajoutée par la mise en coffre, ne fait pas partie du document
> Fichier reçu **déjà en Markdown** : aucune conversion. Déplacé depuis la racine du dossier `infUb/` et renommé ; le corps ci-dessous est **identique octet pour octet** à l'original (35 166 octets), seul l'en-tête de propriétés ci-dessus a été ajouté. Empreinte et provenance : [[infUb/99-sources/Sources originales|Sources originales]]. Décision `DEC-C-008` au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]].
>
> **Les quatorze ADR de ce recueil font foi.** Le [[infUb/90-pilotage/Journal des décisions|Journal des décisions]] les indexe comme décisions de projet mais ne les reproduit pas : le texte complet, les options écartées et les critères de réouverture sont ici, et nulle part ailleurs.

---

# RECUEIL D'ADR — NOYAU HABILITATION, PUBLICATION ET PREUVE

| Élément | Valeur |
|---|---|
| **Statut** | Recueil de décisions techniques — première série |
| **Version** | 0.1 |
| **Date** | 2 septembre 2026 |
| **Portée** | ADR-001 à ADR-014, couvrant l'identité, l'habilitation, la preuve, la validité et le socle |
| **Documents amont** | Document de référence global V1.0 (points 12, 13 et 19) · Étude comparative et solution cible V1.0 (points 7.3, 7.4 et 7.7) · DDD tactique V0.1 |
| **Format** | Contexte · Options considérées · Décision · Conséquences · **Critères de réouverture** |

> **Sur les critères de réouverture.** Le document de référence prévoit que les ADR portent des « critères de réouverture ». C'est la partie la plus utile et la plus souvent absente d'un ADR : elle évite qu'une décision prise sous contrainte devienne un dogme, et qu'une décision saine soit rouverte à chaque désaccord d'humeur. Chaque ADR ci-dessous nomme les faits — mesurés, pas ressentis — qui obligeraient à le rouvrir.

---

## Index

| ADR | Objet | Statut |
|---|---|---|
| 001 | Schéma d'identifiant canonique et code court | Accepté |
| 002 | Résolveur d'identifiants découplé de l'application | Accepté |
| 003 | Habilitation comme agrégat distinct de l'organisation | Accepté |
| 004 | Instantané d'habilitation embarqué plutôt que jointure vivante | Accepté |
| 005 | État de validité calculé, jamais persisté | Accepté |
| 006 | Sérialisation canonique JCS et empreinte SHA-256 dès la V1 | Accepté |
| 007 | Journal de preuve append-only chaîné | Accepté |
| 008 | Niveaux d'habilitation et plafonnement par la vérification | Accepté |
| 009 | Versions publiées immuables ; correction = nouvelle version | Accepté |
| 010 | Pas de 404 : toute ressource retirée renvoie un état | Accepté |
| 011 | Vidéo référencée, non hébergée | Accepté, révisable |
| 012 | Recherche PostgreSQL avec seuil de sortie chiffré | Accepté, révisable |
| 013 | OIDC comme contrat, Keycloak différé | Accepté, révisable |
| 014 | Publication à statut informatif, conçue pour l'opposabilité | Accepté |

---

## ADR-001 — Schéma d'identifiant canonique et code court

**Statut :** Accepté · **Contexte DDD :** Publication

### Contexte
Le point 13.1 du document de référence pose le principe d'un identifiant stable sans le spécifier. Or cet identifiant est l'un des deux actifs stratégiques défendables du projet (étude, point 6.2) : sa valeur vient de ce que les liens émis — sur Facebook, par SMS, à la radio, dans la presse, dans un SI tiers — pointent vers lui et continuent de résoudre dans dix ans. Il doit en outre être **dicté à voix haute à la radio** et **saisi sur un clavier de téléphone simple**, contrainte imposée par le fait que 77 % de la population n'est pas internaute.

### Options considérées
| Option | Écartée parce que |
|---|---|
| UUID v4 en URL | Non dictable, non mémorisable, opaque, ne porte aucune information de provenance |
| Identifiant séquentiel numérique | Énumérable (fuite du volume et des brouillons par sondage), non structuré |
| Slug éditorial dérivé du titre | Change quand le titre change — viole la stabilité |
| ARK / Handle / DOI | Excellent techniquement, mais introduit une dépendance à une autorité d'enregistrement externe, contraire à l'exigence de souveraineté |
| **Forme longue sémantique + code court à contrôle** | Retenue |

### Décision
Deux formes, l'une et l'autre immuables à vie :

```text
Forme longue   /bf/{secteur}/{orgSlug}/{typeActe}/{annee}/{numero}
               /bf/education-superieure/ujkz/appel-candidature/2026/047

Forme courte   7 caractères Crockford base32 (6 données + 1 contrôle)
               CSEM-ZN7      →   infub.bf/p/CSEMZN7

Version        …/047/v2      (la forme sans version résout vers la version en vigueur)
```

- Alphabet Crockford `0123456789ABCDEFGHJKMNPQRSTVWXYZ` — sans `I`, `L`, `O`, `U`.
- Normalisation à la saisie : `I`→`1`, `L`→`1`, `O`→`0`, casse et tirets ignorés.
- Contrôle : `alphabet[(Σ valeur(dᵢ) × wᵢ) mod 32]`, `w = [1,3,5,7,9,11]` — poids impairs, donc premiers avec 32.
- Attribution du code court par chiffrement à préservation de format d'un compteur sur 30 bits (clé fixe et versionnée) : non séquentiel, donc non énumérable, sans collision ni table de rejet.
- La forme longue reste valide même si l'organisation change de nom, fusionne ou est dissoute : le `orgSlug` est gelé dès la première publication (INV-H7).

**Capacité de détection mesurée** (50 000 codes simulés) : substitution d'un caractère **100 %**, transposition adjacente 95,7 %, transposition avec le caractère de contrôle 90,1 %.

### Conséquences
**Positives** — l'identifiant est dictable, vérifiable à la saisie, non énumérable, lisible par un humain sous sa forme longue, et sans dépendance externe. L'espace utile (1,07 milliard) est hors d'atteinte à l'échelle du pays.
**Négatives** — le gel du `orgSlug` crée une dette de lisibilité : une organisation renommée gardera un ancien slug dans ses anciennes URL. C'est le prix de la stabilité, et c'est le bon prix. La détection des transpositions n'est pas parfaite.
**À faire** — la table de correspondance `code court → identifiant` doit être répliquée dans le résolveur (ADR-002).

### Critères de réouverture
- Un besoin avéré d'interopérabilité avec un système de résolution national ou régional (AES) imposant ARK, Handle ou ELI.
- Un taux d'erreur de saisie constaté supérieur à 2 % sur le canal SMS après six mois d'exploitation.
- Un dépassement de 10 % de l'espace d'adressage — hypothèse sans objet à horizon visible.

---

## ADR-002 — Résolveur d'identifiants découplé de l'application

**Statut :** Accepté · **Contexte DDD :** Transverse

### Contexte
La valeur de l'identifiant canonique tient à sa capacité à résoudre dans dix ans. Or, sur dix ans, l'application sera réécrite, le framework changera, l'hébergeur changera peut-être. Si la résolution d'un permalien dépend du fonctionnement complet de l'application, alors la promesse de pérennité vaut ce que vaut la version courante du logiciel — c'est-à-dire peu.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Route ordinaire dans l'application | La disponibilité du permalien devient celle de l'ensemble de l'application |
| Redirection statique par fichier de configuration | Ne gère ni les versions, ni les états (retirée, remplacée) |
| **Composant de résolution autonome sur table de projection** | Retenue |

### Décision
Un composant `resolveur` autonome, sans dépendance à aucun contexte métier, qui lit une **table de projection** alimentée par événement et répond à trois questions seulement : à quoi correspond cet identifiant, quel est son état, où est sa représentation courante. Il est déployable et hébergeable séparément de l'application, y compris sur une infrastructure différente, et sa table de projection est intégralement reconstructible depuis le journal de preuve et la base de publication.

### Conséquences
**Positives** — la promesse de permalien survit à une réécriture complète de l'application ; le composant le plus sollicité en lecture est aussi le plus simple et le plus facile à mettre en cache ; en cas d'incident majeur, il peut rester debout seul et servir les états.
**Négatives** — une projection de plus à maintenir et à surveiller ; risque de dérive si la reconstruction n'est pas testée régulièrement.
**À faire** — un test de reconstruction complète de la table de résolution doit figurer dans la chaîne d'intégration, pas dans une procédure écrite.

### Critères de réouverture
- Si la table de résolution ne peut pas être reconstruite intégralement en moins d'une heure à partir des sources de vérité, le découplage est illusoire et la décision doit être revue.

---

## ADR-003 — Habilitation comme agrégat distinct de l'organisation

**Statut :** Accepté · **Contexte DDD :** Habilitation

### Contexte
Une organisation porte potentiellement des centaines d'habilitations, dont le cycle de vie est bien plus rapide que le sien (mutations d'agents, fins de mandat, réorganisations). L'exigence opérationnelle la plus dure est la **révocation en moins d'une heure** (étude, point 7.3), y compris en situation de compromission.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Habilitations comme entités internes à l'agrégat `Organisation` | Chaque révocation verrouille l'organisation entière ; le chargement de l'agrégat devient coûteux ; la contention est maximale au moment où l'on a le plus besoin de rapidité |
| Habilitation comme simple table de permissions applicatives | Perd l'acte de désignation, la période, le motif de fin de droit et la traçabilité — c'est-à-dire tout ce qui fait la valeur du registre |
| **Agrégat séparé** | Retenue |

### Décision
`Habilitation` est un agrégat autonome, référençant `IdOrganisation` et `IdCompte` par identité seulement. La cohérence avec le niveau de vérification de l'organisation (INV-H8) est assurée **à la commande** par un service de domaine en lecture, et **après coup** par la politique de plafonnement déclenchée sur `OrganisationSuspendue` / `OrganisationRetrogradee`.

### Conséquences
**Positives** — révocation atomique et immédiate sans contention ; volumétrie sans effet sur l'organisation ; journal de mutations par habilitation.
**Négatives** — cohérence éventuelle entre le niveau de l'organisation et celui de ses habilitations : il existe une fenêtre, courte, où une habilitation N2 subsiste sous une organisation rétrogradée.
**Atténuation** — cette fenêtre est acceptable parce que la rétrogradation d'une organisation est rare et jamais urgente, contrairement à la révocation d'une habilitation, qui l'est toujours. Le risque a été placé du bon côté.

### Critères de réouverture
- Si l'on observe en exploitation des publications émises sous une habilitation qui aurait dû être suspendue par plafonnement, la fenêtre de cohérence éventuelle est trop large et le mécanisme doit devenir synchrone.

---

## ADR-004 — Instantané d'habilitation embarqué plutôt que jointure vivante

**Statut :** Accepté · **Contexte DDD :** Publication ↔ Habilitation

### Contexte
Question centrale : en 2035, comment vérifie-t-on qu'une publication de 2027 émanait bien d'une autorité légitime, alors que l'agent qui l'a signée est parti à la retraite en 2029, que son habilitation a été révoquée, et que le service émetteur a été fusionné dans un autre ministère ?

### Options considérées
| Option | Écartée parce que |
|---|---|
| Clé étrangère de la publication vers l'habilitation, lue à l'affichage | Une révocation invaliderait rétroactivement dix ans de publications — inacceptable, et contraire à INV-H15 |
| Conserver toutes les habilitations révoquées et faire une résolution temporelle à chaque lecture | Correct mais coûteux à chaque affichage, complexe à écrire correctement, et fragile au premier changement de modèle |
| **Instantané figé embarqué dans la version publiée** | Retenue |

### Décision
Chaque `VersionPubliee` embarque un `InstantaneDHabilitation` : copie figée, au moment de la publication, de l'habilitation applicable — identifiant, organisation, dénomination alors en vigueur, niveau, fonction du signataire, types d'actes, périmètre, période. **Aucune clé étrangère.** Aucune lecture publique ne dépend de l'état courant d'une habilitation.

### Conséquences
**Positives** — l'histoire est irrévocable ; la lecture publique est une lecture d'une seule ligne ; le contexte Habilitation peut évoluer, être migré, voire être remplacé, sans casser la vérifiabilité du passé ; la révocation redevient une opération sans conséquence rétroactive, donc utilisable sans hésitation.
**Négatives** — dénormalisation assumée ; un audit de base la signalera comme une anomalie. Elle n'en est pas une, et la remarque doit être documentée dans le schéma.
**Effet de bord utile** — l'instantané enregistre la **fonction** du signataire et un identifiant pseudonyme du publicateur, pas son nom en clair : la traçabilité est assurée sans faire de chaque publication une publication de données personnelles d'agent.

### Critères de réouverture
- Une obligation légale de rectification rétroactive de l'identité de l'émetteur (cas non identifié à ce jour) rendrait l'instantané insuffisant et imposerait un mécanisme de rectification par annotation — jamais par modification.

---

## ADR-005 — État de validité calculé, jamais persisté

**Statut :** Accepté · **Contexte DDD :** Publication

### Contexte
« Cette information est-elle encore valable ? » est la question à laquelle aucun réseau social ne peut répondre, et c'est la fonction différenciante du projet (étude, point 7.4.2). La tentation naturelle est de stocker un champ `etat` mis à jour par une tâche périodique.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Champ `etat_validite` mis à jour par un balayage nocturne | Incohérences aux frontières de fuseau et d'heure ; balayage de toute la base ; impossible de répondre à « quel était l'état le 12 mars ? » ; un incident de tâche produit un état faux affiché comme vrai |
| Champ mis à jour paresseusement à la lecture | Écriture sur un chemin de lecture — mauvais pour la mise en cache et la réplication en lecture seule |
| **Fonction pure du temps** | Retenue |

### Décision
`EtatDeValidite` est une **fonction pure** de `(fenetreValidite, statutProduction, remplacement, retrait, t)`. Elle n'est jamais persistée. Le schéma ne comporte aucune colonne correspondante — l'absence est délibérée et documentée dans le DDL.

Les projections de recherche et de feed sont rafraîchies aux **frontières temporelles connues** (`effetLe`, `echeanceLe − seuilAlerte`, `finValiditeLe`), planifiées à la publication : quelques lignes ciblées, jamais un balayage.

### Conséquences
**Positives** — la question rétrospective a une réponse exacte et gratuite ; aucune tâche de fond ; fonction entièrement couvrable par une table de cas ; aucun risque d'état affiché faux.
**Négatives** — impossible d'indexer directement sur l'état ; les requêtes de type « toutes les publications en vigueur » s'écrivent sur les dates, ce qui demande des index composés bien choisis.
**Vigilance** — c'est l'invariant que chaque optimisation de requête future rendra tentant de violer. Il doit être vérifié à chaque revue de schéma.

### Critères de réouverture
- Si une requête de liste sur l'état devient le goulot d'étranglement mesuré du feed, la réponse est une **vue matérialisée rafraîchie aux frontières connues**, pas une colonne mutable sur la table source. La décision ne se rouvre pas ; son implémentation de lecture peut évoluer.

---

## ADR-006 — Sérialisation canonique JCS et empreinte SHA-256 dès la V1

**Statut :** Accepté · **Contexte DDD :** Publication, Preuve

### Contexte
Le scellement cryptographique (niveau N3) est différé à l'horizon H2. Mais il **contraint le modèle de données** : rétro-ajouter une empreinte sur des publications déjà émises obligerait à recalculer une histoire que l'on ne peut plus reproduire à l'identique. Sans empreinte calculée au moment de la publication, la promesse de preuve est perdue pour toutes les publications antérieures.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Attendre H2 pour introduire l'empreinte | Perd définitivement la vérifiabilité de tout ce qui aura été publié avant |
| Empreinte du seul fichier PDF joint | Ne couvre ni le texte, ni la portée, ni la fenêtre de validité, ni l'émetteur |
| Sérialisation JSON « naturelle » du langage | Non déterministe : ordre des clés, format des nombres et échappement varient selon l'implémentation et la version |
| **RFC 8785 (JCS), profil versionné** | Retenue |

### Décision
Toute version publiée porte une `empreinteCanonique` = SHA-256 de sa sérialisation **RFC 8785 (JSON Canonicalization Scheme)**, calculée dans la transaction de publication, avec :
- champs inclus : identifiant, numéro de version, type d'acte, organisation, blocs (ordre significatif, texte en Unicode NFC), empreintes des pièces jointes, fenêtre de validité, portée, empreinte de l'instantané d'habilitation, date de publication ;
- champs exclus : tout champ dérivé, tout horodatage technique, toute URL de stockage, les représentations générées ;
- un **profil de sérialisation versionné** (`jcs-v1`) enregistré avec l'empreinte.

### Conséquences
**Positives** — le passage au scellement N3 devient une décision, pas un chantier ; l'intégrité est vérifiable dès la V1, même sans PKI ; le versionnement du profil permet de faire évoluer le modèle de contenu sans invalider les empreintes passées.
**Négatives** — toute évolution du modèle de contenu impose de statuer explicitement sur le profil ; discipline requise sur la normalisation Unicode.

### Critères de réouverture
- Publication d'une norme de canonicalisation plus adaptée aux documents institutionnels et adoptée régionalement.
- Compromission avérée de SHA-256 : ajouter un second algorithme en parallèle, sans jamais réécrire les empreintes existantes.

---

## ADR-007 — Journal de preuve append-only chaîné

**Statut :** Accepté · **Contexte DDD :** Preuve

### Contexte
Le scénario de risque le plus destructeur du projet est un compte institutionnel compromis publiant un faux acte (étude, point 9, R2). Ce risque n'est pas éliminable ; il est **rendu survivable** par la capacité à établir a posteriori, de façon incontestable, ce qui a été publié, quand, et sous quelle autorité. Un journal applicatif ordinaire, modifiable par quiconque a accès à la base, ne le permet pas.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Journal applicatif classique | Modifiable ; sans valeur probante |
| Blockchain publique | Coût, dépendance externe, souveraineté, latence, complexité opérationnelle — hors de proportion |
| Tiers d'horodatage qualifié dès la V1 | Aucun écosystème PKI national mobilisable immédiatement ; dépendance prématurée |
| **Journal local append-only chaîné, avec ancrage externe optionnel et différé** | Retenue |

### Décision
Un journal `EnregistrementDePreuve` strictement append-only, à séquence sans trou, chaque entrée portant l'empreinte de la précédente :

```text
empreinteEntree = SHA256( numeroSequence ‖ publication ‖ numeroVersion
                        ‖ empreinteCanonique ‖ empreinteHabilitation
                        ‖ empreintePrecedente ‖ horodateLe )
```

- `UPDATE` et `DELETE` révoqués au niveau du moteur pour le rôle applicatif — l'immuabilité est une contrainte de base de données, pas une convention de code.
- La vérification d'intégrité de bout en bout est une opération **publique et rejouable**.
- Le champ `ancrage` (publication périodique de l'empreinte de tête chez un tiers) est prévu dès la V1 et rempli plus tard.

### Conséquences
**Positives** — toute altération rétroactive devient détectable ; le dispositif fonctionne sans PKI et sans tiers ; l'ancrage externe pourra être ajouté sans migration.
**Négatives** — un journal chaîné non ancré ne protège pas contre un opérateur malveillant qui réécrirait toute la chaîne. C'est exactement ce que l'ancrage résout, et c'est pourquoi il ne doit pas rester indéfiniment différé.
**À faire** — la vérification d'intégrité doit tourner en continu, pas à la demande, et son résultat doit être public.

### Critères de réouverture
- Passage de la publication en régime opposable (ADR-014) : l'ancrage externe cesse alors d'être optionnel.
- Disponibilité d'une autorité d'horodatage nationale.

---

## ADR-008 — Niveaux d'habilitation et plafonnement par la vérification

**Statut :** Accepté · **Contexte DDD :** Habilitation

### Contexte
Le point 19.2 du document de référence laisse ouverte la question du mécanisme de certification. La réponse doit protéger le projet de deux façons : elle doit être **praticable** avec des moyens administratifs réels, et elle doit éviter que la plateforme se retrouve en position de juger de la légitimité d'une institution — position politiquement intenable et juridiquement exposée.

### Décision
Deux échelles distinctes, et un principe.

**Le principe** — *la plateforme n'accorde pas la confiance ; elle enregistre et rend vérifiable une délégation d'autorité décidée par l'organisation elle-même.* Rôle de greffe, pas de jury.

| Échelle | Valeurs | Porte sur |
|---|---|---|
| Niveau de **vérification** | `N0_REFERENCEE`, `N1_VERIFIEE` | L'organisation |
| Niveau d'**habilitation** | `N1_INFORMATIVE`, `N2_HABILITEE`, `N3_SCELLEE` | Une délégation à un publicateur |

**Règle de plafonnement** — une habilitation N2 ou N3 exige une organisation `N1_VERIFIEE`. La rétrogradation ou la suspension d'une organisation suspend automatiquement ses habilitations (INV-H3), sans jamais toucher aux publications déjà émises (INV-H15).

**Preuves exigées** — N1 : existence légale (acte de création, IFU, RCCM, arrêté, récépissé) **et** contrôle d'un canal officiel. N2 : acte nominatif de désignation signé par l'autorité, avec enregistrement de la **fonction** du signataire. N3 : certificat cryptographique de l'organisation.

**Révocation** — immédiate, sans délai de grâce, sans validation asynchrone (INV-H14).

### Conséquences
**Positives** — la plateforme ne porte aucun jugement de fond ; le niveau dépend du **type d'acte** publié, pas du prestige de l'organisation ; le dispositif fonctionne dès N1 sans PKI.
**Négatives** — charge administrative réelle de collecte et de constat des preuves, qui doit être outillée et dotée ; risque de goulot d'étranglement humain à l'entrée.

### Critères de réouverture
- Si le délai médian d'instruction d'une habilitation N2 dépasse dix jours ouvrés, le processus est trop lourd et doit être simplifié — sans abaisser l'exigence de l'acte de désignation, qui est le cœur du dispositif.
- Mise en place d'un dispositif national d'identité numérique des agents publics, qui rendrait le contrôle de canal partiellement redondant.

---

## ADR-009 — Versions publiées immuables ; correction = nouvelle version

**Statut :** Accepté · **Contexte DDD :** Publication

### Contexte
Le principe fondateur 6.4 exige qu'une information corrigée ne détruise pas la compréhension de son historique. Le point 11.2 exige qu'une nouvelle version remplace l'ancienne sans détruire l'historique.

### Décision
Une `VersionPubliee` est immuable dans tous ses champs après publication. Toute correction, même typographique, produit une **nouvelle version** portant un `motifRevision` obligatoire. `UPDATE` et `DELETE` sont révoqués au niveau du moteur pour la table des versions publiées.

La correction de coquille sans effet de sens reste une nouvelle version : la distinction « correction significative / non significative » est un jugement, et un jugement ne peut pas fonder une exception à un invariant d'intégrité.

### Conséquences
**Positives** — l'historique est reconstituable intégralement ; les empreintes restent valides ; aucune ambiguïté sur ce qui a été affiché à un moment donné.
**Négatives** — inflation du nombre de versions pour des corrections mineures ; l'interface doit présenter l'historique de façon lisible (les révisions mineures repliées par défaut) sans jamais le masquer.

### Critères de réouverture
- Aucun. C'est un invariant du domaine, pas un arbitrage technique. Sa remise en cause exigerait de rouvrir le principe fondateur 6.4.

---

## ADR-010 — Pas de 404 : toute ressource retirée renvoie un état

**Statut :** Accepté · **Contexte DDD :** Publication, Résolveur

### Contexte
La valeur cumulative de l'archive tient au stock de liens en circulation (étude, point 6.2). Un lien mort détruit cette valeur, et il la détruit doublement dans le contexte visé : un citoyen qui suit un permalien officiel et tombe sur une page d'erreur conclut soit que l'information était fausse, soit que quelqu'un l'a fait disparaître.

### Décision
Un identifiant canonique valide ne renvoie **jamais** une page d'absence. Il renvoie toujours un état exploitable :

| Situation | Réponse |
|---|---|
| Publiée et en vigueur | `200` + contenu |
| À venir | `200` + contenu + mention « prend effet le … » |
| Expirée | `200` + contenu + mention « expirée le … » |
| Remplacée | `200` + contenu + lien vers la publication remplaçante |
| Retirée | `200` + métadonnées + date, autorité et motif du retrait, **sans le contenu retiré** |
| Sous vérification | `200` + avertissement explicite |
| Identifiant jamais attribué | `404` — le seul cas |
| Identifiant syntaxiquement invalide | `400` + suggestion de correction si le contrôle le permet |

### Conséquences
**Positives** — le lien tient ; un retrait est visible et daté au lieu d'être silencieux, ce qui est plus protecteur pour l'institution que la disparition ; la vérification par SMS ou par voix peut renvoyer une réponse utile dans tous les cas.
**Négatives** — impossible de faire disparaître une publication sans laisser de trace. C'est l'effet recherché, mais il doit être expliqué aux institutions **avant** leur première publication, et non découvert au premier retrait.

### Critères de réouverture
- Une injonction judiciaire de suppression complète. Le modèle doit alors prévoir une **suppression du contenu avec conservation de la trace du retrait et de son fondement** — ce que la décision permet déjà : c'est exactement la ligne « Retirée ».

---

## ADR-011 — Vidéo référencée, non hébergée

**Statut :** Accepté, révisable · **Contexte DDD :** Publication

### Contexte
Le point 11.1 du document de référence fait de la vidéo un bloc de contenu natif. Le stockage et surtout la **diffusion** de vidéo sont le poste qui fait exploser le budget d'exploitation d'une petite infrastructure. Or c'est aussi le format le moins consommable sur des connexions burkinabè facturées à la donnée.

### Options considérées
| Option | Écartée parce que |
|---|---|
| Hébergement et transcodage internes | Coût de stockage, de transcodage et de bande passante non maîtrisé, sur un poste sans financement identifié |
| Interdiction pure de la vidéo | Prive d'un format réellement utilisé par les institutions et par le public |
| **Référencement d'une vidéo hébergée ailleurs** | Retenue |

### Décision
Un bloc de nature `VIDEO_REFERENCEE` porte une **URL et des métadonnées** (titre, durée, vignette, plateforme), jamais un binaire. La vignette, elle, est hébergée : elle est légère et garantit que la publication reste lisible même si la plateforme tierce devient inaccessible.

### Conséquences
**Positives** — coût de diffusion neutralisé ; publication utilisable en 2G ; cohérence avec le NFR de poids de page.
**Négatives** — dépendance à un canal tiers pour le contenu vidéo ; si la vidéo disparaît de la plateforme d'origine, la publication perd un élément. **Atténuation** : la vidéo ne peut jamais être le seul porteur de l'information — un bloc texte ou document reste obligatoire (contrôle bloquant à la publication).

### Critères de réouverture
- Financement identifié et pérenne du poste de diffusion vidéo.
- Besoin institutionnel avéré et mesuré d'archivage vidéo à valeur probante (audiences, séances publiques).

---

## ADR-012 — Recherche PostgreSQL avec seuil de sortie chiffré

**Statut :** Accepté, révisable · **Contexte DDD :** Recherche

### Contexte
Le point 12.1 du document de référence retient PostgreSQL « au départ », avec un moteur dédié « seulement si besoin démontré ». Le point 19.2 demande à partir de quelles métriques. Sans seuil chiffré, cette formulation produit soit une adoption prématurée d'un moteur dédié (coût d'exploitation supplémentaire), soit un enlisement sur une recherche devenue insuffisante.

### Décision
PostgreSQL avec `tsvector` (configuration française), `unaccent` et `pg_trgm` pour la tolérance aux fautes et aux noms propres. Un moteur dédié est introduit lorsque **l'un** des seuils suivants est franchi et constaté sur trente jours :

| Seuil | Valeur |
|---|---|
| Latence P95 de la recherche | > 400 ms |
| Volume du corpus indexé | > 500 000 publications |
| Besoin avéré de recherche phonétique en langues nationales | qualitatif, documenté |
| Besoin de recherche dans le contenu textuel des pièces jointes volumineuses | qualitatif, documenté |

La projection de recherche est reconstructible : le changement de moteur est une opération de reconstruction, pas une migration de données.

### Conséquences
**Positives** — une dépendance opérationnelle de moins pendant les deux premières années ; décision fondée sur une mesure, pas sur une préférence.
**Négatives** — la recherche multilingue en mooré, dioula et fulfuldé sera limitée avec PostgreSQL seul. C'est acceptable tant que le contenu principal est rédigé en français et que le multilinguisme porte sur les représentations courtes.

### Critères de réouverture
- Franchissement de l'un des seuils ci-dessus.
- Décision produit d'indexer le texte intégral des documents joints.

---

## ADR-013 — OIDC comme contrat, Keycloak différé

**Statut :** Accepté, révisable · **Contexte DDD :** Transverse

### Contexte
Le point 12.1 retient Keycloak comme socle IAM de référence. Keycloak impose une JVM, une empreinte mémoire notable et une charge d'exploitation permanente (mises à jour, sauvegardes, migrations de realm) — pour un bénéfice qui n'apparaît qu'avec la fédération d'identité réelle, c'est-à-dire pas avant H2.

### Décision
**Conserver OIDC comme contrat d'authentification** et l'isoler derrière une interface dans `shared/oidc`. **Différer Keycloak.** Démarrer avec une implémentation OIDC légère, en s'interdisant tout usage propriétaire au-delà du standard.

La séparation posée par le document de référence — identité (qui êtes-vous) distincte de l'autorisation métier (qu'avez-vous le droit de publier, portée par le contexte Habilitation) — est **confirmée et renforcée**. C'est elle qui rend le fournisseur d'identité substituable.

### Conséquences
**Positives** — charge d'exploitation réduite pendant la phase où l'équipe est la plus petite ; substitution possible sans réécriture ; l'autorisation métier ne fuit jamais dans l'IAM.
**Négatives** — la fédération avec un futur fournisseur d'identité national demandera de basculer, et la bascule aura un coût. Ce coût est borné par le respect strict du standard.

### Critères de réouverture
- Existence d'un fournisseur d'identité national ou sectoriel à fédérer.
- Besoin avéré de fonctions absentes de l'implémentation légère : SSO inter-organisations, courtage d'identité, politiques d'authentification par organisation.

---

## ADR-014 — Publication à statut informatif, conçue pour l'opposabilité

**Statut :** Accepté · **Contexte DDD :** Transverse — décision de gouvernance à effets techniques

### Contexte
Question ouverte du point 19.2 jamais posée explicitement : la publication infUb a-t-elle une valeur juridique ? Les deux réponses ont des conséquences opposées. Sans valeur, l'intérêt pour l'institution est faible. Avec valeur, il faut un texte réglementaire, une homologation, une garantie de continuité et un régime de responsabilité — c'est-à-dire une condition de démarrage que le projet ne peut pas remplir aujourd'hui.

### Décision
**Régime informatif en V1 ; exigences de l'opposabilité satisfaites dès la V1.**

La publication est une **copie fidèle référencée** d'un acte dont l'original demeure chez l'émetteur. Elle n'a pas de valeur juridique propre. Mais toutes les exigences du régime opposable sont construites dès le départ : empreinte canonique (ADR-006), journal de preuve chaîné (ADR-007), instantané d'habilitation (ADR-004), immuabilité des versions (ADR-009), absence de suppression (ADR-010), archive répliquée chez un tiers, disponibilité mesurée, export complet.

Le passage au régime opposable devient ainsi une **décision politique, pas un chantier technique**. C'est la trajectoire du Riigi Teataja estonien : huit ans de publication électronique en parallèle du papier avant que la version électronique ne devienne la version officielle.

**Régime de responsabilité, à écrire dans la convention et à afficher publiquement :**
- l'organisation émettrice est seule responsable du contenu ;
- l'opérateur est responsable de la disponibilité, de l'intégrité et de la traçabilité, jamais de l'exactitude ;
- une rectification ajoute une version et un motif, elle ne supprime pas ;
- un retrait laisse une trace publique.

### Conséquences
**Positives** — démarrage possible sans attendre un décret, condition de survie d'un projet porté par une petite équipe ; responsabilité bornée ; crédibilité technique acquise avant la demande de reconnaissance juridique.
**Négatives** — valeur perçue moindre au démarrage, qu'il faut compenser par l'utilité opérationnelle : retrouvabilité, vérification, diffusion multicanale.

### Critères de réouverture
- Signature d'une convention d'ancrage avec une institution disposant du pouvoir de publication officielle.
- Demande explicite d'une administration de faire de la publication infUb la publication de référence pour un type d'acte donné — cas dans lequel la décision se rouvre **pour ce type d'acte seulement**, et non globalement.

---

# Traçabilité

| ADR | Invariants DDD associés | Principe ou décision amont |
|---|---|---|
| 001 | INV-P1, INV-H7 | point 13.1 du doc. de référence ; principe fondateur 6.2 |
| 002 | INV-P11 | Étude point 7.7.3 |
| 003 | INV-H3, INV-H14 | Étude point 7.3 |
| 004 | INV-H15, INV-P13 | Principe fondateur 6.4 |
| 005 | INV-P7 | Étude point 7.4.2 |
| 006 | INV-P15, INV-PR2 | Étude point 7.7.3 |
| 007 | INV-H13, INV-PR1 à INV-PR4 | Étude point 9, risque R2 |
| 008 | INV-H2, INV-H8, INV-H10, INV-H12 | point 19.2 Q2 et Q3 ; étude point 7.3 |
| 009 | INV-P5, INV-P9 | Principe fondateur 6.4 ; point 11.2 |
| 010 | INV-P8, INV-P16 | Principe fondateur 6.4 ; étude point 7.4.1 |
| 011 | INV-P14 | Étude point 6.3 (AM5) |
| 012 | — | point 19.2 Q10 |
| 013 | — | point 12.1 du doc. de référence ; étude point 7.7.2 |
| 014 | INV-P8, INV-P13 | point 19.2 Q1 ; étude point 7.8.3 |
