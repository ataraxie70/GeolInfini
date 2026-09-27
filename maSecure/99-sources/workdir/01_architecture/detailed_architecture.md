# Hardened Detailed Architecture - Secured Community Tontine Platform

## 1. System Overview
The platform is a high-security orchestrator for community contributions. It follows the **Hub-and-Spoke Financial Model**, where the system controls the logic but the funds are centralized in a professional bank hub.

### 1.1 Architectural Style
- **Modular Architecture**: Backend is split into strict "Engines" (Auth, Group, Tontine, Fund, Vote, Partner, Notification, Audit).
- **Event-Driven Core**: Every state change is an Event. This ensures an immutable audit trail.
- **API-First Gateway**: A hardened API Gateway enforces RBAC, HMAC signatures, and rate limiting.

---

## 2. Financial Flow Architecture (The Hub Model)

To ensure high availability and security, the system implements a three-tier financial flow:

### 2.1 The Central Bank Hub (The Vault)
- **Infrastructure**: A high-capacity corporate account at a partner bank (e.g., UBA, Coris Bank, Banque Citoyenne).
- **Control**: The account is owned by the company. The system has **Push API** access to execute transfers.
- **Role**: Acting as the central pool, it collects contributions and distributes payouts.

### 2.2 The Access Layer (Aggregators)
- **Providers**: Use of aggregators (Orange Money, Wave, MTN, etc.) for the "last mile".
- **Inbound (Member $\rightarrow$ Hub)**: Member $\rightarrow$ Aggregator $\rightarrow$ System $\rightarrow$ Bank Hub.
- **Outbound (Hub $\rightarrow$ Member)**: System $\rightarrow$ Bank Hub $\rightarrow$ Aggregator $\rightarrow$ Member.
- **Advantage**: Allows members without bank accounts to participate while keeping the main funds in a stable, H24 banking environment.

### 2.3 The Execution Logic (The Brain)
- **Local Calculation**: All tontine logic, coverage fund calculations, and turn tracking are done locally within the `Tontine Engine` and `Fund Engine`.
- **Instructional Command**: The system does not "move money" itself; it sends a signed instruction to the Bank API to execute a transfer from the Hub to a specific recipient.

---

## 3. Logical Architecture (AD-01 & AD-04)

| Engine | Responsibilities | Key Logic |
| :--- | :--- | :--- |
| **Auth Engine** | Identity & MFA | OTP, JWT, Session Management, RBAC enforcement. |
| **Group Engine** | Lifecycle & Rules | Management of `GROUPE`, `MEMBRE`, and `REGLE_GROUPE`. |
| **Tontine Engine**| Cycle Orchestration | Management of `CYCLE` and `TOUR`. Calculates payout triggers. |
| **Fund Engine** | Financial Safety | Management of `FONDS_COUVERTURE`, `DETTE_MEMBRE`, and `UTILISATION_FONDS`. |
| **Vote Engine** | Collective Governance| Management of `VOTE` and `PARTICIPATION_VOTE`. Consensus logic. |
| **Partner Engine**| Material Logistics | Management of `PARTENAIRE`, `PRODUIT`, `COMMANDE_GROUPE`, and `LIVRAISON`. |
| **Notification Engine**| Multi-channel Alerting| SMS, Push, WhatsApp, Voice. |
| **Audit Engine** | Immutable Trace | Management of `AUDIT_LOG`. Cryptographically chains all events. |

---

## 4. Physical & Infrastructure Architecture (AD-02)

- **Compute**: Kubernetes Cluster.
    - **API Pods**: Stateless request handlers.
    - **Worker Pods**: Async processors (Payouts, Vote closing).
- **Persistence**:
    - **PostgreSQL Cluster**: ACID-compliant operational data.
    - **Redis Cluster**: Sessions and idempotency keys.
    - **Object Storage**: Secure storage for delivery proofs.
- **Network**: VPC with private subnets for all Engines and DBs. Only Gateway is public.

---

## 5. Data Architecture (AD-05)
- **Operational Data**: Current state of groups and members.
- **Audit Data**: Append-only event store (Immutable).
- **Analytics Data**: Aggregated metrics for reporting.

---

## 6. Event-Driven Architecture (AD-07)
The system reacts to events to ensure strict state transitions:
- `ContributionReceived` $\rightarrow$ Update Member Status $\rightarrow$ Notify Member.
- `ContributionLate` $\rightarrow$ Trigger Coverage Fund Check $\rightarrow$ Possible Emergency Vote.
- `CoverageFundUsed` $\rightarrow$ Log Movement $\rightarrow$ Proceed to Payout.
- `VoteClosed` $\rightarrow$ Execute Rule Change (e.g., swap turn order).
- `CycleClosed` $\rightarrow$ Increment Cycle $\rightarrow$ Freeze State.

---

## 7. Security Architecture (AD-08)
- **Zero Trust**: Internal mTLS communication.
- **Immutability**: `Hash(N) = SHA256(Data + Hash(N-1))` for audit logs.
- **Sovereign Control**: Company executives maintain physical access to the Bank Hub for emergency manual recovery.
- **RBAC**: Gateway-level enforcement of the permission matrix.
