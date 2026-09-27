# Design system front-end
## Plateforme de pilotage de l’apprentissage

## 1. Objectif visuel

Le design doit servir trois priorités :

1. **clarté** : lecture immédiate de l’information ;
2. **discipline** : hiérarchie forte, pas d’encombrement ;
3. **concentration** : interface calme, sérieuse, peu intrusive.

La plateforme n’est pas une vitrine marketing. C’est un poste de travail intellectuel.

---

## 2. Positionnement esthétique

Le style visuel doit être :
- sobre ;
- technique ;
- moderne ;
- stable ;
- orienté tableau de bord ;
- peu décoratif.

### Mots-clés de direction
- précision ;
- contrôle ;
- progression ;
- structure ;
- maîtrise.

### Ce qu’il faut éviter
- couleurs criardes ;
- trop de dégradés ;
- animations inutiles ;
- surcharge visuelle ;
- effet “startup gadget” ;
- décoration non fonctionnelle.

---

## 3. Identité visuelle globale

### 3.1 Ambiance générale
L’interface doit donner une impression de :
- sérieux ;
- efficacité ;
- calme ;
- concentration ;
- structure.

### 3.2 Référence de langage visuel
Le système doit ressembler à un outil de pilotage professionnel :
- tableau de bord clair ;
- cartes lisibles ;
- navigation simple ;
- indicateurs de progression ;
- zones de travail bien délimitées.

---

## 4. Palette de couleurs

La palette doit rester réduite et contrôlée.

### 4.1 Couleur principale
**Bleu profond / indigo sombre**

Rôle :
- couleur de structure ;
- couleur des actions principales ;
- couleur d’identité.

### 4.2 Couleur secondaire
**Gris bleuté / ardoise**

Rôle :
- fonds secondaires ;
- encarts ;
- séparateurs ;
- structure neutre.

### 4.3 Couleur d’accent
**Vert sobre ou cyan technique**

Rôle :
- validation ;
- progression ;
- éléments actifs ;
- confirmation.

### 4.4 Couleur d’alerte
**Orange doux ou ambre**

Rôle :
- rappel ;
- attention ;
- révision due ;
- blocage partiel.

### 4.5 Couleur de danger
**Rouge discret**

Rôle :
- erreur ;
- échec ;
- blocage critique.

### 4.6 Fond principal
**Gris très sombre ou presque noir**

Rôle :
- réduire la fatigue visuelle ;
- faire ressortir les cartes et le texte ;
- renforcer le confort sur de longues sessions.

### 4.7 Texte principal
**Blanc cassé / gris très clair**

Rôle :
- lecture principale ;
- contraste net sur fond sombre.

---

## 5. Système de couleurs fonctionnelles

Chaque couleur doit avoir un rôle strict.

### États recommandés
- **À faire** : neutre
- **En cours** : bleu
- **À réviser** : orange
- **Validé** : vert
- **Bloqué** : rouge
- **Archivé** : gris

### Règle
Une couleur ne doit pas être utilisée pour deux états contradictoires.

---

## 6. Typographie

### 6.1 Police recommandée
La police doit être moderne, lisible et sobre.

#### Police principale possible
- **Inter**
- **IBM Plex Sans**
- **Roboto**

### 6.2 Police pour le code ou les éléments techniques
- **IBM Plex Mono**
- **JetBrains Mono**
- **Source Code Pro**

### 6.3 Règle typographique
- titres nets ;
- texte court et lisible ;
- hiérarchie visible ;
- pas de fonte décorative.

### 6.4 Échelle recommandée
- **Titre principal** : très grand, fort, stable ;
- **Sous-titre** : moyen ;
- **Corps** : lisible et confortable ;
- **Légendes** : petites, mais jamais trop faibles.

---

## 7. Hiérarchie des titres

La hiérarchie doit être immédiatement visible.

### Structure recommandée
- **H1** : page ou vue principale ;
- **H2** : bloc fonctionnel principal ;
- **H3** : sous-section ;
- **texte secondaire** : commentaire, note, méta-information.

### Règle
Le regard doit comprendre en moins de 3 secondes :
- où il est ;
- ce qu’il regarde ;
- ce qui est prioritaire.

---

## 8. Layout général

### 8.1 Structure de page
Le layout doit reposer sur une logique en trois zones :

- **barre latérale** : navigation ;
- **zone centrale** : contenu principal ;
- **colonne secondaire** : contexte, détails, rappels.

### 8.2 Organisation type
```text
┌──────────────────────────────────────────────┐
│ Header : titre, recherche, profil, raccourcis │
├──────────────┬───────────────────────────────┤
│ Sidebar      │ Contenu principal              │
│ navigation   │ cartes, tableaux, formulaires  │
│              │                               │
├──────────────┴───────────────┬───────────────┤
│                               │ Panneau      │
│                               │ contexte     │
└───────────────────────────────┴───────────────┘
```

### 8.3 Règle
Chaque vue doit garder une structure stable pour éviter la désorientation.

---

## 9. Navigation

### 9.1 Navigation principale
Doit contenir les accès suivants :
- tableau de bord ;
- domaines ;
- sujets ;
- séances ;
- validations ;
- révisions ;
- projets ;
- historique ;
- paramètres.

### 9.2 Placement
La navigation principale doit être dans une **sidebar verticale fixe**.

### 9.3 Comportement
- élément actif bien visible ;
- sous-menu simple ;
- état réduit en mode compact ;
- icônes présentes mais secondaires au texte.

---

## 10. Composants visuels principaux

## 10.1 Cartes
Les cartes doivent servir à afficher :
- progression ;
- état des sujets ;
- prochaines révisions ;
- statistiques ;
- alertes.

### Style
- coins arrondis modérés ;
- ombre légère ;
- fond distinct du fond global ;
- contenu bien espacé.

## 10.2 Badges
Utiles pour les statuts.

Exemples :
- validé ;
- en cours ;
- bloqué ;
- à réviser.

## 10.3 Tableaux
Utiles pour :
- la liste des sujets ;
- l’historique ;
- les séances ;
- les révisions.

### Règle
Les tableaux doivent être lisibles, aérés, filtrables, et non surchargés.

## 10.4 Formulaires
Doivent être :
- courts ;
- segmentés ;
- clairs ;
- avec labels visibles ;
- avec erreurs explicites.

## 10.5 Modales
À réserver aux actions ponctuelles :
- validation ;
- création rapide ;
- confirmation ;
- suppression ;
- édition légère.

---

## 11. Espacement et grille

### 11.1 Grille
Utiliser une grille régulière basée sur des espacements constants.

### 11.2 Règle d’espacement
- marges généreuses ;
- respiration entre blocs ;
- pas de densité excessive ;
- alignements précis.

### 11.3 Valeurs conseillées
- petit espace : 4 px / 8 px ;
- espace moyen : 12 px / 16 px ;
- grand espace : 24 px / 32 px ;
- séparation majeure : 48 px.

### 11.4 Principe
La densité doit rester faible à moyenne. L’outil doit être confortable sur de longues sessions.

---

## 12. Iconographie

### Règle
Les icônes doivent compléter le texte, jamais le remplacer totalement.

### Style
- minimal ;
- cohérent ;
- linéaire ;
- technique.

### Usage
- navigation ;
- statuts ;
- actions rapides ;
- alertes.

---

## 13. Hiérarchie de contenu

### Zone prioritaire
Le contenu le plus important doit être visible sans effort :
- sujet du jour ;
- révisions dues ;
- progression ;
- blocages.

### Zone secondaire
- détails ;
- historique ;
- notes ;
- métadonnées.

### Zone tertiaire
- paramètres ;
- informations complémentaires ;
- éléments rarement utilisés.

---

## 14. Design des pages principales

## 14.1 Tableau de bord
Doit afficher :
- progression globale ;
- sujets à faire ;
- sujets en cours ;
- révisions à venir ;
- blocages ;
- prochain objectif.

### Structure
- haut : résumé global ;
- milieu : cartes d’indicateurs ;
- bas : liste des priorités du jour.

## 14.2 Page des sujets
Doit afficher :
- liste hiérarchisée ;
- filtres ;
- statut ;
- prérequis ;
- niveau ;
- temps estimé.

## 14.3 Page de séance
Doit afficher :
- sujet ;
- objectif ;
- timer ;
- notes ;
- difficulté ;
- clôture.

## 14.4 Page de validation
Doit afficher :
- critères ;
- résultats ;
- statut ;
- commentaire ;
- prochaine révision.

## 14.5 Page de révision
Doit afficher :
- liste des révisions ;
- priorité ;
- échéance ;
- état.

## 14.6 Page projet
Doit afficher :
- projet actif ;
- sujets liés ;
- avancement ;
- livrables ;
- blocages.

---

## 15. États visuels

Chaque élément important doit avoir des états visuels distincts.

### États nécessaires
- normal ;
- survol ;
- actif ;
- sélectionné ;
- désactivé ;
- erreur ;
- succès ;
- avertissement.

### Règle
Le système visuel doit être cohérent sur toute la plateforme.

---

## 16. Formes et arrondis

### Style recommandé
- arrondis légers à modérés ;
- pas de formes excessivement rondes ;
- angles propres ;
- surfaces nettes.

### Règle
Le design doit rester technique, pas ludique.

---

## 17. Ombres et profondeur

### Règle
Utiliser des ombres très discrètes.

### Objectif
- séparer les blocs ;
- créer de la profondeur ;
- éviter un effet plat monotone.

### Interdiction
- ombres trop fortes ;
- effets brillants ;
- néons excessifs.

---

## 18. Mode sombre et mode clair

### Recommandation
Le **mode sombre** doit être le mode principal.

### Pourquoi
- meilleure concentration ;
- fatigue visuelle réduite ;
- cohérence avec un outil technique ;
- contraste plus fort pour les tableaux de bord.

### Mode clair
Doit rester disponible, mais secondaire.

---

## 19. Ton visuel des messages

### Succès
- clair ;
- calme ;
- peu bavard.

### Erreur
- direct ;
- explicite ;
- sans ambiguïté.

### Avertissement
- visible ;
- bref ;
- orienté action.

---

## 20. Règles d’accessibilité

### Exigences minimales
- contraste suffisant ;
- labels lisibles ;
- hiérarchie claire ;
- navigation clavier possible ;
- états visibles ;
- textes suffisamment grands.

---

## 21. Animation et micro-interactions

### Principe
Les animations doivent être rares, utiles et discrètes.

### Usage autorisé
- transitions courtes ;
- feedback de validation ;
- ouverture de panneau ;
- changement d’état.

### Usage interdit
- animation décorative continue ;
- effets lourds ;
- distraction visuelle.

---

## 22. Style des données

Les données techniques doivent être présentées de façon lisible.

### Exemples
- dates au format stable ;
- états sous forme de badges ;
- pourcentages clairs ;
- listes bien espacées ;
- indicateurs numérotés.

---

## 23. Ligne directrice finale

Le design front-end doit faire une chose avant tout :

**rendre l’apprentissage lisible, ordonné et contrôlable**.

Tout élément visuel qui n’améliore pas cette mission doit être écarté.

