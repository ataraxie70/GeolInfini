# Workspace LevelUP

Ce dossier de workspace contient plusieurs artefacts autour de LevelUP, mais une seule source de verite operative.

## Source de verite

- Projet actif: `levelUP/`
- Depot git actif: `levelUP/.git`
- Backend actif: `levelUP/backend/`
- Frontend actif: `levelUP/frontend/`

## Backend unifie

- Le backend legacy a la racine a ete absorbe puis supprime.
- Toute correction, execution et validation backend doit passer par `levelUP/backend/`.

## Dossiers non autoritaires

- `levelUP_backup_20260430_094007/`: sauvegarde
- `levelup_core_engine_pack/` et autres `.zip`: archives et materiaux de reference

## Commandes de travail

Depuis cette racine de workspace, utiliser les wrappers:

```bash
make backend-check
make backend-test
make frontend-build
make phase0-check
```

Tous ces targets deleguent vers `levelUP/`, qui reste l'unique projet a modifier et valider.

`make backend-test` execute la suite backend de reference via `pytest`.
`make phase0-check` chaine maintenant `backend-check`, `backend-test` et `frontend-build`.
