Cartographie Stratégique DDD — Bounded Contexts et Carte de Contexte

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Série Architecture Logicielle, document 1

---

Préambule — changement de série

Onze documents ont construit les fondations conceptuelles du projet : la vision, le référentiel conceptuel, la taxonomie, la gouvernance, l'ontologie en six parties, l'ancrage institutionnel. Aucun n'a jamais nommé une technologie. Ce document rompt délibérément avec cette discipline, parce qu'il change de nature : il ne décrit plus ce qu'est le patrimoine ni comment il se gouverne, il commence à préparer la façon dont un logiciel pourra un jour le porter.

Cette rupture est assumée, pas accidentelle. Elle ouvre une seconde série, l'architecture logicielle, distincte de la série fondatrice. La distinction importe parce que les deux séries n'ont pas la même autorité : en cas de contradiction apparente, la série fondatrice prévaut toujours. Ce document ne redéfinit aucune entité, aucune relation, aucune règle déjà fixée par l'ontologie. Il les réorganise selon un critère nouveau — non plus « qu'est-ce qui existe et comment se relie-t-il », mais « qu'est-ce qui peut être développé, gouverné et fait évoluer de façon autonome, par une équipe et un langage qui lui sont propres ».

C'est l'objet du *Domain-Driven Design* stratégique : découper un domaine en *bounded contexts*, des frontières à l'intérieur desquelles un même mot a un sens unique et stable, et documenter comment ces frontières communiquent entre elles.

---

1. Méthode : comment les frontières ont été tracées

Trois critères, empruntés à la pratique du DDD stratégique et appliqués à ce qui existe déjà dans le corpus, ont guidé le découpage :

- **La cohérence du langage.** Un bounded context regroupe les entités et relations qui partagent un même vocabulaire stable. Le mot « validation » n'a pas le même poids dans la bouche d'un référent communautaire que dans celle d'un contributeur : c'est le signe que la validation mérite sa propre frontière.
- **L'autonomie de gouvernance.** La charte de gouvernance a déjà distingué qui décide quoi : les référents communautaires, les collèges de domaine, l'instance nationale, les détenteurs de savoir. Un bounded context regroupe ce qui relève d'une même autorité de décision, pour qu'une frontière logicielle reflète une frontière de pouvoir réelle plutôt que de la contredire.
- **Le rythme de changement.** Ce qui évolue à un rythme différent — le contenu patrimonial, rarement restructuré en profondeur, contre les règles d'accès, potentiellement révisées à chaque demande de retrait — gagne à être séparé, pour qu'une évolution dans l'un n'oblige jamais à retoucher l'autre.

Aucun de ces critères n'a été appliqué isolément. Les six bounded contexts qui suivent sont ceux où les trois critères convergent.

---

2. Domaine cœur et domaines support

Trois bounded contexts portent ce qui distingue ce projet de tout système documentaire générique — ils constituent le **domaine cœur** :

- Patrimoine & Connaissance
- Gouvernance & Validation
- Consentement & Droits

Trois autres portent une infrastructure nécessaire mais moins différenciante — ils constituent des **domaines support** :

- Accès
- Acteurs & Représentation
- Provenance & Contexte

Cette hiérarchie n'est pas un jugement de valeur sur leur importance opérationnelle — un système sans gestion des acteurs ne fonctionne pas davantage qu'un système sans validation. Elle indique où investir l'effort de conception le plus soigné en priorité, et où un composant plus générique, voire existant, peut suffire.

---

3. Les six bounded contexts

3.1. Patrimoine & Connaissance — domaine cœur

**Responsabilité.** Porter le contenu patrimonial lui-même : ce qui est documenté, sous quelle forme, dans quelle langue, avec quel statut épistémique.

**Entités portées.** Patrimoine, Connaissance, Version, Traduction, Tradition, Rite, Valeur, Langue, Objet.

**Langage ubiquitaire propre.** Dans ce contexte, « version » désigne toujours une déclinaison de contenu, jamais une version logicielle. « Statut » désigne toujours le statut épistémique d'une connaissance, jamais un statut de traitement technique.

**Autonomie de gouvernance.** Ce contexte n'a le pouvoir de décider ni de sa propre validité, ni de son propre niveau d'accès, ni des droits qui s'y attachent : ces trois pouvoirs appartiennent à d'autres contextes, conformément à l'orthogonalité posée par l'ontologie en sa Partie I. Ce contexte se contente de porter le contenu et d'exposer les références nécessaires à ceux qui en décident.

3.2. Gouvernance & Validation — domaine cœur

**Responsabilité.** Porter le processus par lequel une connaissance reçoit un avis de fiabilité ou de légitimité, et par lequel un désaccord à son sujet est examiné.

**Entités portées.** Avis de validation, Contestation.

**Langage ubiquitaire propre.** Un « avis » n'est jamais unique ici : le pluriel est la norme, pas l'exception, conformément à l'architecture à trois échelons de la charte de gouvernance. Une « résolution » désigne toujours l'issue d'une contestation, jamais une résolution technique d'incident.

**Autonomie de gouvernance.** Ce contexte porte exactement le pouvoir que la charte de gouvernance attribue aux trois échelons — référent communautaire, collège de domaine, instance nationale — et à eux seuls.

**Sur sa petite taille.** Deux entités seulement composent ce contexte. Ce n'est pas un signe qu'il faille le fusionner avec un autre : la richesse de ce contexte n'est pas dans le nombre de ses entités mais dans la complexité de son processus — trois échelons, arbitrage, quorum, prévalence différenciée selon la nature du désaccord — un processus qui n'a aucune raison d'être mêlé à celui, très différent, qui porte le contenu patrimonial lui-même.

3.3. Consentement & Droits — domaine cœur

**Responsabilité.** Porter le pouvoir de décider si une connaissance peut être traitée, et à qui appartiennent les droits de réutilisation qui s'y attachent.

**Entités portées.** Autorisation, Régime de propriété.

**Langage ubiquitaire propre.** « Autoriser » ne désigne jamais, dans ce contexte, un droit d'accès technique à un système : il désigne exclusivement le consentement d'un détenteur légitime au sens de la charte de gouvernance.

**Autonomie de gouvernance.** Ce contexte appartient, en dernier ressort, aux détenteurs — personnes, communautés, institutions — et non à quiconque développe ou administre le système. C'est le contexte où la discipline de conception doit être la plus stricte, parce qu'une erreur de modélisation ici se traduirait directement par une atteinte aux droits que la charte de gouvernance a mis le plus de soin à protéger.

3.4. Accès — domaine support

**Responsabilité.** Porter, à tout instant, le niveau de consultation autorisé d'une connaissance, et l'historique de ses changements.

**Entités portées.** Niveau d'accès.

**Langage ubiquitaire propre.** « Public », « restreint », « sacré » et « conservé sans diffusion » n'ont ici qu'un seul sens, celui fixé par la charte de gouvernance en sa section 4, et ne peuvent recevoir aucune autre nuance dans ce contexte.

**Autonomie de gouvernance.** Ce contexte n'a le pouvoir de décider de rien par lui-même : il enregistre des décisions prises ailleurs — par un détenteur via une autorisation, ou par l'instance nationale via son pouvoir exceptionnel. C'est un contexte de mémoire, pas de décision, ce qui explique et justifie sa taille réduite à une seule entité, exactement comme pour la Gouvernance & Validation.

**Sur sa séparation stricte.** L'orthogonalité entre validation et accès, posée dès la Partie I de l'ontologie comme le principe le plus structurant de tout le corpus, n'a de valeur réelle que si elle se traduit par une frontière que même un développement pressé ne peut pas franchir par erreur. Faire de l'Accès un contexte séparé, plutôt qu'un simple champ à l'intérieur de Patrimoine & Connaissance ou de Gouvernance & Validation, est la traduction architecturale directe de ce principe.

3.5. Acteurs & Représentation — domaine support

**Responsabilité.** Porter l'identité des personnes, communautés et institutions, et les mandats de représentation qui les relient.

**Entités portées.** Personne, Communauté, Institution.

**Langage ubiquitaire propre.** « Représenter » désigne exclusivement, dans ce contexte, un mandat reconnu selon les règles propres à une communauté, jamais une simple appartenance déclarative.

**Autonomie de gouvernance.** Conformément au principe déjà posé par la charte de gouvernance — le projet ne choisit pas, à la place d'une communauté, qui la représente —, ce contexte n'impose aucune règle de représentation uniforme. Il porte ce que chaque communauté décide pour elle-même, sans l'arbitrer.

3.6. Provenance & Contexte — domaine support

**Responsabilité.** Porter tout ce qui documente, situe et fait entrer une connaissance dans le système : ses sources, ses médias, le lieu et l'événement auxquels elle se rattache, et l'acte même de sa contribution.

**Entités portées.** Lieu, Événement, Média, Source, Contribution.

**Langage ubiquitaire propre.** « Contribution » désigne ici exclusivement l'acte administratif d'entrée dans le système, jamais le contenu lui-même, conformément à la distinction déjà posée par l'ontologie entre une source et une contribution.

**Autonomie de gouvernance.** Ce contexte est le point d'entrée du système : c'est par lui que toute nouvelle connaissance doit transiter avant de pouvoir exister ailleurs. Il ne décide de rien sur le fond, mais conditionne matériellement l'accès de toute donnée nouvelle au reste du système.

---

4. La carte de contexte

Chaque relation ci-dessous applique un patron de relation entre bounded contexts reconnu par le DDD stratégique, choisi en fonction de la répartition réelle du pouvoir de décision déjà fixée par la charte de gouvernance — jamais par commodité technique.

| Contexte amont | Contexte aval | Patron | Justification |
|---|---|---|---|
| Acteurs & Représentation | Patrimoine & Connaissance | Fournisseur / Client, via Service Hôte Ouvert | Patrimoine & Connaissance n'a besoin que d'une référence légère à une communauté ou une personne — une désignation, un identifiant — jamais de l'ensemble de ses règles de représentation. |
| Provenance & Contexte | Patrimoine & Connaissance | Fournisseur / Client | Une connaissance référence ses sources et médias sans en porter la responsabilité de gestion, qui reste entièrement du ressort de Provenance & Contexte. |
| Gouvernance & Validation | Patrimoine & Connaissance | Service Hôte Ouvert et Langage Publié | Gouvernance & Validation publie ses avis sous une forme stable et versionnée ; Patrimoine & Connaissance les consulte sans jamais avoir besoin de connaître le détail du processus qui les a produits. |
| Consentement & Droits | Patrimoine & Connaissance | Couche Anticorruption | Patrimoine & Connaissance ne doit jamais raisonner directement en termes de droits ou de consentement : il interroge Consentement & Droits à travers une interface étroite et traduite, ce qui empêche la logique éthique de se diluer dans la logique de contenu. |
| Accès | Patrimoine & Connaissance | Service Hôte Ouvert, lecture seule | Patrimoine & Connaissance peut lire le niveau d'accès courant d'une connaissance, mais ne peut jamais l'écrire directement : toute modification transite obligatoirement par Consentement & Droits ou par le canal exceptionnel décrit en 4.2. |
| Acteurs & Représentation | Gouvernance & Validation | Conformiste | Gouvernance & Validation accepte tel quel le modèle de représentation défini par chaque communauté pour vérifier la légitimité d'un référent ; il ne lui impose aucune règle de légitimité concurrente. |
| Acteurs & Représentation | Consentement & Droits | Conformiste | Même justification qu'en 3.2 ci-dessus : la légitimité d'un détenteur à consentir est entièrement définie par les règles de représentation de sa communauté, jamais par Consentement & Droits lui-même. |

4.1. Sur l'absence de noyau partagé

Aucune relation de cette carte n'a été modélisée comme un noyau partagé entre deux contextes. Ce choix est délibéré : un noyau partagé crée une dépendance de développement conjointe entre deux équipes, ce qui contredirait la logique même de la charte de gouvernance, où chaque échelon — communautaire, de domaine, national — doit pouvoir évoluer sans dépendre du calendrier d'un autre.

4.2. Le canal exceptionnel d'écriture sur l'Accès

Le pouvoir exceptionnel de restriction, posé par la charte de gouvernance en sa section 8.4 et repris par l'ontologie en sa Partie IV comme seule exception à la règle générale d'écriture sur le niveau d'accès, ne constitue pas une relation stable entre Gouvernance & Validation et Accès. C'est un canal d'écriture délibérément étroit, réservé au seul échelon national, motivé et tracé à chaque usage, qui ne doit jamais être confondu avec une intégration ordinaire entre ces deux contextes. Il devra faire l'objet, au stade de la conception tactique, d'une attention particulière pour qu'il reste aussi difficile à emprunter par erreur qu'il l'est déjà par principe.

---

5. Le cycle de vie comme processus transverse

Le cycle de vie d'une connaissance, défini par le référentiel conceptuel et enrichi par la charte de gouvernance — Identifier, Autoriser, Collecter, Qualifier, Documenter, Valider, Conserver, Publier, Enrichir, Réviser ou Contester, Archiver — ne se déroule à l'intérieur d'aucun bounded context unique. Il traverse successivement Provenance & Contexte, Consentement & Droits, Patrimoine & Connaissance, Gouvernance & Validation et Accès.

Cette traversée doit être conçue comme un processus à part entière, distinct des six bounded contexts eux-mêmes : aucun contexte ne peut, seul, faire progresser une connaissance d'une étape à l'autre. La contrainte d'antériorité déjà posée par l'ontologie — aucune collecte sans autorisation, aucune validation sans autorisation, aucune diffusion publique sans autorisation distincte — n'est donc pas seulement une règle de cohérence des données : c'est la spécification d'un ordre obligatoire entre des contextes séparés, qui devra être portée, au stade tactique, par un mécanisme d'orchestration explicite plutôt que par une confiance implicite dans l'ordre des appels.

---

6. Ce que cette cartographie ne change pas

Aucune entité, aucune relation, aucune cardinalité, aucune règle fixée par les six parties de l'ontologie n'est modifiée par ce document. Ce qui change est uniquement leur regroupement : la Partie II de l'ontologie répondait à « qu'est-ce qui existe », cette cartographie répond à « qui a la responsabilité de le faire vivre ». En cas de doute sur le sens d'une entité ou d'une relation, l'ontologie demeure la seule source de vérité ; cette cartographie ne fait qu'organiser sa mise en œuvre.

---

7. Ce que ce document ne couvre pas encore

- Aucun agrégat, aucune racine d'agrégat, aucun événement de domaine n'est encore défini : c'est l'objet du DDD tactique, prochaine étape logique à l'intérieur de chaque bounded context.
- Aucun choix de technologie de communication entre contextes — synchrone, asynchrone, par messages — n'est fait ici : cette carte reste, comme les onze documents qui précèdent, indépendante de toute technologie, conformément à la discipline que le projet s'impose depuis son premier document.
- Aucun découpage en services ou en équipes n'est imposé : les bounded contexts sont des frontières de sens et de gouvernance, pas nécessairement des unités de déploiement, une décision qui relèvera de l'architecture technologique, plus tard dans cette série.

---

8. Suite

Deux directions sont désormais ouvertes et non exclusives l'une de l'autre : approfondir chaque bounded context au niveau tactique — agrégats, entités techniques, événements de domaine, invariants — ou prendre de la hauteur avec une Vision d'architecture au sens de TOGAF, pour situer cette cartographie dans un cadre de gouvernance d'entreprise incluant les parties prenantes institutionnelles déjà identifiées par la charte d'ancrage.
