Construis le modèle de données initial du projet Psycho-Pass.

Contraintes :
- Prisma + PostgreSQL.
- Nommage SQL en snake_case.
- Tables au pluriel.
- Les données doivent permettre le MVP :
  authentification, tests, questions, choix, réponses, sessions, scores, historiques, catégories, rôles.
- Prévoir l’administration minimale.
- Prévoir l’audit de base sur les actions sensibles.

Livrable attendu :
1. Le schéma de données complet de départ.
2. Les relations entre entités.
3. Les index utiles.
4. Les champs obligatoires et optionnels.
5. Les champs sensibles et leur protection.
6. Les choix qui doivent rester côté backend.
7. Le contenu initial de seed.

Interdictions :
- Ne pas inventer de fonctionnalités hors MVP.
- Ne pas simplifier au point de casser l’historique ou le calcul de score.
