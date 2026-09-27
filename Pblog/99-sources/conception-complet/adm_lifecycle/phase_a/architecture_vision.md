# Architecture Vision — Plateforme de Crédibilité Professionnelle

## 1. Résumé de la Vision
La cible architecturale est la création d'un **Hub de Crédibilité Narrative**. Contrairement à un portfolio traditionnel, ce système est conçu comme un moteur de preuve. Il ne se contente pas d'afficher des résultats, mais orchestre un lien sémantique entre une **Compétence**, le **Raisonnement** utilisé pour l'appliquer dans un **Projet**, et la **Preuve** externe vérifiable.

L'objectif est de réduire la friction cognitive du visiteur (Recruteur/Client) en lui fournissant un chemin direct : 
`Affirmation de compétence` $\rightarrow$ `Démonstration intellectuelle` $\rightarrow$ `Preuve technique`.

## 2. Objectifs d'Architecture
- **Intégrité de la Preuve :** Garantir que chaque compétence revendiquée est ancrée dans une réalité vérifiable.
- **Fluidité Narrative :** Permettre une navigation transversale entre le blog (réflexion), le portfolio (réalisation) et le profil (identité).
- **Zéro Friction Administrative :** L'architecture doit permettre au propriétaire de mettre à jour son actif numérique sans processus de déploiement complexe.
- **Performance Critique :** Temps de réponse quasi instantané pour les vues publiques afin de maintenir l'attention des décideurs.

## 3. Modèle Conceptuel (Le Blueprint)

Le système repose sur un modèle de **Graphe de Crédibilité** :

### A. Les Entités Fondamentales
1. **L'Identité (Le Noyau) :** Point central définissant la valeur ajoutée et la vision.
2. **La Compétence (Le Vecteur) :** Unité de mesure du savoir-faire (ex: "Architecture Microservices").
3. **Le Projet (L'Instance) :** Application concrète d'une ou plusieurs compétences dans un contexte réel.
4. **La Preuve (L'Ancrage) :** Lien vers une source de vérité tierce (GitHub, URL, Certificat).
5. **L'Article/Rétrospective (Le Raisonnement) :** Couche narrative expliquant le "comment" et le "pourquoi".

### B. Les Flux d'Interactions
- **Flux de Validation :** `Visiteur` $\rightarrow$ `Compétence` $\rightarrow$ `Projet` $\rightarrow$ `Preuve`.
- **Flux de Confiance :** `Visiteur` $\rightarrow$ `Article` $\rightarrow$ `Raisonnement` $\rightarrow$ `Projet` $\rightarrow$ `Confiance`.
- **Flux de Gestion :** `Propriétaire` $\rightarrow$ `Interface Admin` $\rightarrow$ `Mise à jour des Entités`.

## 4. Principes de Design (Héritage de la Phase 0)

| Principe | Application Architecturale |
| :--- | :--- |
| **Content-First** | La hiérarchie des données prime sur l'esthétique. L'UI est une vue sur le graphe de compétences. |
| **Minimal Maintenance** | Priorité aux architectures où le contenu est découplé du code (approche Headless ou Static Site Generation). |
| **Verifiability by Design** | Aucun projet ne peut être publié sans au moins un lien de preuve associé. |
| **Modular Evolution** | Chaque section (Blog, Portfolio, Profil) est traitée comme un module indépendant. |

## 5. Analyse des Écarts (Gap Analysis)

| Dimension | État Actuel (Baseline) | État Cible (Vision) | Écart (Gap) |
| :--- | :--- | :--- | :--- |
| **Structure** | Document PRD unique. | Système de gestion de contenu structuré. | Absence d'implémentation technique et de schéma de données. |
| **Preuves** | Concept de "sources de vérité" mentionné. | Intégration native et systématique des preuves. | Mécanisme de liaison compétence-preuve non défini. |
| **Narration** | Idée de blog/expériences. | Flux narratif lié aux projets. | Absence de structure de lien entre articles et projets. |
| **Administration** | Besoin d'administration identifié. | Interface de gestion ultra-rapide. | Outil de gestion de contenu non choisi. |

## 6. Critères de Validation de la Phase A
La phase A sera considérée comme terminée lorsque :
- [ ] Le modèle conceptuel est validé.
- [ ] Le périmètre architectural est figé.
- [ ] Les principes de design sont acceptés.
- [ ] Le document de vision est prêt pour servir de base aux phases B, C et D.
