# NOTE DE FAISABILITÉ TECHNIQUE

## La question qui décide si le produit décrit est constructible

**Version : 1.0 · Septembre 2026**
**Objet : couche d'autorisation et initiation de paiement pour compte de tiers sur PI-SPI**
**Exécutable seul, sans partenaire, sans capital — en quelques jours**

---

## 1. La distinction que vous décrivez, énoncée précisément

Elle est réelle, et elle n'avait pas été correctement nommée dans l'étude v1.0. Voici les deux modèles côte à côte.

### Modèle A — Le transfert inter-portefeuilles *(YengaPay, CHANGE, la plupart des agrégateurs)*

```
L'utilisateur ouvre l'application
        ↓
Il choisit un opérateur SOURCE          ← il doit savoir
        ↓
Il choisit un opérateur DESTINATION     ← il doit savoir
        ↓
Il saisit un montant, un numéro
        ↓
La plateforme exécute un transfert A → B
```

Le rail reste **présent dans la tête de l'utilisateur** à chaque opération. Le produit vend le franchissement d'une frontière. C'est un produit de **transfert**.

### Modèle B — Le paiement *(ce que vous décrivez)*

```
UNE SEULE FOIS, à l'inscription
        ↓
L'utilisateur rattache un compte et le configure par défaut
        ↓
        ═══════════ puis, à chaque achat ═══════════
        ↓
Le commerçant a un QR permanent, affiché, qui ne change jamais
        ↓
Le payeur scanne
        ↓
Le payeur valide dans l'application
        ↓
Le débit s'exécute sur SON compte configuré
        ↓
Le commerçant est crédité sur SON compte configuré
```

Ni l'un ni l'autre ne choisit un rail. Ni l'un ni l'autre ne sait ce qu'utilise l'autre. Le rail a **disparu de l'expérience**, il n'a pas été simplifié.

**C'est bien un modèle différent, et c'est exactement le modèle UPI.** En Inde, un commerçant affiche un QR statique ; le payeur le scanne depuis n'importe quelle application ; le débit s'exécute sur son compte bancaire. La banque du payeur n'affiche aucun écran. Ce modèle a produit 228 milliards de transactions en 2025.

**[ANALYSE]** Votre boussole — *« le plus proche possible du paiement en espèces »* — est la bonne formulation de cette différence. Avec des espèces, personne ne demande « tu es sur quel réseau ? ». On tend l'argent. Le Modèle A demande encore le réseau. Le Modèle B ne le demande plus.

---

## 2. Ce qui rend UPI possible — et la question que cela pose à PI-SPI

**[FAIT]** Dans UPI, une application tierce (PhonePe, Google Pay) peut faire débiter un compte bancaire qu'elle ne détient pas, parce que la NPCI impose une **couche d'authentification commune** : le PSP transmet la demande à la NPCI, qui contacte la banque ; le facteur d'authentification (le code UPI) est saisi **dans l'application du PSP**, jamais dans celle de la banque. Le PSP n'a besoin d'aucun compte : il est *« messager et moniteur »*.

C'est cette pièce, et elle seule, qui permet à un tiers de servir tous les comptes du pays.

> ### **LA QUESTION DÉCISIVE**
>
> **PI-SPI expose-t-il l'équivalent — une API d'initiation de paiement permettant à un tiers de faire autoriser, DANS SA PROPRE APPLICATION, un débit sur un compte détenu par un autre participant ?**

**Si oui** — votre produit est constructible exactement comme vous le décrivez.

**Si non** — le payeur devra confirmer dans l'application de son établissement. Votre « un scan, une validation » devient « un scan, puis basculer vers l'application Orange, puis revenir ». Et la proposition de valeur s'effondre, parce que le rail réapparaît dans l'expérience au moment précis où vous vouliez le faire disparaître.

**[ANALYSE] Tout le reste du projet est en aval de cette réponse.** L'enquête terrain mesure la demande ; cette question mesure la faisabilité. Une demande démontrée pour un produit non constructible ne vaut rien. Il faut donc y répondre **en premier**, et cela ne coûte ni argent, ni partenaire, ni agrément.

---

## 3. Un signal préoccupant, à vérifier avant de conclure

**[HYPOTHÈSE — à infirmer en priorité]** Les points d'entrée publiquement visibles du portail développeur PI-SPI portent tous des noms orientés **bénéficiaire** :

| Point d'entrée observé | Orientation |
|---|---|
| `/api-business/paiementRecuLister` — lister les paiements reçus | Bénéficiaire |
| `/guides/qr-generation` — générer un QR | Bénéficiaire |
| `/guides/rtp-envoyer` — envoyer une demande de paiement | Bénéficiaire |
| `/tutoriels/paiement-qr-code-statique` | Bénéficiaire |
| L'ensemble est intitulé **« API Business »** | Bénéficiaire |

Aucun point d'entrée visible ne correspond à « initier un débit sur le compte d'un payeur tiers ».

**[ANALYSE] Si cette observation se confirme**, PI-SPI serait conçu comme une infrastructure d'**encaissement** pour les participants et leurs clients marchands — c'est-à-dire côté bénéficiaire — et non comme une infrastructure d'**initiation** ouverte à des tiers côté payeur. Ce serait la différence structurelle entre PI-SPI et UPI, et elle serait déterminante pour vous.

Ce n'est pour l'instant qu'une inférence tirée de noms d'URL. Le portail est une application JavaScript dont le contenu n'a pas pu être lu automatiquement. **Il faut y aller et regarder.**

---

## 4. Protocole de test — sandbox PI-SPI

Le portail `developer.pispi.bceao.int` annonce un **« Environnement de Test API Business »**. Vous êtes développeur : c'est votre terrain, et il est gratuit.

### Test 0 — L'accès *(30 minutes)*

Tenter de créer un compte sur le sandbox.

| Résultat | Ce que cela signifie |
|---|---|
| Accès libre | Vous pouvez tout tester seul. Continuer. |
| Accès réservé aux participants agréés | **Le mémo de partenariat devient le chemin critique immédiat** — vous ne pouvez pas même tester sans un participant. Cela réordonne tout le plan. |

### Test 1 — Cartographie des APIs *(2–3 heures)*

Lister exhaustivement les points d'entrée et les classer :

- **Côté bénéficiaire** : générer un QR, lister les paiements reçus, envoyer une demande de paiement, gérer les alias
- **Côté payeur** : *existe-t-il quoi que ce soit qui permette d'initier un débit ?*
- **Autorisation** : quel mécanisme d'authentification du payeur est prévu, et où s'exécute-t-il ?

**Question à trancher :** un participant peut-il initier une opération pour le compte d'un client **qu'il ne détient pas** ?

### Test 2 — Le flux d'autorisation *(1 journée)*

Dans le sandbox, dérouler un paiement de bout en bout et identifier **le point exact où le payeur s'authentifie**.

```
Cas 1  Le payeur s'authentifie dans l'application du tiers
       → modèle UPI disponible
       → LE PRODUIT EST CONSTRUCTIBLE TEL QUE DÉCRIT

Cas 2  Le payeur s'authentifie chez son teneur de compte,
       avec redirection ou notification
       → « un scan, une validation » impossible
       → LE PRODUIT DOIT ÊTRE REPENSÉ

Cas 3  Aucune initiation par un tiers n'est prévue
       → il faut détenir la relation payeur
       → il faut devenir teneur de compte (EME), autre métier,
         autre capital, autre entreprise
```

### Test 3 — QR statique et réconciliation *(2–3 heures)*

Vérifier ce que le QR statique transporte réellement, et ce que le bénéficiaire reçoit comme information. Votre document fondateur v0.1 signalait déjà, au §18, que la réconciliation automatique n'est pas garantie avec un QR statique réutilisable. Mesurez-le : si le commerçant ne peut pas savoir à quelle vente correspond un paiement, cela ne disqualifie pas le QR permanent — mais cela vous impose de résoudre l'appariement vous-même, et c'est du travail.

### Test 4 — Le trou des cartes *(1 heure)*

Confirmer qu'aucun point d'entrée PI-SPI ne concerne les cartes. Si c'est confirmé, la carte prépayée reste hors du dispositif et le restera : c'est un rail GIM-UEMOA/Visa distinct, avec ses propres exigences d'acceptation.

---

## 5. Décision au terme des tests

| Résultat du Test 2 | Décision |
|---|---|
| **Cas 1** | Le produit est constructible. La question redevient stratégique — distribution, neutralité, actif — et non plus technique. Poursuivre avec la Phase 0 terrain. |
| **Cas 2** | Repenser. Deux options : accepter le rebond vers l'application tierce (et renoncer à la promesse), ou détenir soi-même le compte du payeur (et changer de métier). Aucune n'est neutre. |
| **Cas 3** | La position d'initiateur tiers n'existe pas sur PI-SPI. Le projet doit se reformuler côté bénéficiaire — acceptation marchande, outils, crédit — c'est-à-dire ce que concluait l'étude v1.0, mais désormais pour une raison technique et non économique. |

**[ANALYSE]** Notez que le Cas 3 ne tue pas le projet : il le renvoie vers la position que l'étude v1.0 identifiait déjà comme la seule défendable. Les deux analyses convergeraient alors par deux chemins indépendants, ce qui serait un signal fort.

---

## 6. Une conséquence de votre propre boussole, que vous ne tirez pas encore

Vous dites : *« le plus proche possible du système de paiement en espèces »*. Suivez cette règle jusqu'au bout et elle produit une exigence que votre description actuelle abandonne.

Les espèces ont une propriété qu'aucun système numérique ne reproduit spontanément :

> **Le payeur n'a besoin de rien de l'infrastructure du bénéficiaire, et le bénéficiaire n'a besoin de rien de celle du payeur.**

Votre QR permanent s'en approche du côté du bénéficiaire — il n'a rien à faire, rien à initier, il affiche. Mais du côté du payeur, votre modèle exige un smartphone, de la data au moment de l'achat, et votre application installée.

Or, au Burkina, **25,7 % de la population a accès à Internet**. La règle des espèces, appliquée strictement, impose donc un chemin qui fonctionne sans data — et votre document fondateur v0.1 l'avait, au §12.2 : l'USSD comme canal de continuité. Vous ne l'avez plus mentionné depuis.

**[ANALYSE]** Ce n'est pas un détail de couverture. C'est ce qui décide si votre produit sert « la population » comme vous le dites, ou seulement le quart connecté — c'est-à-dire à peu près la même clientèle que les applications qui existent déjà. **La fidélité aux espèces se mesure là, plus que dans le nombre de scans.**

À vérifier dans le sandbox, Test 1 *bis* : PI-SPI prévoit-il un canal non-data, et un participant peut-il l'exposer ?

---

## 7. Sur l'incident QR observé

Vous décrivez un cas vu en direct : un QR exposé pendant un live, suivi d'un prélèvement constaté. Vous précisez ne pas vouloir en faire une campagne — c'est la bonne posture, et elle n'a pas besoin d'être justifiée davantage.

**Pour la conception, l'incident suffit tel quel.** Qu'il s'explique par une faille, par de l'ingénierie sociale ou par autre chose, la règle qu'il impose est la même et elle est saine :

```
IDENTIFIANT DE RÉCEPTION              CÉRÉMONIE DE SORTIE
publiable, permanent,          ≠      jamais publiable,
affichable, diffusable                possession + secret + canal distinct
```

Un identifiant fait pour être vu ne doit jamais participer à un parcours de débit. Vous concevez contre ce risque : c'est suffisant, et c'est ce qu'il faut écrire dans la spécification — sans nommer de concurrent.

---

## 8. Ce que cette note réordonne dans le plan

L'ordre initial était : courrier BCEAO → terrain → partenaire. Il change.

| Rang | Action | Coût | Délai | Ce que ça tranche |
|---|---|---|---|---|
| **1** | **Tests sandbox PI-SPI** | Nul | 2–3 jours | **La faisabilité.** Binaire. Rien ne sert à rien avant. |
| **2** | Courrier BCEAO *(4 questions)* | 3 timbres | 3–8 semaines | Le statut, le KYC, le raccordement direct |
| **3** | Observation du 1er octobre | Nul | 1 journée | L'état réel de la concurrence après l'échéance EME |
| **4** | Phase 0 terrain, 25 entretiens | ~63 h | 10 semaines | La demande |

**[ANALYSE]** Les rangs 1 à 3 coûtent moins d'une semaine de travail cumulée et peuvent tuer ou débloquer le projet. Le rang 4 coûte dix semaines. C'est l'ordre qui protège votre temps — et c'est aussi l'ordre qui vous met, dans trois jours, en position de savoir quelque chose que personne d'autre autour de vous ne sait.

---

## Sources

- [PI-SPI Sandbox — Environnement de test API Business, BCEAO](https://developer.pispi.bceao.int/)
- [PI-SPI — Envoyer une demande de paiement (RTP)](https://developer.pispi.bceao.int/guides/rtp-envoyer)
- [PI-SPI — Paiements au point de vente, tutoriels](https://developer.pispi.bceao.int/tutoriels)
- [PI-SPI — QR code imprimé réutilisable](https://developer.pispi.bceao.int/tutoriels/paiement-qr-code-statique)
- [PSP in UPI explained: The backbone of digital transactions — Pine Labs](https://www.pinelabs.com/blog/psp-in-upi-explained-the-backbone-of-digital-transactions)
- [Transformation digitale des acteurs de l'économie informelle au Burkina (25,7 % d'accès Internet) — PNUD](https://www.undp.org/fr/burkina-faso/blog/transformation-digitale-la-portee-des-acteurs-de-leconomie-informelle-au-burkina)

---

**Fin — Note de faisabilité technique v1.0**
