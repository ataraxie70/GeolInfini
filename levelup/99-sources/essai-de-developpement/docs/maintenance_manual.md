# Manuel de Maintenance et Opérations - LevelUP

Ce document fournit les instructions nécessaires pour maintenir la plateforme LevelUP en condition opérationnelle.

## 1. Monitoring et Santé du Système
### Backend
- **Logs** : Consulter les logs NestJS pour détecter les erreurs 500 ou les crashs de services.
- **Prisma** : Surveiller les temps de réponse des requêtes SQL.

### BullMQ (Queues)
- **Surveillance** : Vérifier l'état des jobs dans Redis.
- **Jobs Échoués** : Les jobs de discipline (`accountability`) peuvent échouer. Ils sont configurés avec 3 tentatives et un backoff exponentiel. S'ils échouent définitivement, vérifier les logs du `AccountabilityProcessor`.

### Agent Companion
- **Heartbeat** : Vérifier que les battements de cœur des agents sont bien reçus par le backend.

## 2. Gestion des Données
### Sauvegardes (Backups)
- Effectuer un dump quotidien de la base PostgreSQL.
- Tester la restauration trimestriellement.

### Maintenance Base de Données
- Appliquer les nouvelles migrations via `npx prisma migrate deploy`.
- Optimiser les index sur les tables `sessions` et `activity_logs` en cas de ralentissement.

## 3. Résolution des Problèmes Communs
### Erreur de connexion Redis
- **Symptôme** : Le backend ne démarre pas ou les jobs de fond ne s'exécutent pas.
- **Solution** : Vérifier que le service Redis est actif et que les variables `REDIS_HOST` et `REDIS_PORT` sont correctes.

### Désynchronisation de l'Agent
- **Symptôme** : L'apprenant est marqué comme "absent" alors qu'il travaille.
- **Solution** : Vérifier la version du binaire Rust installé sur la machine client et la connectivité réseau vers l'API.

## 4. Cycle de Mise à Jour
1. **Mise à jour du code** : `git pull` $\rightarrow$ `npm install` $\rightarrow$ `npm run build`.
2. **Migration DB** : `npx prisma migrate deploy`.
3. **Redémarrage** : Restart du service via PM2 ou Docker.
4. **Validation** : Exécution des tests de fumée (smoke tests) sur les parcours critiques (Login $\rightarrow$ Dashboard $\rightarrow$ Session Start).
