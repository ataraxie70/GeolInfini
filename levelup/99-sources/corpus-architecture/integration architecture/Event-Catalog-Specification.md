# Event Catalog Specification

**Version :** 1.0 (Draft)

**Statut :** Architecture Foundation

**Catégorie :** Enterprise Integration Architecture

**Code :** LEVELUP-ARCH-EVENT-CATALOG-001

---

# 1. Objet

Le **Event Catalog** constitue le registre officiel de l'ensemble des événements publiés dans l'écosystème LevelUP.

Il centralise les contrats d'événements, leur définition métier, leur gouvernance et leurs caractéristiques afin de garantir une communication cohérente entre les Bounded Contexts.

Le catalogue ne définit pas l'architecture des événements. Celle-ci est décrite dans le document **Event Architecture Specification**.

Il référence les événements autorisés par cette architecture.

---

# 2. Mission

Fournir une source de référence unique recensant tous les événements officiels de la plateforme, leurs producteurs, leurs consommateurs et leurs contrats publics.

---

# 3. Vision

Chaque événement publié devient un élément du patrimoine architectural de LevelUP.

Il est documenté, versionné, gouverné et maintenu comme un contrat officiel entre les Bounded Contexts.

Aucun événement d'intégration ne peut être publié sans être enregistré dans le catalogue.

---

# 4. Objectifs

Le Event Catalog vise à :

* recenser les événements officiels ;
* documenter leur signification métier ;
* identifier leurs producteurs et consommateurs ;
* garantir la stabilité des contrats ;
* faciliter l'évolution de l'architecture ;
* améliorer la traçabilité des échanges.

---

# 5. Organisation du catalogue

Les événements sont regroupés par Bounded Context producteur.

Exemples :

* Learning Context
* Knowledge Context
* Activity Context
* Assessment Context
* Progress Context
* Competency Context
* Portfolio Context
* Analytics Context
* Recommendation Context

Chaque contexte est responsable des événements qu'il publie.

---

# 6. Fiche descriptive d'un événement

Chaque événement référencé possède une fiche normalisée comprenant notamment :

* nom de l'événement ;
* description métier ;
* catégorie ;
* contexte producteur ;
* contextes consommateurs ;
* contrat (*payload*) ;
* version ;
* statut (actif, expérimental, déprécié, retiré) ;
* date d'introduction ;
* historique des versions ;
* remarques de gouvernance.

---

# 7. Catégories d'événements

Le catalogue distingue plusieurs catégories :

* événements métier (*Business Events*) ;
* événements d'intégration (*Integration Events*) ;
* événements système (*System Events*).

Cette classification facilite la gouvernance et la compréhension des échanges.

---

# 8. Cycle de vie

Tout événement suit le cycle de vie suivant :

1. proposition ;
2. revue d'architecture ;
3. validation ;
4. publication dans le catalogue ;
5. utilisation par les Contexts ;
6. évolution ou dépréciation ;
7. retrait éventuel.

Aucun événement ne peut être utilisé avant sa validation officielle.

---

# 9. Gouvernance

Chaque événement possède :

* un propriétaire ;
* un Bounded Context responsable ;
* une politique de versionnement ;
* une stratégie de compatibilité ;
* une documentation maintenue.

Les modifications suivent les règles définies par l'Integration Architecture Specification.

---

# 10. Versionnement

Les événements sont versionnés indépendamment.

Toute évolution incompatible entraîne la création d'une nouvelle version du contrat.

Les anciennes versions peuvent être maintenues selon la politique de gouvernance.

---

# 11. Contraintes

Le catalogue ne contient que des événements publics ou destinés à être partagés.

Les Domain Events internes à un Bounded Context peuvent être documentés localement mais ne figurent pas obligatoirement dans le catalogue global.

---

# 12. Relations avec les autres documents

Le Event Catalog complète les spécifications suivantes :

* Event Architecture Specification ;
* Integration Architecture Specification ;
* Published Language Specification ;
* API Contract Specification ;
* Shared Kernel Architecture Specification.

Il constitue la référence officielle des événements publiés dans l'écosystème LevelUP.

---

# 13. Exemple de structure

Chaque fiche d'événement peut être représentée selon le modèle conceptuel suivant :

```text
Event
│
├── Name
├── Description
├── Category
├── Producer Context
├── Consumer Contexts
├── Contract
├── Version
├── Status
├── Introduced At
├── Deprecated At
└── Notes
```

Cette structure normalise la documentation de tous les événements.

---

# 14. Décisions architecturales

Le Event Catalog est le registre officiel des événements de LevelUP.

Il garantit que tous les événements d'intégration sont identifiés, documentés, gouvernés et versionnés avant leur utilisation.

En séparant la définition des principes (Event Architecture) de l'inventaire des événements (Event Catalog), LevelUP assure une architecture évolutive, maîtrisée et facilement maintenable, où les échanges entre Contexts reposent sur des contrats explicites et durables.
