---
projet: "checkme"
type: "document-de-conception"
phase: "50-architecture"
objet: "Parcours citoyen et back-office organisme, états d'écran et principes d'interface"
statut_documentaire: "Historique — V0.1 Draft, antérieur à l'audit"
designation_historique: "Document 8 — UX/UI"
provenance: "files/Document_8_UX_UI.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - architecture
  - ux
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

> [!warning] Les maquettes que ce document annonce n'existent plus
> Les trois maquettes HTML produites à sa suite ont été supprimées du coffre le 2026-09-06 (`DEC-C-019`). Leurs empreintes et ce qu'elles couvraient sont consignés au point 3 de [[checkme/99-sources/Sources originales|Sources originales]].

Document 8 — UX/UI

Version : 0.1 (Draft)

Statut : Document de conception — dépend de Document 0 (Vision), Document 3 (DDD Tactique), Document 5 (API & Contrats), Document 6 (Sécurité)

---

## 0. Cadrage

Ce document traduit les contrats de Document 5 et les états de Document 3 en parcours concrets, pour les deux publics de checkMe : le **citoyen** (interface publique, non authentifiée par défaut) et l'**administrateur d'organisme** (back-office authentifié). Il précède la production de maquettes HTML fidèles — c'est le dernier document du plan initial de Document 0 avant le passage au code.

---

## 1. Principes UX directeurs

Chaque principe découle directement d'une décision déjà actée dans les documents précédents — l'UX ne doit jamais la contredire.

| Principe | Origine |
|---|---|
| **Aucune barrière avant la première recherche** — pas de compte, pas d'écran d'accueil publicitaire à traverser. | Document 1, point 0.1 |
| **Poids minimal** — la page de recherche doit rester utilisable sur une connexion lente, sans dépendre de bibliothèques lourdes. | Document 2, AP-5 |
| **Neutralité de présentation** — l'interface affiche exactement ce que l'organisme a désigné comme `affichable` (Document 3 point 3.1), jamais une interprétation ou une mise en scène du résultat (pas de "Félicitations !" généré par checkMe — ce choix appartient à l'organisme via ses propres champs). | Document 0, point 6.1 |
| **Ambiguïté et absence de résultat traitées avec le même soin qu'un succès** — ce sont des cas fréquents, pas des erreurs à minimiser visuellement. | Document 3, point 3.5 ; Document 5, point 2.2 |
| **Friction invisible par défaut** — toute mesure de protection (rate-limiting, défi) ne doit apparaître qu'en cas de comportement suspect réel, jamais systématiquement. | Document 6, point 1 |
| **Compte citoyen proposé après, jamais avant** — présenté comme un service optionnel une fois qu'un résultat a été obtenu, jamais en préalable. | Document 1, point 2.7 |

---

## 2. Parcours Citoyen

### 2.1 Point d'entrée — deux chemins d'accès

La majorité des citoyens arrivent par un **lien direct** vers une publication précise, communiqué par l'organisme lui-même (affiche, radio, réseaux sociaux — canaux hors du contrôle de checkMe). Un second chemin, secondaire, doit exister pour les citoyens sans lien direct :

- **Chemin principal** : `checkme.bf/p/{publicationId}` → directement l'écran de recherche (point 2.2), sans détour par une page d'accueil générique.
- **Chemin secondaire** : page d'accueil listant/recherchant les publications publiques par organisme/catégorie, pour qui n'a pas de lien direct.

### 2.2 Écran de recherche

Généré dynamiquement à partir de `GET /v1/publications/{id}` (Document 5 point 2.1) : un champ par type d'identifiant listé dans `identifiantsAttendus`, jamais codé en dur par organisme.

```
┌─────────────────────────────────────────┐
│  Ministère de la Fonction Publique       │
│  Concours direct — Session 2026          │
├─────────────────────────────────────────┤
│  Retrouvez votre situation               │
│                                           │
│  Numéro CNIB                             │
│  [_____________________________]         │
│                                           │
│  ou Numéro de récépissé                  │
│  [_____________________________]         │
│                                           │
│           [   Rechercher   ]             │
└─────────────────────────────────────────┘
```

- Un seul champ suffit pour lancer la recherche (Document 3 point 3.3 — le service choisit le critère de plus haute confiance parmi ceux remplis).
- Aucun champ marqué "obligatoire" par défaut dans l'UI au-delà de la règle métier déjà définie dans `Modele` — l'interface ne réinvente pas de contrainte.

### 2.3 États de résultat

| État API (Document 5) | Traitement UX |
|---|---|
| `trouve` | Affichage des `champs` de `situation`, dans l'ordre défini par l'organisme, sans mise en forme dramatisée. Bouton discret "Enregistrer cette recherche" → proposition de compte citoyen (point 2.5), jamais avant. |
| `ambigu` | Message clair et neutre : *"Plusieurs situations correspondent à cette information. Merci de vérifier votre saisie ou d'ajouter un second identifiant."* — jamais de nombre de correspondances (Document 5 point 2.2), jamais de ton culpabilisant. |
| `aucun` | Message clair : *"Aucune situation ne correspond à cette information pour cette publication."* + rappel de vérifier la saisie + coordonnées de contact de l'organisme (si fournies dans `Modele`). |
| `410 PUBLICATION_NON_PUBLIQUE` | Écran neutre : *"Cette publication n'est pas encore disponible."* — jamais l'état technique brut (`brouillon`/`archivee`) affiché au citoyen. |

### 2.4 Friction progressive (rate-limiting, SEC-03/SEC-04)

Au-delà du seuil de tentatives sur un couple (IP, publication) : un écran intermédiaire léger, formulé sans accusation — *"Merci de patienter quelques instants avant de réessayer."* — jamais de mention explicite de détection de fraude, qui inquiéterait inutilement un citoyen légitime ayant simplement fait plusieurs fautes de frappe.

### 2.5 Compte citoyen (optionnel)

Jamais présenté avant une recherche. Proposé uniquement :
- après un résultat `trouve`, pour retrouver l'historique plus tard ;
- de façon dissociable — un citoyen peut ignorer la proposition indéfiniment sans jamais perdre l'accès à la fonction de recherche elle-même (Document 1, invariant point 5.6).

---

## 3. Parcours Back-office organisme

### 3.1 Création d'une publication

Formulaire en plusieurs étapes, reflétant l'agrégat `Publication` (Document 3 point 2.1) :
1. Catégorie / Session
2. Définition du `Modele` : ajout de champs (nom, type, `affichable` oui/non), puis ajout d'identifiants avec **ordre de priorité explicite** (interface de type liste réordonnable — glisser-déposer — pour fixer `niveauConfiance` sans jamais demander à l'admin de saisir un nombre abstrait).
3. Aperçu avant sauvegarde en `brouillon`.

**Avertissement explicite avant publication** : *"Une fois publiée, la structure des champs et identifiants ne pourra plus être réduite — seulement complétée."* — traduction directe de l'invariant Document 3 point 2.1.3, affichée au moment décisif plutôt qu'enfouie dans une documentation.

### 3.2 Import de données

- Upload de fichier **ou** configuration d'un connecteur (Document 3 point 5.3).
- Étape de **mapping visuel** : colonnes détectées dans le fichier à gauche, champs du `Modele` à droite, association par glisser-déposer ou sélection.
- Aperçu des 5 premières lignes mappées avant validation, pour détecter une erreur de correspondance avant l'import complet.

### 3.3 Suivi d'un import

Écran de statut (`GET /v1/imports/{id}`, Document 5 point 3.2), avec :
- compteurs `lignesTraitees` / `lignesEnErreur` en évidence ;
- liste des `erreursConformite` (ligne, champ, raison) directement exploitable, triable par colonne ;
- si `partiellementValide` : bouton **"Appliquer les lignes valides"** avec confirmation explicite du nombre de lignes qui seront ignorées — jamais d'application automatique silencieuse (Document 3 point 5.2, invariant 3).

### 3.4 Gestion des accès (IAM Organismes)

Écran simple d'invitation d'administrateurs supplémentaires au sein du même `organismeId`, gestion de rôle minimale (Document 6 point 3.2) — pas de matrice de permissions complexe à ce stade, cohérent avec un RBAC volontairement minimal.

---

## 4. Registre des messages système (extrait)

Un seul endroit référence tous les messages utilisateur, pour garantir cohérence de ton et faciliter une future traduction :

| Code (Document 5) | Message citoyen |
|---|---|
| `PUBLICATION_INTROUVABLE` | "Cette publication n'existe pas ou n'est plus disponible." |
| `PUBLICATION_NON_PUBLIQUE` | "Cette publication n'est pas encore disponible." |
| `CRITERE_INVALIDE` | "Ce type d'identifiant n'est pas utilisé pour cette publication." |
| `MODELE_NON_RETROGRADABLE` | (back-office) "Vous ne pouvez pas retirer un champ déjà utilisé — vous pouvez seulement en ajouter." |
| `MAPPING_INCOMPLET` | (back-office) "Certains champs obligatoires de votre modèle ne sont associés à aucune colonne du fichier." |

---

## 5. Contraintes locales et accessibilité

- **Bande passante** : aucune image lourde sur l'écran de recherche/résultat ; polices système plutôt que polices web chargées à distance (cohérent avec AP-5).
- **Petits écrans en priorité** : conception mobile-first, boutons larges, formulaire à un seul champ visible à la fois si nécessaire sur les très petits écrans.
- **Littératie numérique variable** : vocabulaire simple, pas de jargon technique ("erreur 404" → jamais visible côté citoyen ; message humain systématique, cf. point 4).
- **Langue** : français comme langue de départ (cohérent avec le contexte francophone du projet) ; l'architecture des messages (point 4, registre centralisé) est pensée pour ne pas bloquer une future traduction en langues locales, sans que ce soit dans le périmètre du MVP.

---

## 6. Prochaines étapes

- **Maquettes HTML fidèles** — écran de recherche citoyen, écran de résultat (3 états), écran de création de publication, écran de suivi d'import — en suivant la même discipline que pour levelUP (palette, grille, cohérence visuelle) mais avec un système visuel propre à checkMe, à définir.
- **Démarrage du développement** — une fois les maquettes validées, le monolithe modulaire (Document 4) peut être initialisé module par module, en commençant par `publications` et `consultation` (les deux contextes déjà modélisés en détail depuis Document 3).

Avec ce document, les huit piliers annoncés en Document 0 sont couverts : Vision, DDD Stratégique, Architecture (TOGAF), DDD Tactique, Architecture Logicielle, API & Contrats, Sécurité, Base de Données, UX/UI.
