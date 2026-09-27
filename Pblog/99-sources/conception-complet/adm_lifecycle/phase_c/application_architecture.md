# Application Architecture — Orchestrateur de Crédibilité

Ce document définit la structure logicielle du système. L'objectif est de traduire le modèle de données en composants fonctionnels tout en respectant les principes de performance (BR-01) et de maintenance minimale.

## 1. Stratégie Architecturale : Découplage Total (Headless/Static)

Pour satisfaire simultanément la **performance critique** (visiteurs) et la **maintenance minimale** (propriétaire), l'architecture adopte un modèle de découplage entre la gestion du contenu et sa diffusion.

- **Le Back-end (Gestion) :** Focalisé sur la saisie structurée et la validation des preuves.
- **Le Front-end (Diffusion) :** Un moteur de rendu optimisé, idéalement statique ou mis en cache, pour garantir un accès instantané.

## 2. Décomposition en Composants

Le système est divisé en quatre composants logiques majeurs :

### A. Content Management Engine (CME)
*Le centre de contrôle pour le propriétaire.*
- **Responsabilités :** 
    - CRUD des entités (Profil, Compétences, Projets, Articles).
    - Gestion du maillage sémantique (Lier un projet à une compétence).
    - Workflow de publication (Brouillon $\rightarrow$ Public).
- **Interface :** Interface d'administration sécurisée.

### B. Credibility Graph Orchestrator (CGO)
*Le cerveau du système.*
- **Responsabilités :**
    - Transformation des données brutes en graphe de relations.
    - Résolution des chemins de navigation (ex: Trouver tous les projets prouvant la compétence X).
    - Application des règles de validation (ex: Bloquer la publication d'un projet sans preuve).
- **Interface :** API interne / Couche de service.

### C. Presentation Engine (PE)
*La vitrine publique.*
- **Responsabilités :**
    - Rendu des vues (Profil, Portfolio, Blog).
    - Optimisation du chemin critique (Time-to-Proof).
    - Gestion du responsive design et de l'accessibilité.
- **Interface :** Interface Web Publique.

### D. Proof Validation Service (PVS)
*Le gardien de la confiance.*
- **Responsabilités :**
    - Vérification périodique de la validité des URLs externes (Proof $\rightarrow$ URL).
    - Alertes en cas de lien cassé pour éviter la perte de crédibilité.
- **Interface :** Tâche de fond (Background Job).

## 3. Flux de Données Applicatif

### Flux 1 : Publication d'une Preuve (Admin $\rightarrow$ Public)
`Saisie (CME)` $\rightarrow$ `Validation des liens (PVS)` $\rightarrow$ `Mise à jour du graphe (CGO)` $\rightarrow$ `Régénération du site (PE)` $\rightarrow$ `Visiteur`.

### Flux 2 : Consultation d'une Compétence (Public $\rightarrow$ Preuve)
`Saisie URL (Visiteur)` $\rightarrow$ `Rendu de la page Compétence (PE)` $\rightarrow$ `Requête de liens projets (CGO)` $\rightarrow$ `Affichage des preuves` $\rightarrow$ `Clic vers Source Externe`.

## 4. Modèle de Communication (Interfaces)

| Composant A | Composant B | Type d'Interface | Données échangées |
| :--- | :--- | :--- | :--- |
| **CME** | **CGO** | API REST / GraphQL | Commandes de mise à jour du graphe |
| **CGO** | **PE** | JSON / Static Files | Données structurées du graphe |
| **PVS** | **CGO** | Event / Hook | Status de validité des preuves |
| **PE** | **Visiteur** | HTTPS / HTML | Pages optimisées et interactives |

## 5. Analyse de la Performance (Alignement BR-01)

Pour garantir un **Time-to-Proof $\le$ 30s**, l'architecture applicative impose :
1. **Pré-calcul du Graphe :** Les relations Compétence $\leftrightarrow$ Projet sont résolues au moment du build (ou via un cache agressif), et non au moment de la requête visiteur.
2. **Squelette de Navigation :** L'interface utilise un routage plat et direct pour éviter les redirections inutiles.
3. **Lazy Loading des Preuves :** Le contenu textuel est prioritaire, les médias et preuves lourdes sont chargés de manière asynchrone.

## 6. Matrice de Risques Applicatifs

| Risque | Impact | Mitigation |
| :--- | :--- | :--- |
| **Lenteur de l'Admin** | Faible | Utilisation d'une interface légère et réactive (SPA). |
| **Désynchronisation Graphe/Vue** | Moyen | Mise en place d'un déclencheur de build automatique (Webhooks) à chaque modification. |
| **Indisponibilité du CGO** | Haute | Utilisation d'un mode de rendu statique (SSG) : le site reste accessible même si le moteur de gestion est hors ligne. |
