Voici le **moteur de recommandation de ressources** à mettre derrière ta plateforme.

L’idée n’est pas de “proposer des liens”.
L’idée est de **décider quoi lire, dans quel ordre, et pourquoi**, en fonction de ton niveau réel et de tes erreurs.

---

# 1) Rôle du moteur

Le moteur doit répondre à 4 questions :

1. **Quel sujet ou concept est faible ?**
2. **Quelle ressource corrige exactement ce faible point ?**
3. **Quel type de ressource faut-il maintenant ?**
4. **Quel ordre de lecture respecte la progression ?**

---

# 2) Entrées du moteur

Le moteur doit lire ces données :

## A. État de maîtrise

Pour chaque sujet et concept :

* `mastery_score`
* `last_study_date`
* `last_validation_score`
* `repetition_count`
* `status` : `to_do`, `in_progress`, `to_review`, `validated`, `blocked`

## B. Erreurs observées

Pour chaque erreur :

* type d’erreur
* concept concerné
* gravité
* date
* fréquence de répétition

Exemples :

* erreur mémoire
* confusion entre pointeur et valeur
* mauvaise gestion de `free`
* erreur de syntaxe
* bug logique
* mauvaise lecture de man page

## C. Métadonnées de ressource

Chaque ressource doit avoir :

* `type` : `standard`, `manpage`, `manual`, `book`, `rfc`, `tutorial`
* `is_primary_source`
* `difficulty_level`
* `estimated_read_time`
* `resource_concepts`
* `authority_score`

## D. Contexte d’apprentissage

* sujet courant
* concept en échec
* objectif du jour
* niveau d’énergie ou charge de travail
* urgence de révision

---

# 3) Principe de décision

Le moteur classe les ressources en 4 catégories.

## 3.1 Ressource primaire

C’est la ressource à lire quand tu veux la vérité de base.

Exemples :

* standard C
* man page
* documentation officielle
* RFC
* manuel de référence

## 3.2 Ressource de correction

C’est la ressource qui corrige une erreur précise.

Exemple :

* erreur sur `malloc` → `man malloc`
* erreur sur `fork` → `man fork`
* erreur sur `pthread_mutex` → documentation pthread

## 3.3 Ressource de consolidation

C’est la ressource qui renforce une notion déjà vue mais fragile.

Exemple :

* livre de référence
* guide officiel détaillé
* documentation de structure

## 3.4 Ressource de révision

C’est la ressource courte pour rafraîchir un acquis qui s’affaiblit.

Exemple :

* relire la page man
* relire le résumé du sujet
* revoir un exemple déjà résolu

---

# 4) Logique de recommandation

Le moteur doit suivre cette chaîne :

```text
Erreur ou besoin
→ concept concerné
→ sujet concerné
→ ressources liées
→ tri par pertinence
→ sélection selon le niveau
→ ordre de lecture
```

---

# 5) Score de recommandation

Chaque ressource reçoit un score.
Le score final détermine l’ordre d’affichage.

## Formule proposée

```text
score =
  40 * authority
+ 25 * concept_match
+ 20 * gap_severity
+ 10 * recency_need
+ 5  * level_fit
- 15 * redundancy_penalty
```

---

## 5.1 `authority`

Mesure la fiabilité de la source.

Exemple d’échelle :

* `standard` = 1.0
* `manpage` = 0.95
* `manual` = 0.90
* `rfc` = 0.90
* `book` = 0.80
* `tutorial` = 0.50

Pour ton projet, les sources officielles doivent dominer.

---

## 5.2 `concept_match`

Mesure si la ressource couvre exactement le concept qui bloque.

Exemple :

* ressource couvre exactement le concept = 1.0
* ressource couvre concept voisin = 0.6
* ressource couvre le sujet global sans viser le concept = 0.3

---

## 5.3 `gap_severity`

Mesure la gravité du manque.

Exemple :

* blocage critique = 1.0
* faible compréhension = 0.7
* simple révision = 0.4

---

## 5.4 `recency_need`

Mesure si le sujet doit être revu rapidement.

Exemple :

* erreur récente non corrigée = 1.0
* sujet oublié = 0.8
* sujet déjà stable = 0.2

---

## 5.5 `level_fit`

Mesure si la ressource correspond à ton niveau actuel.

Exemple :

* débutant sur la notion → ressource de base = 1.0
* intermédiaire → ressource plus dense = 0.8
* avancé → référence complète = 1.0

---

## 5.6 `redundancy_penalty`

Pénalité si la ressource est trop proche d’une autre déjà lue récemment.

Exemple :

* déjà lue hier = forte pénalité
* jamais lue = aucune pénalité

---

# 6) Règles de sélection

## Règle 1 — une erreur appelle d’abord une source primaire

Si un concept échoue, le moteur doit proposer en priorité :

1. source officielle
2. ressource de consolidation
3. exercice associé

---

## Règle 2 — un concept mal compris appelle la source la plus exacte

Exemple :

* confusion entre pointeur et adresse
* le moteur doit pointer vers :

  * standard C
  * ressource liée au concept
  * exercice ciblé

---

## Règle 3 — un sujet validé mais fragile appelle la révision

Si le sujet est validé mais sa rétention baisse :

* petite ressource de rappel
* exercice court
* révision espacée

---

## Règle 4 — un sujet nouveau appelle les fondations

Si le sujet est nouveau :

* 1 ressource primaire
* 1 ressource de vue d’ensemble
* 1 exercice guidé

---

## Règle 5 — éviter la surcharge

Le moteur ne doit pas sortir 10 ressources à la fois.

Règle stricte :

* **1 ressource principale**
* **1 ressource secondaire**
* **1 exercice associé**
* **1 rappel de révision**, si nécessaire

---

# 7) Arbre de décision

## Cas A — tu débutes

Le moteur fait :

1. lire la ressource primaire
2. lire un résumé de consolidation
3. faire un exercice guidé

## Cas B — tu fais une erreur

Le moteur fait :

1. détecter le concept fautif
2. choisir la source officielle liée
3. proposer un exercice corrigé
4. programmer une révision courte

## Cas C — tu oublies

Le moteur fait :

1. remonter le sujet
2. afficher la ressource courte de rappel
3. proposer un mini-test
4. reprogrammer la révision

## Cas D — tu es avancé

Le moteur fait :

1. proposer la source de référence la plus dense
2. proposer un cas pratique
3. proposer un mini-projet

---

# 8) Structure de données recommandée

Tu peux ajouter ces tables.

## `resource_concepts`

Lie une ressource à un ou plusieurs concepts.

```sql
resource_concepts (
    id,
    resource_id,
    concept_id
)
```

## `concept_mastery`

Stocke la maîtrise d’un concept.

```sql
concept_mastery (
    id,
    user_id,
    concept_id,
    mastery_score,
    last_seen_at,
    last_score
)
```

## `mistakes`

Stocke les erreurs observées.

```sql
mistakes (
    id,
    user_id,
    subject_id,
    concept_id,
    mistake_type,
    description,
    severity,
    created_at
)
```

## `resource_recommendations`

Stocke les recommandations calculées.

```sql
resource_recommendations (
    id,
    user_id,
    subject_id,
    concept_id,
    resource_id,
    recommendation_reason,
    score,
    status,
    created_at
)
```

---

# 9) Algorithme exact

Voici la logique du moteur.

```text
Pour chaque concept faible ou erreur détectée :

1. Identifier le concept lié
2. Récupérer toutes les ressources liées à ce concept
3. Calculer un score de pertinence pour chaque ressource
4. Trier par score décroissant
5. Prendre la ressource la plus adaptée au niveau courant
6. Ajouter une ressource secondaire si nécessaire
7. Ajouter un exercice lié
8. Enregistrer la recommandation
```

---

# 10) Pseudocode clair

```python
def recommend_resources(user_id, subject_id, concept_id=None):
    target = concept_id or get_weakest_concept(user_id, subject_id)

    resources = get_resources_linked_to_concept(target)

    ranked = []
    for r in resources:
        score = (
            40 * authority_score(r) +
            25 * concept_match_score(r, target) +
            20 * gap_severity_score(user_id, target) +
            10 * recency_need_score(user_id, target) +
            5  * level_fit_score(user_id, r) -
            15 * redundancy_penalty(user_id, r)
        )
        ranked.append((r, score))

    ranked.sort(key=lambda x: x[1], reverse=True)

    main_resource = ranked[0].resource
    secondary_resource = ranked[1].resource if len(ranked) > 1 else None
    exercise = choose_exercise(target, user_id)

    save_recommendation(user_id, subject_id, target, main_resource, "main")
    if secondary_resource:
        save_recommendation(user_id, subject_id, target, secondary_resource, "secondary")
    save_recommendation(user_id, subject_id, target, exercise, "exercise")

    return main_resource, secondary_resource, exercise
```

---

# 11) Ordre de sortie des ressources

Le moteur doit respecter cet ordre :

1. **source primaire**
2. **source de consolidation**
3. **exercice guidé**
4. **exercice autonome**
5. **révision espacée**

---

# 12) Application concrète sur ton domaine C

## Exemple : concept `malloc`

Si tu échoues sur `malloc`, le moteur doit proposer :

1. `man malloc`
2. Valgrind manual
3. exercice dynamique mémoire
4. révision J+1

## Exemple : concept `fork`

Si tu échoues sur `fork`, le moteur doit proposer :

1. `man fork`
2. `man execve`
3. exercice création de processus
4. mini-test sur parent/enfant

## Exemple : concept `pthread`

Si tu échoues sur mutex/race condition, le moteur doit proposer :

1. `pthread_create(3)`
2. documentation pthread mutex
3. exercice multithread protégé
4. révision J+7

---

# 13) Règle de qualité

Une recommandation n’est bonne que si elle :

* cible le vrai concept faible,
* respecte ton niveau actuel,
* vient d’une source fiable,
* mène vers une action concrète.

---

# 14) Ce que ton moteur devient

Avec ce système, ta plateforme ne fait plus juste :

* afficher un plan
* enregistrer des séances

Elle commence à faire ceci :

* détecter une faiblesse
* choisir la bonne ressource
* imposer le bon ordre
* pousser vers la correction
* renforcer la mémoire

---
