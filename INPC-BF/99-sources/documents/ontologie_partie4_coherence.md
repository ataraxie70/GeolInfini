Ontologie du Patrimoine Culturel Vivant du Burkina Faso

Partie IV — Les règles de cohérence

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Document fondateur, huitième pièce de la série

---

Préambule de cette partie

La Partie II a fixé vingt-deux entités. La Partie III a fixé vingt-huit relations entre elles. Aucune des deux n'a précisé combien de fois une relation peut se répéter, ce qui est obligatoire, ce qui est interdit, ni comment une entité spécialisée hérite de ce qui a été défini pour une entité plus générale. Cette Partie IV referme ces questions, une à une, sans en laisser aucune à l'appréciation d'un futur développement technique.

---

1. Ce qui est autorisé

Ces principes ont déjà été posés, sous une forme ou une autre, dans les parties précédentes ou dans la charte de gouvernance. Cette section les rassemble comme des autorisations explicites, pour qu'aucune interprétation restrictive ne vienne, par excès de prudence, les remettre en cause au moment de leur mise en œuvre.

- Plusieurs versions concurrentes d'une même connaissance peuvent coexister indéfiniment, sans qu'aucune ne soit désignée comme principale par l'ontologie elle-même.
- Plusieurs avis de validation, émis par des échelons différents, peuvent concerner une même connaissance et diverger entre eux sans que l'un n'efface les autres.
- Un patrimoine peut appartenir simultanément à plusieurs communautés.
- Une connaissance peut être pleinement validée sans être publique, et publique sans être pleinement validée, conformément à l'orthogonalité posée en Partie I 3.4.
- Le niveau d'accès d'une connaissance peut être restreint après une diffusion publique, à la demande de son détenteur légitime, sans que cela constitue une suppression.
- Une connaissance peut être rattachée à plusieurs domaines de la taxonomie, conformément au principe de multi-classification déjà établi.
- Une tradition peut être pratiquée par des communautés autres que celle à laquelle elle appartient, conformément à la distinction posée en Partie III 4.
- Une contestation peut demeurer non résolue pendant une durée indéterminée, la connaissance qu'elle vise restant conservée et consultable selon son niveau d'accès en vigueur.

---

2. Ce qui est interdit

- Aucune entité et aucune relation, une fois établie, n'est supprimée du système. Ce qui doit cesser d'être actif est marqué comme tel ; rien n'est effacé.
- Le contenu d'une connaissance déjà établie n'est jamais modifié directement. Toute évolution de son contenu prend la forme d'une nouvelle version, reliée à la connaissance d'origine, conformément à la Partie III 3.
- Aucune connaissance n'existe sans au moins une source qui la justifie, conformément à la Partie II 2.2 et à la fidélité aux sources posée par la charte fondatrice.
- Aucune connaissance n'existe sans un statut épistémique explicite, conformément au principe posé en Partie I 3.5.
- Aucune contribution ne franchit l'étape « Collecter » du cycle de vie sans qu'une autorisation active, de portée « collecte », n'ait été enregistrée au préalable, conformément à la section 3 de la charte de gouvernance.
- Aucun changement de niveau d'accès ne survient sans être attribué à une personne ou à une instance identifiée et sans être motivé, conformément à la Partie II 6.6, hormis le cas d'exception traité en section 6 ci-dessous.
- Aucune relation non nommée par la Partie III n'est utilisée à titre de relation générique, conformément à l'exclusion déjà posée en Partie III 9.
- Aucun avis de validation ne peut être émis sur une connaissance dépourvue d'autorisation active de portée « collecte », conformément à la distinction déjà posée en Partie II 6.2.
- Aucune communauté n'est privée, par une décision technique, de la relation « appartient à » qui la relie légitimement à un patrimoine, y compris lorsque ce patrimoine est partagé avec d'autres communautés.

---

3. Les cardinalités

Le tableau suivant précise, pour chacune des vingt-huit relations établies par la Partie III, le nombre d'occurrences permises dans chaque sens. La notation *0..1* signifie « au plus une » ; *1* signifie « exactement une, obligatoire » ; *0..n* signifie « aucune, une ou plusieurs » ; *1..n* signifie « au moins une, sans limite supérieure ».

| Relation | Depuis l'origine | Depuis l'arrivée |
|---|---|---|
| décrit | 1..n patrimoines par connaissance | 0..n connaissances par patrimoine |
| documente | 1..n connaissances par média | 0..n médias par connaissance |
| justifie | 1..n connaissances par source | 1..n sources par connaissance (au moins une, obligatoire) |
| incarne | 1 patrimoine par objet | 0..n objets par patrimoine |
| est détenu par | 0..1 détenteur actuel par objet | 0..n objets par détenteur |
| est apportée par | 1 contribution par connaissance, version, objet ou média | 1..n entités apportées par une même contribution |
| est une version de | 1 connaissance par version | 0..n versions par connaissance |
| est une traduction de | 1 connaissance par traduction | 0..n traductions par connaissance |
| est une variante de | 1..n traditions ou rites apparentés | relation symétrique par construction |
| dérive de | 0..1 origine directe par patrimoine ou tradition | 0..n dérivés par patrimoine ou tradition d'origine |
| appartient à | 1..n communautés par tradition, rite ou valeur ; exactement 1 communauté ou institution dépositaire par objet | 0..n patrimoines par communauté |
| est pratiqué par | 0..n communautés par tradition ou rite | 0..n traditions ou rites par communauté |
| est parlée par | 1..n communautés par langue | 0..n langues par communauté |
| représente | 1..n communautés ou institutions par personne | 1..n personnes par communauté ou institution, conformément à la section 6.2 de la charte de gouvernance |
| transmet | 1..n connaissances par personne | 0..n personnes par connaissance |
| est transmise par | 1..n traditions par valeur | 0..n valeurs par tradition |
| se situe à | 0..n lieux par rite, tradition ou objet | 0..n rites, traditions ou objets par lieu |
| se déroule à | 1 lieu par événement | 0..n événements par lieu |
| met en œuvre | 1..n traditions ou rites par événement | 0..n événements par tradition ou rite |
| est contemporain de | 0..n relations symétriques | identique |
| émane de | 1 détenteur par autorisation | 0..n autorisations par détenteur |
| porte sur | 1 entité ciblée par autorisation | 0..n autorisations par entité ciblée, une par portée distincte au sens de la charte de gouvernance |
| émet | 1 échelon émetteur par avis de validation | 0..n avis émis par un même échelon |
| concerne | 1 entité ciblée par avis de validation | 0..n avis de validation par entité ciblée |
| soulève | 1 auteur par contestation | 0..n contestations soulevées par une même personne ou communauté |
| vise | 1..n connaissances ou versions par contestation | 0..n contestations par connaissance ou version |
| est soumis à | 1 régime de propriété par connaissance, version, objet ou média | 0..n entités soumises à un même régime de propriété |
| a pour niveau d'accès | 1 niveau d'accès courant par entité, à tout instant | 0..n entités partageant un même niveau d'accès à un instant donné |

**Note sur « appartient à » et l'objet.** La cardinalité de cette relation diffère selon l'entité d'origine. Une tradition, un rite ou une valeur peuvent appartenir à plusieurs communautés à la fois, conformément au cas des patrimoines partagés ou transfrontaliers. Un objet, en tant qu'instance matérielle unique, ne peut en revanche relever que d'un seul dépositaire à la fois : le patrimoine qu'il incarne peut appartenir à plusieurs communautés, mais l'objet physique lui-même a toujours un dépositaire déterminé, conformément à sa propriété essentielle de localisation posée en Partie II 2.9.

**Note sur « a pour niveau d'accès » et l'historique.** La cardinalité « 1 niveau d'accès courant, à tout instant » ne contredit pas le principe de non-suppression : elle porte sur l'état courant. L'historique des niveaux d'accès successifs, lui, est cumulatif et sans limite, conformément à la Partie II 6.6.

---

4. Les contraintes

Au-delà des cardinalités, certaines dépendances d'ordre doivent être respectées entre les relations elles-mêmes.

**Contrainte d'antériorité de l'autorisation.** Une autorisation de portée « collecte » doit exister et être active avant qu'une contribution puisse faire progresser une connaissance au-delà de l'étape « Identifier » du cycle de vie. Un avis de validation ne peut être émis en l'absence de cette autorisation.

**Contrainte de portée distincte pour la diffusion publique.** Le niveau d'accès « Public » ne peut être atteint par une connaissance que si une autorisation dont la portée inclut la diffusion existe et demeure active, distincte de la seule autorisation de collecte, conformément à la section 3.3 de la charte de gouvernance.

**Contrainte de source minimale.** Toute connaissance doit être reliée par la relation « justifie » à au moins une source avant de pouvoir recevoir un premier avis de validation.

**Contrainte de statut épistémique préalable.** Aucune connaissance, version ou traduction ne peut recevoir d'avis de validation tant que son statut épistémique n'a pas été renseigné.

**Contrainte de cohérence entre versions et validation.** Un avis de validation concerne toujours une version précise d'une connaissance, jamais la connaissance dans l'abstrait lorsque plusieurs versions coexistent. Si une seule version existe, elle est traitée comme la connaissance elle-même pour l'application de cette règle.

**Contrainte de protection renforcée.** Toute connaissance, version, objet ou média impliquant un mineur, conformément à la section 8.2 de la charte de gouvernance, requiert un avis de validation émis par l'échelon national avant tout changement de son niveau d'accès vers « Public » ou « Restreint communautaire ».

---

5. Les héritages

Certaines entités définies en Partie II sont des spécialisations d'entités plus générales. Une spécialisation hérite de toutes les relations et de toutes les contraintes qui s'appliquent à l'entité générale dont elle dérive, sauf lorsque cette partie prévoit explicitement une exception.

**Le rite hérite de la tradition.** Conformément à sa définition en Partie II 2.6, un rite est un type particulier de tradition. Il hérite donc des relations « appartient à », « est pratiqué par », « est transmise par » (en tant que cible depuis une valeur), « se situe à », « est une variante de » et « dérive de », telles que définies pour la tradition, sans qu'il soit nécessaire de les redéfinir.

**La langue hérite du patrimoine.** Conformément à sa définition en Partie II 2.8, la langue est elle-même un patrimoine. Elle hérite donc des relations « décrit » (en tant que cible depuis une connaissance), « dérive de » et « incarne » (en tant que cible depuis un objet, pour un manuscrit ou un enregistrement qui incarnerait une langue elle-même plutôt qu'une connaissance à son sujet).

**La valeur hérite du patrimoine.** Une valeur, conformément à sa définition en Partie II 2.7, est elle-même un patrimoine au sens le plus général, bien que sa relation principale — « est transmise par » — lui soit propre et ne soit pas partagée par les autres formes de patrimoine.

**Ce qui n'hérite pas.** La connaissance, la version et la traduction ne sont pas des spécialisations du patrimoine : elles forment une famille distincte, qui décrit le patrimoine sans en être une forme. Aucune règle définie pour le patrimoine ne s'applique automatiquement à elles ; réciproquement, aucune règle définie pour la connaissance ne s'applique automatiquement au patrimoine qu'elle décrit. L'objet n'hérite pas davantage du patrimoine : il l'incarne par une relation explicite, conformément à la distinction déjà posée en Partie II 2.9, précisément pour qu'un objet matériel donné, souvent détenu par un seul dépositaire, n'hérite pas mécaniquement de la règle de propriété plurielle qui s'applique au patrimoine immatériel qu'il incarne.

---

6. Les exceptions

Quatre situations, déjà annoncées dans les parties précédentes sans y être tranchées, appellent une règle d'exception explicite.

**6.1. Le pouvoir exceptionnel de restriction.** Par dérogation à l'interdiction posée en section 2 selon laquelle aucun changement de niveau d'accès ne peut survenir sans l'initiative du détenteur légitime, l'instance nationale de validation peut, dans les conditions strictement définies par la section 8.4 de la charte de gouvernance, restreindre unilatéralement le niveau d'accès d'une connaissance. Cette exception ne dispense pas de l'obligation de traçabilité : le changement demeure attribué, motivé et daté, seule son origine diffère de la règle générale.

**6.2. La connaissance sans détenteur individuel identifiable.** Par dérogation à la cardinalité « 1 détenteur par autorisation » lorsque ce détenteur est attendu comme une personne physique, une autorisation peut émaner directement d'une communauté représentée selon ses propres règles, sans qu'aucune personne individuelle ne soit désignée, conformément à la section 3.4 de la charte de gouvernance.

**6.3. La protection des mineurs.** Par dérogation à la contrainte d'antériorité de l'autorisation posée en section 4, une connaissance impliquant un mineur peut être collectée sur la base d'une autorisation donnée par son représentant légal, mais ne peut franchir l'étape de diffusion qu'après l'examen renforcé prévu par la contrainte de protection renforcée, qui prévaut alors sur toute autorisation initialement accordée.

**6.4. La connaissance déjà publiée par une source tierce.** Par dérogation à la contrainte de source minimale et à l'exigence d'autorisation de collecte, une connaissance déjà rendue publique par une source indépendante du détenteur d'origine — une archive publique, un ouvrage déjà publié — peut être intégrée au système sans autorisation complète de ce détenteur, à la condition expresse que son statut d'origine incomplète soit documenté avec la plus grande transparence, conformément à la section 3.4 de la charte de gouvernance. Cette connaissance ne peut cependant recevoir aucun changement de régime de propriété en faveur du système ni d'aucun tiers autre que son détenteur d'origine, s'il venait à être identifié ultérieurement.

Aucune autre exception n'est reconnue par cette ontologie. Toute situation nouvelle qui semblerait en appeler une doit être portée devant l'instance nationale de validation et, si elle s'avère récurrente, faire l'objet d'un enrichissement explicite de cette section, conformément au principe d'extensibilité posé en Partie I 3.8.

---

7. Suite du document

La Partie V appliquera l'ensemble de ces règles à des scénarios concrets — un royaume, une cérémonie, une langue, un proverbe, une tradition orale, une variante régionale, un témoignage, une recherche scientifique — afin de vérifier que les entités, les relations et les règles fixées jusqu'ici suffisent réellement à représenter le patrimoine du Burkina Faso tel qu'il se présente dans la réalité, et non seulement tel que la théorie le suppose.
