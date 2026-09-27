# Moteur de recommandation détaillé
## Plateforme multi-plan d’apprentissage et de planification

## 1. Objectif

Le moteur doit recommander, à tout moment, l’action la plus utile à exécuter pour l’utilisateur.

Cette action peut être :
- une ressource à lire ;
- un concept à revoir ;
- une séance à lancer ;
- un exercice à faire ;
- une révision à programmer ;
- un sujet à débloquer ;
- un plan à poursuivre.

Le moteur doit rester :
- déterministe ;
- explicable ;
- traçable ;
- compatible multi-plan ;
- sensible au niveau réel de l’utilisateur.

---

## 2. Philosophie de décision

Le moteur ne doit pas “deviner”. Il doit décider à partir d’indicateurs mesurables.

### Principes
1. **La révision passe avant la progression.**
2. **La faiblesse détectée passe avant l’objectif abstrait.**
3. **La ressource primaire passe avant le contenu secondaire.**
4. **Le sujet bloqué doit être traité avant le sujet non prioritaire.**
5. **La charge de travail doit moduler l’intensité.**

---

## 3. Entrées du moteur

Le moteur reçoit un contexte utilisateur complet.

### 3.1 Contexte utilisateur
- `user_id`
- `active_plan_id`
- `current_date`
- `daily_session_count`
- `weekly_load`
- `energy_level` optionnel
- `focus_mode` optionnel

### 3.2 État de progression
- plans actifs ;
- unités actives ;
- concepts maîtrisés ;
- concepts faibles ;
- sujets validés ;
- sujets bloqués ;
- révisions dues ;
- ressources déjà consultées.

### 3.3 Historique récent
- dernières séances ;
- erreurs récentes ;
- validations récentes ;
- ressources lues ;
- sujets répétés ;
- blocs de friction.

### 3.4 Métadonnées pédagogiques
- difficulté du sujet ;
- difficulté du concept ;
- autorité de la ressource ;
- type de ressource ;
- niveau cible ;
- dépendances ;
- temps estimé.

---

## 4. Objet de sortie

Le moteur doit produire un objet structuré contenant :

- `recommended_action_type`
- `plan_id`
- `unit_id`
- `subject_id`
- `concept_id`
- `resource_id`
- `session_type`
- `reason`
- `priority_score`
- `confidence_score`
- `next_step`
- `blocked_reason` si applicable

---

## 5. Les quatre couches du moteur

## 5.1 Couche de détection
Détecte ce qui manque réellement.

Entrées typiques :
- erreur récente ;
- révision due ;
- concept faible ;
- sujet bloqué ;
- unité en cours ;
- plan actif.

## 5.2 Couche de priorité
Classe les candidats en fonction de leur urgence.

## 5.3 Couche de sélection
Choisit la meilleure action dans le contexte.

## 5.4 Couche de justification
Explique pourquoi cette action a été proposée.

---

## 6. Hiérarchie des priorités

Le moteur doit respecter l’ordre suivant :

1. **Révision due**
2. **Erreur critique non corrigée**
3. **Concept faible bloquant**
4. **Sujet bloqué par prérequis**
5. **Progression normale du plan**
6. **Consolidation / approfondissement**
7. **Exercice autonome**
8. **Ressource secondaire**

---

## 7. Classification des actions

### 7.1 Relecture / révision
Utilisée quand :
- un concept a été oublié ;
- une révision est due ;
- un ancien sujet redevient fragile.

### 7.2 Remédiation
Utilisée quand :
- une erreur est liée à un concept précis ;
- un blocage apparaît ;
- un point faible se répète.

### 7.3 Progression
Utilisée quand :
- aucune faiblesse urgente ;
- les prérequis sont validés ;
- l’utilisateur peut avancer.

### 7.4 Consolidation
Utilisée quand :
- le concept est connu mais fragile ;
- il faut renforcer la maîtrise ;
- le score est moyen.

---

## 8. Scoring global

Le moteur doit comparer des candidats à l’aide d’un score composite.

### 8.1 Formule générale

```text
priority_score =
  urgency_weight
+ weakness_weight
+ dependency_weight
+ authority_weight
+ level_fit_weight
+ recency_weight
- redundancy_penalty
- overload_penalty
```

### 8.2 Pondérations recommandées

- `urgency_weight` : 0 à 40
- `weakness_weight` : 0 à 30
- `dependency_weight` : 0 à 20
- `authority_weight` : 0 à 10
- `level_fit_weight` : 0 à 10
- `recency_weight` : 0 à 10
- `redundancy_penalty` : 0 à 20
- `overload_penalty` : 0 à 15

### 8.3 Signification
- urgence forte → score haut
- faiblesse bloquante → score haut
- ressource déjà vue récemment → pénalité
- surcharge journalière → pénalité

---

## 9. Types de candidats

Le moteur doit générer plusieurs candidats d’action.

### A. Candidat “resource”
Une ressource à lire.

### B. Candidat “concept_review”
Un concept à revoir.

### C. Candidat “exercise”
Un exercice à faire.

### D. Candidat “session”
Une séance à lancer.

### E. Candidat “revision”
Une révision à réaliser.

### F. Candidat “unlock”
Un sujet à débloquer.

---

## 10. Construction des candidats

## 10.1 Depuis les erreurs
Pour chaque erreur récente :
- identifier le concept concerné ;
- récupérer les ressources liées ;
- créer un candidat remédiation ;
- créer un candidat ressource ;
- créer un candidat exercice.

## 10.2 Depuis les révisions dues
Pour chaque révision due :
- créer un candidat révision ;
- rattacher le concept ;
- rattacher la ressource de rappel si nécessaire.

## 10.3 Depuis les faibles maîtrises
Pour chaque concept faible :
- créer un candidat revue de concept ;
- créer un candidat ressource primaire ;
- créer un candidat exercice ciblé.

## 10.4 Depuis la progression normale
Si rien d’urgent :
- prendre le prochain sujet logique ;
- vérifier ses prérequis ;
- créer une séance de progression.

---

## 11. Sélection de la ressource

Une ressource candidate doit être notée selon :

- autorité ;
- couverture du concept ;
- adéquation au niveau ;
- fraîcheur de consultation ;
- statut primaire ou secondaire.

### 11.1 Formule de ressource

```text
resource_score =
  40 * authority_score
+ 25 * concept_match
+ 15 * gap_severity
+ 10 * level_fit
+ 10 * recency_need
- 20 * redundancy_penalty
```

### 11.2 Règle de classement
Le moteur doit sortir :
1. ressource principale ;
2. ressource secondaire ;
3. exercice ;
4. révision si nécessaire.

---

## 12. Sélection de l’exercice

L’exercice doit correspondre au niveau réel.

### 12.1 Cas de débutant
- exercice guidé
- courte durée
- faible charge cognitive

### 12.2 Cas intermédiaire
- exercice autonome
- adaptation d’un exemple existant
- correction d’erreur

### 12.3 Cas avancé
- challenge
- mini-projet
- résolution d’un cas perturbé

---

## 13. Sélection de la séance

La séance proposée doit dépendre du contexte :

- `study` si nouveau concept ;
- `practice` si concept connu mais fragile ;
- `review` si révision due ;
- `project` si consolidation par production ;
- `class` si plan de type école ;
- `task` si plan de type tâches.

---

## 14. Logique de blocage

Le moteur doit bloquer la progression si :

- le prérequis n’est pas validé ;
- une révision critique est en retard ;
- une erreur bloquante existe ;
- la surcharge est excessive ;
- le niveau de maîtrise est trop faible.

### Blocage explicite
Le moteur doit renvoyer :
- le blocage ;
- la cause ;
- le prochain élément à traiter ;
- la condition de déblocage.

---

## 15. Logique d’adaptation à la charge

Le moteur doit ajuster l’intensité selon la charge.

### Si charge élevée
- choisir une action plus courte ;
- privilégier la révision ;
- éviter le nouveau contenu dense.

### Si charge faible
- autoriser un exercice plus long ;
- proposer un sujet plus exigeant ;
- avancer davantage dans la roadmap.

---

## 16. Recommandation finale produite

La sortie du moteur doit toujours inclure :

- quoi faire maintenant ;
- pourquoi cette action ;
- quelle ressource ;
- quel exercice ;
- quelle prochaine étape.

### Exemple
```json
{
  "recommended_action_type": "revision",
  "plan_id": 1,
  "unit_id": 14,
  "subject_id": 6,
  "concept_id": 22,
  "resource_id": 1011,
  "session_type": "review",
  "reason": "Fuite mémoire détectée récemment, révision due",
  "priority_score": 92,
  "confidence_score": 0.94,
  "next_step": "Lire man malloc puis refaire l’exercice de fuite mémoire"
}
```

---

## 17. Pseudocode général

```python
function recommend_next_action(context):
    candidates = []

    revisions = get_due_revisions(context.user_id, context.plan_id)
    weak_points = get_weak_points(context.user_id, context.plan_id)
    mistakes = get_recent_mistakes(context.user_id, context.plan_id)
    active_units = get_next_units(context.user_id, context.plan_id)

    for revision in revisions:
        candidates.append(build_revision_candidate(revision))

    for weak in weak_points:
        candidates.append(build_remediation_candidate(weak))

    for mistake in mistakes:
        candidates.append(build_error_candidate(mistake))

    if candidates is empty:
        candidates.append(build_progression_candidate(active_units))

    for candidate in candidates:
        candidate.priority_score = compute_priority_score(candidate, context)
        candidate.confidence_score = compute_confidence(candidate, context)

    sort candidates by priority_score desc, confidence_score desc
    return candidates[0]
```

---

## 18. Détail des fonctions de score

### 18.1 `compute_priority_score`
Mesure l’urgence et l’utilité immédiate.

### 18.2 `compute_confidence`
Mesure la fiabilité du choix proposé.

### 18.3 `compute_level_fit`
Mesure si le choix est adapté au niveau courant.

### 18.4 `compute_redundancy_penalty`
Pénalise la répétition excessive d’une même ressource.

---

## 19. Algorithme de sélection final

1. récupérer les révisions dues
2. récupérer les faiblesses
3. récupérer les erreurs
4. générer les candidats
5. scorer les candidats
6. trier
7. choisir le meilleur
8. enregistrer la recommandation
9. journaliser la décision
10. retourner la réponse API

---

## 20. Journalisation obligatoire

Chaque décision du moteur doit être historisée :

- entrée de contexte ;
- candidat retenu ;
- score ;
- raison ;
- ressources proposées ;
- action finale choisie.

Cette journalisation est indispensable pour :
- audit ;
- correction du moteur ;
- amélioration future ;
- explication à l’utilisateur.

---

## 21. Règles anti-erreur

Le moteur ne doit jamais :
- proposer une ressource hors domaine ;
- ignorer une révision due ;
- dépasser trop souvent la charge recommandée ;
- proposer un sujet sans prérequis ;
- suggérer uniquement des ressources secondaires.

---

## 22. Extension future

Le moteur pourra ensuite intégrer :
- fatigue ;
- horaires ;
- historique de réussite ;
- qualité du sommeil ;
- type de journée ;
- vitesse de progression ;
- profil cognitif.

---

## 23. Résultat attendu

À ce stade, la plateforme devient capable de :
- détecter un besoin ;
- choisir la bonne action ;
- justifier le choix ;
- adapter le rythme ;
- améliorer la maîtrise réelle.

