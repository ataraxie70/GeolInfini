# Feuille de Route d'Ingénierie & Plan d'Action — Architecture LevelUP

Ce document définit le **plan d'action stratégique** pour concevoir, spécifier et valider les Bounded Contexts restants de l'écosystème **LevelUP**, en stricte conformité avec nos **Axiomes et Valeurs Fondamentales** (Discipline, Rigueur, Preuves Observables, Vérité avant Motivation).

---

## 1. État des Lieux de l'Architecture (Ce qui est accompli vs planifié)

L'écosystème de LevelUP est structuré en 4 couches fonctionnelles et transversales. 

```text
                                  LEVELUP
┌─────────────────────────────────────────────────────────────────────────────┐
│ 1. SHARED KNOWLEDGE LAYER (Référentiel Commun)                              │
│    [X] Competency   [X] Knowledge   [X] Learning   [ ] Reference Models     │
├─────────────────────────────────────────────────────────────────────────────┤
│ 2. EXECUTION LAYER (Espace Apprenant)                                       │
│    [X] Program      [X] Activity    [X] Progress   [X] Assessment           │
├─────────────────────────────────────────────────────────────────────────────┤
│ 3. PLATFORM SERVICES LAYER (Services à Valeur Ajoutée)                      │
│    [X] Analytics    [X] Recommendation             [X] Search               │
│    [X] Portfolio    [X] Resource Catalog                                    │
│    [ ] Scheduling   [ ] Notification  [ ] Content Delivery  [ ] Media       │
│    [ ] AI Assistant [ ] Gamification  [ ] Community         [ ] Collaboration│
│    [ ] Certification                                                        │
├─────────────────────────────────────────────────────────────────────────────┤
│ 4. GOVERNANCE LAYER (Sécurité & Administration de la plateforme)           │
│    [ ] Identity     [ ] Organization  [ ] Workspace         [ ] Authorization│
│    [ ] Audit        [ ] Configuration [ ] Versioning        [ ] Catalog      │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. L'Application Directe des Fondations dans les Contextes à Venir

Pour chaque nouveau contexte à spécifier, les choix de conception doivent être guidés par nos axiomes non négociables :

### A. La Gamification (Layer Platform Services)
*   **Principe "Compétence avant Récompense" (A9, A10) :** Pas de badges de motivation faciles ou de points basés sur le simple temps passé. La gamification doit être une *représentation esthétique* de la discipline réelle et des preuves accumulées, et non un substitut.
*   **Règle :** Les points d'expérience (XP) et les jalons de gamification doivent être indexés uniquement sur les instances d'`Evidence` vérifiées émises par l'**Assessment Context**.

### B. L'Assistant IA (Layer Platform Services)
*   **Principe "Compréhension avant Exécution" (A7, A8) :** L'AI Coach ne doit jamais donner de réponses directes aux missions, ni valider de compétence à la place de l'évaluateur humain ou du test automatisé.
*   **Règle :** L'IA agit comme un tuteur socratique qui questionne l'apprenant pour stimuler sa réflexion profonde et identifier ses lacunes conceptuelles.

### C. La Certification (Layer Platform Services)
*   **Principe "Rigueur prime sur la vitesse" (A3) :** Une certification est une garantie publique de maîtrise opérationnelle.
*   **Règle :** Les certificats ne sont décernés que si le profil de compétences est entièrement étayé par des preuves de niveau de confiance élevé (Confidence Level minimal requis).

---

## 3. Plan de Route Chronologique (5 Phases)

Pour poursuivre efficacement dans la même lignée, nous recommandons le séquençage suivant.

### Phase 1 : Consolidation du Shared Kernel & Événements (Court Terme)
*   **Objectif :** Finaliser les contrats d'échange transversaux pour soutenir l'intégration des contextes d'exécution.
*   **Livrables à créer :**
    1.  `Shared Kernel/Metadata-Shared-Kernel-Specification.md` (structure commune des métadonnées).
    2.  `Shared Kernel/Versioning-Shared-Kernel-Specification.md` (politique de versionnement sémantique des modèles).
    3.  `Shared Kernel/Common-Identifiers-Specification.md` (Value Objects d'identifiants standardisés).

### Phase 2 : Services Plateforme Opérationnels (Moyen Terme)
*   **Objectif :** Spécifier les capacités d'exécution technique de base qui alimentent l'espace personnel de l'apprenant.
*   **Livrables à créer :**
    1.  `platform-Context-Landscape/Scheduling-Context-Specification.md` : Orchestration temporelle des routines d'apprentissage quotidiennes du `Activity Context`.
    2.  `platform-Context-Landscape/Notification-Context-Specification.md` : Rappels intelligents basés sur les habitudes de l'apprenant, favorisant la *Discipline*.
    3.  `platform-Context-Landscape/Media-Context-Specification.md` & `Content-Delivery-Context-Specification.md` : Stockage, formatage et diffusion performante des supports du `Knowledge Context`.

### Phase 3 : Services Plateforme à Valeur Ajoutée (Moyen Terme)
*   **Objectif :** Enrichir l'expérience sans dénaturer la rigueur.
*   **Livrables à créer :**
    1.  `platform-Context-Landscape/AI-Assistant-Context-Specification.md` : Spécification de l'AI Coach socratique.
    2.  `platform-Context-Landscape/Gamification-Context-Specification.md` : Système de feedback esthétique de la discipline (Habitudes, Routines, Combos de régularité).
    3.  `platform-Context-Landscape/Certification-Context-Specification.md` : Délivrance de titres basés exclusivement sur les `Evidence Sets` du `Portfolio`.
    4.  `platform-Context-Landscape/Community-& Collaboration-Context-Specification.md` : Évaluation par les pairs, apprentissage en groupe.

### Phase 4 : Fondations de la Couche de Gouvernance (Long Terme)
*   **Objectif :** Sécuriser et structurer les espaces de travail.
*   **Livrables à créer dans un nouveau répertoire `governance-Context-Landscape/` :**
    1.  `Identity-& Authentication-Context-Specification.md` : Gestion des profils et sécurité des accès.
    2.  `Authorization-Context-Specification.md` : Modèle de droits fin (RBAC/ABAC) pour distinguer les rôles d'Évaluateur, Concepteur Pédagogique et Apprenant.
    3.  `Workspace-Context-Specification.md` : Isolation des données personnelles et mutualisation des modèles de référence.

### Phase 5 : Administration, Audit & Cycle de Vie (Long Terme)
*   **Objectif :** Permettre l'amélioration continue et la traçabilité.
*   **Livrables à créer :**
    1.  `Audit-Context-Specification.md` : Enregistrement immuable des validations de compétences (sécurité anti-fraude).
    2.  `Configuration-& Versioning-Context-Specification.md` : Gestion du cycle de vie des modèles de référence en production.

---

## 4. Méthodologie d'Ingénierie pour chaque Spécification

Afin de maintenir le niveau d'excellence de la documentation existante, chaque spécification de contexte devra adopter la structure normalisée suivante :

1.  **Objet & Mission :** Frontières claires du contexte.
2.  **Position dans l'écosystème :** Couche et relations.
3.  **Ubiquitous Language :** Glossaire métier exclusif.
4.  **Principes Métier :** Traduction des fondations LevelUP appliquées à ce domaine.
5.  **Modèle Tactique (DDD) :** Agrégats, Entités, Value Objects, Domain Services et Domain Events.
6.  **Invariants :** Règles de cohérence technique garanties.
7.  **Interfaces exposées & Relations.**
