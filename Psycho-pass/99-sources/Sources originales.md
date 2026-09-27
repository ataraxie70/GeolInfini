---
projet: "Psycho-pass"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — aucun document n'est opposable"
empreinte: "d59842fde258eb35eabbead1517bd59369f1c83972fd1b9a06623c15f705c7ef"
cree_le: 2026-09-09
tags:
  - Psycho-pass
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `Psycho-pass` dans le coffre, conservé **sans modification**. En cas de doute sur une note de travail du projet, ces fichiers font foi sur ce qui a été écrit — jamais sur ce qui est décidé.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils sont conservés parce qu'ils portent un travail réel, et parce que la reprise de `Psycho-pass` s'appuie sur eux comme **référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-059` au [[Psycho-pass/90-pilotage/Journal des décisions|Journal des décisions]].
>
> Ce dossier déroge sur un point à la règle 4 énoncée pour les autres projets — *« ne contient que des originaux dont une version de travail existe ailleurs »*. Ici, la version de travail **n'existe pas encore** : elle est à construire. La dérogation est temporaire et nommée.

---

## 1. Inventaire

| Emplacement | Fichiers | Volume | Nature |
| --- | --- | --- | --- |
| `prod-docs/` | 15 | 260 Ko | Documentation de conception. Quatre cahiers des charges dont un en PDF, cinq RFC, deux documents de règles obligatoires, un backlog technique, une note de déroulement, un fichier d'index |
| `prompt-pack/` | 8 | 44 Ko | Sept consignes de génération numérotées, du socle technique à la qualité, plus leur recueil |
| `pack-pedagogique/` | 11 | 52 Ko | Onze documents numérotés de `00` à `10`, adressés à un développeur débutant : lexique, vision, outillage, arborescence, base de données, backend, frontend, tests, déploiement, rituels d'équipe |
| `Psycho-pass.zip` | 1 | 115 Ko | Archive d'un état antérieur de `prod-docs`, ouverte et comparée — voir point 3 |
| `pack-pedagogique.zip` | 1 | 17 Ko | Archive du pack pédagogique |
| `README-monorepo.md`, `SECURITY-monorepo.md` | 2 | 2 Ko | Fichiers d'entrée du dépôt de code, récupérés avant la sortie de celui-ci |
| **Total** | **38** | **381 Ko** | |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié :

```
d59842fde258eb35eabbead1517bd59369f1c83972fd1b9a06623c15f705c7ef
```

Toute altération d'un fichier ou d'un nom de fichier modifie cette empreinte.

**Périmètre du calcul** : les 38 fichiers du corpus hérité listés au tableau ci-dessus. La présente note, qui réside dans le même dossier, en est **exclue** — elle est une note de travail, non une source. Un recalcul qui l'inclurait produirait une valeur différente sans qu'aucune source ait été touchée.

> [!note] Un nom de fichier défectueux est conservé tel quel
> `prompt-pack/4-Prompt moteur de test&scoring.d` porte une extension tronquée : `.d` au lieu de `.md`. Obsidian ne l'affiche donc pas comme une note. Le défaut est **consigné et non corrigé** : renommer un fichier de ce dossier modifierait l'empreinte et romprait la garantie d'identité à la source. Le fichier reste lisible par tout éditeur de texte.

---

## 2. Chronologie — deux séances, un arrêt

| Séance | Fenêtre | Ce qui y est produit |
| --- | --- | --- |
| **1** | 2026-05-15, **12 h 51 → 18 h 04** | Le cahier des charges fonctionnel, puis les RFC de 13 h 05 à 13 h 35, les règles obligatoires à 13 h 29 et 13 h 30, l'archive à 13 h 41, les consignes de génération de 13 h 52 à 14 h 53, le pack pédagogique à 14 h 58, la révision de la documentation à 15 h 22, le socle technique à partir de 15 h 27, et le schéma de données à 18 h 04 |
| **2** | 2026-05-16, **17 h 16 → 18 h 05** | Les modules d'accès aux données et de gestion des utilisateurs. Le travail s'interrompt là |

> [!danger] La seconde séance produit quatre fichiers que l'application ne peut pas charger
> Les modules écrits le 2026-05-16 sont placés à `apps/backend/apps/backend/src/`, chemin **doublement imbriqué**, et `UsersModule` n'est importé par aucun module de l'application. Le dépôt Git ne porte **aucun commit**.
> Faits `F1` à `F4` du [[Psycho-pass/90-pilotage/Registre des statuts|Registre des statuts]]. Leur interprétation n'est pas établie et fait l'objet du lot `L0` du programme d'études.

Le code, ses dépendances, ses sorties de compilation, son outillage et son fichier d'environnement ont été **déplacés hors du coffre** vers `Incubo/_hors-coffre/psycho-pass/`, sans suppression — `DEC-C-058`. Le comptage avant et après établit la conservation : **253 fichiers de part et d'autre**.

---

## 3. L'archive est un état antérieur strict, et non une variante

`Psycho-pass.zip`, produite le 2026-05-15 à 13 h 41, a été ouverte et comparée par empreinte à `prod-docs`, fichier à fichier.

| Résultat | Nombre |
| --- | --- |
| Fichiers identiques | 7 |
| Fichiers divergents | 6 |
| Fichiers présents **seulement dans l'archive** | **0** |
| Fichiers présents seulement dans `prod-docs` | 2 — le fichier d'index et la note de déroulement |

Les six divergences ne sont pas de mise en forme. Elles **resserrent des choix** laissés ouverts, et vont toutes dans le même sens.

| Fichier | Dans l'archive, à 13 h 41 | Dans `prod-docs`, à 15 h 22 |
| --- | --- | --- |
| `cdc/psycho_pass_cahier_des_charges_mvp.md` | *« Node.js avec Express ou NestJS »* | *« NestJS avec Node.js et TypeScript »* |
| `rfc/RFC-001 — Vision Technique…` | *« NestJS (préféré) »* | *« NestJS »* |
| `rfc/RFC-001 — Vision Technique…` | `POST /api/v1/tests/answer` | `POST /api/v1/tests/:id/answer` |

**`prod-docs` fait donc référence.** L'archive est conservée parce qu'elle documente l'état où les choix étaient encore ouverts — information qu'aucun autre fichier ne porte.

---

## 4. Ce que le corpus établit, et ce qu'il ne prouve pas

**Établi** : une conception détaillée existe. Un périmètre de produit minimal délimité, six familles d'épreuves, un schéma de données cohérent, une séparation nette des responsabilités entre interface et service, un principe de sécurité motivé — *le frontend affiche, le backend décide* — et un appareil de qualité complet.

**Non prouvé** : que quiconque ait ce problème sous cette forme, qu'un acteur ne l'occupe pas déjà, que la fonction distinctive revendiquée soit atteignable, et d'où viennent les questions. Le corpus ne cite **aucune enquête, aucune mesure, aucun entretien, aucun état de l'art, aucune source psychométrique**.

> [!danger] Le corpus établit un ordre de priorité qu'il n'a pas le pouvoir d'établir
> `README-monorepo.md` énonce : *« En cas de conflit documentaire, l'ordre de priorité est : `must/`, `rfc/`, `backlog/`, `cdc/`, `prompt-pack/` »*. Le `RFC-001` porte de son côté la mention *« décisions structurantes du projet »*.
> La règle `DEC-C-014`, opposable à tout le coffre, pose qu'**aucun statut interne à un document ne vaut décision de projet** : une mention portée à l'intérieur d'un texte qualifie l'état de ce texte, jamais l'état du projet.
> Cet ordre de priorité est donc **classé proposé**, et aucune décision `DEC-P-` n'est inscrite. Il conserve une valeur documentaire : il indique dans quel ordre l'auteur voulait que ses propres textes soient lus.

---

## 5. Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver une architecture, un schéma de données ou un backlog ne rend rien décidé.
3. **Toute citation du corpus porte son chemin.** Une affirmation reprise indique le fichier source, afin qu'un lecteur puisse distinguer ce qui a été retenu de ce qui a été écarté.
4. **Un fichier n'a pas été ouvert** — `prod-docs/cdc/CAHIER DES CHARGES FONCTIONNEL ET TECHNIQUE.pdf`. Sa version Markdown de même titre a seule été lue. Le PDF est versé en l'état et empreinté ; l'identité des deux versions n'est pas vérifiée.
