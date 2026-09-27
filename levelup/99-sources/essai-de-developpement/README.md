# 🚀 LevelUP - Learning Orchestration Platform

LevelUP is a high-discipline learning platform designed to steer users through complex curricula using **Intelligent Constraints**. Instead of a free-form course, LevelUP locks content based on a strict graph of prerequisites and tracks learner discipline to ensure consistent progress.

## 🎯 Core Philosophy

### 1. Intelligent Constraints
Learning is not linear. LevelUP implements a **Progression Engine** that manages topic accessibility:
- 🔒 **Locked**: Prerequisites not yet validated.
- 📖 **Available**: Prerequisites met; ready to be planned.
- ⚡ **In Progress**: Session active or interrupted.
- ✅ **Validated**: Session completed and reviewed.
- 🏆 **Mastered**: Topic fully understood and verified.

### 2. Discipline & Accountability
The "Discipline Score" is the heart of the experience.
- **Consistency**: Completing planned sessions maintains or increases the score.
- **Penalties**: Missed sessions trigger automatic penalties via a nightly cron job, lowering the discipline score.
- **Recovery**: Learners must prove consistency to recover their score.

---

## 🛠️ Technical Stack

- **Backend**: NestJS (TypeScript, Strict Mode)
- **Frontend**: Next.js 16 (App Router), TypeScript, Vanilla CSS
- **Database**: PostgreSQL (via Prisma ORM)
- **Cache/Queue**: Redis
- **Environment**: Docker Dev Container

---

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- A terminal with `make` installed

### Installation & Setup
1. **Start the environment**:
   ```bash
   make up
   ```
   This starts the PostgreSQL and Redis containers.

2. **Enter the Dev Container**:
   ```bash
   make exec
   ```

3. **Backend Setup**:
   ```bash
   cd apps/backend
   npm install
   npx prisma migrate dev # Apply database schema
   npm run seed           # Populate with demo data
   npm run start:dev      # Start API on port 3001
   ```

4. **Frontend Setup**:
   ```bash
   cd apps/frontend
   npm install
   npm run dev            # Start UI on port 3000
   ```

---

## 🔑 Demo Accounts

Use these accounts to explore the two primary experiences:

| Role | Email | Password | Access Level |
| :--- | :--- | :--- | :--- |
| **Administrator** | `admin@levelup.com` | `levelup123` | Full control over curriculum, users, and system rules. |
| **Learner** | `apprenant@levelup.com` | `levelup123` | Progression tracking, session scheduling, and learning. |

---

## 🗺️ Architecture Overview

- `/apps/backend`: The orchestration API. Handles the progression logic, discipline cron jobs, and recommendation engine.
- `/apps/frontend`: The learner and admin dashboards.
- `/docs`: System specifications and pedagogical design documents.

### Key Backend Modules:
- `ProgressionService`: Computes if a topic is unlocked based on the prerequisite graph.
- `SessionService`: Manages the lifecycle of study sessions (`planned` $\rightarrow$ `active` $\rightarrow$ `done`).
- `DisciplineService`: Calculates scores and applies penalties for missed deadlines.
- `RecommendationsService`: Suggests the "next best action" for the learner.

---

## 🛡️ V1 MVP Status
- [x] Data Model & Prisma Migrations
- [x] Admin Curriculum Management (CRUD)
- [x] Progression Engine (Prerequisite Locking)
- [x] Session Lifecycle Management
- [x] Discipline & Penalty System
- [x] Recommendation Engine
- [x] Frontend Dashboard Integration
- [x] JWT Hardening & RBAC
- [x] CI/CD Pipeline Setup
