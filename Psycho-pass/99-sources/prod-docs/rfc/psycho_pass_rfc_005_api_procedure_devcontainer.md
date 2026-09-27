# RFC-005 — Spécification API initiale et procédure de génie logiciel
## Projet : Psycho-Pass
### Statut : Draft
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document a deux objectifs :

1. Définir la **spécification API initiale** entre le frontend et le backend de Psycho-Pass.
2. Définir la **procédure de génie logiciel** qui encadre le cycle de vie du projet, la supervision du développement, la qualité, la livraison et l’utilisation de **Dev Containers** pour isoler l’environnement de travail.

Ce document sert de base opérationnelle à l’équipe technique avant le démarrage de l’implémentation.

---

# 2. SPÉCIFICATION API INITIALE

## 2.1 Principe général

L’API doit être :
- versionnée ;
- cohérente ;
- sécurisée ;
- centrée sur les ressources métier ;
- documentée ;
- stable pour le frontend.

Le backend expose une API REST au format JSON.

## 2.2 Convention d’URL

Base commune :
```text
/api/v1/
```

### Règles
- Les ressources sont nommées au pluriel.
- Les actions spécifiques sont exprimées par des sous-routes explicites.
- Les endpoints doivent rester prévisibles.

### Exemples
- `GET /api/v1/tests`
- `POST /api/v1/tests/start`
- `POST /api/v1/tests/:id/answer`
- `POST /api/v1/tests/:id/finish`
- `GET /api/v1/results/:id`

---

## 2.3 Format des requêtes et réponses

### Requête
- JSON par défaut.
- Headers standardisés.
- Authentification via token lorsque nécessaire.

### Réponse de succès
Format recommandé :
```json
{
  "success": true,
  "data": {},
  "meta": {}
}
```

### Réponse d’erreur
Format recommandé :
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "La requête est invalide."
  }
}
```

---

## 2.4 Authentification

### Endpoints
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/auth/refresh`
- `POST /api/v1/auth/logout`
- `POST /api/v1/auth/forgot-password`
- `POST /api/v1/auth/reset-password`

### Règles
- Les mots de passe ne sont jamais renvoyés.
- Les jetons doivent être signés.
- Les sessions doivent être contrôlées côté serveur.

---

## 2.5 Utilisateurs

### Endpoints
- `GET /api/v1/users/me`
- `PATCH /api/v1/users/me`
- `GET /api/v1/users/me/history`

### Règles
- L’utilisateur ne peut consulter que ses propres données.
- Toute modification doit être validée.

---

## 2.6 Questions

### Endpoints
- `GET /api/v1/questions`
- `GET /api/v1/questions/:id`
- `POST /api/v1/questions`
- `PATCH /api/v1/questions/:id`
- `DELETE /api/v1/questions/:id`

### Règles
- Les questions non publiées ne sont pas servies aux utilisateurs standards.
- Les endpoints de modification sont réservés à l’administration.

---

## 2.7 Tests

### Endpoints
- `POST /api/v1/tests/start`
- `GET /api/v1/tests/:id`
- `POST /api/v1/tests/:id/answer`
- `POST /api/v1/tests/:id/finish`
- `GET /api/v1/tests/:id/results`

### Règles
- Une session de test est unique.
- Une session appartient à un seul utilisateur.
- Une réponse est enregistrée une seule fois sauf mécanisme explicite de correction.

---

## 2.8 Résultats

### Endpoints
- `GET /api/v1/results`
- `GET /api/v1/results/:id`
- `GET /api/v1/results/:id/details`

### Données attendues
- score global ;
- score par catégorie ;
- temps total ;
- taux de réussite ;
- niveau estimé ;
- progression.

---

## 2.9 Administration

### Endpoints
- `GET /api/v1/admin/users`
- `GET /api/v1/admin/stats`
- `GET /api/v1/admin/questions`
- `POST /api/v1/admin/questions`
- `PATCH /api/v1/admin/questions/:id`
- `DELETE /api/v1/admin/questions/:id`

### Règles
- Réservé aux rôles autorisés.
- Toute action sensible doit être tracée.

---

## 2.10 Conventions de pagination et filtrage

### Pagination
- `page`
- `limit`

### Filtrage
- `category`
- `difficulty`
- `status`
- `search`

### Tri
- `sortBy`
- `order`

---

## 2.11 Codes d’état HTTP

### Succès
- `200 OK`
- `201 Created`
- `204 No Content`

### Erreurs client
- `400 Bad Request`
- `401 Unauthorized`
- `403 Forbidden`
- `404 Not Found`
- `409 Conflict`
- `422 Unprocessable Entity`

### Erreurs serveur
- `500 Internal Server Error`
- `503 Service Unavailable`

---

# 3. PROCÉDURE DE GÉNIE LOGICIEL

## 3.1 Objectif

La procédure de génie logiciel définit comment le projet est conçu, développé, vérifié, livré et maintenu dans le temps.

Elle doit permettre :
- de garder une qualité constante ;
- de réduire les erreurs d’architecture ;
- de superviser le cycle de vie complet du produit ;
- de maintenir la cohérence entre les RFC, les MUST et l’implémentation ;
- de travailler dans des environnements isolés et reproductibles.

---

## 3.2 Cycle de vie du projet

Le cycle de vie recommandé se compose de 7 phases.

### Phase 1 — Cadrage
- validation du besoin ;
- définition du périmètre ;
- rédaction des RFC ;
- validation des MUST.

### Phase 2 — Préparation technique
- création du dépôt ;
- configuration des Dev Containers ;
- configuration de la stack ;
- initialisation des outils qualité.

### Phase 3 — Conception
- architecture applicative ;
- modèle de données ;
- contrats API ;
- design system ;
- backlog technique.

### Phase 4 — Développement
- implémentation par lots ;
- revue de code ;
- tests progressifs ;
- validation technique continue.

### Phase 5 — Vérification
- tests unitaires ;
- tests d’intégration ;
- tests E2E ;
- audit sécurité ;
- validation métier.

### Phase 6 — Livraison
- build final ;
- déploiement ;
- migration si nécessaire ;
- monitoring post-livraison.

### Phase 7 — Maintenance
- correctifs ;
- améliorations ;
- mises à jour ;
- suivi de dette technique.

---

## 3.3 Gouvernance du développement

### Rôles
- **Product Owner / Responsable produit** : valide les besoins et priorités.
- **Architecte technique** : valide les RFC et l’architecture.
- **Développeurs** : implémentent les fonctionnalités.
- **Relecteurs** : contrôlent la qualité du code.
- **Responsable QA** : supervise la validation.
- **Responsable DevOps** : supervise les environnements, CI/CD et déploiement.

### Règles de gouvernance
- Toute décision majeure doit être documentée.
- Toute exception doit être approuvée.
- Tout changement structurant doit passer par une RFC ou un document de décision.

---

## 3.4 Rituels de travail recommandés

### Avant développement
- revue des RFC ;
- revue des MUST ;
- validation du backlog ;
- clarification des critères d’acceptation.

### Pendant développement
- petits lots de livraison ;
- PR courtes ;
- revue systématique ;
- tests continus.

### Après développement
- validation finale ;
- déploiement ;
- monitoring ;
- retour d’expérience.

---

## 3.5 Gestion des changements

Toute modification doit suivre le chemin suivant :
1. proposition ;
2. analyse d’impact ;
3. validation technique ;
4. implémentation ;
5. tests ;
6. documentation ;
7. fusion.

Aucune modification critique ne doit être intégrée sans traçabilité.

---

# 4. APPROCHE DEV CONTAINER

## 4.1 Objectif

L’approche Dev Container consiste à isoler l’environnement de développement dans un conteneur reproductible.

Cela permet de :
- standardiser les outils ;
- éviter les différences entre machines ;
- réduire les conflits de versions ;
- accélérer l’onboarding ;
- garantir la reproductibilité.

---

## 4.2 Principes de l’environnement conteneurisé

### Règles
- Chaque développeur doit travailler dans un environnement défini.
- Les outils utilisés doivent être installés ou accessibles dans le conteneur.
- Les versions critiques doivent être figées.
- L’environnement local doit dépendre le moins possible de l’installation native de la machine.

### Objectif
Tous les éléments nécessaires au développement doivent être disponibles de façon cohérente dans le conteneur.

---

## 4.3 Contenu attendu du Dev Container

Le conteneur doit inclure au minimum :
- Node.js ;
- gestionnaire de paquets ;
- TypeScript ;
- utilitaires de lint ;
- utilitaires de formatage ;
- outils de test ;
- accès à la base de données locale ou distante ;
- variables d’environnement de développement ;
- outils CLI nécessaires.

---

## 4.4 Avantages attendus

- même environnement pour toute l’équipe ;
- moins de bugs liés au poste local ;
- démarrage rapide du projet ;
- isolation des dépendances ;
- meilleure qualité de support technique.

---

## 4.5 Règles d’utilisation

- Le conteneur est l’environnement de travail de référence.
- Les installations globales doivent être évitées si elles ne sont pas nécessaires.
- Les scripts d’initialisation doivent fonctionner dans le conteneur.
- Les tâches de test et de build doivent être exécutables dans le conteneur.

---

# 5. STRUCTURE RECOMMANDÉE DU WORKFLOW DE DÉVELOPPEMENT

## 5.1 Démarrage
- ouvrir le projet dans le Dev Container ;
- vérifier les variables d’environnement ;
- installer les dépendances ;
- lancer les tests de base.

## 5.2 Développement d’une fonctionnalité
- créer une branche dédiée ;
- coder la fonctionnalité ;
- écrire ou mettre à jour les tests ;
- lancer lint et build ;
- ouvrir une PR.

## 5.3 Validation
- revue de code ;
- vérification des critères d’acceptation ;
- validation des tests ;
- fusion.

## 5.4 Livraison
- release candidate ;
- déploiement ;
- monitoring ;
- correction si nécessaire.

---

# 6. QUALITÉ ET CONTRÔLE CONTINU

## 6.1 Contrôles à automatiser
- lint ;
- formatage ;
- tests unitaires ;
- tests d’intégration ;
- build ;
- analyse des vulnérabilités si disponible.

## 6.2 Seuil minimal de qualité
Aucune fonctionnalité critique ne peut être considérée comme terminée si :
- elle n’est pas testée ;
- elle n’est pas documentée si nécessaire ;
- elle ne respecte pas les RFC ;
- elle ne respecte pas les MUST.

---

# 7. DOCUMENTATION OBLIGATOIRE DU CYCLE DE VIE

## Documents à maintenir
- RFC techniques ;
- MUST ;
- README de démarrage ;
- procédure d’installation ;
- guide d’exécution dans Dev Container ;
- documentation API ;
- guide de déploiement ;
- journal des décisions majeures.

---

# 8. CRITÈRES DE CONFORMITÉ

Le projet est conforme à cette procédure si :
- l’environnement de développement est reproductible ;
- les étapes de travail sont claires ;
- les changements sont tracés ;
- les tests sont systématiques ;
- les livraisons sont contrôlées ;
- le cycle de vie est supervisé avec rigueur.

---

# 9. RECOMMANDATION TECHNIQUE IMMÉDIATE

Pour Psycho-Pass, l’approche recommandée est :
- un **Dev Container unique** pour le développement principal ;
- une configuration standardisée des outils ;
- un démarrage automatisé ;
- une cohérence stricte entre l’environnement local et l’environnement de CI.

---

# 10. CONCLUSION

Ce document établit la méthode de travail technique du projet Psycho-Pass et la première version de la spécification API.

Il doit servir de base pour :
- le développement quotidien ;
- la supervision du cycle de vie ;
- la standardisation des environnements ;
- la sécurisation du travail d’équipe ;
- la préparation du projet à long terme.

Toute évolution majeure de l’API ou de la méthode de développement doit être formalisée dans un document de contrôle dédié.

