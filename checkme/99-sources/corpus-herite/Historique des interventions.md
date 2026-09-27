---
projet: "checkme"
type: "registre-d-interventions"
phase: "90-pilotage"
objet: "Registre des interventions de correction du porteur — règles de travail, cartographie P0/P1/P2 et journal"
statut_documentaire: "Registre du porteur — corps repris sans aucune modification"
designation_historique: "HISTORIQUE_INTERVENTION.md"
provenance: "HISTORIQUE_INTERVENTION.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - pilotage
  - interventions
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

> [!danger] Ce registre est en retard d'une intervention, et son cadre a été dissous
> **Deux écarts, laissés intacts dans le corps ci-dessous.** (1) Sa cartographie porte P0-4 en « À faire » et son journal s'arrête sur *« prochaine intervention autorisée : P0-4 »* ; le document P0-4 existe pourtant, daté du 2026-08-10. (2) Les dossiers `files/` et `documents_corriges/` auxquels renvoient ses règles de travail **n'existent plus** : ils ont été dissous dans les dossiers de phase le 2026-09-06 (`DEC-C-017`), et la distinction qu'ils portaient est devenue une propriété `statut_documentaire` inscrite dans chaque note.
> Rien n'a été corrigé ici : c'est le registre du porteur. La correspondance complète ancien chemin → nouveau chemin est au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

# Historique des interventions checkMe

Date de creation : 2026-08-02
Statut : document de pilotage des corrections

---

## 1. Regles de travail

### 1.1 Dossier `files/`

Le dossier `files/` est considere comme l'etat historique du projet au moment de l'audit.

A partir de maintenant :

- ne plus modifier les fichiers du dossier `files/` ;
- les consulter uniquement comme source de reference ;
- ne pas les corriger directement ;
- ne pas y ajouter de nouveaux documents ;
- produire toute correction majeure dans le nouveau dossier `documents_corriges/`.

### 1.2 Dossier `documents_corriges/`

Le dossier `documents_corriges/` contiendra les documents refondus ou corriges progressivement.

Chaque nouveau document devra :

- indiquer quel probleme de l'audit il corrige ;
- indiquer quels fichiers de `files/` ont ete consultes ;
- indiquer son statut : brouillon, en revue, valide ;
- remplacer une faiblesse precise, sans melanger plusieurs interventions majeures.

### 1.3 Ordre strict des interventions

Les interventions se font une etape apres l'autre.

Ordre de priorite :

1. Problemes P0, dans l'ordre P0-1, P0-2, P0-3, etc.
2. Problemes P1, dans l'ordre P1-1, P1-2, P1-3, etc.
3. Problemes P2, dans l'ordre P2-1, P2-2, P2-3, etc.

Une intervention n'est pas commencee tant que la precedente n'est pas terminee ou explicitement mise en pause.

---

## 2. Etat initial constate

Audit de reference :

- `files/Audit_Complet_CheckMe.md`

Etat du projet au moment de l'audit :

- conception avancee ;
- pas encore d'application executable ;
- pas de code Go ;
- pas d'application Next.js ;
- pas de migrations SQL executables ;
- pas d'OpenAPI ;
- pas de tests ;
- pas de CI ;
- documents sources et maquettes HTML conserves dans `files/`.

---

## 3. Cartographie des interventions

### P0 - Bloquants avant implementation large

| ID | Intervention | Objectif | Statut | Sortie attendue |
|---|---|---|---|---|
| P0-1 | Nettoyer et canoniser le Document 0 | Extraire la vision propre et creer la reference fondatrice propre | Termine | `documents_corriges/Document_0_Vision_Principes_Fondateurs.md` |
| P0-2 | Corriger la strategie de recherche | Separer identifiants exacts et recherche floue | Termine | `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md` |
| P0-3 | Durcir la projection Consultation | Definir outbox, idempotence, replay, statut d'indexation | Termine | `documents_corriges/Document_P0_3_Fiabilite_Projection_Consultation.md` |
| P0-4 | Rendre les specs executables | OpenAPI, JSON Schemas, migrations initiales, fixtures | A faire | Dossier de contrats executables |
| P0-5 | Completer conformite donnees personnelles | Gouvernance, roles, retention, droits, CIL | A faire | Document conformite et gouvernance donnees |

### P1 - Majeurs apres les P0

| ID | Intervention | Objectif | Statut | Sortie attendue |
|---|---|---|---|---|
| P1-1 | Verrouiller les frontieres Go | Eviter les imports croises entre modules | A faire | Regles d'architecture et tests d'import |
| P1-2 | Revoir cache Redis | Eviter fuite de situations personnelles via cache | A faire | Strategie cache securisee |
| P1-3 | Completer IAM Organismes | Sessions, mots de passe, MFA, invitations, roles | A faire | Specification IAM MVP |
| P1-4 | Durcir webhooks HMAC | Timestamp, nonce, anti-rejeu, rotation secrets | A faire | Specification webhook securisee |
| P1-5 | Revoir rate limiting mobile/NAT | Limiter abus sans bloquer citoyens legitimes | A faire | Strategie anti-abus progressive |
| P1-6 | Completer schema BDD operationnel | Idempotence, statuts, dead-letter, retention | A faire | Migrations et schema MVP |
| P1-7 | Specifier imports massifs | CSV, streaming, erreurs, reprise, rollback logique | A faire | Specification import MVP |
| P1-8 | Completer UX et maquettes | Back-office, erreurs, frugalite reseau | A faire | Maquettes et document UX corrige |

### P2 - Clarifications

| ID | Intervention | Objectif | Statut | Sortie attendue |
|---|---|---|---|---|
| P2-1 | Clarifier `mise_a_jour` | Separer etat metier et etat technique | A faire | Decision ADR |
| P2-2 | Normaliser noms d'evenements | Choisir ASCII stable pour contrats | A faire | Convention evenements |
| P2-3 | Revoir enumeration publication API | Limiter fuite d'existence de publications | A faire | Decision API publique |
| P2-4 | Extraire les ADRs | Isoler les decisions majeures | A faire | Dossier ADR |
| P2-5 | Reclasser `files/SKILL.md` | Ne pas confondre outillage et produit | A faire | Decision de rangement |

---

## 4. Journal des interventions

### 2026-08-02 - Mise en place du cadre

Action :

- creation de `HISTORIQUE_INTERVENTION.md` ;
- creation du dossier de sortie `documents_corriges/` ;
- gel du dossier `files/` en lecture seule pour les travaux futurs.

Statut :

- termine.

Prochaine intervention autorisee :

- P0-1 — Nettoyer et canoniser le Document 0.

### 2026-08-02 - P0-1 — Nettoyer et canoniser le Document 0

Objectif :

- extraire le contenu canonique du Document 0 depuis la source historique ;
- exclure le texte de conversation present avant le vrai titre ;
- produire une version propre dans `documents_corriges/`.

Sources consultees :

- `files/Vision_et_Principes_Fondateurs.md`
- `files/Audit_Complet_CheckMe.md`
- `HISTORIQUE_INTERVENTION.md`

Fichier cree :

- `documents_corriges/Document_0_Vision_Principes_Fondateurs.md`

Decision :

- le Document 0 canonique devient la reference fondatrice corrigee ;
- le dossier `files/` reste inchange et conserve son role de source historique ;
- aucune correction P0-2 ou superieure n'a ete traitee dans cette intervention.

Statut :

- termine.

Prochaine intervention autorisee :

- P0-2 — Corriger la strategie de recherche.

### 2026-08-02 - P0-2 — Corriger la strategie de recherche

Objectif :

- separer les identifiants exacts et les identifiants faibles ;
- interdire le matching flou sur les identifiants forts ;
- definir une strategie de resolution sans faux positif sur donnees nominatives ;
- lister les tests d'acceptation anti-fuite.

Sources consultees :

- `documents_corriges/Document_0_Vision_Principes_Fondateurs.md`
- `files/Document_1_DDD_Strategique.md`
- `files/Document_3_DDD_Tactique.md`
- `files/Document_4_Architecture_Logicielle.md`
- `files/Document_5_API_Contrats.md`
- `files/Document_6_Securite.md`
- `files/Document_7_Base_De_Donnees.md`
- `files/Document_8_UX_UI.md`
- `files/checkme_backoffice.html`
- `files/Audit_Complet_CheckMe.md`

Fichier cree :

- `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md`

Decisions :

- la recherche exacte devient le comportement par defaut et le point de depart du MVP ;
- les identifiants exacts (`CNIB`, recepisse, matricule, numero candidat, dossier) ne passent jamais par un moteur flou ;
- les identifiants faibles peuvent utiliser une strategie `floue_controlee`, mais seulement si le modele l'autorise explicitement ;
- un resultat incertain doit retourner `ambigu` ou `aucun`, jamais une situation probable ;
- le contrat externe de recherche reste compatible avec le Document 5.

Statut :

- termine.

Prochaine intervention autorisee :

- P0-3 — Durcir la projection Consultation.

### 2026-08-02 - P0-3 — Durcir la projection Consultation

Objectif :

- definir la semantique de livraison de l'outbox ;
- rendre les projecteurs Consultation idempotents ;
- definir les statuts d'indexation par publication ;
- specifier retry, dead-letter, replay et rebuild ;
- eviter qu'une projection partielle soit consultable.

Sources consultees :

- `documents_corriges/Document_0_Vision_Principes_Fondateurs.md`
- `documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md`
- `files/Document_2_Vision_Architecture.md`
- `files/Document_3_DDD_Tactique.md`
- `files/Document_4_Architecture_Logicielle.md`
- `files/Document_5_API_Contrats.md`
- `files/Document_7_Base_De_Donnees.md`
- `files/Audit_Complet_CheckMe.md`

Fichier cree :

- `documents_corriges/Document_P0_3_Fiabilite_Projection_Consultation.md`

Decisions :

- la livraison outbox est at-least-once, pas exactly-once ;
- chaque projecteur doit etre idempotent ;
- une publication n'est consultable que si sa projection est `indexee` ;
- les statuts minimaux sont `non_indexee`, `indexation_en_cours`, `indexee`, `indexation_en_erreur`, `desindexation_en_cours` ;
- les retraits ou archives doivent poser une garde Consultation avant d'etre consideres termines cote back-office ;
- les echecs repetes vont en dead-letter et rendent la projection non fiable ;
- un rebuild complet par generation doit permettre de reconstruire l'index Consultation.

Statut :

- termine.

Prochaine intervention autorisee :

- P0-4 — Rendre les specs executables.
