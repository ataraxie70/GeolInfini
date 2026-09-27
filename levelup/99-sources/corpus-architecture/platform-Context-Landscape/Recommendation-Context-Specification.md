# Recommendation Context Specification

**Version :** 1.0 (Draft)

**Statut :** Supporting Domain

**Catégorie :** Platform Services

**Code :** LEVELUP-CTX-RECOMMENDATION-001

---

# 1. Objet

Le **Recommendation Context** est le Bounded Context responsable de la production de recommandations pédagogiques personnalisées.

À partir des informations fournies par les différents contextes métier, il identifie la prochaine meilleure action susceptible d'améliorer la progression, la consolidation des fondations ou la démonstration d'une compétence.

Le Recommendation Context ne prend jamais de décision à la place de l'apprenant.

Il fournit une aide à la décision fondée sur des observations objectives.

---

# 2. Mission

Guider chaque apprenant vers les actions les plus pertinentes en fonction de son état réel d'apprentissage, de ses objectifs, de son programme, de sa progression et des preuves déjà observées.

L'objectif n'est pas de recommander davantage de contenu, mais de recommander la meilleure décision pédagogique.

---

# 3. Position dans l'écosystème

Le Recommendation Context appartient à la **Platform Services Layer**.

Il exploite les informations provenant des Core Domains ainsi que les analyses produites par le Analytics Context.

Il fournit des recommandations aux apprenants ainsi qu'aux autres services de la plateforme.

---

# 4. Vision métier

Une bonne recommandation ne consiste pas à proposer davantage de ressources.

Une bonne recommandation consiste à proposer l'action qui maximise les chances d'acquérir durablement une compétence.

Les recommandations doivent respecter les principes fondateurs de LevelUP :

* les fondations avant la spécialisation ;
* la progression vers une compétence démontrée ;
* la consolidation avant l'accélération ;
* la qualité avant la quantité ;
* l'autonomie avant la consommation passive.

---

# 5. Responsabilités

Le Recommendation Context est responsable de :

* analyser le contexte d'apprentissage ;
* produire des recommandations personnalisées ;
* proposer des consolidations ;
* recommander des révisions ;
* suggérer des missions ;
* proposer des évaluations ;
* recommander des ressources adaptées ;
* suggérer des ajustements de rythme ;
* prioriser les prochaines actions.

Il n'est jamais responsable :

* de modifier un programme ;
* de valider une compétence ;
* de créer des activités ;
* de modifier les modèles pédagogiques ;
* de prendre des décisions obligatoires.

---

# 6. Ubiquitous Language

## Recommendation

Suggestion argumentée destinée à améliorer le parcours d'apprentissage.

---

## Recommendation Engine

Service chargé de produire les recommandations.

---

## Learning Context Snapshot

Vue consolidée de l'état actuel d'un apprenant.

---

## Recommendation Rule

Règle métier utilisée pour produire une recommandation.

---

## Recommendation Reason

Justification expliquant pourquoi une recommandation est proposée.

---

## Recommendation Priority

Niveau de priorité attribué à une recommandation.

---

## Next Best Action

Action considérée comme la plus pertinente à un instant donné.

---

## Recommendation Outcome

Résultat observé après la mise en œuvre d'une recommandation.

---

# 7. Modèle métier

```text
Learning Context Snapshot
        │
        ├── Program
        ├── Activity
        ├── Progress
        ├── Assessment
        ├── Analytics
        │
        ▼
Recommendation Engine
        │
        ├── Recommendation Rules
        ├── Decision Models
        ├── Prioritization
        │
        ▼
Recommendations
```

---

# 8. Types de recommandations

Le Recommendation Context peut produire plusieurs catégories de recommandations.

## Consolidation

Renforcer une connaissance ou une compétence avant de poursuivre.

---

## Revision

Revoir une notion précédemment étudiée.

---

## Learning Activity

Proposer une nouvelle activité d'apprentissage.

---

## Mission

Suggérer une mission pratique adaptée au niveau observé.

---

## Assessment

Recommander une évaluation lorsque les preuves semblent suffisantes.

---

## Resource

Suggérer une ressource de référence pertinente.

---

## Learning Pace

Proposer un ajustement du rythme de travail.

---

## Learning Path

Recommander un changement ou une extension du parcours lorsque cela est pertinent.

---

# 9. Principes métier

## Principe 1 — Les recommandations sont explicables

Chaque recommandation est accompagnée d'une justification.

---

## Principe 2 — Les fondations sont prioritaires

Une faiblesse sur une fondation prévaut toujours sur une spécialisation.

---

## Principe 3 — Les recommandations sont personnalisées

Deux apprenants suivant le même parcours peuvent recevoir des recommandations différentes.

---

## Principe 4 — Les recommandations ne sont jamais obligatoires

L'apprenant reste responsable de ses décisions.

---

## Principe 5 — Les recommandations évoluent

Toute nouvelle observation peut modifier les recommandations proposées.

---

# 10. Agrégats

## Aggregate Root

### Recommendation Workspace

Le Recommendation Workspace regroupe les recommandations actives produites pour un apprenant.

---

# 11. Entités

Le contexte contient notamment les entités suivantes :

* Recommendation
* Recommendation Workspace
* Recommendation Rule
* Recommendation Reason
* Recommendation Outcome
* Recommendation History

---

# 12. Value Objects

Les principaux Value Objects sont :

* RecommendationId
* RecommendationPriority
* RecommendationCategory
* RecommendationScore
* RecommendationStatus
* RecommendationDate
* ConfidenceLevel
* NextBestAction

---

# 13. Domain Services

Les principaux services métier sont :

* Recommendation Engine
* Decision Engine
* Recommendation Prioritizer
* Recommendation Explainer
* Recommendation Evaluator

---

# 14. Domain Events

Les principaux événements métier sont :

* RecommendationGenerated
* RecommendationUpdated
* RecommendationAccepted
* RecommendationDismissed
* RecommendationExpired
* RecommendationEvaluated

---

# 15. Invariants

Le Recommendation Context garantit notamment que :

* chaque recommandation possède une justification explicite ;
* chaque recommandation est liée à un état observable de l'apprenant ;
* les recommandations sont historisées ;
* les recommandations n'altèrent jamais directement les données des autres contextes ;
* les règles utilisées sont versionnées et traçables.

---

# 16. Interfaces exposées

Le Recommendation Context expose notamment les capacités suivantes :

* consulter les recommandations actives ;
* consulter la justification d'une recommandation ;
* obtenir la prochaine meilleure action ;
* filtrer les recommandations par catégorie ;
* consulter l'historique des recommandations ;
* évaluer la pertinence d'une recommandation.

---

# 17. Relations avec les autres Contexts

## Program Context

Fournit le programme personnel de l'apprenant.

---

## Activity Context

Fournit les activités réalisées et planifiées.

---

## Progress Context

Fournit l'état de maîtrise observé.

---

## Assessment Context

Fournit les résultats des évaluations et des validations.

---

## Analytics Context

Fournit les analyses et tendances permettant d'améliorer les recommandations.

---

## Resource Catalog Context

Fournit les ressources pouvant être proposées en réponse à une recommandation.

---

# 18. Décisions architecturales

Le Recommendation Context constitue le système d'aide à la décision pédagogique de LevelUP.

Il ne remplace jamais le jugement de l'apprenant ni les décisions des Core Domains.

Les recommandations sont produites à partir d'informations consolidées provenant des différents contextes métier et reposent sur des règles explicites, traçables et évolutives.

La finalité du Recommendation Context est d'orienter l'apprenant vers la meilleure action pédagogique possible afin de maximiser l'acquisition durable de compétences réelles, conformément aux principes fondateurs de LevelUP.
