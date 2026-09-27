# LevelUP — Spécification UI/UX Learner

## Rôle
L'espace learner sert à guider l'apprenant dans un parcours verrouillé, lisible et motivant.

## Écrans principaux
- Dashboard
- Parcours
- Mission Center
- Skill Tree
- QCM / Tests
- Profil RPG
- Notifications
- Journal d'activité
- Révisions

## Règles UI
- Une action principale par écran.
- Les états doivent être explicites.
- Le verrouillage doit être visible.
- Le délai des missions doit être lisible.
- Les révisions doivent apparaître avant l'oubli.

## Dashboard
Le dashboard affiche :
- niveau courant
- XP total
- progression vers le niveau suivant
- mission active
- mission à activer
- rappels de révision
- statut disciplinaire
- dernières notifications

## Mission Center
États possibles :
- proposée
- notifiée
- en attente d'activation
- active
- complétée
- expirée
- obligatoire
- échouée

## Skill Tree
L'arbre montre :
- les branches du parcours
- les noeuds verrouillés / disponibles / maîtrisés
- les prérequis
- la consolidation nécessaire avant passage

## Profil RPG
Afficher :
- avatar
- niveau
- classe
- XP
- titres
- achievements
- statistiques
- historique
- discipline
