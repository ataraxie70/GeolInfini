# PRD — Plateforme personnelle et professionnelle

## 1. Résumé produit

La plateforme a pour objectif de devenir un espace numérique centralisé qui dépasse le rôle d’un portfolio classique. Elle doit permettre de présenter une identité personnelle et professionnelle, de démontrer des compétences par des preuves vérifiables, de documenter des projets, de partager des retours d’expérience et de faciliter les interactions avec les visiteurs.

Le produit doit fonctionner comme une vitrine de crédibilité, un espace de contenu, un point de contact et un support évolutif pour de futures collaborations.

---

## 2. Problème à résoudre

Un portfolio classique présente souvent des projets, mais ne reflète pas toujours :

- la cohérence d’un parcours ;
- le raisonnement derrière les réalisations ;
- l’évolution des compétences ;
- les projets en cours ;
- la capacité à interagir avec un public professionnel.

La plateforme répond à ce manque en créant un environnement plus complet, plus crédible et plus vivant.

---

## 3. Vision produit

Créer une présence numérique personnelle et professionnelle qui centralise :

- l’identité ;
- les compétences ;
- les projets ;
- les expériences ;
- les échanges ;
- les opportunités de collaboration.

La plateforme doit évoluer avec son propriétaire et servir de base durable à sa visibilité professionnelle.

---

## 4. Objectifs produit

### Objectif principal
Concevoir une plateforme claire, crédible et évolutive permettant de présenter et de démontrer un profil personnel et professionnel complet.

### Objectifs secondaires
- présenter le profil de manière lisible et structurée ;
- rendre les projets vérifiables via des sources de vérité ;
- publier des contenus utiles et authentiques ;
- permettre aux visiteurs d’interagir facilement ;
- rendre visibles les projets en cours et les besoins de collaboration ;
- préparer une base technique extensible.

---

## 5. Succès attendu

Le produit sera considéré comme réussi si un visiteur peut, en quelques minutes :

- comprendre qui est le propriétaire de la plateforme ;
- identifier ses compétences principales ;
- consulter des projets concrets et vérifiables ;
- lire des contenus démontrant son expérience ;
- contacter le propriétaire ou proposer une collaboration.

---

## 6. Périmètre

### 6.1 Inclus dans la première version
- page d’accueil ;
- page à propos ;
- page compétences ;
- page projets / portfolio ;
- page projets en cours ;
- page expérience / blog ;
- page collaborer ;
- page contact ;
- administration de contenu.

### 6.2 Hors périmètre initial
- forum ;
- messagerie temps réel ;
- système de paiement ;
- espace membre avancé ;
- commentaires complexes ;
- réseau social interne ;
- notifications en temps réel.

---

## 7. Personae

### Persona 1 — Recruteur
Cherche à comprendre rapidement le profil, les compétences, les preuves de travail et le niveau de sérieux du candidat.

### Persona 2 — Client potentiel
Cherche à savoir si le propriétaire est capable de répondre à un besoin concret, avec des exemples et des moyens de contact simples.

### Persona 3 — Collaborateur technique
Cherche à identifier les projets en cours, les domaines de compétence et les possibilités de contribution.

### Persona 4 — Visiteur apprenant
Cherche des retours d’expérience, des conseils, des méthodes et des solutions utiles.

---

## 8. Propositions de valeur

### Pour le propriétaire
- meilleure crédibilité ;
- meilleure visibilité ;
- centralisation du parcours ;
- valorisation des réalisations ;
- ouverture à de nouvelles opportunités.

### Pour les visiteurs
- accès rapide à une présentation claire ;
- consultation de preuves concrètes ;
- possibilité de contacter facilement ;
- accès à du contenu utile et contextualisé.

---

## 9. Architecture fonctionnelle

### 9.1 Accueil
La page d’accueil doit :
- présenter l’identité ;
- afficher une proposition de valeur claire ;
- orienter vers les sections essentielles ;
- mettre en avant les projets ou contenus récents.

### 9.2 À propos
Cette section doit contenir :
- présentation personnelle ;
- parcours ;
- vision ;
- objectifs ;
- valeurs ;
- domaines d’intérêt.

### 9.3 Compétences
Cette section doit permettre de :
- lister les compétences techniques ;
- présenter les outils et technologies ;
- organiser les compétences par catégories ;
- indiquer les domaines en apprentissage.

### 9.4 Projets / Portfolio
Chaque projet doit inclure :
- titre ;
- description ;
- objectif ;
- contexte ;
- technologies utilisées ;
- rôle joué ;
- statut ;
- média de présentation ;
- lien vers la source de vérité ;
- lien vers une démo si disponible.

### 9.5 Projets en cours
Cette section doit mettre en avant :
- les projets actifs ;
- le niveau d’avancement ;
- les besoins éventuels ;
- les opportunités de participation.

### 9.6 Expérience / Blog
Cette section doit permettre de publier :
- articles ;
- retours d’expérience ;
- solutions trouvées ;
- analyses ;
- conseils ;
- notes techniques.

### 9.7 Collaborer
Cette section doit permettre au visiteur de :
- proposer une collaboration ;
- demander un conseil ;
- soumettre une idée ;
- faire une requête ;
- signaler un intérêt pour un projet.

### 9.8 Contact
Cette section doit fournir :
- formulaire de contact ;
- adresse électronique ;
- liens professionnels ;
- autres moyens de contact utiles.

### 9.9 Administration
L’administration doit permettre :
- la création, modification et suppression de projets ;
- la publication d’articles ;
- la gestion des compétences ;
- la gestion des messages ;
- la gestion des demandes de collaboration ;
- l’organisation des contenus.

---

## 10. Exigences fonctionnelles

| ID | Fonctionnalité | Description | Priorité |
|---|---|---|---|
| F-01 | Présentation du profil | Afficher une identité claire et professionnelle | Haute |
| F-02 | Gestion des compétences | Organiser et afficher les compétences | Haute |
| F-03 | Gestion des projets | Créer et afficher des projets détaillés | Haute |
| F-04 | Liens de vérification | Associer un projet à GitHub ou une démo | Haute |
| F-05 | Projets en cours | Mettre en avant les projets actifs | Moyenne |
| F-06 | Blog / expérience | Publier des contenus de partage | Moyenne |
| F-07 | Formulaire de contact | Recevoir des messages et demandes | Haute |
| F-08 | Collaboration | Recevoir suggestions et propositions | Haute |
| F-09 | Administration | Gérer les contenus depuis un espace interne | Haute |
| F-10 | Catégorisation | Organiser contenus, projets et articles par tags | Moyenne |

---

## 11. User stories

### 11.1 Visiteur
- En tant que visiteur, je veux comprendre rapidement qui est le propriétaire du site afin de savoir si son profil m’intéresse.
- En tant que visiteur, je veux consulter les compétences principales afin d’évaluer son niveau.
- En tant que visiteur, je veux voir des projets détaillés afin de vérifier la réalité de son travail.
- En tant que visiteur, je veux accéder à des sources de vérité afin de confirmer les réalisations.
- En tant que visiteur, je veux lire des retours d’expérience afin d’apprendre ou de m’inspirer.
- En tant que visiteur, je veux pouvoir envoyer un message afin de poser une question ou proposer un échange.
- En tant que visiteur, je veux proposer une collaboration afin de participer à un projet.

### 11.2 Collaborateur potentiel
- En tant que collaborateur potentiel, je veux voir les projets en cours afin d’identifier où je peux contribuer.
- En tant que collaborateur potentiel, je veux connaître les besoins actuels afin de savoir comment apporter de la valeur.
- En tant que collaborateur potentiel, je veux pouvoir contacter facilement le propriétaire afin de discuter d’une idée ou d’un partenariat.

### 11.3 Administrateur / propriétaire
- En tant qu’administrateur, je veux créer un projet afin de le rendre visible publiquement.
- En tant qu’administrateur, je veux modifier un article afin de maintenir le contenu à jour.
- En tant qu’administrateur, je veux organiser mes compétences par catégories afin de structurer mon profil.
- En tant qu’administrateur, je veux gérer les messages reçus afin de traiter les demandes efficacement.
- En tant qu’administrateur, je veux publier les projets en cours afin de solliciter des retours ou de la participation.

---

## 12. Priorisation des user stories

### P0 — Indispensable
- consulter l’accueil ;
- consulter l’identité et l’histoire ;
- consulter les compétences ;
- consulter les projets ;
- contacter le propriétaire.

### P1 — Important
- lire les articles et retours d’expérience ;
- voir les projets en cours ;
- proposer une collaboration ;
- gérer les contenus via l’administration.

### P2 — Extension
- tags et filtres avancés ;
- sections enrichies ;
- statistiques de consultation ;
- recherche interne ;
- espace communautaire.

---

## 13. Exigences non fonctionnelles

### 13.1 Lisibilité
L’interface doit être claire, hiérarchisée et facile à parcourir.

### 13.2 Performance
Le chargement doit rester rapide, avec une expérience fluide sur des connexions moyennes.

### 13.3 Compatibilité
La plateforme doit être pleinement responsive sur :
- mobile ;
- tablette ;
- ordinateur.

### 13.4 Sécurité
La solution doit inclure :
- validation des formulaires ;
- protection contre le spam ;
- sécurisation de l’administration ;
- bonnes pratiques côté serveur ;
- limitation des accès non autorisés.

### 13.5 Maintenabilité
Le code, les contenus et l’architecture doivent être simples à mettre à jour.

### 13.6 Évolutivité
La structure doit permettre d’ajouter des fonctionnalités sans refonte complète.

---

## 14. Données principales

La plateforme devra gérer au minimum :

- profil ;
- compétences ;
- projets ;
- articles ;
- messages de contact ;
- demandes de collaboration ;
- catégories ;
- tags ;
- médias ;
- statuts de projets.

---

## 15. Critères d’acceptation

La version initiale sera considérée comme satisfaisante si :

- le profil est clair dès la page d’accueil ;
- les compétences sont lisibles et bien structurées ;
- les projets sont documentés et vérifiables ;
- les projets en cours sont visibles ;
- un visiteur peut facilement contacter le propriétaire ;
- l’administration permet de mettre à jour les contenus ;
- l’ensemble paraît cohérent, professionnel et évolutif.

---

## 16. Roadmap

### Phase 0 — Cadrage
**Objectif :** figer la vision, le périmètre et l’architecture.

Livrables :
- vision produit ;
- PRD validé ;
- arborescence du site ;
- structure des données ;
- maquettes textuelles.

### Phase 1 — Socle public
**Objectif :** livrer la base visible du site.

Livrables :
- accueil ;
- à propos ;
- compétences ;
- projets ;
- contact.

### Phase 2 — Contenu de preuve
**Objectif :** renforcer la crédibilité et la richesse du site.

Livrables :
- détails projet ;
- liens de preuve ;
- projets en cours ;
- blog / expérience.

### Phase 3 — Interaction
**Objectif :** permettre les échanges.

Livrables :
- formulaire de collaboration ;
- formulaires de contact améliorés ;
- gestion des messages ;
- catégorisation avancée.

### Phase 4 — Administration et amélioration continue
**Objectif :** faciliter la maintenance et préparer l’évolution.

Livrables :
- espace admin complet ;
- gestion du contenu ;
- amélioration UX/UI ;
- préparation des extensions futures.

---

## 17. Risques et mitigations

### Risque 1 — Surcharge fonctionnelle
**Mitigation :** livrer par phases et limiter la première version au socle essentiel.

### Risque 2 — Contenu insuffisamment probant
**Mitigation :** exiger pour chaque projet une description, un contexte et une source de vérification.

### Risque 3 — Site difficile à maintenir
**Mitigation :** adopter une architecture simple, modulaire et documentée.

### Risque 4 — Expérience utilisateur confuse
**Mitigation :** maintenir une navigation courte, claire et cohérente.

### Risque 5 — Faible mise à jour du contenu
**Mitigation :** prévoir une administration simple et un rythme de publication réaliste.

---

## 18. Hypothèses

- le propriétaire souhaite faire évoluer la plateforme dans le temps ;
- les projets peuvent être reliés à des sources externes de vérification ;
- le site doit être conçu pour être maintenu facilement ;
- la première version doit rester simple et solide.

---

## 19. Hors périmètre à ce stade

Ne sont pas inclus dans la première version :

- compte utilisateur public ;
- commentaires sur les articles ;
- système de messagerie interne ;
- espace communautaire ;
- paiement en ligne ;
- fonctionnalités sociales avancées.

---

## 20. Formulation finale du produit

La plateforme est un espace personnel et professionnel conçu pour présenter une identité, démontrer des compétences, documenter des projets, partager des expériences et faciliter les interactions, avec une logique de visibilité, de crédibilité et d’évolution continue.

