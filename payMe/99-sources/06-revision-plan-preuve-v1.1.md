# RÉVISION DU PLAN DE PREUVE — v1.1

## Le retrait subi, la tête de pont assumée, et un terrain compressé

**Version : 1.1 · Septembre 2026**
**Corrige : Constat 1 de l'étude v1.0 · Protocole de terrain Phase 0 §3 et §4**
**Origine : objection du porteur de projet sur la nature des retraits**

---

## 1. La correction : le retrait subi n'est pas une préférence pour l'espèce

L'étude v1.0 lisait le chiffre le plus lourd du dossier comme un verdict :

> Rechargements 5 649 Md FCFA · Retraits 5 539 Md FCFA
> **0,98 franc ressort en espèces pour chaque franc entré.**

Et elle en concluait : *« le mobile money burkinabè n'est pas un système de paiement, c'est un système de transport de cash. »*

**C'est une lecture, ce n'est pas la seule, et l'autre est plus utile.**

L'objection : une part importante de ces retraits n'est pas choisie. Elle est **subie**. *« J'ai l'argent sur mon compte, la personne à qui je dois le donner n'est pas joignable, donc je retire. »* Le retrait n'est alors pas la preuve d'une préférence pour l'espèce — c'est **le symptôme du chaînon manquant**.

**[ANALYSE] Les deux lectures sont compatibles avec le même chiffre, et elles conduisent à des décisions opposées.**

| Lecture | Ce que 0,98 signifie | Décision |
|---|---|---|
| **v1.0 — préférence** | Les gens veulent de l'espèce. Le numérique ne tient pas. | Renoncer, ou changer de segment |
| **v1.1 — contrainte** | Les gens sont contraints de retirer. La demande existe, l'aval manque. | Construire l'aval |

**Rien dans les statistiques agrégées ne permet de trancher entre les deux.** Un rapport de banque centrale compte des retraits ; il n'enregistre pas leur cause. C'est exactement le genre de question qu'aucune donnée publique ne résoudra, et qu'une poignée d'entretiens résout en une semaine.

**[ANALYSE] Et ce n'est pas une question de nuance : c'est le dimensionnement du marché.** Si 40 % des 5 539 Md FCFA de retraits sont subis par absence d'acceptation, cela représente **environ 2 200 Md FCFA de paiements qui se feraient en numérique s'ils le pouvaient** — soit **2,5 fois la totalité de la ligne « Paiements » actuelle (875 Md)**. Le gisement ne serait pas dans la conversion de nouveaux usages, mais dans la récupération d'usages déjà numériques qui sont forcés de sortir.

Cette phrase, si elle est étayée par du terrain, est la première ligne de votre mémo de partenariat.

---

## 2. La taxonomie à mesurer

Tous les retraits ne se valent pas. Six causes, dont trois seulement vous concernent.

```
RETRAIT SUBI
├── A. Bénéficiaire inatteignable        → en voie de résolution par PI-SPI
│      (pas de compte, opérateur non interopérable)
├── B. Point d'acceptation absent        → ★ VOTRE MARCHÉ
│      (le commerçant, le grossiste, le service n'accepte pas)
└── C. Obligation externe                → hors de portée
       (loyer, main-d'œuvre journalière, taxe exigée en espèces)

RETRAIT CHOISI
├── D. Préférence de possession          → travail de long terme
├── E. Défiance envers le compte         → travail de long terme
└── F. Crainte des frais ou du blocage   → adressable par le produit
```

**[ANALYSE] La distinction A / B est décisive, et elle est datée.** La cause A — « la personne est sur un autre opérateur » — est précisément ce que la BCEAO supprime gratuitement au 30 septembre 2026. Si l'essentiel des retraits subis relève de A, votre marché se referme dans trois semaines sans que vous y soyez pour rien.

Si l'essentiel relève de **B**, votre marché s'ouvre — et il s'ouvre d'autant plus que le rail devient gratuit, puisque le seul obstacle restant devient l'acceptation.

> **Votre propre reformulation, suivie jusqu'au bout, atterrit exactement là où concluait l'étude v1.0 : l'acceptation. Mais elle y arrive par un chemin bien meilleur — non plus « le numérique échoue », mais « la demande est là et déborde faute de points d'acceptation ». Ce n'est pas la même histoire, ce n'est pas le même mémo, et ce n'est pas la même entreprise.**

### Nouvelle métrique

> ### TRS — Taux de Retrait Subi
> **Part des retraits causés par l'absence d'un point d'acceptation (cause B).**
>
> Multiplié par le volume national des retraits, il donne le marché adressable réel.

Le TRS remplace le DVR comme mesure principale. Le DVR mesurait un état ; le TRS mesure une cause, et une cause est actionnable.

---

## 3. La tête de pont assumée : les 25 % connectés

Ma remarque sur l'USSD supposait que servir « la population » exigeait de couvrir les 74 % hors ligne dès le départ. **Vous avez raison de refuser cette exigence, et pour une bonne raison.**

**[ANALYSE] Trois arguments qui tiennent :**

1. **Ajouter l'USSD, c'est reconstruire Orange Money.** Et hériter de sa complexité — menus imbriqués, codes, absence de contexte visuel — c'est-à-dire exactement la friction que vous cherchez à supprimer. Un canal qui ramène le problème n'est pas une extension de couverture, c'est une régression.
2. **25,7 % de 23 millions, c'est près de 6 millions de personnes.** Ce n'est pas une niche. C'est un marché plus grand que la population totale de plusieurs pays de l'UEMOA.
3. **L'analogie WhatsApp est juste, et c'est la meilleure de la discussion.** Les gens ont acheté des smartphones parce qu'un gigaoctet permet de parler plus longtemps qu'un crédit d'appel, et parce qu'appeler à l'étranger coûte plus cher qu'un message. **L'outil n'a pas attendu la connectivité : il l'a provoquée.** Un moyen de paiement suffisamment supérieur peut produire le même effet.

**[ANALYSE] Ce que cette décision engage.** Une tête de pont choisie est une stratégie ; une tête de pont subie est un angle mort. La différence tient à une seule chose : l'écrire, et écrire la condition de sortie.

**À formaliser dans le document fondateur :**

> Segment initial : les utilisateurs de smartphone connectés, en zone urbaine, au Burkina Faso.
> Ce n'est pas une limite acceptée par défaut, c'est une tête de pont choisie.
> **Condition de sortie** : n'étendre au canal non-data qu'une fois le modèle prouvé sur ce segment, et seulement si l'extension ne réintroduit pas la friction que le produit supprime.

Un investisseur ou un partenaire ne reprochera jamais une tête de pont étroite si elle est nommée et argumentée. Il reprochera toujours une couverture revendiquée qui n'existe pas.

---

## 4. Ce que le terrain donne, et que les statistiques ne donneront pas

Vous dites : *« on n'a pas forcément besoin de terrain, il y a beaucoup de statistiques, et le paiement en espèces c'est pareil partout. »*

**Vrai pour la douleur. Faux pour trois choses**, et ce sont les trois qui décident :

1. **La cause du retrait.** Aucune statistique publique, d'aucun pays, ne dit si un retrait relève de A, B ou C. Or c'est cela, et rien d'autre, qui dimensionne votre marché.
2. **La cause de l'abandon des 79 %.** 59 243 commerçants inscrits, 12 370 actifs. Ces gens ont essayé et arrêté. Ils savent pourquoi. Personne ne le leur a demandé.
3. **Votre position de négociation.** Vous n'avez ni agrément, ni partenaire, ni capital. Vous n'avez qu'une chose à apporter à un SFD ou à un établissement de paiement : **une donnée qu'il n'a pas.** Un mémo adossé à douze entretiens documentés n'est pas le même objet qu'un mémo adossé à un rapport de la BCEAO que le partenaire a déjà lu.

**[ANALYSE]** Cela dit, votre priorisation est juste et je l'avais déjà admise : le terrain n'est pas la première action. Les tests sandbox le sont. Et le terrain peut être **beaucoup plus petit** que ce que proposait le protocole initial, parce que votre reformulation l'a rendu plus précis.

---

## 5. Terrain compressé : de 63 heures à 16

Le protocole initial prévoyait 25 entretiens commerçants sur 10 semaines, avant que la question du retrait subi ne soit posée. Elle change l'instrument : la question centrale est désormais **côté payeur**, pas seulement côté commerçant.

### Nouvel échantillon — 12 entretiens, environ 16 heures

| Groupe | Nombre | Question centrale | Durée |
|---|---:|---|---|
| **Payeurs** — utilisateurs actifs de mobile money, zone urbaine, smartphone | 8 | *Votre dernier retrait : subi ou choisi ?* | 12 min |
| **Commerçants** — dont au moins 2 ayant essayé puis abandonné | 4 | *Pourquoi vous n'acceptez pas / pourquoi vous avez arrêté ?* | 25 min |

### L'instrument payeur — six questions, douze minutes

Court, exécutable dans une file d'attente, un maquis, une station-service.

**P1.** La dernière fois que vous avez retiré de l'argent, c'était pour quoi faire exactement ?

```
_____________________________________________________________________
```

**P2.** Si la personne — ou le commerçant — avait pu recevoir directement sur son compte, vous auriez retiré quand même ?

☐ Non, j'aurais envoyé directement ☐ Oui, j'aurais retiré quand même ☐ Ça dépend : ______

> **[C'est LA question. Elle sépare le subi du choisi en une phrase. Ne jamais la reformuler.]**

**P3.** *(Si « non »)* Pourquoi ne pouviez-vous pas envoyer directement ?

☐ Elle n'a pas de compte
☐ Elle est sur un autre opérateur → **cause A**
☐ Le commerçant n'accepte pas → **cause B ★**
☐ On m'a demandé de l'espèce → **cause C**
☐ Autre : __________

**P4.** Sur vos cinq derniers retraits, combien auraient pu être évités si l'autre côté avait pu recevoir ?  `____ / 5`

**P5.** Ça vous arrive de garder de l'argent sur le compte plusieurs jours ? Dans quel cas ?

```
_____________________________________________________________________
```

**P6.** La dernière fois qu'un commerçant a refusé votre paiement par téléphone, c'était où et il a dit quoi ?

```
_____________________________________________________________________
```

### Calcul

```
TRS = (nombre de retraits de cause B) ÷ (nombre total de retraits examinés)

Marché adressable estimé = TRS × 5 539 Md FCFA
```

### Critère de mort

> **TRS inférieur à 15 %.** En dessous, les retraits sont majoritairement choisis ou relèvent de causes que vous n'adressez pas — et le gisement que votre reformulation postule n'existe pas.

**[ANALYSE]** Douze entretiens ne prouvent rien statistiquement. Mais si dix payeurs sur douze disent *« non, j'aurais envoyé directement, mais le commerçant n'accepte pas »*, vous n'avez pas besoin de deux cents. Vous avez une direction, et surtout vous avez douze phrases exactes à mettre dans un mémo.

---

## 6. Ordre des opérations, révisé

| Rang | Action | Coût | Délai | Tranche |
|---|---|---|---|---|
| **1** | Tests sandbox PI-SPI | Nul | 2–3 j | **La faisabilité** |
| **2** | Courrier BCEAO (4 questions) | 3 timbres | 3–8 sem. | Le statut réglementaire |
| **3** | Observation du 1er octobre | Nul | 1 j | L'état de la concurrence après l'échéance EME |
| **4** | **Terrain compressé, 12 entretiens** | ~16 h | 3 sem. | **Le TRS, donc la taille du marché** |
| 5 | Terrain élargi *(si 1–4 sont favorables)* | ~50 h | 8 sem. | L'acceptation marchande, le crédit |

**[ANALYSE]** Les quatre premiers rangs coûtent environ trois semaines-personne au total. Ils suffisent à décider s'il faut construire une entreprise ou passer à autre chose. C'est peu cher pour une question de cette taille.

---

## 7. Ce qui reste vrai, et qui n'est pas affecté par cette révision

Trois choses ne bougent pas, et il faut le dire clairement pour que la révision ne se lise pas comme une capitulation.

1. **Le retrait subi rend le marché plus grand, pas moins cher à prendre.** Si les gens retirent parce que le commerçant n'accepte pas, alors la solution passe par le commerçant. Vous revenez à l'acquisition marchande — 12 370 actifs sur ~205 000 commerces — avec toute sa lourdeur de terrain. La bonne nouvelle est sur la demande ; la difficulté reste sur l'offre.

2. **Le paiement ne finance toujours pas l'entreprise.** PI-SPI est gratuit et le devient pour tous. À 10 000 commerçants actifs — 80 % du parc national actuel — le paiement seul couvre à peine les coûts fixes. Le revenu est adjacent : crédit, outils, données. Rien dans cette révision ne change cette arithmétique.

3. **La cause A se referme le 30 septembre.** Si vos douze entretiens montrent que les retraits subis relèvent surtout de « l'autre est sur un autre opérateur », le régulateur résout votre problème gratuitement dans trois semaines et il n'y a pas d'entreprise. C'est pourquoi la question P3 doit distinguer A et B avec rigueur — c'est la ligne qui sépare un marché d'un mirage.

---

## 8. Sur la méthode : chercher la faille la plus minime

Vous écrivez : *« il faut trouver le minimum, la faille la plus minime pour pouvoir trouver un point d'ancrage et décoller. »*

C'est la bonne façon de procéder, et c'est ce que fait ce plan. Une réserve, une seule : une faille est un **point d'entrée**, jamais une **position**. Elle donne le droit d'exister, pas celui de durer — et elle se referme, souvent par la main de celui-là même qui l'a laissée ouverte.

La discipline consiste donc à toujours tenir les deux bouts ensemble : **par où j'entre** — la friction du paiement quotidien, le retrait subi, le commerçant exclu — et **ce que je construis pendant que j'y suis** — la neutralité que les opérateurs ne peuvent pas copier, et la vue consolidée que personne d'autre ne possède.

Entrer sans construire, c'est CHANGE : 500 000 clients, 2,5 % de commission, et un régulateur qui ramène ce prix à zéro.

---

**Fin — Révision du plan de preuve v1.1**
