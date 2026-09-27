DDD Tactique — Gouvernance & Validation

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Série Architecture Logicielle, document 3

---

Préambule

Ce contexte porte deux entités seulement selon l'ontologie — Avis de validation et Contestation — mais c'est ici que la richesse du processus, plutôt que le nombre d'objets, justifie tout le soin de cette conception tactique. Trois échelons, une recherche de consensus, un arbitrage, une prévalence différenciée selon la nature du désaccord : ce document donne à chacune de ces règles, déjà fixées par la charte de gouvernance et par l'ontologie, une forme que du code pourra un jour porter fidèlement.

---

1. Les agrégats retenus

1.1. DossierDeValidation, et non un Avis isolé par agrégat

Le premier choix à trancher était celui-ci : chaque Avis de validation devient-il son propre agrégat, ou plusieurs avis portant sur une même cible se regroupent-ils sous une racine commune ? Le second choix est retenu, pour une raison précise. La charte de gouvernance impose une règle qui ne peut être respectée que si un seul point de cohérence supervise tous les avis concernant une même cible à la fois : rechercher le consensus entre le référent communautaire et le collège de domaine, et à défaut, marquer la cible comme en délibération plutôt que de laisser deux avis contradictoires coexister sans arbitrage visible. Cette règle porte sur la combinaison des avis, pas sur un avis pris isolément ; elle exige donc une frontière de cohérence qui les entoure tous.

**DossierDeValidation** est ainsi la racine ; **Avis de validation** en devient une entité interne, plusieurs par dossier, jamais son propre agrégat.

1.2. Contestation, agrégat séparé

Contestation reste, à l'inverse, son propre agrégat. Une contestation peut être soulevée par toute personne ou communauté légitime, à tout moment, indépendamment de l'état courant d'un dossier de validation — ce n'est pas un échelon de validation qui l'initie, mais un tiers extérieur au processus de validation lui-même. Fondre Contestation dans DossierDeValidation aurait mélangé deux déclencheurs d'écriture de nature différente sous une même racine, ce que le DDD tactique déconseille précisément pour limiter la contention.

---

2. DossierDeValidation

2.1. Racine et identité

DossierDeValidation est la racine, identifiée par DossierId, créé la première fois qu'un avis est émis sur une cible qui n'en possède pas encore.

2.2. Value object CibleValidable

Toute référence vers ce qui est validé — une Connaissance, une Version, un Objet ou un Média — passe par ce value object, qui distingue explicitement de quel contexte la cible provient : ConnaissanceRef ou VersionRef depuis Patrimoine & Connaissance, ObjetRef également depuis Patrimoine & Connaissance, MédiaRef depuis Provenance & Contexte. Un DossierDeValidation ne référence jamais l'objet complet de la cible, seulement son identité.

2.3. Entité interne : Avis de validation

Chaque Avis, identifié par AvisId, porte :

- **Échelon émetteur** — un value object à trois formes possibles : RéférentCommunautaire (associant une CommunautéRef et une PersonneRef), CollègeDeDomaine (associant une ou plusieurs PersonneRef et, le cas échéant, une InstitutionRef), ou InstanceNationale (associant les PersonneRef siégeant à ce titre). Cette distinction à trois formes traduit directement l'architecture à trois échelons déjà fixée par la charte de gouvernance.
- **Position** — une des quatre valeurs déjà fixées par l'ontologie : Validé, En délibération, Contesté, Complément demandé.
- **Motivation**, obligatoire.
- **Date**.
- **RéférenceAuxAvisArbitrés**, une liste optionnelle d'AvisId, renseignée uniquement lorsque l'échelon émetteur est l'instance nationale statuant en arbitrage, conformément à la section 6.7 de la charte de gouvernance.

2.4. Invariants

- Un Avis, une fois ajouté au dossier, n'est jamais retiré ni modifié, conformément au principe de non-suppression.
- Plusieurs Avis peuvent porter sur la même CibleValidable au sein d'un même dossier sans qu'aucun n'en efface un autre, conformément à la Partie II 6.3 de l'ontologie.
- Un Avis dont l'échelon émetteur est RéférentCommunautaire ou CollègeDeDomaine ne peut jamais renseigner de RéférenceAuxAvisArbitrés : seul un avis de l'instance nationale le peut, conformément à son rôle exclusif d'arbitrage.
- Un dossier ne peut être créé que pour une cible dont l'existence a été vérifiée par une politique de coordination externe, conformément à la contrainte d'antériorité de l'autorisation déjà posée par l'ontologie ; cette vérification n'appartient pas à cet agrégat lui-même, qui ne fait aucune hypothèse sur ce qui se passe hors de sa frontière.

2.5. L'état global, une valeur calculée et non stockée

Le dossier expose une méthode, `calculerÉtatGlobal`, qui applique la règle de prévalence différenciée posée par la charte de gouvernance en sa section 6.8 :

- si les avis du référent communautaire et du collège de domaine convergent, l'état global est Consensuel ;
- si un désaccord porte sur la légitimité ou le consentement, l'avis du référent communautaire prévaut, sauf renversement motivé par un avis ultérieur de l'instance nationale ;
- si un désaccord porte sur l'exactitude documentaire, l'avis du collège de domaine prévaut, dans les mêmes conditions ;
- en l'absence de résolution par l'un ou l'autre mécanisme, l'état global est En délibération.

Cet état global n'est jamais stocké comme une donnée propre du dossier : il est recalculé à partir de la collection d'Avis à chaque consultation, pour qu'aucune incohérence ne puisse jamais exister entre l'état affiché et les avis réellement enregistrés.

2.6. Opérations exposées

- `ÉmettreAvis` — ajoute un nouvel Avis au dossier, en créant le dossier au passage si aucun n'existait encore pour cette cible.
- `ÉmettreAvisD'Arbitrage` — réservée à l'échelon InstanceNationale, référence explicitement les Avis qu'elle arbitre.

Aucune opération ne permet de retirer ou de modifier un Avis existant.

2.7. Événements de domaine

- `DossierDeValidationOuvert`
- `AvisÉmis`
- `ArbitrageRendu`

---

3. Contestation

3.1. Racine et identité

Contestation est la racine, identifiée par ContestationId.

3.2. Propriétés

- **CibleRef** — un CibleValidable, identique au value object défini en 2.2, restreint ici aux seules cibles autorisées par l'ontologie : ConnaissanceRef ou VersionRef.
- **Nature** — DésaccordScientifique ou ContestationCommunautaire, conformément à la distinction posée par la charte de gouvernance en sa section 7.1.
- **AuteurRef** — une PersonneRef ou une CommunautéRef, conformément à la relation « soulève ».
- **État** — Ouverte ou Résolue.
- **Résolution** — optionnelle tant que l'état est Ouverte, obligatoire pour passer à Résolue, renseignant sa motivation et, le cas échéant, une référence vers l'AvisId qui l'a tranchée au sein d'un DossierDeValidation.

3.3. Entité interne : DroitDeRéponse

Conformément à la section 7.3 de la charte de gouvernance, toute personne ou communauté mise en cause dispose d'un droit de réponse. Il est modélisé comme une entité interne à la Contestation, portant un contenu, une AuteurRef et une date, jamais comme un objet séparé : le droit de réponse n'a de sens qu'attaché à la contestation qu'il répond.

3.4. Invariants

- La Nature est fixée à la création et ne change jamais : un désaccord scientifique ne devient jamais une contestation communautaire ou l'inverse. Si la nature réelle du différend s'avère différente de celle initialement déclarée, une nouvelle Contestation est créée plutôt que l'existante modifiée, conformément au principe de non-suppression.
- L'état ne peut passer d'Ouverte à Résolue que si une Résolution motivée est enregistrée dans le même geste.
- Une fois Résolue, une Contestation ne peut jamais revenir à l'état Ouverte : si le désaccord ressurgit, une nouvelle Contestation est créée, référençant l'ancienne si utile, plutôt que de rouvrir celle qui est close.

3.5. Opérations exposées

- `SouleverContestation`
- `EnregistrerDroitDeRéponse`
- `RésoudreContestation`

3.6. Événements de domaine

- `ContestationSoulevée`
- `DroitDeRéponseEnregistré`
- `ContestationRésolue`

---

4. Coordination entre les deux agrégats

DossierDeValidation et Contestation n'entretiennent aucun lien structurel direct : ni l'un ni l'autre ne référence l'autre en son sein. Leur articulation, illustrée par le scénario des deux récits divergents en Partie V de l'ontologie, où une Version d'abord enregistrée sans désaccord finit par faire l'objet d'une Contestation, relève d'un processus applicatif qui écoute les événements de l'un pour informer, le cas échéant, une décision dans l'autre — par exemple, un `ContestationRésolue` pouvant motiver l'émission d'un nouvel Avis par l'échelon compétent. Cette coordination n'appartient à aucun des deux agrégats : elle relève d'un processus transverse, de la même nature que celui déjà annoncé pour le cycle de vie par la cartographie stratégique.

---

5. Discipline de référence externe

Ni DossierDeValidation ni Contestation ne contiennent l'objet complet d'une Personne, d'une Communauté, d'une Institution ou d'une cible patrimoniale. Chacun ne porte que des références légères, conformément à la carte de contexte : Acteurs & Représentation reste seul responsable de ce qu'est une Personne ou une Communauté, Patrimoine & Connaissance et Provenance & Contexte restent seuls responsables de ce qu'est une cible.

---

6. Repositories

DossierDeValidationRepository et ContestationRepository, un par agrégat racine, conformément à la discipline déjà posée pour le contexte précédent. Aucun des deux ne permet de charger un Avis ou un DroitDeRéponse indépendamment de l'agrégat qui les porte.

---

7. Ce que ce document ne couvre pas encore

- La façon dont l'échelon RéférentCommunautaire ou CollègeDeDomaine est vérifié comme légitime au moment d'émettre un Avis relève d'Acteurs & Représentation, pas de cet agrégat.
- Le mécanisme précis par lequel un dossier passe de l'état En délibération à un état résolu dans le temps — relance, délai, escalade automatique — n'est pas fixé ici et relèvera d'une politique applicative distincte.
- Aucune technologie de messagerie entre agrégats ou entre contextes n'est choisie à ce stade.

---

8. Suite

Consentement & Droits est le prochain candidat naturel : c'est le seul contexte du domaine cœur restant, et celui dont dépend, en amont, la contrainte d'antériorité déjà mentionnée en 2.4 — aucun dossier de validation n'a de sens tant qu'une autorisation de collecte n'a pas été accordée pour la cible qu'il concerne.
