# Hardened Data Model & Relational Dictionary (ERD V2)

## 1. Objective
This document defines the strict data structure required to support a high-security financial orchestrator. It moves from a "State-Based" model to an **"Event-Based" (Immutable)** model to ensure zero fraud and total auditability.

---

## 2. Core Principles
- **Zero Overwrites**: Critical financial data is never updated in-place. New events are appended.
- **Cryptographic Chaining**: The Audit Log is a chain of hashes.
- **Reconstructed State**: Balances are the sum of immutable events.
- **Strict Referential Integrity**: Every action must link to a user, a rule, and a timestamp.

---

## 3. Entity Dictionary (Hardened)

### 3.1 Identity & Access
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **UTILISATEUR** | Global identity | `id (UUID)`, `telephone`, `mfa_secret`, `status` |
| **MEMBRE** | User's role in a group | `id`, `user_id`, `groupe_id`, `statut (ACTIVE, QUARANTINE, etc.)` |
| **ROLE** | RBAC definition | `id`, `role_name`, `permissions_set` |

### 3.2 Group & Governance
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **GROUPE** | The core unit | `id`, `type_groupe`, `devise`, `statut` |
| **REGLE_GROUPE** | Fixed business rules | `id`, `groupe_id`, `fonds_couverture_active`, `fonds_auto`, `vote_quorum` |
| **VOTE** | Collective decision | `id`, `groupe_id`, `type_vote`, `date_debut`, `date_fin`, `resultat` |
| **PARTICIPATION_VOTE**| Individual response | `id`, `vote_id`, `membre_id`, `choix` |

### 3.3 The Hub & Financials (New/Hardened)
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **HUB_ACCOUNT** | The central bank pool | `id`, `bank_provider_id`, `global_balance`, `currency`, `last_sync_date` |
| **HUB_TRANSACTION** | Every movement in the hub | `id`, `amount`, `type (INBOUND/OUTBOUND)`, `timestamp`, `ref_external` |
| **CONTRIBUTION** | Member's payment | `id`, `membre_id`, `cycle_id`, `amount`, `status (RECEIVED, VALIDATED)` |
| **TRANSACTION** | Link between contribution and bank | `id`, `contribution_id`, `hub_tx_id`, `amount`, `timestamp` |
| **DETTE_MEMBRE** | Tracking unpaid amounts | `id`, `membre_id`, `amount_restant`, `date_limite`, `status` |

### 3.4 Tontine & Cycle Management
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **CYCLE** | One full rotation | `id`, `groupe_id`, `numero_cycle`, `date_debut`, `date_fin`, `status` |
| **TOUR** | Current beneficiary | `id`, `cycle_id`, `beneficiaire_id`, `position`, `amount_expected` |
| **TOUR_HISTORY** | Immutable order changes | `id`, `tour_id`, `old_position`, `new_position`, `vote_ref_id`, `timestamp` |

### 3.5 Coverage & Recovery Funds (Event-Based)
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **FUND_EVENT** | Every fund movement | `id`, `groupe_id`, `type (DEPOSIT, WITHDRAWAL)`, `amount`, `reason`, `timestamp` |
| **UTILISATION_FONDS**| Specific use of coverage | `id`, `fund_event_id`, `membre_id`, `amount`, `timestamp` |

### 3.6 Social Aid & Difficulties (New)
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **SOCIETY_CLAIM** | Difficulty declaration | `id`, `membre_id`, `groupe_id`, `description`, `status (PENDING, APPROVED, REJECTED)` |
| **CLAIM_WITNESS** | Peer confirmation | `id`, `claim_id`, `witness_membre_id`, `timestamp`, `signature` |

### 3.7 Nature & Partners
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **PARTENAIRE** | Supplier/Provider | `id`, `nom`, `type`, `api_key_vault_ref` |
| **PRODUIT** | Material good | `id`, `partenaire_id`, `nom`, `unite`, `prix_unitaire` |
| **COMMANDE_GROUPE** | Group's bulk order | `id`, `groupe_id`, `partenaire_id`, `total_amount`, `status` |
| **LIVRAISON** | Proof of delivery | `id`, `commande_id`, `date_livraison`, `proof_url`, `status` |

### 3.8 The Chain of Trust (Sovereign Audit)
| Entity | Purpose | Critical Attributes |
| :--- | :--- | :--- |
| **AUDIT_LOG** | Tamper-proof journal | `id`, `timestamp`, `user_id`, `action`, `resource`, `payload`, **`previous_hash`**, **`current_hash`** |

---

## 4. Hardened Relational Map (ERD)

```text
[UTILISATEUR] 1 --- N [MEMBRE]
[MEMBRE] N --- 1 [GROUPE]
[GROUPE] 1 --- 1 [REGLE_GROUPE]
[GROUPE] 1 --- N [CYCLE]
[GROUPE] 1 --- N [VOTE]
[GROUPE] 1 --- N [FUND_EVENT] <--- (Balance = Sum of Events)

[CYCLE] 1 --- N [TOUR]
[TOUR] 1 --- N [TOUR_HISTORY] <--- (Linked to VOTE)

[MEMBRE] 1 --- N [CONTRIBUTION]
[CONTRIBUTION] 1 --- 1 [TRANSACTION]
[TRANSACTION] N --- 1 [HUB_ACCOUNT] <--- (The Sovereign Pool)

[MEMBRE] 1 --- N [SOCIETY_CLAIM]
[SOCIETY_CLAIM] 1 --- N [CLAIM_WITNESS]
[SOCIETY_CLAIM] 1 --- 0..1 [VOTE]

[SOCIETY_CLAIM] 1 --- 0..1 [DETTE_MEMBRE]

[PARTENAIRE] 1 --- N [PRODUIT]
[PARTENAIRE] 1 --- N [COMMANDE_GROUPE]
[COMMANDE_GROUPE] 1 --- N [LIVRAISON]

[SOCIETY_SENSITIVE_ACTION] --- [AUDIT_LOG]
[AUDIT_LOG] (Entry N) --- HashLink ---> [AUDIT_LOG] (Entry N-1)
```

---

## 5. Critical State Transitions

### 5.1 The "Safe Payout" Logic
1. `TontineEngine` verifies all `CONTRIBUTION` for the `CYCLE` are `VALIDATED`.
2. `TontineEngine` checks `HUB_ACCOUNT` for sufficient liquidity.
3. `TontineEngine` creates a `TRANSACTION` request.
4. `Sytem Engine` sends signed instruction to Bank API.
5. `HubAccount` balance decreases $\rightarrow$ `Sovereign Audit` logs the movement $\rightarrow$ Hash Chain updated.

### 5.2 The "Recovery" Logic
1. `FundEngine` identifies `DETTE_MEMBRE`.
2. `Sytem Engine` blocks `MEMBRE.statut` $\rightarrow$ `QUARANTINE`.
3. `MEMBRE` pays debt $\rightarrow$ `FUND_EVENT (DEPOSIT)` created.
4. `Sytem Engine` verifies total debt is cleared $\rightarrow$ Updates `MEMBRE.statut` $\rightarrow$ `ACTIVE`.
