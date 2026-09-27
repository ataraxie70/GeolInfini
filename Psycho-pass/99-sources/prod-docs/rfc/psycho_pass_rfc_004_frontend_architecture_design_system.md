# RFC-004 — Frontend Architecture et Design System
## Projet : Psycho-Pass
### Statut : Draft
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit l’architecture frontend officielle du projet Psycho-Pass ainsi que les règles de design system, d’ergonomie et d’interaction.

Il sert de référence à l’équipe technique et produit pour :
- figer la structure des écrans ;
- standardiser l’interface utilisateur ;
- définir les composants réutilisables ;
- établir les règles visuelles ;
- harmoniser les interactions ;
- garantir une expérience claire, rapide et cohérente sur desktop et mobile.

---

# 2. RÔLE DU FRONTEND DANS LE SYSTÈME

Le frontend est la couche d’expérience utilisateur de Psycho-Pass.

Il doit :
- présenter les informations de manière lisible ;
- guider l’utilisateur pendant les tests ;
- réduire la charge cognitive ;
- afficher les résultats de façon claire ;
- offrir une navigation rapide et intuitive ;
- rester strictement aligné avec les règles métier exposées par le backend.

## Principe fondamental
### Le frontend affiche, le backend décide.

Le frontend ne doit pas :
- recalculer les scores critiques ;
- décider de la difficulté des questions ;
- contourner les permissions ;
- manipuler des données sensibles sans validation serveur.

---

# 3. OBJECTIFS UX/UI

## 3.1 Objectifs d’expérience utilisateur
- simplicité ;
- rapidité ;
- lisibilité ;
- confort de lecture ;
- cohérence visuelle ;
- réduction de la friction ;
- feedback immédiat.

## 3.2 Objectifs d’interface
- interface moderne et professionnelle ;
- structure claire ;
- composants homogènes ;
- adaptation mobile parfaite ;
- hiérarchie visuelle nette ;
- états interactifs explicites.

---

# 4. STACK FRONTEND OFFICIELLE

Ce RFC s’appuie sur les décisions du RFC-002.

## Technologies retenues
- **Next.js**
- **React**
- **TypeScript**
- **Tailwind CSS**
- **shadcn/ui** ou équivalent validé
- **React Hook Form**
- **Zod**
- **Framer Motion**
- **Zustand** en option pour l’état global

---

# 5. PRINCIPES D’ARCHITECTURE FRONTEND

## 5.1 Architecture modulaire
Le frontend doit être découpé par responsabilité fonctionnelle.

### Structure recommandée
```text
src/
 ├── app/
 ├── components/
 ├── features/
 ├── hooks/
 ├── lib/
 ├── services/
 ├── stores/
 ├── styles/
 ├── types/
 └── utils/
```

## 5.2 Principes directeurs
- séparation claire entre pages, composants et logique métier légère ;
- composants réutilisables ;
- états explicites ;
- design tokens centralisés ;
- logique métier lourde absente du frontend ;
- API calls isolés dans des services dédiés.

## 5.3 Règle d’architecture
Un composant ne doit pas faire à la fois :
- la présentation ;
- la logique métier ;
- la gestion API ;
- la persistance locale complexe.

Chaque responsabilité doit être séparée.

---

# 6. STRUCTURE DES ÉCRANS

## 6.1 Écrans publics
- Accueil
- Connexion
- Inscription
- Mot de passe oublié
- Présentation des fonctionnalités
- Tarification si ajoutée plus tard

## 6.2 Écrans utilisateur
- Tableau de bord
- Sélection de test
- Écran de passage de test
- Fin de test
- Résultats
- Historique
- Profil
- Paramètres

## 6.3 Écrans administrateur
- Dashboard admin
- Gestion des questions
- Gestion des catégories
- Gestion des utilisateurs
- Statistiques globales
- Audit / logs si exposés

---

# 7. USER FLOWS PRINCIPAUX

## 7.1 Flux d’inscription
```text
Accueil → Inscription → Vérification → Tableau de bord
```

## 7.2 Flux de connexion
```text
Accueil → Connexion → Authentification → Tableau de bord
```

## 7.3 Flux de passage d’un test
```text
Tableau de bord → Sélection test → Instructions → Questions → Fin → Résultats
```

## 7.4 Flux de reprise de progression
```text
Tableau de bord → Historique → Sélection d’une session → Résultats détaillés
```

---

# 8. DESIGN SYSTEM OFFICIEL

## 8.1 Philosophie visuelle
Le design system doit inspirer :
- clarté ;
- sérieux ;
- confiance ;
- précision ;
- concentration.

L’interface doit éviter toute surcharge visuelle inutile.

## 8.2 Positionnement visuel
Psycho-Pass doit avoir une identité visuelle :
- moderne ;
- épurée ;
- analytique ;
- premium mais accessible.

## 8.3 Direction artistique
Le style doit privilégier :
- des espaces respirants ;
- des cartes bien structurées ;
- des contrastes maîtrisés ;
- des icônes simples ;
- une lecture rapide.

---

# 9. RÈGLES VISUELLES

## 9.1 Couleurs
Le système de couleurs doit être cohérent et stable.

### Palette recommandée
- **Couleur principale** : bleu profond ou indigo ;
- **Couleur secondaire** : violet ou cyan discret ;
- **Succès** : vert ;
- **Erreur** : rouge ;
- **Avertissement** : orange ;
- **Fond** : blanc cassé ou gris très clair en mode clair ;
- **Fond** : gris foncé ou noir bleuté en mode sombre.

### Règles
- une seule couleur principale forte ;
- les couleurs d’action doivent rester cohérentes ;
- les couleurs d’alerte ne doivent pas être utilisées décorativement ;
- le contraste doit rester accessible.

## 9.2 Typographie
- titres lisibles et structurés ;
- texte courant sobre et confortable ;
- hiérarchie typographique claire ;
- taille suffisante sur mobile.

## 9.3 Espacements
- grille régulière ;
- marges homogènes ;
- cards aérées ;
- aucun écran surchargé.

## 9.4 Rayons, ombres et bordures
- coins arrondis modérés ;
- ombres légères ;
- bordures discrètes ;
- séparation nette entre blocs.

---

# 10. COMPOSANTS UI STANDARD

## Composants obligatoires
- Button
- Input
- Select
- Checkbox
- Radio
- Card
- Badge
- Tabs
- Modal / Dialog
- Tooltip
- Alert
- Toast / Notification
- Progress Bar
- Timer Display
- Question Card
- Result Card
- Chart container
- Navigation sidebar
- Topbar
- Pagination si nécessaire

## Règles de composants
- un composant doit être réutilisable ;
- un composant doit avoir un style cohérent ;
- les états doivent être prévus dès la conception ;
- les variantes doivent être explicites.

---

# 11. ÉTATS D’INTERFACE

## 11.1 États obligatoires
Chaque écran ou composant important doit prévoir :
- état normal ;
- état de chargement ;
- état vide ;
- état d’erreur ;
- état désactivé ;
- état de succès.

## 11.2 États pour les tests
Les écrans de test doivent prévoir :
- démarrage ;
- question active ;
- réponse validée ;
- question suivante ;
- pause si autorisée ;
- fin de test ;
- expiration de session.

---

# 12. LOGIQUE D’INTERACTION

## 12.1 Règles générales
- toute action importante doit produire un feedback visible ;
- les transitions doivent être rapides et non intrusives ;
- les erreurs doivent être clairement expliquées ;
- les confirmations doivent être explicites.

## 12.2 Interactions critiques
### Réponse à une question
- validation rapide ;
- indication visuelle immédiate ;
- prévention du double clic ;
- retour clair en cas d’erreur.

### Soumission d’un test
- confirmation avant fin si nécessaire ;
- blocage des interactions après soumission ;
- affichage d’un état de traitement ;
- redirection vers le résultat.

### Navigation
- navigation cohérente ;
- retour simple au tableau de bord ;
- hiérarchie stable ;
- pas de surcharge de menus.

---

# 13. TABLEAU DE BORD UTILISATEUR

## 13.1 Objectif
Le dashboard doit permettre de comprendre immédiatement :
- où en est l’utilisateur ;
- quels tests ont été passés ;
- quels sont les résultats ;
- où progresser.

## 13.2 Blocs principaux
- résumé de progression ;
- score récent ;
- catégories faibles ;
- accès rapide aux tests ;
- historique récent ;
- recommandations.

## 13.3 Règle de conception
Le dashboard doit être utile dès les 3 premières secondes de lecture.

---

# 14. ÉCRAN DE TEST

## 14.1 Objectif
L’écran de test est l’écran le plus critique du produit.

Il doit être conçu pour :
- réduire les distractions ;
- faciliter la concentration ;
- assurer une lecture rapide ;
- rendre l’action de réponse simple ;
- afficher le temps restant ou le temps passé.

## 14.2 Composition recommandée
- en-tête de session ;
- timer ;
- progression ;
- question active ;
- options de réponse ;
- actions principales ;
- feedback contextuel.

## 14.3 Contraintes visuelles
- pas d’éléments décoratifs parasites ;
- pas de surcharge de blocs ;
- lisibilité prioritaire ;
- focus maximal sur la question.

---

# 15. ÉCRAN DE RÉSULTATS

## 15.1 Objectif
Le résultat doit être immédiatement compréhensible et utile.

## 15.2 Contenu attendu
- score global ;
- score par catégorie ;
- temps total ;
- temps moyen ;
- niveau estimé ;
- progression ;
- erreurs principales ;
- recommandations.

## 15.3 Présentation
- cartes lisibles ;
- graphiques simples ;
- comparaison claire ;
- absence de surcharge.

---

# 16. DESIGN MOBILE-FIRST

## 16.1 Règle
L’interface doit être pensée mobile-first.

## 16.2 Priorités sur mobile
- lisibilité ;
- boutons accessibles ;
- navigation simple ;
- tailles tactiles correctes ;
- colonnes limitées ;
- cartes empilées.

## 16.3 Comportements attendus
- adaptation automatique des blocs ;
- menus simplifiés ;
- panneaux latéraux transformés si nécessaire ;
- pas de densité visuelle excessive.

---

# 17. ACCESSIBILITÉ

Le frontend doit respecter des principes d’accessibilité minimum :
- contrastes suffisants ;
- navigation clavier ;
- textes lisibles ;
- labels clairs ;
- erreurs compréhensibles ;
- tailles interactives adaptées.

---

# 18. GESTION DES DONNÉES CÔTÉ FRONTEND

## 18.1 Règle principale
Le frontend peut conserver :
- états d’UI ;
- préférences visuelles ;
- données temporaires de navigation ;
- cache léger non critique.

## 18.2 Interdictions
Le frontend ne doit pas :
- être source de vérité métier ;
- stocker des secrets ;
- conserver des informations sensibles sans nécessité.

---

# 19. STRUCTURE DES SERVICES FRONTEND

## Services recommandés
- api client ;
- auth helper ;
- session helper ;
- question renderer ;
- scoring display helper ;
- analytics display helper.

Chaque service doit rester simple et focalisé.

---

# 20. GESTION DES ERREURS ET DES CHARGEMENTS

## 20.1 Chargements
Chaque zone dépendante d’une API doit gérer un état de chargement clair.

## 20.2 Erreurs
Les erreurs doivent être :
- visibles ;
- compréhensibles ;
- non techniques pour l’utilisateur final ;
- journalisées si nécessaire.

## 20.3 Vides
Les états vides doivent guider l’utilisateur vers l’action suivante.

---

# 21. TESTS FRONTEND

## Tests à prévoir
- tests de composants ;
- tests d’intégration UI ;
- tests des formulaires ;
- tests de navigation ;
- tests responsives critiques ;
- tests E2E sur les parcours essentiels.

---

# 22. CONTRAINTES D’IMPLÉMENTATION

## MUST
- TypeScript obligatoire ;
- composants réutilisables ;
- logique métier limitée ;
- design system centralisé ;
- responsive obligatoire ;
- accessibilité minimale respectée ;
- interactions claires ;
- séparation nette entre UI et données.

---

# 23. CRITÈRES DE VALIDATION DU FRONTEND

Le frontend sera considéré comme conforme si :
- l’utilisateur comprend instantanément les écrans principaux ;
- la navigation est fluide ;
- les tests sont lisibles et concentrés ;
- les résultats sont clairs ;
- le design reste cohérent sur mobile et desktop ;
- les composants sont réutilisables ;
- les états d’erreur et de chargement sont bien gérés.

---

# 24. ÉVOLUTIONS FUTURES

L’architecture frontend doit pouvoir accueillir :
- un mode sombre complet ;
- des widgets avancés ;
- de nouvelles catégories ;
- des animations plus riches ;
- un mode application mobile ;
- des dashboards plus personnalisés ;
- des composants de visualisation avancés.

---

# 25. CONCLUSION

Ce RFC-004 fige l’architecture frontend et le design system de Psycho-Pass.

Il garantit une base visuelle et fonctionnelle cohérente pour :
- le confort utilisateur ;
- la lisibilité ;
- la concentration durant les tests ;
- la cohérence produit ;
- l’évolutivité de l’interface.

Toute évolution significative du frontend doit être validée par mise à jour de ce RFC ou par un document complémentaire validé.

