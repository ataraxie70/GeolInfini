# Constitution fondatrice du projet
## Écosystème de livraison — Burkina Faso

**Document 0 — Gouvernance & fondation stratégique**  
**Version : 1.0**  
**Date : 25 août 2026**  
**Statut : BASELINE FONDATRICE — APPROUVÉE POUR LE PASSAGE AU DDD STRATÉGIQUE**

---

## 0. Statut et portée

Ce document constitue la constitution fondatrice du projet. Il fixe les éléments stratégiques et les principes de gouvernance qui doivent rester cohérents à travers les phases de modélisation, conception, implémentation et exploitation.

Il ne constitue ni un cahier des charges, ni une spécification technique, ni une définition du MVP, ni une validation juridique, ni une preuve que les hypothèses de marché sont déjà démontrées.

Le présent document remplace, pour la fondation stratégique, les formulations antérieures comme référence active. Les documents précédents restent conservés comme traces historiques.

La baseline métier v0.3 demeure la référence opérationnelle de compréhension du domaine avant le DDD stratégique.

### Règle de statut documentaire

- **BASELINE** : élément accepté comme fondation actuelle.
- **DECISION** : choix explicitement adopté après arbitrage.
- **HYPOTHESIS** : proposition importante qui doit encore être démontrée.
- **OPEN** : question non résolue.
- **EVIDENCE** : observation, donnée ou source utilisée pour confirmer ou invalider une hypothèse.
- **SUPERSEDED** : élément remplacé mais conservé pour l'historique.

---

# 1. Identité du projet

### 1.1. Nom de travail

**Écosystème de livraison — Burkina Faso**

Le nom commercial définitif est volontairement laissé ouvert.

### 1.2. Nature

Le projet vise une **infrastructure numérique fédératrice et multi-organisationnelle du secteur de la livraison**, et non la création d'un opérateur logistique générique supplémentaire.

### 1.3. Formulation fondatrice

> **Construire une infrastructure numérique fédératrice du secteur de la livraison : un système dans lequel les personnes peuvent travailler, les organisations peuvent se créer, et les capacités de livraison peuvent circuler entre elles.**

Cette formulation est issue de la baseline stratégique et demeure la formulation stratégique de référence à l'entrée du DDD.

---

# 2. Intention fondatrice

Le projet part d'une intention simple : ne pas reproduire un modèle de société de livraison supplémentaire lorsque le secteur possède déjà des indépendants, groupes, petites structures, agences, entreprises et opérateurs.

L'objectif est de construire une couche commune permettant à des acteurs juridiquement, économiquement et organisationnellement distincts de fonctionner avec leurs propres relations tout en pouvant partager certaines capacités, missions, informations et preuves selon des règles explicites.

L'intention n'est donc pas de centraliser toute la livraison dans un opérateur unique.

L'intention est de **rendre interopérable une capacité aujourd'hui fragmentée**.

---

# 3. Problème fondateur

Le problème actuellement retenu est le suivant :

> Le Burkina Faso dispose de capacités de livraison nombreuses mais fragmentées. Certains indépendants peuvent manquer d'accès à la demande ; les petites organisations peuvent rencontrer une barrière de coût et de complexité pour construire leur propre infrastructure numérique ; des organisations peuvent manquer ponctuellement de capacité alors que d'autres acteurs sont disponibles. Il existe donc potentiellement une place pour une couche commune capable de transformer ces capacités dispersées en capacité économique organisée, traçable et interopérable.

### Niveau de preuve

Cette formulation combine des observations directes, de la recherche documentaire publique et une formalisation stratégique. Les éléments de fréquence, de taille de marché, de disposition à payer, de densité et d'effet réseau restent à mesurer.

---

# 4. Position stratégique recherchée

Le projet cherche à occuper une nouvelle couche du marché : **l'infrastructure commune permettant à plusieurs organisations de gérer leurs activités et d'échanger des capacités sans être absorbées par un opérateur central**.

La différenciation recherchée n'est donc pas :

- une meilleure interface de livraison ;
- une simple application client-livreur ;
- un opérateur de livraison possédant une flotte unique ;
- une marketplace générique fondée uniquement sur la mise en relation.

La différenciation recherchée est la construction d'une **infrastructure d'interopérabilité opérationnelle**.

---

# 5. Doctrine de décision

Le projet suit strictement la doctrine `prompt-strategique-zero-to-one.md`.

La doctrine impose :

1. partir de l'intention plutôt que du produit ;
2. tester la logique Zero-to-One selon sept questions et le secret ;
3. exiger deux principes non négociables : actif indétrônable et valeur réelle incontestable ;
4. progresser selon le pipeline : Stratégie & Gouvernance → Cadrage → DDD stratégique → Architecture tactique / hexagonale ;
5. considérer le Core Domain comme la traduction métier de l'actif stratégique ;
6. ne pas engager prématurément architecture, stack ou implémentation lorsque le modèle stratégique n'est pas stabilisé.

### Principe directeur

> **Nous ne construisons pas d'abord une application. Nous cherchons d'abord à construire une position.**

---

# 6. Application Zero-to-One à la baseline actuelle

| Question | Position actuelle | Statut |
|---|---|---|
| Ingénierie | Fédérer plusieurs organisations et leurs capacités dans une couche commune | HYPOTHESIS FORTE |
| Timing | Développement du commerce social, multiplication des petites capacités et besoins de coordination | HYPOTHESIS / À MESURER |
| Monopole / position | Possibilité de construire une infrastructure locale à forte densité avant extension | HYPOTHESIS |
| Équipe | À dimensionner en fonction du pilote et du cœur métier découvert par le DDD | OPEN |
| Distribution | Acquisition conjointe d'organisations, indépendants et demandeurs | OPEN |
| Durabilité | Dépend de la densité, des données, du coût de sortie et de la valeur opérationnelle | HYPOTHESIS |
| Secret | La valeur pourrait venir moins de la course individuelle que de la circulation structurée de capacités entre acteurs autonomes | HYPOTHESIS FORTE |

### Conclusion Zero-to-One

Le projet présente une **hypothèse de position nouvelle**, mais ne doit pas être considéré comme ayant démontré son monopole local, son secret ou son effet réseau.

---

# 7. Les deux principes non négociables

## 7.1. Actif indétrônable

### Candidat actuel

**Le réseau opérationnel fédéré.**

Il pourrait accumuler :

- identités opérationnelles ;
- organisations et affiliations ;
- capacités déclarées et observées ;
- historique des missions et événements ;
- performance et fiabilité ;
- relations entre organisations et collaborateurs ;
- historique des transferts et responsabilités ;
- connaissance des parcours et compatibilités ;
- règles et standards d'interopérabilité.

### Statut

**HYPOTHESIS — À DÉMONTRER.**

Le logiciel lui-même n'est pas considéré comme l'actif stratégique principal. Le réseau ne devient défendable que si l'usage réel produit densité, données, relations, confiance et coûts de sortie suffisamment importants.

## 7.2. Valeur réelle incontestable

La valeur devra être reconnue et mesurée chez les bénéficiaires réels.

Les axes de valeur actuellement proposés sont :

- accès plus efficace à la demande ;
- réduction de la barrière numérique pour les petites organisations ;
- meilleure utilisation d'une capacité disponible ;
- possibilité de déléguer une capacité sans perdre toute maîtrise de la mission ;
- réduction des coûts de coordination ;
- amélioration de la traçabilité et de la chaîne de garde ;
- amélioration de la cohérence des parcours.

### Statut

**HYPOTHESIS — À MESURER PAR EXPÉRIMENTATION.**

Aucune de ces valeurs n'est déclarée incontestable avant validation terrain.

---

# 8. Secret stratégique actuel

Le secret de travail est formulé ainsi :

> **La valeur potentielle du secteur n'est peut-être pas dans une entreprise qui possède le plus de livreurs, mais dans une infrastructure qui permet à des capacités détenues par des acteurs indépendants de devenir collectivement accessibles, orchestrables et interopérables sans supprimer leur autonomie.**

Ce secret est une hypothèse stratégique. Il devra être confronté au terrain, aux modèles économiques existants et au comportement réel des organisations.

---

# 9. Principes non négociables du système

Les principes suivants constituent des garde-fous de conception et de stratégie :

1. Le projet n'est pas une nouvelle flotte générique.
2. L'infrastructure doit permettre l'autonomie organisationnelle.
3. Un indépendant doit pouvoir rester indépendant.
4. L'appartenance, la collaboration, l'attribution et la responsabilité physique sont des relations distinctes.
5. Une organisation doit pouvoir gérer ses propres personnes, missions et règles.
6. Une mission peut être ouverte, adressée, réservée ou déléguée selon les règles du domaine.
7. Le titulaire d'une mission et son exécutant physique peuvent être différents.
8. La responsabilité physique ne change qu'après prise en charge réelle et confirmation.
9. Les transferts de garde doivent être traçables.
10. Les règles ne doivent pas supposer qu'un modèle unique de rémunération convient à tout le secteur.
11. La localisation ne doit pas être réduite à du GPS pur.
12. Les interfaces destinées à l'exécution en mouvement doivent minimiser la manipulation active dangereuse.
13. L'optimisation doit rechercher la compatibilité des parcours, pas seulement la proximité.
14. Le périmètre initial reste prioritairement intra-urbain.
15. Les hubs, l'interurbain, le gros volume et l'international sont des trajectoires futures.
16. Le produit initial ne doit pas être confondu avec un opérateur logistique physique.

---

# 10. Frontière du système initial

## 10.1. Inclus dans la cible initiale

- gestion de personnes et opérateurs ;
- gestion d'organisations ;
- affiliations et rôles ;
- déclaration de capacités et disponibilités ;
- création et qualification de missions ;
- missions ouvertes ou adressées ;
- attribution et acceptation ;
- délégation de capacité ;
- prise en charge physique confirmée ;
- suivi de l'exécution ;
- transfert de responsabilité ;
- preuves et traçabilité ;
- premiers mécanismes de compatibilité de parcours ;
- gestion multi-organisationnelle.

## 10.2. Hors périmètre initial

- réseau national complet ;
- transport interurbain industrialisé ;
- hubs et stockage physique ;
- flotte lourde ou gros volumes ;
- logistique internationale ;
- exploitation logistique intégrée à grande échelle ;
- définition finale de tous les mécanismes tarifaires ;
- automatisation algorithmique avancée avant validation du besoin.

---

# 11. Autonomie organisationnelle

Une organisation conserve :

- son identité ;
- ses membres ;
- ses collaborateurs ;
- ses règles internes ;
- ses relations commerciales ;
- ses règles de rémunération dans le cadre applicable.

L'infrastructure commune fournit une capacité partagée ; elle ne transforme pas automatiquement les organisations participantes en succursales d'un opérateur central.

---

# 12. Modèle conceptuel de responsabilité

Le projet doit toujours distinguer :

**Titulaire de mission ≠ Exécutant ≠ Responsable physique.**

La responsabilité physique est attachée à la garde effective du colis. Une proposition, une réservation, une attribution ou une délégation ne suffit pas à déplacer la garde.

La chaîne de preuve doit au minimum permettre de reconstruire :

- qui détenait le colis ;
- à quel moment ;
- dans quelle mission ;
- quel événement a eu lieu ;
- quel transfert a été confirmé ;
- quelles preuves étaient disponibles.

Les conséquences juridiques, contractuelles, assurantielles et contentieuses sont un chantier distinct et ne sont pas déduites automatiquement du modèle informatique.

---

# 13. Localisation et réalité terrain

Le système doit pouvoir fonctionner avec plusieurs niveaux de précision :

**quartier / secteur → lieu connu → point précis → téléphone / indications humaines → lien de localisation.**

Un point connu peut être plus utile qu'une nouvelle capture GPS. La localisation est également un signal de capacité et d'orchestration ; elle n'implique pas une exposition publique permanente de la position des acteurs.

---

# 14. Trajectoire stratégique

| Phase | Direction | Statut |
|---|---|---|
| 1 | Infrastructure logicielle multi-organisationnelle intra-urbaine | CIBLE INITIALE |
| 2 | Réseau national de capacités | TRAJECTOIRE |
| 3 | Interopérabilité interurbaine | TRAJECTOIRE |
| 4 | Points relais / hubs | LONG TERME |
| 5 | Acheminement national structuré | LONG TERME |
| 6 | Flux régionaux et internationaux | VISION LONG TERME |

### Garde-fou

Le succès numérique et la densité opérationnelle doivent précéder toute industrialisation physique importante.

---

# 15. Ce qui est explicitement non décidé

Les sujets suivants ne sont pas figés par cette constitution :

- tarification exacte ;
- taux et nature des commissions ;
- mécanismes complets de règlement ;
- règles finales de visibilité et de priorisation des missions ouvertes ;
- algorithmes de matching ;
- algorithmes de tournée ;
- modèle économique définitif ;
- contrats et responsabilités juridiques détaillés ;
- assurance ;
- architecture technique ;
- stack technologique ;
- architecture d'infrastructure ;
- forme finale du MVP ;
- Core Domain définitif ;
- Bounded Contexts définitifs.

Ces points doivent être traités dans les livrables appropriés et ne doivent pas être figés par simple déduction.

---

# 16. Principaux risques structurants

### Cold start réseau
La valeur dépend d'une densité minimale de missions et de capacités.

### Captation abusive
Un acteur pourrait tenter de monopoliser les opportunités sans capacité réelle d'exécution.

### Responsabilité
Une mauvaise qualification du colis ou des transferts peut créer des litiges.

### UX en mouvement
Une interface trop riche peut devenir dangereuse pour un livreur en conduite.

### Économie
Une commission ou un modèle de monétisation mal calibré peut détruire la valeur des deux côtés.

### Réglementation
La frontière entre logiciel, intermédiation, livraison et services postaux doit être clarifiée avant l'exploitation physique à grande échelle.

### Sur-centralisation
Une infrastructure supposée fédératrice peut échouer si elle absorbe les organisations au lieu de les outiller.

### Fonctionnalités prématurées
La construction d'un système trop large avant validation du cœur de valeur peut ralentir ou tuer l'adoption.

---

# 17. Gouvernance du projet

Toute nouvelle proposition ayant un impact sur la fondation doit être classée avant adoption :

1. **Fait / Evidence** — ce qui est observé ou sourcé ;
2. **Hypothesis** — ce qui est supposé ;
3. **Decision** — ce qui est retenu ;
4. **Open** — ce qui reste à arbitrer ;
5. **Result** — ce qui est démontré par expérience.

Aucune discussion, aucun prototype et aucun code ne doit implicitement transformer une hypothèse en décision sans trace.

---

# 18. Architecture documentaire officielle

Le projet doit conserver au minimum les livrables suivants :

### Document 0 — Constitution fondatrice
Pourquoi le projet existe, quelle position il cherche à construire et quelles règles gouvernent la suite.

### Document 1 — Baseline stratégique / étude
Faits, observations, comparaison du marché, preuves et hypothèses stratégiques.

### Document 2 — Référentiel métier
Concepts, règles métier, invariants provisoires, cas observés et matière d'entrée du DDD.

### Document 3 — DDD stratégique
Sous-domaines, Core Domain, Bounded Contexts, Context Map, invariants stratégiques et responsabilités.

### Document 4 — Architecture
Architecture logique et tactique, principes techniques et ADR.

### Document 5 — Produit / pilote
Boucle minimale de valeur démontrable, périmètre, expérimentation et critères de succès.

### Registres transverses

- registre des décisions ;
- registre des hypothèses ;
- registre des preuves ;
- registre des changements ;
- ADR ;
- historique des versions.

---

# 19. Règle de décision pour les futures évolutions

Toute modification importante doit préciser :

- le problème ou la nouvelle information ;
- le statut précédent ;
- la proposition ;
- la décision ;
- les preuves disponibles ;
- les documents impactés ;
- les conséquences ;
- les conditions éventuelles de révision.

Une décision stratégique peut être révisée, mais elle ne peut pas être réécrite rétroactivement sans conserver son historique.

---

# 20. Point de passage vers le DDD

Cette constitution autorise officiellement le passage à l'étape suivante du pipeline :

**DDD STRATÉGIQUE.**

Le DDD doit partir des invariants et événements métier, et non des écrans ou de la stack.

### Questions obligatoires du DDD

1. Quels sont les domaines et sous-domaines réels ?
2. Où se trouve le Core Domain ?
3. Quels domaines sont support ou génériques ?
4. Quelles sont les véritables frontières de responsabilité ?
5. Quels concepts appartiennent réellement à quel contexte ?
6. Quelles interactions inter-organisationnelles sont centrales ?
7. Quel modèle métier matérialise le mieux l'actif stratégique candidat ?

Le DDD pourra confirmer, déplacer ou invalider le candidat actuel du Core Domain.

---

# 21. Condition de réussite de cette baseline

Cette Constitution est considérée comme réussie si elle permet à une personne rejoignant le projet de comprendre, sans l'historique des discussions :

- pourquoi le projet existe ;
- ce qu'il cherche à construire ;
- ce qu'il refuse de construire prématurément ;
- quelles hypothèses restent ouvertes ;
- quels principes ne doivent pas être violés ;
- où commence le DDD ;
- comment une future décision doit être documentée.

---

# 22. Références de travail

1. `prompt-strategique-zero-to-one.md` — doctrine stratégique de référence.
2. `2026-08-18_Dossier_formalisation_strategique_ecosysteme_livraison_Burkina_v0.1.docx` — baseline stratégique antérieure.
3. `2026-08-24_Referentiel_metier_consolide_ecosysteme_livraison_Burkina_v0.3.docx` — référentiel métier de référence avant DDD.
4. `Presentation_cadrage_ecosysteme_livraison_Burkina_v0.1_animée.pptx` — support de présentation et synthèse de cadrage.

---

# 23. Historique

| Version | Date | Nature | Résumé |
|---|---|---|---|
| 0.x | 2026-08 | Documents antérieurs | Formalisation progressive de l'intention et du cadrage. |
| 1.0 | 2026-08-25 | BASELINE FONDATRICE | Constitution du projet, gouvernance documentaire et passage officiel au DDD stratégique. |

---

**Fin du Document 0 — Constitution fondatrice v1.0**
