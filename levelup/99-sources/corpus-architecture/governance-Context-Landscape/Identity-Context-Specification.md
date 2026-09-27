# Identity Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-IDENTITY-001

---

# 1. Objet

Le **Identity Context** (ou **Identity & Authentication Context**) est le Bounded Context de la couche Governance Layer responsable de la gestion des identités des utilisateurs, de la création des comptes, de l'authentification sécurisée, du double facteur (MFA) et du cloisonnement des données nominatives.

Il constitue la barrière de sécurité et d'accès à l'ensemble de la plateforme LevelUP.

---

# 2. Mission

Fournir un service d'authentification robuste, conforme aux meilleures pratiques de sécurité (OAuth2, OpenID Connect) et au RGPD, garantissant que seuls les utilisateurs légitimes peuvent accéder à la plateforme, tout en protégeant leur anonymat vis-à-vis des couches d'apprentissage opérationnelles.

---

# 3. Position dans l'écosystème

Le Identity Context appartient à la **Governance Layer**.

Il intervient lors de la phase d'accès (Authentication). Il est le seul contexte à détenir les informations nominatives réelles de l'utilisateur (nom, prénom, email, mot de passe). Il distribue un identifiant anonymisé unique (`LearnerId`) aux autres couches métier (Execution et Platform Services Layer) afin d'assurer un découplage total et la protection des données personnelles.

---

# 4. Vision métier

La rigueur de LevelUP s'applique également à la gestion de la sécurité. Les données d'apprentissage d'un individu (ses blocages, ses erreurs, ses tentatives d'évaluation) sont hautement sensibles. Pour assurer une confiance totale, le Identity Context repose sur les piliers suivants :
1.  **Anonymisation par découplage :** Aucun domaine métier (Progression, Activités, Recommandation) ne connaît le nom ou l'adresse email de l'apprenant. Ils ne manipulent qu'un identifiant technique anonyme (`LearnerId`).
2.  **Sécurité forte d'authentification :** L'authentification utilise des mécanismes de hachage à sens unique de pointe et impose le double facteur pour les comptes disposant de droits d'administration ou d'évaluation.
3.  **Confidentialité et RGPD :** L'accès aux données personnelles respecte le principe du privilège minimal et permet l'exercice du droit à l'oubli.

---

# 5. Responsabilités

Le Identity Context est responsable de :

*   gérer les comptes des utilisateurs (`User Accounts`) ;
*   gérer les profils nominatifs des utilisateurs (`User Profiles`) ;
*   vérifier l'identité lors de la connexion (Authentification) ;
*   gérer les secrets d'identification de manière sécurisée (Argon2id/Bcrypt) ;
*   gérer l'authentification à double facteur (`MFA`) ;
*   gérer les jetons de sessions actives (`Login Sessions`) ;
*   générer l'identifiant anonyme découplé (`LearnerId`) pour l'apprenant.

Il n'est jamais responsable :
*   de gérer les droits d'accès ou permissions fins (responsabilité du `Authorization Context`) ;
*   de gérer les structures de groupes d'utilisateurs au sein d'entreprises (responsabilité du `Organization Context`).

---

# 6. Ubiquitous Language

## User Account
Compte technique d'accès à la plateforme, englobant les identifiants de connexion, l'état d'activation du compte et les métadonnées de sécurité.

## User Profile
Ensemble des données nominatives personnelles de l'utilisateur (nom, prénom, email, téléphone, photo de profil).

## Authentication Credential
Données secrètes d'identification (mot de passe cryptographiquement haché, clés secrètes MFA, clés publiques d'API).

## Login Session
Jeton de session temporaire accordé à l'utilisateur après une authentification réussie pour lui permettre de naviguer sur la plateforme.

## Mfa Token
Jeton à usage unique et durée de validité limitée (TOTP) requis pour valider le second facteur d'authentification.

## LearnerId
Identifiant technique unique (UUIDv4) généré de manière aléatoire et associé au compte, servant d'unique référence de l'apprenant dans tous les autres contextes de la plateforme.

---

# 7. Modèle métier

```text
Connexion de l'utilisateur (Email + Mot de passe)
                      │
                      ▼
               [ User Account ]
                      │
                      ├── vérifie ──► Authentication Credential (Argon2id)
                      ├── vérifie ──► MFA Token (TOTP)
                      │
                      ▼
               [ Login Session ] ➔ Délivrée au client
                      │
                      └── génère ➔ [ LearnerId (UUIDv4 Anonyme) ]
                                             │
                                             ▼
                        Transmis aux autres Bounded Contexts
```

---

# 8. Principes métier

## Principe 1 — Unicité des comptes
Deux comptes utilisateurs ne peuvent pas partager la même adresse email ou le même identifiant technique d'accès.

## Principe 2 — Cloisonnement nominatif
Les informations du `UserProfile` (nom, prénom, email) ne doivent jamais transiter dans les événements d'intégration métier de la plateforme. Seul le `LearnerId` y est autorisé.

## Principe 3 — Sécurisation des secrets
Les mots de passe ne sont jamais stockés en clair. Ils sont salés et hachés en utilisant l'algorithme Argon2id (recommandation OWASP).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **UserAccount :** Racine d'agrégat modélisant le compte utilisateur, ses informations de sécurité, ses sessions actives et ses clés de chiffrement.

## 9.2 Entités
*   **UserProfile :** Profil nominatif de l'utilisateur contenant ses données personnelles.
*   **LoginSession :** Session active contenant le jeton d'accès et sa date d'expiration.

## 9.3 Value Objects
*   **AccountId / LearnerId :** Identifiants uniques.
*   **EmailAddress :** Adresse email validée.
*   **CredentialHash :** Empreinte sécurisée du mot de passe.
*   **MfaSecret :** Clé secrète d'initialisation du second facteur (totp).

## 9.4 Domain Services
*   **PasswordHasher :** Service de hachage et de vérification des mots de passe.
*   **Anonymizer :** Service générant le `LearnerId` de manière cryptographiquement aléatoire pour rompre le lien direct avec l'identité réelle.

## 9.5 Domain Events
*   **UserRegistered :** Inscription d'un nouvel utilisateur.
*   **UserAuthenticated :** Authentification réussie.
*   **MfaEnabled :** Activation du double facteur.
*   **AccountSuspended :** Compte bloqué pour des raisons de sécurité ou de modération.
*   **SessionExpired :** Expiration d'une session de connexion.

---

# 10. Invariants

1.  L'adresse email d'un profil utilisateur (`EmailAddress`) doit être syntaxiquement valide et unique au sein de la base d'identité.
2.  Une session (`LoginSession`) ne peut pas être active si le compte associé (`UserAccount`) est marqué comme suspendu ou désactivé.
3.  Le `LearnerId` associé à un compte utilisateur doit être généré une seule fois à l'inscription et demeurer immuable.

---

# 11. Relations avec les autres Bounded Contexts

*   **Authorization Context :** Consomme les identifiants de session pour évaluer et attribuer les droits d'accès.
*   **Notification Context :** Consomme l'adresse email ou le numéro de téléphone issus du profil pour la transmission des messages (via un canal sécurisé).
*   **Audit Context :** Enregistre les tentatives de connexion et les modifications de sécurité pour la traçabilité.

---

# 12. Décisions architecturales

Le Identity Context encapsule l'ensemble de la logique de sécurité de LevelUP. Il peut être implémenté en s'appuyant sur des protocoles standards de l'industrie (Keycloak, Auth0, AWS Cognito) ou via un module d'authentification personnalisé en interne. 

Toutes les interfaces de ces technologies sont abstraites derrière l'Aggregate Root `UserAccount`.
