# Configuration Context Specification

**Version :** 1.0 (Draft)

**Statut :** Generic Domain

**Catégorie :** Governance Layer

**Code :** LEVELUP-CTX-CONFIGURATION-001

---

# 1. Objet

Le **Configuration Context** est le Bounded Context de la couche Governance Layer responsable de la gestion, de la validation, de la distribution et de la traçabilité de l'ensemble des paramètres système, des configurations d'espaces de travail et des drapeaux de fonctionnalités (Feature Flags) de LevelUP.

Il centralise les variables techniques et comportementales de la plateforme afin d'adapter dynamiquement l'application aux besoins des utilisateurs et des organisations.

---

# 2. Mission

Fournir un service de configuration dynamique, typé, hiérarchique et sécurisé permettant de modifier le comportement de la plateforme en cours d'exécution sans nécessiter de nouveau déploiement de code, tout en garantissant la cohérence et la stabilité du système.

---

# 3. Position dans l'écosystème

Le Configuration Context appartient à la **Governance Layer**.

Il distribue les valeurs de paramètres et de drapeaux à l'ensemble des autres Bounded Contexts lors de leur initialisation ou à chaud (runtime resolution). Toute modification de configuration est notifiée aux autres contextes via des événements d'intégration et auditée via le **Audit Context**.

---

# 4. Vision métier

L'adaptabilité d'un moteur de progression universel dépend de sa configurabilité. Les quotas d'un workspace, le modèle de LLM à utiliser pour l'AI Coach, ou l'activation d'une fonctionnalité expérimentale communautaire doivent être ajustables de manière simple. 

Afin de préserver la rigueur de la plateforme, le Configuration Context applique les principes suivants :
1.  **Typage et validation stricts :** Aucun paramètre ne peut être modifié si sa nouvelle valeur ne respecte pas un schéma de validation rigoureux (pas d'erreurs de type en production).
2.  **Résolution hiérarchique :** Les configurations se résolvent par cascade logique (Valeur système par défaut ➔ Valeur spécifique à l'Organisation ➔ Valeur locale au Workspace).
3.  **Traçabilité des changements :** Toute modification de configuration constitue une décision de gouvernance et fait l'objet d'un archivage historique des versions de profils et d'un audit de sécurité.

---

# 5. Responsabilités

Le Configuration Context est responsable de :

*   gérer les profils de configuration système et de workspaces (`Configuration Profiles`) ;
*   gérer les valeurs de paramètres unitaires (`Configuration Parameters`) ;
*   gérer l'activation des fonctionnalités de manière ciblée (`Feature Flags`) ;
*   valider la conformité des configurations saisies (Configuration Validator) ;
*   résoudre la valeur finale d'un paramètre en appliquant la cascade (Parameter Resolver) ;
*   distribuer les mises à jour à chaud vers les autres Bounded Contexts.

Il n'est jamais responsable :
*   de stocker les données d'identité ou d'autorisations (responsabilité des `Identity` et `Authorization Contexts`) ;
*   de gérer les politiques de prix ou de facturation externes.

---

# 6. Ubiquitous Language

## Configuration Profile
Ensemble structuré de paramètres de configuration et de drapeaux de fonctionnalités propre à un périmètre (ex: le profil global du système, le profil d'un espace de travail).

## Configuration Parameter
Couple clé-valeur typé représentant une option de configuration (ex: `media.max_upload_size = 50MB`, `ai.default_model = gemini-3.5-flash`).

## Feature Flag
Drapeau d'activation binaire (on/off) permettant d'activer ou désactiver une fonctionnalité (ex: `community.peer_challenges_enabled = true`) de manière globale ou pour un échantillon d'utilisateurs.

## Validation Schema
Contrat technique (ex: schéma JSON) définissant les types autorisés, les valeurs minimales/maximales et les formats requis pour chaque clé de paramètre.

## Parameter Resolver
Moteur calculant la valeur finale effective d'un paramètre en fonction du contexte de la requête.

---

# 7. Modèle métier

```text
Modification d'un paramètre (ex: ai.default_model)
                      │
                      ▼
            [ Validation Schema ] ➔ Valide le type/format
                      │
                      ▼ (Si conforme)
            [ Configuration Profile ] ➔ Enregistre
                      │
                      ▼
            [ Parameter Resolver ] ➔ Calcule la cascade
                      │
                      ├── lit ──► Configuration Système
                      ├── lit ──► Configuration Organisation
                      └── lit ──► Configuration Workspace
                      │
                      ▼
              [ Valeur Effective ] ➔ Distribuée au domaine client
```

---

# 8. Principes métier

## Principe 1 — Sécurité par le schéma
Aucune modification de paramètre n'est appliquée si elle échoue à la validation du `ValidationSchema` associé.

## Principe 2 — Isolation des espaces
Un administrateur de Workspace ne peut modifier que les clés de configuration explicitement marquées comme "surchargeables localement" dans la politique système globale.

## Principe 3 — Traçabilité obligatoire
Chaque modification de valeur de paramètre ou de statut de Feature Flag doit spécifier l'auteur du changement et fait l'objet d'un audit de non-répudiation (Audit Context).

---

# 9. Modèle Tactique (DDD)

## 9.1 Aggregate Root
*   **ConfigurationProfile :** Racine d'agrégat modélisant l'ensemble des configurations d'un périmètre, garantissant la cohérence et la validation des modifications de paramètres et de flags.

## 9.2 Entités
*   **ConfigurationParameter :** Paramètre unitaire typé.
*   **FeatureFlag :** Statut et règles de ciblage d'une fonctionnalité.

## 9.3 Value Objects
*   **ProfileId / ParameterKey :** Identifiants uniques.
*   **ParameterValue :** Donnée typée stockant la configuration.
*   **ValidationRule :** Spécification de validation unitaire.

## 9.4 Domain Services
*   **ParameterResolver :** Service appliquant les règles de cascade pour extraire la valeur configurée finale pour un utilisateur ou espace de travail.
*   **ProfileValidator :** Moteur vérifiant l'ensemble d'un profil par rapport aux schémas système.

## 9.5 Domain Events
*   **ConfigurationProfileUpdated :** Modification d'un ou plusieurs paramètres du profil.
*   **FeatureFlagToggled :** Changement d'état d'activation d'un flag.
*   **ConfigurationInvalidated :** Alerte en cas de détection d'une configuration obsolète ou invalide en production.

---

# 10. Invariants

1.  Un `ConfigurationParameter` ne peut pas exister sans être associé à une clé unique prédéfinie et validable par le `ValidationSchema`.
2.  Un `FeatureFlag` actif pour un sous-ensemble d'utilisateurs doit s'appuyer sur des critères de ciblage objectifs (ex: ciblage par promotion/cohorte).
3.  La valeur par défaut du système pour une clé de configuration obligatoire doit toujours être définie et valide.

---

# 11. Relations avec les autres Bounded Contexts

*   **Tous les Bounded Contexts :** Consomment les configurations et écoutent les événements de mise à jour pour réaligner leur comportement à chaud.
*   **Workspace & Organization Contexts :** Fournissent les structures géographiques et d'organisation pour résoudre les cascades de paramètres.
*   **Audit Context :** Enregistre l'historique complet et détaillé des modifications de profils et d'états de Feature Flags.

---

# 12. Décisions architecturales

Le Configuration Context est conçu pour une distribution rapide avec de faibles temps de latence (lecture intensive). Les profils de configuration résolus sont mis en cache mémoire (ex: Redis) pour éviter les accès répétés en base de données, avec invalidation du cache déclenchée lors de la publication de l'événement `ConfigurationProfileUpdated`.
