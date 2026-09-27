# Livrable : Workflows Métier Complets (WMC-V1)

## Objectif

Décrire précisément :

* qui fait quoi ;
* quand ;
* sous quelles conditions ;
* quelles règles sont appliquées ;
* quels événements sont déclenchés ;
* quelles décisions sont prises automatiquement ;
* quels votes sont requis.

---

# WMC-01 — Création d'un Groupe

## Acteurs

* Créateur
* Membres invités
* Système

---

## Workflow

```text
Créateur
    │
    ▼

Créer Groupe

    │
    ▼

Choisir Type

    ├─ Tontine Rotative
    ├─ Cotisation Sociale
    └─ Tontine Nature

    │
    ▼

Configurer règles

    │
    ▼

Inviter membres

    │
    ▼

Acceptation membres

    │
    ▼

Validation minimale atteinte ?

    │
 ┌──┴──┐
 │     │
Non   Oui
 │     │
 ▼     ▼

Attente   Activation Groupe
```

---

# WMC-02 — Adhésion d'un Nouveau Membre

## Cas A : Groupe non démarré

```text
Invitation

    ▼

Acceptation

    ▼

Ajout direct
```

---

## Cas B : Cycle déjà démarré

```text
Invitation

    ▼

Acceptation

    ▼

Choix du groupe

    ├─ Reporter au prochain cycle
    └─ Intégrer cycle courant

                    │
                    ▼

        Calcul contributions requises

                    ▼

        Vote si nécessaire

                    ▼

        Validation système

                    ▼

        Attribution dernière position
```

---

# WMC-03 — Contribution Normale

## Déclenchement

J-5

```text
Notification
```

J-3

```text
Notification
```

J-1

```text
Notification
```

Jour J

```text
Notification
```

---

## Paiement

```text
Membre

    ▼

Paiement Mobile Money

    ▼

Agrégateur

    ▼

Validation

    ▼

Système

    ▼

Contribution enregistrée

    ▼

Historique mis à jour
```

---

# WMC-04 — Retard de Contribution

## Cas normal

```text
Jour J

Contribution absente
```

---

## Fenêtre de grâce

```text
J
18h00 → 20h00

Contribution toujours possible
```

---

## Vérification

```text
20h00

Paiement reçu ?

    │
 ┌──┴──┐
 │     │
Oui   Non
 │     │
 ▼     ▼

Normal   Procédure retard
```

---

# WMC-05 — Activation du Fonds de Couverture

## Conditions

* Fonds activé dans les règles
* Fonds suffisamment approvisionné

---

## Workflow

```text
Retard confirmé

    ▼

Vérification Fonds

    ▼

Solde suffisant ?

 ┌──┴──┐
 │     │
Non   Oui
 │     │
 ▼     ▼

Procédure insuffisance

       ▼

Couverture automatique

       ▼

Dette créée

       ▼

Versement maintenu
```

---

# WMC-06 — Déclaration de Difficulté

## Déclenchement

```text
Membre

    ▼

Déclare difficulté
```

---

## Validation sociale

Petit groupe :

```text
Minimum 2 validations
```

Grand groupe :

```text
Minimum 3 validations
```

---

## Vote

```text
Déclaration validée

    ▼

Ouverture vote

    ▼

Votes membres

    ▼

Majorité atteinte ?

 ┌──┴──┐
 │     │
Non   Oui
 │     │
 ▼     ▼

Refus   Acceptation
```

---

## Conséquence

```text
Acceptation

    ▼

Fonds utilisé

ou

Réaménagement autorisé
```

---

# WMC-07 — Gestion de la Dette

## Création

```text
Fonds utilisé

    ▼

Dette générée
```

---

## Choix membre

```text
Remboursement

    ├─ Immédiat
    └─ Étalé
```

---

## Règle

```text
Maximum 2 cycles
```

---

## Dépassement

```text
Dette > 2 cycles

    ▼

Suspension automatique
```

---

# WMC-08 — Suspension

## Déclencheurs

```text
Retards répétés
```

```text
Dette excessive
```

```text
Abandon présumé
```

---

## Effets

```text
Participation bloquée
```

```text
Réception bloquée
```

```text
Vote possible conservé
```

---

# WMC-09 — Réintégration

## Conditions

```text
Dette remboursée
```

et

```text
Fonds reconstitué
```

---

## Workflow

```text
Vérification système

    ▼

Conditions remplies ?

 ┌──┴──┐
 │     │
Non   Oui
 │     │
 ▼     ▼

Refus   Réintégration
```

---

# WMC-10 — Changement d'Ordre

## Cas 1 : Échange mutuel

```text
Membre A
```

et

```text
Membre B
```

acceptent.

```text
Demande

    ▼

Validation système

    ▼

Ordre modifié
```

---

## Cas 2 : Demande unilatérale

```text
Demande

    ▼

Vote groupe

    ▼

Majorité ?

 ┌──┴──┐
 │     │
Non   Oui
 │     │
 ▼     ▼

Refus   Modification
```

---

# WMC-11 — Versement du Tour

## Déclenchement

```text
Jour du tour
```

---

## Vérifications

```text
Contributions reçues
```

```text
Couverture effectuée
```

```text
Dette calculée
```

---

## Versement

```text
18h00 - 20h00

Versement automatique

    ▼

Compte bénéficiaire

    ▼

Historique mis à jour
```

---

# WMC-12 — Départ Volontaire

## Avant réception

```text
Demande sortie

    ▼

Sortie simple
```

---

## Après réception

Choix :

```text
Continuer normalement
```

ou

```text
Trouver remplaçant
```

ou

```text
Payer solde restant
```

ou

```text
Sortie avec pénalité
```

---

# WMC-13 — Décès ou Incapacité Permanente

## Signalement

```text
Déclaration
```

---

## Vérification

```text
Vote ou validation groupe
```

---

## Scénarios

### Cas A

A encore du crédit.

```text
Remboursement ayants droit
```

---

### Cas B

Remplaçant accepté.

```text
Transfert participation
```

---

### Cas C

Aucun remplaçant.

```text
Retrait membre

    ▼

Recalcul ordre
```

---

# WMC-14 — Tontine Nature

## Création

```text
Choix produit

    ▼

Choix partenaire

    ▼

Configuration cotisation
```

---

## Contributions

```text
Argent collecté
```

---

## Clôture

```text
Montant atteint

    ▼

Commande partenaire

    ▼

Livraison

    ▼

Distribution
```

---

# WMC-15 — Cotisation Sociale

## Exemple

```text
Tabaski
```

```text
Noël
```

```text
Mariage
```

```text
Funérailles
```

---

## Workflow

```text
Création objectif

    ▼

Contributions

    ▼

Suivi transparence

    ▼

Date cible atteinte

    ▼

Versement unique
```

---

# WMC-16 — Vote Générique

Déclencheurs possibles :

```text
Changement ordre
```

```text
Difficulté membre
```

```text
Remplacement membre
```

```text
Modification règle
```

---

## Workflow

```text
Proposition

    ▼

Ouverture vote

    ▼

Notifications

    ▼

Votes

    ▼

Clôture

    ▼

Application automatique
```

---

# WMC-17 — Audit

Chaque action produit :

```text
AuditLog
```

Exemples :

```text
ContributionCreated
ContributionValidated
CoverageFundUsed
VoteOpened
VoteClosed
MemberSuspended
MemberReinstated
CycleClosed
PartnerPaid
DeliveryConfirmed
