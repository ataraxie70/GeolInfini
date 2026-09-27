# Matrice des Rôles et Permissions (RBAC)

## Plateforme Communautaire de Tontine, Cotisation et Gestion de Biens

**Version :** V1

**Statut :** Référence de sécurité et de gouvernance

---

# 1. Objectif

Ce document définit :

* les rôles existants ;
* leurs responsabilités ;
* leurs permissions ;
* leurs restrictions ;
* les actions autorisées ;
* les actions interdites.

---

# 2. Principes fondamentaux

## 2.1 Principe de moindre privilège

Chaque acteur ne dispose que des droits strictement nécessaires.

---

## 2.2 Principe d'auditabilité

Toute action sensible doit être :

* enregistrée ;
* horodatée ;
* attribuée à un utilisateur.

---

## 2.3 Principe d'automatisation

Les décisions métier critiques sont prises par le moteur métier.

Les utilisateurs ne font que :

* proposer ;
* déclarer ;
* voter ;
* valider.

---

## 2.4 Principe d'interdiction

Aucun rôle humain ne peut :

* modifier un historique ;
* modifier une transaction validée ;
* modifier un vote clôturé ;
* supprimer une trace d'audit ;
* manipuler directement un coffre.

---

# 3. Catalogue des rôles

## R1 - Super Administrateur

Rôle interne à l'entreprise.

Responsabilités :

* gestion globale ;
* sécurité ;
* configuration plateforme ;
* supervision.

Nombre recommandé :

```text
Très limité
```

---

## R2 - Administrateur Opérationnel

Responsabilités :

* support ;
* assistance ;
* surveillance ;
* gestion des incidents.

---

## R3 - Responsable de Groupe

Créateur ou gestionnaire du groupe.

Responsabilités :

* paramétrage du groupe ;
* invitation ;
* animation.

---

## R4 - Membre

Participant ordinaire.

Responsabilités :

* contribution ;
* consultation ;
* vote.

---

## R5 - Partenaire

Fournisseur ou prestataire.

Responsabilités :

* livraison ;
* approvisionnement ;
* exécution de commandes.

---

## R6 - Système

Moteur métier automatisé.

Responsabilités :

* calculs ;
* exécution ;
* notifications ;
* audit.

---

# 4. Permissions globales

| Permission          | Super Admin | Admin Ops | Responsable | Membre | Partenaire | Système |
| ------------------- | ----------- | --------- | ----------- | ------ | ---------- | ------- |
| Voir plateforme     | Oui         | Oui       | Oui         | Oui    | Oui        | Oui     |
| Modifier plateforme | Oui         | Non       | Non         | Non    | Non        | Non     |
| Gérer utilisateurs  | Oui         | Oui       | Non         | Non    | Non        | Non     |
| Voir audit          | Oui         | Oui       | Non         | Non    | Non        | Oui     |
| Supprimer audit     | Non         | Non       | Non         | Non    | Non        | Non     |

---

# 5. Gestion des groupes

| Action          | Super Admin | Admin Ops | Responsable | Membre |
| --------------- | ----------- | --------- | ----------- | ------ |
| Créer groupe    | Oui         | Oui       | Oui         | Non    |
| Modifier groupe | Oui         | Oui       | Oui*        | Non    |
| Fermer groupe   | Oui         | Oui       | Oui*        | Non    |
| Voir groupe     | Oui         | Oui       | Oui         | Oui    |

*Selon les règles du groupe.

---

# 6. Gestion des membres

| Action              | Super Admin | Admin Ops | Responsable | Membre |
| ------------------- | ----------- | --------- | ----------- | ------ |
| Inviter membre      | Oui         | Oui       | Oui         | Non    |
| Accepter membre     | Oui         | Oui       | Oui         | Non    |
| Suspendre membre    | Non         | Non       | Non         | Non    |
| Proposer suspension | Oui         | Oui       | Oui         | Oui    |
| Voter suspension    | Non         | Non       | Oui         | Oui    |

La suspension est décidée uniquement par les règles du système.

---

# 7. Gestion des contributions

| Action                | Responsable | Membre | Système |
| --------------------- | ----------- | ------ | ------- |
| Déclarer contribution | Oui         | Oui    | Oui     |
| Voir contribution     | Oui         | Oui    | Oui     |
| Valider contribution  | Non         | Non    | Oui     |
| Rejeter contribution  | Non         | Non    | Oui     |

---

# 8. Gestion des fonds de couverture

| Action           | Responsable | Membre | Système |
| ---------------- | ----------- | ------ | ------- |
| Voir solde       | Oui         | Oui    | Oui     |
| Utiliser fonds   | Non         | Non    | Oui     |
| Déclencher fonds | Non         | Non    | Oui     |
| Modifier montant | Non         | Non    | Non     |

---

# 9. Gestion du fonds de recouvrement

| Action    | Responsable | Membre | Système |
| --------- | ----------- | ------ | ------- |
| Consulter | Oui         | Oui    | Oui     |
| Calculer  | Non         | Non    | Oui     |
| Appliquer | Non         | Non    | Oui     |

---

# 10. Gestion des votes

| Action            | Responsable | Membre |
| ----------------- | ----------- | ------ |
| Créer proposition | Oui         | Oui*   |
| Participer        | Oui         | Oui    |
| Voir résultat     | Oui         | Oui    |

*Selon les règles du groupe.

---

# 11. Gestion de l'ordre des tours

| Action                  | Responsable | Membre | Système |
| ----------------------- | ----------- | ------ | ------- |
| Voir ordre              | Oui         | Oui    | Oui     |
| Modifier ordre          | Non         | Non    | Oui     |
| Proposer échange        | Oui         | Oui    | Non     |
| Exécuter échange validé | Non         | Non    | Oui     |

---

# 12. Gestion des paiements

| Action                       | Tous les rôles humains |
| ---------------------------- | ---------------------- |
| Déplacer argent              | Interdit               |
| Modifier transaction validée | Interdit               |
| Modifier solde coffre        | Interdit               |
| Créer transaction manuelle   | Interdit               |

---

# 13. Gestion des difficultés

| Action               | Responsable | Membre |
| -------------------- | ----------- | ------ |
| Déclarer difficulté  | Oui         | Oui    |
| Soutenir déclaration | Oui         | Oui    |
| Voter validation     | Oui         | Oui    |

---

# 14. Gestion des partenaires

| Action              | Admin | Responsable | Partenaire |
| ------------------- | ----- | ----------- | ---------- |
| Créer partenaire    | Oui   | Non         | Non        |
| Modifier partenaire | Oui   | Non         | Non        |
| Consulter commandes | Oui   | Oui         | Oui        |
| Confirmer livraison | Oui   | Non         | Oui        |

---

# 15. Gestion des commandes

| Action           | Responsable  | Partenaire | Système |
| ---------------- | ------------ | ---------- | ------- |
| Créer commande   | Oui          | Non        | Non     |
| Valider commande | Selon règles | Non        | Oui     |
| Livrer           | Non          | Oui        | Non     |
| Clôturer         | Non          | Non        | Oui     |

---

# 16. Gestion des notifications

| Action               | Système |
| -------------------- | ------- |
| Envoyer rappel       | Oui     |
| Envoyer alerte       | Oui     |
| Envoyer vote         | Oui     |
| Envoyer confirmation | Oui     |

Les utilisateurs ne peuvent pas envoyer de notifications massives.

---

# 17. Gestion de l'audit

| Action    | Super Admin | Admin Ops |
| --------- | ----------- | --------- |
| Consulter | Oui         | Oui       |
| Exporter  | Oui         | Oui       |
| Supprimer | Non         | Non       |
| Modifier  | Non         | Non       |

---

# 18. Pouvoir exclusif du système

Seul le moteur métier peut :

* calculer les tours ;
* recalculer les cycles ;
* appliquer les pénalités ;
* appliquer les suspensions ;
* appliquer les réintégrations ;
* calculer les dettes ;
* utiliser les fonds ;
* valider les transactions ;
* déclencher les versements ;
* clôturer les cycles.

---

# 19. Matrice de sécurité critique

Actions strictement interdites à tous les humains :

* modifier un audit ;
* modifier un vote clôturé ;
* modifier un versement effectué ;
* modifier une transaction validée ;
* modifier le calcul d'un cycle terminé ;
* modifier un historique de contribution ;
* modifier un ordre déjà exécuté ;
* accéder directement aux coffres financiers.

---

# 20. Conclusion

Le modèle RBAC repose sur un principe central :

**Les humains proposent, déclarent et votent.
Le moteur métier applique les règles.**

Cela garantit :

* transparence ;
* sécurité ;
* traçabilité ;
* résistance à la fraude ;
* limitation des abus internes.

Fin du document.
