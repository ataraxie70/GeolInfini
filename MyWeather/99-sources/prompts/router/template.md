# ROUTER - USER PROMPT TEMPLATE

## USER REQUEST

```
[TYPE YOUR REQUEST HERE]
```

## OPTIONAL CONTEXT

```yaml
project: [PROJECT_NAME]
mode: [interactive|automated]
agents_available:
  - planner: deepseek-r1
  - executor: devstral
  - reviewer: llama3.1
```

---

**INSTRUCTION**: Analyse la requête, détermine le type de tâche, et routing vers l'agent approprié. Si la tâche nécessite plusieurs agents, orchestre le flux complet.

**FORMAT**: Retourne une routing decision au format défini dans le system prompt.
