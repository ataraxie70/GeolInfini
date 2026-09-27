# Progression Engine
## Unlock / Lock / Validation Rules

## 1. Objectif

Le moteur de progression décide si un plan, une unité, un sujet ou un concept doit être :
- déverrouillé ;
- verrouillé ;
- maintenu en cours ;
- validé ;
- basculé en révision ;
- bloqué.

Il agit comme une couche de contrôle entre :
- la base de connaissance ;
- l’exécution des séances ;
- le moteur de recommandation ;
- l’interface utilisateur.

---

## 2. Philosophie

Le moteur ne doit pas être vague. Il doit être fondé sur des règles mesurables.

### Principes
1. **Un élément ne se déverrouille pas sans ses prérequis.**
2. **Une validation doit être prouvée par un score minimal.**
3. **Un concept faible garde son parent sous surveillance.**
4. **Une révision en retard peut reverrouiller un niveau supérieur si le risque est critique.**
5. **La progression doit toujours être explicable.**

---

## 3. Objets gérés

Le moteur peut gérer :
- `plan`
- `unit`
- `concept`
- `session`
- `subject` si le domaine est orienté apprentissage classique
- `project` si l’élément dépend d’une chaîne de compétences

---

## 4. États possibles

### 4.1 États généraux
- `locked`
- `unlocked`
- `in_progress`
- `validated`
- `blocked`
- `to_review`

### 4.2 États de décision
- `allow_progression`
- `deny_progression`
- `allow_validation`
- `deny_validation`
- `allow_unlock`
- `deny_unlock`

---

## 5. Entrées du moteur

Le moteur reçoit :
- `user_id`
- `plan_id`
- `unit_id` ou `concept_id` ou `subject_id`
- l’historique de maîtrise
- les erreurs récentes
- les révisions dues
- les validations passées
- les dépendances
- les seuils de progression

---

## 6. Règles de déverrouillage

## 6.1 Déverrouillage d’un concept
Un concept peut être déverrouillé si :
- tous ses prérequis sont validés ;
- son unité parente est déverrouillée ;
- aucune révision critique n’est en retard sur un prérequis critique ;
- le score de maîtrise des prérequis est au-dessus du seuil.

### Seuil recommandé
- `mastery_score >= 0.80` pour les prérequis critiques
- `mastery_score >= 0.70` pour les prérequis secondaires

---

## 6.2 Déverrouillage d’une unité
Une unité peut être déverrouillée si :
- son plan est actif ;
- son parent est déverrouillé ;
- au moins le premier concept ou sous-élément est disponible ;
- aucun blocage administratif n’existe.

---

## 6.3 Déverrouillage d’un plan
Un plan peut être déverrouillé si :
- il est actif ;
- il appartient à l’utilisateur ;
- il n’a pas été archivé ;
- aucune règle système ne l’interdit.

---

## 7. Règles de verrouillage

## 7.1 Verrouillage d’un concept
Un concept doit être verrouillé si :
- un prérequis direct est non validé ;
- une erreur bloquante est répétée ;
- la maîtrise est sous le seuil minimum ;
- la révision liée est dépassée au point de compromettre la continuité.

### Exemples de verrouillage
- `malloc` reste verrouillé si les pointeurs ne sont pas acquis.
- `fork` reste verrouillé si les processus ne sont pas compris.
- `systemd` reste verrouillé si les bases Linux sont trop faibles.

---

## 7.2 Verrouillage d’une unité
Une unité doit être verrouillée si :
- son unité parente est verrouillée ;
- ses prérequis structurels ne sont pas remplis ;
- les concepts critiques de l’unité sont trop faibles.

---

## 7.3 Verrouillage d’un plan
Le plan peut être verrouillé si :
- il est inactif ;
- il a été suspendu ;
- les règles système l’exigent.

---

## 8. Règles de validation

## 8.1 Validation d’un concept
Un concept est validé si :
- le score de maîtrise dépasse le seuil ;
- un exercice lié est réussi ;
- le sujet peut être expliqué sans support ;
- une erreur associée a été corrigée ;
- la séance de validation est enregistrée.

### Seuil recommandé
- validation normale : `mastery_score >= 0.80`
- validation forte : `mastery_score >= 0.90`

---

## 8.2 Validation d’une unité
Une unité est validée si :
- tous ses concepts critiques sont validés ;
- les concepts secondaires sont au-dessus du seuil ;
- aucune faiblesse bloquante ne subsiste ;
- les révisions dues ont été traitées.

---

## 8.3 Validation d’un plan
Un plan est validé si :
- toutes ses unités obligatoires sont validées ;
- les projets liés peuvent être exécutés ;
- le niveau global est cohérent ;
- l’utilisateur n’a plus de blocage structurel majeur sur ce plan.

---

## 9. Règles de révision et de retour en arrière

Une progression validée peut être rétrogradée si :
- un score chute sous le seuil ;
- des erreurs répétées apparaissent ;
- une révision critique est ignorée trop longtemps ;
- une notion validée montre une fragilité grave.

### Règles de rétrogradation
- concept validé → `to_review`
- concept `to_review` persistant → `blocked`
- unité validée → `in_progress` si plusieurs concepts critiques retombent

---

## 10. Score de progression

Le moteur doit calculer un score global par niveau.

### 10.1 Score conceptuel
```text
concept_progress =
  0.50 * mastery_score
+ 0.20 * exercise_success
+ 0.15 * validation_score
+ 0.15 * revision_health
```

### 10.2 Score d’unité
```text
unit_progress =
  somme(concepts_validés) / concepts_totaux
- pénalité_blocage
- pénalité_révision_en_retard
```

### 10.3 Score de plan
```text
plan_progress =
  somme(unités_validées) / unités_totales
- pénalité_globale
```

---

## 11. Sortie du moteur

Le moteur doit renvoyer une structure claire.

### Exemple
```json
{
  "entity_type": "concept",
  "entity_id": 22,
  "status": "unlocked",
  "allow_progression": true,
  "allow_validation": false,
  "allow_unlock": true,
  "reason": "All prerequisites validated",
  "blocking_rules": [],
  "next_action": "Start guided exercise",
  "confidence_score": 0.93
}
```

---

## 12. Pseudocode général

```python
function evaluate_progression(user_id, entity_type, entity_id):
    prerequisites = get_prerequisites(entity_type, entity_id)
    mastery = get_mastery_map(user_id, prerequisites)
    revisions = get_due_revisions(user_id, prerequisites)
    mistakes = get_recent_mistakes(user_id, prerequisites)

    blocking_rules = []

    for prereq in prerequisites:
        if mastery[prereq] < threshold(prereq):
            blocking_rules.append({
                "rule": "missing_prerequisite",
                "prereq_id": prereq
            })

    if has_critical_revision(revisions):
        blocking_rules.append({
            "rule": "critical_revision_due"
        })

    if has_repeated_critical_mistakes(mistakes):
        blocking_rules.append({
            "rule": "repeated_critical_mistakes"
        })

    if blocking_rules is not empty:
        return {
            "status": "locked",
            "allow_progression": false,
            "allow_validation": false,
            "blocking_rules": blocking_rules,
            "next_action": recommend_remediation(prerequisites, mistakes, revisions)
        }

    if can_validate(entity_type, entity_id, user_id):
        return {
            "status": "validated",
            "allow_progression": true,
            "allow_validation": true,
            "blocking_rules": [],
            "next_action": "Proceed to next entity"
        }

    return {
        "status": "unlocked",
        "allow_progression": true,
        "allow_validation": false,
        "blocking_rules": [],
        "next_action": "Continue practice"
    }
```

---

## 13. Service layer design

### 13.1 `ProgressionEngine`
Responsable de :
- vérifier les prérequis ;
- évaluer la maîtrise ;
- décider de l’état ;
- produire la recommandation de progression.

### 13.2 `UnlockService`
Responsable de :
- déverrouiller une entité si les règles sont remplies ;
- enregistrer le changement d’état.

### 13.3 `LockService`
Responsable de :
- verrouiller une entité ;
- enregistrer la cause ;
- notifier le moteur de recommandation.

### 13.4 `ValidationService`
Responsable de :
- appliquer les seuils ;
- marquer validé ou non ;
- déclencher révision ou progression.

---

## 14. API recommandée

### `POST /progression/evaluate`
Évalue l’état d’un plan, d’une unité ou d’un concept.

### `POST /progression/unlock`
Force un déverrouillage si les règles le permettent.

### `POST /progression/lock`
Verrouille une entité avec une raison.

### `POST /progression/validate`
Valide une entité après exercice et score.

### `GET /progression/status`
Retourne l’état global de progression.

---

## 15. Règle d’audit

Chaque décision doit être écrite dans `audit_logs` avec :
- type d’entité ;
- état avant ;
- état après ;
- raison ;
- score ;
- horodatage.

---

## 16. Intégration avec le moteur de recommandation

Le moteur de progression doit alimenter le moteur de recommandation.

### Exemple
- concept verrouillé → proposer remédiation
- concept déverrouillé mais non validé → proposer exercice
- concept validé mais fragile → proposer révision
- unité validée → proposer progression normale

---

## 17. Règle finale

Le moteur de progression n’a qu’un but :

**empêcher l’avancement artificiel et garantir que chaque étape est réellement a