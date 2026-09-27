---
projet: "synapse"
type: "dossier-de-faisabilite"
phase: "10-etudes"
objet: "Analyse composant par composant, retraits de périmètre, noyau livrable en neuf à douze mois et points de décision restants"
identifiant_source: "SYNAPSE-REF-003"
version: "1.0"
statut_documentaire: "Document d'analyse, non contractuel — évaluation de faisabilité et proposition de réduction de périmètre"
provenance: "SYNAPSE_dossier_faisabilite.md"
mise_en_conformite: 2026-09-07
tags:
  - synapse
  - etudes
  - faisabilite
---

> [!important] Ce document se déclare non contractuel, et son point 1 s'intitule pourtant « Décisions actées »
> Les trois décisions qu'il énonce — habilitation institutionnelle, prise en charge publique du constat, portée juridique de l'attestation — sont **consignées au [[synapse/90-pilotage/Registre des statuts|Registre des statuts]] sans être promues** : un statut écrit dans un document qualifie l'état de ce texte, jamais celui du projet (`DEC-C-014`), et celui-ci se dit lui-même non contractuel. Voir `DEC-C-027`.
> Le reste du document est écrit dans l'**hypothèse A** — trois à six personnes, financement propre, aucun mandat institutionnel — que son point 4 présente comme la seule hypothèse ne dépendant d'aucune décision extérieure.

# SYNAPSE — DOSSIER DE FAISABILITÉ

## Analyse composant par composant du périmètre décrit dans SYNAPSE-REF-001 et SYNAPSE-REF-002

**Identifiant :** SYNAPSE-REF-003
**Version :** 1.0
**Statut :** Document d'analyse, non contractuel
**Nature :** Évaluation de faisabilité et proposition de réduction de périmètre
**Périmètre :** Décisions actées, contexte national vérifié, critères d'évaluation, analyse composant par composant, pile technique, contraintes non techniques, noyau retenu, points de décision restants

---

## 0. Note de méthode

SYNAPSE-REF-001 est un document d'intention. Rien n'y est figé, et le présent dossier procède de ce principe : tout composant décrit peut être remis en cause, réduit, différé ou retiré.

Un dossier de faisabilité qui conclurait que l'ensemble du périmètre est réalisable en trois phases n'aurait aucune valeur. **La fonction de ce document est de retirer.** REF-001 point 24.5 identifie la complexité excessive comme risque stratégique ; il ne la traite pas. C'est l'objet de ce dossier.

---

# 1. DÉCISIONS ACTÉES

Ces décisions ferment trois des quatre questions ouvertes de SYNAPSE-REF-002 point 8.

## 1.1 Habilitation des évaluateurs de terrain (REF-002 point 8.1)

**Décision :** habilitation institutionnelle en premier lieu, portée par l'administration, bénéficiaire primaire du dispositif. Ouverture ultérieure aux professionnels certifiés reconnus par l'État mais extérieurs à l'administration, sous forme d'engagement contractuel.

**Conséquence à intégrer :** le rythme de SYNAPSE sur cet axe devient le rythme d'une administration. Le nombre d'agents effectivement mobilisables constitue le plafond réel du niveau N3, et ce plafond est probablement de quelques centaines de constats par an au démarrage, non de milliers. Le système doit être conçu pour rester utile même si N3 reste rare.

## 1.2 Financement du constat physique (REF-002 point 8.2)

**Décision :** prise en charge publique. Les constats sont réalisés par des agents déjà présents sur le terrain et déjà engagés à ce titre, sans facturation au titulaire. Les professionnels certifiés interviendront sous contrat avec l'administration.

**Justification retenue :** faire payer le constat à l'artisan crée une barrière d'entrée sur une valeur qu'il ne peut pas anticiper. Cette décision est correcte et lève l'objection la plus lourde de REF-002.

**Conséquence à intégrer :** le coût ne disparaît pas, il est déplacé vers le temps agent. Deux exigences en découlent :

- un acte administratif doit inscrire le constat SYNAPSE dans les attributions des agents concernés, faute de quoi la tâche sera traitée comme une surcharge non prioritaire ;
- le corps d'agents cible doit être nommé et non supposé. Candidats à examiner : directions régionales de l'enseignement technique et de la formation professionnelle, chambres régionales de métiers de l'artisanat, agents de l'ANPE.

## 1.3 Portée juridique de l'attestation (REF-002 point 8.3)

**Position exprimée :** l'attestation gagnerait à engager au-delà du système, à condition que le système soit lui-même reconnu et certifié par l'État, et qu'une attestation puisse être présentée physiquement à un tiers.

**Résolution proposée, à valider :** dissocier la présentabilité de la force juridique.

| | Niveaux N0 à N3 | Niveau N4 |
|---|---|---|
| Nature | crédibilité sociale documentée | titre professionnel de l'État |
| Force juridique propre | aucune | opposable |
| Objet physique | attestation imprimée, vérifiable par code | titre officiel |
| Qui l'engage | l'attestant, dans le système | l'État |

L'attestation imprimée existe donc et se présente physiquement, mais son autorité est **dérivée** : elle certifie exactement ce qui a été constaté, par qui, et à quelle date, et rien de plus. Cela donne l'usage recherché sans exposer le projet à une responsabilité juridique qu'il ne peut pas assumer avant d'avoir démontré l'intégrité de sa chaîne.

Une extension ultérieure reste ouverte : après démonstration d'un taux de confirmation élevé sur les audits par échantillonnage, un acte réglementaire pourra donner une valeur opposable au niveau N3. **Cet ordre est important.** La reconnaissance juridique doit suivre la preuve d'intégrité, jamais la précéder.

---

# 2. CONTEXTE NATIONAL VÉRIFIÉ

Quatre éléments récents modifient l'analyse de faisabilité et n'apparaissent pas dans REF-001.

## 2.1 L'hébergement souverain est résolu

Deux datacenters modulaires du cloud gouvernemental ont été inaugurés le 23 janvier 2026 à Ouagadougou, dans le cadre du chantier « zéro donnée à l'extérieur » piloté par le ministère de la Transition digitale. Capacité annoncée : 3 000 To de stockage, 105 600 Go de mémoire, 28 800 cœurs, plus de 7 000 machines virtuelles. Un datacenter national de plus grande envergure est annoncé à l'horizon 2028. Un hébergeur privé local, IKA CLOUD, a été lancé le 31 juillet 2026.

**Conséquence :** la question de l'hébergement souverain, qui aurait pu bloquer le projet, est favorable. SYNAPSE devrait s'aligner explicitement sur le cloud gouvernemental. Cela résout la souveraineté, réduit le coût d'infrastructure et crée un point d'ancrage institutionnel.

## 2.2 Le cadre juridique des données existe

La loi n°001-2021/AN du 30 mars 2021 encadre la protection des données à caractère personnel et les conditions d'hébergement et de traitement.

**Conséquence :** le traitement des profils de mineurs, soulevé lors de la revue de REF-001, doit être analysé au regard de ce texte **avant** toute collecte, et non après. C'est un préalable, pas une conformité à rattraper.

## 2.3 Le référentiel des métiers existe

Le Répertoire général des métiers de la formation professionnelle, couvrant 14 secteurs prioritaires, a été adopté en conseil des ministres le 30 juillet 2026.

**Conséquence :** la taxonomie des métiers ne doit pas être construite. Elle doit être importée.

## 2.4 Le projet gagne à s'inscrire dans un chantier existant

La transformation digitale nationale est structurée en douze chantiers majeurs. Un projet présenté comme la mise en œuvre concrète d'un chantier existant obtient un arbitrage plus rapide qu'un projet présenté comme une initiative nouvelle. Le rattachement de SYNAPSE à l'un de ces chantiers est une question stratégique à trancher tôt.

---

# 3. CRITÈRES D'ÉVALUATION

Chaque composant est évalué selon cinq critères.

| Critère | Question |
|---|---|
| Valeur | comble-t-il un manque avéré, ou un manque supposé ? |
| Construction | quel effort d'ingénierie initial ? |
| **Exploitation** | **quel coût humain récurrent, une fois en service ?** |
| Dépendance | qu'est-ce qui doit exister avant, et échappe au contrôle du projet ? |
| Risque | adoption, sécurité, politique, réputation |

Le critère décisif est l'exploitation. Un composant peu coûteux à construire mais exigeant une modération permanente, une équipe de support ou des déplacements d'agents devient une charge perpétuelle. C'est ce critère qui tue les plateformes publiques, pas la difficulté technique.

**Verdicts employés :** Noyau, Réduit, Différé, Externalisé, Écarté.

---

# 4. HYPOTHÈSE DE MOYENS

La faisabilité de plusieurs composants dépend entièrement d'une variable absente de REF-001 : l'équipe et le budget. Trois scénarios.

| Scénario | Moyens | Ce qui devient possible |
|---|---|---|
| A — Équipe restreinte sans mandat | 3 à 6 personnes, financement propre | dépôt documentaire, agenda, profils, preuves N0-N2 |
| B — Équipe avec mandat institutionnel | 8 à 15 personnes, convention avec au moins une administration | ajout des constats N3 pilotes, articulation SP/CNC, fédération WURI |
| C — Programme national financé | équipe pluriannuelle, ligne budgétaire, portage ministériel | ensemble du périmètre REF-001 sur 5 à 7 ans |

**Le reste de ce dossier est écrit dans l'hypothèse A**, seule hypothèse qui ne dépend d'aucune décision extérieure. Un projet conçu pour être utile en A et extensible vers B est robuste. Un projet qui n'existe qu'en C n'existe pas.

---

# 5. ANALYSE COMPOSANT PAR COMPOSANT

## 5.1 Identité et confiance (REF-001 point 7.1)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Compte, authentification, rôles | forte | faible | faible | aucune | **Noyau** |
| Fédération sur l'identifiant WURI | très forte | moyenne | faible | accès accordé, acte administratif | **Noyau différé** |
| Vérification d'identité propre (pièce, contrôle humain) | moyenne | moyenne | **élevée** | aucune | **Réduit** |
| Révocation et politiques | forte | faible | faible | aucune | **Noyau** |

**Décision structurante :** prévoir dès la conception le champ destiné au numéro d'identification national, mais ne jamais rendre la V1 dépendante de WURI. Une dépendance bloquante sur un programme extérieur est le meilleur moyen de ne rien livrer.

La vérification d'identité par contrôle humain de pièces est réduite : elle consomme du temps d'agent pour un gain limité tant que la fédération n'est pas obtenue.

## 5.2 Compétences et preuves (REF-001 point 7.2, REF-002)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Taxonomie des métiers | forte | faible | moyenne | Répertoire général des métiers | **Noyau, importé** |
| Taxonomie disciplinaire académique | forte | faible | moyenne | référentiel à choisir | **Noyau** |
| Dépôt d'artefacts et de liens | forte | faible | faible | stockage objet | **Noyau** |
| Preuves N1 et N2 | forte | faible | faible | aucune | **Noyau** |
| Preuve N3, constat de terrain | forte | faible | **très élevée** | agents désignés, acte administratif | **Pilote seul** |
| Preuve N4, titre d'État | très forte | faible | faible | convention SP/CNC | **Différé, sous convention** |

**Point sous-estimé :** l'effort de la taxonomie n'est pas technique. Importer un répertoire, l'aligner avec les disciplines académiques, le maintenir à jour et le rendre navigable par des icônes de métier est un travail de contenu de plusieurs mois-personne. Il ne doit pas être confié à des développeurs.

## 5.3 Portfolio et trajectoire (REF-001 point 7.3)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Profil, parcours, historique | forte | faible | faible | aucune | **Noyau** |
| Versionnement et non-effacement | forte | faible | faible | aucune | **Noyau** |

Composant le moins risqué du système. À construire tôt.

## 5.4 Réputation (REF-001 point 7.4)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Attestations attribuées et visibles | forte | faible | faible | aucune | **Noyau** |
| Score de réputation agrégé | faible à court terme | moyenne | moyenne | volume | **Différé, 24 mois minimum** |
| Badges | faible | faible | faible | aucune | **Écarté au démarrage** |

**Justification :** un score calculé sur un faible volume produit du bruit présenté comme de l'information, ce qui est pire que l'absence de score. REF-001 point 24.2 identifie le risque de sur-gamification ; la réponse la plus sûre est de n'afficher aucun agrégat pendant les premières années. Une attestation nominative, datée et attribuée est déjà un signal complet.

## 5.5 Opportunités et matching (REF-001 point 7.5, point 11)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Publication d'opportunités | forte | faible | moyenne | présence d'employeurs | **Noyau** |
| Candidature et suivi | forte | faible | faible | aucune | **Noyau** |
| Recherche à facettes | forte | faible | faible | aucune | **Noyau** |
| Matching algorithmique explicable | moyenne à court terme | **élevée** | moyenne | volume de données | **Différé** |

**Le vrai obstacle n'est pas technique.** Les employeurs ne viennent pas sans profils, les profils ne restent pas sans opportunités. Aucune architecture ne résout ce cercle. Il se résout par une décision commerciale ou administrative : obtenir qu'un acteur publiant déjà des offres en volume les publie ici.

Une recherche à facettes bien construite couvre le besoin réel pendant au moins trois ans. Le matching explicable est un projet en soi, à ne pas engager avant d'avoir des données.

## 5.6 Recherche, thèses, mémoires, publications (REF-001 point 7.6, point 8, point 9)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Dépôt et recherche de mémoires et thèses | **très forte** | faible | faible | accord d'établissement | **Noyau prioritaire** |
| Profils de chercheurs et d'auteurs | forte | faible | faible | aucune | **Noyau** |
| Gestion d'embargo et de niveaux d'accès | forte | faible | faible | aucune | **Noyau** |
| Identifiants pérennes externes (DOI) | moyenne | moyenne | moyenne | adhésion à un consortium, coût récurrent | **Réduit** |
| Chaîne éditoriale de revue par les pairs | moyenne | **élevée** | élevée | comités éditoriaux | **Externalisé** |

**C'est le meilleur point d'entrée du projet, et REF-001 ne le traite pas comme tel.** Raisons :

- le contenu existe déjà, sur les disques durs des établissements ; il n'y a pas de démarrage à froid ;
- la demande institutionnelle est réelle et ancienne ;
- des logiciels éprouvés existent, ce qui réduit fortement le coût de construction ;
- la livraison est visible et démontrable en quelques mois.

**Risque à traiter honnêtement :** la résistance au dépôt existe, motivée par la crainte du plagiat et par l'incertitude sur les droits. La réponse est la gestion fine de l'embargo et une politique de dépôt écrite, négociée établissement par établissement.

La chaîne éditoriale complète est écartée du périmètre propre : des solutions ouvertes matures existent pour cela et rien ne justifie de les réécrire.

## 5.7 Événements de savoir (REF-001 point 7.7, point 10)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Agenda national des événements | forte | **très faible** | faible | aucune | **Noyau, première version** |
| Fiche et archive d'événement | forte | faible | faible | aucune | **Noyau** |
| Hébergement de vidéos | moyenne | moyenne | **élevée** | stockage et bande passante | **Écarté, renvoi vers l'externe** |
| Inscription et billetterie | faible | moyenne | moyenne | aucune | **Différé** |

C'est le composant au meilleur rapport valeur sur coût de tout le périmètre. Il est utile dès le premier jour, sans masse critique d'utilisateurs, et constitue un vecteur d'acquisition naturel vers le reste du système.

L'hébergement vidéo est écarté : le coût de stockage et de bande passante est disproportionné par rapport au bénéfice, et des plateformes externes assurent déjà cette fonction. Référencer le lien suffit.

## 5.8 Communautés et espaces de travail (REF-001 point 7.8, point 12)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Communautés et discussions | moyenne | moyenne | **très élevée** | modération | **Différé** |
| Mentorat, mise en relation simple | forte | faible | faible | aucune | **Réduit, conservé** |
| Environnement de code intégré | faible | **très élevée** | élevée | — | **Écarté** |
| Espace juridique, simulation de plaidoirie | faible | **très élevée** | élevée | — | **Écarté** |
| Tableaux de bord économiques et simulations | faible | **très élevée** | élevée | — | **Écarté** |
| Espace de travail scientifique, bibliographie | faible | élevée | moyenne | — | **Écarté** |

**Justification du retrait le plus important de ce dossier.** REF-001 point 12 décrit quatre environnements de travail verticaux. Chacun est un produit logiciel complet, en concurrence avec des outils mondiaux gratuits et matures. Les construire consommerait la totalité de la capacité d'ingénierie du projet sans produire aucune différenciation.

**Remplacement proposé :** SYNAPSE ne fournit pas l'atelier de travail, il en indexe les productions. Un dépôt de code externe, un carnet d'analyse, un dossier partagé sont rattachés au profil comme preuves de niveau N1. La valeur recherchée par point 12 est conservée ; le coût disparaît.

La modération des communautés est la charge récurrente la plus lourde et la plus souvent sous-estimée dans ce type de plateforme. Elle est différée jusqu'à ce qu'une population justifie l'embauche de modérateurs.

## 5.9 Débat structuré (REF-001 point 13)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| Représentation thèse, argument, objection, synthèse | incertaine | élevée | **très élevée** | masse critique intellectuelle | **Écarté du noyau** |

L'idée est intellectuellement solide. Sa réalisation exige simultanément une masse critique de contributeurs disciplinés et une modération experte permanente. Les tentatives comparables à l'échelle mondiale ont un antécédent d'adoption faible. À conserver comme perspective, jamais comme composant de démarrage.

## 5.10 Gouvernance, audit, conformité (REF-001 point 7.9, point 21, point 22)

| Composant | Valeur | Construction | Exploitation | Dépendance | Verdict |
|---|---|---|---|---|---|
| RBAC et politiques d'accès | forte | faible | faible | aucune | **Noyau** |
| Journal d'audit des opérations sensibles | forte | faible | faible | aucune | **Noyau, dès le premier jour** |
| Séparation statistique agrégée / requête nominative | **critique** | moyenne | faible | aucune | **Noyau, non négociable** |
| Niveaux de publication (REF-001 point 21) | forte | faible | faible | aucune | **Noyau** |
| Gouvernance institutionnelle formalisée | forte | — | — | portage juridique | **Bloqué hors du système** |

L'audit est peu coûteux s'il est construit dès l'origine et très coûteux s'il est ajouté après. C'est la raison de son classement en noyau malgré une valeur non visible par l'utilisateur.

La séparation entre consultation agrégée et consultation nominative est maintenue comme frontière technique et non comme règle de procédure. Une règle écrite se contourne ; une frontière technique laisse une trace.

---

# 6. PILE TECHNIQUE

REF-001 point 24.5 identifie la complexité excessive comme risque majeur. La pile décrite au point 15 et point 16 **est** cette complexité. Elle correspond à une organisation de quinze à vingt-cinq ingénieurs répartis en équipes spécialisées.

| Orientation REF-001 | Analyse | Verdict |
|---|---|---|
| Next.js, TypeScript, PWA | justifié ; la PWA répond à une contrainte réelle de connectivité | **Conservé** |
| Micro-frontends | suppose plusieurs équipes frontend distinctes | **Écarté** |
| Go, Rust, TypeScript et Python en backend | quatre écosystèmes à maintenir ; le bassin de recrutement local en Rust est très étroit et le facteur de bus critique | **Réduit à un seul langage backend** |
| gRPC, Protocol Buffers, HTTP/2 en interne | outillage et friction de débogage sans bénéfice à cette échelle | **Différé** |
| CQRS | séparation lecture-écriture utile sur un domaine à forte charge, prématurée partout ailleurs | **Écarté au démarrage** |
| Event-driven, bus d'événements | remplaçable par une table de sortie dans PostgreSQL ; économise un rôle d'exploitation entier | **Réduit** |
| Architecture en cellules | conçue pour des échelles sans rapport avec le besoin | **Écarté** |
| PostgreSQL | source de vérité | **Noyau** |
| Redis | utile, mais un service de plus à exploiter ; cache applicatif d'abord | **Différé** |
| Elasticsearch | la recherche plein texte de PostgreSQL suffit plusieurs années ; un cluster de recherche coûte en mémoire et en compétence de réglage | **Différé** |
| Stockage objet | indispensable pour documents, photos et preuves | **Noyau** |
| Zero Trust, mTLS interne | TLS, RBAC, chiffrement au repos et journalisation : oui ; mTLS entre trois services : prématuré | **Réduit** |
| Frontières métier issues du domaine | à conserver intégralement, mais comme organisation du code | **Conservé** |

## 6.1 Orientation recommandée

> **Monolithe modulaire, frontières métier strictes dans le code, PostgreSQL comme socle, un seul langage backend, extraction en services uniquement lorsqu'une frontière démontre son besoin par la mesure.**

Cette orientation ne contredit pas REF-001 point 15.2 et point 15.6 : elle en conserve les frontières et en diffère le déploiement distribué, ce que le point 24.5 recommande explicitement.

## 6.2 Choix du langage backend

Ce choix ne doit pas être arbitré sur des critères de performance. Il doit être arbitré sur la question suivante : **quel langage l'équipe réellement recrutable à Ouagadougou maîtrise-t-elle déjà ?** Un système écrit dans un langage que trois personnes du pays maîtrisent est un système qui s'arrête au premier départ.

---

# 7. LISTE DES RETRAITS

Récapitulatif des composants retirés du périmètre de démarrage, avec le motif dominant.

| Retiré | Motif |
|---|---|
| Environnements de travail verticaux (code, droit, finance, recherche) | quatre produits complets, aucune différenciation, outils externes matures |
| Débat structuré | masse critique et modération experte requises |
| Hébergement vidéo | coût de stockage et de bande passante disproportionné |
| Score de réputation agrégé | bruit à faible volume, risque de gamification |
| Badges | même motif |
| Architecture en cellules, micro-frontends, CQRS | complexité sans échelle correspondante |
| Pile polyglotte Go, Rust, TypeScript, Python | quatre écosystèmes, recrutement impossible, facteur de bus critique |
| Chaîne éditoriale de revue par les pairs | solutions ouvertes matures disponibles |
| Bus d'événements, Elasticsearch, Redis en V1 | services d'exploitation supplémentaires, besoin non démontré |

Aucun de ces retraits n'est définitif. Chacun peut être réintroduit lorsqu'un besoin mesuré le justifie.

---

# 8. CONTRAINTES NON TECHNIQUES DÉCISIVES

## 8.1 Équipe

Facteur de faisabilité principal, absent de REF-001. L'écart entre la pile décrite et une équipe réelle de quatre à six personnes est le risque le plus élevé du projet.

Contrainte spécifique au contexte : les développeurs expérimentés sont fortement sollicités par le travail à distance rémunéré en devises. La rotation doit être anticipée par la documentation, la simplicité de la pile et l'absence de composant maîtrisé par une seule personne.

## 8.2 Hébergement

Favorable, voir le point 2.1. Décision à prendre : cloud gouvernemental, hébergeur privé local, ou combinaison. L'alignement sur le cloud gouvernemental est cohérent avec la nature revendiquée du projet.

## 8.3 Chemin critique administratif

Le chemin critique de SYNAPSE n'est pas technique. Quatre actes conditionnent l'essentiel du périmètre :

1. convention avec le SP/CNC pour l'articulation avec la certification ;
2. décision de dépôt des mémoires et thèses, au moins dans un établissement ;
3. autorisation d'accès à l'identifiant WURI ;
4. désignation des agents habilités au constat de terrain.

Aucun ne dépend du code. Tous doivent être engagés en parallèle du développement, non après.

## 8.4 Couverture territoriale

Le constat de terrain n'est pas réalisable sur l'ensemble du territoire dans les conditions de sécurité actuelles. Le système ne doit pas être conçu en supposant une couverture nationale uniforme, et les indicateurs ne doivent pas traiter l'absence de couverture comme un échec d'adoption.

## 8.5 Financement récurrent

Absent de REF-001 et non résolu par ce dossier. Il faut distinguer le coût d'investissement, ponctuel et finançable par projet, du coût récurrent d'hébergement, de salaires, de temps d'agent et de modération. C'est le second qui détermine la survie de la plateforme après la fin du premier financement.

---

# 9. NOYAU RETENU

Périmètre réellement livrable dans l'hypothèse A, sur une durée estimée de neuf à douze mois.

1. Identité, comptes, rôles, révocation, champ d'identifiant national prévu mais non bloquant.
2. Profil et portfolio, avec historique non effaçable.
3. Dépôt, indexation et recherche de mémoires et de thèses, sur un à deux établissements, avec gestion d'embargo.
4. Agenda national des événements de savoir, ouvert et alimenté dès le premier jour.
5. Preuves de niveaux N0 à N2, avec attestations nominatives et sans score agrégé.
6. Publication d'opportunités, candidature, recherche à facettes.
7. Journal d'audit, RBAC, séparation technique entre consultation agrégée et consultation nominative.

Tout le reste attend une mesure ou un acte administratif.

---

# 10. SÉQUENCE

| Étape | Contenu | Condition de passage à l'étape suivante |
|---|---|---|
| 1 | Noyau point 9, un établissement, agenda national | dépôt effectif de documents et usage réel de l'agenda |
| 2 | Extension à d'autres établissements, ouverture aux employeurs | des opportunités sont publiées par des tiers |
| 3 | Pilote preuve de terrain, un métier, une ville, sous convention | réponse aux quatre questions de REF-002 point 10.2 |
| 4 | Articulation SP/CNC, passage vers N4 | titres effectivement délivrés à des profils issus du système |
| 5 | Fédération WURI, matching, communautés | volume et mandat obtenus |

**Règle :** aucune étape ne s'ouvre parce que la précédente est techniquement terminée. Elle s'ouvre parce que la précédente a produit un usage mesuré.

---

# 11. POINTS DE DÉCISION RESTANTS

| Question | Pourquoi elle bloque |
|---|---|
| Quelle structure porte juridiquement le projet | conditionne les quatre actes du point 8.3 |
| Quel modèle de financement récurrent | détermine la survie après le premier financement |
| Quel chantier national de rattachement | détermine la vitesse d'arbitrage |
| Quel établissement pilote pour le dépôt documentaire | détermine la date de la première livraison utile |
| Quelle équipe réellement disponible | détermine le langage, la pile et le périmètre atteignable |
| Traitement des profils de mineurs au regard de la loi n°001-2021 | préalable à toute collecte concernant des élèves |

---

# 12. CONCLUSION

Le périmètre décrit dans SYNAPSE-REF-001 est cohérent mais n'est pas réalisable tel quel par une équipe restreinte. Il le devient si trois familles de composants sont retirées : les environnements de travail verticaux, les mécanismes exigeant une masse critique, et la complexité d'infrastructure sans échelle correspondante.

Ce qui reste après ces retraits n'est pas une version dégradée du projet. C'est un système cohérent, livrable, immédiatement utile à des acteurs identifiés, et compatible avec l'intégralité de la vision cible de REF-001 point 26.

> La question n'est pas de savoir si SYNAPSE peut tout faire. C'est de savoir ce qu'il doit faire d'abord pour avoir le droit de faire le reste.
