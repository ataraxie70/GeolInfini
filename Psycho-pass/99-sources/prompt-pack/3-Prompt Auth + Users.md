Implémente le socle Auth + Users du projet Psycho-Pass.

Contraintes :
- NestJS backend.
- REST versionnée /api/v1.
- JWT signés et expirables.
- Refresh token géré proprement.
- Hash des mots de passe.
- Validation serveur stricte.
- RBAC minimal : user / admin.
- Le backend décide de l’accès.

À produire :
1. Les endpoints auth de départ.
2. Le module users.
3. Les DTOs et validations.
4. Les guards et stratégies.
5. Les erreurs standardisées.
6. Les tests unitaires essentiels.
7. Les règles de sécurité à respecter.

Interdictions :
- Pas de logique d’auth critique dans le frontend.
- Pas de pseudo-code : livrer du code structuré et exécutable.
