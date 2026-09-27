# Hardened Deployment Plan - Secured Community Tontine Platform

This plan ensures a **Zero-Risk Promotion** of code. Stability and data integrity are prioritized over speed of delivery.

---

## 1. Environment Isolation
Strict separation to prevent "Production Contamination".

| Environment | Purpose | Data Source | Access |
| :--- | :--- | :--- | :--- |
| **Development** | Feature build | Mock Data | Devs |
| **Testing** | Integration/QA | Anonymized Prod Copy | QA |
| **Staging** | Final UAT | Mirror of Prod | QA + PO |
| **Production** | Live Traffic | Real User Data | Restricted (SRE) |

---

## 2. The Hardened CI/CD Pipeline
No code reaches production without passing through the "Security Gate".

1. **Static Analysis**: Linting + SAST (Static Application Security Testing) for vulnerabilities.
2. **Automated Testing**: Unit $\rightarrow$ Integration $\rightarrow$ Scenario Tests.
3. **Dynamic Scanning**: DAST (Dynamic Application Security Testing) on a staging build.
4. **Artifact Hardening**: Immutable Docker image creation with minimal base OS (Distroless).
5. **UAT Sign-off**: Manual approval by the Product Owner on Staging.
6. **Blue-Green Deployment**: Traffic shift to Production.

---

## 3. Production Strategy: Blue-Green
To eliminate downtime and allow instant rollback:

1. **Green Environment**: New version is deployed alongside "Blue".
2. **Smoke Testing**: Health checks on Green.
3. **Canary Shift**: Traffic shifts 10% $\rightarrow$ 50% $\rightarrow$ 100%.
4. **Monitoring**: SREs monitor the " la clôture" window for any payout engine errors.
5. **Finalization**: Blue is kept for 24h as a hot-rollback target.

---

## 4. Financial Partner Onboarding
1. **Sandbox**: Functional testing with provider's mock API.
2. **Certification**: Security audit with the provider to validate transaction handling.
3. **Production**: Secure exchange of keys via Vault $\rightarrow$ "Penny Test" (small real transaction).

---

## 5. Database Migration
- **Schema Evolution**: Liquibase/Flyway scripts only. No manual SQL.
- **Backward Compatibility**: All changes must be compatible with the previous version to support Blue-Green rollback.
- **Pre-Deploy Snapshot**: Full encrypted DB snapshot taken immediately before migration.

---

## 6. Rollback Plan
If a critical bug (e.g., Payout failure) is detected:
1. **Immediate Redirection**: API Gateway shifts 100% traffic back to "Blue".
2. **Forensics**: "Green" is preserved for post-mortem analysis.
3. **PITR**: If data was corrupted, Point-In-Time Recovery from the pre-deploy snapshot is executed.
