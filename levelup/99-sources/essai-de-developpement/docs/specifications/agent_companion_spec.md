# Spécifications de l'Agent Compagnon LevelUP

L'Agent Compagnon est un programme léger s'exécutant en arrière-plan sur la machine de travail de l'utilisateur. Son rôle est de fournir une preuve d'exécution réelle pour alimenter le système de discipline.

## 1. Architecture Technique Recommandée
- **Langage** : Rust (pour la performance, la sécurité mémoire et l'accès direct aux APIs système).
- **Cible** : Binary autonome (sans runtime).
- **Privilèges** : Utilisateur standard (avec accès aux APIs de gestion de fenêtres).

## 2. Fonctionnalités Clés

### A. Tracking du Focus (Deep Work)
L'agent doit surveiller l'application active au premier plan.
- **Mécanisme** : Interroger périodiquement (toutes les 30s) le titre de la fenêtre active ou le nom du processus.
- **Filtre** : Seules les applications définies dans la configuration `focusApps` (ex: `vim`, `tmux`, `rustc`, `gcc`, `gdb`, `CLion`) comptent comme du temps d'étude.
- **Calcul** : Accumuler les minutes de focus effectives.

### B. Heartbeat (Preuve de Présence)
- Envoyer un signal `POST /agent/heartbeat` toutes les 5 minutes.
- Cela permet au serveur de savoir si l'utilisateur est "au poste".

### C. Rapport d'Activité
- À la fin d'une session ou toutes les heures, envoyer un rapport `POST /agent/activity`.
- **Payload** : 
  - `deviceId`: ID unique de la machine.
  - `focusMinutes`: Total des minutes passées sur les outils de focus.
  - `topProcesses`: Liste des processus les plus utilisés.

## 3. Flux de Communication (API)

| Action | Endpoint | Méthode | Description |
| :--- | :--- | :--- | :--- |
| **Enregistrement** | `/agent/register` | POST | Lier l'ID unique de la machine à l'utilisateur (nécessite JWT). |
| **Configuration** | `/agent/config` | GET | Récupérer la liste des apps de focus et l'intervalle de heartbeat. |
| **Présence** | `/agent/heartbeat` | POST | Signaler que la machine est active. |
| **Preuve** | `/agent/activity` | POST | Envoyer les métriques de Deep Work pour gagner des points. |

## 4. Règle de Discipline
Le système considère que **le code ne ment pas**. L'utilisation d'un compilateur ou d'un éditeur de texte minimaliste (Vim) est une preuve d'effort intellectuel supérieur. Le serveur convertit ces minutes de "bas niveau" en points de discipline.
