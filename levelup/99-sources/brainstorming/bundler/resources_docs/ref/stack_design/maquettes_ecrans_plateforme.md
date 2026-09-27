# Maquettes détaillées écran par écran
## Plateforme de pilotage de l’apprentissage

## 1. Principes globaux de layout

Toutes les pages suivent une structure constante :

```text
┌──────────────────────────────────────────────┐
│ Header                                       │
├──────────────┬───────────────────────────────┤
│ Sidebar      │ Contenu principal              │
│ navigation   │                               │
│              │                               │
├──────────────┴───────────────┬───────────────┤
│                               │ Panneau      │
│                               │ secondaire   │
└───────────────────────────────┴───────────────┘
```

---

## 2. Header (global)

### Contenu
- logo / nom plateforme (gauche)
- barre de recherche (centre)
- raccourcis rapides (droite)
- profil utilisateur

### Fonction
- accès global
- navigation rapide
- actions rapides

---

## 3. Sidebar (navigation principale)

### Sections
- Dashboard
- Domaines
- Sujets
- Séances
- Validations
- Révisions
- Projets
- Historique
- Paramètres

### Comportement
- fixe
- collapsible
- élément actif surligné

---

## 4. Écran : Dashboard

### Objectif
Vue globale immédiate.

### Structure

#### Zone haute
- titre : "Dashboard"
- résumé rapide (progression %)

#### Zone indicateurs (cartes)
- sujets à faire
- en cours
- validés
- à réviser
- bloqués

#### Zone centrale
- liste "Aujourd’hui"
  - sujet du jour
  - révisions urgentes

#### Zone basse
- activité récente

#### Panneau secondaire
- prochaines échéances
- alertes

---

## 5. Écran : Domaines

### Objectif
Visualiser la structure globale.

### Structure
- liste des domaines (cartes)
- chaque carte contient :
  - nom
  - progression
  - nombre de sujets

### Interaction
- clic → ouvre sous-domaines

---

## 6. Écran : Sujets

### Objectif
Gérer tous les sujets.

### Structure

#### Haut
- filtres : domaine, statut, niveau
- recherche

#### Centre
Tableau :
- titre
- statut
- niveau
- difficulté
- temps estimé

#### Clic sur ligne
→ ouvre détail sujet

---

## 7. Écran : Détail Sujet

### Objectif
Travailler un sujet précis.

### Structure

#### Haut
- titre
- statut (badge)
- niveau

#### Bloc contenu
- description
- objectifs

#### Bloc prérequis
- liste
- état validé / non

#### Bloc actions
- démarrer séance
- valider

#### Panneau secondaire
- historique
- notes
- révisions liées

---

## 8. Écran : Séance

### Objectif
Exécuter une session de travail.

### Structure

#### Haut
- sujet actif
- objectif

#### Centre
- timer
- champ notes

#### Bas
- difficulté
- résultat
- bouton "terminer"

---

## 9. Écran : Validations

### Objectif
Valider la maîtrise.

### Structure

#### Liste
- sujets à valider

#### Détail validation
- critères (checklist)
- score
- commentaire

#### Action
- valider / rejeter

---

## 10. Écran : Révisions

### Objectif
Suivre les rappels.

### Structure

#### Liste
- sujet
- date
- priorité
- statut

#### Actions
- marquer comme fait

---

## 11. Écran : Projets

### Objectif
Relier apprentissage → production.

### Structure

#### Liste projets
- nom
- statut
- progression

#### Détail projet
- sujets requis
- milestones
- état

---

## 12. Écran : Historique

### Objectif
Traçabilité complète.

### Structure

Tableau :
- date
- action
- sujet
- type

---

## 13. Écran : Paramètres

### Objectif
Configurer système.

### Sections
- utilisateur
- préférences
- notifications
- système

---

## 14. Composants transversaux

### Cartes
- stats
- résumé

### Tableaux
- triables
- filtrables

### Badges
- statut

### Formulaires
- simples
- validés

---

## 15. Flux principal utilisateur

1. Dashboard
2. Sujet du jour
3. Séance
4. Validation
5. Révision
6. Retour Dashboard

---

## 16. Règle finale

Chaque écran doit répondre à une seule question claire.

- Dashboard → où j’en suis ?
- Sujet → que dois-je apprendre ?
- Séance → que suis-je en train de faire ?
- Validation → ai-je réussi ?
- Révision → dois-je revoir ?
- Projet → puis-je construire ?

