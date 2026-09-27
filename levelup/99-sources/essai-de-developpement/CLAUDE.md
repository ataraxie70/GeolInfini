# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
LevelUP is a learning platform consisting of a NestJS backend and a Next.js frontend.

## Environment & Execution
The project is designed to be developed within a **Dev Container**. 
**Crucial:** All project-specific commands (npm, npx, prisma, nest) must be executed inside the Dev Container to ensure reproducibility. Do not run these on the host machine.

### Host Machine Commands
- `make up`: Starts the environment.
- `make exec`: Enters the container.

### Backend (NestJS)
Location: `platform/backend`
- `npm install`: Install dependencies.
- `npm run build`: Compile the project.
- `npm run start:dev`: Start server in development mode (Port 3001).
- `npm run test`: Run tests.
- `npx prisma validate`: Validate Prisma schema.
- `nest generate module <name>`: Generate a new module.

### Frontend (Next.js)
Location: `platform/frontend`
- `npm install`: Install dependencies.
- `npm run dev`: Start development server (Port 3000).
- `npm run build`: Build for production.

## Architecture
- **Backend**: Built with NestJS, using TypeScript strict mode. It serves as the orchestration API.
- **Frontend**: Built with Next.js 16 (App Router), TypeScript, and Vanilla CSS.
- **Database**: Managed via Prisma ORM, with PostgreSQL and Redis infrastructure provided by the Dev Container.
- **Structure**: 
    - `platform/backend`: Contains the API logic, Prisma schema, and business services.
    - `platform/frontend`: Contains the UI components and application pages.
