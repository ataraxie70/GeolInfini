# Business Process Model — Plateforme de Crédibilité

Ce document définit la logique opérationnelle du système. Il décrit comment la valeur est créée et délivrée à travers des flux de processus structurés.

## 1. Value Stream Mapping (Cartographie des Flux de Valeur)

Le système orchestre trois flux de valeur principaux. Chaque flux est une séquence d'activités visant à atteindre un état final de "Valeur".

### A. Flux de Validation (Cible: Recruteurs/Lead Tech)
**Objectif :** Transformer le doute en certitude technique.

| Étape | Activité | Input | Output | Valeur Ajoutée |
| :--- | :--- | :--- | :--- | :--- |
| **1. Identification** | Navigation vers la compétence | Besoin spécifique | Liste de compétences | Accès rapide à la cible |
| **2. Contextualisation** | Exploration du projet lié | Compétence choisie | Étude de cas (Contexte/Problème) | Compréhension du domaine d'application |
| **3. Vérification** | Consultation de la source de vérité | Projet documenté | Preuve externe (GitHub/Demo) | **Certitude technique** |
| **4. Conversion** | Action de contact | Certitude établie | Message envoyé | Opportunité concrète |

### B. Flux de Confiance (Cible: Clients/Partenaires)
**Objectif :** Transformer la curiosité en conviction intellectuelle.

| Étape | Activité | Input | Output | Valeur Ajoutée |
| :--- | :--- | :--- | :--- | :--- |
| **1. Attraction** | Lecture d'un article/rétrospective | Problématique commune | Contenu narratif | Intérêt pour la démarche |
| **2. Analyse** | Déconstruction du raisonnement | Article lues | Logique de résolution | Respect pour la méthodologie |
| **3. Projection** | Corrélation avec son propre besoin | Raisonnement validé | Sentiment de solution | Projection de succès |
| **4. Engagement** | Prise de contact | Projection positive | Demande de collaboration | **Confiance relationnelle** |

### C. Flux de Production (Cible: Propriétaire)
**Objectif :** Transformer l'effort technique en actif numérique.

| Étape | Activité | Input | Output | Valeur Ajoutée |
| :--- | :--- | :--- | :--- | :--- |
| **1. Capture** | Recensement des faits techniques | Projet terminé/en cours | Liste de livrables et preuves | Matière première |
| **2. Narration** | Rédaction du "Comment" et "Pourquoi" | Matière première | Récit structuré | Transformation en savoir |
| **3. Liaison** | Maillage Compétence $\leftrightarrow$ Projet $\leftrightarrow$ Preuve | Récit + Preuves | Graphe de crédibilité | Structure logique |
| **4. Diffusion** | Publication via l'administration | Graphe finalisé | Page publique à jour | **Actif numérique vivant** |

## 2. Processus Métier Détaillés (Business Processes)

### Processus : "Mise à jour de la Crédibilité" (Internal)
Ce processus doit répondre au principe de *Minimal Maintenance Overhead*.

1. **Déclencheur :** Événement technique (ex: Merge d'une PR majeure, fin d'un sprint).
2. **Saisie :** Input rapide des faits (Titre, Statut, Liens de preuve).
3. **Enrichissement :** Rédaction optionnelle d'une rétrospective (Blog).
4. **Validation :** Vérification automatique de la validité des liens.
5. **Publication :** Mise à jour instantanée du graphe public.

### Processus : "Traitement d'une Opportunité" (External $\rightarrow$ Internal)
1. **Déclencheur :** Réception d'un message via le formulaire de contact/collaboration.
2. **Qualification :** Analyse du profil de l'émetteur et de la demande.
3. **Action :** Réponse, acceptation de collaboration ou orientation.

## 3. Analyse des Capacités Opérationnelles

Pour supporter ces flux, le système doit opérer les capacités suivantes :
- **Capacité de Maillage Sémantique :** Capacité à lier dynamiquement un article de blog à un projet, et un projet à une compétence.
- **Capacité de Preuve Immuable :** Capacité à garantir que la preuve pointée est la source de vérité originale.
- **Capacité d'Administration Agile :** Capacité à modifier le contenu sans rupture de service ni déploiement technique.

## 4. Critères de Performance Business (KPIs Métier)
- **Time-to-Proof :** Temps nécessaire pour un visiteur pour passer de l'accueil à une preuve technique (Cible: $< 30$ secondes).
- **Effort de Publication :** Temps passé par le propriétaire pour documenter un nouveau projet (Cible: $< 15$ minutes).
- **Taux de Qualification :** Ratio entre messages reçus et opportunités réellement pertinentes.
