
Beaucoup de projets destinés aux populations peu alphabétisées tombent dans un piège :

* trop d'icônes ;
* trop de couleurs ;
* trop d'illustrations ;
* trop d'écrans "enfantins".

Résultat :

* perte de crédibilité ;
* perte de confiance ;
* sensation d'application amateur ;
* difficulté à faire confiance pour gérer de l'argent.

Or dans ton projet :

> La confiance doit être visible avant même que l'utilisateur n'effectue sa première contribution.

Je recommande donc une approche que j'appelle :

**"Fintech Africa Inclusive"**

C'est-à-dire :

* interface professionnelle ;
* très peu d'icônes ;
* textes simples ;
* support audio disponible mais discret ;
* gros boutons ;
* parcours guidés ;
* langues locales ;
* assistance vocale facultative.

---

# Livrable UX/UI V1

## Principes de Design

### P1 — Simplicité extrême

Maximum :

```text
3 actions principales par écran
```

Jamais plus.

---

### P2 — Une action = un écran

Éviter :

```text
Créer groupe
Modifier règles
Inviter membre
Choisir partenaire
```

sur un même écran.

---

### P3 — Mobile First

Priorité :

```text
Android
```

avant :

```text
iOS
Web
```

---

### P4 — Accessible aux faibles niveaux d'alphabétisation

Utiliser :

* phrases courtes ;
* vocabulaire simple ;
* boutons explicites.

Exemple :

❌

```text
Initialiser un nouveau cycle de mutualisation
```

✅

```text
Démarrer un nouveau cycle
```

---

### P5 — Audio discret

Chaque écran possède :

```text
🔊 Écouter
```

optionnel.

L'utilisateur clique seulement s'il en a besoin.

---

### P6 — Langues

Prévoir dès V1 :

* Français
* Mooré
* Dioula
* Fulfuldé

Architecture prête pour d'autres langues.

---

# Mobile App

---

# Écran 1 — Accueil

Objectif :

Connexion rapide.

Contenu :

```text
Logo

Bienvenue

[ Se connecter ]

[ Créer un compte ]

🔊 Écouter
```

---

# Écran 2 — Vérification Téléphone

```text
Numéro

[ Continuer ]

Code OTP

[ Vérifier ]
```

---

# Écran 3 — Tableau de Bord

Écran principal.

---

Partie haute :

```text
Bonjour Awa
```

---

Bloc résumé :

```text
Mes Groupes : 4

Mes Contributions : 12

Mes Votes en attente : 2
```

---

Actions :

```text
Créer un groupe

Mes groupes

Mes notifications
```

---

# Écran 4 — Mes Groupes

Liste simple :

```text
Femmes Battantes

Cycle actuel
8/20

Prochaine contribution
12 500 FCFA

Dans 3 jours
```

---

# Écran 5 — Détail Groupe

Sections :

```text
Résumé

Membres

Cycles

Votes

Historique
```

Onglets.

---

# Écran 6 — Contribuer

Écran très important.

---

Affichage :

```text
Montant attendu

10 000 FCFA
```

---

Bouton :

```text
Payer maintenant
```

---

Puis :

```text
Orange Money

Moov Money

MTN Money
```

Selon le pays.

---

# Écran 7 — Historique

Liste chronologique :

```text
12 Juin

Contribution reçue

10 000 FCFA
```

---

```text
20 Juin

Versement reçu

200 000 FCFA
```

---

# Écran 8 — Vote

Très simple.

---

Question :

```text
Accepter l'utilisation du fonds de couverture ?
```

---

Réponses :

```text
Oui

Non
```

---

Pas plus.

---

# Écran 9 — Déclarer Difficulté

Formulaire simplifié.

---

```text
Pourquoi avez-vous une difficulté ?
```

Liste :

```text
Maladie

Accident

Perte de revenu

Autre
```

---

Audio facultatif.

---

# Écran 10 — Notifications

Fil unique.

---

```text
Contribution attendue

Vote demandé

Versement effectué

Livraison disponible
```

---

# Écran 11 — Profil

---

```text
Nom

Téléphone

Langue

Groupes
```

---

Paramètres :

```text
Langue

Notifications

Audio
```

---

# Module Audio

Principe :

Aucun écran ne doit dépendre de l'audio.

L'audio aide.

Il ne remplace jamais l'interface.

---

# Dashboard Web

---

# Dashboard Admin

---

## Menu

```text
Tableau de bord

Utilisateurs

Groupes

Transactions

Votes

Partenaires

Audit

Rapports

Paramètres
```

---

## Dashboard Principal

KPIs :

```text
Utilisateurs

Groupes

Contributions

Transactions

Incidents
```

---

Graphiques :

```text
Croissance groupes

Contributions

Activité
```

---

# Gestion Utilisateurs

Recherche :

```text
Nom

Téléphone

Statut
```

---

# Gestion Groupes

Vue :

```text
Nom

Type

Membres

Statut
```

---

# Audit

Très important.

Filtres :

```text
Date

Utilisateur

Groupe

Action
```

---

# Interface Partenaire

Accès séparé.

---

Menu :

```text
Produits

Commandes

Livraisons

Historique
```

---

# Règles UX Critiques

## RC-01

Aucune opération financière en plus de 3 clics.

---

## RC-02

Toujours afficher :

```text
Montant attendu
```

```text
Montant payé
```

```text
Montant restant
```

---

## RC-03

Toujours afficher :

```text
Qui reçoit ?
```

```text
Quand ?
```

```text
Pourquoi ?
```

---

## RC-04

Toutes les décisions importantes :

```text
Confirmation obligatoire
```

---

## RC-05

Avant tout versement :

```text
Résumé complet
```

---

# Design System V1

## Couleurs

Style :

```text
Fintech
```

et non :

```text
Réseau social
```

Palette :

* Bleu foncé (confiance)
* Vert (validation)
* Orange discret (alerte)
* Rouge (erreur)

---

## Typographie

Police :

```text
Inter
```

ou

```text
Noto Sans
```

---

## Icônes

Utilisation minimale.

Uniquement :

* groupe ;
* contribution ;
* vote ;
* notification ;
* profil.

Pas d'icône décorative.

---

# Livrable suivant recommandé

Maintenant que nous avons :

* Charte de fonctionnement
* Cahier fonctionnel
* Cahier technique
* ERD
* RBAC
* Workflows
* Catalogue API
* UX/UI
