# LevelUP

## Audit technique complet et spécification UI/UX

Basé sur l’archive fournie : monorepo frontend Next.js / backend NestJS / Prisma

## 1. Résumé exécutif

Le projet LevelUP est déjà structuré comme une plateforme d’orchestration pédagogique avec une vraie intention produit : progression contrainte, score de discipline, sessions, quêtes, recommandations et agent compagnon.

Le socle technique est solide pour un MVP ambitieux, mais le front souffre d’une dette de composition importante : pages trop longues, forte densité de styles inline, faible réutilisation de composants, typage permissif, et accessibilité quasiment absente.

Le plus gros gain ne vient pas d’une refonte visuelle cosmétique. Il vient d’une normalisation du design system, d’une découpe des écrans en composants atomiques, et d’un durcissement du contrat UI/API.

## 2. Méthode d’audit

L’analyse a été faite directement sur l’archive du projet : arborescence, fichiers de configuration, routes frontend, modules backend, schéma Prisma, CSS global, pages d’authentification et tableau de bord.

Le but n’est pas seulement de décrire l’existant, mais d’identifier les points qui freinent la maintenabilité, la vitesse d’évolution et la qualité perçue du produit.

## 3. Cartographie technique

| Objet | Audit de l’existant, risques, améliorations et spécification d’implémentation. |
|---|---|
| Périmètre | Frontend, backend, base de données, infrastructure locale, UX, UI et maintenabilité. |
| Livrable | Document de référence pour refonte incrémentale et gouvernance du design system. |
| Date d’analyse | 19 juin 2026 |

| Couche | Constat | Appréciation |
|---|---|---|
| Frontend | Next.js 16 / React 19, App Router, CSS global unique, PWA, dashboard très riche. | Bon choix de base, mais trop monolithique. |
| Backend | NestJS 11, Prisma 7, PostgreSQL, Redis, BullMQ, JWT, Passport, Schedule. | Stack cohérente et adaptée au domaine. |
| Données | 29 modèles Prisma, 10 enums, domaines métiers séparés (users, sessions, quests, RPG, notifications). | Modèle riche, mais à surveiller pour la complexité. |
| Infra locale | DevContainer, PostgreSQL, Redis, ports mappés 3003/3002, Makefile d’orchestration. | Très bon socle de développement reproductible. |

## 4. Points forts

- Vision produit forte et cohérente : la discipline, la progression contrainte, le scoring et les quêtes forment un vrai système de motivation.
- Backend déjà découpé en modules métier clairs : auth, users, sessions, progression, notifications, quêtes, RPG, quiz, règles admin, recommandations.
- Présence d’un DevContainer, d’un Compose et d’un Makefile : l’environnement est déjà pensé pour être reproductible.
- Le dashboard n’est pas un simple écran vitrine ; il agrège des flux réels : sessions, notifications SSE, quêtes, devices, recommandations, progression, achievements.

## 5. Audit global des risques

| Priorité | Zone | Constat | Impact | Action |
|---|---|---|---|---|
| P0 | Sécurité | CORS ouvert, token stocké côté localStorage, journalisation d’une variable sensible au boot. | Exposition inutile du contexte d’auth et surface d’attaque plus large. | Restreindre CORS, passer aux cookies httpOnly, supprimer les logs sensibles. |
| P0 | Qualité front | Pages dashboard/admin très volumineuses et fortement couplées au style. | Maintenance lente, risques de régression élevés. | Découper en composants et extraire un design system. |
| P1 | Accessibilité | Absence quasi totale d’attributs aria, de hiérarchie sémantique renforcée et de focus states explicites. | UX dégradée au clavier et pour lecteurs d’écran. | Ajouter labels, aria-describedby, focus-visible et navigation sémantique. |
| P1 | Typage | Usage massif de `any` dans le front. | Perte de sûreté de type et bugs silencieux. | Introduire des DTO/Types partagés par domaine. |
| P2 | Navigation | Liens et permissions dispersés dans les écrans. | Cohérence fonctionnelle réduite. | Centraliser la navigation et les règles d’accès. |
| P2 | UI | Espacements et tailles gérés de façon ponctuelle. | Incohérence visuelle. | Imposer une échelle de design stricte. |

| Indicateur | Valeur observée |
|---|---|
| Fichiers TSX frontend | 19 |
| Pages/écrans frontend | 18 routes principales |
| Modèles Prisma | 29 |
| Enums Prisma | 10 |

## 6. Audit détaillé du frontend

Le frontend repose sur l’App Router de Next.js, avec des groupes de routes séparés pour l’authentification et le dashboard. C’est une bonne base architecturale, mais l’exécution actuelle reste trop orientée “écran complet” au lieu d’être orientée “composants”.

La structure des routes couvre bien le produit : login, register, dashboard, skill tree, quests, tests, curriculum, discipline, notifications, devices, profile, sessions et admin. La couverture fonctionnelle est donc large.

Le vrai problème est dans le volume de code par écran : le dashboard principal, l’admin et le profil concentrent une grande partie de la logique, des données, des états locaux et de la mise en forme.

Le CSS global est riche et déjà organisé par familles visuelles, mais il agit davantage comme un thème large que comme un système de composants strict.

### 6.1 Constats UI/UX majeurs

- Thème visuel assumé : fond sombre, néons cyan/émeraude/violet/orange, effet glassmorphism et cartes lumineuses.
- Identité forte mais parfois trop chargée visuellement : le volume d’ombres, de lueurs et de bordures accentue la densité.
- Les écrans d’auth en double panneau sont cohérents et donnent une lecture premium.
- Le dashboard est très riche en information, mais la hiérarchie visuelle est parfois trop concurrentielle : plusieurs blocs “importants” se disputent la priorité.
- Les espacements varient selon les pages et beaucoup de valeurs sont écrites au cas par cas plutôt que tirées d’une échelle unique.

### 6.2 Constats de structure

- Les fichiers de page sont trop volumineux et doivent être découpés : header, sidebar, cartes KPI, liste, graphe, dropdown, panneau latéral, etc.
- Les états de chargement, les appels API et la composition visuelle sont entremêlés dans les mêmes composants.
- Le typage est insuffisant pour un produit de cette taille ; les réponses API devraient être décrites par domaine.
- Le routing est propre, mais il manque une couche de navigation partagée et une source unique de vérité pour les liens et permissions.

### 6.3 Mesures observées

| Zone | Mesure |
|---|---|
| Layout principal | Structure centrée, large, avec sidebar et contenu principal à densité élevée. |
| Lisibilité | Bonne à moyenne selon les écrans ; dégradation quand plusieurs widgets se cumulent. |
| Hiérarchie | Correcte sur les écrans d’auth, plus faible sur le dashboard. |
| Consistance | Moyenne, car plusieurs blocs réinventent leurs espacements et tailles. |
| États | Chargement et vide insuffisamment standardisés. |

## 7. Spécification UI/UX cible

Cette spécification vise à garder l’identité LevelUP tout en rendant l’interface plus lisible, plus rapide à faire évoluer et plus cohérente sur tous les écrans.

### 7.1 Système de design

Le projet doit passer d’un ensemble de styles globaux à un vrai système de design composé de :

- tokens de couleur ;
- tokens d’espacement ;
- tokens de rayon ;
- tokens d’ombre ;
- tokens de typographie ;
- variantes de composants.

Le design system doit vivre dans un dossier dédié et être utilisé par toutes les zones du produit.

### 7.2 Hiérarchie typographique

- H1: 28-32 px, poids 800, usage unique par écran.
- H2: 20-24 px, poids 700, pour les sous-sections.
- H3: 16-18 px, poids 600, pour les cartes et blocs.
- Corps: 14-16 px, interligne 1.5.
- Meta/labels: 11-12 px en capitales ou semi-gras, seulement pour les statuts.

## 7.3 Positionnement et espacements

- Écran desktop: layout à deux zones, sidebar fixe à gauche et contenu scrollable à droite.
- Cartes KPI: grille 4 colonnes sur grand écran, 2 colonnes sur tablette, 1 colonne sur mobile.
- Bloc principal: 32 px entre les grands groupes, 16 px entre cartes d’un même groupe.
- Panneaux latéraux, dropdowns et drawers: ancrage cohérent en haut à droite ou au bord droit, sans chevauchement avec le header.
- Les éléments interactifs doivent garder une zone cliquable confortable, même quand le texte devient long.

### 7.4 Couleurs et états

- Couleur primaire: violet de marque pour les actions centrales et l’identité.
- Cyan: apprenant, progression, navigation active, états de découverte.
- Émeraude: succès, validation, progression positive.
- Orange: administration et alertes métier non critiques.
- Rouge: erreurs, pénalités, danger, suppression.

### 7.5 Accessibilité minimale

- Tous les champs doivent avoir un label explicite.
- Tous les boutons icône doivent avoir aria-label.
- Les zones cliquables non boutons doivent être supprimées ou transformées en vrais boutons/liens.
- Le focus visible doit être présent sur toutes les actions clavier.
- Les contrastes doivent rester lisibles dans les deux thèmes.

## 8. Spécification d’implémentation

### 8.1 Frontend

- Conserver Next.js App Router, mais réduire les composants client au strict nécessaire.
- Créer un dossier de design system : tokens, composants de base, composants de composition, composants métier.
- Extraire les appels API dans une couche typée commune.
- Remplacer les gros écrans par des compositions de sections indépendantes.
- Mettre en place des états standardisés: loading, empty, error, success, skeleton.

### 8.2 Backend

- Conserver NestJS comme couche métier et ajouter davantage de discipline au niveau des DTOs et des guards.
- Activer une validation stricte des entrées et interdire les propriétés non prévues.
- Centraliser les règles de domaine: progression, pénalité, quêtes, notifications, recommandations.
- Isoler les jobs asynchrones dans les processors BullMQ et les tâches planifiées dans ScheduleModule.
- Supprimer toute sortie sensible dans les logs de démarrage.

### 8.3 Données

- Le schéma Prisma est déjà ambitieux et couvre les principaux domaines métier.
- Il faut désormais documenter les relations critiques, les index et les invariants de chaque agrégat.
- Les entités les plus importantes à stabiliser sont User, Program, StudyPlan, Module, Topic, Session, Quest, Notification, Quiz et RPG.

### 8.4 Infra & delivery

- Le DevContainer est un très bon point de départ et doit rester la référence d’onboarding.
- Le Makefile peut devenir le point d’entrée unique pour les commandes de dev, build, test et seed.
- Le mapping de ports 3003/3002 doit être documenté clairement pour éviter les confusions entre hôte et conteneur.

## 9. Plan d’action priorisé

| Phase | Objectif | Livrables | Critère de fin |
|---|---|---|---|
| P0 | Sécuriser et fiabiliser | CORS restreint, cookies HTTP-only, logs nettoyés, validation renforcée. | Plus de secret en clair, plus de payload non prévu. |
| P1 | Découper le front | Header, sidebar, cards, dropdowns, forms, drawers, tokens. | Pages principales divisées en blocs réutilisables. |
| P1 | Normaliser le design system | Tokens de spacing, typo, couleurs, états, variants. | Même logique visuelle sur toutes les pages. |
| P2 | Typage et contrats | DTO partagés, réponses API typées, suppression de `any` critique. | Flux front-back typés par domaine. |
| P2 | Optimiser la navigation | Squelettes, cache, lazy load, rafraîchissements ciblés. | Moins de chargement bloquant au premier affichage. |

## 10. Conclusion

LevelUP a une vraie direction produit et une base technique crédible. Le travail restant n’est pas de “faire plus de pages”, mais de rendre la plateforme industrialisable : composants réutilisables, design system stable, typage strict, accessibilité correcte et découpage des écrans.

En l’état, le produit est prometteur. Avec une normalisation sérieuse du front et une discipline plus forte sur les contrats de données, il peut passer d’un MVP riche à une base saine de plateforme durable.
