# LevelUP — Solution Architecture (C4 Model)

**Version :** 1.1  
**Statut :** Core Standard  
**Catégorie :** Solution Layer  
**Code :** LEVELUP-SOL-C4-001  

---

# 1. Niveau 1 : Diagramme de Contexte Système (System Context Diagram)

Le diagramme de contexte montre comment la plateforme LevelUP s'intègre avec les acteurs externes et les services tiers.

```mermaid
flowchart TD
    Apprenant["👤 Apprenant<br>(Suit ses routines, produit des preuves)"]
    Coach["👤 Coach / Évaluateur<br>(Vérifie et valide les compétences)"]
    SysAdmin["👤 Administrateur<br>(Gère les organisations et configurations)"]

    LevelUP["💻 Plateforme LevelUP<br>(Moteur de progression & gouvernance)"]

    GitHub["🌐 GitHub / GitLab<br>(Dépôt de code pour preuves)"]
    LMS["🏫 LMS Externe<br>(Sert de fournisseur de cours tiers)"]
    AI["🤖 APIs LLM Externes<br>(Gemini, Claude, OpenAI)"]
    Notify["✉️ Passerelles Notifications<br>(SMTP, SMS, Push)"]
    OIDC["🔑 Identity Provider Externe<br>(Google, Enterprise SSO)"]

    Apprenant -->|Utilise| LevelUP
    Coach -->|Évalue / Oriente| LevelUP
    SysAdmin -->|Configure| LevelUP

    LevelUP -->|Importe du code| GitHub
    LevelUP -->|Échange des cours/scores ACL| LMS
    LevelUP -->|Requêtes de tutorat socratique| AI
    LevelUP -->|Envoie des alertes| Notify
    LevelUP -->|Fédère l'identité| OIDC
```

---

# 2. Niveau 2 : Diagramme de Conteneurs (Container Diagram)

Le diagramme de conteneurs détaille la répartition logicielle des différents services, des bases de données et du bus d'événements.

```mermaid
flowchart TB
    subgraph Clients["📱 Couche Client (Clients Applications)"]
        Web["Interface Web (React/Tauri)"]
        Mobile["Application Mobile (Flutter)"]
    end

    subgraph API_Gate["🛡️ Passerelle & Sécurité"]
        Gateway["Kong API Gateway<br>(Rate Limiting, Routing, PEP Filters)"]
        Keycloak["Keycloak<br>(Gestionnaire d'identité & OAuth2)"]
    end

    subgraph Backends["⚙️ Services Applicatifs (Backend Services)"]
        CoreAPI["Core API Service (Rust)<br>(Execution Layer, Program, Progress, Assessment)"]
        PlatformAPI["Platform Services API (Rust)<br>(Scheduling, Notification, Gamification)"]
        AIWorker["AI Coach Broker (Python/Node)<br>(Orchestrateur prompt socratique & RAG)"]
    end

    subgraph EventBus["✉️ Bus d'Événements & Cache"]
        NATS["NATS JetStream<br>(Broker d'événements d'intégration asynchrones)"]
        Redis["Redis Cache<br>(Sessions actives, cache de configuration, rate limits)"]
    end

    subgraph Databases["💾 Stockage & Persistance (Polyglot Persistence)"]
        Postgres["PostgreSQL DB<br>(Utilisateurs, métadonnées, audit, configurations)"]
        Neo4j["Neo4j Graph DB<br>(Graphes de compétences et taxonomies de connaissances)"]
        Ledger["Amazon QLDB / Immutable Table<br>(Journal d'audit chaîné immuable)"]
    end

    %% Flux clients
    Web -->|HTTPS / WebSockets| Gateway
    Mobile -->|HTTPS / WebSockets| Gateway
    Gateway -->|Valide les jetons JWT| Keycloak

    %% Routage de la Gateway
    Gateway -->|Proxy / API calls| CoreAPI
    Gateway -->|Proxy / API calls| PlatformAPI
    
    %% Communication inter-services et bus
    CoreAPI -->|Publie / Souscrit| NATS
    PlatformAPI -->|Publie / Souscrit| NATS
    AIWorker -->|Écoute les demandes de chat| NATS
    CoreAPI -->|Lecture / Écriture cache| Redis
    PlatformAPI -->|Lecture / Écriture cache| Redis

    %% Persistance des services
    CoreAPI -->|SQL| Postgres
    CoreAPI -->|Cypher Queries| Neo4j
    CoreAPI -->|Append-only transactions| Ledger
    PlatformAPI -->|SQL| Postgres
```

---

# 3. Niveau 3 : Diagramme de Composants (Component Diagram)

Détail interne des composants logiciels du **Core API Service (Rust)**.

```mermaid
flowchart TD
    HttpRecv["📥 PEP Middleware / HTTP Router"]
    CmdBus["⚙️ Command Handlers"]
    QryBus["🔍 Query Handlers"]

    DomainEngine["🧬 Domain Aggregate Engine<br>(Competency, AssessmentSession, LearnerProgress)"]
    ProjectionEngine["🗂️ Read Model Projection Engine"]

    NatsAdapter["✉️ Integration Event Publisher (NATS)"]
    DBRepo["💾 Postgres Repository"]
    GraphRepo["🕸️ Neo4j Graph Adapter"]

    HttpRecv -->|Reçoit les requêtes| CmdBus
    HttpRecv -->|Reçoit les requêtes| QryBus
    CmdBus -->|Invoque la logique d'écriture| DomainEngine
    QryBus -->|Invoque la logique de lecture| DBRepo

    DomainEngine -->|Modifie l'état interne & Invariants| DBRepo
    DomainEngine -->|Modifie l'état interne & Invariants| GraphRepo
    DomainEngine -->|Émet des événements de domaine| ProjectionEngine
    DomainEngine -->|Émet des événements d'intégration| NatsAdapter

    ProjectionEngine -->|Met à jour les modèles dénormalisés de lecture| DBRepo
```

---

# 4. Niveau 4 : Diagramme de Déploiement (Deployment Diagram)

Schéma d'infrastructure montrant le déploiement de LevelUP sur un cluster Kubernetes cloud ou on-premise.

```mermaid
flowchart TD
    subgraph Internet["🌐 Réseau Externe"]
        Client["Navigateurs & Mobiles Clients"]
    end

    subgraph K8s["☸️ Cluster Kubernetes LevelUP (K8s)"]
        Ingress["Ingress Controller (Nginx / Cloudflare Tunnel)"]
        
        subgraph WebPods["Pods de Services Web"]
            GatePod["Kong Gateway Pods (Replica x3)"]
            KeycloakPod["Keycloak Server Pods (Replica x2)"]
        end

        subgraph CorePods["Pods Logiciels Métiers"]
            CorePod["Core API Service Pods (Rust, Replica x3)"]
            PlatformPod["Platform API Service Pods (Rust, Replica x3)"]
            AIPod["AI Broker Pods (Python, Autoscaled)"]
        end

        subgraph LabSandbox["🔒 Zone d'Exécution Sécurisée Labs (Isolée)"]
            Sandbox["Containers Éphémères de Labs (MicroVM / Firecracker)"]
        end
    end

    subgraph StateStorage["💾 Infrastructure de Données Managée"]
        PGReplica["PostgreSQL Master-Replica Cluster"]
        Neo4jCluster["Neo4j Graph Cluster"]
        NatsCluster["NATS JetStream Cluster"]
    end

    Client -->|HTTPS / TLS| Ingress
    Ingress --> GatePod
    GatePod --> CorePod
    GatePod --> PlatformPod
    GatePod --> AIPod
    CorePod -->|Provisionne et audite les labs| Sandbox
    
    CorePod --> PGReplica
    PlatformPod --> PGReplica
    CorePod --> Neo4jCluster
    CorePod --> NatsCluster
    PlatformPod --> NatsCluster
```
