# Structure technique des dossiers du projet
## Plateforme de pilotage de l’apprentissage

## 1. Objectif

Cette structure de dossiers sert à organiser le projet de manière claire, maintenable et évolutive.

Elle doit séparer :
- le front-end ;
- le back-end ;
- les scripts d’infrastructure ;
- les migrations de base de données ;
- les tests ;
- la documentation ;
- les fichiers de configuration ;
- les ressources techniques.

La structure ci-dessous est adaptée à un MVP sérieux, puis à une montée en puissance progressive.

---

## 2. Arborescence racine recommandée

```text
learning-platform/
├── backend/
├── frontend/
├── infrastructure/
├── database/
├── tests/
├── docs/
├── scripts/
├── storage/
├── logs/
├── .gitignore
├── README.md
├── LICENSE
└── docker-compose.yml
```

---

## 3. Détail de chaque dossier

## 3.1 `backend/`
Contient toute la logique serveur.

```text
backend/
├── app/
├── tests/
├── alembic/
├── alembic.ini
├── requirements.txt
├── pyproject.toml
└── Dockerfile
```

### Rôle
Ce dossier contient :
- l’API ;
- la logique métier ;
- la validation des entrées ;
- l’accès à la base de données ;
- les services applicatifs.

### Sous-dossiers internes recommandés

```text
backend/app/
├── main.py
├── core/
├── api/
├── models/
├── schemas/
├── services/
├── repositories/
├── db/
├── utils/
└── tasks/
```

#### `core/`
Paramètres globaux, constantes, configuration, sécurité, variables d’environnement.

#### `api/`
Routes HTTP organisées par ressource.

```text
backend/app/api/
├── v1/
│   ├── domains.py
│   ├── subjects.py
│   ├── sessions.py
│   ├── validations.py
│   ├── revisions.py
│   ├── projects.py
│   ├── dashboard.py
│   └── notifications.py
└── deps.py
```

#### `models/`
Modèles de données ORM.

#### `schemas/`
Schémas de validation et de réponse.

#### `services/`
Logique métier pure.

#### `repositories/`
Accès aux données et requêtes.

#### `db/`
Connexion, session, initialisation, migrations.

#### `utils/`
Fonctions techniques réutilisables.

#### `tasks/`
Tâches asynchrones ou planifiées.

---

## 3.2 `frontend/`
Contient l’interface utilisateur.

```text
frontend/
├── public/
├── src/
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
└── Dockerfile
```

### Sous-dossiers internes recommandés

```text
frontend/src/
├── assets/
├── components/
├── features/
├── pages/
├── layouts/
├── hooks/
├── services/
├── store/
├── types/
├── utils/
└── styles/
```

#### `components/`
Composants réutilisables : cartes, boutons, tableaux, formulaires, modales.

#### `features/`
Fonctionnalités métier regroupées par domaine fonctionnel.

Exemple :
- `features/domains/`
- `features/subjects/`
- `features/sessions/`
- `features/validations/`
- `features/revisions/`
- `features/projects/`
- `features/dashboard/`

#### `pages/`
Pages principales de navigation.

#### `layouts/`
Structures d’écran globales.

#### `services/`
Appels API.

#### `store/`
État global si besoin.

#### `types/`
Types TypeScript.

#### `styles/`
Styles globaux, thèmes, variables visuelles.

---

## 3.3 `infrastructure/`
Contient ce qui sert au déploiement, à l’exécution locale et à la configuration système.

```text
infrastructure/
├── nginx/
├── apache/
├── systemd/
├── docker/
├── env/
└── monitoring/
```

### Rôle
- configuration du serveur web ;
- configuration d’exécution ;
- services locaux ;
- supervision ;
- fichiers d’environnement.

### Remarque
Au départ, un seul système de serveur web doit être retenu. Il ne faut pas mélanger Apache et Nginx dans le noyau du projet sans nécessité.

---

## 3.4 `database/`
Contient tout ce qui touche à la structure de données.

```text
database/
├── migrations/
├── seeds/
├── schema/
├── backups/
└── sqlite/
```

### Rôle
- scripts de création de tables ;
- migrations ;
- données initiales ;
- sauvegardes ;
- fichiers SQLite locaux.

### Conseils
- `schema/` : définitions SQL ou documentation du schéma ;
- `migrations/` : évolution contrôlée de la structure ;
- `seeds/` : données d’exemple ;
- `backups/` : copies de sécurité ;
- `sqlite/` : base locale si nécessaire.

---

## 3.5 `tests/`
Contient les tests transversaux du projet.

```text
tests/
├── backend/
├── frontend/
├── integration/
├── fixtures/
└── test_data/
```

### Rôle
- tests unitaires ;
- tests d’intégration ;
- jeux de données ;
- scénarios de validation.

---

## 3.6 `docs/`
Contient la documentation du projet.

```text
docs/
├── architecture/
├── database/
├── api/
├── roadmap/
├── specs/
└── user-guides/
```

### Rôle
- documentation technique ;
- documentation fonctionnelle ;
- guides de déploiement ;
- guide d’utilisation ;
- décisions d’architecture.

---

## 3.7 `scripts/`
Contient les scripts utilitaires.

```text
scripts/
├── init/
├── backup/
├── deploy/
├── maintenance/
└── dev/
```

### Rôle
- initialisation du projet ;
- création de la base ;
- sauvegarde ;
- restauration ;
- automatisation locale.

---

## 3.8 `storage/`
Contient les fichiers persistants non code.

```text
storage/
├── uploads/
├── exports/
├── reports/
└── attachments/
```

### Rôle
- documents joints ;
- exports de données ;
- rapports ;
- pièces techniques.

---

## 3.9 `logs/`
Contient les journaux applicatifs et techniques.

```text
logs/
├── app/
├── backend/
├── frontend/
└── system/
```

### Rôle
- historique d’exécution ;
- erreurs ;
- événements système ;
- diagnostic.

---

## 4. Fichiers racine recommandés

### `README.md`
Présentation générale du projet.

### `LICENSE`
Licence du projet.

### `.gitignore`
Exclusions Git.

### `docker-compose.yml`
Orchestration locale des services si nécessaire.

---

## 5. Structure MVP recommandée

Pour la première version utile, la structure minimale doit être :

```text
learning-platform/
├── backend/
├── frontend/
├── database/
├── docs/
├── tests/
├── scripts/
├── storage/
├── logs/
└── README.md
```

### Ce qu’il faut éviter au départ
- trop de dossiers vides ;
- multiplication prématurée des services ;
- complexité Docker inutile ;
- séparation excessive avant que le cœur fonctionnel soit fini.

---

## 6. Organisation du code par responsabilité

### Backend
- configuration ;
- routes ;
- logique métier ;
- accès aux données ;
- tests.

### Frontend
- pages ;
- composants ;
- services API ;
- état global ;
- styles.

### Database
- schéma ;
- migrations ;
- sauvegardes.

### Infrastructure
- lancement local ;
- serveur web ;
- variables d’environnement ;
- supervision.

---

## 7. Ordre conseillé de création

1. racine du projet ;
2. `backend/` ;
3. `frontend/` ;
4. `database/` ;
5. `docs/` ;
6. `scripts/` ;
7. `storage/` ;
8. `logs/` ;
9. `infrastructure/` ;
10. `tests/`.

---

## 8. Règle de stabilité

La structure ne doit pas être réorganisée constamment.

Une arborescence cohérente doit rester stable assez longtemps pour que :
- le code reste lisible ;
- les responsabilités restent nettes ;
- les évolutions ne cassent pas les bases.

---

## 9. Conclusion

La structure choisie doit rester simple, lisible et compatible avec une montée en puissance progressive.

La priorité est de séparer clairement :
- l’interface ;
- l’API ;
- la logique métier ;
- la base de données ;
- les tests ;
- la documentation ;
- les scripts système.

C’est cette séparation qui rendra la plateforme maintenable sur le long terme.

