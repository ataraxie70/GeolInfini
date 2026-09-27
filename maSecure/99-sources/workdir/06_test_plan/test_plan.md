# Hardened Test Plan - Secured Community Tontine Platform

This plan adopts an **Adversarial Approach**. We assume the system will be attacked and we test its resilience to fail.

---

## 1. Testing Strategy

| Layer | Focus | Method | Coverage Target |
| :--- | :--- | :--- | :--- |
| **Unit Tests** | Logic & Rule Engine | Jest / PyTest | 100% of `TontineEngine` & `FundEngine` |
| **Integration Tests** | API & External Adapters | Postman / Supertest | All endpoints in `api_catalog.md` |
| **Scenario Tests** | End-to-End Business Flows | Playwright | All flows in `business_workflows.md` |
| **Security Audit** | Fraud & Vulnerability | OWASP ZAP / Manual Pen-test | All high-risk financial endpoints |
| **UAT** | Accessibility | Beta User Group | Core UX Journeys |

---

## 2. Critical Scenario Testing (The "Crisis" Suite)

### 2.1 The "Broken Cycle" Scenario
- **Input**: 3 members fail to pay by the closure hour.
- **Expected Result**: 
    - `Tontine Engine` detects deficit.
    - `Fund Engine` triggers `FONDS_COUVERTURE` (Auto or Vote).
    - Beneficiary is paid in full.
    - Defaulting members are moved to `QUARANTINE`.

### 2.2 The "Governance Attack" Scenario
- **Input**: A Manager attempts to change the turn order via a direct API call without a vote.
- **Expected Result**: API returns `403 Forbidden` $\rightarrow$ `Audit Engine` logs a "Unauthorized Rule Change Attempt".

### 2.3 The "Reintegration" Scenario
- **Input**: A suspended member pays their debt and requests return.
- **Expected Result**: System verifies payment $\rightarrow$ Triggers group vote $\rightarrow$ On approval, status updates to `ACTIVE` $\rightarrow$ Member is positioned at the end of the queue.

---

## 3. Adversarial Security Testing

### 3.1 API Integrity Tests
- **IDOR/BOLA**: Try to access `/groups/{id}/members` for a group the user is not a part of.
- **Signature Tampering**: Modify the body of a vote request while keeping the original HMAC signature. (Expected: `401 Unauthorized`).
- **Replay Attack**: Resend a valid contribution request. (Expected: `400 Bad Request` due to Idempotency-Key).

### 3.2 Data Integrity "Chaos" Tests
- **Manual DB Tampering**: Manually update a transaction amount in the PostgreSQL DB.
- **Expected Result**: The `Audit Engine`'s "Chain of Trust" verification service must detect the hash mismatch and trigger a system-wide "Emergency Read-Only" alert.

---

## 4. UX & Accessibility Validation
- **Low-Literacy Test**: Users must complete a payment and a vote without textual instructions.
- **Multimodal Check**: Verify notification delivery across SMS, WhatsApp, and Voice.

---

## 5. Performance & Scalability
- **Closure Window Peak**: Simulate 1,000 concurrent payments and votes during the 2-hour closure window.
- **Recovery Time**: Measure the time to reconstruct balances from the Event Store.
