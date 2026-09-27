# Analyse de Conception - Vol. 6 : Spécifications API & Contrôles RBAC
**Projet :** MaSecure — Infrastructure de Règlement Social Automatisé
**Auteur :** Antigravity AI
**Date :** Juin 2026

---

## 1. Contexte d'API et Sécurité
Ce volume spécifie les routes d'API exposées par l'API Gateway de MaSecure pour prendre en charge les flux de fonds de recouvrement, d'identité des successeurs, de signalement de sinistres et de contrôle de conformité des votes.

---

## 2. Catalogue d'API Étendu

Toutes les requêtes de modifications ou de transferts de fonds doivent être signées cryptographiquement (`X-Request-Signature`) et validées par l'API Gateway avant transmission aux moteurs (`Tontine Engine`, `Vote Engine`).

### 2.1. Création et Configuration de Groupe
* **Route :** `POST /v1/groups`
* **Accès :** Responsable de Groupe (`Group Manager`)
* **Corps de la requête (JSON) :**
```json
{
  "name": "Association Tontine Dioula",
  "periodicity": "weekly",
  "contribution_amount_minor": 1000000,
  "recovery_fund_enabled": true,
  "recovery_fund_target_minor": 2000000,
  "recovery_fund_financing_mode": "progressif",
  "recovery_fund_penalty_minor": 500000,
  "fees_covered_by_recovery_fund": true
}
```
* **Validation Gateway :**
  * Si `recovery_fund_enabled` est `false` et `fees_covered_by_recovery_fund` est `true` $\rightarrow$ Erreur HTTP 400 Bad Request ("Impossible de couvrir les frais par le fonds de recouvrement si celui-ci est désactivé").

### 2.2. Gestion du Successeur
* **Route :** `POST /v1/groups/:group_id/members/:member_id/successor`
* **Accès :** Membre concerné ou Responsable de Groupe
* **Corps de la requête (JSON) :**
```json
{
  "successor_identity_id": "c8b4c2d4-1a3b-4c5e-8f9a-0b1c2d3e4f5a"
}
```

### 2.3. Signalement de Décès / Incapacité Définitive
* **Route :** `POST /v1/groups/:group_id/members/:member_id/disaster`
* **Accès :** Tout membre actif du groupe (déclenche un signalement social)
* **Corps de la requête (JSON) :**
```json
{
  "disaster_type": "death",
  "witness_identities": [
    "f1122334-4455-6677-8899-00aabbccddee",
    "f9988776-6655-4433-2211-00ffeeddccbb"
  ],
  "details": "Décès constaté le 08/06/2026."
}
```
* **Logique Système :**
  * La Gateway vérifie que le déclarant et les témoins sont des membres actifs et distincts.
  * Si le membre décédé n'a pas reçu le pot (créditeur) et qu'il n'y a pas de successeur lié $\rightarrow$ Le système initie un payout immédiat du solde de ses cotisations passées vers son portefeuille mobile d'origine et le passe au statut `EXCLUDED` (exclu définitivement).

### 2.4. Participation au Vote (Gouvernance)
* **Route :** `POST /v1/votes/:vote_id/cast`
* **Accès :** Membre ACTIF du groupe uniquement.
* **Corps de la requête (JSON) :**
```json
{
  "choice": "approve"
}
```
* **Validation de Sécurité (Garde-fou Vote) :**
  * Lors de la réception de la requête, la Gateway vérifie le statut du votant :
  * Si le membre a le statut `SUSPENDED` ou `QUARANTINE` $\rightarrow$ Le système rejette le vote avec une erreur **HTTP 403 Forbidden** ("Les membres suspendus ou en quarantaine ne sont pas autorisés à participer aux décisions de versement").

---

## 3. Matrice de Permissions RBAC Mise à Jour

Cette matrice intègre les restrictions d'accès sur le vote et la gestion des frais d'opération.

| Action Système | Super Admin (R1) | Admin Ops (R2) | Responsable (R3) | Membre Actif (R4) | Membre Suspendu/Quar. (R4s) | Système (R6) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Créer/Configurer Groupe** | Oui | Non | Oui | Non | Non | Non |
| **Lier un successeur** | Non | Non | Oui | Oui | Non | Non |
| **Déclarer un décès** | Non | Non | Oui | Oui | Non | Non |
| **Proposer un vote de changement d'ordre** | Non | Non | Oui | Oui | Non | Non |
| **Voter** | Non | Non | Oui | Oui | **Non (Bloqué)** | Non |
| **Déclencher payout** | Non | Non | Non | Non | Non | **Oui (Seul)** |
| **Défalquer frais MM du fonds** | Non | Non | Non | Non | Non | **Oui (Seul)** |
| **Défalquer frais MM du pot** | Non | Non | Non | Non | Non | **Oui (Seul)** |
| **Exclure après 3 cycles** | Non | Non | Non | Non | Non | **Oui (Seul)** |
