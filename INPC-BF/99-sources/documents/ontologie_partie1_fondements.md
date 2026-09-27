Ontologie du Patrimoine Culturel Vivant du Burkina Faso

Partie I — Fondements de l'ontologie

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Document fondateur, cinquième pièce de la série

---

Préambule de cette partie

Quatre documents précèdent celui-ci : la charte fondatrice a posé la vision, le référentiel conceptuel a défini les objets de pensée, la taxonomie a organisé leur classification, la charte de gouvernance et d'éthique a fixé les règles de consentement, d'accès et de validation. Ce cinquième document est d'une autre nature. Il ne décrit plus une intention ni une règle : il fixe la structure formelle qui reliera, pour des décennies, toutes les connaissances du système entre elles.

Cette Partie I ne définit encore aucune entité ni aucune relation précise. Elle répond à une question plus fondamentale : qu'est-ce que ce document a le droit de faire, et à quelles conditions ce qu'il fera restera cohérent avec tout ce qui a été posé avant lui.

---

1. Qu'est-ce qu'une ontologie, dans ce projet

1.1. Ce que l'ontologie n'est pas

L'ontologie n'est pas un dictionnaire de définitions : le référentiel conceptuel joue déjà ce rôle. Elle n'est pas un système de classement : la taxonomie joue déjà ce rôle. Elle n'est pas un règlement de gouvernance : la charte de gouvernance et d'éthique joue déjà ce rôle. L'ontologie ne refait aucun de ces trois travaux. Elle les présuppose et s'appuie sur eux.

1.2. Ce que l'ontologie est

L'ontologie est la structure qui répond, pour chaque paire de choses que le système connaît, à la question : *quelle relation peut exister entre elles, dans quel sens, en quelle quantité, et sous quelle condition.*

Le référentiel conceptuel a déjà énoncé des relations en langage naturel : « une tradition appartient à une communauté », « une institution valide une connaissance ». L'ontologie prend ce même matériau et lui donne une forme exploitable de façon systématique : elle précise ce que « appartient à » autorise et interdit, combien de communautés une tradition peut simultanément revendiquer, ce qui se passe quand deux institutions valident différemment la même connaissance, et ainsi de suite pour l'ensemble du corpus conceptuel.

Autrement dit, la taxonomie répond à la question « où se range cette connaissance ? ». L'ontologie répond à la question « comment cette connaissance se comporte-t-elle vis-à-vis de tout le reste ? ».

1.3. Une distinction nécessaire avec le sens philosophique du mot

Le mot « ontologie » vient de la philosophie, où il désigne l'étude de ce qui existe. Ce document ne prétend pas trancher philosophiquement ce qu'est le patrimoine culturel, ni ce qui constitue une tradition « authentique ». Ce travail n'appartient à aucune infrastructure numérique : il appartient aux peuples et aux communautés eux-mêmes, et la charte fondatrice l'a déjà écarté du champ du projet. Le sens retenu ici est le sens technique du terme, tel qu'il est employé par les grandes institutions patrimoniales et documentaires : une structure formelle de connaissances, pas une doctrine sur la nature du réel.

---

2. Pourquoi une ontologie du patrimoine est nécessaire

2.1. Le problème que la taxonomie seule ne résout pas

La taxonomie autorise la multi-classification : une même connaissance peut relever de plusieurs domaines. Elle autorise l'évolutivité : de nouveaux domaines peuvent apparaître. Mais elle ne dit rien sur la façon dont deux connaissances rangées dans des domaines différents peuvent se référer l'une à l'autre, se contredire, dériver l'une de l'autre, ou partager une même communauté, un même lieu, un même événement.

Sans ontologie, chaque futur développement du système devra improviser ses propres réponses à ces questions, au moment où elles se poseront, dans l'urgence d'un besoin technique précis. Le brouillon de travail qui a précédé ce document le formulait ainsi : si l'ontologie se trompe, tout ce qui vient après elle sera bancal. L'ontologie existe pour que ces réponses soient données une fois, avec rigueur, avant qu'elles ne soient nécessaires dans l'urgence.

2.2. Le problème spécifique posé par ce patrimoine en particulier

Trois caractéristiques du patrimoine documenté par ce projet rendent une ontologie explicite plus nécessaire ici que dans un système documentaire ordinaire :

- **La coexistence de variantes sans hiérarchie.** Le référentiel conceptuel interdit de faire disparaître une version au profit d'une autre. Une ontologie doit donc représenter des connaissances concurrentes comme légitimement simultanées, ce qu'une structure de données ordinaire, pensée pour une vérité unique, ne sait pas faire par défaut.
- **Des niveaux d'accès et de validation orthogonaux.** La charte de gouvernance a établi qu'une connaissance peut être pleinement validée et pourtant non publique, ou publique et pourtant non validée par tous les échelons compétents. Une ontologie doit représenter ces deux dimensions séparément, sans qu'aucune ne se déduise automatiquement de l'autre.
- **Une autorité de validation elle-même plurielle.** L'instance de validation n'est pas un point unique de vérité : elle est composée de trois échelons pouvant chacun émettre un avis distinct sur une même connaissance. L'ontologie doit pouvoir représenter plusieurs avis de validation attachés à un même objet, sans qu'un avis n'efface les autres.

Une ontologie générique, empruntée telle quelle à un autre domaine documentaire, ne prévoirait spontanément aucune de ces trois exigences. C'est pourquoi ce document ne se contente pas d'adopter un modèle existant : il en construit un qui leur est spécifiquement adapté, tout en restant attentif, le moment venu, à la comparabilité avec les référentiels patrimoniaux internationaux.

2.3. Ce qui dépend de cette ontologie

Le brouillon de travail énumérait ce que l'ontologie déterminera par la suite : la structure des données, les interfaces de programmation, le moteur de recherche, les moteurs de recommandation, les représentations en graphe de connaissances, les futurs systèmes d'intelligence artificielle entraînés ou appuyés sur ce corpus, les parcours pédagogiques, les statistiques, et les liens entre connaissances. Aucun de ces éléments n'est traité dans ce document : ce sont des choix technologiques, hors du périmètre fixé depuis la charte fondatrice. Mais tous devront, le moment venu, se conformer à ce que cette ontologie aura fixé, sans pouvoir la contredire.

---

3. Principes de modélisation

Ces principes gouvernent l'ensemble des parties suivantes de l'ontologie. Aucune entité, aucune relation, aucune règle de cohérence définie dans les parties ultérieures ne peut les contredire.

3.1. Primauté des documents précédents

L'ontologie ne peut définir aucune entité qui contredise le référentiel conceptuel, aucune classification qui contredise la taxonomie, aucune règle d'accès, de consentement ou de validation qui contredise la charte de gouvernance et d'éthique. Là où l'ontologie doit préciser un mécanisme déjà nommé sans être formalisé — le niveau d'accès, la relation de consentement, les trois échelons de validation — elle formalise ce qui existe déjà ; elle n'invente pas de règle nouvelle.

3.2. Non-suppression et immutabilité de l'historique

Aucune relation ni aucune entité, une fois établie dans le système, n'est effacée. Une relation peut être close, remplacée, contestée ou reléguée à un niveau d'accès restreint, mais sa trace demeure. Ce principe, déjà posé par le référentiel conceptuel, devient ici une contrainte formelle : toute modélisation qui impliquerait, techniquement, la disparition d'une information passée est invalide au regard de cette ontologie.

3.3. Coexistence sans hiérarchie forcée

Deux connaissances en désaccord ou deux variantes d'une même tradition ne sont jamais modélisées comme une version « principale » et des versions « secondaires ». Elles sont modélisées comme des entités de même rang, reliées entre elles par une relation qui documente leur rapport — variante, contestation, traduction — sans qu'aucune ne prenne mécaniquement le pas sur l'autre. Distinguer une connaissance mise en avant dans une interface donnée d'une connaissance plus rarement consultée est un choix d'affichage, étranger à cette ontologie ; l'ontologie, elle, les traite à égalité de statut.

3.4. Séparation des dimensions orthogonales

Trois dimensions qui pourraient être confondues doivent rester structurellement distinctes dans toute la suite de ce document : la classification d'une connaissance (à quel domaine elle appartient), son niveau de validation (à quel point elle est jugée fiable), et son niveau d'accès (qui peut la consulter). Aucune de ces trois dimensions ne peut être déduite automatiquement d'une autre. Une connaissance très classifiée peut être peu validée ; une connaissance pleinement validée peut être peu accessible ; ces combinaisons sont toutes légitimes et doivent toutes pouvoir être représentées.

3.5. Statut épistémique explicite

Le référentiel conceptuel distingue les faits documentés, les traditions orales, les interprétations et les analyses contemporaines. L'ontologie porte cette distinction au rang de propriété obligatoire : aucune connaissance n'existe dans le système sans que son statut épistémique soit explicite. Ce principe empêche qu'une interprétation contemporaine soit un jour présentée, par simple absence de précision, avec la même autorité qu'un témoignage direct ou qu'une tradition transmise depuis des générations.

3.6. La taxonomie comme classification, non comme structure d'autorité

Conformément à ce que la charte de gouvernance a déjà établi pour la gouvernance de validation, l'ontologie ne fait jamais dépendre une règle de pouvoir, de propriété ou d'accès de la place d'une connaissance dans la taxonomie. Les quinze domaines organisent la recherche et la navigation ; ils n'organisent ni qui décide, ni qui possède, ni qui peut consulter.

3.7. Le consentement, la propriété et la contestation comme relations de premier rang

Ces trois notions, établies par la charte de gouvernance, ne seront pas traitées dans l'ontologie comme de simples attributs annexes d'une connaissance. Elles seront modélisées comme des relations à part entière, au même titre que « appartient à » ou « est documenté par », parce qu'elles engagent toujours au moins deux entités distinctes — une connaissance et une personne, une connaissance et une communauté — et qu'un simple champ de métadonnées ne peut pas représenter cette nature relationnelle.

3.8. Extensibilité sans rupture

Aucune version future de cette ontologie ne peut retirer une entité, une relation ou une règle déjà posée sans que cela constitue une rupture de compatibilité majeure, à traiter comme telle et non comme une simple mise à jour. L'ontologie peut en revanche toujours être enrichie : de nouvelles entités, de nouvelles relations et de nouvelles règles peuvent s'ajouter à celles déjà définies, du moment qu'elles ne contredisent pas les principes énoncés dans cette partie.

---

4. Portée et limites de l'ontologie

4.1. Ce que l'ontologie couvre

- La liste des entités fondamentales du système et leurs propriétés essentielles (Partie II).
- Les relations qui peuvent exister entre ces entités, leur sens et leur signification (Partie III).
- Les règles de cohérence qui déterminent ce qui est permis, ce qui est interdit, les cardinalités et les cas d'exception (Partie IV).
- Des scénarios de modélisation concrets, montrant comment les parties précédentes s'appliquent à des cas réels du patrimoine burkinabè (Partie V).
- Les modalités selon lesquelles cette ontologie elle-même pourra évoluer sans se contredire (Partie VI).

4.2. Ce que l'ontologie ne couvre pas

- Aucun choix de technologie, de format de fichier, de langage de programmation ou de système de stockage. L'ontologie doit rester intelligible et applicable quelle que soit la technologie qui la mettra en œuvre, de la même manière que la charte fondatrice l'exige pour l'ensemble du projet.
- Aucune interface utilisateur, aucun parcours de navigation, aucune maquette. La manière dont une personne consultera un jour ces connaissances est une question de conception d'expérience, postérieure et étrangère à ce document.
- Aucune procédure opérationnelle détaillée de la gouvernance — composition précise des collèges, durée exacte des mandats, formulaires de consentement. Ces éléments relèvent de documents opérationnels distincts, subordonnés à la charte de gouvernance, que l'ontologie se contente de représenter formellement sans les redéfinir.
- Aucun jugement sur le contenu culturel lui-même. L'ontologie ne dit jamais si une tradition est vraie, authentique ou légitime : c'est précisément la fonction de l'instance de validation, définie par la charte de gouvernance, et non celle de la structure qui représente ses avis.

4.3. Une limite assumée

Cette ontologie ne pourra jamais anticiper la totalité des situations qu'un patrimoine aussi vaste que celui du Burkina Faso fera un jour remonter. Elle n'a pas cette prétention. Son ambition est plus modeste et plus solide : fournir une structure suffisamment cohérente et suffisamment principielle pour que les situations imprévues puissent s'y intégrer par extension, conformément au principe posé en 3.8, plutôt que par contradiction de ce qui existe déjà.

---

5. Suite du document

La Partie II établira la liste complète des entités fondamentales de l'ontologie, en reprenant et en complétant celles déjà nommées par le référentiel conceptuel, à la lumière des principes posés dans cette Partie I.
