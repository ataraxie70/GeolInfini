# Audit Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-AUDIT-001

---

# 1. Objet

Le **Audit Context** (ou **Audit Log Context**) est le Bounded Context de la couche Governance Layer responsable de l'enregistrement, du stockage immuable, de la vérification d'intégrité et de la mise à disposition des journaux d'audit de l'ensemble de l'écosystème LevelUP.

Il garantit la traçabilité complète et infalsifiable de toutes les actions sensibles (connexions, modifications de droits, validations de compétences, modifications de modèles pédagogiques).

---

# 2. Mission

Fournir un journal d'activité cryptographiquement protégé et immuable permettant aux auditeurs et aux administrateurs de retracer l'origine de toute modification de données ou d'accès sur la plateforme, garantissant la non-répudiation et l'absence de fraude.

---

# 3. Position dans l'écosystème

Le Audit Context appartient à la **Governance Layer**.

Il observe de manière passive ou intercepte de manière active l'ensemble des événements majeurs de la plateforme (émis par le `Identity Context`, `Authorization Context`, `Competency Context`, et `Assessment Context`). Il écrit ces événements dans son journal d'audit, indépendant de tous les autres systèmes de stockage de la plateforme.

---

# 4. Vision métier

La confiance dans un système d'apprentissage et de certification repose sur la certitude que les parcours et les évaluations n'ont pas été manipulés. Conformément à nos valeurs de *Rigueur* et de *Progression Réelle*, le Audit Context s'appuie sur :
1.  **L'immutabilité absolue :** Un log d'audit écrit ne peut être ni modifié, ni supprimé, même par un administrateur système.
2.  **L'intégrité chaînée :** Les enregistrements d'audit sont liés entre eux par hachage (chaînage de blocs), rendant immédiatement détectable toute tentative de suppression ou d'insertion de log frauduleuse.
3.  **La non-répudiation :** Chaque action enregistrée identifie de manière univoque l'acteur (apprenant, tuteur, administrateur ou agent IA) à son origine, avec les métadonnées de contexte associées (date, adresse IP, session).

---

# 5. Responsabilités

Le Audit Context est responsable de :

*   gérer les enregistrements unitaires du journal d'audit (`Audit Event Records`) ;
*   calculer et valider le chaînage cryptographique des enregistrements (Audit Logger) ;
*   gérer les règles définissant quelles actions doivent être auditées (`Audit Policies`) ;
*   auditer et vérifier régulièrement la cohérence globale du journal (Integrity Verifier) ;
*   fournir une interface sécurisée de consultation et d'export pour les rapports de conformité.

Il n'est jamais responsable :
*   de prendre des décisions de blocage d'accès (responsabilité du `Authorization Context`) ;
*   de gérer l'historique utilisateur de progression (responsabilité du `Progress Context`).

---

# 6. Ubiquitous Language

## Audit Event Record
Enregistrement unique, daté et immuable contenant le détail d'une action sensible survenue dans le système.

## Audit Log
Le fichier ou flux d'enregistrement ordonné et chaîné de l'ensemble des `Audit Event Records`.

## Chained Hash
Valeur de hachage cryptographique calculée en combinant le contenu du log courant et le hachage du log immédiatement précédent.

## Audit Policy
Ensemble de configurations déterminant les types d'événements à auditer (ex: connexions échouées, modifications de structures, validations de compétences).

## Integrity Report
Rapport produit par l'analyseur d'intégrité certifiant que le journal n'a subi aucune falsification.

---

# 7. Modèle métier

```text
Événement sensible (ex: CompetencyValidated)
                      │
                      ▼
               [ Audit Policy ] ➔ Filtre
                      │
                      ▼ (Si éligible)
               [ Audit Logger ]
                      │
                      ├── lit ──► Hachage du log précédent (H-1)
                      ├── calcule ──► Nouveau Hachage Chaîné (H = SHA-256(Log + H-1))
                      │
                      ▼
            [ Audit Event Record ] ➔ Persisté de manière immuable
```

---

# 8. Principes métier

## Principe 1 — Immutabilité et persistance à sens unique
Le système de stockage du journal d'audit ne doit autoriser que l'écriture à la suite (append-only). Les requêtes de mise à jour (`UPDATE`) ou de suppression (`DELETE`) sont techniquement impossibles.

## Principe 2 — Non-répudiation des signatures
Toute écriture d'audit sensible (validation de compétences, modifications de configurations de sécurité) est signée numériquement avec le certificat de l'acteur pour prouver son origine.

## Principe 3 — Traçabilité des interventions d'IA
Toute décision ou action automatique prise par un agent IA (ex: génération d'exercices, alertes de recommandation) doit être journalisée en mentionnant explicitement l'identifiant de l'agent comme auteur.

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **AuditEventRecord :** Racine d'agrégat modélisant l'enregistrement d'audit, ses métadonnées contextuelles, son hachage chaîné et sa signature.

## 9.2 Entités
*   **AuditPolicy :** Politique active définissant le périmètre d'audit du Workspace ou du système global.

## 9.3 Value Objects
*   **RecordId / PolicyId :** Identifiants uniques.
*   **SeverityLevel :** Niveaux de criticité (`Info`, `Warning`, `Critical`).
*   **HashValue :** Valeur SHA-256 d'enchaînement.
*   **ActorContext :** Identifiants de l'acteur (`AccountId`), de sa session, son adresse IP et son agent utilisateur.

## 9.4 Domain Services
*   **AuditWriter :** Service écrivant de manière sécurisée les enregistrements et mettant à jour le dernier hachage de référence.
*   **IntegrityVerifier :** Service qui recalcule l'intégralité de la chaîne de hachage du journal d'audit pour certifier qu'aucun enregistrement n'a été inséré, supprimé ou modifié rétroactivement.

## 9.5 Domain Events
*   **AuditEventLogged :** Enregistrement d'un log.
*   **AuditPolicyUpdated :** Modification des règles de filtrage.
*   **LogCorruptionDetected :** Alerte de sécurité majeure émise lorsque le verificateur d'intégrité détecte une rupture dans la chaîne de hachage.

---

# 10. Invariants

1.  La valeur de `ChainedHash` d'un `AuditEventRecord` doit être le produit du hachage de ses propres champs combiné avec le `ChainedHash` de l'enregistrement précédent.
2.  L'horodatage d'un enregistrement d'audit doit être strictement supérieur ou égal à l'horodatage de l'enregistrement précédent dans la chaîne.
3.  Aucun enregistrement d'audit ne peut être créé sans un `AccountId` / `LearnerId` ou une référence de système valide.

---

# 11. Relations avec les autres Bounded Contexts

*   **Tous les Bounded Contexts :** Publient les événements d'intégration sensibles captés par le Audit Context.
*   **Identity & Authorization Contexts :** Transmettent les événements de sécurité (connexions, modifications de privilèges, violations d'accès).
*   **Assessment Context :** Transmet les événements de validations d'acquis.

---

# 12. Décisions architecturales

Le journal d'audit doit être isolé des bases de données de travail opérationnelles. Il est stocké dans un espace de stockage physique non effaçable (WORM - Write Once Read Many), comme des buckets cloud configurés en mode "Object Lock" ou des bases de données de registre immuables (ex: Amazon QLDB). 

La vérification d'intégrité est automatisée par un timer récurrent du `IntegrityVerifier`.
