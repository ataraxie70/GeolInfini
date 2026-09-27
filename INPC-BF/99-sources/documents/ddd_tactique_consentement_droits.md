DDD Tactique — Consentement & Droits

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Série Architecture Logicielle, document 4

---

Préambule

Ce contexte referme le domaine cœur. C'est aussi le plus délicat des trois à concevoir : une erreur de modélisation ici se traduirait directement par une atteinte aux droits que la charte de gouvernance a mis le plus de soin à protéger, comme ce document l'a déjà annoncé dans la cartographie stratégique. Deux entités le composent selon l'ontologie — Autorisation et Régime de propriété — que la charte de gouvernance a pris soin de distinguer l'une de l'autre dès sa section 6.4 : l'une porte le droit de traiter une connaissance, l'autre porte les conditions de sa réutilisation. Cette distinction gouverne tout ce qui suit.

---

1. Les agrégats retenus

1.1. DossierDeConsentement, sur le même principe que le contexte précédent

Comme pour Gouvernance & Validation, plusieurs Autorisations peuvent porter sur une même cible — une par portée : collecte, conservation, niveau d'accès initial, usages, conformément à la section 3.3 de la charte de gouvernance. Cette pluralité appelle la même discipline : une racine commune, **DossierDeConsentement**, garantit qu'aucune contradiction ne peut s'installer entre les autorisations d'une même cible, notamment qu'au plus une autorisation par portée reste active à la fois. Autorisation en devient une entité interne, sur le modèle déjà établi pour Avis de validation dans le contexte précédent. Cet écho structurel entre les deux contextes n'est pas fortuit : les deux répondent au même besoin, celui de coordonner plusieurs décisions indépendantes portant sur une même cible sans qu'aucune ne puisse silencieusement en contredire une autre.

1.2. RégimeDePropriété, agrégat séparé

RégimeDePropriété reste un agrégat à part, distinct de DossierDeConsentement, pour la même raison que celle déjà posée par l'ontologie : le droit de traiter une connaissance et les conditions de sa réutilisation ultérieure répondent à des questions différentes, décidées à des moments différents, parfois par des personnes différentes — un régime de propriété individuelle peut, par exemple, être défini par un chercheur auteur d'une analyse, quand l'autorisation de collecte de la connaissance qu'il analyse a été donnée par un tout autre détenteur.

---

2. DossierDeConsentement

2.1. Racine, identité et référence de cible

DossierDeConsentement est la racine, identifiée par DossierId. Il référence sa cible à travers un value object propre à ce contexte, **CibleRéférencée**, structurellement proche du CibleValidable défini dans Gouvernance & Validation mais délibérément non partagé avec lui : la carte de contexte a exclu tout noyau partagé entre bounded contexts, précisément pour qu'aucun des deux ne dépende du calendrier de développement de l'autre. Les deux value objects se ressemblent parce qu'ils répondent au même besoin ; ils restent deux types distincts.

2.2. Entité interne : Autorisation

Chaque Autorisation, identifiée par AutorisationId, porte :

- **DétenteurRef** — une PersonneRef, CommunautéRef ou InstitutionRef, conformément à la relation « émane de ».
- **Portée** — une des quatre valeurs fixées par la charte de gouvernance en sa section 3.3 : Collecte, Conservation, NiveauAccèsInitial, Usages.
- **État** — Active ou Retirée.
- **Date**, et le cas échéant **MotifDeRetrait**.
- **OrigineParticulière** — une valeur optionnelle parmi celles prévues par les exceptions de la Partie IV de l'ontologie : SansDétenteurIndividuel, ProtectionMineurRenforcée, ou SourceTierceIncomplète.

2.3. Invariants

- Au plus une Autorisation à l'état Active existe, à tout instant, pour une même Portée au sein d'un même dossier.
- Une Autorisation retirée n'est jamais supprimée : elle passe à l'état Retirée, avec motif et date, conformément au principe de non-suppression.
- Une Autorisation de Portée NiveauAccèsInitial ou Usages ne peut être ajoutée à un dossier qui ne contient aucune Autorisation active de Portée Collecte, sauf si son OrigineParticulière est SourceTierceIncomplète, conformément à l'exception posée par l'ontologie en sa Partie IV, section 6.4.
- Une Autorisation dont le DétenteurRef est une CommunautéRef sans PersonneRef individuelle associée n'est valide que si son OrigineParticulière est renseignée à SansDétenteurIndividuel, conformément à l'exception 6.2.

2.4. Opérations exposées

- `AccorderAutorisation` — crée le dossier au passage si nécessaire, refuse toute portée déjà active pour éviter la coexistence de deux autorisations actives contradictoires.
- `RetirerAutorisation` — fait passer une Autorisation active à l'état Retirée, avec motif obligatoire. Aucune opération ne permet de réactiver directement une Autorisation retirée : une nouvelle Autorisation doit être accordée si le consentement est de nouveau donné.

2.5. Événements de domaine

- `DossierDeConsentementOuvert`
- `AutorisationAccordée`
- `AutorisationRetirée`

L'événement `AutorisationRetirée`, lorsqu'il concerne une Portée NiveauAccèsInitial ou Usages, est celui qui doit informer le contexte Accès qu'un changement de niveau d'accès est désormais légitime, conformément au droit de retrait posé par la charte de gouvernance en sa section 5. Ce lien reste un lien d'événement, jamais une référence structurelle directe entre les deux agrégats.

---

3. RégimeDePropriété

3.1. Racine et identité

RégimeDePropriété est la racine, identifiée par RégimePropriétéId, référençant sa cible par le même type CibleRéférencée que celui défini en 2.1.

3.2. Propriétés

- **Nature** — Individuelle ou Collective, conformément à la section 9.1 de la charte de gouvernance.
- **TitulaireCourant** — une DétenteurRef, personne ou communauté.
- **ConditionsRéutilisation** — un value object précisant les usages autorisés, conformément à la section 9.2 de la charte de gouvernance, incluant une indication explicite d'interdiction d'usage commercial sans accord lorsque la Nature est Collective, conformément à la section 9.3.
- **HistoriqueDeTitularité** — une liste, jamais purgée, des titulaires successifs, chacun avec sa période et le motif du changement.

3.3. Invariants

- Une seule CibleRéférencée ne peut être associée qu'à un seul RégimeDePropriété actif à la fois, conformément à la cardinalité fixée par l'ontologie.
- Tout changement de TitulaireCourant ajoute une entrée à HistoriqueDeTitularité ; il ne la remplace ni ne l'efface.
- Un régime dont la Nature est Collective ne peut jamais voir son TitulaireCourant transféré vers une PersonneRef individuelle sans motif de succession explicite au sein de la communauté titulaire, conformément à la section 9.4 de la charte de gouvernance : la propriété collective ne se privatise pas silencieusement par un simple changement de référence.

3.4. Opérations exposées

- `EnregistrerRégimeDePropriété`
- `TransférerTitularité` — pour la succession, avec motif obligatoire.

3.5. Événements de domaine

- `RégimeDePropriétéEnregistré`
- `TitularitéTransférée`

---

4. L'interface étroite exposée à Patrimoine & Connaissance

La carte de contexte a déjà fixé que Patrimoine & Connaissance ne peut interroger ce contexte qu'à travers une Couche Anticorruption, jamais en accédant directement à un DossierDeConsentement ou à un RégimeDePropriété. Ce contexte expose donc un service applicatif étroit, distinct de ses agrégats, qui traduit leur état interne en réponses simples :

- `CollecteEstAutorisée(cible) → booléen`
- `DiffusionPubliqueEstAutorisée(cible) → booléen`
- `TitulaireDeLaCible(cible) → DétenteurRef`

Aucune autre information — les motifs de retrait, l'historique complet, les origines particulières — ne franchit cette interface. Ce choix protège Patrimoine & Connaissance d'avoir jamais à raisonner sur la richesse de la logique de consentement ; il n'a besoin que de réponses, jamais du détail qui les produit.

---

5. Coordination avec les autres contextes

**Avec Acteurs & Représentation.** Conformément au patron Conformiste déjà posé par la carte de contexte, ce contexte accepte tel quel ce qu'Acteurs & Représentation définit comme détenteur légitime, sans lui imposer de règle concurrente de légitimité.

**Avec Accès.** Ce contexte ne modifie jamais directement un niveau d'accès. Il informe, par ses événements, qu'un changement est devenu légitime ; c'est au contexte Accès qu'il revient de l'enregistrer, conformément à la discipline déjà posée dans la cartographie stratégique.

**Avec Gouvernance & Validation.** La contrainte d'antériorité déjà annoncée à la fin du document précédent trouve ici sa source : aucun DossierDeValidation ne devrait être ouvert pour une cible dépourvue d'Autorisation active de Portée Collecte. Cette vérification traverse les deux contextes et relève, comme les autres dépendances de cette nature, d'un processus applicatif plutôt que d'une référence structurelle entre agrégats.

---

6. Repositories

DossierDeConsentementRepository et RégimeDePropriétéRepository, un par agrégat racine. Aucun des deux ne permet de charger une Autorisation indépendamment de son dossier.

---

7. Ce que ce document ne couvre pas encore

- La façon exacte dont le processus applicatif vérifie l'antériorité entre Consentement & Droits et Gouvernance & Validation, évoquée en section 5, sera précisée avec le processus transverse du cycle de vie, pas contexte par contexte.
- L'examen renforcé requis pour les cibles dont l'OrigineParticulière est ProtectionMineurRenforcée avant tout passage à un niveau d'accès public, déjà annoncé par l'ontologie en sa Partie IV, section 4, implique une coordination avec Gouvernance & Validation qui n'est pas détaillée ici.
- Aucune technologie de service applicatif, de messagerie ou de stockage n'est choisie à ce stade.

---

8. Suite

Le domaine cœur est maintenant couvert dans son intégralité au niveau tactique. Restent les trois contextes support : Accès, Acteurs & Représentation, Provenance & Contexte. Accès est le plus naturel à traiter en premier, en raison de sa taille réduite et des deux événements — `AutorisationRetirée` et le pouvoir exceptionnel de l'instance nationale — qui viennent d'être nommés sans encore être reçus de son côté.
