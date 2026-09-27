# Psycho-Pass

Psycho-Pass is a web platform for psychotechnical and general knowledge tests.

This repository contains the real application workspace. Local folders `prod-docs/` and
`prompt-pack/` are development references only and are ignored by Git for now.

## Stack

- Frontend: Next.js, React, TypeScript, Tailwind CSS
- Backend: NestJS, TypeScript
- Database: PostgreSQL
- ORM: Prisma
- API: REST JSON under `/api/v1`
- Quality: ESLint, Prettier, Vitest, Husky, lint-staged

## Workspace

```text
apps/
  frontend/
  backend/
```

## Commands

```bash
npm install
npm run dev
npm run dev:frontend
npm run dev:backend
npm run check:structure
npm run lint
npm run typecheck
npm run test
npm run build
```

## Environment

Create local environment files from `.env.example`. Secrets must never be committed.

## Development rule

The frontend displays. The backend decides. Critical scoring, permissions, validation and
test-session rules must stay server-side.
