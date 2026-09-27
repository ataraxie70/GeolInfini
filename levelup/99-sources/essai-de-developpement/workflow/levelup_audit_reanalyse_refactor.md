# LevelUP

## Re-analyse technique, audit des points supplémentaires et axes de refactorisation

Base analysée directement dans l’archive fournie : monorepo avec frontend Next.js / backend NestJS / Prisma / PostgreSQL / Redis / BullMQ.

---

## 1. Résumé exécutif

Le projet LevelUP a une intention produit très forte : apprentissage sous contrainte, progression par niveau, discipline score, quêtes, sessions, notifications, feedback, système RPG et agent compagnon. La base métier est ambitieuse et la couverture fonctionnelle est déjà large.

La relecture du code montre cependant que le projet est encore dans une phase où la **structure réelle du front** et la **discipline d’implémentation** ne sont pas au même niveau que la vision produit. Le plus gros sujet n’est pas la quantité de fonctionnalités, mais la **qualité du découpage**, la **réutilisabilité**, la **cohérence UI/UX**, la **sécurité des flux d’authentification**, et la **gouvernance des contrats front/back**.

En pratique, le projet est solide comme prototype avancé, mais il reste trop dépendant de pages monolithiques, de styles inline, de données manipulées au cas par cas et d’un contrôle d’accès côté client seulement.

---

## 2. Ce que la re-analyse ajoute par rapport au premier audit

Après relecture plus profonde du dépôt, plusieurs points supplémentaires ressortent clairement :

- le front contient **une densité très élevée de styles inline** : environ **884 occurrences** de `style={{` dans les pages TSX du frontend ;
- le dossier `src/app/components` ne contient pratiquement qu’un seul composant réutilisable réel (`PwaRegistration`) ;
- `src/utils/fetcher.ts` est vide, donc la couche d’accès API n’est pas encore industrialisée ;
- la protection des routes dashboard repose sur un **contrôle client** avec redirection après rendu, pas sur un garde serveur ou middleware ;
- l’authentification stocke le token en `localStorage`, ce qui simplifie le prototype mais fragilise la sécurité ;
- le backend expose une stack riche, mais certaines pratiques sont encore trop permissives ou trop bavardes au démarrage ;
- le schéma et les services sont puissants, mais la complexité métier exige désormais des contrats plus stricts et des tests plus nombreux.

---

## 3. Cartographie technique observée

| Couche | Stack observée | Lecture d’audit |
|---|---|---|
| Frontend | Next.js 16, React 19, App Router, CSS global unique | Très bon socle, mais trop centralisé dans `globals.css` et dans de grosses pages. |
| Backend | NestJS 11, Prisma 7, Passport/JWT, Schedule, BullMQ, Redis, PostgreSQL | Stack cohérente et adaptée à un système d’apprentissage contraint. |
| Données | Prisma très riche, nombreux modèles, enums métier, migration déjà avancée | Modèle crédible, mais la cohérence des invariants doit être davantage verrouillée. |
| Infra locale | DevContainer, Docker Compose, Makefile | Très bon point fort, à conserver comme standard d’onboarding. |
| Qualité | Tests partiellement présents, plusieurs specs désactivées | La couverture est insuffisante pour un domaine métier aussi sensible. |

---

## 4. Points forts à conserver

1. **Vision produit cohérente** : discipline, progression, quêtes, sessions et RPG forment un système motivant et distinctif.
2. **Backend modulaire** : auth, users, progression, sessions, curriculum, quêtes, notifications, quiz, rpg, settings, recommandations.
3. **DevContainer et orchestration locale** : excellent pour éviter la dérive d’environnement.
4. **Dashboard riche en données réelles** : le front n’est pas purement décoratif ; il consomme déjà plusieurs flux métier.
5. **Base de données expressive** : le modèle est suffisamment riche pour faire évoluer la plateforme sans tout refaire.

---

## 5. Audit des points supplémentaires à souligner

### 5.1 Frontend : monolithe visuel et dette de composition

Le front a une identité claire, mais l’implémentation reste trop concentrée dans des pages très longues.

Constats directs :
- plusieurs écrans dépassent largement la taille raisonnable d’un composant de page unique ;
- le dashboard, l’admin, le profil, les sessions et le planning mélangent logique métier, fetch, transformation des données et rendu ;
- il y a trop peu de composants partagés, ce qui empêche toute standardisation durable ;
- la hiérarchie visuelle varie d’un écran à l’autre parce que chaque page réinvente ses espacements et ses variantes.

**Conclusion** : le front doit passer d’une logique “page = application” à une logique “page = composition de blocs”.

### 5.2 Frontend : design system encore trop implicite

Le fichier `globals.css` contient un thème très large, très riche, mais il joue aujourd’hui le rôle d’un **theme dump** plus que celui d’un vrai design system.

Constats :
- gros fichier CSS global centralisant couleurs, composants, variations et états ;
- peu de tokens formels pour l’espacement, les rayons, les élévations, les largeurs, les breakpoints et les rythmes typographiques ;
- absence de séparation nette entre tokens, primitives UI, composants de composition et composants métier.

**Conclusion** : le projet a une direction graphique, mais pas encore un système de design strict.

### 5.3 Frontend : surcharge de styles inline

L’usage de styles inline est massivement présent, surtout dans :
- `admin/page.tsx`
- `dashboard/page.tsx`
- `profile/page.tsx`
- `skill-tree/page.tsx`
- `tests/page.tsx`
- `discipline/page.tsx`
- `devices/page.tsx`
- `sessions/schedule/page.tsx`

Cela crée plusieurs problèmes :
- duplication des valeurs de spacing et de couleur ;
- difficulté à faire un refactor de masse ;
- absence de variantes homogènes ;
- plus de bruit dans le JSX ;
- maintenance lente.

**Conclusion** : il faut extraire les styles récurrents en composants ou classes utilitaires dédiées.

### 5.4 Frontend : couche API non industrialisée

Le fichier `src/utils/fetcher.ts` est vide. En parallèle, les pages appellent `fetch` directement avec logique de gestion d’erreur répétée.

Conséquences :
- parsing d’erreurs répété ;
- absence de wrapper commun pour `Authorization`, `baseUrl`, `timeouts`, `retry`, `json parsing`, `network error` ;
- risques de comportements divergents entre pages.

**Conclusion** : la couche réseau doit devenir une vraie brique réutilisable.

### 5.5 Frontend : authentification encore trop fragile

Le token JWT est stocké en `localStorage`. Le dashboard vérifie la présence du token côté client, puis redirige.

Risques :
- exposition du token à toute injection JavaScript ;
- contrôle d’accès seulement après rendu ;
- flash visuel possible avant redirection ;
- logique de session dispersée.

**Conclusion** : il faut viser un schéma plus robuste, idéalement avec cookies `httpOnly` ou à défaut une couche de session mieux encapsulée.

### 5.6 Frontend : accessibilité insuffisante

Le front n’est pas encore pensé “accessibilité d’abord”. Les points à corriger en priorité :
- labels explicites sur tous les champs ;
- `aria-label` sur les boutons icônes ;
- focus visible cohérent ;
- meilleures structures sémantiques (`main`, `nav`, `section`, `header`, `aside`) ;
- états d’erreur annoncés correctement ;
- zones cliquables non-boutons à remplacer par de vrais boutons ou liens.

### 5.7 Frontend : mobile et densité

Le thème est agréable en desktop, mais le contenu est dense.

Risques UX :
- trop de cartes “fortes” dans le même champ visuel ;
- hiérarchie d’information peu stable ;
- certains blocs vont se comprimer fortement sur de petites largeurs ;
- les drawers, sidebars et panneaux latéraux doivent être vérifiés sur mobile.

**Conclusion** : il faut une vraie politique responsive par type de composant, pas seulement quelques media queries ponctuelles.

### 5.8 Navigation et protection de route

Le dashboard est protégé par contrôle client dans le layout. C’est fonctionnel, mais pas optimal.

Améliorations à prévoir :
- middleware de protection ou redirection server-side ;
- page de chargement plus courte ;
- état d’auth unique partagé entre toutes les zones privées ;
- harmonisation des routes publiques/privées.

### 5.9 Backend : sécurité et discipline d’exécution

Plusieurs points méritent un durcissement :
- `app.enableCors()` sans restriction visible ;
- log de `DATABASE_URL` au démarrage ;
- logout fondé sur blacklist de token, mais la stratégie globale reste à formaliser ;
- validations correctes mais à renforcer par domaine ;
- besoin d’un meilleur cadrage des erreurs métier et des réponses homogènes.

### 5.10 Backend : robustesse et lisibilité

La stack métier est bonne, mais la complexité va augmenter vite. Il faut donc :
- formaliser les DTOs et les schémas de réponse ;
- réduire les `any` ;
- clarifier les services qui portent les règles de progression, pénalité, quêtes et récompenses ;
- séparer davantage les lectures simples des mutations métier ;
- stabiliser les tests unitaires et d’intégration.

### 5.11 Qualité logicielle : dette de tests

Le dépôt contient plusieurs tests, mais aussi beaucoup de specs désactivées (`.spec.ts.disabled`). Cela est un signal clair : la logique métier progresse plus vite que son filet de sécurité.

Priorité :
- réactiver les tests critiques ;
- couvrir les flux d’auth, progression, sessions, quêtes, notifications et RPG ;
- ajouter des tests de contrat sur les endpoints les plus sensibles.

### 5.12 Gouvernance documentaire

Le projet contient déjà beaucoup de documents de cadrage. C’est utile, mais il faut éviter la dispersion.

À faire :
- définir un dossier “source of truth” ;
- distinguer spécification, backlog, notes et documents historiques ;
- éviter les versions concurrentes d’un même cadrage.

---

## 6. Audit UI/UX détaillé

### 6.1 Direction visuelle actuelle

Le langage visuel repose sur :
- fond sombre premium ;
- accents cyan / vert / violet / orange ;
- cartes légèrement translucides ;
- ombres et lueurs ;
- style “dashboard technique gamifié”.

C’est cohérent avec l’idée LevelUP. La direction est bonne.

### 6.2 Ce qui fonctionne

- l’univers visuel est mémorable ;
- les écrans d’auth présentent bien la proposition de valeur ;
- le dashboard donne une impression de produit sérieux ;
- les états métier sont lisibles par couleur et par intensité.

### 6.3 Ce qui doit être refactoré

- trop de variations de marges, paddings et radius écrites à la main ;
- trop de composants “unifs” par page ;
- hiérarchie des titres non strictement standardisée ;
- états de loading et empty states à homogénéiser ;
- il faut des composants de feedback cohérents : alert, toast, badge, chip, stat-card, panel, drawer.

### 6.4 Spécification typographique cible

Proposition de règles :
- **H1** : 32 px, poids 800, usage unique par écran ;
- **H2** : 24 px, poids 700 ;
- **H3** : 18 px, poids 600 ;
- **Body** : 15-16 px, line-height 1.5 à 1.65 ;
- **Meta / labels** : 11-12 px, semi-gras, usage strictement réservé aux statuts et micro-infos.

Règle importante : un écran ne doit pas contenir plusieurs titres au même niveau hiérarchique sans distinction claire.

### 6.5 Spécification d’espacement

Mettre une échelle fixe :
- 4 px : micro-ajustements ;
- 8 px : regroupements compacts ;
- 12 px : petites séparations internes ;
- 16 px : espace standard entre éléments liés ;
- 24 px : séparation entre blocs ;
- 32 px : séparation entre sections ;
- 40-48 px : respiration de page.

Règle : ne plus improviser les espacements par écran.

### 6.6 Positionnement et layout

#### Desktop
- sidebar fixe à gauche ;
- contenu principal scrollable à droite ;
- largeur de contenu plafonnée par une variable de design ;
- actions principales alignées dans la zone supérieure droite des sections.

#### Tablette
- sidebar compressée ou convertie en drawer ;
- grilles réduites à 2 colonnes ;
- éviter les blocs trop profonds.

#### Mobile
- passage à une colonne ;
- navigation simplifiée ;
- réduction des cartes denses ;
- suppression des doubles panneaux verticaux.

### 6.7 Cartes et composants

Les cartes doivent avoir des variantes normées :
- `card-default`
- `card-strong`
- `card-subtle`
- `card-warning`
- `card-success`
- `card-danger`

Les composants répétitifs à extraire :
- sidebar nav item ;
- KPI card ;
- stat block ;
- form field ;
- alert ;
- empty state ;
- loading skeleton ;
- badge / label ;
- drawer ;
- confirm panel.

### 6.8 États d’interface

Chaque zone doit avoir des états standardisés :
- chargement ;
- vide ;
- erreur ;
- succès ;
- interdit/verrouillé ;
- hors ligne ;
- lecture seule.

Aujourd’hui ces états existent partiellement, mais pas avec la même forme visuelle.

---

## 7. Refactorisation recommandée

### 7.1 Refactor prioritaire du frontend

1. **Créer un vrai design system**
   - tokens CSS séparés ;
   - variables d’espacement, rayon, ombres, largeur, z-index ;
   - palette sémantique.

2. **Extraire les composants partagés**
   - `AppSidebar`
   - `DashboardHeader`
   - `StatsGrid`
   - `Card`
   - `Badge`
   - `ActionButton`
   - `FormField`
   - `LoadingState`
   - `EmptyState`

3. **Créer une couche API commune**
   - `apiClient` unique ;
   - gestion d’erreurs homogène ;
   - injection du token ;
   - parsing standardisé.

4. **Réduire les pages à des compositions**
   - la page ne doit plus porter toute la logique et tout le style.

5. **Supprimer la majorité des styles inline**
   - garder l’inline uniquement pour quelques valeurs dynamiques réelles.

### 7.2 Refactor prioritaire du backend

1. **Durcir la sécurité**
   - CORS limité ;
   - suppression des logs sensibles ;
   - stratégie d’auth plus propre.

2. **Normaliser les DTOs et réponses**
   - format d’erreur unique ;
   - validation plus stricte ;
   - typage moins permissif.

3. **Séparer les règles métier critiques**
   - progression ;
   - quêtes ;
   - pénalités ;
   - notifications ;
   - systèmes RPG.

4. **Réactiver et augmenter les tests**
   - unités ;
   - intégration ;
   - contrat API.

### 7.3 Refactor des flux auth et session

- éviter le token en `localStorage` pour les flux sensibles ;
- centraliser la session ;
- empêcher le flash de routes privées ;
- unifier le logout client et serveur ;
- prévoir le refresh ou la révocation propre.

---

## 8. Spécification technique UI/UX cible

### 8.1 Système de design

Le produit doit être organisé autour de quatre couches :

1. **Tokens** : couleurs, spacing, radius, shadow, typography, z-index.
2. **Primitives UI** : boutons, champs, badges, cards, alertes.
3. **Composants de composition** : sidebar, headers, panels, drawers, grids.
4. **Composants métier** : progression card, quest card, session card, discipline card, admin settings panel.

### 8.2 Palette sémantique

- **Primaire** : violet / marque ;
- **Apprenant / progression** : cyan ;
- **Succès / validation** : émeraude ;
- **Alerte / admin / notice** : orange ;
- **Danger / erreur / sanction** : rouge.

### 8.3 Grille et conteneurs

- container principal desktop : largeur max fixe et centrée ;
- sidebar : largeur stable ;
- grille KPI : 4 colonnes desktop, 2 tablette, 1 mobile ;
- sections : 32 px de séparation ;
- cards : padding homogène, radius unifié, bordure cohérente.

### 8.4 Formulaires

- labels toujours visibles ;
- message d’aide sous les champs sensibles ;
- erreurs affichées immédiatement sous le champ ou dans un bloc d’alerte ;
- icônes décoratives séparées des actions ;
- boutons de soumission avec état loading.

### 8.5 Navigation

- nav active clairement marquée ;
- item actif avec contraste fort ;
- badge compteur sur notifications ;
- hiérarchie visible entre sections utilisateur et admin ;
- navigation mobile dédiée si le produit vise une vraie exploitation smartphone.

---

## 9. Matrice de priorité

| Priorité | Sujet | Pourquoi | Refactor attendu |
|---|---|---|---|
| P0 | Auth / sécurité | Impact direct sur l’accès et la confiance | Cookies, garde de route, CORS réduit, logs nettoyés |
| P0 | Design system | Base de toute évolution UI | Tokens et composants partagés |
| P1 | Styles inline | Dette de maintenance majeure | Extraction vers composants et classes |
| P1 | Couche API | Répétition et fragilité | Client unique, erreurs standardisées |
| P1 | Accessibilité | UX et conformité | Labels, focus, aria, sémantique |
| P2 | Tests | Régression future | Réactiver specs, couvrir les flux critiques |
| P2 | Documentation | Gouvernance du produit | Unifier les sources de vérité |

---

## 10. Conclusion

LevelUP a déjà une vraie colonne vertébrale fonctionnelle. Le chantier maintenant n’est plus de prouver qu’il peut “faire beaucoup”, mais de prouver qu’il peut **tenir dans la durée**.

Le refactor à faire est clair :
- découper le front,
- normaliser le design,
- durcir l’auth,
- centraliser les flux API,
- réactiver les tests,
- réduire la dette des styles inline,
- formaliser les règles UI/UX.

C’est à ce prix que le projet passera d’une plateforme riche à une plateforme réellement maintenable, scalable et crédible en production.
