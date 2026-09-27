# Hardened Business Workflows - Secured Community Tontine Platform

This document describes the strict operational flows. Every workflow is governed by the "System Engine" to ensure that humans only propose, while the system executes based on the ERD and the Charter.

---

## 1. Group Lifecycle & Governance
**Goal**: Setup a group with an immutable set of rules.

1. **Creation**: `Group Manager` creates `GROUPE` $\rightarrow$ Defines `REGLE_GROUPE`.
2. **Coverage Funding**: If `fonds_couverture_active == true`, the system requires the **full amount to be deposited** in the hub before the group can be activated.
3. **Onboarding**: `Manager` invites `UTILISATEUR` $\rightarrow$ `UTILISATEUR` becomes `MEMBRE` (status: `PENDING`) $\rightarrow$ Approval $\rightarrow$ Status: `ACTIVE`.
4. **Ordering**: `Tontine Engine` initializes `TOUR` entries for the first `CYCLE`.

---

## 2. The Hardened Tontine Cycle (Rotating Flow)
**Goal**: Securely move funds from contributors to the beneficiary via the Bank Hub.

1. **Contribution Pipeline**:
    - Member pays via Aggregator (Orange/Wave/etc).
    - Aggregator $\rightarrow$ System $\rightarrow$ Bank Hub (Funds concentrated).
    - System creates `CONTRIBUTION` (status: `VALIDATED`).
    - `Audit Engine` logs `ContributionReceived`.
2. **Closure Window**: At "Closure Time", the `Tontine Engine` audits all contributions for the `CYCLE`.
3. **The Decision Branch**:
    - **Path A (Success)**: All members paid $\rightarrow$ System instructs Bank Hub to transfer funds to beneficiary.
    - **Path B (Deficit)**: One or more members missing:
        - If `fonds_auto == true` $\rightarrow$ `Fund Engine` deducts from `FONDS_COUVERTURE` in the Hub $\rightarrow$ Payout executed.
        - If `fonds_auto == false` $\rightarrow$ `Vote Engine` opens emergency `VOTE` $\rightarrow$ If approved $\rightarrow$ Payout executed.
4. **Payout Execution**: `Tontine Engine` instructs the Bank Hub to transfer the total sum to the beneficiary's account (via Aggregator or direct Bank transfer).
5. **Cycle Closure**: `Tontine Engine` marks `CYCLE` as `CLOSED` $\rightarrow$ Increments cycle number.

---

## 3. Debt, Sanction & Reintegration
**Goal**: Maintain group health through automated sanctions and a strict return path.

### 3.1 Default & Sanction
1. **Debt Generation**: Missing payment $\rightarrow$ `Fund Engine` creates `DETTE_MEMBRE`.
2. **Automatic Sanction**: Debt > 2 Cycles $\rightarrow$ `Sytem Engine` updates status to `QUARANTINE`. Debt > 3 Cycles $\rightarrow$ `SUSPENDED`.
3. **Asset Handling**: If a member is permanently excluded, their previously contributed funds are redistributed to the remaining active members (or kept in the group pool per group rules).

### 3.2 Reintegration Process
A `SUSPENDED` member must follow this strict path to return:
1. **Full Debt Repayment**: Pay all `DETTE_MEMBRE` records.
2. **Coverage Fund Refill**: Repay the amount used from the `FONDS_COUVERTURE` during their default.
3. **Current Contribution**: Pay the contribution for the current ongoing `CYCLE`.
4. **Validation**:
    - If rules require $\rightarrow$ `Vote Engine` triggers a group `VOTE`.
5. **Status Restore**: On validation $\rightarrow$ `Sytem Engine` updates status to `ACTIVE`.

---

## 4. Difficulty & Assistance Workflow
**Goal**: Facilitate social aid without bureaucratic complexity, using collective trust.

1. **Declaration**: Member declares a "Difficulty" via the app.
2. **Peer Confirmation**:
    - **Small Groups (< 10)**: 1 or 2 other members must confirm the difficulty.
    - **Large Groups ($\ge 10$)**: 2 or 3 other members must confirm (total $\ge 4$ signatures).
3. **Collective Vote**: `Vote Engine` triggers a group-wide `VOTE`.
    - **Anti-Collusion Rule**: To prevent fraud, the current turn beneficiary and the Group Manager cannot serve as witnesses for a difficulty declaration.
4. **Decision**:
    - **Approved**: System applies assistance (e.g., payment extension).
    - **Rejected**: Normal late payment rules apply.

---

## 5. Governance (Voting) Workflow
**Goal**: Decentralized decision making with "Sabatoge Protection".

1. **Proposition**: `MEMBRE` or `Manager` creates `VOTE`.
2. **Voting Rights (Anti-Sabotage)**:
    - **All Registered Members** can generally vote.
    - **Suspended Members' Limit**:
        - Groups < 10: Up to 2 suspended members can vote.
        - Groups 10-15: Up to 3 suspended members can vote.
        - Groups > 15: Suspended members are **excluded** from voting.
3. **Resolution**: `Vote Engine` calculates the majority based on these limits.
    - **Tie-Break Rule**: In case of a perfect tie (50% YES / 50% NO), the vote is automatically declared **REJECTED**. The system maintains the current state unless there is a clear majority.
4. **Execution**: If `VALIDATED` $\rightarrow$ `Sytem Engine` executes the change (e.g., swap turn order).
