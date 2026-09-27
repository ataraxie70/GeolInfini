# Audit de vision — INPC-BF
### Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso

*Analyse de la documentation fondatrice (charte, référentiel conceptuel, taxonomie, brouillons d'ontologie)*

---

## 1. Ce que j'ai compris du projet — reformulation de la vision

Avant toute critique, je restitue ce que je comprends, pour vérifier qu'on parle bien de la même chose.

**Ce que le projet EST :**
Une infrastructure de mémoire — pas une application, pas un site, pas une technologie. L'objet réel du projet est un **corpus de connaissances vivantes**, structuré pour survivre aux technologies qui le porteront successivement pendant potentiellement plusieurs siècles. L'application mobile ou le site web ne sont que des « fenêtres » temporaires sur ce corpus.

**Ce que le projet FAIT :**
Il capture le patrimoine culturel du Burkina Faso (27 langues nationales environ, ~60 groupes ethniques, royaumes, traditions orales, savoirs, croyances, arts) selon un cycle : identifier → collecter → qualifier → documenter → valider → conserver → publier → enrichir → archiver — un cycle **sans fin et sans suppression**, où les versions et variantes coexistent plutôt que de s'écraser.

**Ce qui structure le projet à ce stade :**
- Une **charte** (pourquoi, vision, missions, principes, ambition)
- Un **référentiel conceptuel** (les objets de pensée : Patrimoine, Connaissance, Tradition, Rite, Valeur, Langue, Personne, Communauté, Institution, Lieu, Événement, Média, Source — et leurs relations de premier niveau)
- Une **taxonomie** (15 domaines de classification, multi-appartenance, neutre, évolutive)
- Un **brouillon d'ontologie** annoncé mais pas encore écrit (les relations formelles, les cardinalités, les règles de cohérence — le futur « cerveau » du système)

C'est une architecture en couches bien pensée : **Charte (pourquoi) → Référentiel (quoi) → Taxonomie (comment on range) → Ontologie (comment tout se relie)**. Cet ordre est le bon. Peu de projets patrimoniaux, même institutionnels, se donnent cette discipline avant d'écrire une ligne de code.

---

## 2. Points forts réels (pas de la flatterie de façade)

- **La séparation stricte patrimoine / technologie** est le principe le plus important du document et il est bien tenu jusqu'au bout — jamais un nom de techno, de format de fichier ou d'outil ne s'y glisse. C'est rare et c'est la bonne discipline pour un projet à horizon multi-décennal.
- **La non-suppression et la coexistence des variantes** (référentiel §6, taxonomie « règles de classification ») est un choix épistémologique juste : le patrimoine oral n'a pas de version « canonique », et prétendre le contraire aurait été une erreur de modélisation.
- **La neutralité entre communautés** est énoncée comme principe et pas seulement comme intention — c'est structurellement nécessaire dans un pays à plusieurs dizaines de groupes ethniques où une plateforme perçue comme favorisant un peuple perdrait toute légitimité nationale.
- **La multi-classification** (un proverbe peut relever de Langues + Patrimoine oral + Valeurs) est la bonne réponse à la nature non-arborescente du patrimoine culturel — beaucoup de systèmes patrimoniaux échouent en forçant une hiérarchie unique.
- **L'ouverture de la taxonomie à d'autres institutions** (« la plateforme utilisera cette taxonomie, mais elle n'en sera pas propriétaire ») est une intuition stratégique forte : ça positionne le projet comme infrastructure nationale plutôt que comme produit, ce qui est cohérent avec l'ambition énoncée en charte §8.

---

## 3. Ce qui manque ou reste flou — l'audit critique

### 3.1 La gouvernance n'existe pas encore comme concept

C'est le manque le plus important, avant même l'ontologie. La charte parle de « validation », le référentiel dit qu'« une institution valide une connaissance », la taxonomie parle de « niveau de validation » — mais **aucun document ne définit qui valide, selon quels critères, avec quel pouvoir, et avec quel recours en cas de désaccord.**

Questions non tranchées :
- Qui compose l'autorité de validation ? Un conseil scientifique national ? Des référents par communauté/royaume/chefferie ? Une hiérarchie à deux niveaux (académique + coutumier) ?
- Que se passe-t-il quand deux détenteurs de savoir légitimes se contredisent sur un même rite ? Le référentiel prévoit la coexistence de variantes documentées — mais pas de désaccord sur les faits eux-mêmes (ex. deux royaumes revendiquant l'origine d'une même tradition).
- Existe-t-il un droit de contestation ou de révision porté par la communauté concernée elle-même, distinct de la validation institutionnelle ?

Sans réponse à ces questions, l'ontologie qui vient ensuite risque de définir une relation « est validé par » qui n'a pas de véritable processus derrière elle.

### 3.2 Le consentement et les savoirs restreints sont absents

C'est l'angle mort le plus sensible sur le plan éthique et le plus dangereux à laisser de côté, car il touche à la légitimité même du projet auprès des détenteurs de savoir.

- Le cycle de vie (référentiel §5) va directement de *Collecter* à *Qualifier* — il n'y a **aucune étape de consentement libre, préalable et éclairé** du détenteur du savoir avant collecte. C'est le principe FPIC (*Free, Prior and Informed Consent*) utilisé internationalement pour les savoirs traditionnels et autochtones (cadre OMPI/UNESCO). Son absence est une lacune structurelle, pas un détail.
- Toutes les traditions culturelles ne sont pas destinées à la diffusion publique. Il existe des **savoirs initiatiques, sacrés ou réservés** (certains rites de sociétés secrètes, certains chants ou objets réservés à des initiés, certaines connaissances de guérisseurs) que les détenteurs peuvent vouloir documenter pour la pérennité **sans les rendre publiquement consultables**. Le principe d'« ouverture » de la charte (« le patrimoine appartient à tous ») entre potentiellement en tension avec cette réalité et devra être nuancé — pas supprimé, nuancé.
- Il manque donc, dans le référentiel, une notion de **niveau d'accès** distincte du « niveau de validation » : public / restreint à la communauté / restreint aux initiés / archivé sans diffusion. Une connaissance peut être *conservée* sans être *transmise* à tous.
- Le droit de retrait : que se passe-t-il si un détenteur ou une communauté demande, après coup, le retrait ou la restriction d'une connaissance déjà publiée ? Le principe de non-suppression protège l'intégrité historique, mais peut heurter la volonté d'une communauté vivante. Ce sont deux légitimités qui doivent être arbitrées explicitement, pas laissées à l'implicite.

### 3.3 La propriété intellectuelle et les droits sont sous-spécifiés

- Le référentiel définit « Source » mais pas de notion de **droit** ou de **licence** attachée à une connaissance ou à un média. Un chercheur, un musée ou un ayant droit familial peut avoir des droits sur un enregistrement, une photo, un texte.
- Aucune distinction entre **propriété individuelle** (ex. photographe, chercheur) et **propriété collective/coutumière** (un chant appartenant à une communauté entière, pas à un individu) — or c'est précisément ce point que le droit occidental de la propriété intellectuelle gère mal, et où un projet burkinabè pourrait innover en modélisant une propriété culturelle collective distincte du droit d'auteur classique.
- Le rôle des **ayants droit après décès du détenteur** (héritiers, famille, communauté) n'est pas prévu, alors que la charte elle-même souligne que « des détenteurs de savoir disparaissent chaque année ».

### 3.4 Standards d'interopérabilité non mentionnés — alors que l'objectif l'exige

Le brouillon de taxonomie affirme vouloir qu'un musée, une université ou un laboratoire de recherche puisse utiliser la taxonomie indépendamment de la plateforme. C'est une ambition juste, mais rien n'indique une volonté d'alignement avec les référentiels internationaux existants, ce qui est nécessaire pour être réellement interopérable :
- **CIDOC-CRM** (norme ISO 21127) — le standard de référence pour la modélisation des institutions patrimoniales et muséales à l'échelle mondiale ; l'ontologie à venir gagnerait à s'en inspirer ou à prévoir un mapping.
- **Dublin Core** — standard de métadonnées documentaires, pertinent pour les objets de type Média/Source.
- Les **5 domaines du patrimoine culturel immatériel de l'UNESCO** (Convention de 2003) — traditions et expressions orales ; arts du spectacle ; pratiques sociales, rituels et événements festifs ; connaissances et pratiques concernant la nature et l'univers ; savoir-faire liés à l'artisanat traditionnel. La taxonomie à 15 domaines pourrait gagner à documenter explicitement son *crosswalk* avec cette classification internationale, ce qui faciliterait la reconnaissance internationale (inscriptions UNESCO, coopération avec des pays voisins évoquée en charte §8).
- **FRBR/RDA** si des œuvres orales ont plusieurs « incarnations » (une épopée racontée par plusieurs griots, dans plusieurs langues) — proche de la logique de variantes déjà pressentie dans le référentiel.

Ce n'est pas une question technologique (donc ça reste dans le périmètre conceptuel demandé) : c'est une question de **langage commun avec les institutions patrimoniales existantes**, ce qui est explicitement l'objectif affiché.

### 3.5 Le cadre juridique et institutionnel burkinabè est absent

Aucun document ne mentionne :
- Le rattachement institutionnel du projet (Ministère de la Culture ? Institut national ? Structure indépendante adossée à l'État ?) — pertinent puisque la charte parle de « référence nationale ».
- L'articulation avec une éventuelle loi ou politique nationale existante sur le patrimoine culturel au Burkina Faso, ou avec les engagements internationaux du pays (Convention UNESCO 2003 sur le PCI, Convention de 1972 sur le patrimoine mondial si des sites matériels sont concernés).
- La question de la **souveraineté des données** : où ces données vivront-elles à très long terme, sous quelle autorité juridique, avec quelle garantie qu'un changement de gouvernance technique ne mette pas en péril l'accès pérenne.

### 3.6 La pérennité concrète du projet (au-delà du principe) n'est pas traitée

La charte affirme une ambition de plusieurs décennies voire plusieurs siècles — un objectif remarquable mais qui reste à ce stade une déclaration d'intention plutôt qu'un principe opérationnalisé. Il manque une réflexion sur :
- La **continuité institutionnelle** : qui porte le projet si les personnes fondatrices se retirent ? Un principe fondateur devrait garantir la survie du projet indépendamment de ses porteurs actuels, au même titre qu'il garantit son indépendance vis-à-vis des technologies.
- La **redondance et l'archivage physique** : les grandes institutions patrimoniales (bibliothèques nationales, UNESCO Mémoire du Monde) ne comptent jamais sur un seul support numérique pour une conservation séculaire ; il faudrait au minimum énoncer un principe de redondance (copies multiples, formats ouverts, éventuellement dépôt institutionnel).
- Le **financement et la capacité humaine dans la durée** — absent des documents, ce qui est cohérent avec le stade « conception » actuel, mais à ne pas oublier avant la fin du cycle de fondations.

### 3.7 Des entités et relations manquantes dans le référentiel conceptuel

En comparant la liste d'objets fondamentaux du référentiel (§3) et celle, plus riche, esquissée dans le brouillon d'ontologie (Partie II), plusieurs entités citées dans le brouillon ne sont pas encore actées dans le référentiel officiel :
- **Objet** (comme entité distincte de Patrimoine — un masque, un instrument, un manuscrit sont des instances matérielles, pas seulement des exemples de patrimoine)
- **Version** et **Traduction** — cruciales pour un patrimoine multilingue avec 60+ langues et dialectes ; une même connaissance existe potentiellement en mooré, en dioula, en fulfuldé, en français, etc.
- **Contribution** — l'acte de soumission lui-même (qui a soumis quoi, quand, avec quel statut de traitement) semble absent comme objet à part entière, alors que c'est la porte d'entrée de tout le cycle de vie.
- **Licence/Droit** (voir 3.3)
- **Niveau d'accès** (voir 3.2)

Relations manquantes ou à préciser dans le futur volet ontologique :
- une relation de **consentement/autorisation** (Personne/Communauté → autorise → Connaissance)
- une relation de **contestation/désaccord** (Personne/Communauté → conteste → Connaissance), distincte de la validation
- une relation de **filiation/influence** entre traditions (utile pour documenter les échanges entre peuples voisins ou transfrontaliers — Mossi, Gourmantché, Peul, etc. dont les territoires culturels dépassent parfois les frontières administratives actuelles, un point que la charte §8 effleure en évoquant le dialogue avec d'autres pays africains)
- une relation de **traduction** entre deux expressions linguistiques d'une même connaissance orale

### 3.8 Le cycle de vie (référentiel §5) mériterait deux étapes supplémentaires

Le cycle actuel : *Identifier → Collecter → Qualifier → Documenter → Valider → Conserver → Publier → Enrichir → Archiver.*

Deux ajouts cohérents avec les manques identifiés ci-dessus :
- **Autoriser** (consentement), qui devrait se situer entre *Identifier* et *Collecter* — on ne collecte pas avant d'avoir l'accord du détenteur.
- **Réviser/Contester**, en parallèle d'*Enrichir*, pour porter les désaccords et corrections a posteriori sans jamais effacer l'historique (ce qui reste cohérent avec le principe de non-suppression déjà posé).

### 3.9 Accessibilité et inclusion non traitées à ce stade

Point à noter pour la suite (probablement du ressort d'un futur document plutôt que de la charte elle-même, donc ce n'est pas une critique de fond mais un rappel) : une part significative des détenteurs de savoir et des bénéficiaires visés (anciens, populations rurales) peuvent être non-alphabétisés dans les langues d'écriture courantes. La charte évoque déjà podcasts et vidéos comme formats de transmission, ce qui va dans le bon sens, mais rien n'énonce encore un principe d'**accessibilité orale/vocale par défaut**, alors que c'est cohérent avec la nature intrinsèquement orale d'une bonne partie du patrimoine documenté (Domaine 9).

### 3.10 Protection des personnes vivantes

Les détenteurs de savoir, griots et anciens documentés sont des personnes vivantes. Rien n'est dit sur :
- la protection de leur image, de leur voix, de leurs propos (au-delà du simple consentement de collecte)
- la question des mineurs éventuellement présents dans des documentations (rites de passage impliquant des enfants, par exemple)
- le droit à la vie privée par rapport à des informations généalogiques ou familiales sensibles (le référentiel prévoit « Famille » et « Généalogies » comme sous-domaines — potentiellement sensibles)

---

## 4. Tensions internes à clarifier (pas des erreurs, des arbitrages à faire)

1. **Ouverture totale vs savoirs restreints** — déjà signalé en 3.2, c'est la tension la plus structurante.
2. **Non-suppression totale vs droit de retrait d'une communauté** — la charte protège l'intégrité historique du corpus, mais une communauté vivante peut légitimement vouloir restreindre l'accès à une connaissance déjà publiée. Ces deux principes doivent coexister par la distinction *conservation ≠ diffusion publique* plutôt que par un choix binaire.
3. **Neutralité entre communautés vs légitimité de validation** — être neutre ne veut pas dire être sans autorité de validation ; il faut un mécanisme qui garantisse la neutralité *dans la composition* de l'instance de validation, pas l'absence d'instance.
4. **Autonomie de la taxonomie vis-à-vis de la plateforme (brouillon) vs absence de gouvernance externe formalisée** — l'intention d'être utilisée par d'autres institutions est juste, mais sans organe de gouvernance partagé (comité inter-institutionnel), cette indépendance restera déclarative.

---

## 5. Sur l'ordre de la suite proposée dans le brouillon

Le brouillon d'ontologie propose de passer directement à la rédaction d'un document de 80-150 pages sur le modèle ontologique complet. L'ambition est juste et l'ordre général (Vision → Référentiel → Taxonomie → Ontologie) est le bon squelette. Mais au vu de l'audit ci-dessus, je suggère d'insérer, **avant ou en parallèle de l'ontologie**, un document plus court mais fondateur : une **Charte de Gouvernance et d'Éthique de la Collecte**, qui tranche :
- le consentement (FPIC),
- les niveaux d'accès (public/restreint/sacré),
- la composition et les pouvoirs de l'instance de validation,
- les droits et la propriété culturelle collective.

Pourquoi avant l'ontologie plutôt qu'après : l'ontologie va figer les relations formelles du système (« est validé par », « est autorisé par », etc.) — si les réponses à ces questions de gouvernance ne sont pas tranchées, l'ontologie devra soit les deviner, soit rester incomplète sur ces points, et devra être retouchée en profondeur plus tard. C'est exactement le type d'erreur que le projet cherche à éviter en construisant les fondations avant la technologie — la même discipline s'applique à la gouvernance avant la formalisation ontologique.

---

## 6. En une phrase

La vision est claire, cohérente et rare dans sa discipline anti-technologique ; le maillon qui manque avant de formaliser l'ontologie n'est pas conceptuel mais éthique et institutionnel — **qui a le droit de faire quoi sur cette mémoire, et selon quelles règles de consentement** — et c'est ce maillon qui, une fois posé, rendra l'ontologie à venir réellement solide plutôt que provisoire.
