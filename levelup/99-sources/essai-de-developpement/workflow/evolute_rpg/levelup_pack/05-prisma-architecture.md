# LevelUP — Prisma Architecture

## Base technique
- PostgreSQL
- Prisma
- migrations versionnées
- relations explicites

## Noyaux de données
### Identité
- User
- UserProfile
- Role
- Preference

### Pédagogie
- Program
- StudyPlan
- Module
- Topic
- TopicPrerequisite
- TopicProgress

### RPG
- XPLog
- LevelHistory
- Title
- UserTitle
- Achievement
- UserAchievement
- Class
- StatSnapshot

### Missions
- Quest
- UserQuest
- MissionDeadline
- MissionPenalty

### Évaluation
- Quiz
- QuizQuestion
- QuizAttempt
- QuizAnswer
- QuizResult

### Système
- Notification
- SystemEvent
- RevisionReminder
- LockRule
- UnlockRule

## Principes de migration
- ajouter avant de supprimer
- préserver l'existant
- backfill si nécessaire
- documenter chaque changement
- éviter les ruptures de progression
