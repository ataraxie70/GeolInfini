---
projet: "levelup"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa provenance et ses empreintes"
statut_du_corpus: "Référence — aucun document n'est opposable"
cree_le: 2026-09-08
tags:
  - levelup
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `levelup` dans le coffre, conservé **sans modification**. En cas de doute sur une note de travail du projet, ce sont ces fichiers qui font foi sur ce qui a été écrit — jamais sur ce qui est décidé.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils sont conservés parce qu'ils portent un travail réel, et parce que la reprise de `levelup` s'appuie sur eux comme **référence**. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie. Voir `DEC-C-038` au [[levelup/90-pilotage/Journal des décisions|Journal des décisions]].
>
> Ce dossier déroge sur un point à la règle 4 énoncée pour les autres projets — *« ne contient que des originaux dont une version de travail existe ailleurs »*. Ici, la version de travail **n'existe pas encore** : elle est à construire. La dérogation est temporaire et nommée.

---

## Inventaire

| Emplacement | Fichiers | Volume | Nature |
| --- | --- | --- | --- |
| `corpus-architecture/` | 112 | 1 446 Ko | **Corpus de référence.** Architecture d'entreprise complète : Foundation, Business Architecture, DDD stratégique, quatre paysages de contextes, Shared Kernel, architecture d'intégration, UX/UI, brouillons de discussion |
| `essai-de-developpement/` | 86 | 708 Ko | Documentation d'un essai de développement : spécifications, workflow, audits, contenus pédagogiques de référence |
| `brainstorming/` | 92 | 793 Ko | Travaux exploratoires antérieurs à l'architecture |
| `variantes-du-corpus/` | 3 | 33 Ko | Fichiers divergents récupérés de deux copies redondantes — voir ci-dessous |
| `depot-de-developpement/` | 7 | 26 Ko | Documentation extraite du dépôt de code sorti du coffre |
| `00_architecture_foundation_dossier.md` | 1 | 29 Ko | Dossier de fondation isolé, à la racine du dossier d'origine |
| `LevelUP-Frontend-Technical-Documentation.md` | 1 | 22 Ko | Documentation technique frontale, isolée |
| `ui_ux_integration_report.md` | 1 | 3 Ko | Rapport d'intégration UX/UI, isolé |
| **Total** | **303** | **3 060 Ko** | |

**Empreinte d'ensemble de `corpus-architecture/`** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié :

```
bac2188944cfa35819d407f09b3b75aef6cd7b90142543c5c2b20f4e55b3098f
```

Toute altération d'un fichier ou d'un nom de fichier du corpus de référence modifie cette empreinte.

---

## Le corpus existait en trois exemplaires

Trois arborescences concurrentes coexistaient : `levelUP_architecture/` (112 fichiers), `levelUP_architecture copie/` (62 fichiers) et `levelUP_architecture.bat/` (51 fichiers). Une comparaison par empreinte, fichier à fichier, a établi le résultat suivant.

| Constat | Détail |
| --- | --- |
| `levelUP_architecture/` est un **sur-ensemble** | Les 62 fichiers de `copie` et les 51 fichiers de `.bat` s'y retrouvent à l'identique, à quatre exceptions près |
| Seule cette copie porte cinq familles de documents | UX/UI, *data*, *technology*, *experience* et *solution* landscapes, ainsi que le glossaire métier `11-Business-Glossary-Global.md` |
| `.bat` porte des noms de fichiers corrompus | `03'-Pfrogression-Philosophy.md`, `Shared-Kernel-Architecture-Speci.md`, `Integration-Architecture-Specifion.md` — troncatures caractéristiques d'une copie interrompue |
| Quatre fichiers seulement divergeaient | Trois ont été récupérés, un a été écarté |

### Les quatre divergences

| Fichier | Origine | Décision | Motif |
| --- | --- | --- | --- |
| `audit-de-critique-objectif.md` | `copie` | **Récupéré** → `variantes-du-corpus/Audit critique du corpus - variante copie.md` | N'existe dans aucune autre copie. Porte dix écarts identifiés et une feuille de route en cinq phases |
| `HISTORIQUE_INTERVENTION.md` | `copie` | **Récupéré** comme variante | Version tronquée à 14,7 Ko, contre 55,3 Ko dans la référence. Conservée pour mémoire, la référence faisant foi |
| `01-Context-Map.md` | `.bat` | **Récupéré** comme variante | Version **antérieure** : elle nomme *Organization Context* et *Execution Context* là où la référence dit *Program Context* et *Activity Context*, et ne connaît pas *Progress Context*. Trace datable d'un renommage de contextes bornés |
| `.audit-de-critique-objectif.md.kate-swp` | `copie` | **Écarté** | Fichier d'échange d'éditeur, sans contenu documentaire |

Les deux copies redondantes ont été **sorties du coffre**, non détruites, vers `Incubo/_hors-coffre/levelup/copies-redondantes/`. Voir `DEC-C-039`.

---

## Ce qui est sorti du coffre

Le dossier `levelup` pesait **5,6 Go pour 19 324 fichiers**. Les éléments suivants ont été déplacés vers `Incubo/_hors-coffre/levelup/`, hors de l'arborescence indexée par Obsidian. Aucune suppression n'a été faite.

| Élément sorti | Volume | Nature |
| --- | --- | --- |
| `levelUP_development/` | 5,4 Go | Dépôt de code, dont 5,2 Go de sortie de compilation Rust et 105 Mo de dépendances |
| `levelUP_essaie_developpement/` | 127 Mo | Essai de développement antérieur, dont cache de compilation frontale |
| `levelUP_development.zip` | 30 Mo | Archive du dépôt |
| `copies-redondantes/` | 1,3 Mo | Les deux copies concurrentes du corpus |
| Bibliothèques tierces et configurations d'outil | — | Copies de compétences d'agent, `.claude/`, `.codex` |

**La documentation de ces dépôts a été récupérée avant leur sortie** et figure dans `essai-de-developpement/` et `depot-de-developpement/`. Le code lui-même reste accessible hors du coffre ; il n'y est plus indexé. Voir `DEC-C-037`.

---

## Règles de ce dossier

1. **Rien ne s'édite ici.** Toute correction se fait dans une note de travail du projet, jamais dans la source.
2. **Le corpus n'est pas opposable.** Y trouver une décision, une architecture ou une spécification ne rend rien décidé. Seul le [[levelup/90-pilotage/Journal des décisions|Journal des décisions]] engage.
3. **Toute citation du corpus porte son chemin.** Une affirmation reprise dans une note de travail indique le fichier source dont elle provient, afin qu'un lecteur puisse distinguer ce qui a été retenu de ce qui a été écarté.
4. **Le corpus est daté et figé.** Son enrichissement ne passe plus par ce dossier : il passe par la reconstruction, phase par phase.
