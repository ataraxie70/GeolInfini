# MUST-002 — Sécurité et qualité
## Projet : Psycho-Pass
### Statut : Obligatoire
### Version : 1.0
### Date : 2026-05-15

---

# 1. OBJECTIF DU DOCUMENT

Ce document définit les exigences obligatoires en matière de sécurité, de qualité logicielle, de robustesse et de fiabilité pour le projet Psycho-Pass.

Il précise :
- les règles de protection des données ;
- les exigences d’authentification et d’autorisation ;
- les standards de validation ;
- les exigences de tests ;
- les règles de journalisation ;
- les critères minimaux de mise en production.

Ce document est contraignant et s’applique à tout le code produit pour le projet.

---

# 2. PRINCIPES GÉNÉRAUX

## 2.1 Sécurité par défaut
Toute fonctionnalité doit être pensée avec la sécurité comme exigence de base, et non comme ajout secondaire.

## 2.2 Qualité par conception
Les contrôles de qualité doivent être intégrés dès le développement, pas seulement au moment de la livraison.

## 2.3 Défense en profondeur
La sécurité doit être assurée à plusieurs niveaux :
- frontend ;
- backend ;
- base de données ;
- infrastructure ;
- processus de développement.

## 2.4 Fiabilité
Le système doit rester stable, prévisible et contrôlable, même en cas d’erreur ou d’usage anormal.

---

# 3. SÉCURITÉ DES IDENTITÉS ET DES ACCÈS

## 3.1 Authentification
- Les mots de passe doivent être hashés avec un algorithme robuste.
- Aucun mot de passe ne doit être stocké en clair.
- Les jetons d’authentification doivent être signés et expirables.
- Les sessions doivent pouvoir être révoquées.

## 3.2 Autorisation
- Les droits doivent être contrôlés côté backend.
- Les rôles doivent être explicitement définis.
- Les endpoints sensibles doivent être protégés par des gardes ou équivalents.
- Le frontend ne doit jamais servir de garantie de sécurité.

## 3.3 Rôles
Les rôles minimaux attendus sont :
- `USER`
- `ADMIN`
- `SUPER_ADMIN`

## 3.4 Règles obligatoires
- Toute route sensible doit vérifier l’identité.
- Toute action administrative doit vérifier le rôle.
- Toute tentative interdite doit être rejetée côté serveur.

---

# 4. PROTECTION DES DONNÉES

## 4.1 Données sensibles
Les données sensibles incluent notamment :
- mots de passe ;
- jetons ;
- emails ;
- résultats ;
- réponses aux tests ;
- données de profil ;
- journaux d’administration.

## 4.2 Règles de stockage
- Les secrets ne doivent jamais être stockés dans le code source.
- Les variables sensibles doivent être gérées via un système d’environnement sécurisé.
- Les données critiques doivent être persistées de manière fiable.
- Les données non nécessaires ne doivent pas être collectées.

## 4.3 Règles de transmission
- Tout échange réseau doit passer par HTTPS en environnement de production.
- Les informations critiques ne doivent pas être exposées dans les paramètres URL.
- Les réponses API doivent limiter les données renvoyées au strict nécessaire.

---

# 5. VALIDATION DES ENTRÉES

## 5.1 Principe
Toutes les entrées utilisateur doivent être validées côté backend avant traitement.

## 5.2 Règles obligatoires
- Valider les types.
- Vérifier les longueurs.
- Contrôler les formats.
- Rejeter les valeurs inattendues.
- Nettoyer les données si nécessaire.

## 5.3 Données concernées
- formulaires ;
- authentification ;
- réponses aux tests ;
- paramètres d’URL ;
- filtres ;
- requêtes d’administration.

---

# 6. GESTION DES ERREURS

## 6.1 Principes
- Les erreurs doivent être capturées proprement.
- Les messages envoyés au client doivent être compréhensibles.
- Les détails techniques sensibles ne doivent pas être exposés au public.
- Les erreurs internes doivent être journalisées.

## 6.2 Réponses d’erreur
Les réponses d’erreur doivent inclure :
- un code HTTP adapté ;
- un message clair ;
- un format uniforme.

## 6.3 Interdictions
- Pas d’erreur brute exposée au frontend.
- Pas de stack trace visible pour l’utilisateur final.
- Pas de message technique inutile dans l’interface.

---

# 7. JOURNALISATION ET TRAÇABILITÉ

## 7.1 Objectif
La journalisation doit permettre de comprendre :
- ce qui s’est passé ;
- quand cela s’est produit ;
- sur quelle ressource ;
- avec quel niveau de gravité.

## 7.2 Événements à journaliser
- connexions et déconnexions ;
- erreurs critiques ;
- actions administratives ;
- modifications de contenus ;
- incidents de sécurité ;
- échecs de validation ;
- anomalies métier.

## 7.3 Règles
- Les logs doivent être structurés.
- Les logs ne doivent pas contenir de secrets.
- Les logs doivent être exploitables pour le débogage et l’audit.

---

# 8. QUALITÉ DU CODE

## 8.1 Standards obligatoires
- TypeScript strict autant que possible.
- Lint obligatoire.
- Formatage automatique obligatoire.
- Code lisible et découpé.
- Suppression du code mort.
- Réduction des duplications.

## 8.2 Lisibilité
- Les fonctions longues doivent être refactorées.
- Les variables doivent avoir un nom explicite.
- Les composants doivent rester concentrés sur une seule responsabilité.

## 8.3 Maintenabilité
- Les dépendances doivent être minimisées.
- Les responsabilités doivent être isolées.
- Les modules doivent rester indépendants autant que possible.

---

# 9. TESTS OBLIGATOIRES

## 9.1 Types de tests
Le projet doit prévoir, selon la zone concernée :
- tests unitaires ;
- tests d’intégration ;
- tests end-to-end ;
- tests de non-régression sur les fonctionnalités critiques.

## 9.2 Zones prioritaires
Les tests sont obligatoires en priorité sur :
- authentification ;
- scoring ;
- moteur adaptatif ;
- création de session ;
- clôture de test ;
- gestion des permissions ;
- enregistrement des résultats.

## 9.3 Critère minimal
Toute nouvelle logique critique doit être accompagnée de tests adaptés.

---

# 10. STANDARDS DE MISE EN PRODUCTION

## 10.1 Pré-conditions obligatoires
Avant toute mise en production :
- lint réussi ;
- build réussi ;
- tests critiques réussis ;
- variables d’environnement configurées ;
- secrets vérifiés ;
- migration de base de données validée ;
- supervision minimale disponible.

## 10.2 Interdictions
- Aucun déploiement sans validation des tests critiques.
- Aucun secret dans le dépôt.
- Aucune dépendance non vérifiée ajoutée en urgence sans contrôle.

---

# 11. SÉCURITÉ FRONTEND

## 11.1 Règles
Le frontend doit :
- masquer les données sensibles non nécessaires ;
- empêcher les comportements UI trompeurs ;
- afficher clairement les états d’erreur ;
- éviter la persistance locale de données sensibles si ce n’est pas indispensable.

## 11.2 Interdictions
- Pas de secret dans le code client.
- Pas de logique de sécurité critique côté client.
- Pas de calcul de score final dépendant du frontend.

---

# 12. SÉCURITÉ BACKEND

## 12.1 Règles
Le backend doit :
- valider toutes les requêtes ;
- contrôler tous les accès ;
- limiter les opérations sensibles ;
- tracer les actions importantes ;
- protéger les données persistées.

## 12.2 Protection contre les abus
Le backend doit prévoir, si nécessaire :
- limitation de débit ;
- protection contre les abus de formulaire ;
- contrôle des tentatives de connexion ;
- mécanismes anti-fraude sur les tests.

---

# 13. QUALITÉ DES DONNÉES

## 13.1 Intégrité
Les données doivent être cohérentes entre les modules :
- un test doit correspondre à une session claire ;
- une réponse doit correspondre à une question précise ;
- un résultat doit être lié à une session finalisée.

## 13.2 Cohérence
Les calculs doivent être reproductibles et cohérents avec les règles métier validées.

---

# 14. GESTION DES DÉPENDANCES

## 14.1 Règles
- Toute dépendance ajoutée doit être justifiée.
- Toute dépendance critique doit être revue.
- Les dépendances inutiles doivent être évitées.
- Les versions doivent être maîtrisées.

## 14.2 Maintenance
- Les dépendances doivent être mises à jour régulièrement.
- Les vulnérabilités doivent être traitées rapidement.

---

# 15. CONFIDENTIALITÉ ET PRIVACY

## 15.1 Principes
- Collecter uniquement les données utiles.
- Limiter l’accès aux données personnelles.
- Protéger les informations utilisateur.
- Prévoir une suppression ou anonymisation si nécessaire.

## 15.2 Usage des données
Les données de tests et de progression doivent servir à l’évaluation et à l’amélioration du service, et non à des usages non prévus.

---

# 16. CRITÈRES DE QUALITÉ MINIMAUX

Le projet ne peut être considéré comme conforme que si :
- l’authentification est sécurisée ;
- les entrées sont validées ;
- les erreurs sont gérées proprement ;
- les logs sont structurés ;
- les tests critiques existent ;
- les secrets sont protégés ;
- les permissions sont correctement appliquées.

---

# 17. LISTE DES MUST ABSOLUS

- Hashage des mots de passe obligatoire.
- Authentification par jeton obligatoire.
- Validation des entrées obligatoire.
- Logging des événements critiques obligatoire.
- Tests sur les modules sensibles obligatoires.
- Protection des accès admin obligatoire.
- Aucun secret dans le code source.
- Aucune logique métier critique côté frontend.
- Aucune mise en production sans validation minimale.

---

# 18. CONCLUSION

Ce document fixe les exigences minimales de sécurité et de qualité pour Psycho-Pass.

Il doit être appliqué dès la première ligne de code afin de garantir :
- un produit sûr ;
- un produit fiable ;
- un produit testable ;
- un produit maintenable ;
- un produit durable.

Toute exception à ce document doit être explicitement validée et documentée.

