# Hardened Consolidated Project Charter - Secured Community Tontine Platform

## 1. Absolute Vision and Objectives
The platform is a high-security orchestrator for community-based financial and material contributions. It is designed to replace manual "tontine" practices with a system where **collective governance is enforced by code**.

### 1.1 The Hierarchy of Priorities
1. **Security (Inviolability)**: Absolute priority. Any performance or UX trade-off is acceptable to prevent fraud, unauthorized access, or data manipulation.
2. **Transparency (Auditability)**: Every state change must be immutable and verifiable.
3. **Operational Continuity**: The system must ensure the "Turn" (le tour) is paid, regardless of individual member failures, using automated safety nets.
4. **Accessibility**: Interface simplicity for low-literacy users.

### 1.2 Product Golden Rules (Non-Negotiable)
- **The Hub-and-Spoke Financial Model**: The platform utilizes a **Central Bank Hub**. Funds are concentrated in a high-capacity corporate account at a partner bank. The system acts as the brain, instructing the bank to move funds.
- **The Human-System Divide**: Humans *propose, declare, and vote*. The **System Engine** *calculates, validates, and executes*.
- **Immutability**: Once a transaction is `VALIDATED` or a vote is `CLOSED`, no human role (including Super Admin) can modify it.

---

## 2. Strict Functional Scope

### 2.1 Supported Models & Entities
Based on the official ERD, the system manages:
- **Rotating Money Tontines**: Based on `CYCLE` $\rightarrow$ `TOUR` $\rightarrow$ `CONTRIBUTION`.
- **Social Contributions**: Fixed-goal collective funds.
- **Contributions in Kind**: Material goods via `PARTENAIRE` $\rightarrow$ `PRODUIT` $\rightarrow$ `COMMANDE_GROUPE` $\rightarrow$ `LIVRAISON`.
- **Hybrid Models**: Combining the above.

### 2.2 Critical Business Rules
- **Fund Architecture**:
    - **Participation Fund**: Core contributions for the current turn.
    - **Coverage Fund (`FONDS_COUVERTURE`)**: Optional. If enabled, it must be **fully funded at group creation** before any cycle starts.
    - **Recovery Fund**: Used for `DETTE_MEMBRE` regularization and reintegration.
- **Closure Logic**:
    - Strictly defined "Closure Window" (e.g., 18:00-20:00). 
    - The System Engine performs a hard check at the end of this window to determine the payout path.
- **Member Lifecycle**:
    - Statuses: `ACTIVE`, `PENDING`, `SUSPENDED`, `QUARANTINE`, `LEFT`, `EXCLUDED`.
    - Debt spreading is limited to 2 cycles; beyond that, `QUARANTINE` is mandatory.
    - **Reintegration**: A suspended member must repay the Coverage Fund, all outstanding debts, and the current cycle's contribution before returning.

### 2.3 Governance & Validation
- **Difficulty Declarations**: No complex paperwork.
    - **Small Groups (< 10)**: Member declaration + 1 or 2 witness confirmations $\rightarrow$ Group Vote.
    - **Large Groups ($\ge 10$)**: Member declaration + 2 or 3 witness confirmations (total $\ge 4$ signatures) $\rightarrow$ Group Vote.
- **Voting Rights**:
    - General rule: All registered members vote.
    - **Suspended Members**: 
        - Groups < 10: Up to 2 suspended members can vote.
        - Groups 10-15: Up to 3 suspended members can vote.
        - Groups > 15: Suspended members are excluded from voting to prevent sabotage.
- **Turn Order**: Managed strictly by the `TOUR` entity; changes require a validated `VOTE` and are executed by the System Engine.

---

## 3. Strict Technical & Security Constraints

### 3.1 Architecture Rigor
- **Layered Isolation**: Strict separation of Presentation, Business, Data, Integration, Security, and Audit layers.
- **Single Source of Truth**: All logic resides in the Backend. The Mobile App is a "dumb" terminal for input and display.
- **Modular Engine**: Independent engines for `Tontine`, `Fund`, `Vote`, `Partner`, and `Audit`.

### 3.2 Security Hardening
- **Access Control**: RBAC implemented with "Least Privilege". 
- **Request Integrity**: Every sensitive API call must be signed via HMAC (`X-Request-Signature`).
- **Financial Traceability**: Every fund movement must be linked to a `TRANSACTION` and an `AUDIT_LOG` entry.
- **Authentication**: MFA mandatory for all sensitive actions (OTPL/Mobile Money OTP).

### 3.3 Data Integrity
- **Event Sourcing**: All financial states are reconstructed from a sequence of immutable events.
- **Cryptographic Chaining**: Audit logs are hashed in a chain to detect any database-level tampering.

---

## 4. Role & Permission Framework (RBAC Summary)
- **Super Admin**: Global config, security supervision. **Forbidden** from modifying financial history.
- **Admin Ops**: Support, monitoring. **Forbidden** from modifying financial history.
- **Group Manager**: Group setup, member invites. **Forbidden** from unilaterally moving funds.
- **Member**: Contribute, vote, consult.
- **Partner**: Confirm deliveries.
- **System Engine**: The **only** entity allowed to execute payouts, apply penalties, and close cycles.
