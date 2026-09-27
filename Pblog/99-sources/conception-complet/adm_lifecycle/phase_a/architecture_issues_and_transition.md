# Architecture Issues & Transition Strategy

Ce document complète la Phase A en identifiant les risques architecturaux critiques et en définissant la trajectoire de réalisation vers le produit final.

## 1. Identification des Enjeux Majeurs (Architecture Issues)

L'analyse du modèle de "Graphe de Crédibilité" révèle trois enjeux architecturaux majeurs que nous devrons résoudre lors des phases C et D :

### Enjeu 1 : Le Dilemme "Maintenance vs Richesse"
- **Le Risque :** Si nous créons un système trop complexe pour capturer la "narration" (ex: champs multiples, relations complexes), le propriétaire abandonnera la mise à jour.
- **L'Exigence :** Le système doit être "invisible". La saisie d'un projet doit être aussi simple qu'un commit Git ou la rédaction d'un fichier Markdown.
- **Piste de résolution :** Architecture basée sur des fichiers (Git-based CMS) ou un Headless CMS ultra-simplifié.

### Enjeu 2 : La Cohérence du Graphe de Preuves
- **Le Risque :** Avoir des liens vers GitHub/Démos qui deviennent obsolètes ou cassés, détruisant la crédibilité au lieu de la renforcer.
- **L'Exigence :** Le système doit faciliter la vérification de la santé des liens de preuve.
- **Piste de résolution :** Implémentation de scripts de vérification automatique (link checkers) intégrés au pipeline de déploiement.

### Enjeu 3 : Performance vs Interactivité
- **Le Risque :** Vouloir trop de dynamisme (animations, chargements asynchrones) peut ralentir le temps de réponse initial, faisant fuir les recruteurs pressés.
- **L'Exigence :** Priorité absolue au *First Contentful Paint* (FCP).
- **Piste de résolution :** Stratégie de rendu Statique (SSG) avec hydratation minimale.

## 2. Stratégie de Transition (Vers le MVP)

Pour éviter la "Surcharge Fonctionnelle" identifiée en Phase 0, nous adoptons une approche de déploiement par couches de valeur.

### Étape 1 : Le Socle de Crédibilité (MVP - Minimum Viable Product)
**Objectif :** Rendre le système opérationnel pour la validation rapide.
- **Fonctionnalités clés :** Profil $\rightarrow$ Compétences $\rightarrow$ Projets $\rightarrow$ Preuves.
- **Architecture :** Structure de données minimale, rendu statique, administration simplifiée.
- **Valeur :** Le visiteur peut enfin prouver la compétence.

### Étape 2 : La Couche Narrative (V1.1)
**Objectif :** Transformer la preuve en influence.
- **Fonctionnalités clés :** Blog, Rétrospectives, Articles de fond.
- **Architecture :** Système de liaison entre Articles et Projets.
- **Valeur :** Le visiteur comprend le raisonnement et la maturité intellectuelle.

### Étape 3 : L'Écosystème d'Interaction (V1.2)
**Objectif :** Transformer l'influence en opportunités.
- **Fonctionnalités clés :** Formulaire de collaboration, Gestion des demandes, Signalisation des besoins sur projets en cours.
- **Architecture :** Gestion des entrées (formulaires), notifications.
- **Valeur :** Le visiteur devient un collaborateur ou un client.

## 3. Roadmap de Passage aux Phases Suivantes

| Phase | Focus Principal | Livrable Attendu |
| :--- | :--- | :--- |
| **Phase B (Business)** | Modélisation des processus de valeur. | Cartographie des flux de valeur et processus métier. |
| **Phase C (Data)** | Structure du Graphe de Crédibilité. | Schéma de données (Entités, Relations, Attributs). |
| **Phase C (App)** | Architecture logicielle et composants. | Diagramme de composants, définition des API/Interfaces. |
| **Phase D (Tech)** | Choix technologiques et infrastructure. | Stack technique, schéma de déploiement, stratégie CI/CD. |

## 4. Verdict de Fin de Phase A

La Vision est stabilisée. Les enjeux sont identifiés. La stratégie de transition est claire.
**La Phase A est officiellement clôturée.**
