---
projet: "checkme"
type: "document-de-conception"
phase: "00-intention"
objet: "Vision, constat, principes fondateurs et périmètre du projet"
statut_documentaire: "Baseline canonique — V0.2 canonisée par l'intervention P0-1"
designation_historique: "Document 0 — Vision et Principes Fondateurs"
provenance: "documents_corriges/Document_0_Vision_Principes_Fondateurs.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - intention
  - vision
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

# Document 0 — Vision et Principes Fondateurs

Version : 0.2 (canonisée après audit)
Statut : En revue
Intervention corrigée : P0-1 — Nettoyer et canoniser le Document 0
Date : 2026-08-02

Sources historiques consultées :

- `files/Vision_et_Principes_Fondateurs.md`
- `files/Audit_Complet_CheckMe.md`
- `HISTORIQUE_INTERVENTION.md`

Note de canonisation :

- le contenu de référence a été extrait depuis le titre `Document 0 — Vision et Principes Fondateurs` dans le fichier historique ;
- les fragments de conversation présents avant le titre ont été exclus ;
- la numérotation et la structure Markdown ont été normalisées ;
- aucune correction des problèmes P0-2 et suivants n'est introduite dans ce document.

---

## 1. Vision

Créer une infrastructure numérique nationale permettant à toute institution de publier des informations nominatives de manière structurée, et permettant à chaque citoyen de retrouver rapidement les informations officielles qui le concernent.

L'infrastructure ne produit pas les décisions administratives.

Elle facilite leur consultation, leur diffusion et leur accessibilité.

---

## 2. Constat

Aujourd'hui, les organismes publient principalement leurs résultats sous forme de listes : PDF, images, communiqués ou autres supports peu structurés.

Ces publications présentent plusieurs difficultés :

- listes parfois très volumineuses ;
- diffusion sur plusieurs canaux : sites web, Facebook, WhatsApp, affichages, communiqués ;
- absence d'un point d'accès unique ;
- difficulté pour un citoyen de retrouver rapidement l'information qui le concerne.

Le problème n'est donc pas seulement la publication.

Le problème central est l'accès rapide à l'information concernant une personne.

---

## 3. Mission

Permettre à tout citoyen de consulter rapidement les informations officielles qui le concernent, à partir des identifiants définis par l'organisme émetteur.

---

## 4. Objectifs

L'infrastructure doit :

- réduire le temps de recherche d'une information officielle ;
- améliorer l'accessibilité des publications ;
- permettre à plusieurs organismes d'utiliser une même infrastructure ;
- standardiser la consultation sans imposer une méthode unique de publication aux organismes ;
- rester évolutive afin d'intégrer de nouveaux domaines.

---

## 5. Périmètre

L'infrastructure peut être utilisée pour toute publication officielle contenant des informations nominatives, notamment :

- concours ;
- recrutements ;
- examens ;
- convocations ;
- affectations ;
- admissions ;
- présélections ;
- résultats scolaires ;
- bourses.

---

## 6. Principes fondateurs

### 6.1 Neutralité

L'infrastructure ne décide jamais.

Elle diffuse uniquement les informations fournies par les organismes.

### 6.2 Les organismes restent propriétaires des données

Chaque organisme est responsable :

- de ses publications ;
- de leur exactitude ;
- de leurs mises à jour.

### 6.3 L'infrastructure n'est pas une bibliothèque de PDF

Le document officiel reste une preuve.

Le produit principal est l'information structurée.

### 6.4 Une publication est l'unité principale

L'infrastructure est organisée autour des publications.

Une publication possède :

- un organisme ;
- une catégorie ;
- une session ;
- un modèle ;
- un ensemble d'enregistrements.

### 6.5 La consultation est contextualisée

Un citoyen consulte toujours une publication précise.

La recherche n'est pas globale.

### 6.6 Les identifiants sont définis par l'organisme

L'infrastructure ne crée aucun identifiant national.

Chaque organisme choisit les identifiants qu'il souhaite utiliser.

Exemples :

- numéro de récépissé ;
- numéro candidat ;
- CNIB ;
- matricule.

### 6.7 Les identifiants possèdent un niveau de confiance

Chaque identifiant possède une priorité.

Exemple d'ordre de confiance :

1. Numéro de récépissé
2. CNIB
3. Matricule
4. Nom + prénom

Le moteur de recherche privilégie toujours les identifiants les plus fiables.

### 6.8 Une personne recherche sa situation

Le citoyen ne recherche pas un document.

Il recherche :

- son statut ;
- sa convocation ;
- son affectation ;
- son résultat.

### 6.9 Les données sont indépendantes du mode d'intégration

Une publication peut être alimentée par :

- import de fichier ;
- API ;
- connecteur ;
- synchronisation automatique.

Le mode d'importation ne modifie jamais le fonctionnement de la plateforme.

### 6.10 L'infrastructure est multi-organismes

Chaque organisme dispose :

- de son espace ;
- de ses utilisateurs ;
- de ses publications ;
- de ses paramètres.

Aucun organisme ne dépend d'un autre.

---

## 7. Acteurs

### 7.1 Citoyen

Le citoyen consulte les informations qui le concernent.

### 7.2 Organisme

L'organisme produit les données et publie les informations.

### 7.3 Administrateur d'organisme

L'administrateur d'organisme gère :

- les utilisateurs ;
- les publications ;
- les imports ;
- les mises à jour.

### 7.4 Administrateur national

L'administrateur national gère l'infrastructure elle-même.

Il n'intervient pas sur le contenu métier des organismes.

---

## 8. Résultats attendus

À terme, un citoyen doit pouvoir :

- identifier rapidement une publication ;
- saisir son identifiant ;
- obtenir immédiatement les informations qui le concernent ;
- éviter de parcourir plusieurs centaines ou milliers de lignes.

---

## 9. Valeurs du projet

Le projet repose sur cinq valeurs.

### 9.1 Simplicité

Une consultation doit être réalisable en quelques étapes.

### 9.2 Fiabilité

Les informations proviennent exclusivement des organismes responsables.

### 9.3 Traçabilité

Chaque information doit être rattachée à une publication identifiable.

### 9.4 Évolutivité

Le système doit intégrer facilement de nouveaux organismes et de nouveaux types de publications.

### 9.5 Interopérabilité

L'infrastructure doit pouvoir communiquer avec différents systèmes d'information sans imposer une technologie particulière.

---

## 10. Principes d'architecture

Pendant toute la conception, les décisions doivent respecter les règles suivantes :

- le métier avant la technologie ;
- les concepts avant les écrans ;
- les données avant les interfaces ;
- une architecture modulaire et extensible ;
- aucun développement spécifique pour un organisme lorsque le besoin est générique ;
- une seule plateforme, plusieurs organismes ;
- une seule architecture, plusieurs modes d'intégration ;
- une seule logique de consultation, plusieurs types de publications.

---

## 11. Définition du succès

Le projet sera considéré comme réussi si :

- un organisme peut publier une nouvelle campagne sans développement spécifique ;
- un citoyen retrouve l'information qui le concerne en quelques secondes ;
- plusieurs organismes utilisent la même infrastructure tout en restant indépendants ;
- de nouveaux domaines, tels que examens, concours, recrutements ou admissions, peuvent être ajoutés sans modifier l'architecture fondamentale.

---

## 12. Gouvernance du document

Ce document est le référentiel fondateur du projet checkMe.

Il ne doit être modifié qu'en cas de changement majeur de vision.

Tous les autres documents de conception, d'architecture, d'API, de sécurité, de base de données, d'UX et d'exploitation doivent rester alignés avec lui.

---

## 13. Validation de l'intervention P0-1

Critères de validation :

- le Document 0 est disponible dans `documents_corriges/` sous un nom cohérent avec les autres documents ;
- le contenu conversationnel parasite du fichier historique est exclu ;
- la vision, la mission, le périmètre, les principes fondateurs, les acteurs, les valeurs et la définition du succès sont conservés ;
- le dossier `files/` n'a pas été modifié ;
- la prochaine intervention peut être P0-2.

