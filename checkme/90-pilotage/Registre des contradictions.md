---
projet: "checkme"
type: "registre-des-contradictions"
phase: "90-pilotage"
objet: "Contradictions et menaces relevées pendant la reprise, avec leur état de résolution"
statut: "proposed — aucune décision de projet"
cree_le: 2026-09-27
tags: [checkme, pilotage, contradictions]
---

# Registre des contradictions

Ce registre applique la règle du coffre : deux énoncés opposés ne se moyennent pas, ne s'arbitrent pas par commodité et ne se masquent pas dans une note agrégée. Ils sont posés, et la sélection méthodologique suivante vise leur résolution.

Le [[checkme/90-pilotage/Registre des statuts|registre des statuts]] porte le statut des énoncés. Celui-ci porte les **oppositions** entre énoncés, et les menaces qui naissent de la rencontre de deux exigences compatibles prises isolément.

| # | Objet | État |
| --- | --- | --- |
| `CR-01` | qui peut publier, contre la garantie d'authenticité | **Résolue** par arbitrage du 2026-09-27 |
| `CR-02` | la plateforme ne détient pas les données, contre les données versées | **Résolue** par arbitrage du 2026-09-27 : indexation |
| `MEN-01` | consultation sans compte, contre protection des données sensibles | **Résolution invalidée** le 2026-09-27 par le fait `F22`. Rouverte, et reformulée |
| `MEN-02` | la publication actuelle expose elle-même les numéros de CNIB et les dates de naissance | Ouverte — **menace de premier rang, et elle ne porte pas sur le produit mais sur la pratique existante** |
| `CR-03` | l'opérateur de la plateforme est aussi l'un des publieurs | Ouverte — conflit d'intérêts de gouvernance |

---

## `CR-01` — résolue par arbitrage du porteur

La contradiction relevée plus tôt dans la séance est levée. « N'importe qui » ne signifiait pas n'importe qui, mais **n'importe quelle entité authentifiée, vérifiée et certifiée**.

**Arbitrage déclaré le 2026-09-27 :** publication habilitée. C'est la deuxième des trois résolutions proposées.

| Élément de l'arbitrage | Énoncé | Statut |
| --- | --- | --- |
| création des comptes de publication | par l'administrateur de la plateforme, à la demande. Une entité ne s'inscrit pas elle-même | Intention |
| contenu de la vérification | l'entité émettrice est d'accord, au courant, et **responsable** des données publiées et de tout ce qui les entoure | Intention |
| interdiction explicite | un individu ne peut pas créer un compte de publication et y verser ce qu'il veut | Intention |

**À inscrire au journal des décisions sous un identifiant `DEC-P-`.** Je consigne l'arbitrage, je ne le prononce pas : c'est un acte du porteur.

### Conséquence que l'arbitrage entraîne, et qu'il faut voir maintenant

En choisissant la publication habilitée, **le dispositif devient une autorité de confiance**. Ce n'est pas un détail d'implémentation : c'est la fonction qui porte toute sa valeur. Quatre conséquences en découlent.

- **La neutralité change de sens.** Le dispositif n'est plus neutre parce que tout le monde y publie ; il est neutre parce qu'il n'appartient à aucun des émetteurs. Ces deux neutralités ne se défendent pas devant une autorité avec les mêmes arguments.
- **La gouvernance de l'habilitation devient le cœur du projet**, et non une annexe. Qui vérifie, selon quels critères, avec quel recours en cas de refus, et qui répond d'une habilitation accordée à tort.
- **La cession complète se complique.** Celui qui détient le registre d'habilitation détient la confiance. Céder le produit sans céder cette fonction n'a pas de sens ; la céder à un émetteur détruirait la neutralité. C'est une question de cadrage de premier rang, non instruite.
- **Une habilitation accordée à tort est le risque maximal du dispositif.** Une liste falsifiée servie sous le sceau d'une entité vérifiée cause plus de dommage que l'absence de dispositif.

### La page à cachet résout une partie de la tension sur les données

Votre exigence nouvelle est structurante : la note officielle publiée à la sortie, avec sa première page et ses cachets, doit être une **référence directe**.

C'est un ancrage de provenance qui ne demande pas au dispositif de détenir les données. Il affiche un statut individuel **et** renvoie au document officiel tamponné qui le fonde. La personne ne croit pas le dispositif sur parole : elle voit la pièce.

**Statut : principe candidat, à confirmer par `L4`** — reste à établir qu'un renvoi au document officiel est licite et que le cachet a une valeur opposable.

## `CR-02` — tension nouvelle, non résolue

Deux de vos énoncés se tendent sans se contredire formellement.

| Énoncé | Source |
| --- | --- |
| « La plateforme ne devra pas détenir des données » | déclaration du 2026-09-26 |
| « vérifier que les données qui seront **versées** sont bien vraiment d'elles » | déclaration du 2026-09-27 |

Verser suppose déposer. Et pour répondre en quelques secondes à une recherche par identifiant, il faut au minimum un index. Trois régimes sont possibles et n'ont pas les mêmes conséquences juridiques :

- **détention** : le dispositif stocke les listes. Il devient responsable de traitement, ou sous-traitant, au sens de la loi n°001-2021/AN ;
- **indexation sans détention du contenu** : il conserve une empreinte et une clé de recherche, le contenu restant chez l'émetteur ;
- **passerelle sans conservation** : il interroge l'émetteur en temps réel. Suppose que l'émetteur expose un service, ce que `L1` établit comme absent aujourd'hui.

**Résolue le 2026-09-27 : indexation.** Le porteur arbitre que la donnée est indexée. Le régime retenu est donc le second : le dispositif conserve une clé de recherche et une empreinte, permettant de répondre en quelques secondes, et renvoie au document officiel tamponné pour le contenu opposable.

Ce que l'arbitrage ne tranche pas encore, et qui reste à `L4` :

- **la répartition responsable de traitement et sous-traitant** au sens de la loi n°001-2021/AN. Indexer reste un traitement. L'émetteur demeure responsable de ce qu'il publie, mais le dispositif répond de son index ;
- **ce que l'index contient exactement**. Un index qui porte le nom et le statut expose davantage qu'un index qui ne porte qu'une empreinte de l'identifiant et un renvoi. Ce choix commande `MEN-01` et ne doit pas se faire par commodité technique ;
- **la durée de conservation de l'index**, distincte de celle de la publication.

## `CR-03` — l'opérateur est aussi l'un des publieurs

Ouverte le 2026-09-27, à partir de la clarification du porteur sur la neutralité.

| Énoncé | Source |
| --- | --- |
| Un ministère peut gérer la plateforme, par exemple celui de la fonction publique ou celui du numérique | déclaration du 2026-09-27 |
| Toutes les administrations passent par elle, et une entité vérifie leur habilité à publier | déclaration du 2026-09-27 |
| La neutralité du dispositif est un argument central de sa valeur | intention fondatrice |

**Le problème.** Si le ministère chargé de la fonction publique opère le dispositif, il vérifie et habilite les publications de ses propres services. Le vérificateur est alors un pair des vérifiés, et pour l'une des catégories les plus sensibles — les concours qu'il organise lui-même. La neutralité affirmée devient difficile à soutenir devant un tiers.

**Ce n'est pas un obstacle, c'est une contrainte de conception de la gouvernance.** Trois configurations s'en distinguent, et elles ne se défendent pas avec les mêmes arguments :

- **opérateur tiers de confiance** : une entité qui ne publie rien elle-même opère le dispositif. La neutralité est structurelle. Reste à trouver qui, et sur quel budget ;
- **opérateur publieur avec séparation des fonctions** : un ministère opère, mais l'habilitation est prononcée par une instance distincte de ses services publieurs, avec trace et recours. La neutralité est procédurale, donc vérifiable mais révocable ;
- **opérateur transversal** : le ministère du numérique opère, sans être lui-même émetteur de résultats de concours. C'est la configuration la plus proche d'une neutralité réelle parmi celles que vous citez, et elle mérite d'être distinguée de la première.

**Non instruit.** Relève du cadrage, et le lot `L6` sur la réceptivité des autorités devrait désormais porter cette question : laquelle de ces configurations une autorité accepterait-elle ?

### Une asymétrie à noter sur les comptes

Le porteur juge les deux modèles de création de compte viables : création par l'administrateur, ou création par l'entité avec pièces soumises à vérification. Ils n'ont pas le même profil de risque.

La création par l'administrateur est plus lente, et la vérification y est inhérente : rien n'existe avant qu'elle ait eu lieu. La création par l'entité est plus fluide, et la vérification devient une file d'attente — donc quelque chose qui peut être expédié sous pression, au moment précis où la charge est la plus forte, c'est-à-dire en période de publication de résultats.

**Conséquence de conception, à retenir pour plus tard :** si le second modèle est retenu, un compte non encore vérifié ne doit pouvoir rien publier, et cet état intermédiaire doit être visible. C'est le genre de règle qui se perd si elle n'est pas écrite avant le code.

## `MEN-01` — menace nommée — l'énumération des identifiants

Elle n'apparaît dans aucun document du projet, et elle naît de la rencontre de deux de vos exigences : consultation sans compte obligatoire, et recherche par un identifiant attribué par l'émetteur.

Un identifiant de concours est le plus souvent séquentiel ou prévisible. Une consultation ouverte, sans compte et sans limite, permet donc de parcourir l'espace des identifiants et de **reconstituer la liste complète**, y compris les non-admis. C'est-à-dire de produire exactement ce que votre dernière phrase interdit : exposer des données sensibles à des personnes malveillantes.

Le corpus hérité avait pressenti la question — limitation de débit par couple, identifiant faible jamais seul — sans la nommer comme menace ni la relier au choix du compte.

**Cette menace est une question de faisabilité, pas de mise en œuvre.** Si l'on ne peut pas servir une consultation ouverte par identifiant sans permettre la moisson, le mécanisme central du produit est en cause, et cela doit se savoir avant le gate de la valeur, non après.

### Résolue le 2026-09-27 — faisable à deux facteurs

La [[checkme/10-etudes/Note de faisabilité — consultation ouverte et énumération|note de faisabilité]] établit trois choses, au grade `N1`.

Le dispositif officiel burkinabè existant le démontre déjà : la consultation des résultats du certificat d'études exige un numéro de procès-verbal **et** une date de naissance. Le second facteur porte le coût d'une moisson complète d'un facteur dix mille environ, sans rien coûter à la personne concernée, qui connaît sa date de naissance.

La contrainte juridique du lot `L4` pousse vers la même réponse pour des raisons indépendantes : le numéro d'identité national exige une autorisation de la CIL, le numéro de session n'est pas tranché. **Un facteur unique ne convient dans aucun des deux cas.** Le choix n'est donc pas entre sécurité et simplicité, mais entre un facteur et deux.

**Conséquences.** Le principe de consultation sans compte tient. La menace ne peut plus servir d'argument contre l'option numérique au gate de la valeur. Symétriquement, elle en retire une : le facteur unique sort de l'espace de comparaison.

**Effet de bord sur une divergence héritée.** La question contestée depuis le corpus — l'écran citoyen propose-t-il une recherche par nom ? — reçoit un argument indépendant. Le nom est le pire facteur possible : il figure sur la liste publiée, il est énumérable par dictionnaire, et il est ambigu.

**Vérification la plus urgente, et elle est gratuite :** la date de naissance figure-t-elle sur les listes publiées ? Si oui, le second facteur perd sa propriété principale. Cela se lit sur la structure des publications déjà relevées par `L2`.



---

## Invalidation de la résolution de `MEN-01`, le 2026-09-27

Le fait `F22` infirme l'hypothèse sur laquelle reposait la [[checkme/10-etudes/Note de faisabilité — consultation ouverte et énumération|note de faisabilité]].

Cette note supposait que la date de naissance n'était pas publique. Le porteur déclare qu'elle figure sur les listes publiées, **et le numéro de CNIB avec elle**. Le second facteur n'est donc pas un secret : il se lit sur le document qui circule.

**La résolution est invalidée, non amendée.** Elle reposait sur une hypothèse fausse ; la corriger en changeant de facteur reviendrait à sauver une conclusion sans réinstruire la question. La note porte désormais son invalidation en tête.

### Ce que l'invalidation révèle, et qui est plus important qu'elle

Si la liste publiée porte déjà nom, date de naissance, numéro de CNIB et numéro de session, **et qu'elle circule ouvertement sur les réseaux sociaux**, alors une consultation individuelle n'ajoute aucune exposition à qui détient la liste. La liste **est** l'exposition.

La menace change donc d'objet. Elle ne porte pas sur le produit envisagé, mais sur la pratique actuelle. Elle devient `MEN-02`.

## `MEN-02` — la publication actuelle expose les identifiants de tous les candidats

Ouverte le 2026-09-27.

| Élément | Énoncé | Grade |
| --- | --- | --- |
| contenu des listes | nom, date de naissance, numéro de CNIB, identifiant de session, pour chaque candidat, admis comme non admis | `N2` |
| canal de diffusion | réseaux sociaux, ouvert à tous, republications non maîtrisées | `N2`, renforcé par `F18` |
| régime légal du numéro de CNIB | traitement portant sur un numéro d'identification national : **autorisation préalable de la CIL**, article 31 de la loi n°001-2021/AN | `N1`, établi par `L4` |
| sanction d'un traitement sans formalité | amende de 5 à 20 millions de francs CFA, article 68 | `N1`, établi par `L4` |

**Je ne conclus pas que la pratique actuelle est illégale.** Établir cela demande de vérifier si une base légale ou une formalité existe pour ces publications, ce qu'aucun lot n'a fait, et la qualification juridique n'est pas de mon ressort. Je constate que les éléments établis par `L4` et le fait `F22`, mis côte à côte, posent une question que le dossier n'avait pas posée.

**Cette question doit être posée avec prudence.** Un projet qui se présente à une autorité en lui signalant une non-conformité de ses propres services choisit un angle délicat. Le même fait peut se présenter comme un risque qu'on aide à supprimer, ou comme un reproche. Ce n'est pas une question de conception, c'est une question de stratégie de présentation, et elle relève du lot `L6`.

### Reformulation de `MEN-01`

La question de l'énumération ne disparaît pas, elle se subordonne.

**Si le dispositif remplace la publication de la liste complète**, alors la liste cesse d'être publique, la date de naissance et le numéro de session redeviennent connus de la seule personne et de l'administration, et la solution à deux facteurs retrouve sa validité. La note de faisabilité serait alors juste, mais pour une raison qu'elle n'énonçait pas.

**Si le dispositif s'ajoute à la publication de la liste complète**, alors aucun facteur n'est secret, l'énumération est sans objet puisque la liste est déjà disponible, et le dispositif n'apporte que de la commodité.

**Tout dépend donc d'une question juridique unique, et elle est décisive :** le communiqué obligatoire de l'article 23 du décret doit-il contenir la liste nominative complète, ou peut-il annoncer que les résultats sont consultables individuellement ?

Le lot `L4` a établi que la consultation *s'ajoute* au communiqué. Il n'a pas établi **ce que le communiqué doit contenir**. C'est la lacune la plus coûteuse du dossier, et elle se comble par lecture de texte.
