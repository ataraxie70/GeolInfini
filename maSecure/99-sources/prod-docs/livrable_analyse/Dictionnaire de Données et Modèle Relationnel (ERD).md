# Dictionnaire de Données et Modèle Relationnel (ERD)

## Plateforme Communautaire de Tontine, Cotisation et Gestion de Biens

**Version :** V1

**Statut :** Référence métier et données

---

# 1. Objectif

Ce document définit :

* les entités métier ;
* leurs attributs ;
* leurs relations ;
* leurs statuts ;
* leurs contraintes.

Il constitue la base du modèle relationnel de la plateforme.

---

# 2. Principes de modélisation

## 2.1 Source unique de vérité

Chaque information métier doit être stockée une seule fois.

## 2.2 Historisation

Aucune information critique ne doit être perdue.

## 2.3 Auditabilité

Toute opération importante doit être retraçable.

## 2.4 Extensibilité

Le modèle doit permettre l'ajout futur :

* nouveaux types de tontines ;
* nouveaux partenaires ;
* nouveaux moyens de paiement ;
* nouveaux modules.

---

# 3. Entité UTILISATEUR

Représente une personne possédant un compte sur la plateforme.

## Attributs

| Champ           | Type      |
| --------------- | --------- |
| id              | UUID      |
| telephone       | String    |
| email           | String    |
| nom             | String    |
| prenom          | String    |
| sexe            | Enum      |
| date_naissance  | Date      |
| langue_preferee | String    |
| photo           | String    |
| statut          | Enum      |
| created_at      | Timestamp |
| updated_at      | Timestamp |

## Statuts

```text
ACTIVE
INACTIVE
SUSPENDED
DELETED
```

---

# 4. Entité MEMBRE

Participation d'un utilisateur dans un groupe.

## Attributs

| Champ       | Type |
| ----------- | ---- |
| id          | UUID |
| user_id     | FK   |
| groupe_id   | FK   |
| role_id     | FK   |
| date_entree | Date |
| date_sortie | Date |
| statut      | Enum |

## Statuts

```text
ACTIVE
PENDING
SUSPENDED
QUARANTINE
LEFT
EXCLUDED
```

---

# 5. Entité GROUPE

Structure principale de travail.

## Attributs

| Champ         | Type   |
| ------------- | ------ |
| id            | UUID   |
| nom           | String |
| description   | Text   |
| type_groupe   | Enum   |
| devise        | String |
| date_creation | Date   |
| statut        | Enum   |

## Types

```text
ROTATIVE
SOCIALE
NATURE
HYBRIDE
```

---

# 6. Entité REGLE_GROUPE

Configuration métier du groupe.

## Attributs

| Champ                   | Type    |
| ----------------------- | ------- |
| id                      | UUID    |
| groupe_id               | FK      |
| fonds_couverture_active | Boolean |
| fonds_auto              | Boolean |
| vote_obligatoire        | Boolean |
| duree_cycle             | Integer |
| unite_cycle             | Enum    |

---

# 7. Entité CYCLE

Cycle opérationnel.

## Attributs

| Champ        | Type    |
| ------------ | ------- |
| id           | UUID    |
| groupe_id    | FK      |
| numero_cycle | Integer |
| date_debut   | Date    |
| date_fin     | Date    |
| statut       | Enum    |

---

# 8. Entité TOUR

Ordre de passage d'une tontine.

## Attributs

| Champ           | Type    |
| --------------- | ------- |
| id              | UUID    |
| cycle_id        | FK      |
| beneficiaire_id | FK      |
| position        | Integer |
| montant_prevu   | Decimal |
| montant_reel    | Decimal |
| statut          | Enum    |

---

# 9. Entité CONTRIBUTION

Paiement effectué par un membre.

## Attributs

| Champ             | Type      |
| ----------------- | --------- |
| id                | UUID      |
| membre_id         | FK        |
| cycle_id          | FK        |
| montant           | Decimal   |
| date_contribution | Timestamp |
| statut            | Enum      |

## Statuts

```text
PENDING
RECEIVED
VALIDATED
REJECTED
PARTIAL
```

---

# 10. Entité TRANSACTION

Mouvement financier référencé.

## Attributs

| Champ             | Type      |
| ----------------- | --------- |
| id                | UUID      |
| reference_externe | String    |
| contribution_id   | FK        |
| montant           | Decimal   |
| statut            | Enum      |
| date_transaction  | Timestamp |

---

# 11. Entité FONDS_COUVERTURE

Réserve du groupe.

## Attributs

| Champ              | Type    |
| ------------------ | ------- |
| id                 | UUID    |
| groupe_id          | FK      |
| montant_disponible | Decimal |
| montant_initial    | Decimal |
| statut             | Enum    |

---

# 12. Entité UTILISATION_FONDS

Historique d'utilisation du fonds.

## Attributs

| Champ            | Type      |
| ---------------- | --------- |
| id               | UUID      |
| fonds_id         | FK        |
| membre_id        | FK        |
| montant          | Decimal   |
| motif            | Text      |
| date_utilisation | Timestamp |

---

# 13. Entité DETTE_MEMBRE

Dette résultant d'un retard ou d'une avance.

## Attributs

| Champ           | Type    |
| --------------- | ------- |
| id              | UUID    |
| membre_id       | FK      |
| montant_restant | Decimal |
| date_creation   | Date    |
| date_limite     | Date    |
| statut          | Enum    |

---

# 14. Entité VOTE

Consultation collective.

## Attributs

| Champ      | Type      |
| ---------- | --------- |
| id         | UUID      |
| groupe_id  | FK        |
| type_vote  | Enum      |
| date_debut | Timestamp |
| date_fin   | Timestamp |
| statut     | Enum      |

---

# 15. Entité PARTICIPATION_VOTE

Réponse d'un membre.

## Attributs

| Champ     | Type      |
| --------- | --------- |
| id        | UUID      |
| vote_id   | FK        |
| membre_id | FK        |
| choix     | Enum      |
| date_vote | Timestamp |

---

# 16. Entité PARTENAIRE

Entreprise ou fournisseur.

## Attributs

| Champ           | Type   |
| --------------- | ------ |
| id              | UUID   |
| nom             | String |
| type_partenaire | Enum   |
| telephone       | String |
| email           | String |
| statut          | Enum   |

---

# 17. Entité PRODUIT

Bien distribué dans une tontine nature.

## Attributs

| Champ         | Type    |
| ------------- | ------- |
| id            | UUID    |
| partenaire_id | FK      |
| nom           | String  |
| unite         | String  |
| prix_unitaire | Decimal |
| statut        | Enum    |

---

# 18. Entité COMMANDE_GROUPE

Commande collective.

## Attributs

| Champ         | Type    |
| ------------- | ------- |
| id            | UUID    |
| groupe_id     | FK      |
| partenaire_id | FK      |
| montant_total | Decimal |
| statut        | Enum    |

---

# 19. Entité LIVRAISON

Livraison physique.

## Attributs

| Champ            | Type   |
| ---------------- | ------ |
| id               | UUID   |
| commande_id      | FK     |
| date_livraison   | Date   |
| preuve_livraison | String |
| statut           | Enum   |

---

# 20. Entité NOTIFICATION

Message envoyé.

## Attributs

| Champ          | Type      |
| -------------- | --------- |
| id             | UUID      |
| utilisateur_id | FK        |
| canal          | Enum      |
| contenu        | Text      |
| date_envoi     | Timestamp |
| statut         | Enum      |

---

# 21. Entité AUDIT_LOG

Journal système.

## Attributs

| Champ          | Type      |
| -------------- | --------- |
| id             | UUID      |
| utilisateur_id | FK        |
| action         | String    |
| ressource      | String    |
| reference_id   | UUID      |
| date_action    | Timestamp |
| ip             | String    |

---

# 22. Relations Principales (ERD)

```text
UTILISATEUR
    │
    └──< MEMBRE >── GROUPE
                         │
                         ├── REGLE_GROUPE
                         ├── CYCLE
                         ├── VOTE
                         ├── FONDS_COUVERTURE
                         ├── COMMANDE_GROUPE
                         │
                         ▼

                      CYCLE
                         │
                         ├── TOUR
                         └── CONTRIBUTION

CONTRIBUTION
      │
      ▼

TRANSACTION

FONDS_COUVERTURE
      │
      ▼

UTILISATION_FONDS
      │
      ▼

DETTE_MEMBRE

VOTE
   │
   ▼

PARTICIPATION_VOTE

PARTENAIRE
      │
      ├── PRODUIT
      └── COMMANDE_GROUPE

COMMANDE_GROUPE
      │
      ▼

LIVRAISON
```

---

# 23. Livrables suivants

Après validation :

1. Matrice des rôles et permissions (RBAC)
2. Architecture détaillée
3. Catalogue API
4. Maquettes d'écrans
5. Workflow complet des modules
6. Plan de sécurité détaillé

Fin du document.
