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
