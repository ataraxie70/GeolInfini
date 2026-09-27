# LevelUP — Global Business Glossary

**Version :** 1.0  
**Statut :** Living Document  
**Catégorie :** Business Architecture  
**Code :** LEVELUP-BUS-GLOSSARY-011  

---

# Introduction

Ce **Glossaire Métier Global** (Business Glossary) a pour but de définir et de stabiliser l'Ubiquitous Language (langue ubiquitaire) transversal de l'ensemble de la plateforme LevelUP. Il regroupe par domaine conceptuel les définitions fondamentales et non négociables de nos structures, évitant ainsi toute déviation ou ambiguïté terminologique lors du passage à la modélisation de solution et à l'implémentation.

---

# 1. Le Domaine Conceptuel (Reference Layer / Shared Knowledge)

## KnowledgeUnit (Unité de Connaissance)
Concept ou notion théorique atomique à acquérir (ex: *Le principe de routage IP*). C'est un élément immuable du patrimoine éducatif.

## KnowledgeGraph (Graphe de Connaissances)
Structure de graphe (DAG) connectant les `KnowledgeUnits` par des relations de prérequis pédagogiques (ex: *Notion A est prérequise pour Notion B*).

## Competency (Compétence)
Capacité d'application pratique d'un ensemble de connaissances dans un contexte spécifique (ex: *Configurer un serveur DNS sous Linux*).

## CompetencyGraph (Graphe de Compétences)
Graphe décrivant les dépendances entre les compétences, organisées du simple vers le complexe (respect du principe *Foundation First*).

## CompetencyDomain (Domaine de Compétences)
Catégorie thématique supérieure regroupant des compétences connexes (ex: *Administration Système*).

## LearningBlueprint (Modèle de Parcours)
Modèle structurel type définissant un cheminement d'apprentissage (composé de modules et d'étapes) conçu pour amener un apprenant de l'initiation à la maîtrise d'un domaine.

---

# 2. Le Domaine d'Exécution (Execution Layer / Espace Apprenant)

## PersonalProgram (Programme Personnel)
Instance personnalisée d'un `LearningBlueprint` ou d'un objectif de compétences affectée à un apprenant spécifique dans son espace de travail.

## Activity (Activité)
Tâche d'apprentissage unitaire et concrète (lecture d'un document, lab pratique, visionnage de média, questionnaire) recommandée pour acquérir une notion.

## ActivityInstance (Instance d'Activité)
Exécution temporelle d'une `Activity` par un apprenant, traçant son état (Démarré, En cours, Complété) et son horodatage.

## LearningLab (Laboratoire Pratique)
Activité technique interactive s'exécutant dans un environnement sandboxé (ex: console Linux interactive, sandbox cloud) dont les résultats sont évalués de manière automatisée.

## ActivityRoutine (Routine)
Régularité planifiée associant des activités à des créneaux temporels récurrents pour ancrer la discipline.

## MasteryEstimation (Estimation de Maîtrise)
Score de probabilité dynamique calculé par le système représentant le niveau de compréhension supposé d'une compétence par l'apprenant, basé sur ses activités complétées.

## Assessment (Évaluation)
Processus formel de validation d'une compétence ou d'un ensemble de compétences par le biais de critères de réussite stricts et objectifs.

## AssessmentSession (Session d'Évaluation)
Instance d'évaluation active lancée par un apprenant pour valider une compétence, supervisée par un évaluateur humain ou un agent IA socratique.

## EvaluationDecision (Décision d'Évaluation)
Verdict final d'une session d'évaluation (`Valide` ou `Non Valide`) validant ou rejetant l'acquisition officielle de la compétence visée.

---

# 3. Le Domaine de Preuve (Evidence Layer / Portfolio)

## Evidence (Preuve d'Apprentissage)
Objet d'intégration universel constituant l'unique support de validation d'une compétence. C'est l'artefact physique de l'apprentissage (code GitHub, capture d'écran, logs d'exécution, rapport d'évaluation).

## ConfidenceLevel (Niveau de Confiance)
Indicateur de fiabilité d'une `Evidence` basé sur son origine (ex: *Faible* pour une auto-déclaration, *Élevé* pour un lab technique vérifié par signature machine, *Maximum* pour une évaluation certifiée par un professeur).

## EvidenceSet (Dossier de Preuves)
Collection structurée d'une ou plusieurs `Evidences` qualifiant la maîtrise d'une compétence par l'apprenant dans son Portfolio.

---

# 4. Le Domaine de Motivation & Communauté (Platform Services)

## DisciplineXP (XP de Discipline)
Points d'expérience alloués pour encourager la constance et le respect des routines d'apprentissage (assiduité temporelle).

## MasteryXP (XP de Maîtrise)
Points d'expérience alloués exclusivement à la suite de la validation d'une compétence par une preuve d'évaluation vérifiée (acquis réels).

## DailyStreak (Série Quotidienne)
Nombre de jours consécutifs durant lesquels l'apprenant a complété au moins une activité planifiée dans son agenda.

## DisciplineScore (Score de Discipline)
Pourcentage glissant mesurant la régularité du respect des routines d'apprentissage planifiées par rapport aux séances honorées.

## CosmeticReward (Récompense Cosmétique)
Badge visuel ou titre débloqué sur le profil pour célébrer la discipline ou la régularité, sans valeur de certification académique.

## PeerChallenge (Défi entre Pairs)
Défi d'apprentissage temporaire lancé par un apprenant à un autre portant sur une cible pédagogique mesurable (lab, quiz, discipline) avec une date de fin stricte.

## PeerReview (Relecture par les Pairs)
Évaluation constructive et anonyme du travail d'un apprenant par un autre apprenant qualifié (ayant déjà validé la compétence associée).

## CoLearningContract (Contrat de Co-Apprentissage)
Engagement mutuel formel entre deux apprenants à suivre un module ou une routine d'étude au même rythme pour s'entraider.

---

# 5. Le Domaine de Gouvernance (Governance Layer)

## UserAccount (Compte Utilisateur)
Identité d'accès technique contenant les informations d'authentification (MFA, mots de passe hachés, logs de connexion).

## UserProfile (Profil Utilisateur)
Ensemble des données nominatives (nom, prénom, email) de l'utilisateur.

## LearnerId (Identifiant Anonyme)
Identifiant de découplage unique (UUIDv4) généré pour chaque compte, servant d'unique référence dans les couches d'apprentissage pour protéger l'anonymat.

## Organization (Organisation)
Structure d'appartenance institutionnelle ou juridique (ex: entreprise, école) hébergeant des cohortes et des workspaces.

## Cohort (Promotion)
Regroupement d'apprenants d'une promotion ou équipe partageant un cadre d'étude et des objectifs communs.

## Workspace (Espace de Travail)
Partition logique étanche (sandbox) au sein de LevelUP, détenant ses propres membres, quotas, et données de progression d'apprentissage.

## AccessPolicy (Politique d'Accès)
Règle logique évaluant les autorisations d'accès aux ressources sur la base de rôles (RBAC) et d'attributs de requêtes (ABAC).

## AuditEventRecord (Journal d'Audit)
Enregistrement d'activité sensible, chaîné cryptographiquement au log précédent, stocké dans un registre immuable pour prévenir la fraude.

## ModelVersionRecord (Version de Modèle)
Enregistrement immuable de l'état structurel d'un modèle de compétences ou de parcours à un instant T, signé par SHA-256.

## CatalogEntry (Entrée de Catalogue)
Fiche d'indexation et de catégorisation d'une ressource pédagogique dans le catalogue de gouvernance, régissant son exposition et sa licence d'abonnement.
