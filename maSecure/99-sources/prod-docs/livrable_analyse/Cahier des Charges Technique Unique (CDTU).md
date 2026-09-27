# Cahier des Charges Technique Unique (CDTU)

## Plateforme de Tontine, Cotisation et Gestion Communautaire

**Version :** V1
**Statut :** Référence technique principale
**Type :** Document d'architecture et d'implémentation

---

# 1. Objet du document

Ce document décrit les exigences techniques nécessaires à la réalisation de la plateforme.

Il définit :

* l'architecture technique ;
* les composants logiciels ;
* les composants d'infrastructure ;
* les règles de sécurité ;
* les intégrations externes ;
* les exigences de performance ;
* les exigences de disponibilité ;
* les exigences de traçabilité ;
* les contraintes de développement.

Ce document ne décrit pas les règles métier détaillées qui sont définies dans la Charte de Fonctionnement et le Cahier des Charges Fonctionnel.

---

# 2. Principes directeurs

## 2.1 Sécurité avant tout

La plateforme manipule :

* des contributions financières ;
* des données personnelles ;
* des données communautaires ;
* des historiques financiers.

La sécurité est prioritaire sur toute autre considération.

---

## 2.2 Transparence

Toute opération critique doit être :

* enregistrée ;
* horodatée ;
* traçable ;
* vérifiable.

---

## 2.3 Aucune manipulation directe des fonds

La plateforme :

* ne détient pas les fonds ;
* ne conserve pas les soldes bancaires ;
* ne remplace pas une banque.

Les fonds sont conservés chez :

* banques ;
* établissements financiers ;
* agrégateurs de paiement agréés ;
* opérateurs Mobile Money.

La plateforme agit comme :

* orchestrateur ;
* automate ;
* moteur de règles.

---

## 2.4 Séparation stricte

Les couches suivantes doivent rester indépendantes :

* Présentation
* Métier
* Données
* Intégrations
* Sécurité
* Audit

---

# 3. Architecture générale

```text
┌────────────────────┐
│ Application Mobile │
└─────────┬──────────┘
          │
          ▼

┌────────────────────┐
│      API Gateway   │
└─────────┬──────────┘
          │

 ┌────────┼───────────┐
 ▼        ▼           ▼

Backend  Notification Audit

 └────────┬───────────┘
          │

          ▼

     Base de données

          │

          ▼

 Intégrations externes

 ┌───────────────┐
 │ Mobile Money  │
 ├───────────────┤
 │ Banques       │
 ├───────────────┤
 │ Partenaires   │
 └───────────────┘
```

---

# 4. Interfaces utilisateurs

## 4.1 Application Mobile

Cible :

* Android
* iOS

Fonctions :

* inscription
* authentification
* gestion de profil
* groupes
* contributions
* votes
* historique
* notifications

---

## 4.2 Plateforme Web

Réservée :

* administration
* supervision
* support
* partenaires

Fonctions :

* gestion globale
* audit
* surveillance
* reporting

---

# 5. Backend Central

Le backend constitue l'unique source de vérité.

Aucune décision métier ne doit être prise :

* dans le mobile ;
* dans le navigateur ;
* dans le partenaire externe.

---

## 5.1 Responsabilités

Le backend gère :

* groupes ;
* membres ;
* règles ;
* cycles ;
* votes ;
* contributions ;
* notifications ;
* intégrations ;
* sécurité ;
* audit.

---

# 6. Architecture modulaire

Le backend doit être organisé en modules indépendants.

---

## Module Utilisateurs

Responsabilités :

* comptes
* profils
* authentification
* gestion des accès

---

## Module Groupes

Responsabilités :

* création
* configuration
* adhésion
* historique

---

## Module Tontine

Responsabilités :

* cycles
* tours
* calculs
* versements

---

## Module Cotisation Sociale

Responsabilités :

* objectifs
* collecte
* suivi

---

## Module Cotisation Nature

Responsabilités :

* catalogue
* quantités
* livraison

---

## Module Votes

Responsabilités :

* propositions
* validation
* résultats

---

## Module Fonds

Responsabilités :

* couverture
* recouvrement
* calculs

---

## Module Notifications

Responsabilités :

* SMS
* Push
* WhatsApp
* Email
* Vocal

---

## Module Audit

Responsabilités :

* journalisation
* preuves
* traçabilité

---

## Module Partenaires

Responsabilités :

* fournisseurs
* banques
* opérateurs
* livreurs

---

# 7. Architecture des données

## Principes

Les données doivent être :

* cohérentes ;
* historisées ;
* auditables ;
* restaurables.

---

## Entités principales

```text
Utilisateur
Membre
Groupe
Cycle
Tour
Contribution
Vote
Transaction
Notification
Partenaire
Livraison
AuditLog
```

---

# 8. Gestion des transactions

Chaque transaction possède :

```text
ID
Date
Heure
Montant
Devise
Origine
Destination
Statut
Référence externe
Référence interne
```

---

## États possibles

```text
CREATED
PENDING
RECEIVED
VALIDATED
PARTIAL
REJECTED
FAILED
COMPLETED
CANCELLED
```

---

# 9. Intégration Mobile Money

Le système doit permettre :

* Orange Money
* Moov Money
* MTN Mobile Money
* Wave
* autres opérateurs compatibles

L'intégration doit être interchangeable.

Aucun opérateur ne doit être codé en dur.

---

# 10. Intégration Bancaire

Le système doit supporter :

* API bancaires
* comptes séquestres
* comptes dédiés
* comptes partenaires

---

# 11. Intégration Partenaires

Le système doit gérer :

* fournisseurs
* coopératives
* commerçants
* transporteurs
* points relais

---

# 12. Notifications

## Canaux

* SMS
* Push
* WhatsApp
* Email
* Vocal

---

## Types

* rappel
* confirmation
* vote
* retard
* suspension
* réintégration
* livraison

---

# 13. Sécurité

## Authentification

Support :

* mot de passe
* OTP
* Mobile Money OTP

---

## Contrôle d'accès

RBAC obligatoire.

---

## Chiffrement

En transit :

```text
TLS 1.3
```

Au repos :

```text
AES-256
```

---

## Protection API

Obligatoire :

* Rate limiting
* Anti brute force
* Anti replay
* Signature des requêtes sensibles

---

# 14. Journalisation

Toutes les opérations critiques doivent être journalisées.

Exemples :

* connexion
* vote
* versement
* ajout membre
* suppression membre
* modification règles

---

# 15. Observabilité

La plateforme doit disposer de :

* métriques
* logs
* traces
* alertes

---

# 16. Sauvegardes

Sauvegardes :

* automatiques
* chiffrées
* testées

---

# 17. Disponibilité

Objectif minimal :

```text
99.9 %
```

---

# 18. Performances

Temps de réponse cible :

```text
< 500 ms
```

pour la majorité des opérations.

---

# 19. Scalabilité

Le système doit supporter :

* augmentation du nombre de groupes ;
* augmentation du nombre de membres ;
* augmentation du trafic mobile.

Sans réécriture majeure.

---

# 20. Architecture de déploiement

Environnements séparés :

```text
Development
Testing
Staging
Production
```

---

# 21. CI/CD

Pipeline obligatoire :

```text
Lint
Tests
Analyse sécurité
Build
Déploiement
```

---

# 22. Conformité

La plateforme doit permettre l'application :

* des exigences réglementaires locales ;
* des règles de protection des données ;
* des obligations de traçabilité financière.

---

# 23. Livrables techniques suivants

Après validation de ce document :

1. Architecture détaillée
2. Dictionnaire de données
3. Modèle relationnel complet
4. Matrice rôles et permissions
5. Catalogue API
6. Spécification des écrans
7. Stratégie sécurité
8. Plan de tests
9. Plan de déploiement
10. Plan d'exploitation

---

## Statut

**CDTU V1 — Base technique validée pour démarrer les livrables d'architecture détaillée et de modélisation des données.**
