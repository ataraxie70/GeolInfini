# Collaboration Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-COLLABORATION-001

---

# 1. Objet

Le **Collaboration Context** est le Bounded Context de la couche Platform Services responsable de la gestion des outils de travail collaboratif en temps réel ou asynchrones entre les apprenants de LevelUP.

Il encadre les sessions de co-apprentissage (co-learning), le pair programming/pair study, les espaces de travail partagés et le système d'évaluation par les pairs (peer reviews).

---

# 2. Mission

Fournir les mécanismes collaboratifs opérationnels permettant aux apprenants de s'associer pour réaliser des activités complexes, de partager des espaces de travail et de s'évaluer mutuellement avec rigueur et bienveillance.

---

# 3. Position dans l'écosystème

Le Collaboration Context appartient à la **Platform Services Layer**.

Il interagit avec le **Activity Context** (qui lui fournit les activités éligibles au travail en groupe) et avec le **Assessment Context** (qui consomme les résultats des revues par les pairs pour alimenter le diagnostic de compétence).

---

# 4. Vision métier

L'acquisition de compétences durables s'enrichit par l'échange. Apprendre à plusieurs renforce la discipline et permet de confronter ses points de vue. Cependant, la collaboration doit rester rigoureuse. Le Collaboration Context applique les principes suivants :
1.  **L'évaluation constructive par les pairs (Peer Review) :** Relire le travail d'un autre est une activité pédagogique majeure. Elle doit s'appuyer sur des critères de validation objectifs.
2.  **L'engagement mutuel (Co-learning) :** Travailler à deux demande de la discipline réciproque. Le système formalise ces engagements pour éviter les abandons.
3.  **L'anonymat protecteur :** Afin de garantir la neutralité et la vérité des évaluations par les pairs, les processus de relecture peuvent être rendus anonymes.

---

# 5. Responsabilités

Le Collaboration Context est responsable de :

*   gérer les sessions de travail conjoint (`Collaboration Sessions`) ;
*   créer et suivre les contrats de co-apprentissage (`Co-Learning Contracts`) ;
*   structurer le processus d'évaluation par les pairs (`Peer Reviews`) ;
*   gérer l'attribution automatique des travaux à relire (`Review Assigner`) ;
*   configurer les espaces de travail partagés temporaires (`Shared Workspaces`).

Il n'est jamais responsable :
*   d'accorder une validation officielle de compétence (responsabilité exclusive du `Assessment Context`) ;
*   de définir les critères de validation d'origine (responsabilité du `Competency Context`).

---

# 6. Ubiquitous Language

## Collaboration Session
Session de travail synchrone (ex: visioconférence d'étude, session de codage à deux) regroupant plusieurs apprenants sur une activité commune.

## Co-Learning Contract
Accord formel au sein de la plateforme par lequel deux apprenants s'engagent à suivre un même module ou une même routine d'apprentissage au même rythme.

## Peer Review
Processus d'analyse et de notation constructive du travail d'un apprenant par un autre apprenant.

## Shared Workspace
Espace technique collaboratif temporaire (ex: tableau blanc partagé, éditeur de code conjoint) créé pour les besoins d'une session.

## Review Criteria
Liste de points de contrôle objectifs que le relecteur doit évaluer pour valider le travail de son pair.

---

# 7. Modèle métier

```text
Activity Context (Activité collaborative) ──► déclenche ──┐
                                                           ▼
                                                [ Collaboration Session ]
                                                           │
                                                ├── gère ──► Co-Learning Contracts
                                                ├── gère ──► Shared Workspaces
                                                └── gère ──► Peer Reviews
                                                                 │
                                                                 ▼
                                                      [ Review Assigner ]
                                                                 │
                                                                 ▼
                                                        Évaluation par les pairs
```

---

# 8. Principes métier

## Principe 1 — Habilitation par la compétence
Un apprenant ne peut être désigné comme relecteur (`Reviewer`) pour une compétence donnée que s'il a déjà validé cette même compétence dans son propre Portfolio.

## Principe 2 — Double anonymat
Sauf configuration spécifique (travaux de groupe déclarés), le relecteur et le relecturé ne connaissent pas leurs identités mutuelles pour garantir l'honnêteté de la critique.

## Principe 3 — Réciprocité de l'effort
Pour pouvoir soumettre son propre travail à la relecture par ses pairs, l'apprenant doit lui-même accepter d'évaluer les travaux en attente dans sa file d'attente de relecture.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **CollaborationSession :** Racine d'agrégat modélisant la session synchrone, ses participants, son espace partagé et sa durée réelle.
*   **PeerReview :** Racine d'agrégat représentant le processus complet d'évaluation d'un travail (soumission, relecture, critères validés, décision).

## 9.2 Entités
*   **CoLearningContract :** Contrat d'engagement mutuel d'apprentissage.
*   **SharedWorkspace :** Instance de support technique collaboratif.

## 9.3 Value Objects
*   **SessionId / ReviewId :** Identifiants uniques.
*   **ReviewStatus :** États du processus (`Submitted`, `InReview`, `Approved`, `Rejected`).
*   **RoleType :** Rôles dans la session (`Driver`, `Navigator`, `Peer`).

## 9.4 Domain Services
*   **ReviewScheduler :** Algorithme attribuant de manière anonyme et équitable les soumissions aux relecteurs éligibles.
*   **WorkspaceProvisioner :** Service provisionnant les ressources techniques nécessaires aux espaces partagés.

## 9.5 Domain Events
*   **CollaborationSessionStarted :** Début d'une session conjointe.
*   **CollaborationSessionCompleted :** Fin de la session de travail.
*   **CoLearningContractSigned :** Signature de l'accord mutuel.
*   **PeerReviewSubmitted :** Soumission d'un travail pour relecture.
*   **PeerReviewCompleted :** Clôture d'une relecture par un pair.

---

# 10. Invariants

1.  Un apprenant ne peut pas être désigné comme relecteur de sa propre soumission de travail.
2.  Une session collaborative (`CollaborationSession`) doit comporter au moins deux participants valides de l'écosystème LevelUP.
3.  La validation finale d'une relecture par les pairs (`PeerReview`) exige que l'ensemble des `ReviewCriteria` obligatoires aient été évalués de manière binaire (valide / non valide).

---

# 11. Relations avec les autres Bounded Contexts

*   **Activity Context :** Fournit les instances d'activités à réaliser à deux ou en groupe.
*   **Assessment Context :** Reçoit les validations issues des `PeerReviews` comme élément de preuve intermédiaire de maîtrise.
*   **Notification Context :** Prévient les relecteurs de l'arrivée de nouvelles soumissions à évaluer.

---

# 12. Décisions architecturales

Le Collaboration Context s'intègre avec des outils d'édition en temps réel (ex: WebSockets, CRDTs pour la synchronisation de documents) et des protocoles de visioconférence WebRTC. 

Toutes ces intégrations techniques complexes sont déléguées à la couche d'infrastructure et manipulées à travers les interfaces du `SharedWorkspace`.
