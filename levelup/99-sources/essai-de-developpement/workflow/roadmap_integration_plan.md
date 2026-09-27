# Intégration des Parcours de Référence et Système d'Importation de Roadmaps

Nous avons implémenté les deux fonctionnalités clés demandées pour la gestion des parcours d'apprentissage (curriculums) de la plateforme LevelUP :
1. **Intégration automatique des parcours système par défaut** (`D1` Développement Système, `D2` Administration Système Linux & Réseaux, `D3` DevOps/DevSecOps) depuis les fichiers markdown officiels stockés dans `docs/ref`.
2. **Système d'importation de parcours** (JSON/Markdown) permettant aux administrateurs de charger des roadmaps générées par `roadmap.sh` ou un AI Tutor directement depuis l'interface utilisateur.

---

## 🛠️ Architecture de l'Implémentation

### 1. Analyseur Markdown & Normaliseur JSON
Fichier : [roadmap-parser.ts](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/src/modules/programs/roadmap-parser.ts)

* **`parseMarkdownRoadmap(markdown)`** : Analyse les fichiers `.md` de référence en extrayant :
  - Le titre du programme (`# `)
  - Le titre et l'objectif du plan d'études (`## `)
  - Les modules/chapitres (`## X. `)
  - Les sujets de cours (`### X.Y `)
  - Les détails point par point (Grands points, Sous-points, Critères de maîtrise N4) injectés dans la description de chaque sujet.
* **`normalizeImportPayload(data)`** : Détecte dynamiquement la structure du document importé (qu'il s'agisse d'un export JSON imbriqué type `roadmap.sh` / AI Tutor avec des champs comme `children`, `phases` ou `items`, ou d'un brut Markdown) et le normalise selon le schéma attendu par la plateforme.

---

### 2. Transaction et Gestion des Prérequis
Fichier : [programs.service.ts](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/src/modules/programs/programs.service.ts)

* **`importProgram(userId, importData)`** : Crée l'ensemble de l'arborescence (`Program` ➔ `StudyPlan` ➔ `Module` ➔ `Topic` ➔ `Prerequisite`) de manière atomique au sein d'une transaction Prisma.
* **Gestion des Prérequis** :
  - **Précision point par point** : Si la roadmap importée définit explicitement des dépendances (`prerequisites` dans le JSON), elles sont mappées fidèlement.
  - **Progression Linéaire par défaut** : Si aucun prérequis n'est défini (comme dans les documents Markdown fournis), les sujets s'enchaînent de manière séquentielle dans l'ordre d'apprentissage, verrouillant le passage au sujet suivant tant que le précédent n'est pas validé.

---

### 3. Chargement des Parcours par Défaut
Fichier : [seed.ts](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/prisma/seed.ts)

* Le script de seeding a été complètement mis à jour pour lire les fichiers Markdown de `docs/ref/content/` au démarrage.
* Il applique l'analyseur sur `D1-developpement-systeme.md`, `D2-administration-systeme.md`, et `D3-devops-devsecops.md`, ce qui remplace le bootcamp mock initial par les trois grands parcours professionnels demandés.

---

### 4. Visualisation Dynamique & Sécurisation de Progression
Fichiers : [study-plans.service.ts](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/src/modules/study-plans/study-plans.service.ts) & [study-plans.controller.ts](file:///home/oswiser9/Out-Labs/www/levelUP/apps/backend/src/modules/study-plans/study-plans.controller.ts)

* L'API `GET /curriculum/study-plans/:id` a été modifiée pour extraire le contexte utilisateur de la requête JWT. Elle calcule en temps réel le statut de déverrouillage de chaque sujet (`locked`, `available`, `validated`, `mastered`) en fonction de l'arbre des prérequis et de la progression de l'apprenant.

---

### 5. Interface d'Administration de l'Importateur
Fichier : [admin/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/admin/page.tsx)

* Ajout d'un bouton **📥 Import Path** à côté de *+ New Program*.
* Intégration d'un formulaire pop-up avec sélection de format (JSON / Markdown) et zone de texte pour coller la roadmap.
* Rechargement automatique de l'arbre et du graphe de dépendance dès que l'importation est confirmée avec succès.
