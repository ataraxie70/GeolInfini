---
projet: "INPC-BF"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec son empreinte et le relevé de son incomplétude"
statut_du_corpus: "Référence — aucun document n'est opposable, et trois documents fondateurs manquent"
empreinte: "d9850b3d5ba385af6e1b564ed059cf050f1442862b886c88b6c9894009220b9a"
cree_le: 2026-09-09
tags:
  - INPC-BF
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée d'`INPC-BF` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-066` au [[INPC-BF/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Emplacement | Fichiers | Nature |
| --- | --- | --- |
| `files.zip` | 1 | L'archive d'origine, **intacte**. Elle fait foi sur ce qui a été versé |
| `documents/` | 14 | Le contenu extrait |
| **Total** | **15** | **271 Ko** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
d9850b3d5ba385af6e1b564ed059cf050f1442862b886c88b6c9894009220b9a
```

### 1.1. Les quatorze documents versés

| Groupe | Documents |
| --- | --- |
| **Chartes** | Gouvernance et éthique de la collecte · Ancrage institutionnel |
| **Ontologie**, six parties | Fondements · Entités · Relations · Cohérence · Scénarios · Évolutivité |
| **Série architecture logicielle** | Cartographie stratégique — contextes bornés et carte de contexte *(document 1)* · Patrimoine et connaissance · Gouvernance et validation · Consentement et droits · Accès |
| **Audit** | Audit de vision |

---

## 2. Le corpus est incomplet, et c'est le fait le plus important de ce registre

> [!danger] Trois documents fondateurs sont absents de l'archive
> Le document 1 de la série d'architecture énumère les fondations du projet : *« Onze documents ont construit les fondations conceptuelles du projet : la vision, le référentiel conceptuel, la taxonomie, la gouvernance, l'ontologie en six parties, l'ancrage institutionnel. »*
>
> L'archive en contient **huit** : la gouvernance, l'ontologie en six parties, l'ancrage institutionnel.
> Manquent la **charte fondatrice** — la vision —, le **référentiel conceptuel** — la définition des objets de pensée — et la **taxonomie** — leur classification.

| Document absent | Occurrences dans les documents présents |
| --- | --- |
| Taxonomie | **34** |
| Référentiel conceptuel | **33** |
| Charte fondatrice | **17** |

Le corpus versé est donc **une ontologie sans son référentiel** — elle formalise les relations entre des objets qu'aucun document présent ne définit — et **une architecture sans sa vision**.

**Ce que cette absence interdit.** Toute reprise de l'intention sur sources directes. Le [[INPC-BF/00-intention/Document fondateur d'intention|Document fondateur d'intention]] est écrit sous réserve expresse et signale, point par point, ce qui provient d'une source directe et ce qui provient d'une citation de seconde main.

**Ce qu'elle n'établit pas.** Que ces documents n'existent pas : ils ont manifestement été écrits, puisque le corpus les cite abondamment et précisément. Ils ne sont simplement pas dans l'archive versée au coffre.

---

## 3. La chronologie interne est perdue

L'extraction de l'archive restitue des horodatages **tous identiques** — 2026-08-07 à 14 h 13. L'ordre de production des quatorze documents ne peut donc pas être établi par leurs dates.

Il n'est connu que par deux indices internes, tous deux fiables mais partiels : la **numérotation** de la série d'architecture, de 1 à 5, et les **renvois** que les documents se font entre eux — la charte de gouvernance déclarant par exemple venir après la charte fondatrice, le référentiel et la taxonomie, et avant l'ontologie.

---

## 4. Ce que le corpus fait remarquablement, et ce qu'il laisse

**Remarquablement.** Il tient la **séparation stricte du patrimoine et de la technologie** sur ses onze documents de fondation, sans qu'aucun nom d'outil, de format ou de technologie ne s'y glisse — et il annonce explicitement la rupture de cette discipline lorsqu'il passe à l'architecture. Il contient **son propre audit critique**, qui relève six manques structurels sans les enrober. Et il pose que la **gouvernance précède l'ontologie**, ce qui est le bon ordre.

**Ce qu'il laisse.** Trois des six manques relevés par son audit sont restés sans réponse, dont l'alignement sur les référentiels patrimoniaux internationaux.

> [!warning] Les cadres internationaux nommés par l'audit ne figurent nulle part ailleurs
> Le consentement libre, préalable et éclairé, la norme **CIDOC-CRM** (ISO 21127), le **Dublin Core**, les cinq domaines de la **Convention UNESCO de 2003** sur le patrimoine culturel immatériel et le modèle **FRBR/RDA** sont recommandés par l'audit et **n'apparaissent dans aucun autre document du corpus**.
> L'objectif affiché du projet étant qu'un musée, une université ou un laboratoire puisse employer sa taxonomie indépendamment de la plateforme, l'absence de langage commun avec les institutions patrimoniales existantes est un écart entre l'ambition et le travail.

---

## 5. Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver une ontologie, des contextes bornés ou des modèles tactiques ne rend rien décidé.
3. **L'archive fait foi.** En cas de doute sur un fichier extrait, `files.zip` est la référence.
4. **Toute citation porte son chemin**, et indique si elle provient d'une source directe ou d'une citation de seconde main.
5. **L'incomplétude se signale à chaque emprunt.** Une affirmation reprise d'un document absent doit dire de quel document présent la citation provient.
