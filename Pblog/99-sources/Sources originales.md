---
projet: "Pblog"
type: "registre-de-provenance"
phase: "99-sources"
objet: "Corpus hérité conservé comme matériau de référence, avec sa chronologie et son empreinte"
statut_du_corpus: "Référence — aucun document n'est opposable"
empreinte: "6789dea890ff23415f6298e0e97f5631f9c2f12f5ae53e5db6f38b8cd99e64a3"
cree_le: 2026-09-09
tags:
  - Pblog
  - sources
  - provenance
---

# Sources originales

Corpus produit avant l'entrée de `Pblog` dans le coffre, conservé **sans modification**.

> [!warning] Statut de ce corpus : matériau, pas autorité
> Ces documents ont été produits hors de la doctrine du coffre. Ils ne constituent ni une décision, ni un acquis, ni une phase franchie — **et le fait que le produit qu'ils décrivent existe et soit publié n'y change rien**. Voir `DEC-C-079` au [[Pblog/90-pilotage/Journal des décisions|Journal des décisions]].

---

## 1. Inventaire

| Emplacement | Entrées | Nature |
| --- | --- | --- |
| `conception-complet/architecture_foundation_dossier/` | 9 | **Dossier de fondation** — exploration de la vision, analyse du problème, carte des parties prenantes, contexte stratégique, définition du système, fondation d'architecture, carte des capacités, découverte produit, évaluation d'aptitude |
| `conception-complet/adm_lifecycle/` | 8 | **Cycle d'architecture, quatre phases** — vision et transition, modèle de processus métier et chaîne de valeur, architectures de données et applicative, plan d'infrastructure et pile technique |
| `conception-complet/prd_…md` | 1 | **Document de cadrage produit** — le plus ancien du corpus |
| `ARCHITECTURE_INDEX.md` | 1 | Index de navigation du dossier d'architecture |
| `AGENTS.md` | 1 | Consignes destinées à un agent de développement |
| `CLAUDE.md` | 1 | **Lien symbolique vers `AGENTS.md`**, créé le 2026-09-08. Ce n'est pas un document distinct |
| **Total** | **21** | **72 Ko** |

**Empreinte d'ensemble** — SHA-256 calculée sur les chemins relatifs et les contenus, dans l'ordre trié, **la présente note exclue** :

```
6789dea890ff23415f6298e0e97f5631f9c2f12f5ae53e5db6f38b8cd99e64a3
```

Le site, son dépôt de code, ses dépendances, ses sorties de construction et sa configuration d'éditeur ont été **déplacés hors du coffre** vers `Incubo/_hors-coffre/pblog/`, sans suppression — `DEC-C-078`. Le comptage avant et après établit la conservation : **247 entrées de part et d'autre**. Le dossier passe de **2,1 Mo à 152 Ko**.

---

## 2. Chronologie — trois moments, dont deux consécutifs

| Moment | Date et fenêtre | Ce qui y est produit |
| --- | --- | --- |
| **1** | **2026-04-18**, 18 h 39 | Le document de cadrage produit, seul. Aucun autre fichier ce jour-là |
| **2** | **2026-06-29**, 14 h 57 → 16 h 43 | **L'intégralité du dossier d'architecture** : les neuf documents de fondation de 14 h 57 à 15 h 41, puis le cycle d'architecture en quatre phases de 15 h 59 à 16 h 30, puis l'index à 16 h 38 et les consignes d'agent à 16 h 43 |
| **3** | **2026-06-30** | **La construction du site**, en huit enregistrements de code |

> **Le dossier d'architecture complet a été produit en une heure quarante-six**, deux mois et onze jours après le document de cadrage. Le produit a été construit le lendemain.

### 2.1. Ce que l'historique du dépôt raconte

Les huit enregistrements du 2026-06-30, dans l'ordre :

1. Mise en place initiale du point de crédibilité, avec la pile retenue et l'architecture ;
2. ajout d'un projet au portfolio ;
3. **renommage du projet en `Sankofa`**, et ajout d'un article d'analyse technique ;
4. refonte de la liste du journal ;
5. remplacement d'un diagramme en caractères par un tableau mis en forme ;
6. mise en évidence des liens de navigation actifs, nettoyage des contenus fictifs ;
7. configuration du formulaire de contact ;
8. **renommage global du site en `Sankofa Arch`**.

Le nom du produit a donc changé **deux fois en une journée**, et `Sankofa Arch` **n'apparaît dans aucun des dix-huit documents de conception** — fait `F5`.

---

## 3. Ce que le corpus établit, et ce qu'il ne prouve pas

**Établi** : une chaîne de conception complète et cohérente, du cadrage produit à la pile technique, sous un cadre d'architecture d'entreprise nommé et suivi. Une distinction utile entre moteurs stratégiques, métier et techniques. Et un produit effectivement construit et publié, ce qu'aucun autre projet du coffre ne peut montrer.

**Non prouvé** : qu'un portfolio de preuves soit lu là où un curriculum ne l'est pas ; que la plateforme génère les flux qu'elle revendique ; que le délai de validation des compétences par les tiers soit réduit ; que la charge d'entretien soit soutenable.

> [!danger] Le corpus fixe deux objectifs mesurables et n'en mesure aucun
> *« Générer des flux de clients et de recruteurs qualifiés »* et *« réduire le temps de validation des compétences par les tiers »* sont des grandeurs observables. **Aucune n'a été relevée avant la mise en ligne du 2026-06-30, ni depuis.**
> Le produit étant publié, ces mesures sont pourtant à portée immédiate, sans autorisation, sans recrutement et sans budget. **Aucun autre projet du coffre n'est dans cette situation**, et l'avantage n'a pas été employé.

---

## 4. Un signal déjà lisible dans le corpus lui-même

**Quatre contenus sont publiés** — un projet, deux articles, une compétence — et **tous datent du jour de la mise en ligne**. Aucun depuis, soit plus de deux mois.

Le corpus pose l'entretien minimal comme moteur technique et affirme que la plateforme *« doit évoluer avec son propriétaire »*. Le fait `F4` met cette affirmation sous tension sans la contredire formellement : deux mois est une durée courte, et l'interprétation reste ouverte. Elle est enregistrée comme hypothèse `H4`, non comme conclusion.

---

## 5. Règles de ce dossier

1. **Rien ne s'édite ici.**
2. **Le corpus n'est pas opposable**, et le fait que le produit existe n'y change rien. Un produit construit prouve qu'il était possible de le construire ; il ne prouve pas que la thèse tienne.
3. **Toute citation porte son chemin et son moment** — le cadrage d'avril et le dossier d'architecture de juin ne relèvent pas de la même échelle de travail.
4. **`CLAUDE.md` n'est pas un document.** C'est un lien symbolique vers `AGENTS.md` ; un inventaire qui le compterait comme un fichier distinct serait faux.
5. **Le dépôt de code fait foi sur la chronologie de la construction.** Il est conservé intact hors du coffre, avec ses huit enregistrements.
