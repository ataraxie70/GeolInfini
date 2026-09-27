Voici une structure UI React propre, cohérente : une interface construite en **composants fonctionnels React**, où chaque bloc de l’écran est un composant réutilisable. Tailwind sert à composer le style directement dans le markup, et shadcn/ui sert de base de composants à copier et adapter dans ton code. Pour la navigation latérale, shadcn/ui demande de placer l’application dans un `SidebarProvider`. ([react.dev][1])

## Arborescence exacte recommandée

```text
frontend/
└── src/
    ├── app/
    │   ├── App.tsx
    │   ├── main.tsx
    │   ├── providers/
    │   │   ├── ThemeProvider.tsx
    │   │   ├── SidebarProvider.tsx
    │   │   └── QueryProvider.tsx
    │   ├── routes/
    │   │   ├── AppRouter.tsx
    │   │   └── routeMap.ts
    │   └── config/
    │       ├── navigation.ts
    │       ├── permissions.ts
    │       └── constants.ts
    │
    ├── layouts/
    │   ├── AppShell.tsx
    │   ├── AuthShell.tsx
    │   ├── DashboardShell.tsx
    │   └── PageShell.tsx
    │
    ├── components/
    │   ├── navigation/
    │   │   ├── SidebarNav.tsx
    │   │   ├── Topbar.tsx
    │   │   ├── Breadcrumbs.tsx
    │   │   ├── SearchCommand.tsx
    │   │   └── UserMenu.tsx
    │   │
    │   ├── dashboard/
    │   │   ├── StatCard.tsx
    │   │   ├── ProgressOverview.tsx
    │   │   ├── TodayFocus.tsx
    │   │   ├── RevisionAlertCard.tsx
    │   │   └── ActivityFeed.tsx
    │   │
    │   ├── subjects/
    │   │   ├── SubjectTable.tsx
    │   │   ├── SubjectFilters.tsx
    │   │   ├── SubjectStatusBadge.tsx
    │   │   ├── SubjectDetailPanel.tsx
    │   │   └── PrerequisiteList.tsx
    │   │
    │   ├── sessions/
    │   │   ├── SessionTimer.tsx
    │   │   ├── SessionForm.tsx
    │   │   ├── SessionNotesEditor.tsx
    │   │   └── SessionSummary.tsx
    │   │
    │   ├── validations/
    │   │   ├── ValidationChecklist.tsx
    │   │   ├── ValidationScore.tsx
    │   │   ├── ValidationActions.tsx
    │   │   └── ValidationHistory.tsx
    │   │
    │   ├── revisions/
    │   │   ├── RevisionQueue.tsx
    │   │   ├── RevisionItem.tsx
    │   │   └── RevisionCalendar.tsx
    │   │
    │   ├── projects/
    │   │   ├── ProjectBoard.tsx
    │   │   ├── ProjectCard.tsx
    │   │   ├── ProjectMilestones.tsx
    │   │   └── ProjectSubjectLinks.tsx
    │   │
    │   ├── history/
    │   │   ├── ActivityTimeline.tsx
    │   │   └── ActivityFilters.tsx
    │   │
    │   ├── settings/
    │   │   ├── PreferencesForm.tsx
    │   │   └── NotificationSettings.tsx
    │   │
    │   └── ui/
    │       ├── button.tsx
    │       ├── card.tsx
    │       ├── badge.tsx
    │       ├── dialog.tsx
    │       ├── sheet.tsx
    │       ├── tabs.tsx
    │       ├── table.tsx
    │       ├── progress.tsx
    │       ├── accordion.tsx
    │       ├── dropdown-menu.tsx
    │       ├── input.tsx
    │       ├── textarea.tsx
    │       ├── label.tsx
    │       ├── select.tsx
    │       ├── checkbox.tsx
    │       ├── alert.tsx
    │       ├── alert-dialog.tsx
    │       ├── command.tsx
    │       ├── scroll-area.tsx
    │       ├── separator.tsx
    │       ├── avatar.tsx
    │       └── tooltip.tsx
    │
    ├── features/
    │   ├── dashboard/
    │   │   ├── dashboard.api.ts
    │   │   ├── dashboard.hooks.ts
    │   │   ├── dashboard.types.ts
    │   │   └── DashboardPage.tsx
    │   │
    │   ├── domains/
    │   │   ├── domains.api.ts
    │   │   ├── domains.hooks.ts
    │   │   ├── domains.types.ts
    │   │   └── DomainsPage.tsx
    │   │
    │   ├── subjects/
    │   │   ├── subjects.api.ts
    │   │   ├── subjects.hooks.ts
    │   │   ├── subjects.types.ts
    │   │   └── SubjectsPage.tsx
    │   │
    │   ├── sessions/
    │   │   ├── sessions.api.ts
    │   │   ├── sessions.hooks.ts
    │   │   ├── sessions.types.ts
    │   │   └── SessionsPage.tsx
    │   │
    │   ├── validations/
    │   │   ├── validations.api.ts
    │   │   ├── validations.hooks.ts
    │   │   ├── validations.types.ts
    │   │   └── ValidationsPage.tsx
    │   │
    │   ├── revisions/
    │   │   ├── revisions.api.ts
    │   │   ├── revisions.hooks.ts
    │   │   ├── revisions.types.ts
    │   │   └── RevisionsPage.tsx
    │   │
    │   ├── projects/
    │   │   ├── projects.api.ts
    │   │   ├── projects.hooks.ts
    │   │   ├── projects.types.ts
    │   │   └── ProjectsPage.tsx
    │   │
    │   ├── history/
    │   │   ├── history.api.ts
    │   │   ├── history.hooks.ts
    │   │   ├── history.types.ts
    │   │   └── HistoryPage.tsx
    │   │
    │   └── settings/
    │       ├── settings.api.ts
    │       ├── settings.hooks.ts
    │       ├── settings.types.ts
    │       └── SettingsPage.tsx
    │
    ├── hooks/
    │   ├── useDebounce.ts
    │   ├── useLocalStorage.ts
    │   ├── useHotkeys.ts
    │   └── useConfirm.ts
    │
    ├── services/
    │   ├── http.ts
    │   ├── apiClient.ts
    │   └── storage.ts
    │
    ├── types/
    │   ├── domain.ts
    │   ├── subject.ts
    │   ├── session.ts
    │   ├── validation.ts
    │   ├── revision.ts
    │   ├── project.ts
    │   └── common.ts
    │
    ├── utils/
    │   ├── date.ts
    │   ├── progress.ts
    │   ├── status.ts
    │   └── format.ts
    │
    ├── styles/
    │   ├── globals.css
    │   ├── theme.css
    │   └── tokens.css
    │
    └── assets/
        ├── icons/
        ├── images/
        └── fonts/
```

## Structure UI exacte par couche

### 1) `App.tsx`

Rôle : assembler la racine de l’application.

* `ThemeProvider`
* `SidebarProvider`
* `QueryProvider`
* `AppRouter`

React est conçu pour composer l’UI à partir de composants, donc cette racine doit rester minimale et ne porter aucune logique d’écran. ([react.dev][2])

### 2) `AppShell.tsx`

Rôle : squelette permanent.

* `SidebarNav`
* `Topbar`
* `Breadcrumbs`
* zone `Outlet`/contenu principal
* panneau contextuel éventuel

Le `Sidebar` de shadcn/ui est explicitement pensé comme un composant composable et personnalisable, avec `SidebarProvider` autour de l’application. ([ui.shadcn.com][3])

### 3) `SidebarNav.tsx`

Rôle : navigation principale.
Sections :

* Dashboard
* Domaines
* Sujets
* Séances
* Validations
* Révisions
* Projets
* Historique
* Paramètres

### 4) `Topbar.tsx`

Rôle : barre d’action globale.
Composants :

* `SearchCommand`
* raccourcis
* notifications
* `UserMenu`

`Command` est adapté à une palette de commandes, et `DropdownMenu` aux actions contextuelles. ([ui.shadcn.com][4])

### 5) `DashboardPage.tsx`

Rôle : synthèse.
Composition :

* `StatCard`
* `ProgressOverview`
* `TodayFocus`
* `RevisionAlertCard`
* `ActivityFeed`

`Card`, `Progress` et `Chart` sont des composants officiels shadcn/ui adaptés à ce type de page de synthèse. ([ui.shadcn.com][5])

### 6) `SubjectsPage.tsx`

Rôle : liste de travail.
Composition :

* `SubjectFilters`
* `SubjectTable`
* `SubjectStatusBadge`
* pagination
* actions par ligne

La table doit rester un bloc central, car shadcn/ui fournit bien un composant `Table` fait pour des listes structurées. ([ui.shadcn.com][6])

### 7) `SubjectDetailPanel.tsx`

Rôle : détail opérationnel d’un sujet.
Composition :

* résumé
* prérequis
* objectifs
* historique
* révisions
* actions

Composants recommandés :

* `Card`
* `Accordion`
* `Tabs`
* `ScrollArea`
* `Dialog`
* `AlertDialog`. ([ui.shadcn.com][7])

### 8) `SessionsPage.tsx`

Rôle : conduite d’une séance.
Composition :

* `SessionTimer`
* `SessionForm`
* `SessionNotesEditor`
* `SessionSummary`

### 9) `ValidationsPage.tsx`

Rôle : contrôle des acquis.
Composition :

* checklist
* score
* commentaires
* validation/rejet

Composants utiles :

* `Checkbox`
* `AlertDialog`
* `Badge`
* `Button`. ([ui.shadcn.com][8])

### 10) `RevisionsPage.tsx`

Rôle : file de révision.
Composition :

* `RevisionQueue`
* `RevisionCalendar`
* `RevisionItem`

Utilise `Progress`, `Badge`, `Alert` pour rendre les échéances lisibles. ([ui.shadcn.com][9])

### 11) `ProjectsPage.tsx`

Rôle : relier apprentissage et production.
Composition :

* projets actifs
* lien avec sujets requis
* jalons
* avancement

### 12) `HistoryPage.tsx`

Rôle : traçabilité.
Composition :

* `ActivityTimeline`
* filtres
* recherche
* export

### 13) `SettingsPage.tsx`

Rôle : configuration locale.
Sections :

* préférences
* notifications
* thème
* sauvegarde

## Dossier `ui/`

Ce dossier doit contenir uniquement les primitives réutilisables :

* `button`
* `card`
* `badge`
* `dialog`
* `sheet`
* `tabs`
* `table`
* `progress`
* `accordion`
* `dropdown-menu`
* `input`
* `textarea`
* `label`
* `select`
* `checkbox`
* `alert`
* `alert-dialog`
* `command`
* `scroll-area`
* `separator`
* `avatar`
* `tooltip`

shadcn/ui se présente comme un système de composants que tu copies dans ton code et personnalises, pas comme une boîte noire fermée. ([ui.shadcn.com][10])

## Comportement responsive

* desktop : `Sidebar` fixe ;
* mobile : `Sheet` ou `Drawer` pour la navigation ;
* contenus principaux en pile verticale ;
* panneaux secondaires repliables.

Le composant `Drawer` de shadcn/ui est pensé comme un équivalent responsive de `Dialog` sur mobile, ce qui le rend adapté à une navigation latérale compacte. ([ui.shadcn.com][11])

## Ordre d’implémentation

1. `AppShell`
2. `SidebarNav`
3. `Topbar`
4. `DashboardPage`
5. `SubjectsPage`
6. `SubjectDetailPanel`
7. `SessionsPage`
8. `ValidationsPage`
9. `RevisionsPage`
10. `ProjectsPage`
11. `HistoryPage`
12. `SettingsPage`

Cette séquence évite de construire des écrans sans base de navigation et sans structure commune. React et Tailwind se prêtent bien à cette construction progressive par composants et classes utilitaires. ([react.dev][1])

## Règle finale

La structure UI doit rester simple :

* un shell permanent,
* des pages métier isolées,
* des composants UI réutilisables,
* des primitives dans `ui/`,
* la logique métier dans `features/`.

C’est la forme la plus propre pour garder l’interface lisible, maintenable et extensible.

[1]: https://react.dev/learn/your-first-component?utm_source=chatgpt.com "Your First Component"
[2]: https://react.dev/?utm_source=chatgpt.com "React"
[3]: https://ui.shadcn.com/docs/components/radix/sidebar?utm_source=chatgpt.com "Sidebar - Shadcn UI"
[4]: https://ui.shadcn.com/docs/components/radix/command?utm_source=chatgpt.com "Command - Shadcn UI"
[5]: https://ui.shadcn.com/docs/components/radix/card?utm_source=chatgpt.com "Card - Shadcn UI"
[6]: https://ui.shadcn.com/docs/components/radix/table?utm_source=chatgpt.com "Table - Shadcn UI"
[7]: https://ui.shadcn.com/docs/components/radix/accordion?utm_source=chatgpt.com "Accordion - Shadcn UI"
[8]: https://ui.shadcn.com/docs/components/radix/alert-dialog?utm_source=chatgpt.com "Alert Dialog - shadcn/ui"
[9]: https://ui.shadcn.com/docs/components/radix/progress?utm_source=chatgpt.com "Progress - Shadcn UI"
[10]: https://ui.shadcn.com/docs?utm_source=chatgpt.com "Introduction - Shadcn UI"
[11]: https://ui.shadcn.com/docs/components/radix/drawer?utm_source=chatgpt.com "Drawer - Shadcn UI"
