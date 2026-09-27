# 🎮 LevelUP — Spécification corrigée du système RPG d’apprentissage

> **Objectif** : transformer LevelUP en un système de progression discipliné, immersif et motivant, où l’apprentissage est structuré comme un RPG sérieux : montée en niveau, déblocage de compétences, missions imposées, validations réelles, rappels de révision, et pénalités mesurées.

---

## 1. Vision produit

LevelUP n’est pas un LMS classique. Ce n’est pas non plus un jeu au sens léger du terme. C’est un **système de progression encadrée** inspiré des RPG, où l’utilisateur avance dans un parcours défini, débloque des paliers, et prouve sa maturité avant de passer au niveau supérieur.

Le principe central est simple :
- **On ne récompense pas l’activité vide**.
- **On récompense la maîtrise réelle**.
- **On ne passe pas de niveau uniquement parce qu’on a accumulé du temps**.
- **On passe de niveau parce qu’on a démontré une compréhension suffisante, stable et réutilisable**.

Le système doit être :
- **motivant**, sans être infantilisant ;
- **rigoureux**, sans être brutal ;
- **discipliné**, sans devenir punitif par défaut ;
- **adaptatif**, sans perdre le cadre du parcours choisi.

---

## 2. Philosophie pédagogique

### 2.1 Le parcours comme système verrouillé

Chaque parcours devient un **système fermé de progression**. L’utilisateur choisit une voie, par exemple :
- Full Stack
- Développement système
- Administration Linux
- Réseau / télécom
- DevOps / DevSecOps

Une fois le parcours choisi, il ne s’agit pas d’une simple liste de cours. Il s’agit d’un **graphe de progression** où :
- chaque niveau contient des prérequis réels ;
- chaque étape valide une compétence utile ;
- chaque avancée suppose une base stable ;
- chaque retour en arrière reste possible par révision ou remédiation.

### 2.2 Le but du système

Le système doit éviter deux erreurs :
1. faire progresser un utilisateur trop vite sans base solide ;
2. bloquer l’utilisateur inutilement alors qu’il a déjà assimilé l’essentiel.

Le rôle du moteur n’est donc pas de distribuer des points au hasard, mais de **mesurer la maturité d’apprentissage**.

### 2.3 Apprendre sans oublier

Le système doit garantir que les acquis précédents restent disponibles.

Un niveau n’est pas considéré comme “terminé” seulement parce qu’il a été traversé. Il est considéré comme acquis si :
- l’utilisateur a compris les notions essentielles ;
- il sait les réactiver ;
- il peut les utiliser dans un contexte différent ;
- il conserve un taux minimal de rétention après révision.

Ainsi, un niveau plus avancé peut exiger :
- une révision des bases ;
- un QCM de rappel ;
- une mini-session pratique sur les notions anciennes ;
- un contrôle de consolidation avant ouverture du niveau suivant.

---

## 3. Structure globale du système

Le système LevelUP repose sur 5 moteurs principaux :

1. **Progression Engine**
   - gère les niveaux, l’XP, les paliers et les verrouillages ;

2. **Mission Engine**
   - génère des sessions, exercices, projets et labs ;
   - impose une fenêtre d’activation et une date limite ;

3. **Assessment Engine**
   - évalue les connaissances par QCM, exercices, mini-projets et validations pratiques ;

4. **Retention Engine**
   - organise les rappels, les révisions, les checks de consolidation et la réactivation des bases ;

5. **AI Tutor Engine**
   - adapte, génère et personnalise les contenus en fonction du niveau réel de l’utilisateur et de l’évolution des technologies.

---

## 4. Principes de progression

### 4.1 XP utile, pas XP vide

Les points d’expérience doivent représenter une **preuve de progression**.

On peut accorder de l’XP pour :
- une validation correcte d’un topic ;
- une session complétée avec réussite ;
- un QCM maîtrisé ;
- un mini-projet réussi ;
- une révision active bien exécutée ;
- une mission imposée complétée dans les temps ;
- une consolidation des acquis antérieurs.

On ne doit pas accorder d’XP pour :
- le simple fait d’ouvrir une page ;
- la consultation passive ;
- une activité sans résultat ;
- un clic non suivi d’achèvement ;
- une tentative manifestement insuffisante qui ne démontre aucune acquisition.

### 4.2 Niveau = maturité

Un niveau représente un état de maturité pédagogique.

Pour passer au niveau suivant, l’utilisateur doit démontrer :
- compréhension de base ;
- capacité à appliquer ;
- capacité à retenir ;
- capacité à corriger ses erreurs ;
- capacité à réutiliser les acquis dans un exercice nouveau.

### 4.3 Progression douce mais exigeante

Le système doit rester motivant :
- au début, les premiers paliers doivent être accessibles et lisibles ;
- ensuite, la montée doit demander davantage de preuve ;
- les pénalités doivent être réelles mais jamais humiliantes ;
- l’utilisateur doit sentir qu’il avance, mais seulement quand il a consolidé sa base.

---

## 5. Cycle d’une mission

### 5.1 Définition d’une mission

Une mission peut être :
- une session d’étude ;
- un exercice guidé ;
- un QCM ;
- un mini-projet ;
- un lab pratique ;
- une révision ciblée ;
- une tâche de consolidation.

### 5.2 Génération de la mission

Le système génère une mission à partir de :
- du parcours choisi ;
- du niveau courant ;
- des acquis déjà validés ;
- des lacunes détectées ;
- du contexte actuel des technologies ;
- des objectifs pédagogiques du palier.

### 5.3 Fenêtre d’activation

Chaque mission possède une **fenêtre d’activation**.

Quand la mission est notifiée :
- l’utilisateur reçoit un délai pour l’activer ;
- ce délai peut être court ou moyen selon la criticité ;
- tant que la mission n’est pas activée, elle reste “en attente”.

### 5.4 Passage en obligation

Si le délai d’activation expire :
- la mission devient **obligatoire** ;
- elle ne peut plus être ignorée ;
- elle entre dans le registre des tâches à accomplir ;
- son poids disciplinaire augmente.

L’idée n’est pas de punir arbitrairement, mais de rappeler que la progression a un coût temporel.

### 5.5 État de la mission

Une mission peut être :
- **proposée** ;
- **notifiée** ;
- **en attente d’activation** ;
- **active** ;
- **complétée** ;
- **expirée** ;
- **obligatoire** ;
- **échouée**.

---

## 6. Système de pénalités

Les pénalités existent pour maintenir la discipline, pas pour casser la motivation.

### 6.1 Types de pénalités

- **Retard d’activation** : la mission devient plus urgente.
- **Non-réponse** : baisse légère de discipline.
- **Échec répété** : déclenche une remédiation.
- **Abandon de mission obligatoire** : sanction plus forte.
- **Inactivité prolongée** : baisse progressive du statut.
- **Mauvaise consolidation** : blocage temporaire d’accès à certains paliers.

### 6.2 Nature des sanctions

Les sanctions doivent être graduelles :
- perte légère d’XP ;
- réduction temporaire de discipline ;
- ajout de missions correctives ;
- verrouillage d’un niveau tant que la base n’est pas consolidée ;
- limitation d’accès à certains contenus avancés.

### 6.3 Principe de rigueur mesurée

Le système ne doit pas devenir agressif. La logique est :
- rappeler ;
- encadrer ;
- corriger ;
- seulement ensuite sanctionner plus fort si le comportement persiste.

---

## 7. Mécanisme de validation des niveaux

### 7.1 Le niveau suivant n’est pas automatique

Le passage à un niveau supérieur ne dépend pas uniquement d’un total d’XP.

Le système doit vérifier :
- que les bases du niveau précédent sont solides ;
- que les notions clés sont encore mobilisables ;
- que les compétences sont réutilisables ;
- que l’utilisateur n’est pas en train de “survoler” le parcours.

### 7.2 Conditions de passage

Pour valider un niveau, il faut cumuler :
- un seuil minimum d’XP ;
- un score minimal de maîtrise ;
- un taux de réussite aux tests ;
- une consolidation des notions antérieures ;
- éventuellement une mission pratique obligatoire.

### 7.3 Blocage intelligent

Si le niveau précédent n’est pas solide :
- le niveau suivant reste verrouillé ;
- le système propose une remédiation ;
- l’utilisateur reçoit des sessions ciblées ;
- des QCM de rappel peuvent être générés ;
- des exercices pratiques peuvent être imposés.

---

## 8. Conservation des acquis

### 8.1 Révision obligatoire des bases

Quand l’utilisateur avance vers des niveaux plus élevés, les bases anciennes ne doivent pas disparaître.

Le système doit donc planifier :
- des rappels espacés ;
- des missions de réactivation ;
- des mini-tests de révision ;
- des exercices de transfert ;
- des retours aux fondamentaux.

### 8.2 Objectif mémoire long terme

Le but n’est pas d’accumuler des badges. Le but est que :
- le niveau 1 reste utile au niveau 5 ;
- le niveau 3 reste mobilisable au niveau 8 ;
- les acquis restent vivants ;
- les connaissances deviennent une base durable.

---

## 9. Architecture pédagogique par parcours

### 9.1 Exemple : parcours Full Stack

Un parcours Full Stack doit couvrir :
- les fondamentaux web ;
- le code côté client ;
- le code côté serveur ;
- les bases de données ;
- l’outillage ;
- le déploiement ;
- les pratiques professionnelles ;
- les technologies en vogue utiles au métier.

### 9.2 Deux couches dans chaque parcours

Chaque parcours doit contenir deux couches complémentaires :

#### Couche A — Socle essentiel
Ce qui est indispensable pour apprendre correctement :
- syntaxe ;
- principes ;
- logique ;
- architecture ;
- bases théoriques ;
- exercices simples.

#### Couche B — Réalité professionnelle
Ce qui est nécessaire pour pratiquer dans un environnement concret :
- outils utilisés en entreprise ;
- technologies actuelles ;
- bonnes pratiques ;
- workflows réels ;
- mini-projets proches du terrain ;
- habitudes de production.

Le système doit savoir gérer les deux couches sans les confondre.

---

## 10. Génération intelligente des missions

### 10.1 Rôle du moteur génératif

Le moteur doit être capable de proposer :
- des sessions d’étude ;
- des exercices ;
- des QCM ;
- des labs ;
- des mini-projets ;
- des défis de consolidation.

### 10.2 Adaptation au niveau réel

La génération doit tenir compte de :
- l’historique de l’utilisateur ;
- les erreurs fréquentes ;
- les notions fragiles ;
- les prérequis non maîtrisés ;
- les objectifs du niveau actuel.

### 10.3 Contexte de technologies actuelles

Pour un parcours donné, le système peut intégrer :
- les technologies réellement utilisées aujourd’hui ;
- les outils pertinents pour le métier visé ;
- les pratiques modernes ;
- les variations de marché ;
- les exercices concrets adaptés à ces outils.

L’IA Tutor doit donc pouvoir enrichir les parcours avec des propositions pertinentes, tout en restant alignée sur le socle pédagogique.

---

## 11. IA Tutor progressive

### 11.1 Positionnement

L’IA Tutor ne doit pas remplacer le système. Elle doit le servir.

Son rôle est de :
- générer du contenu adapté ;
- proposer des variantes d’exercices ;
- reformuler des explications ;
- aider à corriger les erreurs ;
- détecter les trous de compréhension ;
- proposer des révisions intelligentes.

### 11.2 IA progressive

L’IA doit être introduite progressivement :
- d’abord pour générer des QCM simples ;
- ensuite pour générer des exercices et labs ;
- ensuite pour ajuster les parcours ;
- enfin pour assister la production de contenu avancé.

### 11.3 IA ancrée dans le parcours

L’IA ne doit pas produire du contenu générique détaché du système.

Elle doit s’appuyer sur :
- le niveau de l’utilisateur ;
- les notions déjà apprises ;
- les prérequis du niveau suivant ;
- les technologies du parcours choisi ;
- les objectifs de maîtrise.

---

## 12. Priorités d’implémentation

### Phase 1 — Noyau de progression
Objectif : verrouiller la logique du système.

À livrer :
- XP et niveaux ;
- états de progression ;
- verrouillage des niveaux ;
- validation par maîtrise ;
- pénalités douces ;
- historique des événements.

### Phase 2 — Missions et discipline
Objectif : rendre le système vivant.

À livrer :
- missions imposées ;
- fenêtres d’activation ;
- expiration ;
- obligation ;
- sanctions progressives ;
- rappels ;
- sessions correctives.

### Phase 3 — QCM, remédiation et skill tree
Objectif : mesurer et consolider.

À livrer :
- QCM ;
- tests de niveau ;
- exercices de rappel ;
- arbre de compétences ;
- validation des acquis ;
- remédiation ciblée.

### Phase 4 — IA progressive
Objectif : enrichir et personnaliser.

À livrer :
- génération assistée de QCM ;
- sessions adaptées ;
- exercices contextuels ;
- recommandations de technologies actuelles ;
- assistant de consolidation.

---

## 13. Règles de calibration

### 13.1 Le système doit être souple

L’utilisateur doit pouvoir avancer sans être bloqué sur des détails secondaires.

### 13.2 Le système doit être strict

L’utilisateur ne doit pas pouvoir “acheter” la progression sans compétence réelle.

### 13.3 Le système doit rester juste

Les échecs doivent correspondre au niveau réel. Les sanctions doivent être cohérentes avec le comportement et la difficulté des objectifs.

### 13.4 Le système doit protéger les bases

Avant de passer au niveau supérieur, l’utilisateur doit prouver qu’il maîtrise encore les acquis antérieurs.

---

## 14. Résumé de la philosophie finale

LevelUP doit devenir un **système d’apprentissage à progression verrouillée**, inspiré des RPG, mais centré sur la vérité pédagogique.

Le message du système est clair :
- tu progresses parce que tu maîtrises ;
- tu obtiens de l’XP parce que tu prouves quelque chose ;
- tu débloques un niveau parce que tu es prêt ;
- tu reçois des missions parce que le système t’encadre ;
- tu reviens aux bases parce que le savoir doit durer.

Ce n’est pas un système pour récompenser sans fondement.
C’est un système pour **former, consolider et faire monter en puissance**.

