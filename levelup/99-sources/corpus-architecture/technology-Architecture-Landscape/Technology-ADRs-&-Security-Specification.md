# LevelUP — Technology ADRs & Security Specification

**Version :** 1.0  
**Statut :** Core Standard  
**Catégorie :** Technology Layer  
**Code :** LEVELUP-TEC-ADRSEC-001  

---

# 1. Registre des Décisions d'Architecture (ADR - Architecture Decision Records)

Conformément au principe *Foundation First*, chaque choix de notre pile technologique (Technology Stack) est motivé par des contraintes métiers et techniques spécifiques.

---

## ADR-001 : Choix du Langage pour les Services Métiers (Rust)

*   **Statut :** Approuvé (Approved)
*   **Contexte :** 
    Le cœur de LevelUP gère des graphes de progression complexes et orchestre des sessions d'évaluation en temps réel. Il y a une contrainte forte de sécurité mémoire (évitement de failles), de performance d'exécution et de réduction de la consommation de ressources (faible empreinte RAM) pour minimiser les coûts d'infrastructure cloud.
*   **Décision :** 
    Utiliser **Rust** pour les microservices `Core API` et `Platform API`.
*   **Justification :**
    *   *Sécurité par le compilateur :* Prévention des dépassements de tampon, des conditions de concurrence et des pointeurs nuls.
    *   *Performances :* Compilé en natif, sans ramasse-miettes (garbage collector), garantissant des temps de réponse constants.
    *   *Empreinte mémoire :* Consomme 10 à 20 fois moins de RAM que Java (JVM) ou Node.js à charge équivalente.
*   **Conséquences :** 
    Exige une expertise technique en développement Rust au sein de l'équipe d'ingénierie.

---

## ADR-002 : Persistance des Données Relationnelles (PostgreSQL)

*   **Statut :** Approuvé (Approved)
*   **Contexte :** 
    Le système gère des opérations critiques comme l'authentification (MFA), les contrats de workspaces, les paiements et le journal d'audit immuable. Les transactions doivent respecter de manière absolue la cohérence des données.
*   **Décision :** 
    Utiliser **PostgreSQL** comme base de données transactionnelle principale.
*   **Justification :**
    *   *Richesse transactionnelle :* Conformité ACID totale.
    *   *Extensibilité :* Support natif des formats JSONB pour les métadonnées flexibles, et extension `pgvector` pour l'indexation vectorielle du RAG pédagogique de l'AI Coach.
*   **Conséquences :** 
    Nécessite la mise en place d'un cluster master-replica avec basculement automatique pour assurer la haute disponibilité.

---

## ADR-003 : Modélisation des Graphes Conceptuels (Neo4j)

*   **Statut :** Approuvé (Approved)
*   **Contexte :** 
    Les compétences et connaissances forment un graphe de dépendances (DAG). Évaluer les prérequis pédagogiques à travers des jointures ou requêtes récursives (CTE) en SQL classique engendre des temps de latence élevés et une complexité de code.
*   **Décision :** 
    Utiliser **Neo4j** pour stocker et interroger les structures conceptuelles de compétences.
*   **Justification :**
    *   *Requêtes Cypher natives :* Permet de récupérer instantanément tout un arbre de dépendance ou de valider l'absence de cycles en une seule requête sans coût de jointure.
    *   *Performances :* Indexation native par pointeurs de graphe.
*   **Conséquences :** 
    Création d'une persistance polyglotte (les entités d'exécution dans PostgreSQL pointent vers des identifiants URN existant dans Neo4j).

---

## ADR-004 : Bus d'Événements et CQRS (NATS JetStream)

*   **Statut :** Approuvé (Approved)
*   **Contexte :** 
    Les microservices et les projections de lecture (Read Models) doivent communiquer de manière asynchrone pour maintenir un couplage faible. Apache Kafka est trop lourd à déployer et exploiter pour la première phase de LevelUP.
*   **Décision :** 
    Utiliser **NATS JetStream** comme broker d'événements.
*   **Justification :**
    *   *Simplicité et performance :* Très faible latence, écrit en Go, s'exécute dans des conteneurs légers de quelques mégaoctets.
    *   *JetStream (Persistance) :* Fournit des garanties de livraison (At-least-once, exact replay) indispensables pour reconstruire les read models en cas de panne.
*   **Conséquences :** 
    Configuration des politiques de rétention d'événements pour le stockage de JetStream.

---

## ADR-005 : Stockage de Sessions et Cache (Redis)

*   **Statut :** Approuvé (Approved)
*   **Contexte :** 
    Accès ultra-rapides requis pour le chat temporaire du coach IA, le cache des configurations système et le contrôle de débit (Rate Limiting).
*   **Décision :** 
    Utiliser **Redis** en mémoire.

---

# 2. Architecture de Sécurité & Modélisation des Menaces (Threat Model)

LevelUP applique le principe de défense en profondeur (Defense in Depth) pour protéger les données d'apprentissage et les identités.

```text
 ┌────────────────────────────────────────────────────────────────────────┐
 │                      ZONE DE SÉCURITÉ DE GOUVERNANCE                   │
 │   [Identity Context] ── (Contrôle d'accès strict PEP/PDP) ──► RGPD     │
 └───────────────────────────────────┬────────────────────────────────────┘
                                     ▼ (LearnerId Anonymisé)
 ┌────────────────────────────────────────────────────────────────────────┐
 │                      ZONE D'EXÉCUTION ISOLÉE (LABS)                    │
 │    ┌──────────────────────────────────────────────────────────────┐    │
 │    │                 Containers éphémères (MicroVM)               │    │
 │    │       - CPU & Mémoire bridés                                 │    │
 │    │       - Réseau sortant filtré par White-List                 │    │
 │    └──────────────────────────────────────────────────────────────┘    │
 └────────────────────────────────────────────────────────────────────────┘
```

## 2.1 Anonymisation et Isolation Nominative (RGPD)
*   **Frontière de confiance :** La base d'identité `UserProfile` (noms, emails) est cloisonnée au sein du `Identity Context` et protégée par un chiffrement au repos (AES-256).
*   **Jeton anonymisé :** Toutes les transactions et événements d'apprentissage utilisent exclusivement le `LearnerId` (UUIDv4 généré aléatoirement). Un attaquant compromettant la base d'évaluation ou de progression n'a aucun moyen d'identifier l'élève associé sans un accès administrateur à la base d'identité.

## 2.2 Isolation des Laboratoires Techniques (Execution Sandbox)
*   **Menace :** Exécution de code malveillant ou attaques par déni de service (DoS) lors de l'exécution de scripts ou de labs par l'élève.
*   **Contre-mesure :**
    1.  Chaque lab s'exécute dans un conteneur docker éphémère ou une micro-machine virtuelle (ex: Firecracker) à ressources bridées (limites strictes de CPU et mémoire).
    2.  Aucun accès réseau direct vers l'Internet public n'est autorisé depuis ces sandboxes, sauf vers des dépôts de packages explicitement listés sur liste blanche (White-List).
    3.  Le serveur MCP s'exécutant dans le container de l'élève s'authentifie via des jetons temporaires signés à usage unique.

## 2.3 Sécurité des Évaluations (Intégrité Anti-Fraude)
*   **Menace :** Modification manuelle frauduleuse du niveau de maîtrise d'un apprenant en base de données.
*   **Contre-mesure :**
    1.  Chaque enregistrement de validation dans le `Assessment Context` doit être lié à une signature numérique asymétrique (`CryptoSignature`) générée par la clé privée de l'émetteur (le prof ou l'agent d'évaluation).
    2.  L'enregistrement d'audit (`AuditEventRecord`) chaîné de type blockchain interdit la suppression invisible de transactions de modifications de données d'évaluation.
