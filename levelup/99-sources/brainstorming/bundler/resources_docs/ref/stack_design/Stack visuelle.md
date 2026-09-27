La pile visuelle la plus cohérente pour cette plateforme est :

**React + Vite + TypeScript + Tailwind CSS + shadcn/ui + lucide-react + Recharts.**
React est centré sur les composants, et la documentation recommande les composants fonctionnels pour les nouveaux projets. Vite est conçu pour une expérience de développement rapide et légère. Tailwind est un framework utility-first. shadcn/ui fournit des composants accessibles, personnalisables, construits avec Tailwind, et ce n’est pas une librairie fermée mais une base de composants que tu intègres dans ton code. ([react.dev][1])

## Stack visuelle exacte à retenir

### Fondations

* **React**
* **Vite**
* **TypeScript**
* **Tailwind CSS v4**
* **shadcn/ui**
* **lucide-react**
* **Recharts** pour les graphiques.
  React structure l’interface en composants. Tailwind est bien adapté à un système visuel contrôlé par classes utilitaires. Vite supporte bien cette intégration. shadcn/ui expose aussi un composant `Chart` construit sur Recharts. ([react.dev][2])

## Composants exacts à utiliser

### 1) Squelette global de l’application

Utilise : **`Sidebar`**, **`Sheet`**, **`Breadcrumb`**, **`DropdownMenu`**, **`Command`**, **`Avatar`**, **`Resizable`**, **`Separator`**.
Le `Sidebar` de shadcn/ui est explicitement pensé comme une sidebar repliable et composable ; `Sheet` étend `Dialog` pour un panneau complémentaire, pratique sur mobile ; `Command` sert de palette de commandes ; `DropdownMenu` couvre les actions contextuelles ; `Resizable` sert aux panneaux redimensionnables ; `Breadcrumb` aide à situer l’utilisateur dans la hiérarchie. ([ui.shadcn.com][3])

### 2) Dashboard

Utilise : **`Card`**, **`Progress`**, **`Tabs`**, **`Chart`**, **`Badge`**, **`Skeleton`**.
`Card` sert aux blocs de synthèse, `Progress` aux pourcentages d’avancement, `Tabs` aux vues de synthèse, `Chart` aux courbes d’évolution, `Badge` aux statuts, et `Skeleton` aux chargements. C’est le noyau visuel du tableau de bord. ([ui.shadcn.com][4])

### 3) Liste des sujets

Utilise : **`Table`** ou **`Data Table`**, **`Select`**, **`Input`**, **`DropdownMenu`**, **`Badge`**, **`Pagination`**.
shadcn/ui recommande `Table` avec TanStack Table pour construire des tables triables, filtrables et paginées. `Select` sert aux filtres, `Input` à la recherche, `DropdownMenu` aux actions par ligne, et `Badge` au statut du sujet. ([ui.shadcn.com][5])

### 4) Détail d’un sujet

Utilise : **`Card`**, **`Accordion`**, **`Tabs`**, **`ScrollArea`**, **`Dialog`**, **`AlertDialog`**, **`Badge`**.
`Accordion` sert à cacher/montrer les prérequis, notes et corrections ; `Tabs` sépare les vues “Résumé / Pratique / Révisions / Historique” ; `ScrollArea` garde les panneaux longs exploitables ; `Dialog` et `AlertDialog` servent aux confirmations et validations critiques. ([ui.shadcn.com][4])

### 5) Formulaires de séance et de validation

Utilise : **`Field`**, **`Label`**, **`Input`**, **`Textarea`**, **`Select`**, **`Checkbox`**, **`Switch`**, **`Button`**.
`Field` est prévu pour regrouper label, description et erreur ; `Label` est accessible ; `Input` et `Textarea` couvrent la saisie ; `Checkbox` et `Switch` gèrent les choix binaires ; `Button` gère les actions. ([ui.shadcn.com][6])

### 6) Révisions et projets

Utilise : **`Item`**, **`Card`**, **`Progress`**, **`Tabs`**, **`Checkbox`**, **`Alert`**.
`Item` est utile pour les entrées compactes avec titre, description et actions ; `Progress` montre l’avancement ; `Alert` sert aux rappels et blocages ; `Tabs` sépare les vues projet/révision. ([ui.shadcn.com][7])

## Implémentation visuelle concrète

Je recommande cette logique de composition :

* **`AppShell`** : `Sidebar` + `Header` + zone contenu.
* **`DashboardPage`** : `Card` + `Progress` + `Chart` + `Tabs`.
* **`SubjectsPage`** : `Table` + filtres `Select` + recherche `Input`.
* **`SubjectDetailPage`** : `Card` + `Accordion` + `Tabs` + `ScrollArea`.
* **`SessionPage`** : `Field` + `Textarea` + `Switch` + `Button`.
* **`ValidationPage`** : `Checkbox` + `AlertDialog` + `Button`.
* **`RevisionPage`** : `Item` + `Badge` + `Progress`.
* **`ProjectsPage`** : `Card` + `Tabs` + `Chart`.

Cette répartition est une application directe du modèle de composants React et du catalogue shadcn/ui. ([react.dev][2])

## Règle de design à appliquer

Le front doit rester :

* sombre par défaut,
* lisible,
* dense mais pas chargé,
* orienté tableau de bord,
* strictement hiérarchisé.

Avec Tailwind, la bonne méthode est de construire l’interface par classes utilitaires plutôt que par gros fichiers CSS monolithiques. ([tailwindcss.com][8])
