# Ce document est extrêmement important car il va devenir le contrat officiel entre :

* Application Mobile
* Dashboard Web
* Backend
* Intégrations Mobile Money
* Intégrations Bancaires
* Services de Notifications
* Futurs partenaires

À ce niveau, il faut raisonner comme une fintech et non comme une simple application mobile.

---

# Catalogue API (CAPA-V1)

## Plateforme Communautaire de Tontine et Cotisation

Version : V1

Type : REST API

Format : JSON

---

# 1. Principes API

## Convention URL

```text
/api/v1/
```

Exemples :

```text
/api/v1/auth/login
/api/v1/groups
/api/v1/cycles
/api/v1/contributions
```

---

## Format Réponse

Succès

```json
{
  "success": true,
  "data": {},
  "message": "Operation successful"
}
```

---

Erreur

```json
{
  "success": false,
  "error": {
    "code": "GROUP_NOT_FOUND",
    "message": "Group not found"
  }
}
```

---

# 2. Module Authentification

## POST /auth/register

Créer un compte.

### Request

```json
{
  "phone": "+22670000000",
  "firstName": "Awa",
  "lastName": "Ouédraogo",
  "language": "fr"
}
```

---

## POST /auth/request-otp

Demander OTP.

---

## POST /auth/verify-otp

Valider OTP.

---

## POST /auth/login

Connexion.

---

## POST /auth/logout

Déconnexion.

---

## GET /auth/profile

Profil connecté.

---

## PATCH /auth/profile

Modifier profil.

---

# 3. Module Utilisateurs

## GET /users/{id}

Détails utilisateur.

---

## GET /users/{id}/groups

Groupes du membre.

---

## GET /users/{id}/transactions

Historique financier.

---

## GET /users/{id}/notifications

Notifications reçues.

---

# 4. Module Groupes

## POST /groups

Créer groupe.

### Request

```json
{
  "name": "Femmes Battantes",
  "groupType": "ROTATIVE",
  "currency": "XOF"
}
```

---

## GET /groups

Liste groupes.

---

## GET /groups/{groupId}

Détails groupe.

---

## PATCH /groups/{groupId}

Modifier groupe.

---

## DELETE /groups/{groupId}

Archiver groupe.

---

# 5. Gestion des Membres

## POST /groups/{groupId}/members/invite

Inviter membre.

---

## POST /groups/{groupId}/members/join

Rejoindre groupe.

---

## GET /groups/{groupId}/members

Liste membres.

---

## GET /groups/{groupId}/members/{memberId}

Détails membre.

---

## POST /groups/{groupId}/members/{memberId}/suspend

Demande suspension.

---

## POST /groups/{groupId}/members/{memberId}/reinstate

Réintégration.

---

# 6. Module Règles Groupe

## GET /groups/{groupId}/rules

Lire règles.

---

## PATCH /groups/{groupId}/rules

Modifier règles.

---

## POST /groups/{groupId}/rules/proposal

Proposer modification.

---

# 7. Module Cycles

## POST /groups/{groupId}/cycles

Créer cycle.

---

## GET /groups/{groupId}/cycles

Liste cycles.

---

## GET /cycles/{cycleId}

Détails cycle.

---

## POST /cycles/{cycleId}/close

Clôturer cycle.

---

# 8. Module Tours

## GET /cycles/{cycleId}/turns

Liste tours.

---

## GET /turns/{turnId}

Détail tour.

---

## POST /turns/{turnId}/exchange-request

Demande échange.

---

## POST /turns/{turnId}/approve-exchange

Validation échange.

---

# 9. Module Contributions

## POST /contributions

Créer contribution.

### Request

```json
{
  "groupId": "uuid",
  "cycleId": "uuid",
  "amount": 10000
}
```

---

## GET /contributions

Mes contributions.

---

## GET /contributions/{id}

Détail contribution.

---

## POST /contributions/{id}/confirm

Confirmation paiement.

---

# 10. Module Transactions

## GET /transactions

Historique.

---

## GET /transactions/{id}

Détails transaction.

---

## GET /transactions/{id}/receipt

Reçu officiel.

---

# 11. Module Fonds de Couverture

## GET /groups/{groupId}/coverage-fund

État fonds.

---

## GET /groups/{groupId}/coverage-fund/history

Historique.

---

## GET /groups/{groupId}/coverage-fund/usages

Utilisations.

---

# 12. Module Dettes

## GET /debts

Mes dettes.

---

## GET /debts/{id}

Détail dette.

---

## POST /debts/{id}/repayment-plan

Choix remboursement.

### Request

```json
{
  "mode": "INSTALLMENT",
  "cycles": 2
}
```

---

## POST /debts/{id}/repay

Remboursement.

---

# 13. Module Difficultés

## POST /hardships

Déclaration difficulté.

### Request

```json
{
  "groupId": "uuid",
  "reason": "Maladie"
}
```

---

## POST /hardships/{id}/support

Soutenir déclaration.

---

## GET /hardships

Liste déclarations.

---

# 14. Module Votes

## POST /votes

Créer vote.

---

## GET /votes

Liste votes.

---

## GET /votes/{id}

Détails vote.

---

## POST /votes/{id}/cast

Voter.

### Request

```json
{
  "choice": "YES"
}
```

---

## GET /votes/{id}/results

Résultats.

---

# 15. Module Tontine Nature

## GET /products

Catalogue produits.

---

## GET /products/{id}

Produit.

---

## POST /nature-groups

Créer groupe nature.

---

## POST /orders

Créer commande.

---

## GET /orders/{id}

Détail commande.

---

# 16. Module Partenaires

## GET /partners

Liste partenaires.

---

## GET /partners/{id}

Détails partenaire.

---

## GET /partners/{id}/products

Catalogue partenaire.

---

## POST /partners/{id}/delivery-confirmation

Confirmation livraison.

---

# 17. Module Livraisons

## GET /deliveries

Mes livraisons.

---

## GET /deliveries/{id}

Détails.

---

## POST /deliveries/{id}/confirm

Confirmation réception.

---

# 18. Module Notifications

## GET /notifications

Notifications.

---

## GET /notifications/{id}

Détail.

---

## POST /notifications/{id}/read

Marquer lu.

---

# 19. Module Audit

Accessible uniquement aux rôles autorisés.

## GET /audit/logs

Liste logs.

---

## GET /audit/logs/{id}

Détail.

---

## GET /audit/events

Événements.

---

# 20. Module Administration

## GET /admin/dashboard

Statistiques globales.

---

## GET /admin/groups

Tous groupes.

---

## GET /admin/users

Tous utilisateurs.

---

## GET /admin/incidents

Incidents.

---

## GET /admin/reports

Rapports.

---

# 21. Intégration Mobile Money

## POST /payments/mobile-money/initiate

Démarrer paiement.

### Request

```json
{
  "provider": "ORANGE",
  "phone": "+22670000000",
  "amount": 10000
}
```

---

## POST /payments/mobile-money/callback

Webhook opérateur.

---

## GET /payments/mobile-money/status/{reference}

Vérifier statut.

---

# 22. Intégration Bancaire

## POST /banking/disbursement

Versement bénéficiaire.

---

## POST /banking/callback

Webhook bancaire.

---

## GET /banking/status/{reference}

Statut.

---

# 23. Module Reporting

## GET /reports/group/{groupId}

Rapport groupe.

---

## GET /reports/cycle/{cycleId}

Rapport cycle.

---

## GET /reports/member/{memberId}

Rapport membre.

---

# 24. Événements Système

Événements publiés :

```text
UserRegistered
MemberJoined
ContributionReceived
ContributionLate
CoverageFundUsed
DebtCreated
DebtSettled
VoteOpened
VoteClosed
MemberSuspended
MemberReinstated
TurnPaid
CycleClosed
OrderCreated
OrderDelivered
```

---

# 25. APIs Futures (Réservées V2)

```text
Micro-crédit communautaire

Épargne bloquée

Assurance communautaire

Cagnotte événementielle

Marketplace partenaires

Financement coopératif

Notation de confiance des membres

Scoring communautaire
```
