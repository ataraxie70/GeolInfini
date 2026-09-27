# PACK ROADMAP — MAÎTRISE TECHNIQUE SYSTÈME
## Index général

> Ce pack est construit selon les règles du **Système d'apprentissage formel** (v2).
> Un sujet est validé seulement si : **expliqué + reproduit + appliqué + corrigé** sans aide immédiate.

---

## Structure du pack

| Fichier | Domaine | Priorité |
|---------|---------|----------|
| `D1-developpement-systeme.md` | Développement système (C → Rust) | Principale |
| `D2-administration-systeme.md` | Administration système Linux | Secondaire |
| `D3-devops-devsecops.md` | DevOps / DevSecOps | Appui |

---

## Légende commune à tous les fichiers

### Niveaux de maîtrise
| Niveau | Nom | Objectif |
|--------|-----|----------|
| N1 | Fondations | Vocabulaire, mécanismes, définitions |
| N2 | Pratique guidée | Exécution sous cadre, exercices |
| N3 | Projets | Assemblage multi-notions, résultat réel |
| N4 | Validation | Autonomie prouvée, reproduction sans aide |

### Statuts de sujet
- `[ ]` À faire
- `[~]` En cours
- `[R]` À revoir
- `[✓]` Validé

### Critères de validation (règle des 4)
Chaque sujet est validé seulement si les 4 conditions sont vraies :
1. **Expliquer** : sans support, clairement
2. **Reproduire** : de manière autonome
3. **Appliquer** : sur un cas nouveau proche
4. **Corriger** : identifier et corriger les erreurs sans aide

---

## Ordre de parcours recommandé

```
D1 Semaines 1–2  → Architecture + Shell (socle commun D1/D2)
D1 Semaines 3–6  → C complet (pointeurs, mémoire, appels système, processus)
D2 Semaine 7     → Administration système de base
D2 Semaine 8     → Réseau
D3 Semaine 9–10  → Scripting + Git
D3 Semaine 11    → Conteneurs + DevOps
D1/D3 Semaine 12 → Sécurité + validation finale
D1 Extension     → Rust (après C validé)
```

---

## Règle de non-cumul

À tout moment :
- **1 sujet principal** actif
- **1 sujet secondaire lié** actif
- **1 sujet en révision**

Ne jamais ouvrir un 4ème front.
