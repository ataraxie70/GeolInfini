# LevelUP — AI Architecture Specification

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Solution Layer  
**Code :** LEVELUP-SOL-AIARCH-001  

---

# 1. Vision et Rôle de l'IA (Human-Centered AI)

Fidèle à notre axiome fondateur (*L'intelligence artificielle accompagne sans remplacer*), l'IA de LevelUP n'est ni un générateur automatique de solutions, ni un décideur final de validation. Son rôle est double :

1.  **Le Tuteur Socratique (AI Socratic Coach) :** Un agent conversationnel guidant l'apprenant par maïeutique pour l'aider à surmonter ses blocages lors de la réalisation d'activités ou de labs.
2.  **L'Orchestrateur de Recommandations (AI Recommendation Engine) :** Un service analysant le graphe des compétences pour suggérer la prochaine activité optimale respectant le principe *Foundation First*.

```text
 ┌──────────────────────┐      ┌──────────────────────┐      ┌──────────────────────┐
 │   User Chat Input    │ ──►  │    Vector Database   │ ──►  │    Graph Database    │
 │ (Message de l'élève) │      │  (Corpus de cours)   │      │ (État des prérequis) │
 └──────────┬───────────┘      └──────────┬───────────┘      └──────────┬───────────┘
            │                             │                             │
            ▼                             ▼                             ▼
       ┌─────────────────────────────────────────────────────────────────────┐
       │                        PROMPT BUILDER SERVICE                       │
       │     (Assemble le prompt système + contexte progression + RAG)       │
       └──────────────────────────────────┬──────────────────────────────────┘
                                          ▼
                               ┌─────────────────────┐
                               │  LLM Inference API  │ ➔ (Socratic Guardrails)
                               └─────────────────────┘
```

---

# 2. Le Moteur Maïeutique Socratique & Garde-fous (Guardrails)

Le tuteur IA est configuré avec des règles de comportement strictes et non négociables pour interdire la gratification immédiate de solutions prêtes à l'emploi.

## 2.1 Socratic Boundary Rules (Garde-fous Socratiques)
*   **Règle de Code-Verrou :** L'assistant IA a l'interdiction formelle de rédiger, de corriger ou de fournir directement une ligne de code fonctionnelle ou une réponse finale à l'élève pour les activités ou labs actifs.
*   **Mécanisme de Guidage :** En cas d'erreur de syntaxe ou de logique soumise par l'apprenant, l'IA doit répondre par une question ciblée ou un renvoi au concept fondateur théorique (ex: *"Dans votre commande, vous essayez de rediriger le flux de sortie. Quel est le rôle de l'opérateur '>' par rapport à '>>' ?"*).
*   **Validation des Réponses (Socratic Output Filter) :** Un service d'infrastructure intercepte la réponse générée par le LLM. Si la réponse contient un bloc de code (` ``` `) ou une chaîne correspondant à la solution type du lab, la réponse est rejetée et régénérée.

---

# 3. RAG Pédagogique Contextuel (Retrieval-Augmented Generation)

Pour fournir des réponses techniquement exactes et ancrées dans le patrimoine pédagogique de la plateforme, l'IA utilise une architecture RAG doublement enrichie.

## 3.1 Processus d'Injection de Contexte
Lorsqu'un apprenant envoie un message dans une `ChatSession` :

1.  **Récupération Vectorielle (Semantic Search) :** Recherche dans la base de vecteurs (ex: PostgreSQL `pgvector` ou Meilisearch) des documents théoriques et de la documentation technique liés à l'activité courante.
2.  **Récupération Structurée (Knowledge Graph) :** Requête Cypher dans Neo4j pour extraire la position de la compétence dans le graphe, ses compétences parentes et ses prérequis.
3.  **Récupération Métier (Progress Context) :** Extraction du score `MasteryEstimation` de l'apprenant pour adapter la complexité du vocabulaire de l'IA à son niveau (ex: tuteur plus vulgarisateur pour un Initié, plus technique pour un Praticien).

---

# 4. Stratégie de Mémoire à Long Terme (Cognitive Memory)

Pour éviter la saturation de la fenêtre de contexte (context window) du LLM avec l'historique complet des discussions, la mémoire est structurée sur deux niveaux :

*   **Mémoire Session (Court terme) :** Historique des $N$ derniers échanges de la `ChatSession` active (stocké dans Redis).
*   **Mémoire Cognitive (Long terme) :** Représentée par le profil de progression réel de l'apprenant. Au lieu d'injecter tous les chats passés, le `PromptBuilder` injecte un résumé d'attributs calculé (ex: *L'apprenant a un blocage persistant sur la gestion des droits Linux chmod/chown, identifié lors des trois derniers exercices*).

---

# 5. Intégration du Model Context Protocol (MCP)

Le Model Context Protocol (MCP) permet à l'IA d'interagir de manière standardisée et sécurisée avec l'environnement d'apprentissage réel de l'apprenant.

```text
 ┌──────────────┐          ┌──────────────┐          ┌───────────────────────────┐
 │  AI Socratic │ ── OIDC ──► MCP Gateway  │ ── TLS ──►   Student Sandbox Agent    │
 │    Coach     │          │  Controller  │          │ (Exécute compile / checks)│
 └──────────────┘          └──────────────┘          └───────────────────────────┘
```

## 5.1 Cas d'Usage MCP
*   **Analyse de Compilation :** En cas d'erreur de compilation dans un lab pratique, l'IA interroge le serveur MCP de la sandbox pour lire les logs d'erreurs réels (compilateur, interpréteur) sans que l'élève ait besoin de copier-coller son terminal.
*   **Inspection de Code :** L'IA peut lire le fichier source en cours d'édition (via les outils MCP `read_file`) pour repérer le point d'incompréhension conceptuelle de l'apprenant.
*   **Garantie de Sécurité :** Le serveur MCP s'exécute dans le conteneur sandbox éphémère de l'élève (sandbox Firecracker). Il dispose de permissions en lecture seule sur les fichiers de l'élève et n'a aucun accès aux fichiers système de l'organisation ou de LevelUP.
