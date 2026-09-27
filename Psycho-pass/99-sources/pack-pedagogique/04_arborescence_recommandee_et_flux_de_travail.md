# Arborescence recommandée et flux de travail

## 1. Objectif de l’arborescence

L’arborescence doit permettre à n’importe quel membre de l’équipe de retrouver rapidement :
- le frontend ;
- le backend ;
- les schémas ;
- les tests ;
- la documentation ;
- les scripts de déploiement.

## 2. Exemple d’arborescence propre

```text
psycho-pass/
├── apps/
│   ├── web/
│   └── api/
├── packages/
│   ├── shared/
│   ├── config/
│   └── types/
├── prisma/
├── docs/
├── tests/
├── .devcontainer/
├── .github/
└── scripts/
```

## 3. Rôle des dossiers

### apps/web
Contient le frontend Next.js.

### apps/api
Contient le backend NestJS.

### packages/shared
Contient ce qui peut être partagé entre frontend et backend :
- types ;
- helpers ;
- constantes ;
- contrats communs.

### prisma
Contient le schéma, les migrations et les seeds.

### docs
Contient la documentation utile à l’équipe.

### tests
Contient les tests transverses ou E2E selon l’organisation choisie.

### .devcontainer
Contient la configuration du Dev Container.

### .github
Contient les workflows de CI.

### scripts
Contient les scripts de productivité ou d’automatisation.

## 4. Flux de travail conseillé

Le travail doit suivre ce circuit :

1. comprendre le besoin ;
2. vérifier les RFC et MUST ;
3. identifier la couche concernée ;
4. modifier le bon dossier ;
5. écrire ou ajuster les tests ;
6. exécuter lint et tests ;
7. relire ;
8. ouvrir une PR ;
9. valider ;
10. fusionner.

## 5. Où mettre le code

### Exemple concret
Si tu ajoutes une logique de session de test :

- le schéma va dans Prisma ;
- la logique métier va dans le backend ;
- l’appel API va dans le controller ;
- l’affichage va dans le frontend ;
- les tests vont dans le dossier de tests approprié.

## 6. Règle de séparation

Ne mélange pas :
- UI et logique métier ;
- calcul et affichage ;
- validation de forme et validation métier ;
- configuration et code applicatif ;
- prototype et production.

## 7. Bon réflexe pour débuter une tâche

Avant d’écrire du code, note :
- la fonctionnalité ;
- le fichier cible ;
- l’impact sur la base ;
- l’impact sur l’API ;
- l’impact sur le frontend ;
- le test attendu.

## 8. Ce qu’il faut éviter

- tout mettre dans un seul dossier ;
- créer des fichiers “fourre-tout” ;
- réutiliser un composant pour un autre usage sans nom clair ;
- mettre de la logique métier dans des composants UI ;
- modifier la base sans migration.

## 9. Lecture rapide d’une PR

Une PR saine doit permettre de voir :
- le besoin ;
- la structure ;
- les changements ;
- les tests ;
- le résultat attendu.

## 10. Résumé

Une bonne arborescence réduit la confusion.
Un bon flux de travail réduit les erreurs.
Un bon junior apprend vite quand il sait où regarder et où écrire.
