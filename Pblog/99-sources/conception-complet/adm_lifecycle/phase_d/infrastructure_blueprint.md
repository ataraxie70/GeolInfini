# Infrastructure Blueprint — Déploiement et Gouvernance

Ce document définit comment la stack technique est déployée, sécurisée et maintenue dans le temps.

## 1. Pipeline de Livraison Continue (CI/CD)

L'infrastructure est conçue pour être totalement automatisée. Le code est la seule source de vérité.

### Workflow de Déploiement :
1. **Commit :** Le propriétaire pousse un changement dans le dépôt GitHub.
2. **Linter & Validation :** GitHub Actions vérifie la syntaxe Markdown et le schéma Zod.
3. **Proof Check :** Un script Node.js parcourt tous les liens de preuves et vérifie les codes HTTP 200.
4. **Build :** Astro génère les fichiers HTML statiques optimisés.
5. **Deploy :** Vercel/Netlify déploie la version sur le réseau Edge.
6. **Smoke Test :** Vérification automatique de la page d'accueil.

## 2. Stratégie de Sécurité

Bien que le site soit statique, la sécurité reste une priorité :
- **Protection du Nom de Domaine :** DNS sécurisés avec DNSSEC.
- **Sécurité HTTPS :** Certificats SSL/TLS gérés automatiquement par l'hébergeur.
- **Isolation Admin :** Puisque le CMS est Git-based, la sécurité repose sur l'authentification forte (2FA) de GitHub.
- **Protection Anti-Spam :** Utilisation d'un service tiers pour le formulaire de contact (ex: Formspree, Getform) pour éviter l'exposition d'un serveur SMTP et les injections.

## 3. Plan de Maintenance et Évolution

Pour éviter l'obsolescence identifiée en Phase 0, nous mettons en place un cycle de vie :

### Maintenance Préventive (Mensuelle)
- Revue des "Projets en cours" pour mettre à jour les statuts.
- Nettoyage des tags obsolètes.
- Analyse des logs d'accès pour identifier les contenus les plus consultés.

### Évolutions Futures (Post-MVP)
- **Étape 1 :** Intégration d'une API de statistiques anonymisées (ex: Plausible) pour mesurer le taux de conversion.
- **Étape 2 :** Implémentation d'un système de recherche interne (Fuse.js) pour naviguer dans le graphe.
- **Étape 3 :** Ajout d'un mode sombre/clair dynamique basé sur les préférences utilisateur.

## 4. Matrice de Décision Finale

| Objectif | Choix Technique | Impact |
| :--- | :--- | :--- |
| **Vitesse** | Astro $\rightarrow$ Edge | $\text{Maximum}$ |
| **Maintenance** | Markdown $\rightarrow$ Git | $\text{Minimum}$ |
| **Crédibilité** | GitHub Actions Link Check | $\text{Garantie}$ |
| **Évolutivité** | Composants Modulaires | $\text{Haute}$ |
