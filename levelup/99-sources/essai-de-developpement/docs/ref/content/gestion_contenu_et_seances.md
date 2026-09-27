# Gestion du contenu et des séances
## Plateforme de pilotage de l’apprentissage

## 1. Objet

Ce document définit comment la plateforme gère le contenu pédagogique et les séances d’apprentissage, où chaque élément est affiché, et comment une séance peut être demandée, modifiée ou supprimée.

L’objectif est de garder une structure claire, contrôlée et traçable.

---

## 2. Principe général

La plateforme doit séparer 3 choses :

1. **le contenu pédagogique**
   - domaines
   - sous-domaines
   - sujets
   - concepts
   - ressources
   - exercices
   - critères de validation

2. **l’exécution d’apprentissage**
   - séances
   - notes
   - validations
   - révisions
   - erreurs

3. **la supervision**
   - tableau de bord
   - état global
   - blocages
   - rappels
   - historique

Cette séparation empêche de mélanger le plan d’étude avec son exécution réelle.

---

## 3. Cycle de vie du contenu

### 3.1 Création
Le contenu est créé dans la base selon la hiérarchie :

**Domaine → Sous-domaine → Sujet → Concept → Ressource → Exercice → Validation → Révision**

### 3.2 Enrichissement
Chaque élément peut recevoir :
- description ;
- niveau ;
- difficulté ;
- ordre ;
- dépendances ;
- ressources associées ;
- exercices associés ;
- critères de validation.

### 3.3 Utilisation
Le contenu est utilisé pour :
- afficher le parcours ;
- choisir la prochaine séance ;
- proposer les ressources ;
- bloquer les sujets non préparés ;
- valider la maîtrise.

### 3.4 Révision
Le contenu validé ou fragile est reprogrammé selon les règles de révision.

### 3.5 Archivage
Un contenu peut être archivé s’il n’est plus actif, mais il ne doit pas être supprimé sans raison s’il a déjà produit des séances, validations ou erreurs.

---

## 4. Où le contenu doit être affiché

## 4.1 Tableau de bord
Le tableau de bord affiche :
- sujet du jour ;
- prochaines révisions ;
- sujets bloqués ;
- progression globale ;
- dernières séances ;
- alertes.

### Fonction
Donner la vue instantanée de l’état du système.

---

## 4.2 Page Domaines
Affiche :
- domaines ;
- progression par domaine ;
- nombre de sujets ;
- sujets validés ;
- sujets en cours.

### Fonction
Voir la structure globale du parcours.

---

## 4.3 Page Sujets
Affiche :
- liste des sujets ;
- filtres ;
- statut ;
- niveau ;
- difficulté ;
- durée estimée ;
- dépendances.

### Fonction
Choisir le sujet à travailler.

---

## 4.4 Page Détail Sujet
Affiche :
- objectif ;
- résumé ;
- concepts liés ;
- prérequis ;
- ressources ;
- exercices ;
- validations ;
- révisions ;
- historique.

### Fonction
Travailler un sujet en profondeur.

---

## 4.5 Page Séance
Affiche :
- séance en cours ;
- sujet associé ;
- type de séance ;
- timer ;
- notes ;
- difficulté ;
- résultat ;
- actions de clôture.

### Fonction
Conduire l’exécution réelle de l’apprentissage.

---

## 4.6 Page Validations
Affiche :
- sujets à valider ;
- checklist ;
- score ;
- résultat ;
- historique des validations.

### Fonction
Décider si un sujet est acquis ou non.

---

## 4.7 Page Révisions
Affiche :
- révisions dues ;
- révisions à venir ;
- priorités ;
- état de réalisation.

### Fonction
Maintenir les acquis dans le temps.

---

## 4.8 Page Historique
Affiche :
- séances passées ;
- validations ;
- erreurs ;
- révisions ;
- actions système.

### Fonction
Conserver la traçabilité.

---

## 5. Gestion des séances

## 5.1 Création d’une séance
Une séance peut être créée :
- manuellement par l’utilisateur ;
- proposée par la plateforme selon le plan ;
- déclenchée pour une révision ;
- lancée depuis un sujet.

### Champs principaux
- sujet ;
- type de séance ;
- durée prévue ;
- objectif ;
- niveau ;
- notes initiales ;
- statut.

---

## 5.2 Statuts d’une séance
Une séance doit avoir un état clair :

- `planned` → planifiée
- `ongoing` → en cours
- `completed` → terminée
- `cancelled` → annulée
- `deleted` → supprimée logiquement

---

## 5.3 Modification d’une séance
Une séance peut être modifiée avant ou pendant son exécution :
- changement de sujet ;
- changement de durée ;
- changement de notes ;
- changement de type ;
- ajout de commentaires.

### Règle
Toute modification importante doit être historisée.

---

## 5.4 Clôture d’une séance
À la clôture, la séance doit produire :
- une durée réelle ;
- des notes finales ;
- un état de réussite ou d’échec ;
- une mise à jour du sujet ;
- une éventuelle validation ;
- une éventuelle révision.

---

## 5.5 Suppression d’une séance
La suppression doit être contrôlée.

### Règle générale
Ne pas supprimer physiquement une séance si elle a déjà :
- des notes ;
- des validations ;
- des erreurs ;
- des révisions liées.

### Méthode recommandée
Faire une **suppression logique** :
- `status = deleted`
- garder l’historique
- masquer dans les vues standards
- conserver dans l’audit

### Suppression physique possible seulement si
- la séance est vide ;
- elle n’a aucun impact historique ;
- elle n’a pas été utilisée par une validation ou une révision.

---

## 6. Demande de séance

## 6.1 Demande manuelle
L’utilisateur peut demander une séance depuis :
- un sujet ;
- un domaine ;
- le tableau de bord ;
- la page révisions ;
- un projet.

### Exemple
- “Commencer une séance sur les pointeurs”
- “Lancer une révision sur malloc”
- “Créer une séance de pratique guidée sur systemd”

---

## 6.2 Demande automatique
La plateforme peut aussi proposer une séance selon :
- le plan du jour ;
- les révisions dues ;
- les sujets faibles ;
- les projets en cours.

---

## 7. Effets d’une séance sur le système

Une séance peut provoquer :
- mise à jour du statut du sujet ;
- génération d’une validation ;
- création d’une révision ;
- enregistrement d’une erreur ;
- mise à jour du tableau de bord.

---

## 8. Gestion des erreurs et blocages

Si la séance révèle une faiblesse :
- l’erreur est enregistrée ;
- le concept concerné est identifié ;
- une ressource est recommandée ;
- une révision est programmée ;
- le sujet peut repasser en `to_review` ou `blocked`.

---

## 9. Règles de visibilité

### Visible immédiatement
- séance du jour
- révisions dues
- sujet actif
- dernière validation
- blocages

### Visible dans le détail
- concepts
- ressources
- erreurs
- historique complet
- changements de statut

### Caché par défaut
- séances supprimées logiquement
- anciennes versions des notes
- éléments archivés

---

## 10. Règle de cohérence

Chaque action sur le contenu doit répondre à une logique simple :

- si c’est du **contenu**, il va dans la structure pédagogique ;
- si c’est de l’**exécution**, il va dans les séances ;
- si c’est de la **trace**, il va dans l’historique ;
- si c’est de la **consolidation**, il va dans les révisions.

---

## 11. Conclusion

La plateforme doit gérer le contenu comme une base de connaissance vivante, et les séances comme des objets d’exécution traçables.

La suppression d’une séance doit être rare, contrôlée, et le plus souvent logique plutôt que physique.

Le bon affichage est simple :
- tableau de bord pour piloter ;
- sujet pour apprendre ;
- séance pour exécuter ;
- validation pour décider ;
- révision pour consolider ;
- historique pour vérifier.

