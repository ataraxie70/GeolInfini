# DDD stratégique v0.2 — Résolution des six questions critiques

**Écosystème de livraison — Burkina Faso**  
**Document 3B — Arbitrages stratégiques du domaine**  
**Version : 0.2**  
**Date : 25 août 2026**  
**Statut : WORKING BASELINE — ARBITRAGES DDD À VALIDER PAR LE TERRAIN**

---

## 0. Objet

Ce document constitue la suite directe du DDD stratégique v0.1 et de sa revue contradictoire.

Il résout les six questions qui empêchaient de stabiliser le modèle stratégique :

1. Qu'est-ce qu'une capacité ?
2. Qu'est-ce qu'un engagement de capacité ?
3. Quelle est l'unité exacte de l'échange ?
4. Où se situe la frontière entre compatibilité et optimisation ?
5. Quelle politique d'ouverture permet l'équité sans rendre l'échange inefficace ?
6. Quel niveau de confiance est nécessaire pour l'échange entre acteurs autonomes ?

Ces arbitrages servent à stabiliser le langage métier, les responsabilités et les frontières de contexte avant le DDD tactique.

Ils ne constituent toujours pas :

- une architecture technique ;
- un schéma de base de données ;
- une API ;
- une spécification d'algorithme ;
- un MVP définitif ;
- une politique juridique définitive.

---

# 1. Question Q1 — Qu'est-ce qu'une capacité ?

## 1.1 Décision

Une **Capacité** est une capacité opérationnelle offerte par un sujet identifiable et exploitable pendant une période donnée, sous des contraintes explicites, pour exécuter une ou plusieurs étapes de mission.

Une capacité n'est donc :

- ni une personne ;
- ni un véhicule ;
- ni une simple disponibilité ;
- ni une mission ;
- ni une organisation.

Elle représente **ce qu'un acteur est effectivement en mesure d'engager**.

## 1.2 Structure conceptuelle

```text
Sujet
  +
Ressources
  +
Aptitudes
  +
Contraintes opérationnelles
  +
Périmètre spatial
  +
Fenêtre temporelle
  +
Disponibilité
        ↓
CAPACITÉ ÉCHANGEABLE
```

Exemples :

- opérateur à moto disponible dans une zone ;
- opérateur + véhicule utilitaire ;
- équipe opérant un véhicule ;
- capacité organisationnelle provenant d'une flotte ;
- capacité spécialisée pour un type de colis ou de mission.

## 1.3 Décision structurante

Le système échange une **capacité**, pas nécessairement la personne ou le véhicule eux-mêmes.

Cela permet de préserver :

```text
Personne ≠ Capacité
Véhicule ≠ Capacité
Disponibilité ≠ Capacité
Organisation ≠ Capacité
```

Une capacité peut être temporairement disponible, engagée, suspendue ou retirée sans que l'identité du sujet disparaisse.

## 1.4 Conséquence stratégique

Cette définition permet au réseau de grandir sans imposer un modèle unique d'organisation.

**Statut : DÉCISION DDD.**

---

# 2. Question Q2 — Qu'est-ce qu'un engagement de capacité ?

## 2.1 Décision

Un **Engagement de capacité** est le moment métier où une capacité accepte une opportunité d'exécution et devient réservée/obligée pour le périmètre convenu, sous les règles applicables.

Il est distinct de :

```text
Disponibilité
    ↓
Éligibilité
    ↓
Proposition
    ↓
Acceptation
    ↓
ENGAGEMENT
    ↓
Prise en charge
```

## 2.2 Invariant

> **Une capacité ne devient pas engagée parce qu'elle est disponible ou parce qu'elle a été proposée. Elle devient engagée après une acceptation valide de l'opportunité.**

## 2.3 Engagement ≠ garde

Un engagement peut exister avant la prise en charge physique.

```text
Engagement
   ≠
Garde physique
```

La garde commence seulement après la prise en charge confirmée.

## 2.4 Effet sur la disponibilité

Une capacité engagée ne doit plus être considérée comme totalement disponible pour une opportunité incompatible.

Elle peut cependant conserver une capacité résiduelle si le modèle permet la concurrence contrôlée de plusieurs missions.

Cette question sera traitée au DDD tactique et par les règles opérationnelles de concurrence.

**Statut : DÉCISION DDD.**

---

# 3. Question Q3 — Quelle est l'unité exacte de l'échange ?

## 3.1 Décision

L'unité d'échange n'est pas la mission complète.

L'unité d'échange est une **Opportunité d'exécution**, généralement attachée à une **Étape de mission**.

```text
Mission
  ├── Étape 1
  │     └── Opportunité d'exécution
  ├── Étape 2
  │     └── Opportunité d'exécution
  └── Étape 3
        └── Opportunité d'exécution
```

## 3.2 Pourquoi ?

Cela permet :

- la délégation partielle ;
- les points de transfert ;
- les parcours multi-étapes ;
- les missions interurbaines futures ;
- la circulation de capacités sans transférer toute la mission ;
- plusieurs acteurs successifs ;
- la composition de tournées.

## 3.3 Distinction fondamentale

```text
Mission
= intention et coordination globale

Étape
= segment opérationnel du parcours

Opportunité
= unité proposée à une capacité

Engagement
= acceptation de cette opportunité

Prise en charge
= début de la garde physique
```

Cette distinction devient un élément central du langage ubiquitaire.

## 3.4 Cas d'une livraison simple

Une mission peut ne comporter qu'une seule étape.

Dans ce cas :

```text
Mission
  → Étape unique
      → Opportunité
          → Engagement
              → Prise en charge
```

La complexité supplémentaire n'est donc introduite que lorsqu'elle est réellement nécessaire.

**Statut : DÉCISION DDD.**

---

# 4. Question Q4 — Compatibilité vs optimisation

## 4.1 Décision

La **Compatibilité** et l'**Optimisation** sont deux concepts différents.

### Compatibilité

Répond :

> Cette capacité peut-elle raisonnablement exécuter cette opportunité ?

Elle vérifie des contraintes métier.

Exemples :

- zone ;
- fenêtre temporelle ;
- type de véhicule ;
- type de colis ;
- charge ;
- aptitude ;
- autorisation ;
- contraintes de mission ;
- incompatibilité avec un engagement existant.

La compatibilité produit un ensemble de capacités admissibles.

### Optimisation

Répond :

> Parmi les capacités admissibles, laquelle ou quelle combinaison produit le meilleur résultat selon les objectifs retenus ?

Elle peut prendre en compte :

- temps ;
- distance ;
- détour ;
- coût ;
- revenu ;
- taux d'utilisation ;
- priorité ;
- fiabilité ;
- équilibre du réseau.

## 4.2 Règle

> **L'optimisation ne doit jamais rendre compatible une capacité qui viole une contrainte métier.**

Donc :

```text
Contraintes métier
       ↓
COMPATIBILITÉ
       ↓
ensemble admissible
       ↓
OPTIMISATION
       ↓
classement / sélection
```

## 4.3 Frontière DDD

`Capacity Exchange` possède le concept d'opportunité, d'éligibilité et de compatibilité.

Une capacité d'optimisation peut consommer ces informations sans devenir propriétaire de la vérité métier.

`Location & Journey` fournit les données et contraintes spatiales nécessaires.

## 4.4 Conséquence

Nous n'avons pas besoin de construire immédiatement un moteur d'optimisation complexe pour valider le Core Domain.

Le cœur métier existe même avec une sélection simple, tant que la logique d'échange est correcte.

**Statut : DÉCISION DDD.**

---

# 5. Question Q5 — Quelle politique d'ouverture ?

## 5.1 Problème

Une mission ouverte ne peut pas être visible indistinctement à tout le réseau.

Sinon :

- les acteurs les plus grands peuvent capter la demande ;
- le réseau devient bruyant ;
- la confiance baisse ;
- les organisations peuvent refuser l'ouverture ;
- le cold start peut être masqué par une concurrence artificielle.

## 5.2 Décision

L'ouverture d'une opportunité est **contrôlée, graduelle et gouvernée par des règles explicites**.

Elle suit une stratégie d'exposition progressive :

```text
Niveau 0
Cible directe
       ↓
Niveau 1
Capacités / partenaires connus et éligibles
       ↓
Niveau 2
Sous-réseau géographique ou organisationnel pertinent
       ↓
Niveau 3
Réseau ouvert éligible
```

Le passage au niveau suivant intervient lorsqu'aucun engagement valide n'est obtenu dans les conditions prévues.

## 5.3 Règles fondamentales

L'ouverture doit respecter :

- éligibilité ;
- autorisations du titulaire ;
- contraintes géographiques ;
- contraintes temporelles ;
- règles anti-captation ;
- transparence minimale ;
- possibilité de retrait ;
- traçabilité des propositions.

## 5.4 Ce que l'on refuse

Une mission ouverte ne signifie pas :

> « toute personne connectée peut la voir et la prendre ».

Elle signifie :

> **« cette opportunité peut être exposée à un ensemble contrôlé de capacités admissibles selon une politique d'échange. »**

## 5.5 Statut

**DÉCISION DDD DE PRINCIPE + HYPOTHÈSES À TESTER.**

La politique exacte de visibilité, de priorité et d'escalade doit être validée par le terrain.

---

# 6. Question Q6 — Quel niveau de confiance ?

## 6.1 Décision

La confiance ne sera pas réduite à une note unique.

Le système doit distinguer au minimum :

```text
Identité
   +
Affiliation
   +
Droits
   +
Historique vérifiable
   +
Preuves opérationnelles
   +
Fiabilité observée
   +
Relations autorisées
```

## 6.2 Modèle de confiance

Nous proposons une **confiance contextuelle**, plutôt qu'un score universel.

Exemple :

Un acteur peut être :

- fiable pour les livraisons locales ;
- non habilité pour certains colis ;
- nouveau dans les échanges inter-organisationnels ;
- parfaitement connu d'une organisation partenaire.

Il serait donc incorrect de résumer toute cette réalité par :

```text
Score = 82/100
```

## 6.3 Niveaux conceptuels

```text
N0 — Identité inconnue
N1 — Identité vérifiée
N2 — Capacité vérifiée
N3 — Historique opérationnel disponible
N4 — Relation de confiance établie
N5 — Confiance inter-organisationnelle renforcée
```

Ces niveaux ne constituent pas encore une notation publique.

## 6.4 Règle

> **La confiance doit être explicable par des faits et des relations, pas par un score opaque.**

## 6.5 Conséquence sur l'échange

Le niveau de confiance peut influencer :

- l'éligibilité ;
- la visibilité ;
- la possibilité de délégation ;
- le niveau de preuve requis ;
- certaines limites opérationnelles.

Mais il ne doit jamais permettre une exclusion arbitraire sans règle explicable.

**Statut : DÉCISION DDD DE PRINCIPE + VALIDATION TERRAIN REQUISE.**

---

# 7. Synthèse des six décisions

| Question | Décision | Statut |
|---|---|---|
| Q1 — Capacité | capacité opérationnelle échangeable, distincte de personne/véhicule/disponibilité | DÉCIDÉ |
| Q2 — Engagement | acceptation valide transformant une capacité en engagement | DÉCIDÉ |
| Q3 — Unité d'échange | opportunité d'exécution attachée à une étape | DÉCIDÉ |
| Q4 — Compatibilité / optimisation | contraintes d'abord, optimisation ensuite | DÉCIDÉ |
| Q5 — Ouverture | exposition graduelle et contrôlée | DÉCISION DE PRINCIPE |
| Q6 — Confiance | confiance contextuelle fondée sur preuves et relations | DÉCISION DE PRINCIPE |

---

# 8. Conséquence sur le Core Domain

Les six arbitrages renforcent l'hypothèse :

> **Core Domain candidat : orchestration fédérée de l'échange de capacités.**

Ce Core Domain n'est pas :

- le suivi de livraison ;
- le GPS ;
- la gestion d'organisation ;
- le paiement ;
- la gestion des colis ;
- l'optimisation de tournée seule.

Il se situe dans la boucle :

```text
BESOIN
  ↓
ÉTAPE EXÉCUTABLE
  ↓
OPPORTUNITÉ
  ↓
CAPACITÉS ÉLIGIBLES
  ↓
COMPATIBILITÉ
  ↓
EXPOSITION
  ↓
PROPOSITION
  ↓
ENGAGEMENT
  ↓
EXÉCUTION
  ↓
RÉSULTAT / PREUVE
  ↓
HISTORIQUE
```

La valeur stratégique est la transformation de :

```text
capacités dispersées
        ↓
capacités identifiables
        ↓
capacités admissibles
        ↓
capacités échangeables
        ↓
capacité collective exploitable
```

Cette formulation est désormais plus précise que « réseau opérationnel fédéré ».

---

# 9. Ce que cela implique pour les Bounded Contexts

## Identity & Organization

Possède :

- identité ;
- organisation ;
- affiliation ;
- rôles ;
- droits.

Ne possède pas :

- la capacité opérationnelle elle-même.

## Capacity & Availability

Possède :

- capacités ;
- caractéristiques opérationnelles ;
- disponibilité ;
- contraintes propres à la capacité.

Ne décide pas :

- quelle opportunité doit être attribuée.

## Mission Orchestration

Possède :

- mission ;
- étapes ;
- état de coordination ;
- titulaire ;
- demande d'exécution.

Ne décide pas :

- quelle capacité externe est la meilleure.

## Capacity Exchange — CORE CANDIDATE

Possède :

- opportunité ;
- éligibilité ;
- compatibilité ;
- exposition ;
- proposition ;
- engagement ;
- délégation comme mécanisme d'échange.

## Execution & Custody

Possède :

- prise en charge ;
- garde ;
- transfert ;
- remise ;
- état apparent ;
- réserves.

## Location & Journey

Fournit :

- lieux ;
- parcours ;
- contraintes spatiales ;
- compatibilité spatiale/temporelle.

## Trust & Evidence

Possède :

- preuves ;
- historique exploitable ;
- reconstruction des faits ;
- signaux de fiabilité.

## Settlement & Economics

Possède :

- conséquences économiques ;
- commissions ;
- règlement ;
- partage.

---

# 10. Nouvelles frontières conceptuelles stabilisées

Le modèle doit désormais protéger explicitement les distinctions suivantes :

```text
Personne
  ≠
Capacité
  ≠
Disponibilité
  ≠
Éligibilité
  ≠
Proposition
  ≠
Engagement
  ≠
Prise en charge
  ≠
Garde
```

Et :

```text
Mission
  ≠
Étape
  ≠
Opportunité d'exécution
```

Et :

```text
Compatibilité
  ≠
Optimisation
```

Et :

```text
Confiance
  ≠
Score
```

Ces distinctions constituent désormais des **invariants de modélisation stratégique**.

---

# 11. Ce qui reste ouvert

Les six questions sont résolues au niveau stratégique, mais plusieurs paramètres restent volontairement ouverts.

### À valider par le terrain

- seuils de disponibilité ;
- durée de réservation ;
- règles de concurrence entre engagements ;
- critères exacts d'éligibilité ;
- politique de visibilité ;
- mécanisme d'escalade ;
- coût d'une opportunité ;
- modèle économique ;
- seuils de confiance ;
- règles juridiques de délégation ;
- preuve minimale exigée ;
- capacité de plusieurs missions simultanées.

Ces éléments ne doivent pas être inventés avant observation et expérimentation.

---

# 12. Impact sur la prochaine étape

Le DDD stratégique possède maintenant une base suffisamment précise pour passer à l'étape suivante :

## Langage ubiquitaire par Bounded Context

Il faudra produire, pour chaque contexte :

- termes officiels ;
- termes interdits / synonymes à éliminer ;
- définitions ;
- responsabilités ;
- événements entrants ;
- événements sortants ;
- commandes ;
- invariants ;
- objets stratégiques ;
- dépendances vers les autres contextes.

Puis :

```text
DDD stratégique v0.2
        ↓
Ubiquitous Language
        ↓
Context Map stabilisée
        ↓
Core Domain final
        ↓
DDD tactique
```

---

# 13. Critère de sortie du DDD stratégique

Le passage au DDD tactique sera autorisé lorsque :

1. les termes clés n'ont plus plusieurs sens contradictoires ;
2. chaque contexte possède un langage cohérent ;
3. les responsabilités ne se chevauchent pas ;
4. le Core Domain est justifié par la stratégie ;
5. les interactions inter-contextes sont explicables ;
6. les invariants critiques sont localisés ;
7. les cas d'exception structurants sont couverts ;
8. les hypothèses encore ouvertes sont explicitement enregistrées.

---

# 14. Conclusion

Les six questions ont maintenant produit une structure conceptuelle beaucoup plus forte.

Le domaine n'est plus modélisé autour de :

> **« une livraison à affecter à un livreur »**

mais autour de :

> **« une opportunité d'exécution à rendre compatible avec une capacité, puis à engager dans un réseau d'acteurs autonomes, avec responsabilité et preuve traçables ».**

C'est cette abstraction qui rapproche réellement le DDD de notre intention Zero-to-One.

Le candidat Core Domain devient :

> **Orchestration fédérée de l'échange de capacités.**

Statut : **CANDIDAT FORT — À CONFIRMER PAR LE LANGAGE UBIQUITAIRE ET LES VALIDATIONS TERRAIN.**

---

## Historique

| Version | Date | Statut | Évolution |
|---|---|---|---|
| 0.2 | 25 août 2026 | WORKING BASELINE | Résolution des six questions critiques du DDD stratégique. Stabilisation de Capacity, Engagement, Opportunity, Compatibility, Opening Policy et Contextual Trust. |

**Fin du Document 3B — DDD stratégique v0.2**
