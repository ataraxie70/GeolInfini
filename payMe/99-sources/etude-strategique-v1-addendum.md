# ADDENDUM À L'ÉTUDE STRATÉGIQUE v1.0

## Correction d'une surestimation, et reformulation de la position défendable

**Version : 1.1 · Septembre 2026**
**Origine : objections du porteur de projet, vérifiées le 8 septembre 2026**
**Statut : corrige les §3, §7 et §15 de l'étude v1.0**

---

## 1. Ce que l'étude v1.0 a surestimé

L'étude v1.0 affirmait : *« PI-SPI fournit nativement l'alias, la vérification du bénéficiaire, un QR unique, l'exécution en 10 secondes… les §5, 6, 9.1–9.7, 14 et 21 du document fondateur décrivent le cahier des charges de PI-SPI. »*

**C'est vrai au niveau du rail et des standards. C'est faux au niveau de l'expérience.** La distinction n'est pas de détail : elle rouvre une position que l'étude avait déclarée fermée.

**[FAIT]** La BCEAO ne publie aucune application grand public. Sa FAQ officielle est explicite : *« vous accédez aux services via l'application mobile que ce dernier [votre participant] a l'obligation de mettre à votre disposition »*. La page dédiée à l'alias confirme le parcours : *« on accède à l'onglet PI de l'application de sa banque ou institution »*.

**[ANALYSE] Conséquence.** PI-SPI livre un rail et impose des standards, puis **délègue intégralement l'expérience à chaque participant**. Il n'existe donc pas une expérience PI-SPI : il en existe autant que de participants, chacune enfermée dans le périmètre d'un seul établissement, ne montrant qu'un seul compte, et conçue par des institutions dont ce n'est pas le métier.

L'abstraction du rail est réelle **du point de vue de la BCEAO**. Elle n'existe pas **du point de vue de l'utilisateur**, qui reste dans l'application de son établissement, avec son compte à lui.

---

## 2. Ce que l'étude v1.0 n'avait pas mesuré : la couverture réelle au Burkina Faso

**[FAIT]** Liste officielle BCEAO des participants autorisés à ouvrir les services PI-SPI au public, arrêtée au 2 avril 2026 — **Burkina Faso, 9 institutions** :

| Institution | Catégorie |
|---|---|
| Banque de l'Union Burkina Faso | Banque |
| Bank of Africa | Banque |
| Coris Bank International | Banque |
| Ecobank | Banque |
| Orabank | Banque |
| UBA | Banque |
| **Orange Money** | **Monnaie électronique** |
| Baobab | Établissement de paiement / microfinance |
| Cofina | Établissement de paiement / microfinance |

**Ne figurent pas :** Moov Money, Wave, Telecel Money, Coris Money, Sank Money.

**[ANALYSE] Ce que cela signifie concrètement.**

- Six participants sur neuf sont des banques. Or ouvrir un compte bancaire suppose un dépôt initial et des frais de tenue de compte — une barrière réelle pour un actif du secteur informel.
- **Un seul émetteur de monnaie électronique est connecté : Orange Money.** C'est le plus gros, mais il ne fait pas le marché à lui seul.
- **Les utilisateurs de Wave, de Moov Money et de Telecel n'ont aujourd'hui aucun accès à PI-SPI.**
- Un commerçant qui affiche un QR PI-SPI ne peut donc pas être payé par une grande partie de ses clients.

**[FAIT]** Les cartes ne sont pas sur PI-SPI. Une carte prépayée Visa relève des rails cartes (GIM-UEMOA, Visa), qui ne communiquent pas avec PI-SPI et exigent un terminal d'acceptation dédié dont l'immense majorité des commerçants ne dispose pas.

> **L'objection du porteur de projet est donc factuellement fondée : au 8 septembre 2026, la promesse « je paie n'importe qui depuis n'importe quel compte » n'est pas tenue au Burkina Faso, ni par PI-SPI, ni par personne.**

---

## 3. Mais cette fenêtre se referme dans trois semaines — et c'est le point le plus important de cet addendum

**[FAIT]** La connexion à PI-SPI devient **obligatoire le 30 septembre 2026** pour les banques, **les émetteurs de monnaie électronique** et les établissements de paiement. (Échéance repoussée au 30 juin 2027 pour les seules institutions de microfinance encore en tests.)

**[ANALYSE]** Wave, Moov Money et Telecel sont des émetteurs de monnaie électronique. Ils sont donc censés être connectés dans trois semaines. Le jour où ils le seront :

- Leurs applications — **déjà installées sur des millions de téléphones burkinabè** — deviennent interopérables entre elles.
- Un utilisateur Wave pourra payer un commerçant Orange Money depuis l'application Wave, gratuitement.
- La proposition « je vous permets de payer par-delà les opérateurs » cesse d'être un différenciateur.

**C'est la donnée qui doit gouverner toute décision dans les prochaines semaines.** Construire une application dont l'argument central est de franchir une barrière qui tombe le 30 septembre serait une erreur de calendrier, pas une erreur d'analyse.

**[À VÉRIFIER — action datée]** Le 1er octobre 2026, consulter la liste actualisée des participants sur le site de la BCEAO. Trois scénarios :

| Constat au 1er octobre | Lecture |
|---|---|
| Wave, Moov et Telecel sont connectés | La barrière inter-opérateurs disparaît. Le projet doit se justifier **autrement** que par l'interopérabilité |
| Ils sont connectés mais n'ouvrent pas le service au public | L'écart entre raccordement technique et disponibilité réelle devient votre terrain — et il est documentable |
| L'échéance est de nouveau repoussée | La fenêtre reste ouverte, mais elle reste une fenêtre : ne jamais bâtir un actif sur un retard réglementaire |

---

## 4. La position réglementaire que décrit le porteur de projet — et elle est bien réelle

Ce qui est décrit — une application où l'utilisateur **rattache plusieurs comptes** (alias PI-SPI pour le compte bancaire, numéro pour le compte de monnaie électronique), **configure un compte de réception par défaut**, puis **paie un commerçant par QR sans se soucier du rail** — porte un nom exact dans l'Instruction n°001-01-2024 :

| Service réglementé | Régime | Capital minimum |
|---|---|---|
| Agrégation de comptes / information sur les comptes | **Enregistrement** préalable | 10 M FCFA |
| Initiation de paiement | **Agrément** | 20 M FCFA |
| **Les deux ensemble** | Enregistrement + agrément | **30 M FCFA** |

**[ANALYSE]** C'est une position définie, légale, peu capitalistique — environ 45 000 EUR — et, à notre connaissance, **non occupée au Burkina Faso**. L'étude v1.0 avait raison sur le capital et tort sur la disponibilité de la position : elle avait conclu que « la couche est occupée » en observant les agrégateurs **côté marchand et e-commerce** (CinetPay, PayDunya, LigdiCash, YengaPay, Kkiapay). Aucun de ces acteurs n'occupe la position **côté utilisateur final** : agréger les comptes d'un particulier dans une interface unique.

**Correction au §7 de l'étude v1.0 :** il faut distinguer deux couches que l'étude avait confondues.
- **L'agrégation côté marchand** (encaisser depuis plusieurs rails) — saturée, commoditisée, sans marge.
- **L'agrégation côté utilisateur** (voir et utiliser ses comptes dans une seule interface) — définie par le régulateur, non occupée localement, et non fournie par PI-SPI.

---

## 5. Précédent régional : la position n'est pas vierge ailleurs

**[FAIT]** **CHANGE** (iNTech Group, Dakar) opère au Sénégal et en Côte d'Ivoire une plateforme d'interopérabilité entre Orange Money, Wave, MTN Money et Moov Money, ainsi que vers les comptes bancaires. Tarif annoncé : **2,5 % + 100 FCFA par transaction**. Plus de 500 000 clients revendiqués. Certifiée PCI DSS niveau 1.

**[ANALYSE] Deux enseignements, opposés et tous deux utiles.**

1. **La demande est démontrée.** 500 000 clients acceptent de payer 2,5 % + 100 FCFA pour franchir une barrière inter-wallets. Le besoin n'est pas hypothétique.
2. **Ce prix est précisément ce que PI-SPI ramène à zéro.** Une entreprise dont le revenu est le franchissement d'une barrière que le régulateur supprime gratuitement n'a pas de modèle durable. CHANGE ne montre pas seulement que l'idée marche : elle montre aussi ce qui arrive à ce modèle quand le rail devient gratuit.

> Le besoin est réel. Le tarif de ce besoin tend vers zéro. **La monétisation doit donc être ailleurs — ce que l'étude v1.0 concluait déjà, et que ce précédent confirme plutôt qu'il ne l'infirme.**

---

## 6. Sur la conception à deux QR codes

La proposition : **un QR permanent et public pour encaisser** (que le commerçant peut afficher, imprimer, diffuser sans risque) et **un QR distinct, non public, pour la sortie d'espèces**.

**[ANALYSE] Le principe est architecturalement juste**, indépendamment de la vulnérabilité qui l'a inspiré. Il repose sur une séparation que toute conception sécurisée devrait respecter :

```
IDENTIFIANT DE RÉCEPTION           CÉRÉMONIE DE SORTIE
publiable, permanent,       ≠      jamais publiable,
diffusable, non secret             possession + PIN + canal distinct
```

Confondre les deux, c'est faire d'un identifiant destiné à être vu un élément d'un parcours de débit. C'est une faute de conception même si elle n'est aujourd'hui exploitée nulle part.

**[INCONNU — à vérifier avant d'en faire un argument public]** Nous n'avons pas trouvé de documentation confirmant qu'un QR Wave exposé permette à un tiers de retirer des fonds. Les fraudes documentées au Sénégal sur Wave et Orange Money relèvent de l'ingénierie sociale (faux agent, faux code d'annulation, faux fournisseur, hameçonnage), non de l'interception de QR. Par ailleurs, un QR encode normalement un identifiant, pas une autorisation : le retrait chez un agent devrait rester soumis à un code personnel.

**Conséquence pratique :** tester ce scénario soi-même avant d'en faire un argument commercial. Une allégation de faille non vérifiée visant un concurrent nommé est un risque juridique et réputationnel disproportionné par rapport au bénéfice.

**[ANALYSE] Et une limite à assumer.** Un QR statique permanent est un choix, avec un coût connu et déjà identifié au §18 du document fondateur v0.1 : la documentation PI-SPI signale que la **réconciliation automatique n'est pas garantie** avec un QR statique réutilisable. Un commerçant reçoit le paiement, mais ne sait pas à quelle vente il correspond. Pour un vendeur d'étal, c'est sans importance. Pour une boutique avec stock et plusieurs vendeurs, cela le devient. La réponse n'est pas d'abandonner le QR statique, mais de le compléter — montant pré-rempli optionnel, référence de vente, appariement a posteriori.

**Enfin, et c'est l'essentiel : ce n'est pas un actif.** Une conception à deux QR se copie en quelques semaines par n'importe quel concurrent qui la juge utile. C'est une raison d'être meilleur, pas une raison d'être seul.

---

## 7. Position révisée : ce qui reste défendable après ces corrections

L'étude v1.0 concluait que la couche d'expérience n'était pas défendable. **Cette conclusion tient, mais pour une raison plus précise que celle avancée** — et cette précision ouvre une issue.

La couche d'expérience n'est pas défendable **parce qu'une application se copie**. Elle ne l'est pas parce que PI-SPI la fournirait : PI-SPI ne la fournit pas. Après le 30 septembre 2026, Orange Money, Wave, Moov et Telecel disposeront chacun du même rail gratuit et d'applications déjà installées. Le combat se jouera sur la distribution, pas sur la fonctionnalité.

**La question devient donc : que peut faire un tiers que ces quatre acteurs ne feront jamais ?**

**[HYPOTHÈSE] Une seule réponse résiste : la neutralité.**

> Orange Money ne construira jamais une application qui route un paiement vers Moov Money quand elle peut le garder. Wave ne mettra jamais en avant un compte Coris. Chacun est structurellement incapable d'être neutre, parce que la neutralité lui coûte du flux.
>
> **Un tiers sans compte propre, sans flottant, sans intérêt à retenir la valeur, peut être neutre. C'est la seule chose qu'un opérateur ne peut pas copier — non par incapacité technique, mais par conflit d'intérêt.**

Cette neutralité produit deux actifs, tous deux cumulatifs :

1. **La vue consolidée du participant** — ce que personne d'autre ne peut voir, parce que chaque opérateur ne voit que son propre compte. C'est le graphe transactionnel de l'étude v1.0, désormais fondé sur une raison structurelle et non sur une simple antériorité.
2. **La relation aux commerçants que personne ne sert** — les ~193 000 commerces hors des 12 370 actifs, dont l'exclusion est administrative avant d'être technique.

**Formulation révisée :**

> **Le seul acteur neutre du paiement quotidien burkinabè. Ni banque, ni opérateur, ni détenteur de fonds : l'application qui accepte tous les comptes parce qu'elle n'en possède aucun — et qui, de ce fait, voit ce que personne d'autre ne voit.**

---

## 8. Ce qui change dans le plan de terrain

Le protocole de Phase 0 reste valide. **Trois ajouts.**

**Ajout 1 — Une observation datée, à faible coût, le 1er octobre 2026.** Consulter la liste des participants PI-SPI. Si Wave, Moov et Telecel y figurent, tester soi-même un paiement croisé réel. La différence entre « raccordé » et « réellement utilisable par un client » est exactement l'espace où vit ce projet — et elle se mesure en une journée.

**Ajout 2 — Deux questions au guide d'entretien**, à insérer au bloc C :

- *« Est-ce qu'il vous arrive de refuser un client parce qu'il n'a pas le même réseau que vous ? La dernière fois, c'était quand ? »* — mesure la barrière inter-opérateurs telle qu'elle est vécue, avant et après le 30 septembre. Poser la même question avant et après cette date donne une mesure naturelle de l'effet réel du raccordement.
- *« Si un client veut vous payer avec une carte, vous faites comment ? »* — mesure le trou des rails cartes, que PI-SPI ne comble pas et ne comblera pas.

**Ajout 3 — Une question au courrier BCEAO.** Ajouter aux trois questions existantes :

> *« Un établissement enregistré au titre de l'agrégation de comptes et agréé au titre de l'initiation de paiement peut-il, à ce double titre, se raccorder directement à PI-SPI en qualité de participant, ou doit-il nécessairement opérer par l'intermédiaire d'un participant déjà connecté ? »*

**[ANALYSE]** Cette quatrième question est structurante. Si la réponse est « raccordement direct possible », la position d'agrégateur côté utilisateur devient réellement autonome à 30 M FCFA de capital. Si la réponse est « uniquement via un participant », toute l'architecture dépend d'un partenaire — et le mémo de partenariat cesse d'être une commodité pour devenir le chemin critique du projet.

---

## 9. Ce qui n'a pas changé

Trois conclusions de l'étude v1.0 sortent renforcées, pas affaiblies, de cet examen :

1. **Le paiement ne peut pas être le modèle économique.** PI-SPI est gratuit et le devient pour tous. CHANGE facture 2,5 % pour un service que le régulateur rend gratuit. L'argent est ailleurs : crédit, outils, données.
2. **0,98 franc ressort en cash pour chaque franc chargé.** Aucune conception d'application ne change ce chiffre. Seule l'acceptation en aval — le fournisseur, le grossiste — le change.
3. **12 370 commerçants actifs sur ~205 000 commerces.** L'exclusion est administrative (91,4 % sans IFU) avant d'être technique. Une application, si bonne soit-elle, ne délivre pas un RCCM.

**[ANALYSE]** L'application est le canal. La neutralité est la raison d'exister. Le graphe transactionnel est l'actif. Le crédit est le revenu. Aucune de ces quatre lignes n'est interchangeable avec les autres, et confondre le canal avec l'actif est l'erreur que le document fondateur v0.1 commettait — et que cet addendum ne corrige pas.

---

## Sources ajoutées

- [Liste des participants autorisés à ouvrir les services de PI-SPI au public, au 2 avril 2026 (PDF) — BCEAO](https://www.bceao.int/sites/default/files/2026-04/Liste-des-participants_PI-SPI_2%20avril_2026.pdf)
- [PI-SPI — Foire aux questions (accès via l'application du participant)](https://pispi.bceao.int/foire-aux-questions)
- [PI-SPI — L'alias](https://pispi.bceao.int/lalias)
- [CHANGE — plateforme d'interopérabilité Wave & Orange Money, iNTech Group](https://change.sn/)
- [QR code marchand Wave et Orange Money — statique vs dynamique](https://kolonell.com/fr/blog/qr-code-marchand-wave-orange-money-boutique-senegal-2026)
- [Menace sur Wave et Orange Money : arnaques courantes au Sénégal — Jangaan Tech](https://jangaantech.com/arnaques-orange-money-wave-senegal/)

---

**Fin — Addendum v1.1**
