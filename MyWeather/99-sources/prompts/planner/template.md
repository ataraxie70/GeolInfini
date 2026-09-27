# PLANNER - USER PROMPT TEMPLATE

## TÂCHE À PLANIFIER

```
[TICKET / REQUEST DESCRIPTION]
```

## CONTEXTE PROJET

```yaml
project:
  name: [PROJECT_NAME]
  type: [web_application|api_platform|mobile_app|infrastructure|platform_complex]
  stack:
    [TECH_STACK]
  security_level: [critical|high|medium]
  compliance: [GDPR|SOC2|ISO27001|NIST|none]
```

## EXIGENCES

### Fonctionnelles
1. [Requirement 1]
2. [Requirement 2]

### Non-Fonctionnelles
| Critère | Target | Mesure |
|---------|--------|--------|
| Performance | <[X]ms | p99 latency |
| Disponibilité | [99.9]% | SLA |
| Sécurité | [Level] | Compliance |
| Scalabilité | [X]x | Horizontal |

## QUESTIONS OUVERTES
1. [Open question 1]
2. [Open question 2]

## DÉLAIS CONTRAINTS
- Deadline: [DATE]
- Milestones: [MILESTONES]

---

**INSTRUCTION**: Applique les principes DevSecOps. Chaque décision d'architecture doit inclure une analyse de sécurité. Privilégie les solutions simples, sécurisées et maintenables.

**FORMAT**: Retourne un plan complet au format défini dans le system prompt.
