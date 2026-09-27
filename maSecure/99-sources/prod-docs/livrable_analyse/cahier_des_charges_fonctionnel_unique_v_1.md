# Cahier des charges fonctionnel unique
## Plateforme communautaire de cotisation, tontine et gestion de biens

**Version :** V1

**Statut :** Document de référence fonctionnelle

**Objet :** Définir de manière formelle les besoins métier, les cas d’usage et les règles fonctionnelles de la plateforme, sans détailler l’architecture technique ni les choix d’implémentation.

---

## 1. Contexte et vision du produit

La plateforme répond aux besoins de groupes communautaires, sociaux et économiques qui souhaitent organiser :

- des tontines rotatives d’argent ;
- des cotisations collectives à objectif unique ;
- des cotisations en nature ;
- des partenariats de fourniture et de distribution ;
- des mécanismes de traçabilité et de gouvernance partagée.

Le produit doit permettre une gestion plus sûre, plus transparente et plus accessible que les pratiques manuelles classiques.

---

## 2. Objectifs fonctionnels

La plateforme doit permettre de :

1. créer et gérer plusieurs types de groupes de contribution ;
2. suivre les cotisations des membres de manière claire et persistante ;
3. gérer des règles de fonctionnement définies à la création du groupe ;
4. faciliter les rappels, les votes, les validations et les décisions collectives ;
5. suivre les versements, les distributions ou les livraisons selon le type de groupe ;
6. tracer toutes les opérations importantes ;
7. réduire les risques d’erreur, de conflit, de fraude et d’oubli ;
8. rendre le service accessible à des utilisateurs peu lettrés ou peu à l’aise avec les outils numériques.

---

## 3. Périmètre fonctionnel

Le produit couvre les modèles suivants :

### 3.1. Tontine rotative d’argent
Chaque membre cotise périodiquement et le total est versé à un membre selon un ordre défini.

### 3.2. Cotisation sociale non rotative
Chaque membre cotise pour atteindre un objectif collectif à une date donnée.

### 3.3. Cotisation en nature
Les membres apportent des biens matériels ou des équivalents définis par le groupe.

### 3.4. Gestion des partenaires
Des partenaires peuvent fournir, livrer ou distribuer les biens associés aux cotisations.

### 3.5. Gouvernance collective
Les membres peuvent valider certaines décisions sensibles selon les règles du groupe.

---

## 4. Acteurs du système

### 4.1. Administrateur plateforme
Gère les paramètres globaux, la supervision, le support, les partenaires et les contrôles internes.

### 4.2. Responsable de groupe
Crée et configure un groupe, suit les membres et supervise les opérations selon les droits accordés.

### 4.3. Membre
Participe aux cotisations, consulte son état, reçoit les notifications et peut voter lorsqu’il est autorisé.

### 4.4. Partenaire
Intervient pour fournir un service, un bien ou une logistique liée à un groupe.

### 4.5. Système
Exécute les règles, déclenche les rappels, calcule les états et conserve les traces.

---

## 5. Types de groupes supportés

### 5.1. Groupe de tontine rotative
Groupe dans lequel le montant collecté est versé à tour de rôle à un membre.

### 5.2. Groupe de cotisation sociale
Groupe qui collecte des fonds pour un objectif précis sans rotation des versements.

### 5.3. Groupe de cotisation en nature
Groupe qui collecte des biens matériels ou organise une conversion financière vers des biens.

### 5.4. Groupe hybride
Groupe pouvant combiner certaines règles de suivi, de validation ou de partenariat tout en restant rattaché à un type principal.

---

## 6. Fonctions fonctionnelles globales

La plateforme doit au minimum permettre les fonctions suivantes :

- inscription et authentification des utilisateurs ;
- création de groupes ;
- ajout et gestion de membres ;
- configuration des règles du groupe ;
- suivi des cotisations ;
- gestion des calendriers ;
- émission de rappels ;
- gestion des votes ;
- suivi des versements ou distributions ;
- gestion des difficultés ;
- suspension, quarantaine, réintégration ;
- consultation de l’historique ;
- gestion des partenaires ;
- audit des opérations.

---

## 7. Fonctionnement général par module métier

### 7.1. Socle commun
Le socle commun regroupe les fonctions partagées par tous les modèles :

- gestion des comptes ;
- gestion des groupes ;
- gestion des rôles ;
- notifications ;
- audit ;
- journalisation ;
- traçabilité ;
- consultation des états.

### 7.2. Tontine rotative
Ce module gère :

- la cotisation périodique ;
- l’ordre de passage ;
- la clôture des paiements ;
- le versement au bénéficiaire ;
- le fonds de couverture ;
- le fonds de recouvrement ;
- la suspension et la réintégration ;
- l’ajout, le retrait ou le remplacement de membres.

### 7.3. Cotisation sociale
Ce module gère :

- un objectif collectif ;
- une date de clôture ;
- un suivi des apports ;
- un état d’avancement ;
- un rapport final ;
- la traçabilité des contributions.

### 7.4. Cotisation en nature
Ce module gère :

- le type de bien ;
- l’unité ;
- la quantité ;
- le suivi de livraison ;
- la récupération ou distribution ;
- les preuves associées.

### 7.5. Partenaires
Ce module gère :

- le choix du fournisseur ;
- les conditions ;
- les quantités ;
- les livraisons ;
- les points de remise ;
- la preuve de réalisation.

---

## 8. Règles de gestion principales

### 8.1. Règle de transparence
Toute action importante doit être visible, historisée et consultable par les personnes autorisées.

### 8.2. Règle de gouvernance
Les décisions sensibles doivent être validées selon la règle définie à la création du groupe.

### 8.3. Règle de non-confusion des modules
Les règles d’un type de groupe ne doivent pas être appliquées automatiquement à un autre type de groupe.

### 8.4. Règle de clôture journalière
Dans la tontine rotative, la collecte peut rester ouverte pendant la journée jusqu’à l’heure de clôture définie ; le versement final intervient dans la fenêtre fixée par le groupe, par défaut en soirée.

### 8.5. Règle de dette
Une dette peut être étalée sur un maximum de deux cycles. Au-delà, la situation est traitée par les règles de suspension ou de quarantaine prévues.

### 8.6. Règle de difficulté
Une difficulté ne peut pas être traitée uniquement sur simple déclaration individuelle ; elle doit être visible, signalée et validée selon le protocole prévu.

### 8.7. Règle de départ
Le départ d’un membre après réception de son tour est soumis aux conditions prévues par le groupe.

---

## 9. Gestion des cotisations

### 9.1. Cotisation d’argent
Le système doit enregistrer :

- le membre payeur ;
- le montant ;
- la date ;
- le cycle ;
- le statut du paiement ;
- la preuve de réception.

### 9.2. Cotisation sociale
Le système doit afficher :

- l’objectif du groupe ;
- le montant attendu ;
- la somme déjà collectée ;
- la somme restante ;
- la date cible.

### 9.3. Cotisation en nature
Le système doit afficher :

- le bien attendu ;
- l’unité ;
- la quantité promise ;
- la quantité reçue ;
- la quantité restante ;
- la date de livraison.

---

## 10. Gestion des tours dans la tontine rotative

10.1. Le groupe définit un ordre de passage au départ.

10.2. L’ordre peut être modifié uniquement selon les règles prévues.

10.3. Un nouveau membre ajouté en cours de cycle prend normalement la dernière position disponible.

10.4. Un membre retiré provoque un recalage de l’ordre.

10.5. Un remplacement de membre doit suivre la procédure de validation définie.

10.6. Le bénéficiaire du tour ne doit pas être privé de son droit sans raison prévue par les règles du groupe.

---

## 11. Gestion du fonds de couverture

11.1. Le fonds de couverture est optionnel.

11.2. Son existence est décidée à la création du groupe.

11.3. Son mode d’utilisation est également choisi au départ : automatique ou par vote.

11.4. Si le mode automatique est choisi, le système peut agir dans la fenêtre horaire fixée par le groupe.

11.5. Le fonds de couverture sert à éviter la rupture du cycle lorsqu’un ou plusieurs paiements manquent.

11.6. Les conditions de déclenchement doivent être connues à l’avance.

---

## 12. Gestion du fonds de recouvrement

12.1. Le fonds de recouvrement sert à régulariser une dette ou à permettre la réintégration d’un membre.

12.2. Son montant ou son mode de calcul est défini à la création du groupe.

12.3. La réintégration d’un membre peut nécessiter le paiement de ce fonds.

12.4. Le fonds de recouvrement peut être appliqué comme pénalité ou comme mécanisme de régularisation selon le modèle choisi.

---

## 13. Gestion des difficultés et des retards

13.1. Le système doit avertir les membres avant l’échéance.

13.2. Les difficultés déclarées doivent être visibles au groupe selon le protocole prévu.

13.3. Le groupe peut valider ou refuser l’activation d’un mécanisme d’assistance.

13.4. Une difficulté non validée peut conduire à l’application des règles normales de retard.

13.5. Le système doit éviter les usages abusifs des déclarations de difficulté.

---

## 14. Suspension, quarantaine et réintégration

14.1. Un membre peut être suspendu en cas de retard prolongé ou de dette non régularisée.

14.2. Un membre placé en quarantaine reste rattaché au groupe mais ne participe plus au cycle courant tant qu’il n’a pas régularisé.

14.3. La réintégration est possible selon les règles du groupe.

14.4. Le retour d’un membre doit être traçable et justifié.

---

## 15. Départ, remplacement et exclusion

15.1. Le départ volontaire peut être autorisé selon les règles définies.

15.2. Le remplacement d’un membre doit être validé.

15.3. L’exclusion définitive est un cas de dernier recours, si le groupe l’a prévu.

15.4. Le système doit conserver la trace du motif et de la décision.

---

## 16. Votes et validations

16.1. Les décisions sensibles peuvent passer par vote.

16.2. Le vote peut concerner :
- l’utilisation du fonds ;
- la modification du calendrier ;
- un échange de place ;
- un remplacement ;
- la validation d’une difficulté.

16.3. Le système doit conserver le résultat du vote et son historique.

---

## 17. Notifications

17.1. Le système doit envoyer des notifications sur les événements importants.

17.2. Les notifications peuvent concerner :
- les rappels de paiement ;
- les votes ;
- les retards ;
- les validations ;
- les changements de statut ;
- les confirmations de versement ou de distribution.

17.3. Les canaux de notification doivent être adaptés au contexte des utilisateurs.

---

## 18. Traçabilité et historique

18.1. Toutes les opérations importantes doivent être historisées.

18.2. L’historique doit permettre de savoir :
- qui a fait quoi ;
- quand ;
- dans quel groupe ;
- selon quelle règle ;
- avec quel résultat.

18.3. Les membres autorisés doivent pouvoir consulter les traces.

---

## 19. Cas d’usage principaux

### 19.1. Tontine rotative
- création du groupe ;
- définition de l’ordre ;
- collecte des cotisations ;
- versement au bénéficiaire ;
- ajout d’un nouveau membre ;
- suspension d’un membre ;
- réintégration après régularisation.

### 19.2. Cotisation sociale
- création d’un groupe pour une fête, une dépense ou un achat commun ;
- collecte progressive ;
- consultation de l’avancement ;
- clôture à la date fixée.

### 19.3. Cotisation en nature
- création d’un groupe de contribution en biens ;
- définition du bien ;
- association d’un partenaire ;
- livraison ou retrait ;
- clôture avec preuve.

---

## 20. Exigences de simplicité d’usage

20.1. La plateforme doit être compréhensible par des utilisateurs peu lettrés.

20.2. Les écrans doivent rester simples, clairs et orientés vers l’action.

20.3. Les messages doivent être courts, précis et adaptés au contexte local.

20.4. Les notifications vocales ou simplifiées peuvent être prévues selon les besoins.

---

## 21. Limites du présent document

21.1. Le présent document décrit les besoins fonctionnels du produit.

21.2. Il ne définit pas l’architecture technique détaillée.

21.3. Il ne définit pas les schémas de base de données.

21.4. Il ne définit pas les APIs.

21.5. Ces éléments seront traités dans le cahier des charges technique et les livrables associés.

---

## 22. Prochaines étapes

Le prochain livrable devra couvrir :

- l’architecture détaillée ;
- le modèle de données ;
- les rôles et permissions ;
- les APIs ;
- les écrans ;
- les règles de sécurité et d’intégration.

