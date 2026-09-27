---
projet: "maSecure"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et ses empreintes"
statut_du_corpus: "Référence — aucun document n'est opposable"
cree_le: 2026-09-09
tags:
  - maSecure
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `maSecure` dans le coffre, conservé **sans modification**. En cas de doute sur une note de travail du projet, ces fichiers font foi sur ce qui a été écrit — jamais sur ce qui est décidé.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils sont conservés parce qu'ils portent un travail réel, et parce que la reprise de `maSecure` s'appuie sur eux comme **référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-055` au [[maSecure/90-pilotage/Journal des décisions|Journal des décisions]].
>
> Ce dossier déroge sur un point à la règle 4 énoncée pour les autres projets — *« ne contient que des originaux dont une version de travail existe ailleurs »*. Ici, la version de travail **n'existe pas encore** : elle est à construire. La dérogation est temporaire et nommée.

---

## 1. Inventaire

| Emplacement | Fichiers | Volume | Nature |
| --- | --- | --- | --- |
| `prod-docs/` | 20 | 244 Ko | **Première passe.** Quatre analyses de formalisation de l'idée, quatre versions de la charte de fonctionnement, puis douze livrables — cahiers des charges, ERD, RBAC, architecture C4, workflows, catalogue d'API, UX, stratégie de sécurité. Contient trois fichiers `.docx` |
| `workdir/` | 11 | 44 Ko | **Deuxième passe.** Neuf dossiers numérotés de `00_analysis` à `08_ops_plan`, refaisant les mêmes objets sous une autre forme |
| `analyses_conception/` | 8 | 43 Ko | **Troisième passe.** Huit analyses numérotées, des exigences métier à la feuille de route d'implémentation |
| `Archive.zip` | 1 | 200 Ko | Archive non ouverte, versée en l'état |
| `2df3cc03-….pdf` | 1 | 84 Ko | Document PDF au nom d'identifiant technique, sans titre lisible |
| **Total** | **41** | **616 Ko** | |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié :

```
5991ff2ea70938d58b48da1a80a0d0a7ccc1dcf7fde20c68f488e5e71226f84c
```

Toute altération d'un fichier ou d'un nom de fichier modifie cette empreinte.

---

## 2. Le corpus n'est pas fait de trois versions parallèles : ce sont trois passes successives

L'hypothèse initiale était celle de trois corpus concurrents, comme les trois copies rencontrées sur `levelup`. **La comparaison l'infirme** : aucun doublon strict, et les horodatages établissent une **succession**, non une concurrence.

| Passe | Dossier | Fenêtre | Ce qui y est produit |
| --- | --- | --- | --- |
| **1** | `prod-docs/` | 2026-06-09, **07 h 26 → 10 h 14** | L'idée est formalisée en quatre analyses, la charte est écrite en quatre versions successives, puis douze livrables de conception sont produits |
| **2** | `workdir/` | 2026-06-09, **10 h 27 → 12 h 41**, plus un fichier le 2026-06-10 à 13 h 42 | Les mêmes objets sont refaits : API, UX, tests, déploiement, exploitation, exigences, architecture, modèle de données, workflows, sécurité |
| **3** | `analyses_conception/` | 2026-06-09, **12 h 50 → 14 h 05** | Une troisième reprise : exigences métier, sécurité et finance, bonnes pratiques, points ambigus, architecture, API et rôles, scénarios de recette, feuille de route |

> **L'ensemble du corpus a été produit en sept heures**, le 9 juin 2026, plus un fichier isolé le lendemain.

### 2.1. Les quatre versions de la charte se succèdent en quatorze minutes

| Fichier | Horodatage | Taille |
| --- | --- | --- |
| `charte_fonctionnement_v_1_tontine_securisee.md` | 09 h 05 | 11 231 o |
| `charte_fonctionnement_v_1_tontine_securisee2.md` | 09 h 13 | 15 195 o |
| `charte_fonctionnement_v_1_tontine_securisee_3.md` | 09 h 19 | 20 563 o |
| **`charte_fonctionnement_v_1_tontine_securisee_4.md`** | **09 h 19** | **31 348 o** |

Croissance monotone en date et en taille. **La version 4 est la plus récente et la plus complète** ; c'est elle qui fait référence en cas de divergence. Les trois précédentes sont conservées : elles documentent la construction de la règle, non son état final.

### 2.2. Recouvrement thématique entre les trois passes

Huit sujets sont traités par plus d'une passe.

| Sujet | Passes qui le traitent |
| --- | --- |
| Architecture | Les trois |
| Catalogue d'API | Les trois |
| UX et interfaces | Les trois |
| Stratégie de sécurité | Les trois |
| Workflows métier | `prod-docs`, `workdir` |
| Modèle de données | `prod-docs`, `workdir` |
| Rôles et permissions | `prod-docs`, `analyses_conception` |
| Tests et recette | `workdir`, `analyses_conception` |

**Aucune des trois passes n'est un sur-ensemble des deux autres.** En cas de divergence sur un sujet, la passe la plus tardive ne fait pas automatiquement autorité : le corpus n'étant opposable en rien, la divergence se tranche par réinstruction, non par ancienneté.

---

## 3. Ce que le corpus établit, et ce qu'il ne prouve pas

**Établi** : une conception détaillée existe. Séparation de la garde des fonds, de la logique de gestion et du droit de décision. Automate d'état des membres, fonds de recouvrement, gouvernance par vote, registre en ajout seul, traitement du décès d'un membre, gestion des frais de transfert.

**Non prouvé** : que quiconque ait ce problème sous cette forme, que la solution proposée soit licite, et qu'un acteur ne l'occupe pas déjà. Le corpus ne cite **aucune enquête, aucune mesure, aucun entretien, aucun état de l'art, aucun texte réglementaire**.

> [!danger] Le corpus déclare des décisions qu'il n'a pas le pouvoir de prendre
> Un document de la troisième passe énonce : *« Ces résolutions annulent et remplacent les interrogations précédentes, **figeant les spécifications métier** de la plateforme »*, sous un tableau intitulé *« Récapitulatif des Décisions Métier »*.
> La règle `DEC-C-014`, opposable à tout le coffre, pose qu'**aucun statut interne à un document ne vaut décision de projet** : une mention portée à l'intérieur d'un texte qualifie l'état de ce texte, jamais l'état du projet.
> Ces « décisions métier validées » sont donc classées **proposées**, et aucune n'est inscrite au registre `DEC-P-`.

---

## 4. Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver une architecture, un catalogue d'API ou une matrice de rôles ne rend rien décidé.
3. **Toute citation du corpus porte son chemin et sa passe.** Une affirmation reprise indique le fichier source et laquelle des trois passes le produit, afin qu'un lecteur puisse distinguer ce qui a été retenu de ce qui a été écarté.
4. **Deux fichiers n'ont pas été ouverts** — l'archive `.zip` et le `.pdf` au nom d'identifiant technique. Ils sont versés en l'état et empreintés ; leur contenu reste à instruire.
