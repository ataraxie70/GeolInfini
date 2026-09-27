# Guide de Déploiement - LevelUP

Ce document décrit la procédure de déploiement de la plateforme LevelUP en environnement de production ou de staging.

## 1. Architecture de Déploiement
Le système est composé de trois composants principaux :
- **Backend** : Application NestJS (Node.js).
- **Frontend** : Application Next.js (Node.js/Vercel).
- **Infrastructure** : PostgreSQL (Données) et Redis (Files d'attente/Cache).
- **Agent Companion** : Binaire Rust à installer sur la machine de l'apprenant.

## 2. Pré-requis Infrastructure
### Base de données (PostgreSQL)
- Version : 15+
- Configuration : Accès réseau autorisé pour le backend.
- Variables d'environnement requises : `DATABASE_URL`.

### Cache & Queues (Redis)
- Version : 6+
- Variables d'environnement requises : `REDIS_HOST`, `REDIS_PORT`.

## 3. Procédure de Déploiement Backend
1. **Build** :
   ```bash
   cd apps/backend
   npm install
   npm run build
   ```
2. **Migrations Base de Données** :
   ```bash
   npx prisma migrate deploy
   ```
3. **Lancement** :
   Utiliser un gestionnaire de processus comme PM2 ou un conteneur Docker.
   ```bash
   npm run start:prod
   ```

## 4. Procédure de Déploiement Frontend
1. **Build** :
   ```bash
   cd apps/frontend
   npm install
   npm run build
   ```
2. **Lancement** :
   - Option A (Auto-hébergé) : `npm run start`
   - Option B (Vercel/Netlify) : Connecter le dépôt Git et configurer les variables d'environnement.

## 5. Configuration des Variables d'Environnement (.env)
| Variable | Description | Exemple |
| :--- | :--- | :--- |
| `DATABASE_URL` | URL de connexion PostgreSQL | `postgresql://user:pass@host:5432/db` |
| `REDIS_HOST` | Hôte du serveur Redis | `redis` |
| `REDIS_PORT` | Port du serveur Redis | `6379` |
| `JWT_SECRET` | Clé secrète pour les tokens JWT | `secret-key-12345` |
| `FRONTEND_URL` | URL publique du frontend | `https://app.levelup.io` |

## 6. Validation du Déploiement
- Vérifier l'accès à l'endpoint `/health` du backend.
- S'assurer que le frontend charge correctement et peut s'authentifier.
- Vérifier que le Redis heartbeat est actif.
