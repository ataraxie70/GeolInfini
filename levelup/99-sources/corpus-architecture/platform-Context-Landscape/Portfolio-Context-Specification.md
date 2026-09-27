# Portfolio Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-PORTFOLIO-001

---

# 1. Objet

Le **Portfolio Context** est le Bounded Context responsable de la constitution, de l'organisation et de la présentation des preuves démontrant les compétences acquises par un apprenant.

Il agrège les réalisations issues des différents contextes métier afin de construire une représentation fidèle, traçable et évolutive du parcours de développement des compétences.

Le Portfolio Context ne produit aucune preuve.

Il organise les preuves produites par les autres contextes.

---

# 2. Mission

Constituer un portefeuille de preuves permettant de démontrer les connaissances, les compétences, les réalisations et les validations obtenues au cours du parcours d'apprentissage.

---

# 3. Position dans l'écosystème

Le Portfolio Context appartient à la **Platform Services Layer**.

Il consomme les informations publiées par les Core Domains et par les autres Supporting Domains.

Il ne modifie jamais les données de leurs contextes d'origine.

---

# 4. Vision métier

Le Portfolio représente la mémoire professionnelle de l'apprenant.

Il ne décrit pas ce que l'apprenant affirme savoir faire.

Il présente ce qu'il est capable de démontrer à travers des preuves objectives, vérifiables et contextualisées.

Chaque compétence présentée dans le Portfolio est associée à un ensemble de preuves permettant d'en apprécier le niveau de maîtrise.

---

# 5. Responsabilités

Le Portfolio Context est responsable de :

* agréger les preuves produites par les autres contextes ;
* organiser les preuves par compétence ;
* constituer des dossiers de preuves (*Evidence Sets*) ;
* présenter l'évolution des compétences dans le temps ;
* produire des vues adaptées à différents usages (professionnel, académique, personnel) ;
* conserver l'historique des réalisations.

Il n'est jamais responsable :

* de valider une compétence ;
* de délivrer une certification ;
* de calculer la progression ;
* de créer des activités ;
* de modifier les résultats d'évaluation.

---

# 6. Ubiquitous Language

## Portfolio

Représentation consolidée des compétences démontrées par un apprenant.

---

## Evidence

Élément attestant objectivement d'une connaissance, d'une compétence ou d'une réalisation.

---

## Evidence Set

Ensemble cohérent de preuves associées à une compétence donnée.

---

## Achievement

Réalisation significative pouvant enrichir le Portfolio.

---

## Competency Profile

Vue synthétique d'une compétence et des preuves qui lui sont associées.

---

## Portfolio View

Présentation du Portfolio adaptée à un contexte ou à un public spécifique.

---

## Professional Timeline

Historique de l'évolution des compétences et des réalisations.

---

# 7. Sources de preuves

Le Portfolio peut intégrer notamment :

* résultats d'évaluation ;
* validations de compétences ;
* missions réalisées ;
* projets ;
* laboratoires ;
* contributions Open Source ;
* certifications ;
* réalisations personnelles ;
* productions techniques ;
* évaluations par les pairs ;
* preuves externes validées.

---

# 8. Modèle métier

```text
Assessment
Progress
Activity
Certification
Projects
Open Source
Peer Review
        │
        ▼
Evidence Collector
        │
        ▼
Evidence Sets
        │
        ▼
Portfolio
        │
        ├── Competency Profiles
        ├── Professional Timeline
        ├── Portfolio Views
        └── Evidence Explorer
```

---

# 9. Principes métier

## Principe 1 — Une compétence est démontrée par des preuves

Aucune compétence ne peut être présentée sans éléments justificatifs.

---

## Principe 2 — Les preuves restent traçables

Chaque preuve conserve son origine et son contexte de production.

---

## Principe 3 — Les preuves sont cumulatives

Le Portfolio s'enrichit au fil du temps sans perdre l'historique.

---

## Principe 4 — Les vues sont adaptables

Un même Portfolio peut être présenté différemment selon l'objectif poursuivi.

---

## Principe 5 — Le Portfolio est une projection

Le Portfolio représente les données publiées par les autres contextes sans les modifier.

---

# 10. Agrégats

## Aggregate Root

### Portfolio

Le Portfolio constitue la racine d'agrégat.

---

# 11. Entités

Le contexte contient notamment :

* Portfolio
* Competency Profile
* Evidence
* Evidence Set
* Achievement
* Professional Timeline
* Portfolio View

---

# 12. Value Objects

Les principaux Value Objects sont :

* PortfolioId
* EvidenceId
* EvidenceType
* EvidenceStrength
* CompetencyLevel
* TimelineEntry
* PortfolioVisibility
* AchievementCategory

---

# 13. Domain Services

Les principaux services métier sont :

* Evidence Collector
* Evidence Aggregator
* Portfolio Builder
* Portfolio Publisher
* Timeline Generator
* Evidence Verifier

---

# 14. Domain Events

Les principaux événements métier sont :

* EvidenceAdded
* EvidenceUpdated
* EvidenceArchived
* PortfolioUpdated
* PortfolioPublished
* PortfolioViewGenerated

---

# 15. Invariants

Le Portfolio Context garantit notamment que :

* chaque preuve possède une origine identifiable ;
* aucune preuve n'est altérée lors de son intégration ;
* les dossiers de preuves restent cohérents avec les compétences associées ;
* les évolutions sont historisées ;
* les vues du Portfolio sont générées à partir des mêmes données de référence.

---

# 16. Interfaces exposées

Le Portfolio Context expose notamment les capacités suivantes :

* consulter un Portfolio ;
* consulter un dossier de preuves ;
* explorer les preuves par compétence ;
* générer une vue adaptée à un contexte donné ;
* publier un Portfolio ;
* partager un Portfolio selon des règles de visibilité.

---

# 17. Relations avec les autres Contexts

## Assessment Context

Fournit les validations et résultats d'évaluation.

---

## Progress Context

Fournit les niveaux de maîtrise observés.

---

## Activity Context

Fournit les activités réalisées.

---

## Certification Context

Fournit les certifications obtenues.

---

## Analytics Context

Peut produire des indicateurs relatifs à l'évolution du Portfolio.

---

## Search Context

Indexe les éléments publiables du Portfolio selon les règles de confidentialité.

---

# 18. Décisions architecturales

Le Portfolio Context constitue la représentation consolidée des compétences démontrées dans LevelUP.

Il repose sur un principe fondamental : une compétence n'a de valeur que si elle peut être justifiée par des preuves objectives, traçables et contextualisées.

Le Portfolio est une projection construite à partir des événements et des validations produits par les autres contextes. Il ne crée aucune donnée métier nouvelle et ne remet jamais en cause les décisions prises par les Core Domains.

Cette architecture garantit que le Portfolio demeure une source fiable de démonstration des compétences, au service de l'apprenant, des recruteurs, des établissements de formation et de tout acteur souhaitant évaluer la réalité des acquis.
