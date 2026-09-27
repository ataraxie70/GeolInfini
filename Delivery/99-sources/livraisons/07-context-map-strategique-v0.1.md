# Context Map — Écosystème de livraison

**Document 07 — Context Map stratégique**  
**Version : 0.1**  
**Date : 25 août 2026**  
**Statut : BASELINE DDD STRATÉGIQUE**

---

## 0. Objet

Ce document formalise les relations entre les Bounded Contexts issus du DDD stratégique v0.2 et du langage ubiquitaire v0.1.

Il ne décrit pas encore les composants logiciels, les APIs, les bases de données ou les technologies.

Il décrit :

- les frontières de responsabilité ;
- les relations entre contextes ;
- les directions de dépendance métier ;
- les contrats conceptuels d'échange ;
- les relations Customer/Supplier ;
- les relations conformistes ou ACL lorsqu'elles sont nécessaires ;
- le flux particulier d'une mission ouverte ;
- les règles d'accès équitable aux opportunités ;
- les points de découplage qui devront être préservés lors du DDD tactique.

---

# 1. Bounded Contexts retenus

Le modèle stratégique retient huit contextes.

| Code | Bounded Context | Responsabilité principale |
|---|---|---|
| BC-01 | Identity & Organization | Identité, organisation, affiliations, rôles et autorisations |
| BC-02 | Capacity & Availability | Définition des capacités et état de leur disponibilité |
| BC-03 | Mission Orchestration | Cycle de vie de la mission et de ses étapes |
| BC-04 | Capacity Exchange | Éligibilité, exposition, compatibilité, proposition, engagement et délégation |
| BC-05 | Execution & Custody | Exécution physique, prise en charge, garde et transfert |
| BC-06 | Location & Journey | Contexte spatial, lieux, étapes spatiales et contraintes de trajet |
| BC-07 | Trust & Evidence | Preuves, historique vérifiable, signaux de confiance et contestation |
| BC-08 | Settlement & Economics | Tarification, rémunération, frais, commissions et règlement |

---

# 2. Carte stratégique

```text
                         ┌─────────────────────────┐
                         │ Identity & Organization │
                         └────────────┬────────────┘
                                      │
                         identité / affiliation /
                         autorisation
                                      │
                                      ▼
                         ┌─────────────────────────┐
                         │ Capacity & Availability│
                         └────────────┬────────────┘
                                      │
                         capacité / disponibilité
                                      │
                                      ▼
┌────────────────────┐      ┌─────────────────────────┐
│ Mission            │─────▶│                         │
│ Orchestration      │      │     Capacity Exchange   │
└─────────┬──────────┘      │       CORE DOMAIN       │
          │                 │                         │
          │ besoin /        └──────┬──────┬───────────┘
          │ opportunité             │      │
          │                         │      │
          ▼                         ▼      ▼
┌────────────────────┐     ┌────────────┐ ┌─────────────────────┐
│ Location & Journey │◀────│ Execution  │ │ Trust & Evidence    │
└────────────────────┘     │ & Custody  │ └─────────────────────┘
                           └─────┬──────┘
                                 │
                                 ▼
                       ┌─────────────────────┐
                       │ Settlement &        │
                       │ Economics            │
                       └─────────────────────┘
```

Cette carte exprime une règle fondamentale :

> Aucun contexte ne doit absorber la responsabilité d'un autre contexte simplement parce qu'il a besoin de son information.

---

# 3. Positionnement du Core Domain

`Capacity Exchange` est la frontière stratégique centrale.

Il transforme :

```text
besoin d'exécution
      +
capacités disponibles
      +
contraintes
      +
règles d'exposition
      +
signaux de confiance
```

en :

```text
opportunité exposée
      →
proposition
      →
engagement
      →
éventuellement délégation
```

Il ne possède cependant pas :

- le cycle de vie complet de la mission ;
- la disponibilité brute d'une capacité ;
- la garde physique ;
- la vérité géographique ;
- la preuve opérationnelle ;
- le règlement financier.

---

# 4. Relations entre contextes

## 4.1 Identity & Organization → Capacity & Availability

**Relation : Customer/Supplier**

Identity & Organization fournit :

- identité de la personne ;
- organisation ;
- affiliation ;
- rôle ;
- autorisation.

Capacity & Availability transforme ces éléments en capacité opérationnelle.

### Contrat conceptuel

```text
Identity / Affiliation / Role
            ↓
Capacity Definition
```

### Règle

Capacity & Availability ne redéfinit pas l'identité.

---

## 4.2 Identity & Organization → Mission Orchestration

**Relation : Customer/Supplier**

Mission Orchestration dépend de l'identité du demandeur et des droits nécessaires à la création ou à la gestion d'une mission.

---

## 4.3 Identity & Organization → Capacity Exchange

**Relation : Supplier**

Capacity Exchange utilise :

- identité ;
- affiliation ;
- rôle ;
- statut d'autorisation.

Il ne doit pas devenir propriétaire de ces concepts.

---

# 5. Capacity & Availability → Capacity Exchange

**Relation : Supplier**

Capacity & Availability fournit la vérité sur :

- la capacité déclarée ;
- les attributs opérationnels ;
- la disponibilité ;
- les contraintes connues.

Capacity Exchange calcule ensuite :

- éligibilité ;
- compatibilité ;
- exposition ;
- proposition ;
- engagement.

### Invariant

```text
Disponibilité ≠ Éligibilité
```

Une capacité disponible peut être inéligible pour une opportunité particulière.

---

# 6. Mission Orchestration → Capacity Exchange

**Relation : Customer/Supplier**

Mission Orchestration exprime le besoin.

Capacity Exchange détermine comment ce besoin peut être transformé en opportunité d'exécution.

### Flux

```text
Mission
  ↓
Étape
  ↓
Besoin d'exécution
  ↓
Opportunité d'exécution
  ↓
Capacity Exchange
```

### Invariant

Mission Orchestration ne sélectionne pas directement une capacité.

---

# 7. Location & Journey → Capacity Exchange

**Relation : Supplier**

Location & Journey fournit :

- lieux ;
- contexte spatial ;
- contraintes de trajet ;
- informations nécessaires à la comparaison spatiale.

Capacity Exchange utilise ces éléments pour déterminer la compatibilité.

### Séparation

```text
Location & Journey
    = vérité spatiale
```

```text
Capacity Exchange
    = décision d'échange
```

### Invariant

```text
Compatibilité ≠ Optimisation
```

---

# 8. Capacity Exchange → Execution & Custody

**Relation : Customer/Supplier**

Capacity Exchange produit un engagement.

Execution & Custody transforme cet engagement en exécution physique.

```text
Engagement
   ↓
Exécution
   ↓
Prise en charge
   ↓
Garde
```

### Invariant

```text
Engagement ≠ Prise en charge
```

Capacity Exchange ne peut jamais déclarer à lui seul que le colis est physiquement sous la garde d'un acteur.

---

# 9. Execution & Custody → Trust & Evidence

**Relation : Customer/Supplier**

Execution & Custody produit les faits opérationnels :

- prise en charge ;
- transfert ;
- remise ;
- anomalie ;
- événement de garde.

Trust & Evidence produit leur représentation vérifiable.

### Principe

> Le contexte opérationnel produit le fait ; le contexte de preuve rend le fait vérifiable.

---

# 10. Trust & Evidence → Capacity Exchange

**Relation : Supplier**

Capacity Exchange peut consommer des signaux de confiance :

- identité vérifiée ;
- affiliation ;
- historique ;
- preuves d'exécution ;
- incidents pertinents ;
- relations antérieures.

Mais Trust & Evidence ne décide pas de l'engagement.

### Invariant

Un signal de confiance influence une décision ; il ne constitue pas à lui seul la décision.

---

# 11. Capacity Exchange → Settlement & Economics

**Relation : Customer/Supplier**

Capacity Exchange produit les faits nécessaires au règlement :

- engagement ;
- exécution attendue ;
- acteur engagé ;
- éventuelle délégation ;
- résultat opérationnel.

Settlement & Economics calcule et règle :

- rémunération ;
- frais ;
- commissions ;
- partage éventuel ;
- solde.

### Séparation

```text
Capacity Exchange
    = qui s'engage pour quoi ?

Settlement & Economics
    = quelle valeur économique découle de cet engagement ?
```

---

# 12. Mission ouverte — flux de référence

C'est le scénario central ajouté à la carte.

```text
1. Mission créée
        ↓
2. Mission complétée
        ↓
3. Mission prête
        ↓
4. Étape transformée en opportunité
        ↓
5. Vérification des contraintes
        ↓
6. Construction de l'ensemble des capacités éligibles
        ↓
7. Application de la politique d'exposition
        ↓
8. Exposition contrôlée
        ↓
9. Propositions
        ↓
10. Engagement
        ↓
11. Exécution
```

Une mission ouverte n'est donc pas un simple objet visible par tout le monde.

Elle devient une **opportunité d'exécution distribuée selon une politique d'exposition**.

---

# 13. Politique d'exposition

La politique d'exposition est une responsabilité du Core Domain.

Elle doit concilier :

```text
Efficacité
+
Compatibilité
+
Disponibilité
+
Confiance
+
Équité d'accès
+
Intégration des nouveaux entrants
```

Elle ne doit pas être réduite à un classement unique.

---

# 14. Modèle d'exposition progressive

La stratégie retenue est :

```text
                    OPPORTUNITÉ
                         │
                         ▼
                  ENSEMBLE ÉLIGIBLE
                         │
                         ▼
              ┌─────────────────────┐
              │ Exposition initiale │
              └──────────┬──────────┘
                         │
                  aucune prise
                  en charge ?
                         │
                         ▼
              ┌─────────────────────┐
              │ Exposition élargie │
              └──────────┬──────────┘
                         │
                  toujours ouverte ?
                         │
                         ▼
              ┌─────────────────────┐
              │ Nouvelle politique  │
              │ / réévaluation      │
              └─────────────────────┘
```

L'objectif n'est pas de garantir une mission à chaque capacité.

L'objectif est d'éviter qu'une capacité éligible soit structurellement invisible.

---

# 15. Accès équitable

L'équité est définie comme :

> absence de discrimination structurelle dans l'accès aux opportunités pertinentes, tout en conservant les contraintes opérationnelles et économiques nécessaires.

### Conséquence

Un nouvel entrant :

```text
historique = faible ou nul
```

ne doit pas être automatiquement interprété comme :

```text
inéligible
```

Il peut entrer dans des mécanismes d'exposition appropriés pour construire son historique.

---

# 16. Cold Start

Le réseau doit résoudre le cycle :

```text
nouveau
  ↓
aucun historique
  ↓
aucune exposition
  ↓
aucune mission
  ↓
aucun historique
```

La politique doit donc permettre une **exposition initiale contrôlée** aux opportunités pertinentes.

Cette exposition reste soumise à :

- identité ;
- capacité déclarée ;
- disponibilité ;
- contraintes ;
- zone ;
- exigences de l'opportunité ;
- règles de sécurité ;
- autres conditions d'éligibilité.

---

# 17. Anti-Starvation

Le système doit pouvoir détecter :

```text
Capacité active
+
Éligible
+
Disponible
+
Compatible
+
Opportunités pertinentes existantes
+
Exposition durablement nulle
```

Cette situation constitue un **signal de starvation**.

Le système peut alors réévaluer :

- la politique d'exposition ;
- l'ouverture ;
- le périmètre géographique ;
- les critères de compatibilité ;
- les contraintes déclarées ;
- la pertinence des opportunités.

### Important

Anti-Starvation n'est pas :

> garantie de revenu.

C'est :

> mécanisme de détection d'une exclusion structurelle potentielle.

---

# 18. Mission directement adressée

Le cas direct reste distinct :

```text
Demandeur
   ↓
Mission
   ↓
Acteur A
   ↓
Acceptation
   ↓
Engagement
   ↓
Exécution
```

Si A ne peut pas exécuter :

```text
Acteur A
   ↓
demande / déclenche délégation
   ↓
Capacity Exchange
   ↓
Acteur B
```

La délégation ne modifie pas automatiquement le titulaire initial.

---

# 19. Ouverture et réouverture

Une opportunité peut suivre :

```text
ouverte
  ↓
exposée
  ↓
proposition
  ↓
refus
  ↓
réexposition
```

ou :

```text
ouverte
  ↓
proposition
  ↓
engagement
  ↓
engagement invalidé
  ↓
réouverture
```

ou :

```text
ouverte
  ↓
engagement
  ↓
prise en charge
```

### Invariant

Un refus ou une invalidation ne doit pas produire une disparition silencieuse de l'opportunité.

La mission doit rester gouvernée par son propre cycle de vie.

---

# 20. Relations de type DDD

| Relation | Amont | Aval | Nature |
|---|---|---|---|
| R01 | Identity & Organization | Capacity & Availability | Customer/Supplier |
| R02 | Identity & Organization | Mission Orchestration | Supplier |
| R03 | Identity & Organization | Capacity Exchange | Supplier |
| R04 | Capacity & Availability | Capacity Exchange | Supplier |
| R05 | Mission Orchestration | Capacity Exchange | Customer/Supplier |
| R06 | Location & Journey | Capacity Exchange | Supplier |
| R07 | Capacity Exchange | Execution & Custody | Customer/Supplier |
| R08 | Execution & Custody | Trust & Evidence | Customer/Supplier |
| R09 | Trust & Evidence | Capacity Exchange | Supplier |
| R10 | Capacity Exchange | Settlement & Economics | Customer/Supplier |
| R11 | Mission Orchestration | Execution & Custody | Coordination |
| R12 | Location & Journey | Execution & Custody | Supplier |

---

# 21. Ce que le Context Map interdit

Le modèle impose plusieurs interdictions.

### Interdit 1

`Capacity Exchange` ne doit pas devenir un fourre-tout.

Il ne possède pas :

- identité ;
- disponibilité brute ;
- garde ;
- localisation ;
- règlement.

### Interdit 2

`Mission Orchestration` ne doit pas devenir un moteur de matching.

### Interdit 3

`Trust & Evidence` ne doit pas devenir un système de notation global opaque.

### Interdit 4

`Location & Journey` ne doit pas absorber prématurément l'optimisation complète.

### Interdit 5

Aucun contexte ne doit accéder directement à la représentation interne d'un autre contexte comme si les deux partageaient un même modèle.

---

# 22. Bilan du Context Map

Le modèle devient :

```text
                    IDENTITY
                       │
             ┌─────────┼─────────┐
             ▼         ▼         ▼
        CAPACITY     MISSION   CAPACITY
           │           │       EXCHANGE
           │           └─────────┤
           │                     │
           └─────────────────────┤
                                 │
                      LOCATION ──┤
                                 │
                                 ▼
                         EXECUTION & CUSTODY
                                 │
                                 ▼
                         TRUST & EVIDENCE
                                 │
                                 ▼
                         SETTLEMENT & ECONOMICS
```

Avec une règle centrale :

> **Capacity Exchange est le centre décisionnel de l'échange de capacités, mais pas le propriétaire de toutes les données nécessaires à cet échange.**

---

# 23. Décisions proposées pour le registre

### DEC-DDD-01
`Capacity Exchange` est confirmé comme **Core Domain candidat principal**.

### DEC-DDD-02
Une mission ouverte est représentée comme une **opportunité d'exécution exposable**, et non comme une mission simplement publiée à tous.

### DEC-DDD-03
L'exposition des opportunités doit intégrer une politique d'accès équitable.

### DEC-DDD-04
Le cold start des nouveaux entrants est une contrainte stratégique du réseau.

### DEC-DDD-05
Le système doit pouvoir détecter les situations de starvation opérationnelle.

### DEC-DDD-06
L'acceptation d'une proposition ne vaut jamais prise en charge physique.

### DEC-DDD-07
La délégation ne modifie pas automatiquement la titularité de la mission.

---

# 24. Questions encore ouvertes

Le Context Map est suffisamment stable pour poursuivre, mais plusieurs politiques ne doivent pas encore être transformées en algorithmes :

1. fréquence exacte de rotation des opportunités ;
2. durée d'une fenêtre d'exposition ;
3. poids relatif de l'équité et de l'efficacité ;
4. règles précises de réouverture ;
5. critères d'éligibilité par catégorie de capacité ;
6. politique de limitation des propositions simultanées ;
7. mécanismes précis de construction de la confiance.

Ces éléments relèvent désormais de la **politique métier détaillée**, puis du DDD tactique et des expérimentations.

---

# 25. Critère de sortie du Context Map

Le Context Map est considéré comme suffisamment stable pour passer au niveau suivant lorsque :

- les responsabilités des huit contextes sont acceptées ;
- les relations entre contextes sont comprises ;
- Capacity Exchange est confirmé comme frontière du Core Domain ;
- le flux mission ouverte est cohérent ;
- les invariants d'exposition sont acceptés ;
- aucune frontière ne dépend d'une technologie particulière.

À ce stade, le projet pourra entrer dans la **formalisation finale du DDD stratégique**, puis dans le **DDD tactique**.
