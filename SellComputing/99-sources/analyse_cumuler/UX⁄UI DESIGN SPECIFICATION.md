# UX/UI DESIGN SPECIFICATION

# Plateforme Conseil, Vente d'Ordinateurs et Services Informatiques

Version : 1.0

Statut : Architecture UX/UI

---

# 1. Philosophie UX

Contrairement aux boutiques informatiques classiques, la plateforme n'est pas conçue autour des produits.

Elle est conçue autour du besoin.

La plupart des sites disent :

```text
Voici nos produits.
```

Notre plateforme dit :

```text
Parlez-nous de votre besoin.
Nous allons vous aider à choisir.
```

C'est la différence fondamentale.

---

# 2. Positionnement UX

Le parcours principal n'est PAS :

```text
Catalogue
↓
Produit
↓
Commande
```

Mais :

```text
Besoin
↓
Recommandation
↓
Comparaison
↓
Décision
↓
Commande
```

---

# 3. Types d'Utilisateurs

## Persona 1

Débutant

Caractéristiques :

* ne connaît pas les composants
* ne sait pas comparer
* veut être guidé

---

## Persona 2

Étudiant

Caractéristiques :

* budget limité
* recherche un bon rapport qualité/prix

---

## Persona 3

Développeur

Caractéristiques :

* compare CPU
* RAM
* stockage

---

## Persona 4

Créateur de contenu

Caractéristiques :

* GPU
* écran
* stockage

---

## Persona 5

Gamer

Caractéristiques :

* GPU
* refroidissement
* écran

---

## Persona 6

Entreprise

Caractéristiques :

* achat multiple
* maintenance

---

# 4. Sitemap Global

```text
Accueil

├── Trouver mon ordinateur
│
├── Catalogue
│   ├── Ordinateurs
│   ├── Casques
│   └── Écouteurs
│
├── Reconditionné
│
├── Comparateur
│
├── Maintenance
│
├── Guides
│
├── FAQ
│
├── À propos
│
├── Contact
│
└── Compte Client
```

---

# 5. Parcours Principal

## Flow 1

Trouver mon ordinateur

```text
Accueil

↓

Questionnaire

↓

Analyse

↓

Recommandations

↓

Comparaison

↓

Fiche Produit

↓

Commande
```

C'est LE parcours principal.

---

# 6. Home Page

Objectif :

convertir immédiatement.

---

## Hero Section

Titre :

```text
Trouvez l'ordinateur idéal pour votre besoin.
```

Bouton principal :

```text
Je cherche un ordinateur
```

Bouton secondaire :

```text
Explorer le catalogue
```

---

## Bloc 1

Pourquoi nous ?

Cartes :

* Conseils personnalisés
* Reconditionné vérifié
* Support technique
* Garantie

---

## Bloc 2

Question rapide

```text
Que voulez-vous faire ?
```

Options :

* Étudier
* Travailler
* Programmer
* Jouer
* Créer du contenu

---

## Bloc 3

Produits recommandés

---

## Bloc 4

Reconditionné de confiance

---

## Bloc 5

Guides récents

---

## Bloc 6

Maintenance

---

# 7. Page Trouver Mon Ordinateur

Écran stratégique.

---

## Étape 1

Budget

Slider :

```text
100 000 FCFA
→
1 500 000 FCFA
```

---

## Étape 2

Usage principal

Cartes :

* Études
* Bureautique
* Programmation
* Gaming
* Création

---

## Étape 3

Mobilité

```text
Toujours en déplacement

Parfois

Jamais
```

---

## Étape 4

Préférence

```text
Neuf

Reconditionné

Peu importe
```

---

## Étape 5

Résultat

Top recommandations

---

# 8. Catalogue

## Filtres

Marque

Prix

RAM

CPU

Stockage

GPU

Taille écran

Condition

---

## Affichage

Cartes produits

---

Chaque carte :

```text
Photo

Nom

Prix

Usage recommandé

Score

Voir détails
```

---

# 9. Fiche Produit

Page critique.

---

## Section 1

Galerie

---

## Section 2

Résumé

Nom

Prix

Disponibilité

Garantie

État

---

## Section 3

Pourquoi recommandé ?

```text
Excellent pour :

✓ Programmation

✓ Études

✓ Mobilité
```

---

## Section 4

Configuration

CPU

RAM

GPU

SSD

Écran

---

## Section 5

Comparaison rapide

---

## Section 6

Avis

---

## Section 7

Produits similaires

---

# 10. Comparateur

Comparaison côte à côte.

---

## Colonnes

Produit A

Produit B

Produit C

---

## Lignes

CPU

RAM

SSD

GPU

Écran

Poids

Autonomie

Prix

Garantie

---

# 11. Reconditionné

Page dédiée.

---

Objectif :

supprimer la peur.

---

## Sections

Comment fonctionne le reconditionné ?

---

Niveaux qualité

```text
A+
A
B
C
```

---

Tests effectués

---

Garanties

---

Produits disponibles

---

# 12. Maintenance

Objectif :

transformer la plateforme en partenaire.

---

Services :

* Nettoyage
* Diagnostic
* Réparation
* Optimisation

---

CTA :

```text
Demander un diagnostic
```

---

# 13. Guides

Structure :

```text
Guides

Comparatifs

Tutoriels

Conseils
```

---

Exemple :

```text
Quel PC pour débuter en programmation ?

Comment choisir un ordinateur étudiant ?

SSD ou HDD ?
```

---

# 14. FAQ

Questions fréquentes.

---

# 15. Contact

Canaux :

* téléphone
* WhatsApp
* email

---

# 16. Compte Client

## Dashboard

Résumé :

* commandes
* recommandations
* maintenance

---

## Menu

Mes commandes

Mes appareils

Mes demandes SAV

Mes recommandations

Mon profil

---

# 17. Dashboard Admin

Sitemap :

```text
Dashboard

├── Produits
├── Marques
├── Catégories
├── Stocks
├── Commandes
├── Paiements
├── Maintenance
├── Accessoires
├── CMS
├── Analytics
├── Utilisateurs
└── Paramètres
```

---

# 18. Dashboard Produits

Fonctions :

Créer

Modifier

Publier

Archiver

Importer CSV

---

# 19. Dashboard Maintenance

Vue Kanban

```text
Nouveau

Diagnostic

En cours

Terminé

Livré
```

---

# 20. Dashboard Analytics

KPIs :

* Visiteurs
* Recommandations générées
* Taux de conversion
* Produits populaires
* Demandes maintenance

---

# 21. Mobile First

Priorité absolue :

```text
Mobile
↓
Tablet
↓
Desktop
```

Car le marché visé utilisera majoritairement le téléphone.

---

# 22. Design System

## Couleurs

Univers :

```text
Tech
+
Futuriste
+
Professionnel
+
Confiance
```

Éviter :

* look gaming agressif
* surcharge visuelle

---

## Typographie

Lisible

Moderne

Accessible

---

## Icônes

Usage modéré.

Ne jamais remplacer le texte par des icônes.

---

# 23. Accessibilité

Objectif :

AA WCAG minimum.

---

# 24. PWA

Fonctionnalités :

* installation
* notifications futures
* accès rapide
* mode hors connexion limité

---

# 25. Livrables UX/UI à produire ensuite

Après cette phase, l'équipe design produira :

### UX

* User Flows détaillés
* Journey Maps
* Wireframes basse fidélité

### UI

* Design System complet
* Bibliothèque composants
* Maquettes haute fidélité

### Livraison

* Mobile
* Desktop
* Dashboard Admin
