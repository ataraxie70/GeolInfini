# Certification Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-CERTIFICATION-001

---

# 1. Objet

Le **Certification Context** est le Bounded Context de la couche Platform Services responsable de la définition, de l'évaluation, de la délivrance, de la signature numérique et de la vérification publique des certifications et attestations de compétences de LevelUP.

Il matérialise l'aboutissement formel d'un parcours d'apprentissage en transformant un portefeuille de preuves solides en un titre vérifiable et infalsifiable.

---

# 2. Mission

Fournir un service d'attestation de compétences de haute confiance, capable d'émettre des certificats numériques signés cryptographiquement et vérifiables publiquement par des tiers (employeurs, institutions, etc.), fondés exclusivement sur la démonstration objective de la maîtrise.

---

# 3. Position dans l'écosystème

Le Certification Context appartient à la **Platform Services Layer**.

Il observe les validations de compétences émises par le **Assessment Context** et analyse les dossiers de preuves compilés par le **Portfolio Context** afin de vérifier si l'apprenant remplit toutes les conditions d'attribution définies par un standard de certification.

---

# 4. Vision métier

Une certification n'a de valeur que si elle est incontestable et adossée à une réalité pratique indiscutable. Fidèle à nos axiomes non négociables (*Rigueur*, *Vérité avant Motivation*, *Compétence avant Récompense*), le Certification Context applique les principes suivants :
1.  **Délivrance par la preuve accumulée :** Un certificat n'est pas attribué par simple succès à un examen théorique ponctuel. Il exige la complétion d'un ensemble de preuves d'application pratique à haut niveau de confiance.
2.  **Infalsifiabilité & Signature cryptographique :** Chaque titre émis comporte une signature numérique unique garantissant que le document n'a pas été altéré et provient d'une autorité habilitée.
3.  **Vérifiabilité publique et autonome :** Un tiers doit pouvoir vérifier instantanément l'authenticité et le contenu d'un certificat sans nécessiter d'accès privé à la plateforme (via des clés publiques).

---

# 5. Responsabilités

Le Certification Context est responsable de :

*   gérer les modèles et critères de certification (`Certification Models / Standards`) ;
*   évaluer l'éligibilité d'un apprenant en auditant son dossier de preuves (Certification Evaluator) ;
*   générer et signer cryptographiquement les certificats numériques (`Digital Certificates`) ;
*   gérer les clés de signature des autorités émettrices (`Credential Issuers`) ;
*   fournir une interface de vérification publique externe (Verification Service) ;
*   suivre l'état de validité et gérer les éventuelles révocations (`Revocations`).

Il n'est jamais responsable :
*   de produire les preuves d'apprentissage (responsabilité du `Activity` ou `Assessment Context`) ;
*   de gérer l'historique d'évaluation détaillé (responsabilité du `Assessment Context`).

---

# 6. Ubiquitous Language

## Digital Certificate
Titre numérique infalsifiable, daté et signé cryptographiquement, attestant qu'un apprenant maîtrise un ensemble défini de compétences de LevelUP.

## Certification Model (ou Standard)
Référentiel décrivant les exigences strictes nécessaires pour obtenir un certificat (ex: liste de compétences obligatoires, niveau de confiance minimal des preuves).

## Credential Issuer
Autorité (interne à LevelUP ou institution partenaire) disposant des droits cryptographiques pour signer et délivrer une certification.

## Verification Key
Clé cryptographique publique utilisée par des tiers pour valider la signature asymétrique d'un certificat émis.

## Revocation Record
Enregistrement invalidant officiellement un certificat émis avant sa date de fin de validité théorique (ex: en cas de triche ou de fraude avérée).

---

# 7. Modèle métier

```text
Portfolio Context (Dossier d'Evidence) ──► soumet ──┐
                                                    ▼
                                      [ Certification Evaluator ]
                                                    │
                                     ├── audite ──► Certification Model (Critères)
                                     └── valide ──► Niveau de confiance minimum
                                                    │
                                                    ▼
                                          [ Credential Issuer ]
                                                    │
                                                    ▼ (Signature asymétrique)
                                        [ Digital Certificate ]
                                                    │
                                                    ▼
                                          [ Verification Key ]
                                          (Vérification publique)
```

---

# 8. Principes métier

## Principe 1 — Niveau de confiance minimal strict
Aucune certification ne peut être délivrée si l'une des preuves clés associées présente un niveau de confiance (`ConfidenceLevel`) inférieur au seuil requis par le standard de certification.

## Principe 2 — Immutabilité des certificats émis
Une fois signé et émis, un certificat est gravé dans le temps. Toute modification (ex: mise à jour de compétences) nécessite l'émission d'un nouveau certificat qui remplace le précédent.

## Principe 3 — Révocabilité explicite
En cas de fraude ou de dépréciation majeure d'une norme, le `Credential Issuer` doit pouvoir publier une révocation immédiate, rendant la clé de vérification caduque pour ce certificat précis.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Roots
*   **DigitalCertificate :** Racine d'agrégat modélisant le certificat émis, ses signatures, son état de validité et les compétences couvertes.
*   **CertificationModel :** Racine d'agrégat modélisant les exigences académiques d'une norme de certification.

## 9.2 Entités
*   **CredentialIssuer :** Représentation de l'autorité émettrice et de ses clés d'identification publiques.
*   **RevocationRecord :** Suivi des invalidations de certificats.

## 9.3 Value Objects
*   **CertificateId / IssuerId / ModelId :** Identifiants uniques.
*   **CryptographicSignature :** Signature asymétrique (SHA-256 avec RSA/ECDSA).
*   **ValidityPeriod :** Dates de début et de fin de validité du certificat.
*   **VerificationMetadata :** Liens et hachages permettant la vérification autonome.

## 9.4 Domain Services
*   **CertificateSigner :** Service de signature asymétrique générant le sceau cryptographique.
*   **CertificationEvaluator :** Algorithme vérifiant que les preuves du Portfolio matérialisent l'ensemble des exigences du standard visé.

## 9.5 Domain Events
*   **CertificationModelPublished :** Publication d'un nouveau standard.
*   **CertificateIssued :** Délivrance d'un certificat à un apprenant.
*   **CertificateRevoked :** Annulation d'un certificat émis.
*   **CertificateVerified :** Une relecture publique réussie a été tracée.

---

# 10. Invariants

1.  Un certificat (`DigitalCertificate`) doit obligatoirement comporter une signature cryptographique valide générée par la clé privée associée à son `CredentialIssuer`.
2.  La date d'expiration d'un certificat (si elle existe) doit être strictement supérieure à sa date de délivrance.
3.  Un certificat révoqué (`Revoked`) ne peut plus jamais retourner à l'état valide (`Issued`).

---

# 11. Relations avec les autres Bounded Contexts

*   **Portfolio Context :** Fournit les ensembles de preuves (`Evidence Sets`) et les validations pour l'audit d'éligibilité.
*   **Assessment Context :** Fournit les observations d'évaluation historiques pour s'assurer qu'aucune fraude n'a entaché le parcours d'acquisition.
*   **Notification Context :** Prévient l'apprenant de la délivrance de sa certification ou des rappels d'échéance de validité.

---

# 12. Décisions architecturales

Le Certification Context utilise des formats de documents légers et interopérables (comme les formats W3C Verifiable Credentials et JSON-LD) pour permettre aux apprenants de stocker et d'exposer leurs certifications en dehors de la plateforme. 

Les fonctions de signature s'appuient sur des modules de sécurité (KMS / HSM) abstraits derrière les services d'infrastructure du domaine.
