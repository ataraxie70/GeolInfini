# AI Assistant Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-AI-ASSISTANT-001

---

# 1. Objet

Le **AI Assistant Context** (ou **AI Coach Context**) est le Bounded Context de la couche Platform Services responsable de l'accompagnement personnalisé de l'apprenant par le biais d'un tuteur virtuel fondé sur l'intelligence artificielle.

Il orchestre les sessions de dialogue, structure les invites de commande (prompts) et injecte le contexte de progression de l'utilisateur afin de lui fournir une assistance ciblée, pédagogique et conforme à la philosophie de LevelUP.

---

# 2. Mission

Fournir un service de tutorat interactif et socratique capable d'expliquer les concepts fondamentaux, de guider l'apprenant dans la résolution de ses blocages techniques et de stimuler sa réflexion profonde, sans jamais faire le travail à sa place.

---

# 3. Position dans l'écosystème

Le AI Assistant Context appartient à la **Platform Services Layer**.

Il consomme les données de progression en temps réel du **Progress Context** (pour adapter son niveau de discours) et les ressources du **Knowledge Context** (pour citer des références officielles), tout en interagissant directement avec l'apprenant via l'interface utilisateur.

---

# 4. Vision métier

L'intelligence artificielle est un accélérateur d'apprentissage puissant, mais elle peut inciter à la paresse intellectuelle si elle fournit des solutions prêtes à l'emploi. Fidèle aux axiomes fondamentaux de LevelUP (*Vérité avant Motivation*, *Compréhension avant Exécution*), le AI Assistant applique les principes suivants :
1.  **La maïeutique socratique :** L'assistant ne donne pas la solution de code ou la réponse directe. Il pose des questions guidant l'apprenant vers la découverte de la solution par lui-même.
2.  **Le primat des fondations :** Si un apprenant bute sur un sujet avancé, l'assistant identifie les faiblesses sur les bases associées et l'oriente vers la révision des notions fondatrices.
3.  **L'honnêteté intellectuelle :** L'assistant n'exagère pas la progression de l'utilisateur et pointe de manière rigoureuse les points restant à travailler.

---

# 5. Responsabilités

Le AI Assistant Context est responsable de :

*   gérer les sessions de chat privées de l'apprenant (`Chat Sessions`) ;
*   assembler le contexte d'apprentissage (données de progression courante, prérequis, ressources) pour l'injecter dans la session de dialogue ;
*   appliquer les politiques de prompt système orientées pédagogie socratique (`Coach Prompts`) ;
*   modérer et valider les sorties de l'IA pour s'assurer qu'aucune solution brute n'est fournie (Garde-fous pédagogiques) ;
*   gérer l'historique des interactions d'aide.

Il n'est jamais responsable :
*   de valider officiellement une compétence (responsabilité du `Assessment Context`) ;
*   d'adapter le programme officiel de l'utilisateur (responsabilité du `Program Context`).

---

# 6. Ubiquitous Language

## Chat Session
Session de conversation interactive et privée entre un apprenant et le tuteur IA.

## Coach Prompt
Directive système structurant le comportement de l'IA (méthode socratique, ton professoral rigoureux, règles d'exclusion de code).

## Socratic Interaction
Échange unitaire (message de l'apprenant, réponse de l'IA) orienté vers la maïeutique et l'explication conceptuelle.

## Assistant Context Data
Ensemble des données métier injectées dynamiquement dans l'historique du dialogue (compétence visée, connaissances acquises, historique des erreurs récentes).

## Socratic Boundary Rule
Règle interdisant à l'assistant d'écrire la réponse finale d'un exercice ou d'une mission active.

---

# 7. Modèle métier

```text
Apprenant ➔ pose une question ──┐
                                 ▼
                         [ Chat Session ]
                                 │
                                 ├── consulte ──► Progress Context (Profil de maîtrise)
                                 ├── consulte ──► Knowledge Context (Ressources de cours)
                                 ├── applique ──► Coach Prompt (Directives socratiques)
                                 │
                                 ▼
                     [ Socratic Interaction ]
                                 │
                                 ├── vérifie ───► Socratic Boundary Rules
                                 │
                                 ▼
Apprenant ◄── reçoit une question de guidage
```

---

# 8. Principes métier

## Principe 1 — Pas de code "clés en main"
Lorsqu'un apprenant demande de l'aide sur une tâche pratique (ex: programmation, scripting), l'assistant doit expliquer l'algorithme ou le concept, mais ne doit pas générer le script final.

## Principe 2 — Rappel systématique aux fondations
Si l'utilisateur échoue à comprendre une notion avancée, l'assistant doit reformuler l'explication en faisant le lien avec la compétence de base requise.

## Principe 3 — Confidentialité absolue
L'historique des sessions d'aide est strictement personnel à l'apprenant et n'influe pas négativement sur son évaluation de compétence (l'erreur et la demande d'aide font partie de l'apprentissage).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **ChatSession :** Racine d'agrégat modélisant la conversation active, son historique d'interactions et le contexte d'apprentissage courant.

## 9.2 Entités
*   **SocraticInteraction :** Paire de messages typés avec horodatage et métadonnées d'exécution.
*   **AssistantContextData :** Instantané des connaissances et de la progression injecté en début de session.

## 9.3 Value Objects
*   **SessionId / MessageId :** Identifiants uniques.
*   **SystemDirective :** Instruction système injectée pour contraindre le modèle de langage.
*   **SenderType :** Type d'émetteur (`Learner`, `AI`).

## 9.4 Domain Services
*   **PromptBuilder :** Assembleur intelligent combinant la question, les directives socratiques, les documents de cours associés et le profil de l'utilisateur.
*   **SocraticValidator :** Service de garde-fous (guardrails) analysant la réponse générée pour bloquer les divulgations de solutions directes.

## 9.5 Domain Events
*   **ChatSessionStarted :** Ouverture d'une session de tutorat.
*   **SocraticInteractionLogged :** Enregistrement d'un échange.
*   **ContextDataInjected :** Mise à jour du profil de progression injecté dans la session.
*   **BoundaryRuleViolated :** Alerte lorsqu'une réponse générée a été bloquée par le validateur.

---

# 10. Invariants

1.  Une réponse d'assistant ne doit jamais contenir la solution complète de code ou de texte d'une mission active du `Assessment Context`.
2.  Toute interaction dans une `ChatSession` doit appartenir à un apprenant (`LearnerId`) unique et authentifié.
3.  L'assistant doit toujours citer les références du `Knowledge Context` sur lesquelles il s'appuie pour formuler ses explications.

---

# 11. Relations avec les autres Bounded Contexts

*   **Progress Context :** Fournit le niveau de maîtrise réel et les lacunes à corriger pour personnaliser les réponses.
*   **Knowledge Context :** Fournit les articles, résumés et livres officiels servant de base de vérité documentaire.
*   **Assessment Context :** Fournit l'état des missions actives de l'apprenant pour identifier les sujets sur lesquels l'assistant doit appliquer la règle d'exclusion de solution brute.

---

# 12. Décisions architecturales

Le AI Assistant Context s'intègre avec des modèles de langage (LLMs) distants via des API d'inférence. 

Pour protéger le domaine des défaillances réseau, des latences et des changements de fournisseurs de LLM (ex: Gemini, OpenAI, Claude), l'intégration technique est entièrement isolée derrière un **Anti-Corruption Layer (ACL)**. La validation des sorties (guardrails) s'effectue localement avant d'autoriser l'affichage du message à l'apprenant.
