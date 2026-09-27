# Hardened API Catalog - Secured Community Tontine Platform

This catalog defines the RESTful interface. All endpoints are governed by the RBAC matrix. Sensitive endpoints require a request signature (`X-Request-Signature`).

## 1. Global API Security Specifications
- **Transport**: Forced TLS 1.3.
- **Authentication**: JWT (Short-lived) + MFA (OTP) for critical actions.
- **Request Integrity**: HMAC-SHA256 signature for all `POST`, `PATCH`, `DELETE` requests.
- **Idempotency**: `Idempotency-Key` header required for all financial and voting transactions.
- **Input Validation**: Strict OpenAPI 3.0 schema enforcement.

---

## 2. Identity & Access Module (`/auth`, `/users`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/auth/register` | POST | Public | User registration | Input Validation |
| `/auth/login` | POST | Public | Authenticate $\rightarrow$ JWT | Rate Limited |
| `/auth/mfa-verify` | POST | User | Verify OTP for critical action | JWT + OTP |
| `/users/profile` | GET | User | Get personal profile | JWT |
| `/users/profile` | PATCH | User | Update profile | JWT + Signature |

---

## 3. Group & Rule Module (`/groups`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/groups` | POST | Manager | Create `GROUPE` & `REGLE_GROUPE` | JWT + Signature |
| `/groups/{gid}` | GET | Member | View group and rules | JWT |
| `/groups/{gid}/members` | POST | Manager | Invite `UTILISATEUR` $\rightarrow$ `MEMBRE` | JWT + Signature |
| `/groups/{gid}/members/{uid}`| PATCH | Member | Accept/Decline invite | JWT + Signature |
| `/groups/{gid}/members` | GET | Member | List members and statuses | JWT |

---

## 4. Rotating Tontine Module (`/tontine`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/tontine/{gid}/cycle` | GET | Member | Get current `CYCLE` & `TOUR` | JWT |
| `/tontine/{gid}/contribute` | POST | Member | Initiate `CONTRIBUTION` flow | JWT + Signature |
| `/tontine/{gid}/payouts` | GET | Member | History of `TOUR` payouts | JWT |
| `/tontine/{gid}/status` | GET | Member | Check closure window status | JWT |

---

## 5. Governance & Voting Module (`/votes`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/votes/propose` | POST | Member/Mgr | Create a `VOTE` proposition | JWT + Signature |
| `/votes/{vid}/cast` | POST | Member | Record `PARTICIPATION_VOTE` | JWT + Signature |
| `/votes/{vid}` | GET | Member | Get current vote results | JWT |

---

## 6. Funds & Financials Module (`/funds`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/funds/{gid}/coverage` | GET | Member | View `FONDS_COUVERTURE` balance | JWT |
| `/funds/{gid}/recovery` | GET | Member | View recovery fund status | JWT |
| `/funds/{gid}/history` | GET | Member | Trace of `UTILISATION_FONDS` | JWT |

---

## 7. Nature & Partners Module (`/nature`, `/partners`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/nature/{gid}/goal` | GET | Member | View target `PRODUIT` & progress | JWT |
| `/nature/{gid}/contribute` | POST | Member | Record `CONTRIBUTION` (item/money) | JWT + Signature |
| `/partners/orders` | GET | Partner | View `COMMANDE_GROUPE` | JWT |
| `/partners/orders/{oid}/confirm`| POST | Partner | Upload `LIVRAISON` proof | JWT + Signature |

---

## 8. Audit & Supervision Module (`/audit`)

| Endpoint | Method | Role | Description | Security |
| :--- | :--- | :--- | :--- | :--- |
| `/audit/logs` | GET | SuperAdmin | Retrieve system-wide `AUDIT_LOG` | JWT + MFA |
| `/audit/logs/{gid}` | GET | AdminOps | Retrieve logs for a specific group | JWT + MFA |
| `/audit/export` | POST | SuperAdmin | Generate signed audit report | JWT + Signature |

---

## 9. System Logic Note
**All financial and governance updates are asynchronous**. The API returns a `202 Accepted` with a `Transaction-ID`. The client polls or waits for a Push Notification to confirm the `Sytem Engine` has completed the execution.
