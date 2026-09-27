# DDD stratégique — Écosystème de livraison — Burkina Faso

**Document 3 — Modèle stratégique du domaine**  
**Version : 0.1**  
**Date : 25 août 2026**  
**Statut : WORKING BASELINE — MODÈLE DDD À VALIDER**  
**Entrées : Constitution fondatrice v1.0 + Référentiel métier consolidé v0.3 + registres de gouvernance**

## 0. Statut et portée

Ce document constitue la première formalisation DDD stratégique du projet. Il transforme la matière métier déjà consolidée en événements, responsabilités, sous-domaines, frontières de contexte et relations entre contextes.

Il ne constitue pas encore :
- une architecture technique ;
- une spécification d’API ;
- un modèle de base de données ;
- une définition du MVP ;
- un Core Domain définitivement figé ;
- une liste exhaustive d’agrégats tactiques.

Le statut `WORKING BASELINE` signifie que le modèle est suffisamment structuré pour guider la suite du travail, mais qu’il doit encore être confronté aux cas métier, aux utilisateurs et aux arbitrages économiques/juridiques.

## 1. Principes de modélisation

Le DDD est conduit à partir du métier et non des écrans ou de la stack.

Les règles suivantes gouvernent cette modélisation :

1. Les frontières sont déterminées par les responsabilités et le langage métier, pas par les modules techniques.
2. Une mission n’est pas confondue avec un colis, une organisation ou un exécutant.
3. L’affiliation n’est pas confondue avec l’exécution.
4. L’attribution n’est pas confondue avec la garde physique.
5. La délégation n’implique pas automatiquement le transfert de propriété commerciale de la mission.
6. La preuve est traitée comme un moyen de rendre les événements opérationnels vérifiables, pas comme une simple pièce jointe.
7. L’autonomie organisationnelle reste une contrainte structurante.
8. Le Core Domain doit traduire l’actif stratégique candidat : le réseau opérationnel fédéré.

## 2. Entrées métier consolidées

Le référentiel métier v0.3 fournit les concepts candidats : Personne, Compte opérateur, Organisation, Affiliation, Rôle, Capacité, Disponibilité, Mission, Colis, Émetteur, Destinataire, points de collecte/transfert, Titulaire de mission, Exécutant, Responsable physique, Prise en charge, Transfert, Preuve, État du colis, Urgence, Fenêtre temporelle, Tournée, Compatibilité de missions, Mission ouverte, Mission adressée, Délégation, Règlement, Commission, Incident, Suivi et Traçabilité.

Le même référentiel fixe notamment : compte opérateur avant exécution, mission pouvant être incomplète avant d’être prête, distinction entre mission ouverte et adressée, délégation possible, distinction titulaire/exécutant/responsable physique, garde transférée seulement après prise en charge confirmée, traçabilité des transferts, localisation hybride et préférence pour la compatibilité de parcours plutôt que la seule proximité.

## 3. Event Storming conceptuel

### 3.1 Acteurs métier principaux

- **Émetteur / demandeur** : crée ou déclenche le besoin de livraison.
- **Organisation** : porte une activité, des missions, des personnes et des règles propres.
- **Opérateur / livreur** : capacité individuelle pouvant exécuter une ou plusieurs étapes.
- **Collaborateur externe** : acteur lié opérationnellement sans devenir nécessairement membre de l’organisation.
- **Destinataire** : personne ou entité attendue à une destination.
- **Point de transfert** : lieu ou acteur qui reçoit le colis pour une étape suivante.
- **Infrastructure fédératrice** : fournit les mécanismes communs d’identité, de capacité, d’échange, d’orchestration et de preuve.

### 3.2 Événements métier majeurs — cycle de vie d’une mission

1. **Mission créée** — l’intention de transport existe.
2. **Informations critiques manquantes détectées** — la mission n’est pas encore exécutable.
3. **Mission rendue prête** — les informations nécessaires à l’étape sont suffisantes.
4. **Mission publiée / ouverte** — la demande devient adressable à des capacités éligibles.
5. **Mission adressée** — un acteur ou une organisation cible est désigné.
6. **Mission acceptée** — une capacité accepte l’exécution proposée.
7. **Exécution attribuée** — une responsabilité opérationnelle d’exécution est associée à un acteur.
8. **Délégation demandée** — le titulaire cherche une capacité externe.
9. **Délégation acceptée** — une capacité externe prend en charge l’exécution proposée.
10. **Prise en charge confirmée** — le colis est physiquement reçu et la garde commence.
11. **Anomalie de colis déclarée** — l’état apparent ou le scellage présente une réserve.
12. **Étape en cours** — le colis est en mouvement ou sous exécution active.
13. **Transfert initié** — une remise à un autre acteur ou point est engagée.
14. **Transfert confirmé** — le nouveau responsable physique confirme la réception.
15. **Remise finale confirmée** — le destinataire ou la destination finale reçoit le colis.
16. **Étape clôturée** — les événements requis sont enregistrés.
17. **Mission clôturée** — le parcours métier concerné est terminé.
18. **Incident déclaré** — une exception modifie ou bloque le parcours.

### 3.3 Événements métier — réseau de capacités

1. **Organisation créée**.
2. **Compte opérateur activé**.
3. **Affiliation créée / modifiée**.
4. **Rôle attribué**.
5. **Capacité déclarée**.
6. **Capacité rendue disponible**.
7. **Capacité retirée de disponibilité**.
8. **Capacité observée / évaluée**.
9. **Capacité éligible détectée pour une mission**.
10. **Compatibilité de parcours évaluée**.
11. **Capacité proposée pour une mission**.
12. **Capacité réservée / engagée**.

### 3.4 Événements métier — preuve et responsabilité

1. **Preuve associée à un événement**.
2. **Garde physique ouverte**.
3. **Garde physique transférée**.
4. **Garde physique clôturée**.
5. **Réserve sur colis enregistrée**.
6. **Trace de remise enregistrée**.
7. **Trace de transfert enregistrée**.

## 4. Commandes conceptuelles

Les principales commandes déduites des événements sont :

| Commande | Résultat métier attendu |
|---|---|
| CréerMission | créer une intention de livraison identifiable |
| CompléterMission | fournir les informations critiques manquantes |
| RendreMissionPrête | autoriser l’exploitation de la mission |
| OuvrirMission | exposer la mission aux capacités éligibles |
| AdresserMission | cibler une capacité ou une organisation |
| AccepterMission | confirmer la volonté d’exécuter |
| DéléguerMission | demander une capacité externe |
| ConfirmerPriseEnCharge | établir la garde physique |
| DéclarerAnomalie | enregistrer une réserve avant/au moment de la prise en charge |
| ConfirmerTransfert | déplacer la garde après remise réelle |
| ConfirmerRemise | constater la remise finale |
| DéclarerIncident | faire entrer la mission dans un parcours d’exception |
| DéclarerCapacité | rendre une capacité exploitable par le réseau |
| DéclarerDisponibilité | rendre la capacité candidate aux missions |
| ÉvaluerCompatibilité | comparer mission et trajectoire/capacité |
| ProposerMission | présenter une mission à une capacité éligible |
| GérerAffiliation | créer ou modifier une relation organisationnelle |

## 5. Hotspots révélés par l’Event Storming

### Hotspot A — Identité multiple
Une même Personne peut être indépendante, collaborateur externe, membre d’une organisation ou opérateur dans plusieurs relations. Le modèle doit éviter un lien unique et exclusif entre personne et organisation.

### Hotspot B — Mission ≠ colis
La mission exprime l’intention et l’opération à réaliser ; le colis est l’objet physique transporté. Une mission peut donc conserver une histoire organisationnelle alors que le responsable physique change.

### Hotspot C — Attribution ≠ garde
L’acceptation d’une mission ou sa délégation ne suffit pas à déplacer la responsabilité physique. Seule la prise en charge confirmée ouvre la garde de l’acteur.

### Hotspot D — Autonomie ≠ isolement
Une organisation doit pouvoir conserver ses propres règles et relations tout en entrant dans un réseau commun de capacités.

### Hotspot E — Localisation ≠ GPS
La résolution métier d’un lieu combine quartier, lieu connu, point précis, contact et indications humaines.

### Hotspot F — Ouverture et équité
Une mission ouverte suppose des règles d’éligibilité, de visibilité, de priorisation et de prévention de la captation abusive. Ces règles sont centrales mais encore non figées.

### Hotspot G — Compatibilité de parcours
L’optimisation ne cherche pas seulement le livreur le plus proche ; elle cherche une capacité compatible avec le parcours, les contraintes et la disponibilité.

### Hotspot H — Preuve et continuité de garde
La valeur du système dépend de la capacité à reconstruire l’histoire d’un colis et de ses transferts avec des preuves exploitables.

## 6. Invariants stratégiques

### I-01 — Identité opérationnelle
Un acteur qui prend part à l’exécution doit être identifiable par un compte opérateur.

### I-02 — Exécutabilité
Une mission créée n’est pas exécutable tant que ses informations critiques ne sont pas suffisantes.

### I-03 — Distinction des responsabilités
Titulaire de mission, exécutant et responsable physique peuvent être différents.

### I-04 — Garde physique
La responsabilité opérationnelle de garde ne change qu’après prise en charge physique et confirmation.

### I-05 — Continuité de transfert
Tout transfert de garde doit produire un événement vérifiable et identifiable.

### I-06 — Autonomie organisationnelle
L’intégration au réseau ne supprime pas l’identité, les membres, les règles internes ou les relations commerciales propres d’une organisation.

### I-07 — Ouverture contrôlée
Une mission ouverte ne doit être proposée qu’à des capacités éligibles selon les règles du domaine.

### I-08 — Disponibilité explicite
Une capacité ne doit pas être considérée comme disponible uniquement parce qu’elle existe dans le réseau.

### I-09 — Compatibilité de parcours
La sélection d’une capacité doit pouvoir tenir compte de son trajet et de ses contraintes, pas seulement de sa distance.

### I-10 — Localisation hybride
Une mission doit pouvoir être exécutée avec une combinaison de zone, lieu connu, précision ponctuelle et indications humaines.

### I-11 — Preuve corrélée
Une preuve doit être rattachable à l’événement ou à l’étape qu’elle est censée établir.

### I-12 — Délimitation organisationnelle
La délégation d’une mission ne modifie pas automatiquement son titulaire commercial ou organisationnel.

## 7. Cartographie des sous-domaines

### 7.1 Sous-domaine cœur — candidat

**Orchestration fédérée des capacités**

Responsabilité : transformer des capacités dispersées appartenant à des acteurs autonomes en capacité collectivement accessible, éligible, compatible, proposée, acceptée et, lorsque nécessaire, déléguée.

Ce sous-domaine est aujourd’hui le meilleur candidat pour traduire l’actif stratégique « réseau opérationnel fédéré ». Il reste toutefois une hypothèse DDD à valider.

### 7.2 Sous-domaines support

**Gestion du cycle de mission** — qualification, états, transitions, étapes et incidents.

**Exécution et garde** — prise en charge, état apparent, garde, transfert, remise et continuité physique du colis.

**Organisation et affiliations** — identité organisationnelle, membres, collaborateurs, rôles et relations d’affiliation.

**Localisation et parcours** — zones, lieux connus, points précis, indications, fenêtres temporelles et compatibilité de missions.

**Confiance et preuve** — événements vérifiables, réserves, historique, performance, fiabilité et traçabilité.

**Règlement et règles économiques** — commissions, montants, modèles internes et règlement des opérations. Statut : support mais largement ouvert.

### 7.3 Domaines génériques candidats

**Identité et authentification technique**, **notifications**, **stockage de médias**, **messagerie**, **observabilité technique**, **gestion de documents** et autres capacités transverses dont la logique métier ne constitue pas un avantage différenciant propre au domaine.

## 8. Proposition initiale de Bounded Contexts

### BC-01 — Identity & Organization
Langage : Personne, Compte, Organisation, Affiliation, Membre, Collaborateur, Rôle.

Responsabilité : savoir qui est qui, à quelle organisation il est lié et avec quelles prérogatives.

### BC-02 — Capacity & Availability
Langage : Capacité, Disponibilité, Aptitude, Zone opérationnelle, Contraintes.

Responsabilité : représenter la capacité réellement mobilisable et sa disponibilité.

### BC-03 — Mission Orchestration
Langage : Mission, État, Étape, Titulaire, Demande, Ouverture, Adresse, Acceptation, Délégation, Incident.

Responsabilité : gérer le cycle métier de la demande et sa coordination.

### BC-04 — Capacity Exchange
Langage : Opportunité, Éligibilité, Proposition, Compatibilité, Engagement, Délégation, Offre de capacité.

Responsabilité : faire circuler les opportunités et les capacités entre acteurs autonomes.

**Statut : candidat particulièrement important, potentiellement Core Domain.**

### BC-05 — Execution & Custody
Langage : Prise en charge, Garde, Transfert, Remise, État apparent, Réserve, Exécutant, Responsable physique.

Responsabilité : rendre l’exécution physique et les transitions de garde cohérentes et traçables.

### BC-06 — Location & Journey
Langage : Quartier, Lieu connu, Point précis, Indication, Fenêtre temporelle, Parcours, Compatibilité.

Responsabilité : donner au domaine une représentation spatiale exploitable localement et un moteur de compatibilité métier.

### BC-07 — Trust & Evidence
Langage : Preuve, Trace, Événement, Confirmation, Historique, Incident, Fiabilité.

Responsabilité : permettre de reconstituer et d’évaluer les événements du réseau.

### BC-08 — Settlement & Economics
Langage : Montant, Commission, Règle tarifaire, Règlement, Partage, Solde.

Responsabilité : calculer et enregistrer les conséquences économiques des opérations.

**Statut : frontière provisoire ; dépend des futurs arbitrages économiques et juridiques.**

## 9. Context Map — relations conceptuelles

| Relation | Source | Cible | Type conceptuel | Sens |
|---|---|---|---|---|
| R1 | Identity & Organization | Capacity & Availability | Customer/Supplier | les capacités dépendent de sujets identifiables et de relations d’affiliation |
| R2 | Identity & Organization | Mission Orchestration | Upstream/Downstream | le cycle de mission consomme identité et droits |
| R3 | Capacity & Availability | Capacity Exchange | Upstream/Downstream | les capacités disponibles alimentent l’échange |
| R4 | Mission Orchestration | Capacity Exchange | Partnership | demande et capacité doivent coopérer pour l’affectation/délégation |
| R5 | Capacity Exchange | Mission Orchestration | Downstream event/command | une compatibilité ou une acceptation influence l’état de mission |
| R6 | Mission Orchestration | Execution & Custody | Customer/Supplier | l’orchestration déclenche une exécution, mais ne possède pas la garde physique |
| R7 | Location & Journey | Capacity Exchange | Published Language / Supplier | la compatibilité de parcours fournit un langage commun pour l’éligibilité |
| R8 | Execution & Custody | Trust & Evidence | Customer/Supplier | l’exécution produit les faits et preuves à conserver |
| R9 | Trust & Evidence | Settlement & Economics | Supplier | les événements validés alimentent les bases de règlement |
| R10 | Capacity Exchange | Trust & Evidence | Supplier/Consumer | les interactions et résultats du réseau nourrissent la confiance et la performance |

## 10. Candidat Core Domain

### Candidat retenu pour la modélisation v0.1

> **Orchestration fédérée des capacités**

Définition de travail : la logique métier qui permet à des capacités de livraison appartenant à des personnes et organisations autonomes d’être décrites, rendues disponibles, évaluées selon leur éligibilité et leur compatibilité, proposées, acceptées, engagées et éventuellement déléguées pour répondre à une demande.

### Pourquoi ce candidat

1. Il traduit directement le secret stratégique actuel : transformer des capacités indépendantes en capacité collectivement accessible.
2. Il est lié au candidat d’actif indétrônable : le réseau opérationnel fédéré.
3. Il concentre les interactions inter-organisationnelles qui différencient le projet d’un opérateur de livraison classique.
4. Il dépend de données et de relations qui s’accumulent avec l’usage : disponibilité, compatibilité, historique, fiabilité et capacité réelle.
5. Il peut être difficile à reproduire rapidement une fois que le réseau atteint une densité significative.

### Ce que le Core Domain n’est pas

- un simple CRUD d’organisations ;
- un simple suivi GPS ;
- un carnet de missions ;
- un moteur de notifications ;
- un calculateur générique de prix ;
- un algorithme de plus court chemin isolé.

### Réserve critique

Le candidat ne devient pas automatiquement le Core Domain définitif. Il doit encore être validé par les cas d’usage terrain, la fréquence réelle des délégations, la disposition des organisations à partager des capacités, la valeur économique produite et la densité nécessaire du réseau.

## 11. Séquence métier stratégique de référence

Le modèle donne actuellement la chaîne suivante :

```text
Demande
  ↓
Qualification de mission
  ↓
Besoin de capacité
  ↓
Recherche / exposition de capacités
  ↓
Éligibilité + compatibilité de parcours
  ↓
Proposition
  ↓
Acceptation / attribution / délégation
  ↓
Prise en charge physique
  ↓
Exécution
  ↓
Transfert éventuel
  ↓
Remise
  ↓
Preuves + historique
  ↓
Confiance / performance
  ↓
Nouvelles décisions de mobilisation de capacité
```

Cette boucle est importante car elle montre que le système n’est pas seulement transactionnel. Les événements d’exécution peuvent améliorer la connaissance future du réseau.

## 12. Premier modèle de responsabilité

### Organisation
- possède son identité et ses relations ;
- gère ses membres et collaborateurs ;
- peut recevoir et porter des missions ;
- peut déléguer dans le cadre autorisé.

### Réseau / infrastructure
- rend les capacités interopérables ;
- applique les règles communes d’échange ;
- permet l’accès à des opportunités ;
- conserve les traces nécessaires à la continuité et à la confiance.

### Opérateur / livreur
- expose une capacité ;
- choisit sa disponibilité selon les règles ;
- accepte ou refuse une proposition ;
- réalise l’étape ;
- prend effectivement le colis ;
- confirme les transferts et remises.

### Émetteur / demandeur
- fournit les informations nécessaires ;
- crée ou déclenche la mission ;
- peut être différent du titulaire organisationnel.

## 13. Agrégats candidats — uniquement pour préparer le DDD tactique

Ces objets sont des candidats de réflexion, pas des décisions d’implémentation.

- **Mission** — probablement agrégat autour du cycle de demande et des transitions métier.
- **CapacityOffer / Disponibilité** — probablement agrégat autour de l’état de mobilisation d’une capacité.
- **Organization** — agrégat autour de l’identité et des règles organisationnelles.
- **CustodyChain / Épisode de garde** — candidat pour encapsuler les transitions de responsabilité.
- **RouteCompatibilityProposal** — candidat pour matérialiser une proposition de compatibilité de parcours.

Le découpage final des agrégats attend une étape tactique ultérieure et ne doit pas être déduit directement de la liste des concepts.

## 14. Ce que le DDD permet déjà de décider

### Décision DDD-P01 — séparation des responsabilités
Le modèle stratégique doit conserver distinctement titulaire de mission, exécutant et responsable physique.

### Décision DDD-P02 — la garde est un sous-système métier propre
La prise en charge et les transferts de garde ne sont pas de simples attributs de statut de mission ; ils constituent une responsabilité métier autonome et traçable.

### Décision DDD-P03 — l’échange de capacités mérite une frontière propre
L’ouverture, l’éligibilité, la compatibilité, la proposition et la délégation ne doivent pas être réduites à un écran de recherche de livreurs. Elles constituent un comportement métier spécifique qui mérite sa propre frontière de contexte.

### Décision DDD-P04 — l’autonomie organisationnelle est transversale mais non centralisée
La plateforme fournit des mécanismes communs sans devenir l’organisation de toutes les organisations participantes.

Ces décisions sont des **décisions de modélisation DDD v0.1**. Elles pourront être révisées par le registre des décisions si des cas métier contradictoires apparaissent.

## 15. Questions encore ouvertes après ce premier DDD

1. La délégation est-elle une relation de collaboration, un sous-processus de l’échange de capacité ou un contexte distinct ?
2. La confiance doit-elle être traitée comme un contexte autonome ou comme une capacité transverse alimentée par les événements ?
3. Le suivi de mission et la garde physique doivent-ils rester dans deux contextes distincts dans un MVP intra-urbain ?
4. Le modèle de capacité doit-il être centré sur l’individu, le véhicule, la combinaison personne+véhicule ou une capacité abstraite multi-ressources ?
5. Jusqu’où les organisations peuvent-elles définir leurs propres règles sans compromettre le langage commun du réseau ?
6. Quelle règle d’exposition d’une mission ouverte évite la captation et reste acceptable par les acteurs ?
7. Quelle quantité de compatibilité de parcours est une vraie valeur avant d’introduire de l’optimisation algorithmique ?
8. Quelles preuves sont obligatoires, facultatives ou contextuelles pour chaque événement ?
9. Où s’arrête le domaine de règlement et où commence un éventuel système financier externe ?
10. Quel mécanisme de confiance peut être utilisé sans transformer l’infrastructure en système de notation opaque ?

## 16. Critères de validation du modèle

Le DDD stratégique v0.1 sera considéré comme suffisamment stable pour passer au DDD tactique lorsqu’il satisfera simultanément les conditions suivantes :

- les scénarios majeurs peuvent être racontés sans ambiguïté avec le langage du domaine ;
- chaque invariant critique possède une frontière de responsabilité claire ;
- le Core Domain candidat explique la différenciation stratégique ;
- les Bounded Contexts réduisent réellement la complexité au lieu de la déplacer ;
- les interactions inter-contextes peuvent être décrites sans dépendances cycliques incontrôlées ;
- aucun écran ou objet technique n’est nécessaire pour justifier une frontière métier ;
- les cas d’exception critiques (anomalie, transfert, délégation, capacité indisponible, mission ouverte) ont un propriétaire métier clair.

## 17. Prochaine étape

Le DDD stratégique v0.1 ne doit pas encore déclencher l’implémentation.

La séquence suivante est :

1. revue contradictoire de ce modèle contre tous les scénarios métier consolidés ;
2. approfondissement des Bounded Contexts et du Context Map ;
3. arbitrage du Core Domain ;
4. formalisation du langage ubiquitaire par contexte ;
5. seulement ensuite, passage au DDD tactique et à l’architecture hexagonale.

## 18. Références

1. `prompt-strategique-zero-to-one.md` — doctrine de stratégie et pipeline.
2. `01-constitution-fondatrice-v1.0.md` — fondation stratégique.
3. `2026-08-24_Referentiel_metier_consolide_ecosysteme_livraison_Burkina_v0.3.docx` — référentiel métier d’entrée.
4. `02-registre-decisions-v1.0.md` — décisions de gouvernance existantes.
5. `03-registre-hypotheses-preuves-v1.0.md` — hypothèses et preuves transverses.

## 19. Historique

| Version | Date | Statut | Évolution |
|---|---|---|---|
| 0.1 | 25 août 2026 | WORKING BASELINE | Première structuration stratégique DDD : Event Storming conceptuel, invariants, sous-domaines, Bounded Contexts, Context Map et candidat Core Domain. |

---

**Fin du Document 3 — DDD stratégique v0.1**
