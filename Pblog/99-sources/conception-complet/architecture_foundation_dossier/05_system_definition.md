# 05 - System Definition

## 1. System Purpose
L'objectif du système est d'agir comme un moteur de transformation de l'expérience brute en crédibilité professionnelle. Il doit orchestrer la présentation d'une identité, la preuve de compétences et la capture d'opportunités, tout en minimisant l'effort de maintenance pour le propriétaire.

## 2. Inputs (Entrées)
- **Contenus du Propriétaire :** Descriptions de projets, articles de blog, listes de compétences, états d'avancement des projets en cours, informations de profil.
- **Interactions Visiteurs :** Messages via formulaire de contact, propositions de collaboration, requêtes de conseils.
- **Données de Vérification :** Liens vers des dépôts de code, URLs de démos, certifications externes.

## 3. Outputs (Sorties)
- **Interface Publique :** Profil structuré, portfolio documenté, base de connaissances (blog).
- **Notifications :** Alertes de nouveaux messages ou demandes de collaboration envoyées au propriétaire.
- **Preuves de Compétence :** Parcours utilisateur menant du résultat $\rightarrow$ raisonnement $\rightarrow$ preuve externe.

## 4. Actors (Acteurs)
- **Propriétaire (Admin) :** Gère le contenu, traite les messages, met à jour son profil.
- **Visiteurs (Recruteurs, Clients, Collaborateurs, Apprenants) :** Consomment l'information, évaluent la compétence, initient le contact.
- **Systèmes de Preuves (Externe) :** Fournissent la validation technique (ex: GitHub).

## 5. Interfaces
- **Interface Web Publique :** Responsive (Mobile/Tablette/Desktop), centrée sur l'expérience de lecture et de navigation.
- **Interface d'Administration :** Espace sécurisé pour la gestion du cycle de vie des contenus (CRUD).
- **Interfaces Externes :** Liens hypermédia vers des plateformes tierces.

## 6. Events (Événements)
- **Publication :** Un nouveau projet ou article est rendu public.
- **Mise à jour de statut :** Un projet "En cours" passe en "Terminé".
- **Requête de Contact :** Un visiteur soumet un formulaire.
- **Validation de Compétence :** Le propriétaire ajoute une nouvelle preuve à une compétence existante.

## 7. Dependencies (Dépendances)
- **Hébergement Web :** Infrastructure pour rendre le site accessible.
- **Gestion DNS :** Pour la résolution du nom de domaine.
- **Services de Mail :** Pour l'acheminement des messages de contact.
- **Plateformes de Preuves :** Disponibilité des comptes GitHub/LinkedIn/Démos.

## 8. Constraints (Contraintes)
- **Maintenance :** Le système doit être conçu pour être mis à jour rapidement sans intervention technique lourde.
- **Performance :** Temps de chargement optimisé pour ne pas perdre les recruteurs (critère de rapidité).
- **Accessibilité :** Compatibilité totale multi-supports (Responsive).
- **Sécurité :** Isolation stricte entre la partie publique et la partie administration.

## 9. System Boundary (Frontières du Système)
- **In Scope (Dans le périmètre) :** Gestion du contenu, structure de navigation, routage interne, traitement simple des formulaires, affichage des preuves.
- **Out of Scope (Hors périmètre) :** Gestion d'utilisateurs publics, systèmes de paiement, réseaux sociaux internes, messagerie temps réel, hébergement physique du serveur.

## 10. External Systems (Systèmes Externes)
- **GitHub :** Source de vérité pour le code.
- **LinkedIn :** Réseau professionnel et validation de parcours.
- **Services de Mail :** SMTP/API pour la communication.
- **Moteurs de Recherche (SEO) :** Pour la visibilité organique.
