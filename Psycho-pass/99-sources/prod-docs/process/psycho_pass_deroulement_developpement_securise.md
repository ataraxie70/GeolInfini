# Déroulement de développement sécurisé
## Projet : Psycho-Pass
### Statut : Référence opérationnelle
### Version : 1.0
### Date : 2026-05-15

---

# 1. Objectif

Ce document fixe le schéma de déroulement du développement de Psycho-Pass.

Il sert à avancer étape par étape, avec validation avant passage au point suivant, afin de garantir :
- la cohérence fonctionnelle ;
- la conformité aux RFC ;
- la conformité aux MUST ;
- la sécurité des données ;
- la qualité de l'implémentation ;
- la présentation finale du MVP.

---

# 2. Documents de référence

L'ordre de priorité documentaire est le suivant :
1. `prod-docs/must/`
2. `prod-docs/rfc/`
3. `prod-docs/backlog/`
4. `prod-docs/cdc/`
5. `prompt-pack/`

En cas de conflit, les MUST et RFC priment.

Décisions techniques gelées pour le MVP :
- frontend : Next.js, React, TypeScript, Tailwind CSS ;
- backend : NestJS, TypeScript ;
- base de données : PostgreSQL ;
- ORM : Prisma ;
- API : REST JSON versionnée sous `/api/v1` ;
- sécurité : le frontend affiche, le backend décide.

---

# 3. Règle de validation

Aucune étape ne doit être considérée comme terminée sans :
- vérification logique ;
- vérification sémantique ;
- vérification de conformité aux documents techniques ;
- vérification sécurité minimale ;
- commandes de contrôle adaptées au niveau d'avancement ;
- validation explicite avant passage à l'étape suivante.

---

# 4. Étapes de développement

## Étape 0 — Assainissement projet

Objectif :
- rendre le dépôt local exploitable ;
- identifier les documents source de vérité ;
- corriger les incohérences bloquantes avant code applicatif.

Critères de validation :
- Git local fonctionnel ;
- branche principale `main` ;
- identité Git locale configurée ;
- pas de remote imposé ;
- stack officielle alignée dans les documents ;
- API versionnée de façon cohérente ;
- déroulement de développement documenté.

## Étape 1 — Socle technique

Objectif :
- créer la structure projet ;
- préparer le Dev Container ;
- configurer TypeScript, lint, formatage et scripts de base.

Critères de validation :
- installation reproductible ;
- scripts `lint`, `format`, `test` et `build` définis ;
- `.env.example` présent ;
- aucune logique métier introduite.

## Étape 2 — Base de données

Objectif :
- créer le modèle Prisma initial ;
- définir migrations et seed.

Critères de validation :
- schéma PostgreSQL cohérent ;
- tables au pluriel ;
- colonnes SQL en `snake_case` ;
- relations User, Category, Question, TestSession, Answer, Result et AuditLog présentes ;
- migration et seed reproductibles.

## Étape 3 — Authentification et utilisateurs

Objectif :
- sécuriser comptes, sessions et rôles.

Critères de validation :
- mots de passe hashés ;
- JWT et refresh tokens expirables ;
- rôles `USER`, `ADMIN`, `SUPER_ADMIN` ;
- routes sensibles protégées côté backend ;
- tests auth et permissions présents.

## Étape 4 — Questions et administration minimale

Objectif :
- gérer catégories et questions via API protégée.

Critères de validation :
- CRUD questions et catégories ;
- validation serveur ;
- publication contrôlée ;
- actions admin auditées ;
- utilisateurs standards incapables de modifier le contenu.

## Étape 5 — Moteur de test

Objectif :
- permettre le passage d'un test complet.

Critères de validation :
- session unique par test ;
- session liée à un utilisateur ;
- questions servies uniquement si publiées ;
- réponses enregistrées avec temps de réponse ;
- session finalisable proprement.

## Étape 6 — Scoring et résultats

Objectif :
- calculer et restituer des résultats fiables.

Critères de validation :
- scoring calculé uniquement côté backend ;
- score final normalisé sur 100 ;
- score par catégorie ;
- temps total et temps moyen ;
- historique persisté ;
- tests unitaires scoring et intégration résultats.

## Étape 7 — Frontend MVP

Objectif :
- fournir une interface présentable et utilisable.

Critères de validation :
- parcours inscription, connexion, test, résultat et historique ;
- états loading, erreur et vide ;
- responsive mobile et desktop ;
- aucune logique critique de scoring ou permission côté client.

## Étape 8 — Qualité finale et livraison

Objectif :
- stabiliser le MVP avant présentation.

Critères de validation :
- lint réussi ;
- build réussi ;
- tests critiques réussis ;
- tests E2E sur parcours principal ;
- documentation de démarrage à jour ;
- aucune donnée sensible dans le dépôt.

---

# 5. Checkpoint obligatoire

À la fin de chaque étape, produire un point de validation contenant :
- ce qui a été fait ;
- les fichiers modifiés ;
- les commandes exécutées ;
- les résultats de vérification ;
- les risques restants ;
- la décision demandée : continuer, corriger ou suspendre.

---

# 6. Règle d'arrêt

Le développement doit être suspendu si :
- une règle MUST est violée ;
- une décision RFC devient contradictoire ;
- un test critique échoue sans explication ;
- une faille sécurité évidente est introduite ;
- une donnée sensible risque d'être exposée.

Le travail reprend après correction ou validation explicite de l'exception.
