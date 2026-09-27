# REVIEWER - USER PROMPT TEMPLATE

## REQUEST

```
[REVIEW REQUEST DESCRIPTION]
```

## SCOPE

```yaml
review_type: [security|performance|full|regression]
files:
  - [file1]
  - [file2]
changes:
  - [change description]
```

## PROJECT CONTEXT

```yaml
project:
  name: [PROJECT_NAME]
  security_level: [critical|high|medium]
  compliance: [STANDARDS]
  language: [LANGUAGE]
  framework: [FRAMEWORK]
```

## PREVIOUS REVIEW (If applicable)
```
[PREVIOUS REVIEW FINDINGS]
```

---

**INSTRUCTION**: Effectue une review complète selon les checklists de sécurité et qualité. Pour les issues critiques/high, fourni du code de remediation.

**FORMAT**: Retourne le rapport de review au format défini dans le system prompt.
