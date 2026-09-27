DDD Tactique — Accès

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Série Architecture Logicielle, document 5

---

Préambule

Ce contexte porte une seule entité, Niveau d'accès, et c'est volontaire : la cartographie stratégique l'a déjà justifié en rappelant que ce contexte ne décide de rien par lui-même, il enregistre des décisions prises ailleurs. Le risque, pour un contexte aussi étroit, est qu'un développement pressé finisse par le traiter comme un simple champ modifiable depuis n'importe où. Ce document existe pour que cela reste structurellement impossible.

---

1. L'agrégat retenu

**HistoriqueAccès** est la seule racine de ce contexte, une instance par cible référencée. Son nom porte volontairement le mot « historique » plutôt que « niveau », pour rappeler dès sa désignation que sa responsabilité première est de conserver la trace des changements, pas seulement d'exposer un état courant.

---

2. HistoriqueAccès

2.1. Racine, identité et référence de cible

Identifié par HistoriqueId, il référence sa cible par un value object propre à ce contexte, **CibleRéférencée**, sans lien de type avec les value objects de même nom déjà définis dans Gouvernance & Validation et dans Consentement & Droits, conformément à l'absence de noyau partagé déjà posée par la carte de contexte.

2.2. Value object DécisionAccès

Chaque entrée de l'historique, jamais retirée, porte :

- **Niveau** — une des quatre valeurs fixées par la charte de gouvernance en sa section 4.2 : Public, RestreintCommunautaire, RestreintInitiatique, ConservéSansDiffusion.
- **Date**.
- **Motif**, obligatoire.
- **Origine** — un value object à deux formes exclusives : DécisionDuDétenteur, référençant l'AutorisationId de Consentement & Droits qui l'a rendue légitime, ou DécisionExceptionnelle, réservée à l'échelon InstanceNationale et détaillée en section 3.

2.3. Invariants

- Un HistoriqueAccès possède, à tout instant, exactement un Niveau courant, jamais nul, correspondant à la dernière entrée ajoutée.
- Aucune entrée, une fois ajoutée, n'est retirée ou modifiée, conformément au principe de non-suppression.
- Toute nouvelle entrée porte un Motif renseigné et une Origine identifiée, conformément à la Partie II 6.6 de l'ontologie : aucun changement de niveau d'accès n'est anonyme.
- La toute première entrée d'un historique ne peut être ajoutée que par une Origine de type DécisionDuDétenteur, référençant une autorisation de portée NiveauAccèsInitial : un historique ne peut jamais s'ouvrir par une décision exceptionnelle.

2.4. Opérations exposées

- `InitialiserAccès` — crée l'agrégat avec sa première entrée, exclusivement d'Origine DécisionDuDétenteur.
- `ChangerNiveauAccès` — ajoute une entrée d'Origine DécisionDuDétenteur, appelée en réaction à un événement `AutorisationRetirée` ou à une nouvelle autorisation élargissant l'accès, provenant de Consentement & Droits.

Aucune de ces deux opérations n'est accessible à un appelant dont la légitimité n'a pas été vérifiée par ailleurs ; cette vérification est détaillée en section 4.

---

3. Le pouvoir exceptionnel, isolé du reste

3.1. Une opération à part

`AppliquerPouvoirExceptionnel` est distinguée des deux opérations ordinaires plutôt que fondue avec `ChangerNiveauAccès`, précisément pour que rien ne permette de la déclencher par inadvertance à la place de l'opération courante. Elle ajoute une entrée d'Origine DécisionExceptionnelle, réservée à l'échelon InstanceNationale, conformément à la section 8.4 de la charte de gouvernance et à l'exception 6.1 déjà posée par l'ontologie en sa Partie IV.

3.2. Caractère temporaire

Conformément à la charte de gouvernance, cette mesure est par nature temporaire et soumise à réexamen. L'entrée DécisionExceptionnelle porte donc, en plus des propriétés communes, un indicateur **MesureTemporaire** et une **DateLimiteDeRéexamen**. Aucune de ces deux informations ne change la nature de l'entrée une fois enregistrée ; elles servent uniquement à signaler qu'une seconde opération, `LeverPouvoirExceptionnel`, est attendue.

3.3. Levée du pouvoir exceptionnel

`LeverPouvoirExceptionnel` ajoute une nouvelle entrée, d'Origine DécisionDuDétenteur si le détenteur reprend la main après réexamen, ou d'une nouvelle DécisionExceptionnelle si l'instance nationale la prolonge explicitement et motive à nouveau ce choix. Aucune opération ne permet de faire disparaître l'entrée exceptionnelle elle-même : la levée s'ajoute à l'historique, elle ne l'efface pas.

3.4. Événements de domaine

- `NiveauAccèsInitialisé`
- `NiveauAccèsModifié`
- `PouvoirExceptionnelAppliqué`
- `PouvoirExceptionnelLevé`

---

4. Qui a le droit d'écrire

Ce contexte n'implémente lui-même aucune vérification de légitimité : conformément au patron déjà retenu pour les autres échelons dans les contextes précédents, il fait confiance à ce qu'Acteurs & Représentation définit comme un membre légitime de l'instance nationale avant d'accepter un appel à `AppliquerPouvoirExceptionnel`. Cette vérification a lieu en amont, dans le service applicatif qui reçoit la demande, jamais à l'intérieur de l'agrégat lui-même, qui se contente d'enregistrer une décision déjà validée en amont.

---

5. L'interface exposée en lecture

Conformément à la carte de contexte, ce contexte est un Service Hôte Ouvert strictement en lecture pour tous les autres contextes :

- `NiveauAccèsCourant(cible) → Niveau`

Aucune opération d'écriture n'est jamais exposée à un appelant extérieur à ce contexte. Patrimoine & Connaissance, en particulier, ne peut consulter que cette unique fonction ; il ne peut jamais provoquer, directement ou indirectement, un changement de niveau d'accès depuis l'intérieur de son propre agrégat.

---

6. Repository

HistoriqueAccèsRepository, seul point d'accès à la persistance de cet agrégat.

---

7. Ce que ce document ne couvre pas encore

- Le mécanisme précis de relance à l'approche d'une DateLimiteDeRéexamen — notification, tâche planifiée — relève d'une politique applicative, pas de cet agrégat.
- La vérification de légitimité d'un membre de l'instance nationale, évoquée en section 4, relève entièrement d'Acteurs & Représentation.
- Aucune technologie de notification, de planification ou de stockage n'est choisie à ce stade.

---

8. Suite

Restent Acteurs & Représentation et Provenance & Contexte. Acteurs & Représentation est désormais le passage obligé : quatre contextes sur cinq déjà traités s'appuient sur sa définition de la légitimité — personne, communauté, institution, échelon, détenteur — sans qu'aucun d'eux n'ait encore précisé comment cette légitimité elle-même est structurée.
