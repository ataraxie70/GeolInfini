# Revue contradictoire du DDD stratégique — Écosystème de livraison

**Document 3A — Validation du modèle DDD stratégique**  
**Version : 0.1**  
**Date : 25 août 2026**  
**Statut : BASELINE DE VALIDATION**  
**Entrée principale : DDD stratégique v0.1**

---

## 0. Objet

Cette revue contradictoire teste le DDD stratégique v0.1 contre les scénarios métier structurants déjà consolidés.

L'objectif n'est pas de produire une nouvelle architecture, mais de vérifier :

- que les responsabilités métier ont un propriétaire clair ;
- que les frontières de contexte sont cohérentes ;
- que les interactions entre contextes ne créent pas de confusion ;
- que les invariants critiques restent vrais dans les cas normaux et exceptionnels ;
- que le candidat Core Domain résiste aux scénarios réels ;
- que les concepts ambigus sont explicitement identifiés avant le DDD tactique.

Le résultat de cette revue ne constitue pas encore une architecture technique.

---

# 1. Méthode de revue

Chaque scénario est évalué selon cinq axes :

1. **Déclencheur** — quel besoin ou événement démarre le scénario ?
2. **Propriétaire métier** — quel contexte possède la règle principale ?
3. **Contextes impliqués** — quels autres contextes collaborent ?
4. **Invariant critique** — quelle règle ne doit jamais être violée ?
5. **Ambiguïté résiduelle** — qu'est-ce qui doit encore être tranché ?

Statuts utilisés :

- **VALIDÉ** — la frontière actuelle explique correctement le scénario.
- **À AFFINER** — la frontière est plausible mais nécessite une règle plus précise.
- **CONTRADICTION** — le modèle actuel crée une responsabilité incohérente.
- **HYPOTHÈSE** — le scénario dépend d'une hypothèse terrain encore non démontrée.

---

# 2. Scénario S01 — Création puis complétion d'une mission

### Déroulement

```text
Demande
  → Mission créée
  → Informations manquantes
  → Mission complétée
  → Mission prête
```

### Analyse

**Propriétaire :** Mission Orchestration.

**Contexte impliqué :** Identity & Organization pour l'identité et les droits.

**Invariant :** une mission créée n'est pas exécutable tant que les informations critiques ne sont pas suffisantes.

### Verdict

**VALIDÉ.**

La séparation entre création, complétion et préparation est nécessaire. Elle évite de transformer une intention partiellement renseignée en ordre d'exécution.

### Décision

`Mission Orchestration` reste propriétaire du cycle de vie de la mission.

---

# 3. Scénario S02 — Publication d'une mission ouverte

### Déroulement

```text
Mission prête
  → Ouverture
  → Recherche de capacités éligibles
  → Exposition
```

### Analyse

**Propriétaire :** Capacity Exchange pour l'exposition et l'éligibilité.

**Source :** Mission Orchestration.

**Dépendances :**
- Capacity & Availability
- Location & Journey
- règles d'organisation et d'autorisation

### Point critique

`Mission Orchestration` ne doit pas décider elle-même quelle capacité est éligible.

Il doit exprimer le besoin.

`Capacity Exchange` transforme ce besoin en opportunité d'échange.

### Verdict

**VALIDÉ.**

Cette séparation renforce la pertinence du candidat Core Domain.

---

# 4. Scénario S03 — Mission adressée directement à une capacité

### Déroulement

```text
Mission prête
  → Capacité ciblée
  → Proposition
  → Acceptation / refus
```

### Analyse

Ce scénario ne doit pas contourner Capacity Exchange.

Même lorsque la demande vise directement un acteur, il existe toujours une logique d'engagement de capacité.

### Verdict

**VALIDÉ AVEC AFFINEMENT.**

### Règle à ajouter

Une mission adressée directement peut utiliser un chemin d'exposition restreint, mais l'acceptation et l'engagement restent gouvernés par le modèle d'échange de capacité.

---

# 5. Scénario S04 — Délégation inter-organisationnelle

### Déroulement

```text
Organisation A
  → demande une capacité externe
  → opportunité d'échange
  → Organisation B / opérateur
  → acceptation
  → exécution
```

### Analyse

La délégation n'est pas un changement automatique de titulaire.

Elle est une **modalité d'engagement d'une capacité externe**.

### Propriétaires

- Mission Orchestration : état de la mission et titulaire.
- Capacity Exchange : recherche, proposition, engagement et délégation.
- Execution & Custody : exécution physique.

### Verdict

**VALIDÉ.**

### Décision DDD-P05

La délégation est modélisée comme une capacité d'échange inter-organisationnelle et non comme un transfert automatique de propriété de mission.

---

# 6. Scénario S05 — Capacité indisponible après proposition

### Déroulement

```text
Capacité disponible
  → proposition
  → capacité devient indisponible
  → proposition invalidée / refusée
  → nouvelle recherche
```

### Analyse

Le modèle actuel révèle ici une nécessité :

`Capacity & Availability` possède la vérité sur la disponibilité.

`Capacity Exchange` possède la vérité sur l'engagement d'une capacité dans une opportunité.

### Verdict

**À AFFINER.**

### Décision de modélisation

Il faut distinguer :

```text
Disponibilité
    ≠
Éligibilité
    ≠
Proposition
    ≠
Engagement
    ≠
Prise en charge
```

Cette distinction devient un invariant stratégique supplémentaire.

---

# 7. Scénario S06 — Acceptation sans prise en charge

### Déroulement

```text
Mission acceptée
  → déplacement / préparation
  → colis pas encore reçu
```

### Analyse

La mission peut être acceptée sans que la garde physique commence.

### Verdict

**VALIDÉ.**

### Invariant confirmé

> Acceptation ou attribution ≠ prise en charge physique.

C'est un invariant structurel du domaine et non un simple détail d'interface.

---

# 8. Scénario S07 — Prise en charge avec anomalie

### Déroulement

```text
Arrivée
  → constat d'état apparent
  → réserve
  → prise en charge confirmée avec anomalie
```

### Analyse

Le modèle doit permettre une prise en charge et une réserve corrélées au même événement opérationnel.

`Execution & Custody` possède le fait opérationnel.

`Trust & Evidence` conserve la preuve et la traçabilité.

### Verdict

**VALIDÉ.**

### Point à préciser en DDD tactique

La réserve ne doit pas devenir un objet générique sans contexte.

Elle doit être typée selon le contexte qui la produit.

---

# 9. Scénario S08 — Transfert de garde

### Déroulement

```text
Responsable A
  → remise
  → confirmation par B
  → garde B
```

### Analyse

`Execution & Custody` est le propriétaire du changement de garde.

`Trust & Evidence` conserve les éléments nécessaires à la reconstruction de l'historique.

### Verdict

**VALIDÉ FORTEMENT.**

Le modèle actuel résiste très bien à ce scénario.

### Invariant

> Un transfert de garde n'existe métier qu'après confirmation du nouveau responsable physique.

---

# 10. Scénario S09 — Passage par un point relais / gare

### Déroulement

```text
Opérateur A
  → point de transfert
  → dépôt
  → réception par B
  → reprise
```

### Analyse

Ce scénario révèle une frontière importante entre :

- la représentation du lieu ;
- l'événement de garde ;
- l'étape de mission.

Le point relais n'est pas nécessairement un acteur d'exécution.

### Verdict

**À AFFINER.**

### Décision provisoire

`Location & Journey` décrit le lieu et son rôle spatial.

`Execution & Custody` possède le transfert de garde.

`Mission Orchestration` possède l'étape métier.

Cela évite de faire du « relais » un contexte autonome prématurément.

---

# 11. Scénario S10 — Plusieurs missions sur un même trajet

### Déroulement

```text
Capacité disponible
  → mission A
  → mission B
  → mission C
  → compatibilité de parcours
  → engagement
```

### Analyse

C'est un scénario central pour la thèse stratégique.

La valeur ne vient pas seulement de la proximité entre livreur et mission, mais de la capacité à reconnaître une compatibilité entre plusieurs contraintes.

### Propriétaires

- Capacity Exchange : décision d'opportunité / compatibilité métier.
- Location & Journey : représentation spatiale et contraintes de parcours.
- Capacity & Availability : disponibilité réelle.
- Mission Orchestration : état des missions.

### Verdict

**VALIDÉ — SCÉNARIO CRITIQUE POUR LE CORE DOMAIN.**

Il renforce l'hypothèse selon laquelle le cœur du système se situe dans l'orchestration de capacités et non dans le simple suivi d'une mission.

---

# 12. Scénario S11 — Capacité qui refuse une proposition

### Déroulement

```text
Proposition
  → refus
  → capacité reste disponible
  → nouvelle proposition possible
```

### Analyse

Un refus ne doit pas être interprété comme une indisponibilité.

### Verdict

**VALIDÉ AVEC AFFINEMENT.**

### Invariant ajouté

> Refus d'une opportunité ≠ retrait de disponibilité.

---

# 13. Scénario S12 — Incident pendant l'exécution

### Déroulement

```text
Exécution
  → incident
  → mission perturbée
  → action corrective
```

### Analyse

Le terme `Incident` est actuellement trop générique.

Un incident peut être :

- opérationnel ;
- physique / colis ;
- localisation ;
- organisationnel ;
- économique ;
- sécurité / conformité.

### Verdict

**À AFFINER.**

### Décision

Il ne faut pas créer un « Incident Context » générique.

Chaque contexte propriétaire doit posséder ses propres catégories d'exception, puis publier les événements nécessaires à `Trust & Evidence`.

---

# 14. Scénario S13 — Organisation autonome dans le réseau

### Déroulement

```text
Organisation A
  → possède ses membres
  → possède ses règles
  → publie des capacités
  → reçoit des opportunités
  → délègue éventuellement
```

### Analyse

Le réseau ne doit pas devenir le système de gestion interne de l'organisation.

### Verdict

**VALIDÉ.**

### Invariant confirmé

> Interopérabilité ≠ centralisation organisationnelle.

C'est un principe architectural futur mais surtout un invariant métier stratégique.

---

# 15. Scénario S14 — Une personne liée à plusieurs organisations

### Déroulement

```text
Personne
 ├── affiliation A
 ├── affiliation B
 └── activité indépendante
```

### Analyse

Le modèle Identity & Organization doit traiter l'affiliation comme une relation, et non comme une propriété exclusive de la personne.

### Verdict

**VALIDÉ.**

### Conséquence

`Personne`, `Compte opérateur` et `Affiliation` ne doivent pas être fusionnés en une seule abstraction.

---

# 16. Scénario S15 — Mission exécutée par un acteur externe

### Déroulement

```text
Titulaire A
  → délégation
  → capacité B
  → exécution
  → garde B
  → remise
```

### Verdict

**VALIDÉ.**

Ce scénario confirme la nécessité de conserver séparément :

```text
Titulaire
Exécutant
Responsable physique
```

---

# 17. Scénario S16 — Preuve manquante ou contestée

### Déroulement

```text
Événement opérationnel
  → preuve attendue
  → preuve absente / insuffisante
  → événement contestable
```

### Analyse

`Trust & Evidence` ne doit pas devenir propriétaire de la réalité opérationnelle.

Il doit évaluer / conserver la preuve de faits produits par les contextes opérationnels.

### Verdict

**VALIDÉ AVEC AFFINEMENT.**

### Principe

> Le contexte opérationnel produit le fait ; le contexte de preuve rend ce fait vérifiable et exploitable.

---

# 18. Matrice globale de validation

| Scénario | Frontières | Invariants | Verdict |
|---|---|---|---|
| Création / complétion | cohérentes | cohérents | VALIDÉ |
| Mission ouverte | cohérentes | cohérents | VALIDÉ |
| Mission adressée | cohérentes | à préciser | À AFFINER |
| Délégation | cohérentes | cohérents | VALIDÉ |
| Capacité indisponible | à préciser | à préciser | À AFFINER |
| Acceptation sans garde | cohérentes | fort | VALIDÉ |
| Anomalie colis | cohérentes | cohérents | VALIDÉ |
| Transfert de garde | très cohérentes | fort | VALIDÉ |
| Point relais / gare | à préciser | cohérents | À AFFINER |
| Multi-missions | cohérentes | fort | VALIDÉ |
| Refus | cohérentes | à préciser | À AFFINER |
| Incident | trop générique | à préciser | À AFFINER |
| Autonomie organisationnelle | cohérentes | fort | VALIDÉ |
| Multi-affiliation | cohérentes | fort | VALIDÉ |
| Exécutant externe | cohérentes | fort | VALIDÉ |
| Preuve contestée | cohérentes | à préciser | À AFFINER |

**Résultat : aucun scénario ne produit actuellement de contradiction structurelle majeure.**

Le modèle est donc **viable**, mais pas encore suffisamment précis pour être déclaré définitif.

---

# 19. Conclusions fortes de la revue

## C01 — Capacity Exchange devient le candidat Core Domain le plus crédible

Les scénarios de :

- délégation ;
- publication ;
- éligibilité ;
- compatibilité ;
- multi-missions ;
- engagement ;
- circulation de capacité ;

convergent tous vers cette frontière.

Cela renforce l'hypothèse :

> **Le système construit une infrastructure de circulation et d'orchestration de capacités, et non simplement une plateforme de dispatch.**

---

## C02 — Mission Orchestration et Capacity Exchange doivent rester distincts

La mission exprime et porte le besoin.

L'échange de capacité décide comment une capacité peut répondre à ce besoin.

Cette séparation est stratégique.

---

## C03 — Execution & Custody constitue une frontière métier forte

La garde physique est suffisamment critique pour justifier son propre contexte.

Elle ne doit pas être réduite à `Mission.status`.

---

## C04 — Trust & Evidence est probablement un contexte de soutien

Il fournit une capacité stratégique importante, mais il ne doit pas devenir le propriétaire de tous les événements.

---

## C05 — Location & Journey ne doit pas devenir prématurément un « moteur de routing »

Dans le modèle stratégique, son rôle est d'abord :

> représenter et rendre comparable le contexte spatial et temporel.

L'optimisation algorithmique vient ensuite.

---

# 20. Nouveau découpage stabilisé provisoire

Après revue, la carte devient :

```text
                 IDENTITY & ORGANIZATION
                         │
                         ▼
                CAPACITY & AVAILABILITY
                         │
                         ▼
                 ┌─────────────────┐
                 │ CAPACITY        │
                 │ EXCHANGE        │
                 │                 │
                 │ CORE CANDIDATE  │
                 └────────┬────────┘
                          │
             ┌────────────┴────────────┐
             ▼                         ▼
    MISSION ORCHESTRATION       LOCATION & JOURNEY
             │                         │
             ▼                         │
     EXECUTION & CUSTODY ◄────────────┘
             │
             ▼
      TRUST & EVIDENCE
             │
             ▼
    SETTLEMENT & ECONOMICS
```

Cette carte est une **baseline DDD v0.2 candidate**, pas encore une architecture.

---

# 21. Invariants supplémentaires révélés

La revue ajoute provisoirement :

### I-13 — Disponibilité ≠ proposition

Une capacité disponible n'est pas engagée simplement parce qu'elle est éligible.

### I-14 — Proposition ≠ engagement

Une proposition peut être refusée, expirée ou invalidée.

### I-15 — Refus ≠ indisponibilité

Le refus d'une proposition ne modifie pas automatiquement la disponibilité générale.

### I-16 — Délégation ≠ transfert de titularité

La délégation organise l'exécution sans modifier automatiquement le titulaire de la mission.

### I-17 — Le contexte opérationnel possède le fait

Un contexte de preuve ne doit pas créer rétroactivement la réalité métier qu'il documente.

---

# 22. Questions qui restent suffisamment importantes pour bloquer le DDD tactique

Six questions sont maintenant prioritaires :

1. **Qu'est-ce qu'une capacité ?**  
   Personne, véhicule, combinaison de ressources, ou abstraction composable ?

2. **Qu'est-ce qu'un engagement ?**  
   À quel moment une capacité cesse-t-elle d'être libre ?

3. **Quelle est l'unité exacte d'échange ?**  
   Mission complète, étape, lot, segment de trajet ou opportunité ?

4. **Quelle est la frontière entre compatibilité et optimisation ?**

5. **Quelle politique d'ouverture permet l'équité sans rendre l'échange inefficace ?**

6. **Quel niveau de confiance est nécessaire pour qu'une organisation accepte réellement de déléguer une mission à une capacité externe ?**

Ces questions sont désormais plus importantes que la simple nomenclature des objets.

---

# 23. Décision de passage

Le DDD stratégique v0.1 **passe la revue contradictoire sans contradiction structurelle majeure**.

Il n'est cependant pas encore déclaré définitif.

### Statut recommandé

```text
DDD stratégique v0.1
        ↓
REVUE CONTRADICTOIRE
        ↓
        PASS
        ↓
DDD stratégique v0.2
        ↓
Langage ubiquitaire par contexte
        ↓
Arbitrage final Core Domain
        ↓
DDD tactique
```

Le prochain travail n'est donc plus de refaire l'Event Storming.

Il consiste à **affiner les six questions critiques**, puis à formaliser le **langage ubiquitaire propre à chaque Bounded Context**.

C'est ce travail qui permettra ensuite de passer proprement du stratégique au tactique sans contaminer le modèle avec des concepts techniques.
