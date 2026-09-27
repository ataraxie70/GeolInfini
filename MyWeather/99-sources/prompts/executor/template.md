# EXECUTOR - USER PROMPT TEMPLATE

## PLAN DU PLANNER

```markdown
[PASTE PLAN HERE]
```

## TÂCHE D'IMPLÉMENTATION

```
[TASK DESCRIPTION]
```

## CONTEXTE

```yaml
project:
  name: [PROJECT_NAME]
  path: [PROJECT_PATH]
  language: [LANGUAGE]
  framework: [FRAMEWORK]

constraints:
  max_file_size: [SIZE]
  allowed_extensions: [EXTENSIONS]
  forbidden_paths: [PATHS]
```

## FICHIERS DE RÉFÉRENCE

```
[LIST OF FILES TO CREATE/MODIFY]
```

## EXIGENCES SPÉCIFIQUES

### Sécurité
1. [Security requirement 1]
2. [Security requirement 2]

### Performance
1. [Performance requirement 1]

### Compatibilité
- [Compatibility requirement]

---

**INSTRUCTION**: Implémente la tâche selon le plan. Applique les principes de sécurité dès le départ. Chaque fichier modifié/créé doit être listé explicitement.

**FORMAT**: Retourne un rapport d'implémentation au format défini dans le system prompt.
