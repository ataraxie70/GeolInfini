# Technology Architecture — Blueprint Technique

C'est l'étape finale de la conception. Nous traduisons les exigences métier et l'architecture applicative en choix technologiques concrets. 

L'objectif n'est pas d'utiliser la technologie la plus "populaire", mais celle qui satisfait le mieux les principes de la Phase 0 : **Minimal Maintenance** et **Performance Critique**.

## 1. La Stack Technologique Sélectionnée

Après analyse des contraintes, je propose une architecture **"Static-First, Git-Driven"**.

| Composant | Technologie | Justification Architecturelle |
| :--- | :--- | :--- |
| **Frontend / Presentation Engine** | **Astro** | Le meilleur choix pour le "Time-to-Proof". Génération statique (SSG) native, zéro JS par défaut, performance maximale pour le SEO et les recruteurs. |
| **Styling & UI** | **Tailwind CSS + shadcn/ui** | Rapidité de développement, design professionnel, cohérence visuelle et responsivité totale sans surcharge CSS. |
| **CMS / Content Engine** | **Markdown + Frontmatter (Git-based)** | Respect strict du *Minimal Maintenance*. Pas de base de données à gérer, versionnage natif via Git, saisie rapide pour le propriétaire. |
| **Graph Orchestrator** | **Astro Content Collections** | Permet de définir des schémas de données stricts (Zod) pour les projets et compétences, assurant l'intégrité du graphe au moment du build. |
| **Infrastructure / Hosting** | **Vercel ou Netlify** | Déploiement atomique, CI/CD automatique à chaque push, Edge Network pour un chargement mondial instantané. |
| **Proof Validation Service** | **GitHub Actions (Custom Script)** | Automatisation de la vérification des liens de preuve à chaque commit. Si un lien est cassé, le build échoue $\rightarrow$ Garantie de crédibilité. |

## 2. Mapping : Principes $\rightarrow$ Technologies

| Principe (Phase 0) | Solution Technique | Résultat Attendu |
| :--- | :--- | :--- |
| **Minimal Maintenance** | Git-based CMS $\rightarrow$ Astro | Publication via un simple `git push`. Pas d'admin lourde à maintenir. |
| **Performance Critique** | Astro SSG $\rightarrow$ Edge Hosting | Chargement en $< 1\text{s}$ (LCP), respect du BR-01 (Time-to-Proof). |
| **Verifiability by Design** | Zod Schema $\rightarrow$ GitHub Actions | Impossibilité technique de publier un projet sans lien de preuve valide. |
| **Modular Evolution** | Composants Astro $\rightarrow$ Architecture de dossiers | Ajout de nouvelles sections sans impacter le reste du système. |

## 3. Schéma de Flux Technique

`Propriétaire` $\rightarrow$ `Modification Markdown (Git)` $\rightarrow$ `GitHub Push` $\rightarrow$ `GitHub Actions (Link Check)` $\rightarrow$ `Astro Build` $\rightarrow$ `Vercel Deployment` $\rightarrow$ `Visiteur (Fast Access)`.

## 4. Modèle de Données Technique (Implémentation)

Le "Graphe de Crédibilité" sera implémenté via des fichiers structurés :
- `/content/competencies/[id].md` : Définition de la compétence + tags.
- `/content/projects/[id].md` : Description + `skills: [id1, id2]` + `proofs: [url1, url2]`.
- `/content/blog/[id].md` : Narration + `related_projects: [id1]`.

C'est l'implémentation la plus légère et la plus robuste pour un profil personnel.

## 5. Analyse des Coûts et Risques

- **Coût Financier :** $\approx 0\text{€}$ (Tiers gratuits de GitHub, Vercel et Astro).
- **Risque :** Courbe d'apprentissage initiale pour la configuration d'Astro.
- **Mitigation :** Utilisation de templates standards et documentation exhaustive.
