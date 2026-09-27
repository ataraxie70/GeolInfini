# Community Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-COMMUNITY-001

---

# 1. Objet

Le **Community Context** est le Bounded Context de la couche Platform Services responsable de la gestion des interactions sociales, de la modélisation des profils publics, de la structuration des groupes d'apprentissage (guildes), des espaces d'entraide et du partage d'accomplissements entre les membres de la plateforme LevelUP.

Il encourage la collaboration et le tutorat par les pairs tout en limitant les dérives distractives des réseaux sociaux traditionnels.

---

# 2. Mission

Fournir un espace communautaire d'apprentissage et d'entraide structuré, permettant aux apprenants de se regrouper par centres d'intérêt (domaines de compétences), de s'entraider sur des points bloquants et de partager leurs réalisations pour s'encourager mutuellement.

---

# 3. Position dans l'écosystème

Le Community Context appartient à la **Platform Services Layer**.

Il consomme les informations du **Portfolio Context** (réalisations et validations publiables) et du **Competency / Knowledge Contexts** (pour lier ses espaces d'entraide à des concepts officiels du référentiel).

---

# 4. Vision métier

LevelUP n'est pas un réseau social de divertissement. La communauté doit être conçue comme un outil d'accompagnement de la progression, axé sur la rigueur et la collaboration. Ses principes directeurs sont :
1.  **L'entraide contextuelle :** Les discussions et questions/réponses doivent être rattachées directement à des compétences ou connaissances du référentiel (pas de bavardage hors-sujet).
2.  **La valorisation du partage par la preuve :** Les partages de réussite au sein du réseau doivent obligatoirement s'appuyer sur des preuves concrètes issues du Portfolio (pas d'affirmations sans fondement).
3.  **Le tutorat par les pairs :** Le système encourage ceux qui ont validé une compétence à guider socratiquement ceux qui débutent, valorisant la transmission du savoir.

---

# 5. Responsabilités

Le Community Context est responsable de :

*   gérer les profils communautaires des apprenants (`Learner Community Profiles`) ;
*   gérer les espaces de groupes et de guildes d'apprentissage (`Learning Groups`) ;
*   gérer les espaces d'entraide et les discussions thématiques (`Help Requests`, `Forum Topics`) liés aux compétences ;
*   faciliter la mise en relation pour le tutorat par les pairs (Peer Matching) ;
*   gérer la publication d'annonces de réussite (`Community Achievements`) ;
*   gérer le cycle de vie des défis entre pairs (`Peer Challenges`).

Il n'est jamais responsable :
*   de stocker les fichiers médias originaux (responsabilité du `Media Context`) ;
*   d'évaluer officiellement le niveau de maîtrise d'un membre (responsabilité du `Assessment Context`).

---

# 6. Ubiquitous Language

## Learner Community Profile
Profil visible par les pairs, détaillant les compétences validées, les contributions d'entraide et les groupes rejoints par un apprenant.

## Learning Group (ou Guilde)
Collectif d'apprenants se regroupant de manière temporaire ou permanente pour travailler ensemble sur un domaine de compétence spécifique (ex: Guilde Linux SysAdmin).

## Forum Topic
Fil de discussion et d'échange de ressources directement associé à une compétence (`CompetencyId`) ou à une notion (`KnowledgeId`).

## Help Request
Demande d'aide ciblée sur un point de blocage précis d'un exercice ou d'un cours, notifiée aux membres du groupe ayant déjà validé la notion.

## Community Achievement
Message partagé célébrant la validation officielle d'un jalon ou d'une compétence, obligatoirement étayé par une preuve d'évaluation publique.

## Peer Challenge
Défi d'apprentissage lancé par un apprenant à un autre apprenant (ou groupe) sur un objectif d'apprentissage précis (compétence, routine) et associé à un délai de réalisation strict.

## Challenge Status
État courant du défi (`Offered`, `Accepted`, `Declined`, `Active`, `Succeeded`, `Failed`, `Expired`).

---

# 7. Modèle métier

```text
Portfolio Context (Validation publique) ──► émet ──┐
                                                    ▼
                                        [ Community Engine ]
                                                    │
                                     ├── gère ──► Learner Profiles
                                     ├── gère ──► Learning Groups / Guildes
                                     ├── gère ──► Help Requests & Topics
                                     └── gère ──► Peer Challenges
                                                    │
                                                    ▼
                                         [ Peer Matching Engine ]
                                                    │
                                                    ▼
                                         Mise en relation des pairs
```

---

# 8. Principes métier

## Principe 1 — Respect de la vie privée par défaut
Toutes les données de progression sont privées par défaut. L'apprenant doit choisir explicitement les compétences et preuves qu'il souhaite rendre visibles sur son profil communautaire.

## Principe 2 — Ancrage pédagogique obligatoire
Toute création de sujet de discussion (`ForumTopic`), de demande d'entraide (`HelpRequest`) ou de défi (`PeerChallenge`) doit être associée à un identifiant URN de compétence ou de domaine valide du référentiel.

## Principe 3 — Encourager la transmission
Le système valorise l'entraide en attribuant des points cosmétiques de contribution aux membres qui apportent des réponses validées par l'auteur d'une demande d'aide.

## Principe 4 — Valorisation saine des défis
Les défis encouragent le dépassement de soi sans pénaliser l'apprentissage. La réussite d'un défi génère une preuve de réussite ajoutée au Portfolio de l'apprenant dans un volet dédié. L'échec ou l'expiration d'un défi accepté est simplement historisé de manière factuelle sans impact sur son score de maîtrise académique.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **LearningGroup :** Racine d'agrégat représentant un groupe d'apprenants, modélisant ses membres, ses règles de modération et ses fils de discussion.
*   **LearnerCommunityProfile :** Racine d'agrégat modélisant l'identité communautaire de l'apprenant et ses préférences de visibilité sociale.
*   **PeerChallenge :** Racine d'agrégat modélisant un défi entre pairs, son état, son objectif, son émetteur, son destinataire et ses limites temporelles.

## 9.2 Entités
*   **HelpRequest :** Demande de soutien technique/pédagogique unitaire.
*   **ForumTopic :** Fil de discussion contextualisé.
*   **Member :** Représentation d'un utilisateur au sein d'un groupe avec son rôle.

## 9.3 Value Objects
*   **GroupId / TopicId / ChallengeId :** Identifiants uniques.
*   **MemberRole :** Rôles dans le groupe (`Leader`, `Moderator`, `Learner`).
*   **ProfileVisibility :** Niveaux de confidentialité (`Private`, `GuildOnly`, `Public`).
*   **ChallengeGoal :** L'objectif ciblé (ex: acquérir `competency:linux:bash` ou compléter `N` activités).

## 9.4 Domain Services
*   **PeerMatchingEngine :** Algorithme de ciblage associant une `HelpRequest` d'un membre bloqué avec des `Members` volontaires ayant déjà validé la notion.
*   **ChallengeEvaluator :** Service de domaine qui surveille les événements de l'écosystème pour valider la réussite ou l'échec d'un défi actif dans le délai imparti.
*   **ContentModerator :** Service d'aide à la modération du langage et du spam.

## 9.5 Domain Events
*   **LearningGroupCreated :** Création d'une nouvelle guilde.
*   **MemberJoinedGroup :** Un membre a rejoint le groupe.
*   **HelpRequestPublished :** Une demande d'aide a été diffusée au groupe.
*   **HelpRequestResolved :** L'auteur a marqué sa demande d'aide comme résolue grâce à un pair.
*   **AchievementShared :** Publication d'une réussite sur le fil communautaire.
*   **ChallengeOffered :** Un défi a été envoyé à un destinataire.
*   **ChallengeAccepted :** Le destinataire a accepté le défi.
*   **ChallengeSucceeded :** Le défi a été réalisé avec succès dans le délai.
*   **ChallengeFailed :** Le défi a échoué ou a expiré.

---

# 10. Invariants

1.  Une demande d'entraide (`HelpRequest`) ne peut être publiée que si elle est associée à un `CompetencyId` ou `ResourceId` valide.
2.  Un membre ne peut pas rejoindre un groupe privé (`LearningGroup`) sans une invitation valide ou l'approbation d'un modérateur/leader du groupe.
3.  Toute publication de réussite (`CommunityAchievement`) doit pointer vers un identifiant d'évaluation publique valide de l'apprenant.
4.  Un défi (`PeerChallenge`) ne peut pas être auto-adressé (l'émetteur et le destinataire doivent être distincts).
5.  Le délai d'un défi actif doit être strictement supérieur à zéro et son échéance finale ne peut être modifiée après acceptation.

---

# 11. Relations avec les autres Bounded Contexts

*   **Portfolio Context :** Fournit les données de validation et de réalisations pour le profil communautaire, et reçoit les preuves de réussite de défis (`Challenge Evidence`) à ajouter au Portfolio.
*   **Competency Context :** Fournit le référentiel des domaines et compétences pour catégoriser les fils de discussion et définir les objectifs de défis.
*   **Activity Context & Progress Context :** Émettent les événements d'achèvement d'activités et d'évolution de maîtrise permettant à l' `ChallengeEvaluator` d'évaluer l'état du défi.
*   **Notification Context :** Déclenche les alertes de demandes d'entraide et d'invitations à des défis.

---

# 12. Décisions architecturales

Le Community Context gère sa propre persistance pour les profils, les discussions et les structures de groupes, isolant ces données sociales de la couche métier d'exécution d'apprentissage (couplage faible). 

Les fonctionnalités de messagerie directe en temps réel et de gestion de forums peuvent s'appuyer sur des briques technologiques tierces, dissimulées derrière l'infrastructure de ce domaine.

---

# 13. Spécification Détaillée des Défis entre pairs (Peer Challenges)

## 13.1 Périmètre des Objectifs de Défis (Challenge Targets)
Un défi entre pairs (`PeerChallenge`) ne peut pas porter sur des objectifs génériques ou abstraits. Il doit cibler explicitement un élément mesurable et traçable de l'écosystème LevelUP :

*   **Objectif Compétence (CompetencyTarget) :** Réussir à acquérir et faire valider une compétence spécifique (`CompetencyId`) du référentiel officiel.
*   **Objectif Mission (MissionTarget) :** Compléter avec succès une mission pratique ou d'évaluation spécifique (`MissionId`) émise par le `Assessment Context`.
*   **Objectif Lab / Activité (ActivityTarget) :** Exécuter et terminer un laboratoire ou une activité d'apprentissage spécifique (`ActivityId`) issu de la file d'attente d'activités.
*   **Objectif Connaissance / Quiz (KnowledgeTarget) :** Réussir un questionnaire d'évaluation de connaissances ou de révision lié à un identifiant de connaissance (`KnowledgeId`).
*   **Objectif Discipline (DisciplineTarget) :** Atteindre ou maintenir une série quotidienne (`Daily Streak`) de `N` jours consécutifs d'activités sans interruption, ou accumuler un nombre `H` d'heures d'apprentissage sur la période.

## 13.2 États et Cycle de vie Temporel des Défis
Tout défi comporte deux phases temporelles strictes (non éternelles) définies lors de l'émission :

1.  **Délai d'Acceptation (Acceptance Window) :** Plage horaire (ex: 24h ou 48h) durant laquelle le destinataire doit réagir à l'offre.
    *   Si le destinataire clique sur "Accepter", le défi passe à l'état `Active`.
    *   Si le destinataire clique sur "Refuser", le défi passe à l'état `Declined`. Aucun historique négatif n'est retenu (respect du rythme personnel).
    *   Si le délai expire sans action, le défi passe à l'état `Expired` (Expiré / Manqué).
2.  **Délai d'Exécution (Execution Window) :** Temps imparti pour réaliser l'objectif une fois accepté (ex: 3 jours, 1 semaine).
    *   Si le `ChallengeEvaluator` valide l'atteinte de l'objectif avant la fin du délai, le défi passe à l'état `Succeeded` (Réussi).
    *   Si le délai de l'évaluation expire sans que l'objectif ne soit validé, le défi passe à l'état `Failed` (Échoué / Manqué).

```text
               [ Draft / Offert ]
                       │
       ┌───────────────┼───────────────┐
       ▼               ▼               ▼
   [ Accepté ]    [ Refusé ]      [ Non accepté ]
 (État: Active) (État: Declined) (Délai expiré ➔ État: Expired)
       │
       ├───────────────────────┐
       ▼                       ▼
  [ Objectif atteint ]    [ Échéance dépassée ]
  (État: Succeeded)       (État: Failed)
```

## 13.3 Évaluation, Restitution et Conséquences (Outcomes)
*   **En cas de Succès (Succeeded) :** 
    *   Publication automatique d'un événement `ChallengeSucceeded`.
    *   Génération d'une preuve de réussite spécifique (`ChallengeEvidence`) transmise au **Portfolio Context**. Elle est affichée publiquement dans l'espace communautaire et dans la section "Défis" du Portfolio de l'apprenant.
    *   Attribution de bonus d'expérience (Gamification Context).
*   **En cas d'Échec ou d'Expiration (Failed / Expired) :**
    *   Publication d'un événement `ChallengeFailed`.
    *   Historisation factuelle de l'échec ou de l'expiration du défi sous la mention "Défi manqué" ou "Défi expiré" dans l'espace personnel de l'apprenant pour encourager l'honnêteté et la discipline, mais sans altérer le score académique de maîtrise réelle des compétences.

