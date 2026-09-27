# Sell Computing — Dossier consolidé



---

# Sell Computing — Index documentaire

## Statut du projet

Nom de travail : **Sell Computing**  
Périmètre fonctionnel consolidé : **plateforme de conseil, recommandation, vente d’ordinateurs, accessoires audio et services techniques**.

## Pile documentaire normalisée

| ID | Document | Rôle |
|---|---|---|
| 01 | Vision et périmètre | Formalise la finalité, les limites et les invariants |
| 02 | Analyse des besoins et personas | Décrit les cibles, leurs douleurs et les parcours |
| 03 | Spécification fonctionnelle | Définit les fonctionnalités et règles métier |
| 04 | Modèle métier DDD | Découpe le domaine en contextes et agrégats |
| 05 | Modèle de données ERD | Fixe les entités, relations et contraintes |
| 06 | Architecture applicative | Décrit la structure logicielle et les modules |
| 07 | Spécification UX/UI | Décrit les parcours, pages et composants |
| 08 | Cahier des charges technique | Fixe la stack, l’infrastructure et l’exécution |
| 09 | Contrats d’interface API | Définit les endpoints, schémas et erreurs |
| 10 | Exigences non fonctionnelles | Sécurité, performance, observabilité, conformité |
| 11 | Feuille de route MVP | Découpe l’ordre d’exécution avant codage |

## Lecture recommandée

1. Vision et périmètre  
2. Analyse des besoins  
3. Spécification fonctionnelle  
4. Modèle métier DDD  
5. Modèle de données  
6. Architecture applicative  
7. UX/UI  
8. Cahier des charges technique  
9. API  
10. NFR  
11. Roadmap MVP

## Hypothèse d’architecture

Architecture retenue pour la phase initiale :

- front-end web public ;
- back-office d’administration ;
- back-end API REST ;
- base de données relationnelle ;
- stockage objet pour médias ;
- moteur de recherche et de filtrage ;
- moteur de recommandation explicable ;
- journalisation et audit.

## Règles de consolidation

- Le site est conçu autour du **besoin utilisateur**, non autour du catalogue.
- La recommandation est une fonction centrale, non accessoire.
- Le reconditionné est traité comme une offre de confiance, avec preuves et contrôles.
- Le périmètre initial doit rester exploitable sans dépendance à un écosystème complexe.



---

# 01 — Vision et périmètre

## 1. Finalité du projet

Sell Computing vise à transformer l’acte d’achat informatique en processus de décision assistée.  
La plateforme ne se limite pas à exposer des produits ; elle :

- identifie le besoin réel ;
- traduit ce besoin en critères techniques ;
- recommande des configurations adaptées ;
- compare les options ;
- accompagne l’achat ;
- prolonge la relation par les services techniques.

## 2. Problème résolu

Le marché informatique impose souvent :

- une terminologie technique opaque ;
- une surcharge de choix ;
- une faible lisibilité du rapport besoin / configuration ;
- une méfiance forte vis-à-vis du reconditionné ;
- une difficulté à relier achat matériel et maintenance.

La plateforme doit réduire ces frictions.

## 3. Proposition de valeur

| Axe | Valeur fournie |
|---|---|
| Conseil | Traduction du besoin en critères compréhensibles |
| Recommandation | Sélection explicable de produits adaptés |
| Comparaison | Différenciation lisible entre options |
| Confiance | Mise en avant de contrôles, garanties et états |
| Service | Demande de maintenance et d’accessoires |
| Éducation | Guides courts, utiles et accessibles |

## 4. Positionnement

Le positionnement est celui d’une plateforme de conseil et de vente à dominante pédagogique.

Le parcours prioritaire est :

```text
Besoin → Recommandation → Comparaison → Décision → Commande → Suivi
```

Le catalogue brut n’est pas le centre de gravité fonctionnel.

## 5. Périmètre fonctionnel initial

### Inclus

- recommandation d’ordinateurs ;
- catalogue de produits ;
- comparaison de produits ;
- filtrage avancé ;
- fiches produits détaillées ;
- gestion du reconditionné ;
- demande d’accessoires non affichés ;
- demande de maintenance ;
- contenus de conseil ;
- administration du catalogue et du contenu ;
- authentification et rôles ;
- suivi des commandes si la vente est active dans le MVP.

### Exclu au départ

- marketplace multi-vendeurs ;
- enchères ;
- chat temps réel complexe ;
- intelligence artificielle générative embarquée dans la décision ;
- application mobile native ;
- automatisation logistique avancée ;
- personnalisation temps réel par tracking comportemental lourd.

## 6. Invariants du système

1. Toute recommandation doit être explicable.  
2. Toute fiche produit doit afficher les éléments de confiance essentiels.  
3. Toute action sensible doit être auditée.  
4. Toute donnée de référence doit avoir un propriétaire métier clair.  
5. Toute suppression logique doit conserver la traçabilité.  
6. Tout contenu public doit être administrable.  

## 7. Hypothèses de départ

- opérateur unique ou équipe centrale ;
- base produit initiale limitée mais propre ;
- priorité au web ;
- monorepo cohérent ;
- architecture modulaire ;
- données relationnelles comme source principale de vérité.

## 8. Critère de succès

Le projet est cohérent si un utilisateur non expert peut :

- exprimer un besoin ;
- recevoir une recommandation lisible ;
- comprendre la justification ;
- comparer sans ambiguïté ;
- acheter ou demander assistance avec confiance.



---

# 02 — Analyse des besoins et personas

## 1. Méthode d’analyse

L’analyse est structurée par :

- profil utilisateur ;
- contexte d’usage ;
- niveau de compétence ;
- contrainte budgétaire ;
- contrainte de mobilité ;
- sensibilité à la confiance ;
- besoin de service après-vente.

## 2. Segments principaux

| Segment | Besoin dominant | Risque principal |
|---|---|---|
| Étudiant | Prix / polyvalence | achat trop faible ou trop complexe |
| Débutant | Guidage | surcharge cognitive |
| Développeur | CPU / RAM / SSD | mauvais arbitrage technique |
| Créateur | écran / GPU / stockage | configuration insuffisante |
| Gamer | GPU / refroidissement | surcoût inutile ou sous-performance |
| Entreprise | volume / stabilité / maintenance | gestion imprécise des besoins |

## 3. Personas fonctionnels

### Persona A — Débutant

- ne maîtrise pas les composants ;
- s’appuie sur une logique de besoin ;
- recherche des explications courtes ;
- a besoin d’un chemin très guidé.

### Persona B — Étudiant

- budget limité ;
- priorité au rapport qualité / prix ;
- recherche de la mobilité et de l’autonomie ;
- sensibilité forte au prix final.

### Persona C — Développeur

- compare CPU, RAM, SSD, système d’exploitation ;
- attend des configurations cohérentes ;
- veut éviter les goulots d’étranglement ;
- apprécie les détails techniques.

### Persona D — Créateur de contenu

- attend un bon écran ;
- sensibilité au GPU ;
- demande de stockage ;
- attention à la stabilité thermique.

### Persona E — Gamer

- sensibilité aux performances graphiques ;
- refroidissement important ;
- préférence pour l’affichage à fréquence élevée ;
- comparaisons orientées performance.

### Persona F — Entreprise

- volume ;
- uniformité ;
- maintenance ;
- garantie ;
- disponibilité.

## 4. Besoins par usage

| Usage | Critères dominants |
|---|---|
| Bureautique | prix, autonomie, confort |
| Études | légèreté, autonomie, fiabilité |
| Programmation | CPU, RAM, SSD, compatibilité |
| Gaming | GPU, refroidissement, écran |
| Création | GPU, écran, stockage |
| Mobilité | poids, batterie, compacité |
| Service technique | diagnostic, réparation, suivi |

## 5. Freins à l’achat

- incompréhension technique ;
- peur du reconditionné ;
- doute sur la garantie ;
- crainte d’un mauvais conseil ;
- crainte du surcoût ;
- manque de clarté sur la compatibilité avec l’usage.

## 6. Attentes UX

- phrases courtes ;
- choix réduits ;
- explications contextualisées ;
- boutons lisibles ;
- parcours sans surcharge ;
- réassurance visible ;
- comparaison simple.

## 7. Cas d’usage prioritaires

1. un utilisateur exprime un budget et un usage ;  
2. le système retourne une sélection expliquée ;  
3. l’utilisateur compare deux ou trois modèles ;  
4. l’utilisateur consulte la fiche détaillée ;  
5. l’utilisateur commande ou demande un accompagnement ;  
6. l’utilisateur sollicite une maintenance ou un accessoire.

## 8. Résultat attendu de l’analyse

La plateforme doit convertir une intention floue en choix technique concret sans exiger de compétence matérielle élevée.



---

# 03 — Spécification fonctionnelle

## 1. Fonction centrale

La fonction centrale est le moteur de recommandation explicable.

Entrée minimale :

- budget ;
- usage principal ;
- mobilité ;
- préférence neuf / reconditionné ;
- taille d’écran ;
- marque éventuelle ;
- niveau de performance attendu.

Sortie minimale :

- classement des produits ;
- score par produit ;
- explication du score ;
- alternative moins chère ;
- alternative plus performante.

## 2. Fonctionnalités principales

### 2.1 Moteur de recommandation

- questionnaire guidé ;
- calcul de score ;
- règles métier par usage ;
- justification textuelle ;
- prise en compte du budget.

### 2.2 Catalogue

- navigation par catégories ;
- recherche textuelle ;
- fiches produits complètes ;
- images ;
- disponibilité ;
- état ;
- garantie.

### 2.3 Comparateur

- comparaison de deux à quatre produits ;
- mise en évidence des écarts ;
- focus sur les critères utiles.

### 2.4 Filtres avancés

- prix ;
- RAM ;
- stockage ;
- CPU ;
- GPU ;
- taille d’écran ;
- autonomie ;
- état ;
- marque ;
- usage.

### 2.5 Reconditionné de confiance

- grade visuel ;
- contrôles effectués ;
- état batterie ;
- pièces remplacées ;
- certificat ou rapport.

### 2.6 Services techniques

- demande de diagnostic ;
- demande de nettoyage ;
- demande de réparation ;
- suivi de statut.

### 2.7 Accessoires sur demande

- demande d’accessoire non présent ;
- description ;
- budget ;
- délai souhaité ;
- statut de traitement.

### 2.8 Contenus conseils

- guides courts ;
- FAQ ;
- articles pédagogiques ;
- conseils d’achat ;
- lexique technique.

### 2.9 Administration

- gestion des produits ;
- gestion des catégories ;
- gestion des contenus ;
- gestion des demandes ;
- gestion des utilisateurs ;
- audit.

## 3. Règles métier

1. un produit sans catégorie valide est invalide ;  
2. une recommandation sans explication est rejetée ;  
3. un produit reconditionné sans rapport de contrôle est incomplet ;  
4. une demande de service doit posséder un statut ;  
5. une fiche produit publique doit rester lisible sans jargon excessif.

## 4. Priorisation MVP

### Haute priorité

- recommandation ;
- catalogue ;
- filtrage ;
- fiche produit ;
- comparaison ;
- reconditionné ;
- contenu conseil ;
- authentification simple.

### Priorité intermédiaire

- demandes de service ;
- demandes d’accessoires ;
- back-office complet ;
- statistiques.

### Priorité ultérieure

- personnalisation avancée ;
- système de fidélité ;
- notifications poussées ;
- enrichissement IA complémentaire.

## 5. Critères d’acceptation

- la recommandation produit un ordre stable ;
- chaque recommandation expose ses critères ;
- le catalogue reste filtrable ;
- les services sont traçables ;
- l’administration modifie le référentiel sans corruption.



---

# 04 — Modèle métier DDD

## 1. Domaine racine

Domaine principal :

**Plateforme de conseil, vente d’ordinateurs, accessoires audio et services techniques**.

## 2. Vision métier

Le système est orienté :

```text
besoin utilisateur -> analyse -> recommandation -> comparaison -> décision -> commande -> service
```

## 3. Bounded Contexts

| Contexte | Responsabilité |
|---|---|
| Identity & Access | authentification, rôles, permissions |
| Customer | profils et préférences |
| Catalog | produits, marques, catégories |
| Recommendation | scoring et justification |
| Refurbishment | contrôle, état, grade |
| Inventory | quantités et réservation |
| Ordering | commande et lignes |
| Payments | paiement et statut |
| Maintenance | demandes techniques |
| Accessory Requests | demandes hors catalogue |
| Content | guides, FAQ, articles |
| Notifications | événements et messages |
| Analytics | suivi des indicateurs |
| Administration | gestion et gouvernance |

## 4. Agrégats principaux

### Identity & Access

- User
- Role
- Permission
- Session
- RefreshToken

### Customer

- Customer
- Profile
- Address
- Preference
- RecommendationHistory

### Catalog

- Brand
- Category
- Product
- ProductVariant
- ProductSpecification
- ProductImage

### Recommendation

- Recommendation
- RecommendationRule
- RecommendationScore
- RecommendationResult

### Refurbishment

- RefurbishmentReport
- BatteryReport
- QualityCheck
- Certificate

### Ordering

- Order
- OrderItem
- OrderStatusHistory

### Maintenance

- ServiceRequest
- ServiceUpdate

### Accessory Requests

- AccessoryRequest

## 5. Invariants métier

- une catégorie peut être hiérarchique ;
- un produit doit appartenir à une marque et à une catégorie ;
- une variante porte le prix et l’état commercial ;
- une recommandation doit être explicable ;
- une commande doit contenir au moins une ligne ;
- une demande de service doit être historisée ;
- un rapport de reconditionnement doit tracer les contrôles.

## 6. Événements de domaine

- UserCreated
- UserLoggedIn
- ProfileUpdated
- ProductCreated
- ProductUpdated
- RecommendationGenerated
- OrderPlaced
- PaymentConfirmed
- ServiceRequested
- AccessoryRequested
- RefurbishmentValidated

## 7. Philosophie d’isolement

Chaque contexte métier doit être isolé par contrat.  
Le partage direct de tables entre contextes doit être évité.  
La cohérence transversale doit passer par événements ou services applicatifs.

## 8. Conséquence d’architecture

Cette découpe permet :

- testabilité ;
- remplacement partiel ;
- évolutivité ;
- maîtrise des dépendances ;
- réduction de la dette de couplage.



---

# 05 — Modèle de données ERD

## 1. Convention de base

Toutes les tables principales doivent suivre une convention homogène :

- `id` de type UUID ;
- `created_at` ;
- `updated_at` ;
- `deleted_at` nullable ;
- audit de modification lorsque pertinent.

## 2. Noyau IAM

### roles

- id
- name
- description

### permissions

- id
- code
- name
- description

### role_permissions

- role_id
- permission_id

### users

- id
- email
- password_hash
- status
- last_login_at

### user_sessions

- id
- user_id
- token_hash
- expires_at

### audit_logs

- id
- user_id
- action
- entity_type
- entity_id
- payload_json
- ip_address

## 3. Profil client

### customer_profiles

- id
- user_id
- first_name
- last_name
- phone
- birth_date

### customer_addresses

- id
- customer_id
- label
- country
- city
- district
- address_line_1
- address_line_2
- postal_code

### customer_preferences

- id
- customer_id
- preferred_budget
- preferred_usage
- preferred_screen_size
- preferred_brands

## 4. Catalogue

### brands

- id
- name
- slug
- logo_url
- website

### categories

- id
- parent_id
- name
- slug
- icon

### product_collections

- id
- name
- slug
- description

### products

- id
- brand_id
- category_id
- collection_id
- name
- slug
- description
- short_description
- status

### product_variants

- id
- product_id
- sku
- ean
- condition
- price
- currency

### product_images

- id
- variant_id
- url
- alt_text
- sort_order

### product_documents

- id
- variant_id
- name
- url
- document_type

## 5. Spécifications

### product_specs

- id
- variant_id
- cpu
- cpu_generation
- ram
- ram_type
- storage
- storage_type
- gpu
- display_size
- display_resolution
- battery
- weight
- os

### specification_templates

- id
- name
- category_id

### specification_values

- id
- template_id
- variant_id
- key
- value

## 6. Recommandation

### use_cases

- id
- name
- slug

### product_use_scores

- product_id
- use_case_id
- score

### recommendation_rules

- id
- name
- priority
- rule_json

### recommendations

- id
- customer_id
- recommendation_score
- recommendation_data

### recommendation_results

- id
- recommendation_id
- product_id
- rank
- score

## 7. Reconditionné

### refurbished_reports

- id
- variant_id
- grade
- overall_score

### battery_reports

- id
- report_id
- health_percentage
- cycle_count

### component_replacements

- id
- report_id
- component_name
- replacement_date

### quality_checks

- id
- report_id
- check_type
- status

### refurbishment_photos

- id
- report_id
- url

## 8. Commandes

### orders

- id
- user_id
- status
- total_amount

### order_items

- id
- order_id
- product_id
- quantity
- unit_price

### payments

- id
- order_id
- provider
- status
- amount

## 9. Services et demandes

### service_requests

- id
- user_id
- service_type
- device_description
- status

### service_updates

- id
- service_request_id
- note
- created_at

### accessory_requests

- id
- user_id
- accessory_name
- description
- status

## 10. Contenu et avis

### articles

- id
- author_id
- title
- slug
- content
- status

### reviews

- id
- user_id
- product_id
- rating
- comment

## 11. Contraintes de cohérence

- suppression logique contrôlée ;
- index sur les clés de recherche ;
- unicité des slugs ;
- intégrité référentielle stricte ;
- historisation des changements critiques ;
- ségrégation claire entre données publiques et privées.

## 12. Remarque de conception

Le modèle relationnel doit rester lisible, normalisé et extensible.  
La logique de recommandation ne doit pas être encodée uniquement dans le schéma ; elle doit aussi exister au niveau applicatif.



---

# 06 — Architecture applicative

## 1. Architecture retenue

Architecture de référence :

- DDD ;
- Clean Architecture ;
- Hexagonal Architecture ;
- API REST ;
- front-end web séparé ;
- back-office séparé.

## 2. Découpage des couches

| Couche | Rôle |
|---|---|
| Domain | règles métier pures |
| Application | orchestration des cas d’usage |
| Infrastructure | base de données, fichiers, services externes |
| Interface | HTTP, CLI interne, webhooks, UI |

## 3. Modules backend

- IAM
- Customer
- Catalog
- Recommendation
- Refurbishment
- Inventory
- Ordering
- Payments
- Maintenance
- Accessory Requests
- Content
- Notifications
- Analytics
- Administration

## 4. Structure logique d’un module

```text
module/
├── domain/
├── application/
├── infrastructure/
├── interfaces/
└── tests/
```

## 5. Front-end

### Applications

- site public ;
- espace client ;
- espace administrateur.

### Fonctionnement

- pages publiques indexables ;
- parcours guidé ;
- tableaux de bord ;
- formulaires validés côté client et serveur.

## 6. Flux principaux

### Flux recommandation

```text
Questionnaire -> validation -> scoring -> classement -> explication -> affichage
```

### Flux commande

```text
Produit -> panier -> validation -> paiement -> confirmation -> suivi
```

### Flux maintenance

```text
Demande -> qualification -> prise en charge -> mise à jour -> clôture
```

## 7. Répartition des responsabilités

| Élément | Responsable |
|---|---|
| règles de score | domaine recommandation |
| stockage produit | catalogue / infrastructure |
| calcul du prix | ordering |
| validation sécurité | IAM / gateway |
| affichage UX | front-end |
| audit | infrastructure transversale |

## 8. Recherche et filtrage

La recherche doit être découplée du stockage principal.

Elle doit supporter :

- texte ;
- catégories ;
- état ;
- usages ;
- prix ;
- performance.

## 9. Cache

Le cache ne doit jamais contenir une vérité métier exclusive.  
Il sert uniquement d’accélérateur.

## 10. Observabilité

- logs structurés ;
- métriques de charge ;
- traces de requêtes ;
- audit métier ;
- alertes sur erreurs critiques.

## 11. Évolution

L’architecture doit permettre :

- extension des catégories ;
- ajout de nouveaux types de services ;
- ajout de nouvelles règles de recommandation ;
- ajout d’un module mobile ultérieur.



---

# 07 — Spécification UX/UI

## 1. Philosophie d’interface

L’interface doit réduire la complexité technique.  
Le principe directeur est :

```text
Parlez du besoin avant de parler du produit.
```

## 2. Parcours principal

```text
Accueil → Questionnaire → Résultats → Comparaison → Fiche produit → Décision
```

## 3. Pages principales

### Accueil

- proposition de valeur visible immédiatement ;
- accès direct au questionnaire ;
- accès direct au catalogue ;
- réassurance sur le reconditionné ;
- guides récents.

### Trouver mon ordinateur

Écran central du produit.

Champs principaux :

- budget ;
- usage ;
- mobilité ;
- préférence neuf / reconditionné ;
- taille d’écran ;
- niveau de performance.

### Catalogue

- cartes produits ;
- filtres visibles ;
- score d’adéquation ;
- état ;
- prix ;
- bouton comparaison.

### Fiche produit

Contenu minimal :

- nom ;
- prix ;
- disponibilité ;
- état ;
- garantie ;
- usage recommandé ;
- spécifications ;
- images ;
- rapport de confiance ;
- produits similaires.

### Comparateur

- tableau simple ;
- colonnes alignées ;
- différences mises en évidence ;
- suppression du bruit visuel.

### Maintenance

- formulaire court ;
- type de service ;
- description du problème ;
- statut de suivi.

## 4. Principes visuels

- hiérarchie typographique nette ;
- blocs peu chargés ;
- langage clair ;
- boutons explicites ;
- contraste élevé ;
- réduction des éléments décoratifs non utiles.

## 5. Règles UX

1. une action principale par écran ;  
2. peu de texte par bloc ;  
3. chaque score doit être compréhensible ;  
4. chaque filtre doit produire un effet visible ;  
5. chaque réassurance doit être proche de l’action d’achat.

## 6. Composants réutilisables

- navbar ;
- hero ;
- carte produit ;
- carte usage ;
- barre de filtre ;
- tableau comparatif ;
- panneau de confiance ;
- formulaire guidé ;
- timeline de service.

## 7. Accessibilité fonctionnelle

- libellés explicites ;
- navigation clavier ;
- contraste suffisant ;
- structure sémantique propre ;
- erreurs formulaires lisibles ;
- confirmation des actions sensibles.

## 8. Orientation contenu

Les contenus doivent éviter :

- le jargon gratuit ;
- les formulations ambiguës ;
- la surcharge d’arguments ;
- les comparaisons non structurées.

Le contenu doit favoriser la décision, pas l’hésitation.



---

# 08 — Cahier des charges technique

## 1. Objectif technique

Mettre en place une plateforme stable, modulaire et sécurisée, capable de supporter :

- consultation publique ;
- recommandation ;
- catalogue ;
- commande ;
- maintenance ;
- administration ;
- journalisation.

## 2. Stack recommandée

### Front-end

- application web moderne ;
- typage fort côté client ;
- composants réutilisables ;
- validation de formulaires.

### Back-end

- API HTTP JSON ;
- séparation domaine / application / infrastructure ;
- authentification par jetons ;
- stockage relationnel principal ;
- stockage objet pour médias.

### Base de données

- moteur relationnel ;
- contraintes d’intégrité ;
- indexation sur les attributs de recherche ;
- historique des changements critiques.

### Fichiers

- images produits ;
- certificats reconditionné ;
- pièces jointes de services.

### Recherche

- moteur de recherche interne ;
- index de filtrage ;
- éventuellement moteur dédié ultérieurement.

## 3. Services techniques

| Service | Exigence |
|---|---|
| Auth | jetons sécurisés, expiration, rotation |
| RBAC | contrôle d’accès fin |
| Recommandation | règles explicables |
| Paiement | intégration isolée |
| Upload | validation stricte |
| Recherche | pertinence et filtrage |
| Logs | structure exploitable |

## 4. Déploiement

- conteneurisation ;
- configuration par variables d’environnement ;
- séparation des environnements ;
- sauvegardes ;
- migration de schéma ;
- supervision.

## 5. Sécurité technique

- validation serveur systématique ;
- hachage fort des mots de passe ;
- protections CSRF selon mode d’authentification ;
- contrôle des tailles d’entrées ;
- prévention injection SQL ;
- journalisation des accès sensibles ;
- principe du moindre privilège.

## 6. Exigences d’exécution

- tolérance aux erreurs ;
- messages d’erreur propres ;
- codes HTTP cohérents ;
- absence de dépendance implicite à l’interface utilisateur ;
- réversibilité des migrations.

## 7. Exigences de performance

- chargement initial raisonnable ;
- pagination catalogue ;
- cache des requêtes coûteuses ;
- limitation de la taille des médias ;
- indexation des recherches fréquentes.

## 8. Observabilité

- logs structurés ;
- métriques applicatives ;
- traçage des cas d’usage ;
- audit des opérations critiques.

## 9. Maintenance

- migrations reproductibles ;
- configuration séparée ;
- tests automatisés ;
- documentation des modules ;
- versionnement de l’API.

## 10. Conclusion technique

Le système doit rester simple à opérer avant d’être sophistiqué.  
La complexité n’est légitime que lorsqu’elle apporte un gain mesurable.



---

# 09 — Contrats d’interface API

## 1. Style général

- protocole : HTTP ;
- format : JSON ;
- versionnement : `/api/v1` ;
- authentification : jeton d’accès ;
- erreurs normalisées ;
- pagination explicite.

## 2. Ressources principales

### Auth

- `POST /api/v1/auth/login`
- `POST /api/v1/auth/logout`
- `POST /api/v1/auth/refresh`

### Catalogue

- `GET /api/v1/products`
- `GET /api/v1/products/{id}`
- `GET /api/v1/categories`
- `GET /api/v1/brands`

### Recommandation

- `POST /api/v1/recommendations`
- `GET /api/v1/recommendations/{id}`

### Comparaison

- `POST /api/v1/compare`

### Commandes

- `POST /api/v1/orders`
- `GET /api/v1/orders/{id}`

### Maintenance

- `POST /api/v1/service-requests`
- `GET /api/v1/service-requests/{id}`

### Accessoires

- `POST /api/v1/accessory-requests`

### Contenu

- `GET /api/v1/articles`
- `GET /api/v1/articles/{slug}`

## 3. Schéma de réponse minimal

```json
{
  "data": {},
  "meta": {},
  "error": null
}
```

## 4. Erreur standardisée

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "budget is required",
    "details": []
  }
}
```

## 5. Contrat de recommandation

### Requête minimale

```json
{
  "budget": 300000,
  "usage": "programming",
  "mobility": "high",
  "condition_preference": "any"
}
```

### Réponse minimale

```json
{
  "recommendations": [
    {
      "product_id": "uuid",
      "rank": 1,
      "score": 92,
      "reasons": [
        "RAM compatible with programming workloads",
        "SSD suitable for responsiveness",
        "weight favorable for mobility"
      ]
    }
  ]
}
```

## 6. Contrat de comparaison

Entrée :

- liste de produits ;
- maximum défini ;
- même catégorie de préférence.

Sortie :

- tableau de différences ;
- points forts ;
- points faibles.

## 7. Contrat de maintenance

Entrée :

- type de service ;
- description ;
- coordonnées ;
- urgence éventuelle.

Sortie :

- numéro de dossier ;
- statut ;
- délai estimé si disponible.

## 8. Règles d’interface

- toutes les entrées doivent être validées côté serveur ;
- toute réponse doit être déterministe pour des entrées identiques ;
- toute erreur doit être machine-readable ;
- toute donnée sensible doit être exclue des réponses publiques ;
- tout identifiant exposé doit être non séquentiel.

## 9. Évolutivité

Le contrat doit rester compatible avec :

- ajout de nouveaux champs ;
- ajout de nouveaux types de recommandation ;
- ajout de nouvelles catégories ;
- ajout de nouvelles actions d’administration.



---

# 10 — Exigences non fonctionnelles

## 1. Sécurité

### Exigences minimales

- authentification robuste ;
- autorisation par rôle et permission ;
- validation stricte de toutes les entrées ;
- protection contre injection ;
- protection contre bruteforce ;
- limitation des tentatives sensibles ;
- journalisation des actions critiques.

### Gestion des secrets

- secrets hors dépôt ;
- rotation des clés ;
- séparation des environnements ;
- accès minimal.

### Surface d’attaque

- exposition minimale des endpoints ;
- pas d’accès direct aux données sensibles ;
- médias servis de manière contrôlée.

## 2. Fiabilité

- tolérance aux erreurs partielles ;
- retour d’erreur explicite ;
- reprise possible après panne ;
- sauvegardes régulières ;
- migrations réversibles.

## 3. Performances

- pagination ;
- indexation ;
- cache contrôlé ;
- limitation des payloads ;
- compression des réponses publiques si pertinent.

## 4. Observabilité

- logs structurés ;
- corrélation des requêtes ;
- métriques de disponibilité ;
- métriques de latence ;
- alerting sur erreurs répétées.

## 5. Maintenabilité

- modules isolés ;
- nommage homogène ;
- tests unitaires par domaine ;
- tests d’intégration pour les flux critiques ;
- documentation à jour.

## 6. Disponibilité opérationnelle

- environnements séparés ;
- configuration par variables ;
- déploiement reproductible ;
- sauvegarde de base de données ;
- restauration testée.

## 7. Conformité d’usage

- collecte minimale ;
- transparence des traitements ;
- protection des données personnelles ;
- durée de conservation contrôlée.

## 8. Risques techniques

| Risque | Effet | Contre-mesure |
|---|---|---|
| couplage excessif | évolution difficile | frontières de contexte |
| recommandation opaque | perte de confiance | justification systématique |
| catalogue instable | mauvaise qualité de données | validation stricte |
| dette technique | ralentissement | architecture modulaire |
| fuite de données | incident de sécurité | moindre privilège |

## 9. Critère non fonctionnel final

Le système doit être suffisamment simple pour être maintenu, suffisamment rigoureux pour être sécurisé, et suffisamment lisible pour inspirer confiance.



---

# 11 — Feuille de route MVP

## 1. Principe de séquencement

Le séquencement doit respecter l’ordre suivant :

1. cadrage ;
2. modèle métier ;
3. modèle de données ;
4. architecture applicative ;
5. UX/UI ;
6. API ;
7. sécurité ;
8. implémentation MVP.

## 2. MVP cible

### Fonctionnalités indispensables

- accueil ;
- questionnaire de recommandation ;
- résultats recommandés ;
- catalogue ;
- fiche produit ;
- comparaison ;
- filtres ;
- reconditionné ;
- demande de maintenance ;
- contenu conseil ;
- authentification ;
- administration minimale.

### Fonctionnalités reportées

- notifications complexes ;
- analytics avancé ;
- personnalisation fine ;
- automatisation marketing ;
- extension mobile native.

## 3. Ordre d’implémentation

| Phase | Contenu |
|---|---|
| Phase 1 | domaine, données, auth, catalogue minimal |
| Phase 2 | recommandation, comparaison, filtrage |
| Phase 3 | reconditionné, maintenance, contenus |
| Phase 4 | administration, audit, observabilité |
| Phase 5 | durcissement sécurité, optimisation, extension |

## 4. Livrables avant codage

- vision consolidée ;
- périmètre validé ;
- DDD ;
- ERD ;
- architecture applicative ;
- UX/UI ;
- API ;
- exigences non fonctionnelles ;
- backlog MVP.

## 5. Découpage de livraison

### Lot A — socle

- authentification ;
- structure projet ;
- base de données ;
- catalogue.

### Lot B — valeur métier

- moteur de recommandation ;
- comparaison ;
- filtres.

### Lot C — confiance

- reconditionné ;
- contenus ;
- maintenance.

### Lot D — opération

- administration ;
- audit ;
- supervision ;
- sauvegarde.

## 6. Définition de prêt-à-coder

Le dossier est prêt pour le codage lorsque :

- le périmètre est figé ;
- les entités sont stabilisées ;
- les frontières de contexte sont définies ;
- les endpoints sont contractés ;
- les invariants sont écrits ;
- les cas d’erreur sont définis ;
- les priorités MVP sont établies.

## 7. Point final

Le projet peut alors être traduit en implémentation sans ambiguïté majeure.
