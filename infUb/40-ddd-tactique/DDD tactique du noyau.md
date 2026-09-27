---
projet: "infUb"
type: "ddd-tactique"
phase: "40-ddd-tactique"
version: "0.1"
date_du_document: 2026-09-02
statut: "Modèle tactique — première version implémentable"
portee: "Les trois contextes du noyau : Habilitation, Publication, Preuve. Diffusion, Recherche, Suivi et Intégration ne sont décrits que par leurs contrats entrants."
document_amont: "[[Étude comparative et solution cible]] (points 7.3, 7.4 et 7.7)"
decisions_associees: "[[Recueil d'ADR du noyau]] — ADR-001 à ADR-014"
ce_document_n_est_pas: "Une spécification d'API, ni un schéma de base de données définitif"
tags:
  - infUb
  - ddd-tactique
  - agregats
  - invariants
---

> [!info] Note de provenance — ajoutée par la mise en coffre, ne fait pas partie du document
> Fichier reçu **déjà en Markdown** : aucune conversion. Déplacé depuis la racine du dossier `infUb/` et renommé ; le corps ci-dessous est **identique octet pour octet** à l'original (54 599 octets), seul l'en-tête de propriétés ci-dessus a été ajouté. Empreinte et provenance : [[infUb/99-sources/Sources originales|Sources originales]]. Décision `DEC-C-008` au [[infUb/90-pilotage/Journal des décisions|Journal des décisions]].

---

# DDD TACTIQUE — CONTEXTES HABILITATION, PUBLICATION ET PREUVE

| Élément | Valeur |
|---|---|
| **Statut** | Modèle tactique — première version implémentable |
| **Version** | 0.1 |
| **Date** | 2 septembre 2026 |
| **Portée** | Les trois contextes du noyau : Habilitation, Publication, Preuve. Les contextes Diffusion, Recherche, Suivi et Intégration ne sont décrits ici que par leurs contrats entrants. |
| **Documents amont** | Document fondateur V0.1 · Document de référence global V1.0 · Étude comparative et solution cible V1.0 (points 7.3, 7.4 et 7.7) |
| **Décisions associées** | ADR-001 à ADR-014 (recueil séparé) |
| **Ce document n'est pas** | Une spécification d'API, ni un schéma de base de données définitif. Le modèle relationnel donné au point 8 est une esquisse de vérification, pas une migration. |

> **Règle de traçabilité.** Chaque invariant porte un identifiant (`INV-xx`) et référence le principe fondateur ou la règle métier dont il découle. Un invariant sans origine documentée est un invariant inventé : il doit être supprimé ou justifié.

---

## Sommaire

1. Langage ubiquitaire
2. Carte des contextes
3. Contexte HABILITATION
4. Contexte PUBLICATION
5. Contexte PREUVE
6. Les deux machines à états
7. Flux de référence
8. Modèle relationnel d'esquisse
9. Découpage modulaire
10. Ce que ce modèle ne traite pas encore

---

# 1. Langage ubiquitaire

Le vocabulaire ci-dessous est contraignant : il est celui du code, des tables, des événements, des API et des écrans. Un terme absent de cette table n'entre pas dans le code sans être ajouté ici.

| Terme | Définition retenue | À ne pas confondre avec |
|---|---|---|
| **Organisation** | Entité morale enregistrée au registre : administration, établissement, collectivité, entreprise, association. Peut être rattachée à une organisation parente. | Le compte utilisateur d'un agent |
| **Publicateur** | Personne physique désignée par une organisation pour agir en son nom. Identifiée par un compte, jamais par un rôle générique partagé. | L'organisation elle-même |
| **Habilitation** | Délégation d'autorité, datée et révocable, autorisant un publicateur à produire un type d'acte donné, sur un périmètre donné, au nom d'une organisation. | Le rôle applicatif (permission technique) |
| **Acte de désignation** | Pièce justificative produite par l'organisation qui fonde une habilitation (décision, note de service, arrêté). | La convention d'usage de la plateforme |
| **Niveau de vérification** | Ce que le registre a constaté au sujet de l'*organisation* : N0 référencée, N1 vérifiée. | Le niveau d'habilitation |
| **Niveau d'habilitation** | Ce que le registre autorise pour une *habilitation* donnée : N1 informative, N2 habilitée, N3 scellée. | Le niveau de vérification |
| **Canal officiel déclaré** | Adresse, numéro, en-tête SMS, domaine ou compte tiers qu'une organisation déclare comme sien. | Un canal de diffusion de la plateforme |
| **Publication** | Objet institutionnel de référence, d'identité stable, portant une suite de versions. | Une version, un article, un post |
| **Version** | État figé et daté du contenu d'une publication. Une version publiée est immuable. | Un brouillon |
| **Brouillon** | Version en cours d'élaboration, non encore figée. Modifiable, jamais visible du public. | Une version |
| **Type d'acte** | Nature institutionnelle de la publication : communiqué, avis, appel, calendrier, résultat, décision, alerte. | Le format de contenu (texte, PDF) |
| **Fenêtre de validité** | Le quadruplet de dates `publiée / effet / échéance / fin de validité`. | La date de publication seule |
| **État de validité** | Ce que le citoyen voit : à venir, en vigueur, échéance proche, expirée, remplacée, retirée. **Calculé, jamais stocké.** | Le statut de production |
| **Statut de production** | Où en est la publication dans le circuit interne : brouillon, soumise, approuvée, publiée, retirée, archivée. | L'état de validité |
| **Identifiant canonique** | L'identité stable et publique d'une publication, indépendante de l'application et de l'organisation. | L'identifiant technique en base |
| **Code court** | Forme brève de l'identifiant canonique, dictable et saisissable sur un clavier de téléphone. | Une URL raccourcie tierce |
| **Instantané d'habilitation** | Copie figée, embarquée dans une version publiée, de l'habilitation qui la fondait au moment de la publication. | Un lien vers l'habilitation |
| **Empreinte canonique** | SHA-256 de la sérialisation canonique d'une version publiée. | L'empreinte d'un fichier joint |
| **Enregistrement de preuve** | Entrée immuable et chaînée du journal de preuve, attestant qu'une version a été publiée à un instant donné sous une habilitation donnée. | Le journal d'audit applicatif |
| **Sceau** | Signature cryptographique de l'organisation apposée sur une publication de niveau N3. | L'empreinte canonique |
| **Remplacement** | Relation dirigée entre deux publications distinctes : celle-ci en remplace une autre. | Une nouvelle version de la même publication |
| **Retrait** | Décision de cesser de présenter une publication, avec date, autorité et motif. **Ne supprime jamais.** | Une suppression |

---

# 2. Carte des contextes

```text
      ┌───────────────────┐                      ┌────────────────────┐
      │   HABILITATION    │   Published Language │      PREUVE        │
      │  (Supporting)     │──────────────────────▶│   (Generic)       │
      │                   │  InstantaneHabilitation                   │
      │ Organisation      │                      │ EnregistrementPreuve│
      │ Habilitation      │                      │ (append-only chaîné)│
      │ CanalOfficiel     │                      └────────────────────┘
      └─────────┬─────────┘                                ▲
                │ Customer / Supplier                       │ Conformist
                │ (upstream)                                │
                ▼                                           │
      ┌───────────────────────────────────────────────┐     │
      │              PUBLICATION  (CORE)              │─────┘
      │  Publication · VersionPubliee · Brouillon     │
      └───────┬───────────────────────────────┬───────┘
              │ Domain Events (Outbox)        │
              ▼                               ▼
   ┌──────────────────┐            ┌────────────────────────┐
   │  RECHERCHE       │            │  DIFFUSION             │
   │  (projection)    │            │  (Supporting + ACL)    │
   │  Conformist      │            │  SMS · IVR · relais    │
   └──────────────────┘            └────────────┬───────────┘
                                                │ ACL par canal
                                                ▼
                                     ┌────────────────────────┐
                                     │ Canaux externes        │
                                     │ opérateurs, réseaux    │
                                     │ sociaux, radios        │
                                     └────────────────────────┘

   ┌──────────────────┐            ┌────────────────────────┐
   │  SUIVI           │            │  CheckMe               │
   │  (Supporting)    │            │  Separate Ways         │
   │  périmètre déclaré│           │  référence sortante     │
   └──────────────────┘            └────────────────────────┘
```

## 2.1. Nature des relations

| Relation | Type | Contrat | Motif |
|---|---|---|---|
| Habilitation → Publication | **Customer / Supplier**, avec Published Language | `InstantaneDHabilitation` — structure figée, versionnée, sans référence vivante | Une publication de 2027 doit rester vérifiable en 2035, même si l'habilitation qui la fondait a été révoquée en 2029. Une jointure vivante rendrait l'histoire irrécupérable. Voir ADR-004. |
| Publication → Preuve | **Conformist** | `DemandeEnregistrementPreuve` | Preuve est un sous-domaine générique, remplaçable par un tiers d'horodatage sans toucher au Core |
| Publication → Recherche / Suivi | **Événements de domaine**, projections reconstructibles | `PublicationPubliee`, `VersionPubliee`, `PublicationRetiree`, `PublicationRemplacee` | Décision point 19.1 du document de référence : recherche et feed sont des projections reconstructibles |
| Publication → Diffusion | **Événements + ACL par canal** | `RepresentationsGenerees` | Règle point 11.2 : « une panne de distribution n'annule pas une publication valide » |
| infUb → CheckMe | **Separate Ways** | Référence sortante typée (URL + identifiant de dispositif), aucune intégration de données | point 11 du document fondateur : « une publication peut référencer une capacité CheckMe sans absorber son domaine métier » |

---

# 3. Contexte HABILITATION

## 3.1. Frontières d'agrégat

Trois agrégats, et non un seul.

| Agrégat | Racine | Ce qu'il garantit transactionnellement | Pourquoi il est séparé |
|---|---|---|---|
| **Organisation** | `Organisation` | L'identité, le rattachement hiérarchique et le niveau de vérification d'une organisation sont cohérents | Cycle de vie long et lent (années). Le nombre d'organisations est borné par la réalité institutionnelle. |
| **Habilitation** | `Habilitation` | Une habilitation est, à tout instant, soit valide soit non valide, avec une raison | Cycle de vie court et fréquent (mutations d'agents, fins de mandat). Une organisation peut en porter des centaines. La révocation doit être atomique et rapide (< 1 h, point 7.3 de l'étude) sans verrouiller l'organisation. Voir ADR-003. |
| **CanalOfficiel** | `CanalOfficiel` | Un canal déclaré est vérifié ou non, actif ou retiré | Consulté massivement en lecture par des tiers (opérateurs, médias, citoyens) ; doit pouvoir être servi et mis en cache indépendamment |

## 3.2. Agrégat `Organisation`

```text
Organisation  (racine)
├── id                  : IdOrganisation      (ULID, immuable)
├── slug                : SlugOrganisation    (immuable après première publication)
├── denomination        : Denomination        { officielle, sigle, denominationsAnterieures[] }
├── categorie           : CategorieOrganisation
├── parent              : *IdOrganisation
├── cheminHierarchique  : CheminHierarchique  (dérivé, matérialisé)
├── niveauVerification  : NiveauVerification  (N0 | N1)
├── preuves             : []PreuveExistence
├── contactInstitutionnel : ContactInstitutionnel
├── etat                : EtatOrganisation    (ACTIVE | SUSPENDUE | DISSOUTE)
└── evenementsEnAttente : []EvenementDomaine
```

### Value objects

| VO | Contenu | Règles |
|---|---|---|
| `SlugOrganisation` | Chaîne normalisée, minuscules, sans accents, séparateur `-` | Unique dans le périmètre du parent. **Immuable dès la première publication** (INV-H7). |
| `Denomination` | Dénomination officielle, sigle, historique des dénominations antérieures avec période | Un changement de nom **ajoute** une dénomination antérieure, ne remplace jamais |
| `CategorieOrganisation` | `ADMINISTRATION_CENTRALE`, `ETABLISSEMENT_ENSEIGNEMENT`, `COLLECTIVITE`, `AGENCE_PUBLIQUE`, `ENTREPRISE`, `ASSOCIATION`, `AUTRE` | Détermine les preuves d'existence recevables |
| `PreuveExistence` | `{ nature, reference, dateActe, autoriteEmettrice, empreinteDocument, constateeLe, constateePar }` | Natures : `ACTE_CREATION`, `IFU`, `RCCM`, `ARRETE`, `DECRET`, `RECEPISSE_ASSOCIATION`, `CONTROLE_DOMAINE`, `CONTROLE_ADRESSE_INSTITUTIONNELLE` |
| `NiveauVerification` | `N0_REFERENCEE` \| `N1_VERIFIEE` | N1 exige au moins une preuve d'existence **et** une preuve de contrôle de canal |
| `CheminHierarchique` | Liste ordonnée d'`IdOrganisation`, de la racine au nœud | Dérivé, recalculé sur changement de parent, matérialisé pour la requête de périmètre |

### Invariants

| Id | Invariant | Origine |
|---|---|---|
| **INV-H1** | Une organisation ne peut pas être son propre ancêtre (le graphe de rattachement est un arbre) | Cohérence du périmètre |
| **INV-H2** | Le passage à `N1_VERIFIEE` exige ≥ 1 preuve d'existence **et** ≥ 1 preuve de contrôle de canal | point 7.3 de l'étude |
| **INV-H3** | La rétrogradation en `N0` ou le passage en `SUSPENDUE` déclenche la suspension de toutes les habilitations de l'organisation | Règle de plafonnement, ADR-008 |
| **INV-H4** | Une organisation `DISSOUTE` ne peut plus recevoir d'habilitation ; ses publications restent accessibles et retrouvables | Principe fondateur 6.4 (persistance) |
| **INV-H5** | Une preuve d'existence n'est jamais supprimée ; elle est marquée `perimee` avec une date | Principe fondateur 6.4 |
| **INV-H6** | Le rattachement d'une organisation à un parent d'une catégorie incompatible est refusé (une administration centrale ne peut pas être fille d'une association) | Cohérence institutionnelle |
| **INV-H7** | Le `slug` est immuable dès qu'au moins une publication a été émise sous cette organisation | Stabilité de l'identifiant canonique, ADR-001 |

## 3.3. Agrégat `Habilitation`

```text
Habilitation  (racine)
├── id                 : IdHabilitation      (ULID)
├── organisation       : IdOrganisation      (immuable)
├── publicateur        : IdCompte            (immuable)
├── niveau             : NiveauHabilitation  (N1 | N2 | N3)
├── typesActesAutorises: []TypeActe
├── perimetre          : PerimetreDePublication
├── acteDeDesignation  : ActeDeDesignation
├── periode            : PeriodeValidite     { debut, fin? }
├── etat               : EtatHabilitation
├── motifFinDeDroit    : *MotifFinDeDroit
├── certificat         : *ReferenceCertificat   (obligatoire si niveau = N3)
└── journal            : []MutationHabilitation  (append-only)
```

### Value objects

| VO | Contenu | Règles |
|---|---|---|
| `NiveauHabilitation` | `N1_INFORMATIVE` \| `N2_HABILITEE` \| `N3_SCELLEE` | Voir INV-H8 |
| `TypeActe` | `COMMUNIQUE`, `AVIS`, `APPEL_CANDIDATURE`, `CALENDRIER`, `RESULTAT`, `DECISION`, `ALERTE`, `INFORMATION_PRATIQUE` | `ALERTE` n'est jamais accordé au niveau N1 (INV-H11) |
| `PerimetreDePublication` | `{ noeudsOrganisation[], territoires[], publics[] }` | Chaque nœud doit appartenir au sous-arbre de l'organisation (INV-H9) |
| `ActeDeDesignation` | `{ reference, dateActe, fonctionSignataire, empreinteDocument, deposeLe }` | Obligatoire dès N2 (INV-H10). **La fonction du signataire est enregistrée, pas son nom.** |
| `PeriodeValidite` | `{ debut, fin? }` | `fin` obligatoire pour les habilitations temporaires ; sinon revue périodique |
| `EtatHabilitation` | `ACTIVE` \| `SUSPENDUE` \| `REVOQUEE` \| `EXPIREE` | `REVOQUEE` est terminal |
| `MotifFinDeDroit` | `FIN_DE_FONCTION`, `DEMANDE_ORGANISATION`, `SUSPENSION_ORGANISATION`, `SUSPICION_COMPROMISSION`, `EXPIRATION`, `DECISION_OPERATEUR` | `SUSPICION_COMPROMISSION` déclenche la procédure de crise |

### Invariants

| Id | Invariant | Origine |
|---|---|---|
| **INV-H8** | `niveauHabilitation` ≤ capacité conférée par `niveauVerification` de l'organisation : N2 et N3 exigent une organisation `N1_VERIFIEE` | point 7.3 de l'étude, ADR-008 |
| **INV-H9** | Le périmètre d'une habilitation est inclus dans le sous-arbre de son organisation | Cohérence de l'autorité |
| **INV-H10** | Une habilitation N2 ou N3 sans `acteDeDesignation` déposé est refusée | point 7.3 — « la plateforme enregistre une délégation, elle ne l'accorde pas » |
| **INV-H11** | Le type d'acte `ALERTE` n'est accordé qu'au niveau N2 ou N3, et son usage est contingenté | point 7.6.2 de l'étude (contingentement des alertes) |
| **INV-H12** | Une habilitation N3 sans `certificat` valide est refusée | ADR-008 |
| **INV-H13** | Toute mutation d'état écrit une entrée dans `journal` avec horodatage, auteur et motif. Le journal n'est jamais modifié ni tronqué. | Exigence d'audit, ADR-007 |
| **INV-H14** | La révocation est **immédiate et sans délai de grâce** ; elle n'attend aucune validation asynchrone | point 7.3 de l'étude — révocation < 1 h |
| **INV-H15** | La révocation d'une habilitation **n'invalide jamais rétroactivement** les publications émises sous elle pendant sa période active | Principe fondateur 6.4, ADR-004 |

> **INV-H15 est le plus important du contexte.** Sans lui, révoquer un agent partant à la retraite effacerait la validité de tout ce qu'il a publié en dix ans. C'est ce qui impose l'instantané d'habilitation plutôt que la jointure vivante.

## 3.4. Agrégat `CanalOfficiel`

```text
CanalOfficiel  (racine)
├── id            : IdCanal
├── organisation  : IdOrganisation
├── nature        : NatureCanal
├── valeur        : ValeurCanal          (normalisée selon la nature)
├── verification  : *VerificationCanal   { methode, constateeLe, constateePar }
├── etat          : ACTIF | RETIRE | CONTESTE
└── declareLe / retireLe
```

| `NatureCanal` | Exemple de valeur | Méthode de vérification |
|---|---|---|
| `DOMAINE` | `ujkz.bf` | Enregistrement DNS TXT ou fichier à une URL convenue |
| `ADRESSE_INSTITUTIONNELLE` | `scolarite@ujkz.bf` | Code envoyé à l'adresse |
| `ENTETE_SMS` | `UJKZ` | Attestation de l'opérateur |
| `NUMERO_COURT` | `321` | Attestation de l'opérateur |
| `PAGE_RESEAU_SOCIAL` | URL de page | Publication d'un code de contrôle par la page + constat daté |
| `COMPTE_MESSAGERIE` | Canal WhatsApp ou Telegram | Publication d'un code de contrôle + constat daté |

| Id | Invariant | Origine |
|---|---|---|
| **INV-H16** | Une même `valeur` de nature `DOMAINE`, `ENTETE_SMS` ou `NUMERO_COURT` ne peut être `ACTIF` que pour une seule organisation à la fois | Fonction anti-usurpation, point 7.3.3 de l'étude |
| **INV-H17** | Un canal `RETIRE` conserve sa trace et ses dates ; l'historique « qui détenait ce canal en 2027 » reste interrogeable | Principe fondateur 6.4 |
| **INV-H18** | La déclaration d'un canal n'emporte aucune vérification : `verification` reste nulle jusqu'au constat, et l'API le dit explicitement | Honnêteté du registre |

## 3.5. Commandes, événements, politiques

### Commandes

| Commande | Agrégat | Refus notables |
|---|---|---|
| `EnregistrerOrganisation` | Organisation | Slug déjà pris dans le périmètre du parent |
| `DeposerPreuveExistence` | Organisation | Nature de preuve incompatible avec la catégorie |
| `PromouvoirEnN1Verifiee` | Organisation | INV-H2 non satisfait |
| `RattacherOrganisation` | Organisation | INV-H1, INV-H6 |
| `SuspendreOrganisation` / `DissoudreOrganisation` | Organisation | — |
| `DeclarerCanal` | CanalOfficiel | INV-H16 |
| `ConstaterVerificationCanal` | CanalOfficiel | Méthode incompatible avec la nature |
| `RetirerCanal` | CanalOfficiel | — |
| `AccorderHabilitation` | Habilitation | INV-H8, INV-H9, INV-H10, INV-H11, INV-H12 |
| `SuspendreHabilitation` | Habilitation | Habilitation déjà `REVOQUEE` |
| `RevoquerHabilitation` | Habilitation | Aucun — la révocation ne se refuse pas (INV-H14) |
| `ProlongerHabilitation` | Habilitation | Habilitation `REVOQUEE` |

### Événements de domaine

`OrganisationEnregistree` · `OrganisationVerifiee` · `OrganisationRetrogradee` · `OrganisationSuspendue` · `OrganisationDissoute` · `OrganisationRattachee` · `CanalDeclare` · `CanalVerifie` · `CanalRetire` · `CanalConteste` · `HabilitationAccordee` · `HabilitationSuspendue` · `HabilitationRevoquee` · `HabilitationExpiree` · `HabilitationProlongee`

### Politiques

| Déclencheur | Politique | Effet |
|---|---|---|
| `OrganisationSuspendue` \| `OrganisationRetrogradee` | **Plafonnement** | Suspendre toutes les habilitations actives de l'organisation (INV-H3). Les publications déjà émises ne sont pas touchées (INV-H15). |
| `HabilitationRevoquee(motif = SUSPICION_COMPROMISSION)` | **Procédure de crise** | Suspendre le compte publicateur, geler les publications émises par lui dans les N dernières heures en `SOUS_VERIFICATION`, notifier l'organisation et l'opérateur. **Geler ≠ supprimer.** |
| `PeriodeValidite.fin` atteinte | **Expiration** | Passage en `EXPIREE` par tâche périodique idempotente |
| `CanalConteste` | **Alerte registre** | Marquer le canal, notifier l'organisation détentrice et l'opérateur ; ne pas retirer automatiquement |
---

# 4. Contexte PUBLICATION — le Core Domain

## 4.1. Frontières d'agrégat

C'est l'arbitrage le plus délicat du modèle. Le document de référence (point 11) décrit `Publication` comme une racine contenant ses `PublicationVersion`. Ce modèle ne tient pas à l'échelle : une publication de longue vie peut porter des dizaines de versions, chacune avec des blocs de contenu et des pièces jointes, et charger l'ensemble à chaque modification est inutile.

**Découpage retenu : deux agrégats.**

| Agrégat | Racine | Invariants transactionnels garantis | Contenu chargé |
|---|---|---|---|
| **Publication** | `Publication` | Une seule version en vigueur à la fois ; numéros de version contigus ; cohérence identité / statut / remplacement / retrait ; validité du brouillon courant | Identité, en-têtes de versions (légers), fenêtre de validité en vigueur, statut, brouillon courant si présent |
| **VersionPubliee** | `VersionPubliee` | Immuabilité totale après publication | Blocs de contenu complets, pièces jointes, instantané d'habilitation, empreinte canonique |

**Justification.** L'invariant « une seule version en vigueur » et « les numéros sont contigus » se vérifie sur les **en-têtes** de versions, pas sur leur contenu. Le contenu d'une version publiée, lui, est immuable : il n'a aucun invariant à protéger après coup, donc il n'a pas besoin d'être dans la frontière transactionnelle. Le **brouillon**, en revanche, reste dans l'agrégat `Publication` parce que ses invariants (blocs cohérents, pièces attachées présentes, périmètre couvert par l'habilitation) doivent être vérifiés à chaque modification.

## 4.2. Agrégat `Publication`

```text
Publication  (racine)
├── identifiant        : IdentifiantCanonique   (immuable, ADR-001)
├── codeCourt          : CodeCourt              (immuable, ADR-001)
├── organisationEmettrice : IdOrganisation      (immuable)
├── typeActe           : TypeActe               (immuable)
├── statutProduction   : StatutProduction
├── enTetesVersions    : []EnTeteVersion        (ordonné, contigu depuis 1)
├── numeroVersionEnVigueur : *int
├── fenetreValidite    : FenetreDeValidite      (de la version en vigueur)
├── portee             : PorteeDePublication
├── provenance         : Provenance
├── remplacement       : *Remplacement          { remplaceePar, decideLe }
├── remplace           : []IdentifiantCanonique
├── retrait            : *Retrait               { decideLe, autorite, motif }
├── referencesSortantes: []ReferenceSortante    (dont CheckMe)
└── brouillon          : *BrouillonDeVersion
```

### Value objects du Core

| VO | Contenu | Règles |
|---|---|---|
| `IdentifiantCanonique` | `/bf/{secteur}/{orgSlug}/{typeActe}/{annee}/{numero}` | Immuable à vie, y compris si l'organisation change de nom, fusionne ou est dissoute (INV-P1). Voir ADR-001. |
| `CodeCourt` | 7 caractères Crockford base32, dont 1 de contrôle | Dictable, saisissable au clavier numérique, résistant aux confusions I/1, L/1, O/0. Voir ADR-001 et point 4.6. |
| `FenetreDeValidite` | `{ publieeLe, effetLe?, echeanceLe?, finValiditeLe? }` | Ordre strict imposé (INV-P6) |
| `EtatDeValidite` | `A_VENIR` \| `EN_VIGUEUR` \| `ECHEANCE_PROCHE` \| `EXPIREE` \| `REMPLACEE` \| `RETIREE` | **Fonction pure — jamais persistée** (INV-P7, ADR-005) |
| `StatutProduction` | `BROUILLON` \| `SOUMISE` \| `APPROUVEE` \| `PUBLIEE` \| `SOUS_VERIFICATION` \| `RETIREE` \| `ARCHIVEE` | Machine à états, point 6.1 |
| `PorteeDePublication` | `{ noeudsOrganisation[], territoires[], publics[], langues[] }` | Doit être incluse dans le périmètre de l'habilitation utilisée (INV-P4) |
| `Provenance` | `{ mode, systemeSource?, referenceSource?, recuLe }` — mode ∈ `DIRECT`, `PUSH`, `PULL`, `REFERENCE` | Reprend le point 13.2 du document de référence |
| `EnTeteVersion` | `{ numero, statut, publieeLe?, empreinteCanonique?, motifRevision? }` | Léger par construction : jamais de contenu |
| `Retrait` | `{ decideLe, autoriteDuRetrait, motif, publicationDeRemplacement? }` | Ne supprime rien (INV-P8) |
| `ReferenceSortante` | `{ nature, libelle, url, dispositif? }` — nature ∈ `CHECKME`, `SYSTEME_METIER`, `SOURCE_JURIDIQUE`, `AUTRE` | Une publication « résultats disponibles » pointe vers CheckMe sans absorber son domaine |

### Invariants

| Id | Invariant | Origine |
|---|---|---|
| **INV-P1** | `identifiant` et `codeCourt` sont attribués une fois et ne changent jamais, quelles que soient les évolutions de l'organisation | point 13.1 du doc. de référence ; principe fondateur 6.2 |
| **INV-P2** | Une publication possède toujours une `organisationEmettrice` | Principe fondateur 6.1 — « institution avant contenu » |
| **INV-P3** | Le passage à `PUBLIEE` exige une habilitation **active au moment de la commande**, couvrant le `typeActe` et la `portee` | point 11.2 du doc. de référence |
| **INV-P4** | `portee` ⊆ `perimetre` de l'habilitation utilisée | Cohérence de l'autorité |
| **INV-P5** | Une version publiée est immuable : aucun de ses champs ne peut être modifié après publication. Une correction produit une **nouvelle version** | Principe fondateur 6.4 ; ADR-009 |
| **INV-P6** | `publieeLe ≤ effetLe ≤ echeanceLe ≤ finValiditeLe` pour les dates renseignées | Cohérence temporelle |
| **INV-P7** | `EtatDeValidite` n'est **jamais** un champ persisté : il est calculé par une fonction pure de `(fenetreValidite, statutProduction, remplacement, retrait, t)` | ADR-005 |
| **INV-P8** | Un retrait ne supprime aucune donnée : la publication reste résolvable et renvoie son état `RETIREE` avec date, autorité et motif | Principe fondateur 6.4 ; ADR-010 |
| **INV-P9** | Les numéros de version sont contigus à partir de 1, sans trou ni réutilisation | Intégrité de l'historique |
| **INV-P10** | Une seule version au plus est en vigueur à un instant donné | Cohérence de lecture |
| **INV-P11** | Une publication publique reste retrouvable sans abonnement et sans compte | Principe fondateur 6.3 |
| **INV-P12** | Le remplacement est une relation entre deux publications **distinctes** ; une publication ne se remplace jamais elle-même (c'est une révision) | Distinction version / remplacement |
| **INV-P13** | Chaque version publiée embarque un `InstantaneDHabilitation` figé ; aucune lecture publique ne dépend de l'état courant d'une habilitation | INV-H15 ; ADR-004 |
| **INV-P14** | Un bloc de contenu de nature `VIDEO` porte une **référence externe**, jamais un binaire hébergé | ADR-011 ; point 7.7 de l'étude |
| **INV-P15** | Le passage à `PUBLIEE` déclenche, dans la même transaction, l'écriture de l'événement en outbox et la demande d'enregistrement de preuve | point 12.1 du doc. de référence (outbox transactionnel) ; ADR-007 |
| **INV-P16** | Une publication en `SOUS_VERIFICATION` reste résolvable mais est présentée avec un avertissement explicite ; elle n'est ni supprimée ni masquée | Procédure de crise, point 3.5 |

## 4.3. Agrégat `VersionPubliee`

```text
VersionPubliee  (racine, immuable)
├── publication            : IdentifiantCanonique
├── numero                 : int
├── blocs                  : []BlocContenu        (ordonné)
├── piecesJointes          : []PieceJointe
├── representations        : Representations
├── instantaneHabilitation : InstantaneDHabilitation
├── empreinteCanonique     : EmpreinteSHA256
├── motifRevision          : *string
├── publieeLe              : Instant
└── sceau                  : *Sceau               (si niveau N3)
```

| Élément | Contenu | Règles |
|---|---|---|
| `BlocContenu` | `{ ordre, nature, ... }` — nature ∈ `TEXTE`, `IMAGE`, `DOCUMENT`, `TABLEAU`, `VIDEO_REFERENCEE`, `REFERENCE_SORTANTE` | Ordre éditorial significatif. `VIDEO_REFERENCEE` porte une URL, pas un fichier (INV-P14). |
| `PieceJointe` | `{ nom, typeMime, taille, empreinteFichier, cleStockage, formatPerenne? }` | Empreinte SHA-256 calculée au dépôt. Un PDF déposé produit aussi une variante PDF/A quand la conversion est possible. |
| `Representations` | `{ resumeCourt (≤ 320 car.), scriptVocal, enregistrementStructure }` | Générées à la publication. point 7.5.3 de l'étude — c'est le service rendu à l'institution. |
| `InstantaneDHabilitation` | `{ idHabilitation, organisation, denominationAlors, publicateurPseudonymise, niveau, fonctionSignataire, typesActes, perimetre, periodeAlors, figeLe }` | **Copie figée, jamais une référence vivante.** Voir ADR-004. |
| `Sceau` | `{ algorithme, referenceCertificat, valeur, horodateLe, autoriteHorodatage? }` | Présent seulement si `instantaneHabilitation.niveau = N3_SCELLEE` |

> **Note de conception sur `publicateurPseudonymise`.** L'instantané enregistre la **fonction** du signataire et un identifiant pseudonyme du publicateur, pas son nom en clair sur la page publique. La correspondance identifiant ↔ personne reste dans le contexte Habilitation, accessible sur réquisition et pour l'audit. Cela satisfait la traçabilité sans transformer chaque publication en publication de données personnelles d'agent.

## 4.4. Le brouillon

```text
BrouillonDeVersion  (entité, dans l'agrégat Publication)
├── numeroCible     : int
├── blocs           : []BlocContenu
├── piecesJointes   : []PieceJointe
├── fenetreProposee : FenetreDeValidite
├── porteeProposee  : PorteeDePublication
├── habilitationPressentie : IdHabilitation
├── modifieLe / modifiePar
└── controles       : []ResultatControle
```

Le brouillon n'est jamais public, y compris par lien direct. Les `controles` matérialisent les validations non bloquantes affichées au rédacteur : pièce jointe manquante, échéance dans le passé, périmètre plus large que l'habilitation, absence de résumé court exploitable.

## 4.5. Commandes, événements, politiques

### Commandes

| Commande | Refus notables |
|---|---|
| `OuvrirBrouillon` | Un brouillon est déjà ouvert sur cette publication |
| `ModifierBrouillon` | Publication `ARCHIVEE` |
| `SoumettreALaValidation` | Contrôles bloquants en échec |
| `ApprouverVersion` | Approbateur = rédacteur alors que la double validation est requise (N2/N3) |
| `PublierVersion` | INV-P3, INV-P4 ; habilitation non active |
| `OuvrirRevision` | Publication `RETIREE` |
| `DeclarerRemplacement` | INV-P12 |
| `RetirerPublication` | Publication déjà `RETIREE` |
| `ArchiverPublication` | — |
| `PlacerSousVerification` | Réservé à la procédure de crise |
| `AjouterReferenceSortante` | URL non conforme au dispositif déclaré |

### Événements de domaine

`PublicationCreee` · `VersionSoumise` · `VersionApprouvee` · `VersionPubliee` · `RevisionOuverte` · `PublicationRemplacee` · `PublicationRetiree` · `PublicationArchivee` · `PublicationPlaceeSousVerification` · `RepresentationsGenerees` · `EmpreinteCanoniqueCalculee` · `SceauAppose`

### Politiques

| Déclencheur | Politique | Effet |
|---|---|---|
| `VersionPubliee` | **Enregistrement de preuve** | Émettre `DemandeEnregistrementPreuve` vers le contexte Preuve (INV-P15) |
| `VersionPubliee` | **Génération des représentations** | Produire résumé court, script vocal et enregistrement structuré ; échec non bloquant, rejouable |
| `VersionPubliee` | **Projection** | Alimenter Recherche et Suivi ; projections reconstructibles |
| `VersionPubliee(typeActe = ALERTE)` | **Contingentement** | Décrémenter le quota de l'organisation, journaliser publiquement l'usage |
| `PublicationRemplacee` | **Réciprocité** | Écrire la relation inverse `remplace` sur la publication remplaçante |
| `HabilitationRevoquee(SUSPICION_COMPROMISSION)` | **Gel prudentiel** | Placer en `SOUS_VERIFICATION` les publications émises sous cette habilitation dans la fenêtre de suspicion |
| `finValiditeLe` atteinte | *(aucune)* | **Aucune écriture** : l'expiration est un effet du calcul de `EtatDeValidite`, pas une mutation (INV-P7) |

> La dernière ligne est un choix de conception, pas un oubli. Faire de l'expiration une tâche d'écriture obligerait à un balayage périodique de toute la base, produirait des incohérences aux frontières de fuseau, et rendrait impossible la question « quel était l'état de cette publication le 12 mars ? ».

## 4.6. Spécification du code court

Contrainte issue du point 7.4.1 de l'étude : le code doit être **dictable à la radio** et **saisissable sur un clavier de téléphone simple**.

| Élément | Spécification |
|---|---|
| Alphabet | Crockford base32 : `0123456789ABCDEFGHJKMNPQRSTVWXYZ` — sans `I`, `L`, `O`, `U` |
| Longueur | 7 caractères : 6 de données + 1 de contrôle |
| Espace utile | 32⁶ = **1 073 741 824** identifiants |
| Affichage | `XXXX-XXX`, par exemple `CSEM-ZN7` ; la saisie accepte la forme sans tiret, en minuscules |
| Normalisation à la saisie | `I` → `1`, `L` → `1`, `O` → `0`, casse ignorée, tirets et espaces ignorés |
| Contrôle | `c = alphabet[ (Σ valeur(dᵢ) × wᵢ) mod 32 ]` avec `w = [1, 3, 5, 7, 9, 11]` |
| Pourquoi des poids impairs | Ils sont premiers avec 32, ce qui garantit qu'aucune substitution d'un caractère ne peut laisser la somme inchangée |

**Capacité de détection mesurée** (simulation sur 50 000 codes) :

| Type d'erreur | Détection |
|---|---|
| Un caractère faux, à n'importe quelle position | **100 %** |
| Transposition de deux caractères adjacents | **95,7 %** |
| Transposition d'un caractère avec le caractère de contrôle | 90,1 % |

> Le compromis est assumé : pour une lecture à voix haute à la radio ou au téléphone, la **substitution** est de très loin l'erreur dominante, et elle est détectée intégralement. Une détection à 100 % des transpositions imposerait soit un alphabet de 37 symboles incluant des caractères non dictables, soit un algorithme de Damm avec une table de 1 024 entrées — coût disproportionné au regard du gain.

**Attribution.** Le code court n'est pas dérivé de l'identifiant canonique : il est tiré d'un compteur permuté (chiffrement à préservation de format sur 30 bits, clé fixe et versionnée), ce qui donne des codes non séquentiels — donc non énumérables — sans collision et sans table de rejet.

---

# 5. Contexte PREUVE

Sous-domaine **générique**. Il doit pouvoir être remplacé par un service tiers d'horodatage qualifié sans modifier le Core.

```text
EnregistrementDePreuve  (racine, immuable, append-only)
├── numeroSequence      : int64                (strictement croissant, sans trou)
├── publication         : IdentifiantCanonique
├── numeroVersion       : int
├── empreinteCanonique  : EmpreinteSHA256      (de la version)
├── empreinteHabilitation : EmpreinteSHA256    (de l'instantané)
├── empreintePrecedente : EmpreinteSHA256      (chaînage)
├── empreinteEntree     : EmpreinteSHA256      (de cette entrée)
├── horodateLe          : Instant
└── ancrage             : *Ancrage             { nature, reference, ancreLe }
```

| Id | Invariant | Origine |
|---|---|---|
| **INV-PR1** | Le journal est strictement append-only : aucune mise à jour, aucune suppression, aucun trou de séquence | ADR-007 |
| **INV-PR2** | `empreinteEntree = SHA256(numeroSequence ‖ publication ‖ numeroVersion ‖ empreinteCanonique ‖ empreinteHabilitation ‖ empreintePrecedente ‖ horodateLe)` | ADR-007 |
| **INV-PR3** | La vérification d'intégrité du journal est une opération publique et rejouable de bout en bout | Transparence |
| **INV-PR4** | L'ancrage externe (publication périodique de l'empreinte de tête chez un tiers) est **optionnel et différé**, mais la structure le prévoit dès la V1 | Trajectoire H2 de l'étude |

## 5.1. La sérialisation canonique

Point d'ingénierie sans lequel tout le dispositif de preuve est inopérant : **deux calculs d'empreinte de la même version doivent produire le même résultat**, aujourd'hui et dans dix ans, quel que soit le langage.

| Règle | Spécification |
|---|---|
| Format | JSON canonique selon **RFC 8785 (JCS)** : clés triées, échappement normalisé, nombres au format canonique |
| Champs inclus | Identifiant canonique, numéro de version, type d'acte, organisation émettrice, blocs de contenu (ordre significatif, texte normalisé NFC), empreintes des pièces jointes, fenêtre de validité, portée, empreinte de l'instantané d'habilitation, date de publication |
| Champs exclus | Tout champ dérivé, tout compteur, tout horodatage technique, toute URL de stockage, les représentations générées |
| Normalisation du texte | Unicode **NFC**, fins de ligne `\n`, espaces de fin supprimés |
| Versionnement | Le profil de sérialisation porte un numéro (`jcs-v1`) enregistré dans l'entrée de preuve. Un changement de profil n'invalide pas les empreintes antérieures. |

> Le versionnement du profil est ce qui rend le dispositif tenable sur vingt ans. Sans lui, la première évolution du modèle de contenu casserait l'ensemble des vérifications passées.

---

# 6. Les deux machines à états

C'est la distinction structurante du modèle, et elle est absente du document de référence, qui n'en décrit qu'une (point 11.3).

## 6.1. Machine A — statut de production (mutable, piloté par des commandes)

```text
                 ┌──────────────┐
                 │  BROUILLON   │
                 └──────┬───────┘
                        │ SoumettreALaValidation
                        ▼
                 ┌──────────────┐
                 │   SOUMISE    │──── Rejeter ──▶ BROUILLON
                 └──────┬───────┘
                        │ ApprouverVersion
                        ▼
                 ┌──────────────┐
                 │  APPROUVEE   │
                 └──────┬───────┘
                        │ PublierVersion
                        ▼
      ┌──────────────────────────────────┐
      │            PUBLIEE               │◀── PublierVersion ──┐
      └───┬───────────┬───────────┬──────┘                     │
          │           │           │                            │
   OuvrirRevision  Retirer   PlacerSous              (nouvelle version,
          │           │      Verification             numéro n+1)
          ▼           ▼           ▼                            │
    ┌──────────┐ ┌──────────┐ ┌──────────────────┐             │
    │BROUILLON │ │ RETIREE  │ │SOUS_VERIFICATION │─── Lever ───┘
    │ (v n+1)  │ └──────────┘ └──────────────────┘
    └──────────┘        │
                        ▼
                  ┌──────────┐
                  │ ARCHIVEE │   (terminal ; reste résolvable)
                  └──────────┘
```

**Aucun état n'est destructif.** `RETIREE` et `ARCHIVEE` restent résolvables et renvoient un état explicite (INV-P8, ADR-010).

## 6.2. Machine B — état de validité (calculé, jamais stocké)

```text
EtatDeValidite(publication, t) :

  si retrait ≠ null                        → RETIREE
  si remplacement ≠ null                   → REMPLACEE
  si statutProduction ≠ PUBLIEE            → (non publique)
  si effetLe ≠ null et t < effetLe         → A_VENIR
  si finValiditeLe ≠ null et t > finValiditeLe → EXPIREE
  si echeanceLe ≠ null et t ≤ echeanceLe
       et (echeanceLe − t) ≤ seuilAlerte   → ECHEANCE_PROCHE
  sinon                                    → EN_VIGUEUR
```

| Propriété | Conséquence |
|---|---|
| **Fonction pure de `t`** | La question « quel était l'état le 12 mars ? » a une réponse exacte, sans historique d'états |
| **Aucune tâche de balayage** | Pas de traitement nocturne, pas d'incohérence de fuseau, pas de dérive |
| **Déterministe et testable** | Une table de cas suffit à la couvrir intégralement |
| **`seuilAlerte` est un paramètre du type d'acte** | Une échéance de concours n'a pas le même horizon d'alerte qu'un calendrier annuel |

**Le seul point d'attention** : les projections de recherche et de feed doivent être rafraîchies aux **frontières temporelles connues** (`effetLe`, `echeanceLe − seuil`, `finValiditeLe`). Ces frontières sont connues à l'avance et planifiables à la publication — c'est un rafraîchissement ciblé de quelques lignes, pas un balayage.

---

# 7. Flux de référence — publier un appel à candidature

```text
Agent (publicateur, habilitation N2 active)
   │
   │ 1. OuvrirBrouillon(organisation, typeActe = APPEL_CANDIDATURE)
   ▼
Publication : identifiant canonique + code court attribués, statut BROUILLON
   │            /bf/education-superieure/ujkz/appel-candidature/2026/047
   │            CSEM-ZN7
   │
   │ 2. ModifierBrouillon : blocs texte, affiche, PDF officiel,
   │    fenêtre { effetLe, echeanceLe }, portée { UFR, filières }
   │    → contrôles non bloquants renvoyés au rédacteur
   ▼
   │ 3. SoumettreALaValidation          → SOUMISE
   │ 4. ApprouverVersion (autre compte) → APPROUVEE      [double validation N2]
   │ 5. PublierVersion
   │      ├── vérifie INV-P3 (habilitation active) et INV-P4 (portée ⊆ périmètre)
   │      ├── fige l'InstantaneDHabilitation
   │      ├── calcule l'empreinte canonique (JCS v1)
   │      ├── crée VersionPubliee n°1 (immuable)
   │      ├── écrit l'événement en outbox        ┐ même
   │      └── écrit la demande d'enregistrement  ┘ transaction
   ▼
                         ┌──────────────── Outbox ────────────────┐
                         ▼            ▼            ▼              ▼
                     PREUVE      RECHERCHE     DIFFUSION       SUIVI
                  entrée chaînée  projection   représentations  boîtes de
                  n° 84 231       indexée      + relais         réception
                                               (SMS, IVR,
                                                réseaux)
```

**Ce qui n'arrive pas** : si la diffusion SMS échoue, la publication reste publiée, valide et retrouvable. Si la génération du script vocal échoue, elle est rejouée. Aucune de ces défaillances ne remonte au Core (point 11.2 du document de référence).

---

# 8. Modèle relationnel d'esquisse

Esquisse de vérification du modèle, pas une migration. PostgreSQL.

```sql
-- ─── contexte habilitation ───────────────────────────────────────────
CREATE TABLE organisation (
  id                  TEXT PRIMARY KEY,               -- ULID
  slug                TEXT NOT NULL,
  parent_id           TEXT REFERENCES organisation(id),
  chemin              TEXT[] NOT NULL,                -- chemin hiérarchique matérialisé
  categorie           TEXT NOT NULL,
  denomination        JSONB NOT NULL,                 -- officielle, sigle, antérieures[]
  niveau_verification TEXT NOT NULL DEFAULT 'N0_REFERENCEE',
  etat                TEXT NOT NULL DEFAULT 'ACTIVE',
  cree_le             TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (parent_id, slug)                            -- INV : unicité dans le parent
);
CREATE INDEX ON organisation USING GIN (chemin);      -- requêtes de sous-arbre

CREATE TABLE preuve_existence (
  id TEXT PRIMARY KEY,
  organisation_id TEXT NOT NULL REFERENCES organisation(id),
  nature TEXT NOT NULL, reference TEXT, date_acte DATE,
  autorite_emettrice TEXT, empreinte_document TEXT,
  constatee_le TIMESTAMPTZ NOT NULL, constatee_par TEXT NOT NULL,
  perimee_le TIMESTAMPTZ                              -- INV-H5 : jamais supprimée
);

CREATE TABLE canal_officiel (
  id TEXT PRIMARY KEY,
  organisation_id TEXT NOT NULL REFERENCES organisation(id),
  nature TEXT NOT NULL, valeur TEXT NOT NULL,
  verification JSONB, etat TEXT NOT NULL DEFAULT 'ACTIF',
  declare_le TIMESTAMPTZ NOT NULL, retire_le TIMESTAMPTZ
);
-- INV-H16 : unicité d'un canal exclusif parmi les canaux actifs
CREATE UNIQUE INDEX canal_exclusif_actif
  ON canal_officiel (nature, valeur)
  WHERE etat = 'ACTIF' AND nature IN ('DOMAINE','ENTETE_SMS','NUMERO_COURT');

CREATE TABLE habilitation (
  id TEXT PRIMARY KEY,
  organisation_id TEXT NOT NULL REFERENCES organisation(id),
  publicateur_id  TEXT NOT NULL,
  niveau TEXT NOT NULL,
  types_actes TEXT[] NOT NULL,
  perimetre JSONB NOT NULL,
  acte_designation JSONB,                             -- INV-H10 : requis dès N2
  certificat_ref TEXT,                                -- INV-H12 : requis en N3
  debut_le TIMESTAMPTZ NOT NULL, fin_le TIMESTAMPTZ,
  etat TEXT NOT NULL DEFAULT 'ACTIVE',
  motif_fin TEXT,
  CHECK (niveau <> 'N2_HABILITEE' OR acte_designation IS NOT NULL),
  CHECK (niveau <> 'N3_SCELLEE'  OR (acte_designation IS NOT NULL
                                     AND certificat_ref IS NOT NULL))
);
CREATE INDEX ON habilitation (organisation_id, etat);
CREATE INDEX ON habilitation (publicateur_id, etat);

CREATE TABLE habilitation_journal (                   -- INV-H13 : append-only
  id BIGSERIAL PRIMARY KEY,
  habilitation_id TEXT NOT NULL REFERENCES habilitation(id),
  mutation TEXT NOT NULL, motif TEXT,
  auteur TEXT NOT NULL, survenu_le TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ─── contexte publication ────────────────────────────────────────────
CREATE TABLE publication (
  identifiant       TEXT PRIMARY KEY,                 -- forme longue, immuable
  code_court        TEXT NOT NULL UNIQUE,
  organisation_id   TEXT NOT NULL REFERENCES organisation(id),
  type_acte         TEXT NOT NULL,
  statut_production TEXT NOT NULL,
  version_en_vigueur INT,
  publiee_le        TIMESTAMPTZ,
  effet_le          TIMESTAMPTZ,
  echeance_le       TIMESTAMPTZ,
  fin_validite_le   TIMESTAMPTZ,
  portee            JSONB NOT NULL,
  provenance        JSONB NOT NULL,
  remplacee_par     TEXT REFERENCES publication(identifiant),
  retrait           JSONB,
  brouillon         JSONB,
  CHECK (remplacee_par IS NULL OR remplacee_par <> identifiant),   -- INV-P12
  CHECK (effet_le    IS NULL OR publiee_le IS NULL OR effet_le    >= publiee_le),
  CHECK (echeance_le IS NULL OR effet_le   IS NULL OR echeance_le >= effet_le)
);
-- NOTE : aucune colonne etat_de_validite. INV-P7 / ADR-005.

CREATE TABLE version_publiee (
  identifiant TEXT NOT NULL REFERENCES publication(identifiant),
  numero INT NOT NULL,
  blocs JSONB NOT NULL,
  pieces_jointes JSONB NOT NULL,
  representations JSONB NOT NULL,
  instantane_habilitation JSONB NOT NULL,             -- INV-P13 : figé, pas de FK
  empreinte_canonique TEXT NOT NULL,
  profil_serialisation TEXT NOT NULL DEFAULT 'jcs-v1',
  motif_revision TEXT,
  sceau JSONB,
  publiee_le TIMESTAMPTZ NOT NULL,
  PRIMARY KEY (identifiant, numero)
);
REVOKE UPDATE, DELETE ON version_publiee FROM application_role;   -- INV-P5

-- ─── contexte preuve ─────────────────────────────────────────────────
CREATE TABLE enregistrement_preuve (
  numero_sequence BIGSERIAL PRIMARY KEY,
  identifiant TEXT NOT NULL, numero_version INT NOT NULL,
  empreinte_canonique TEXT NOT NULL,
  empreinte_habilitation TEXT NOT NULL,
  empreinte_precedente TEXT NOT NULL,
  empreinte_entree TEXT NOT NULL UNIQUE,
  horodate_le TIMESTAMPTZ NOT NULL DEFAULT now(),
  ancrage JSONB
);
REVOKE UPDATE, DELETE ON enregistrement_preuve FROM application_role;  -- INV-PR1

-- ─── outbox transactionnel ───────────────────────────────────────────
CREATE TABLE outbox (
  id BIGSERIAL PRIMARY KEY,
  agregat TEXT NOT NULL, agregat_id TEXT NOT NULL,
  type_evenement TEXT NOT NULL, charge JSONB NOT NULL,
  cree_le TIMESTAMPTZ NOT NULL DEFAULT now(),
  publie_le TIMESTAMPTZ
);
CREATE INDEX ON outbox (cree_le) WHERE publie_le IS NULL;
```

**Points de vérification du modèle**

- L'absence de colonne `etat_de_validite` est délibérée et doit être vérifiée à chaque revue de schéma : c'est l'erreur que le modèle rendra tentante à chaque optimisation de requête.
- L'absence de clé étrangère entre `version_publiee.instantane_habilitation` et `habilitation` est également délibérée (INV-P13). Une revue de base la signalera comme une anomalie de normalisation : elle n'en est pas une.
- Les `REVOKE UPDATE, DELETE` matérialisent l'immuabilité au niveau du moteur, pas seulement du code.

---

# 9. Découpage modulaire

```text
/internal
  /habilitation
    /domain        organisation.go  habilitation.go  canal.go
                   vo.go  evenements.go  erreurs.go  invariants_test.go
    /app           commandes.go  requetes.go  politiques.go
    /adapters      /postgres  /http  /projection
  /publication
    /domain        publication.go  version.go  brouillon.go
                   validite.go            ← fonction pure, ADR-005
                   canonicalisation.go    ← JCS v1, point 5.1
                   vo.go  evenements.go  invariants_test.go
    /app           commandes.go  requetes.go  politiques.go
    /adapters      /postgres  /http  /stockage  /projection
  /preuve
    /domain        enregistrement.go  chaine.go  verification.go
    /adapters      /postgres  /ancrage
  /diffusion
    /domain        representation.go  quota.go
    /adapters      /sms  /ivr  /email  /relais_social  /bulletin_radio   ← un ACL par canal
  /recherche       projection + requêtes (reconstructible)
  /suivi           périmètre déclaré, boîte de réception (tri déterministe)
  /shared
    /identifiant   canonique.go  codecourt.go   ← Crockford + contrôle, point 4.6
    /resolveur     résolution identifiant → état  (déployable séparément, ADR-002)
    /outbox        écriture transactionnelle + relais
    /audit         journal applicatif append-only
    /oidc          contrat d'authentification (ADR-013)
```

**Règles de dépendance, vérifiables automatiquement :**

1. `domain` ne dépend d'aucun paquet `adapters`, d'aucun paquet d'un autre contexte, et d'aucune bibliothèque d'infrastructure.
2. `publication/domain` ne dépend pas de `habilitation/domain` : il ne connaît que le type `InstantaneDHabilitation`, défini dans `shared` ou dupliqué volontairement (Published Language).
3. Aucun paquet ne dépend de `diffusion` ; `diffusion` s'abonne.
4. `shared/resolveur` ne dépend d'aucun contexte : il lit une table de résolution alimentée par projection (ADR-002).

Ces règles sont testables par un test d'architecture qui échoue à la compilation du build, pas par une convention orale.

---

# 10. Ce que ce modèle ne traite pas encore

Honnêteté du périmètre — ces points sont ouverts et ne doivent pas être présumés résolus :

| Point ouvert | Pourquoi il est différé | Quand le trancher |
|---|---|---|
| **Fusion et scission d'organisations** | Le cas réel (fusion de deux UFR, transfert d'une direction d'un ministère à un autre) impose des règles de reprise de l'historique des publications qui demandent une observation de terrain | Avant l'ouverture à un deuxième secteur (H2) |
| **Modèle de quota d'alertes** | Le paramétrage (combien, par quelle période, avec quel recours) est un choix de gouvernance, pas de technique | Avec la convention d'ancrage |
| **Multilinguisme du contenu principal** | Le modèle prévoit `langues[]` dans la portée et des représentations traduites, mais pas de version multilingue d'une même publication | Après mesure de l'usage IVR en H1 |
| **Format d'échange d'ingestion** (modes `PUSH` / `PULL`) | Doit être négocié avec un SI institutionnel réel, pas conçu en chambre | Au premier connecteur (H2) |
| **Modèle de délégation inter-organisations** | Une tutelle publiant au nom d'un établissement sous tutelle : cas réel, mais règles d'imputation à clarifier | Avant H2 |
| **Politique de rétention des pièces jointes volumineuses** | Dépend du coût de stockage réel constaté | Après six mois d'exploitation |
| **Choix de l'autorité de certification pour N3** | Dépend de l'écosystème PKI national disponible | Avant H2 |
