---
projet: "checkme"
type: "note-de-faisabilite"
phase: "10-etudes"
objet: "Peut-on servir une consultation individuelle ouverte sans permettre la reconstitution de la liste complète ?"
menace_traitee: "MEN-01 du Registre des contradictions"
monde: "Raisonnement sur contraintes établies — aucune observation nouvelle"
niveau_de_preuve: "N1 — s'appuie sur les lots L1, L2 et L4 déjà clos, et sur le dispositif officiel existant"
statut: "INVALIDÉE le 2026-09-27 par le fait F22 — conservée pour la trace, sa conclusion ne doit pas être reprise telle quelle"
cree_le: 2026-09-27
tags: [checkme, etudes, faisabilite, securite]
---

# Note de faisabilité — consultation ouverte et énumération

> [!danger] Note invalidée le 2026-09-27, le jour de sa rédaction
> Elle supposait que la date de naissance n'était pas publique. Le fait `F22` établit qu'elle figure sur les listes publiées, **avec le numéro de CNIB**. Le second facteur n'est donc pas un secret.
> La note est conservée sans retouche, conformément à la règle du coffre : une hypothèse infirmée reste au dossier avec sa date et sa preuve d'invalidation. **Sa conclusion ne doit pas être reprise.**
> La question est rouverte et reformulée au [[checkme/90-pilotage/Registre des contradictions|Registre des contradictions]], où elle se subordonne désormais à `MEN-02` et à une question juridique unique : le communiqué obligatoire doit-il contenir la liste nominative complète ?

> [!info] Pourquoi cette note existe maintenant et non après le gate de la valeur
> Elle ne conçoit rien. Elle répond à une question de **faisabilité** : si servir une consultation ouverte par identifiant impliquait nécessairement d'exposer la liste entière, le mécanisme central du produit serait en cause, et cela doit se savoir avant de comparer des options de valeur, non après. C'est le test le moins cher qui décide le plus.

---

## 1. Réponse en une phrase

**Oui, c'est faisable, et le dispositif officiel burkinabè existant le démontre déjà : il exige deux facteurs, un numéro propre à la session et la date de naissance, dont le second n'est pas énumérable à coût raisonnable.** La contrainte juridique du lot `L4` pousse d'ailleurs vers la même solution, pour des raisons entièrement indépendantes.

---

## 2. La menace, énoncée précisément

Un identifiant de session — numéro de récépissé, de procès-verbal, de table — est attribué en séquence par l'émetteur. Le lot `L2` l'établit indirectement : le portail officiel décrit ses résultats de présélection comme publiés *« par ordre de numéro récépissé »*, ce qui suppose un ordre, donc une séquence.

Conséquence : une consultation qui accepte ce seul identifiant, sans compte et sans limite, permet de parcourir l'intervalle des numéros d'une session et de reconstituer la liste complète, **y compris les non-admis**. C'est le résultat que l'exigence de confidentialité interdit expressément.

Trois précisions sur la portée de la menace.

- **Elle ne suppose aucun défaut technique.** Le dispositif fonctionnerait exactement comme prévu ; c'est son usage normal, répété, qui produit le dommage.
- **La liste est déjà publique aujourd'hui**, sous forme d'image. La menace n'est donc pas la divulgation en soi, mais le passage d'une liste difficile à exploiter à une liste **structurée, triable et réutilisable**. Le lot `L2` mesure précisément cette difficulté actuelle : 0 % de texte cherchable.
- **Le dommage se déplace vers les non-admis.** Un admis est indifférent à la publicité de son succès. C'est la liste d'attente et l'échec qui deviennent exploitables.

---

## 3. Ce que la contrainte juridique impose déjà

Le lot `L4` établit deux choses qui restreignent l'espace des clés avant toute considération de sécurité.

| Clé | Régime établi par `L4` |
| --- | --- |
| Numéro de la carte nationale d'identité | **Autorisation préalable de la CIL**, article 31, quatrième alinéa, que le traitement soit public ou privé |
| Numéro propre à une session | Non tranché par le texte, question à poser à la CIL au cadrage |

La clé la plus naturelle pour une personne — son numéro d'identité — est donc la plus lourde juridiquement. La clé la plus légère juridiquement — le numéro de session — est la plus faible face à l'énumération.

**Les deux contraintes convergent vers la même réponse, et c'est le résultat le plus solide de cette note :** un facteur unique ne convient dans aucun des deux cas. Le choix n'est pas entre sécurité et simplicité, il est entre un facteur et deux.

---

## 4. La démonstration existe, et elle est burkinabè

Le fait `F15` du registre des statuts établit que l'État a mis en service en juin 2026 une consultation individuelle des résultats du certificat d'études, identifiant le candidat par **son numéro de procès-verbal et sa date de naissance**.

Ce choix mérite d'être lu pour ce qu'il résout.

| Propriété | Numéro de session seul | Numéro de session **et** date de naissance |
| --- | --- | --- |
| Énumérable par parcours séquentiel | oui | non : il faut le bon couple |
| Espace à parcourir pour un numéro donné | 1 essai | environ 10 000 dates plausibles pour un candidat adulte |
| Coût d'une moisson complète d'une session de 1 000 lignes | 1 000 requêtes | de l'ordre de 10 000 000 de requêtes |
| Connue de la personne concernée | oui | oui, sans effort |
| Détenue par un tiers curieux | souvent, elle figure sur la liste publiée | non, sauf connaissance personnelle |

Le second facteur ne rend pas la moisson impossible : il la rend **coûteuse d'un facteur dix mille environ**, ce qui suffit à la faire sortir de la portée d'un curieux et à la rendre détectable par une limitation de débit ordinaire.

**Et il ne coûte rien à la personne concernée**, qui connaît sa date de naissance. C'est la propriété décisive : la protection ne se paie pas en friction pour l'usager légitime, ce qui est le défaut habituel des mesures de sécurité.

---

## 5. Ce que cela règle, et ce que cela ne règle pas

**Réglé.** La consultation ouverte est faisable sans compte obligatoire. Le principe candidat que le porteur a posé — pas de compte au départ, parce que l'usage est épisodique et souvent délégué — **tient**. La menace `MEN-01` ne le contredit pas, à la condition d'un second facteur non énumérable.

**Réglé également, par effet de bord.** La divergence `3.2` du registre des statuts, contestée depuis le corpus hérité — l'écran citoyen propose-t-il une recherche par nom ? — reçoit un argument. Le nom est le pire des facteurs : il est sur la liste publiée, il est énumérable par dictionnaire, et il est ambigu. Le principe hérité *« l'identifiant faible jamais seul »* se trouve confirmé par une voie indépendante.

**Non réglé, et à ne pas traiter ici.**

- **Quelle est la valeur exacte du second facteur.** Date de naissance, quatre derniers chiffres d'un autre numéro, autre élément : cela se tranche à la conception, avec la CIL.
- **Ce que l'index contient.** Un index qui porte le nom et le statut expose davantage qu'un index qui ne porte qu'une empreinte du couple et un renvoi au document officiel. C'est la question ouverte de `CR-02`, et elle reste ouverte.
- **La limitation de débit, la journalisation et leur régime.** Architecture, après le gate de la valeur. Le corpus hérité en propose déjà une forme ; elle reste non opposable.
- **Le cas des sessions à très faible effectif**, où l'espace des couples devient petit. À traiter à la conception.

---

## 6. Conséquence pour le gate de la valeur

La faisabilité étant acquise, **la menace `MEN-01` cesse d'être un obstacle à l'existence du produit et devient une contrainte de conception**. Elle ne peut plus servir d'argument contre l'option numérique au gate de la valeur.

Symétriquement, elle interdit une option : un dispositif à facteur unique, quel que soit son confort apparent. Cette option sort de l'espace de comparaison avant même d'y entrer.

---

## 7. Points ouverts

**Quelle observation modifierait cette note ?**

- **Les numéros de session ne sont pas séquentiels** mais tirés dans un grand espace. La menace faiblit, et un facteur unique redevient discutable. À vérifier : le format réel des numéros de récépissé, observable sur les listes déjà publiées sans ouvrir aucune liste nominative.
- **La date de naissance figure sur les listes publiées.** Le second facteur perd alors sa propriété principale, puisqu'un tiers l'obtient en lisant la liste. **C'est la vérification la plus urgente de cette note**, et elle est gratuite : elle se lit sur la structure des publications déjà relevées par `L2`.
- **La CIL considère le numéro de session comme un identifiant de même nature** au sens de l'article 31. Les deux clés deviennent alors soumises à autorisation, et le calendrier du projet change sans que la faisabilité technique soit touchée.
- **Une session comporte trop peu de candidats** pour que le couple reste discriminant. La conception devra prévoir un régime distinct pour ces sessions.

**Inconnue principale.** Le format des numéros de récépissé de l'État n'est pas établi. Toute cette note suppose qu'ils sont séquentiels, au grade `N0` renforcé par une mention du portail officiel. C'est l'hypothèse la plus load-bearing du raisonnement, et la moins chère à vérifier.
