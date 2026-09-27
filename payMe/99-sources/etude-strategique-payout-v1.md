# ÉTUDE STRATÉGIQUE — DÉCONSTRUCTION DU SECTEUR ET TEST DE FAISABILITÉ

## Réponse au Document fondateur v0.1 — Infrastructure de paiement du quotidien

**Version : 1.0**
**Date : 1er septembre 2026**
**Statut : Étude critique de cadrage — contradictoire assumé**
**Portée : Burkina Faso → UEMOA**

---

## AVERTISSEMENT MÉTHODOLOGIQUE

Ce document applique la règle de vérité posée au point 35 du document fondateur. Chaque affirmation est étiquetée :

- **[FAIT]** — vérifié auprès d'une source officielle ou d'une documentation publique, référencée.
- **[HYPOTHÈSE]** — plausible, à tester.
- **[ANALYSE]** — raisonnement construit sur des faits, pouvant être contesté.
- **[INCONNU]** — question ouverte que cette étude n'a pas pu trancher et qui doit l'être avant décision.

Ce document ne cherche pas à valider l'intention fondatrice. Il cherche à la casser. Ce qui survivra sera solide.

---

# PARTIE I — LE VERDICT

## 1. Résumé exécutif en une page

**La thèse centrale du document fondateur n'est plus disponible.**

Le document v0.1 propose de construire une couche d'abstraction et d'expérience au-dessus des rails de paiement fragmentés, afin qu'un participant puisse payer et encaisser sans penser au rail sous-jacent. Cette couche existe déjà. Elle est en cours de déploiement par la BCEAO sous le nom de **PI-SPI**, elle est **gratuite**, et sa connexion devient **obligatoire** pour les banques, les émetteurs de monnaie électronique et les établissements de paiement au **30 septembre 2026**.

PI-SPI fournit nativement : l'alias comme identifiant universel, la vérification du bénéficiaire avant exécution, un QR code unique accepté par tous les comptes connectés, l'exécution en moins de 10 secondes 24h/24, le request-to-pay, et la gratuité totale des transferts et des paiements domestiques. La BCEAO fournit en plus du **code source ouvert** et une **infrastructure de sécurité subventionnée** à ses participants pour accélérer leur intégration.

Autrement dit : les sections 5, 6, 9.1 à 9.7, 14 et 21 du document fondateur décrivent, presque ligne par ligne, le cahier des charges de PI-SPI. Le projet, tel que formulé, propose de construire ce que la banque centrale distribue gratuitement et impose par obligation réglementaire.

**Statut de l'hypothèse fondatrice : RÉFUTÉE EN L'ÉTAT.**

Non parce que l'idée était mauvaise — elle était juste — mais parce que sa fenêtre s'est refermée entre le moment où elle a été formulée et aujourd'hui. Un actif indétrônable ne se construit jamais sur une couche qu'un régulateur commoditise activement, gratuitement, et par obligation.

**Mais l'étude fait apparaître autre chose, et c'est la vraie découverte.**

PI-SPI a construit un rail universel et gratuit — et ce rail est vide. Dix mois après son lancement, il compte 30 millions d'utilisateurs connectés pour **1 million de transactions** et 110 milliards FCFA de valeur. Soit 0,03 transaction par utilisateur connecté sur dix mois, et un panier moyen de 110 000 FCFA — ce n'est pas du paiement du quotidien, c'est du transfert de valeur élevée. La BCEAO elle-même le formule : *« l'infrastructure a trouvé ses utilisateurs avant de trouver ses usages »*.

Le vide n'est donc pas dans le rail. Il est dans **l'usage**. Et l'usage manquant a un nom précis, mesurable, et documenté par les chiffres officiels : **l'acceptation marchande, et la rétention de la valeur dans le circuit numérique.**

Au Burkina Faso, en 2024 : pour chaque franc chargé sur un compte de monnaie électronique, **0,98 franc en ressort en cash**. Sur 389 172 unités économiques recensées, environ 205 000 relèvent du commerce — et seulement **12 370 commerçants acceptent activement un paiement numérique**. Soit **6 %**. Et sur 59 243 commerçants qui se sont inscrits, **79 % ont abandonné**.

**Il y a donc bien un actif à construire. Ce n'est simplement pas celui que le document v0.1 décrit.**

---

## 2. Ce qui a changé depuis la rédaction du document v0.1

| Ce que le document suppose | Ce qui est vrai au 1er septembre 2026 |
|---|---|
| La fragmentation des rails est le problème central | La BCEAO la supprime activement et gratuitement via PI-SPI |
| L'abstraction du rail est une proposition de valeur | C'est devenu une commodité réglementaire fournie sans frais |
| Le projet doit « chercher à exploiter les mécanismes existants » (alias, vérification) | Ces mécanismes sont livrés clés en main aux participants agréés |
| PI-SPI est un contexte « particulièrement favorable » | PI-SPI est simultanément la subvention et le principal destructeur de la thèse |
| Le marché possède « plusieurs agrégateurs » | La couche d'agrégation est saturée et en voie de commoditisation totale |
| La friction du geste de payer est le problème | La friction du geste d'**encaisser** et de **rester numérique** est le problème |

---

# PARTIE II — DÉCONSTRUCTION DU SECTEUR

## 3. Le rail : ce que PI-SPI livre réellement

**[FAIT]** PI-SPI a été lancé officiellement le **30 septembre 2025** à Dakar. La plateforme a été développée **intégralement en interne** par la BCEAO.

**[FAIT]** Périmètre fonctionnel livré :
- Paiements instantanés entre prestataires, exécution en **moins de 10 secondes**, 24h/24 et 7j/7
- **Alias** (numéro de téléphone, QR code, adresse de paiement) comme identifiant, sans exposition d'informations personnelles
- **QR code standardisé** : *« un seul QR code peut accepter tous les types de paiement »*
- Vérification et affichage du bénéficiaire **avant** exécution
- Request-to-pay
- Quatre typologies de clients : particulier (P), commerçant personne physique (C), personne morale (B), structure gouvernementale (G)
- Gestion de trésorerie automatisée pour les entreprises, versement des salaires publics et des aides sociales

**[FAIT] Tarification : gratuité domestique.** Le site officiel affiche *« Payer c'est gratuit »* et *« transferts entre particuliers gratuits »*. La responsable de PI-SPI confirme que **les transferts et les paiements domestiques sont gratuits**, les opérations transfrontalières intra-UEMOA laissant une commission discrétionnaire de 1 % maximum aux opérateurs.

**[FAIT]** Les transferts vers un particulier sont limités à **30 par mois** ; la catégorie « paiement » s'applique aux bénéficiaires commerçants, personnes morales et gouvernementaux.

**[FAIT] Adoption réelle au 20 juillet 2026, dix mois après le lancement :**

| Indicateur | Valeur |
|---|---|
| Utilisateurs connectés | 30 millions (≈ 40 % de la population adulte de l'UEMOA) |
| Transactions traitées | 1 million |
| Valeur totale | 110 milliards FCFA (≈ 190 M USD) |
| Panier moyen implicite | ≈ 110 000 FCFA |
| Institutions participantes | 80 (45 au lancement, 74 fin déc. 2025), majoritairement des banques |
| Transactions par utilisateur connecté / 10 mois | **0,03** |

**[FAIT]** Composition des participants à un stade antérieur : 58 banques, 6 services de mobile money, 6 institutions de microfinance — soit une **très forte dominante bancaire** et une sous-représentation des acteurs qui détiennent réellement les usages de masse.

**[FAIT] Calendrier d'obligation :**
- **30 septembre 2026** : connexion obligatoire pour les banques, les émetteurs de monnaie électronique et les établissements de paiement
- **30 juin 2027** : échéance prolongée pour les institutions de microfinance encore en tests techniques
- Les échéances ont déjà été repoussées une fois, les exigences de sécurité ralentissant les raccordements

**[ANALYSE] Ce que ces chiffres disent vraiment.** Un rail à 110 000 FCFA de panier moyen n'est pas un rail de paiement du quotidien : c'est un rail de transfert interbancaire de valeur élevée, utilisé par une frange bancarisée. Le décalage entre 30 millions de connectés et 1 million de transactions n'est pas un échec technique — c'est l'écart normal entre *avoir accès* et *avoir une raison*. La BCEAO a résolu le problème de la plomberie. Elle n'a pas — et ne peut pas, par construction — résoudre le problème de la demande.

**[INCONNU CRITIQUE]** La tarification PI-SPI applicable au **bénéficiaire commerçant** n'est pas publiée. « Payer c'est gratuit » vise le payeur. Il reste à établir si le participant qui tient le compte du commerçant peut prélever une commission d'acceptation, et à quel plafond. **Cette réponse conditionne l'intégralité du modèle économique de tout projet d'acceptation marchande.** C'est la première question à poser à la BCEAO et à un participant agréé.

---

## 4. Le marché : ce que disent les chiffres officiels du Burkina Faso

### 4.1 Monnaie électronique, exercice 2024 (BCEAO)

**[FAIT]**

| Indicateur | Valeur |
|---|---|
| Comptes ouverts | 23 708 070 |
| Comptes actifs | 8 654 640 |
| **Taux d'activité** | **36,5 %** |
| Volume total de transactions | 2 174 926 797 |
| Valeur totale | 20 140 milliards FCFA |
| Part du Burkina dans le volume de l'Union | 18,2 % (en recul, contre 19,7 % en 2023) |
| Points de service | 149 369 |
| **Commerçants inscrits** | **59 243** |
| **Commerçants actifs** | **12 370** |

**[FAIT] Répartition par type d'opération :**

| Opération | Volume | Valeur (Md FCFA) |
|---|---:|---:|
| Rechargements | 233 478 140 | 5 649 |
| Retraits | 268 040 494 | 5 539 |
| Transferts P2P | 411 866 209 | 6 457 |
| Paiements | 1 197 341 417 | 875 |
| dont crédit téléphonique | 1 101 765 090 | 417 |

### 4.2 Ce que ces chiffres révèlent — quatre constats décisifs

**[ANALYSE] Constat 1 — Le circuit numérique ne retient rien.**

Rechargements : 5 649 Md FCFA. Retraits : 5 539 Md FCFA.

> **Pour chaque franc entré dans le système, 0,98 franc en ressort en cash.**

Le mobile money burkinabè n'est pas un système de paiement. C'est un **système de transport de cash** : on charge, on transfère, on retire. La valeur ne séjourne pas. Sans séjour de la valeur, il n'y a ni flottant, ni donnée de flux exploitable, ni base de crédit, ni écosystème — donc **aucun actif cumulatif possible**.

Ce chiffre est cohérent avec les données mondiales : la GSMA relève que 37 % des transactions restent adossées au cash, avec un ratio de 0,76 USD retiré pour chaque dollar versé, et que la valeur qui reste numérique plafonne à 29 %. **Le Burkina fait nettement pire que la moyenne.**

**[ANALYSE] Constat 2 — Le paiement marchand est statistiquement inexistant.**

La ligne « Paiements » pèse 875 Md FCFA, soit **4,35 % de la valeur totale**. En retirant le crédit téléphonique (417 Md), il reste **459 Md FCFA, soit 2,28 % de la valeur totale**, pour environ 95,6 millions d'opérations et un panier moyen de ≈ 4 800 FCFA.

À comparer : 5 539 Md de retraits. **Le retrait en cash pèse 12 fois le paiement marchand réel.**

*(Réserve méthodologique : le rapport BCEAO ne précise pas explicitement si la ligne « crédit téléphonique » est un sous-ensemble de la ligne « Paiements ». Les deux lectures sont présentées ; les deux conduisent à la même conclusion.)*

**[ANALYSE] Constat 3 — Le maillon commerçant est le goulot, et il est en train de lâcher.**

- 59 243 commerçants inscrits → **12 370 actifs**, soit **20,9 %**. Quatre commerçants sur cinq qui se sont inscrits ont cessé d'utiliser le service.
- L'INSD recense 389 172 unités économiques au Burkina, dont **52,7 % dans le commerce**, soit environ 205 000 commerces.
- **Taux de pénétration réel de l'acceptation numérique : 6 %.**

**[ANALYSE] Constat 4 — Le parc marchand est structurellement inéligible.**

**[FAIT]** Recensement général des entreprises 2024 (INSD, publié octobre 2025) :
- **96,5 % des unités économiques sont informelles**
- 97,9 % sont des entreprises individuelles
- **91,4 % n'ont pas d'IFU** (identifiant fiscal unique)
- 92 % ne sont pas affiliées à la sécurité sociale
- Microentreprises : 98,3 % informelles ; petites entreprises : 87,2 % ; moyennes : 52,6 %

**[FAIT]** Or l'ouverture d'un compte marchand Orange Money au Burkina exige sept pièces, dont **RCCM, IFU et attestation de situation fiscale**.

> **Conclusion : 91 % du parc marchand ne peut pas ouvrir un compte marchand. Ce n'est pas un problème d'expérience utilisateur. C'est un problème d'éligibilité administrative.**

---

## 5. L'économie du commerçant : pourquoi il abandonne

**[FAIT]** Conditions documentées d'un compte marchand Orange Money Burkina Faso :

| Poste | Montant |
|---|---|
| Frais d'ouverture | 50 000 FCFA HT |
| Commission, panier moyen < 20 000 FCFA | 1,3 – 1,6 % |
| Commission, panier moyen supérieur | 1,0 – 1,3 % |
| Frais de règlement | 0,5 %, plafonné à 5 000 FCFA |
| Abonnement API mensuel | 25 000 FCFA |
| Délai de règlement | **J+3 ouvré** (J+1 possible, +0,1 %) |
| Délai d'activation | 7 à 14 jours ouvrés |

**[ANALYSE]** Pour un détaillant de quartier réalisant 300 000 FCFA de chiffre d'affaires mensuel avec une marge brute de 15 % (45 000 FCFA), les 25 000 FCFA d'abonnement API absorbent **55 % de sa marge brute**. Les 50 000 FCFA d'ouverture représentent plus d'un mois de marge. Le règlement J+3 est incompatible avec un modèle où le stock est racheté chaque matin auprès d'un grossiste payé en espèces.

**Les quatre causes réelles de l'abandon, par ordre d'importance :**

1. **Inéligibilité administrative** — pas de RCCM, pas d'IFU, donc pas de compte marchand possible (91,4 % du parc)
2. **Coûts fixes** — l'abonnement et l'ouverture, pas la commission, sont ce qui tue le modèle sur les petits volumes
3. **Rupture de trésorerie** — J+3 face à un cycle d'achat quotidien
4. **Rupture du circuit amont** — le commerçant paie son fournisseur en cash, donc il retire tout, donc l'encaissement numérique lui coûte deux fois : la commission puis le retrait

**[ANALYSE] Le point 4 est le plus important et le moins traité.** Tant que le grossiste n'accepte pas le numérique, le détaillant qui encaisse en numérique subit une pénalité nette. **La digitalisation du paiement au détail ne peut pas réussir avant, ou sans, la digitalisation du paiement fournisseur.** C'est un problème de chaîne, pas d'interface.

---

## 6. La contrainte que le document fondateur n'a pas vue : la traçabilité est un coût, pas une valeur

Le document v0.1 traite la traçabilité et la preuve (point 13, point 17, point 18) comme des bénéfices utilisateur.

**[FAIT]** Le PNUD rapporte, à propos de la plateforme SYCOTAX de collecte d'impôts au Burkina, un accueil « mitigé » chez les acteurs informels : certains apprécient « la facilité de paiement en toute discrétion », d'autres **craignent le recensement et une augmentation des taxes**.

**[ANALYSE]** Pour les 96,5 % d'unités informelles, un outil qui rend le chiffre d'affaires lisible par un tiers est un **risque fiscal**, pas un service. Toute proposition de valeur construite sur « meilleure traçabilité, meilleure preuve, meilleure réconciliation » s'adresse en réalité aux 3,5 % d'entreprises formelles — un marché déjà servi par les agrégateurs existants et par les banques.

> **Conséquence de conception :** la traçabilité doit être un bénéfice **privé** au commerçant (il voit ses ventes, il obtient du crédit), jamais un dispositif de **visibilité externe**. Un produit conçu pour la formalisation échouera. Un produit conçu pour la discrétion, qui débouche *ensuite* et *volontairement* sur la formalisation quand elle devient rentable pour le commerçant, peut réussir.

**[INCONNU]** Le seuil auquel un commerçant informel accepte la visibilité en échange d'un accès au crédit. C'est une question empirique, testable, et centrale.

---

## 7. La couche d'orchestration est déjà occupée — et elle est en train de perdre sa valeur

**[FAIT]** Acteurs occupant la position d'agrégation/orchestration sur le Burkina et l'UEMOA : CinetPay (agréé établissement de paiement en Côte d'Ivoire, sept. 2025), PayDunya, LigdiCash, YengaPay (Kreezus, Ouagadougou), Kkiapay, Simiz, Money Fusion, Feexpay (agréé), Dunya Digital Payment, Intouch, Semoa (licence pleine BCEAO), Bizao, Hub2.

**[FAIT]** Ces acteurs offrent déjà, exactement : intégration multi-opérateurs sous une API unique, QR multi-rails, pay-in/payout, webhooks, tableau de bord de réconciliation par jour/boutique/canal, sandbox — **sans détenir les fonds**, l'exécution restant chez le prestataire agréé.

**[FAIT]** L'État burkinabè opère **Faso Arzeka**, plateforme nationale de paiements numériques du Trésor (DGTCP), qui agrège Arzeka Money, mobile money, cartes et virements bancaires, avec accès app/USSD (*700#), et revendique plus de 200 000 utilisateurs. Le pays affiche par ailleurs un programme public explicite d'« État connecté, souverain et **sans cash** ».

**[ANALYSE]** La position décrite au point 21 du document fondateur — « au-dessus des rails, en dessous des applications métier » — est donc simultanément :
- occupée par une douzaine d'acteurs privés dont plusieurs déjà agréés,
- commoditisée par le haut par PI-SPI (gratuit, obligatoire, avec code ouvert fourni),
- occupée par le bas sur le segment public par Faso Arzeka.

**Une position prise en tenaille entre un régulateur gratuit et un État souverainiste n'est pas une position défendable.** C'est le pire endroit possible du secteur.

---

## 8. Ce que les benchmarks internationaux disent réellement

Le document v0.1 propose d'étudier la Chine, l'Inde, le Brésil et l'Europe pour en tirer des « principes transférables ». La leçon transférable est unique et elle est économique, pas fonctionnelle.

**[FAIT] Inde — UPI.** 228,3 milliards de transactions et 3 400 milliards USD traités en 2025. NPCI ne dégage que 1 552 crore INR sur ce volume. Le gouvernement subventionne le système à hauteur de 1 500 crore INR (FY2025), budgétés à 2 000 crore pour FY2026-27. PhonePe : 657 millions d'utilisateurs, 45 % de part de marché, **revenus de paiement effectivement nuls** — et une croissance de **+206 % des revenus de services financiers** (assurance, prêts) en FY2025. Paytm monétise 117 millions de terminaux marchands en vendant du crédit et de l'assurance. Le Parlement indien a dû **amender en 2026 la loi de zéro-MDR** vieille de six ans pour rouvrir la possibilité de frais marchands.

**[FAIT] Brésil — Pix.** Les frais marchands sont passés de 2–5 % (cartes) à **0,33 %**. Pix a dépassé les transferts P2P en volume dès octobre 2025. Taux d'activité : **94 %**.

**[FAIT] Comparaison des taux d'activité mensuelle (GSMA 2026) :** mobile money mondial **25,7 %** — bloqué à ce niveau depuis cinq ans, avec environ 1,7 milliard de comptes inactifs chaque mois ; UPI **70 %** ; Pix **94 %**. ARPU mobile money : **1,75 USD/mois**. Paiements marchands : **8 % de la valeur mensuelle** contre 21 % pour le P2P. Alipay tire **70 à 80 % de sa valeur du commerce**.

**[ANALYSE] La leçon, en une phrase :**

> **Quand un régulateur rend le rail gratuit, la valeur ne disparaît pas — elle migre vers l'adjacent : le crédit, l'assurance, les outils de gestion, la donnée. Et seuls deux ou trois acteurs par marché, ceux qui ont l'échelle et la profondeur de gamme, atteignent le seuil où cette migration devient rentable.**

Corollaire direct pour ce projet : **le paiement n'est pas un modèle économique. C'est un coût d'acquisition.** Toute thèse qui prévoit de gagner de l'argent sur le transport de la transaction est morte à la naissance dans un environnement PI-SPI.

Second corollaire, sur l'écart 25,7 % / 94 % : le mobile money n'est pas resté à 25,7 % d'activité par défaut de rail. Il y est resté par **défaut d'acceptation**. Alipay et Pix ont franchi le seuil parce que le commerce s'est mis à accepter. C'est exactement le point où le Burkina bloque à 6 %.

---

# PARTIE III — TEST DE L'ACTIF INDÉTRÔNABLE

## 9. Réfutation de l'actif candidat du point 27

Le document propose : *« un réseau de transactions de confiance et d'intégrations de paiement »*.

**[ANALYSE] Cet actif ne tient pas. Test de reproductibilité :**

| Composante annoncée | Reproductible par un concurrent ? | Verdict |
|---|---|---|
| Intégrations avec les prestataires | Oui — une douzaine d'acteurs les ont déjà ; PI-SPI les rend triviales | ❌ |
| Relations marchands | Oui, mais **lentement et chèrement** | ⚠️ partiellement |
| Historique opérationnel | Non — cumulatif par nature | ✅ |
| Données de fiabilité | Non — si et seulement si les flux sont assez denses | ✅ conditionnel |
| Mécanismes de sécurité | Oui — et la BCEAO en subventionne une partie | ❌ |
| Standards d'interaction | Non — c'est PI-SPI qui les fixe désormais | ❌ |
| Workflows intégrés | Oui, à moyen terme | ❌ |

**Verdict : l'actif tel que formulé est à 70 % constitué d'éléments réplicables ou déjà commoditisés.** Ce qui reste défendable — l'historique et la donnée de flux — n'est pas un actif de paiement. C'est un actif de **crédit**.

## 10. Les trois actifs réellement défendables, classés

### Actif A — Le graphe transactionnel du commerce informel ★★★★★

**[HYPOTHÈSE]** L'historique de flux vérifié de dizaines de milliers de commerçants sans états financiers, sans IFU et sans garantie bancaire.

- **Non copiable** : ne s'obtient qu'en ayant réellement encaissé pour ces commerçants pendant des années. Aucun capital ne l'achète, aucune API ne le réplique.
- **Cumulatif** : sa valeur croît de façon non linéaire avec la durée et la densité.
- **Monétisable ailleurs que sur le paiement** : crédit de stock, avance de trésorerie, crédit fournisseur, assurance, scoring vendu à des tiers.
- **Précédents** : c'est l'actif de Moniepoint, de PhonePe, de Paytm, d'Alipay. Aucun d'eux ne gagne d'argent sur le paiement.

### Actif B — Le réseau de déploiement et de service terrain ★★★★☆

**[HYPOTHÈSE]** Une capacité physique d'enrôler, former, dépanner, réconcilier et recouvrer auprès de commerçants non techniciens, en langues locales, jusque dans les quartiers et les zones secondaires.

- **Lent et coûteux à reproduire** — c'est précisément ce qui en fait une barrière.
- Les 149 369 points de service existants appartiennent aux EME ; ils servent le cash-in/cash-out, pas le service marchand.
- **Précédent direct** : c'est ce qui a fait Moniepoint au Nigeria, dans un marché où l'infrastructure de paiement était déjà résolue.
- **Risque** : forte intensité capitalistique et opérationnelle ; peu compatible avec une équipe restreinte en phase initiale.

### Actif C — La position sur le flux grossiste → détaillant ★★★☆☆

**[HYPOTHÈSE]** Capter le paiement fournisseur, là où les montants sont élevés et où le cash domine encore presque intégralement.

- Le plus riche : c'est là que se trouve la valeur et le besoin de crédit commercial.
- Le plus difficile : exige de convaincre les deux côtés simultanément, et se heurte frontalement à la réticence fiscale des grossistes.
- **Levier décisif** : c'est le seul angle qui résout le Constat 1 (0,98 franc ressort en cash). Si le fournisseur accepte le numérique, le détaillant n'a plus de raison de retirer.

**[ANALYSE] Recommandation de séquence : A d'abord, B en soutien de A, C comme pari de deuxième vague.**

---

## 11. Test de survie économique — le paiement seul ne finance rien

**[ANALYSE]** Modèle : commerçant de proximité, panier moyen 2 000 FCFA, 12 transactions par jour, 365 jours.

| Commerçants actifs | GTV annuel | Revenu à 0,3 % net | Revenu à 0,5 % net |
|---:|---:|---:|---:|
| 5 000 | 43,8 Md FCFA | 131 M FCFA | 219 M FCFA |
| 10 000 | 87,6 Md FCFA | 263 M FCFA | 438 M FCFA |
| 30 000 | 262,8 Md FCFA | 788 M FCFA | 1 314 M FCFA |
| 60 000 | 525,6 Md FCFA | 1 577 M FCFA | 2 628 M FCFA |

**Base de coûts réaliste au Burkina** pour une structure agréée : équipe de 25 à 40 personnes (technique, terrain, conformité, support) ≈ **250 à 400 M FCFA par an**, hors coût d'acquisition terrain.

**Lecture :**

- À **10 000 commerçants actifs** — soit **80 % du parc marchand actif national actuel (12 370)** — l'activité paiement seule atteint tout juste le seuil de couverture des coûts fixes. Aucune marge, aucun financement de la croissance.
- Il faut dépasser **30 000 commerçants actifs**, soit **2,4 fois le parc national actif d'aujourd'hui**, pour que le paiement seul dégage une marge significative.
- Ce seuil est atteignable, mais il exige plusieurs années et un capital substantiel — pendant lesquels l'entreprise doit vivre d'autre chose.

> **Démonstration arithmétique : dans un environnement PI-SPI, le paiement ne peut pas être le modèle économique. Il doit être le canal d'acquisition d'un revenu adjacent.**

**[HYPOTHÈSE] Où se trouve le revenu réel :**

| Source | Assiette | Ordre de grandeur |
|---|---|---|
| Avance de trésorerie / crédit de stock | GTV observé du commerçant | 2–5 % du montant avancé, cycles courts |
| Crédit fournisseur (BNPL B2B) | Flux grossiste → détaillant | La plus grosse assiette, le plus long à ouvrir |
| Abonnement outil de gestion | Commerçants formalisés seulement | Faible et plafonné, ne pas en dépendre |
| Assurance distribuée | Base marchande | Marge de distribution |
| Paiement | GTV total | **Proche de zéro — c'est le canal, pas le revenu** |

---

# PARTIE IV — RÉGLEMENTATION

## 12. Cartographie du cadre applicable

**[FAIT] Instruction n°001-01-2024 du 23 janvier 2024** relative aux services de paiement dans l'UMOA. Huit catégories de services : dépôts/retraits d'espèces avec gestion de compte ; virements et prélèvements ; transferts de fonds ; paiements par communication ; émission d'instruments de paiement ; **acquisition de paiement** ; **initiation de paiement** ; **agrégation de comptes / information sur les comptes**.

**[FAIT] Régime d'autorisation :**
- Services (a) à (g) : **agrément** de la BCEAO requis
- Service (h), agrégation de comptes : **enregistrement préalable** (régime allégé)

**[FAIT] Capital minimum :**

| Périmètre | Capital minimum |
|---|---|
| Agrégation de comptes seule | **10 M FCFA** |
| Initiation de paiement seule | **20 M FCFA** |
| Agrégation + initiation | **30 M FCFA** |
| Autres services de paiement | **100 M FCFA** |

Capital intégralement libéré en FCFA ; la décision d'agrément peut imposer un minimum supérieur.

**[FAIT] Interdictions faites aux établissements de paiement :** opérations de crédit, rémunération des comptes, opérations de change, recours à des distributeurs tiers, placement des fonds clients au-delà des seuils (minimum 30 % en dépôts à vue, maximum 25 % en dépôts à terme et titres d'État).

**[FAIT] Obligations :** réponse aux réclamations **sous 7 jours ouvrés**, recours devant les organes nationaux de qualité des services financiers avant action judiciaire. Période transitoire de mise en conformité précisée par l'**Avis n°006-05-2025**.

**[FAIT] Accès à PI-SPI :** *« Ne sont connectées au système d'interopérabilité que les institutions régulées par la BCEAO »*. Les fintechs non régulées doivent se réinventer via des partenariats avec des entités régulées. Les catégories admises incluent banques, IMF, EME et établissements de paiement — y compris agrégateurs, initiateurs et services d'information sur les comptes.

## 13. Les trois voies réglementaires, évaluées

| Voie | Capital | Délai | Accès PI-SPI | Pouvoir de négociation | Actif réglementaire |
|---|---|---|---|---|---|
| **1. Prestataire technique** (opère pour le compte d'un agréé) | Aucun | Immédiat | Indirect | Faible — marge captive | Aucun |
| **2. Partenariat avec un EP/EME agréé** puis agrément propre | 30 M FCFA à terme | 3–6 mois puis 12–24 | Indirect puis direct | Moyen puis fort | Progressif |
| **3. Agrément direct** agrégation + initiation | 30 M FCFA | 12–24 mois | Direct | Fort | Réel |

**[ANALYSE]** Le capital minimum n'est **pas** la barrière : 30 M FCFA ≈ 45 000 EUR. Les vraies barrières sont le **délai d'instruction**, la **gouvernance exigée** (dirigeants, actionnariat, contrôle interne), le **dispositif LBC/FT**, et les **fonds propres opérationnels réels** nécessaires pour survivre à la période d'instruction.

**[ANALYSE] Recommandation : voie 2.** Elle permet de tester le marché en 3 à 6 mois derrière un agréé — donc de savoir si l'hypothèse tient **avant** d'engager 18 mois d'agrément — tout en construisant en parallèle le dossier d'agrément propre. C'est la seule voie qui ne fait pas dépendre la survie de l'entreprise d'un pari réglementaire pris avant la première preuve de marché.

**[INCONNU CRITIQUE]** L'interdiction du crédit faite aux établissements de paiement est un obstacle direct à l'Actif A. Si l'entreprise ne peut pas prêter, elle doit soit **originer pour le compte d'un SFD ou d'une banque partenaire** (modèle « lending as a service », marge de distribution), soit obtenir un statut différent. **Cette question doit être tranchée avec un conseil réglementaire avant toute décision structurante.**

**[INCONNU CRITIQUE]** Le KYC minimal admissible pour un compte marchand de faible valeur. La réponse détermine si les 91,4 % de commerçants sans IFU sont adressables ou non — c'est-à-dire si le marché cible existe. **À vérifier auprès de la BCEAO / d'un EME agréé avant toute conception produit.**

---

## 14. Risques structurels

| # | Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|---|
| R1 | **PI-SPI absorbe la couche d'expérience** | Élevée — déjà en cours | Fatal à la thèse v0.1 | Ne pas construire la couche. Construire l'usage au-dessus. Traiter PI-SPI comme une subvention. |
| R2 | **Extension du périmètre public** (Faso Arzeka, agenda « État sans cash ») | Moyenne à élevée | Élevé | Se positionner sur le commerce privé et informel, jamais sur l'encaissement public. Rester complémentaire, pas concurrent. |
| R3 | **Rupture monétaire AES / sortie de l'UEMOA** | Faible à court terme | Catastrophique | Architecture rail-agnostique et découplage du domaine métier — bonne intuition du doc v0.1, mais pour cette raison-ci, pas pour des raisons d'UX. |
| R4 | **Guerre des prix étendue à l'acceptation** — Wave à 1 %, réduction d'effectifs au Burkina et au Mali, statut bancaire obtenu en Côte d'Ivoire | Élevée | Élevé | Ne pas concourir sur le prix du paiement. Gratuité assumée à l'encaissement, monétisation adjacente. |
| R5 | **Le commerçant informel refuse la visibilité** (cas SYCOTAX) | Élevée | Élevé | Concevoir pour la discrétion. La formalisation doit être un choix du commerçant, motivé par un gain, jamais une condition d'entrée. |
| R6 | **Le circuit amont reste en cash** | Très élevée — c'est le statu quo | Élevé | Séquencer : détaillant d'abord pour la donnée, fournisseur ensuite pour fermer le circuit. |
| R7 | **Coût du capital et durée avant seuil** — 30 000 commerçants actifs à atteindre | Élevée | Élevé | Revenu adjacent activé tôt ; ne pas viser la couverture nationale avant d'avoir prouvé la rétention sur une zone. |

---

# PARTIE V — REFORMULATION ET PLAN DE PREUVE

## 15. Reformulation de la position

**Position v0.1 (à abandonner) :**
> « Infrastructure d'orchestration et d'expérience du paiement du quotidien. »

**Position v1.0 proposée (à tester) :**
> **« L'infrastructure d'encaissement et de trésorerie du commerce de proximité : gratuite à l'encaissement, construite au-dessus de PI-SPI, monétisée sur le crédit et les outils. »**

**Le renversement stratégique tient en une phrase :**

> **PI-SPI n'est pas votre concurrent. C'est votre subvention.**

PI-SPI vous fournit gratuitement le rail, le QR universel, l'alias, la vérification du bénéficiaire et l'exécution en dix secondes — c'est-à-dire l'essentiel de ce que le document v0.1 se proposait de construire à ses frais. Le coût marginal du paiement tombe à près de zéro. Ce qui reste rare, et donc ce qui vaut, se déplace : **la relation au commerçant, la densité de sa donnée de flux, et sa trésorerie.**

**Formulation fondatrice révisée :**

> Nous voulons rendre au commerçant de proximité burkinabè le pouvoir d'encaisser sans condition administrative, sans coût fixe et sans délai — puis transformer son historique de flux en accès au crédit qu'aucune banque ne peut aujourd'hui lui accorder.
>
> Le paiement est notre canal d'acquisition, pas notre revenu. Le rail est fourni par la BCEAO. Notre actif est le graphe transactionnel du commerce informel, et il n'existe qu'à condition que la valeur cesse de ressortir en cash.

## 16. Métrique centrale — remplacer le TTTP

**[ANALYSE]** Le TTTP (point 31) est une métrique correcte qui mesure la mauvaise chose. Un paiement rapide sur un rail vide reste un rail vide. Le TTTP mesure la qualité du geste ; il ne mesure pas l'existence d'un actif.

**Métrique centrale proposée :**

> ### DVR — Digital Value Retention
> **Part de la valeur encaissée par un commerçant qui est encore dans le circuit numérique à J+7.**

C'est la métrique qui gouverne l'existence même de l'actif. Aujourd'hui, à l'échelle nationale, le DVR implicite est proche de **2 %** (0,98 franc retiré pour 1 franc chargé). S'il ne monte pas, il n'y a ni flottant, ni donnée de flux dense, ni crédit possible — donc pas d'entreprise.

**Métriques secondaires :**
- Taux de rétention marchande à S4, S8, S12 (contre 20,9 % au niveau national actuel)
- Nombre de transactions par commerçant actif par jour
- Ratio cash-out à 48 h
- Part du flux fournisseur payé en numérique
- TTTP conservé comme **métrique d'hygiène produit**, pas comme métrique stratégique

## 17. Plan de preuve — 90 jours, trois hypothèses falsifiables

Chaque hypothèse a un **critère de mort explicite**. Si le critère est atteint, l'hypothèse est abandonnée sans négociation.

### H1 — Éligibilité et acceptation
> Un commerçant informel de Ouagadougou acceptera et maintiendra un encaissement numérique si le coût fixe est nul, le règlement instantané, et l'inscription possible sans RCCM ni IFU.

- **Test** : 50 commerçants, trois zones contrastées (marché central, quartier périphérique, axe commerçant), 8 semaines.
- **Mesure** : taux d'activation, taux de rétention à S4 et S8, transactions/jour.
- **Critère de mort** : moins de 40 % encore actifs à S8.
- **Préalable bloquant** : établir ce que le KYC BCEAO autorise réellement pour un compte marchand de faible valeur. **Sans cette réponse, H1 n'est pas testable.**

### H2 — Rétention du numérique *(l'hypothèse décisive)*
> Sur la cohorte H1, plus de 25 % de la valeur encaissée reste dans le circuit numérique à J+7.

- **Mesure** : DVR, ratio cash-out à 48 h, destination des sorties.
- **Critère de mort** : DVR inférieur à 10 %.
- **[ANALYSE]** C'est l'hypothèse qui décide de tout. Si elle tombe, il n'y a pas d'actif à construire dans ce pays à ce stade — et il vaut mieux le savoir au bout de 90 jours qu'au bout de trois ans. Le référentiel national actuel étant ≈ 2 %, tout résultat au-dessus de 10 % constitue déjà une information majeure.

### H3 — Consentement à payer pour l'adjacent
> Au moins 15 % des commerçants retenus acceptent un service payant au-dessus du paiement gratuit (avance de trésorerie, crédit de stock, outil de suivi).

- **Test** : proposition d'une avance de trésorerie plafonnée, adossée au GTV observé sur 6 semaines.
- **Critère de mort** : moins de 5 %.

### Livrables de fin de phase
1. Réponse écrite de la BCEAO ou d'un participant agréé sur : la tarification PI-SPI côté bénéficiaire commerçant, le KYC marchand minimal, et le régime applicable à l'origination de crédit par un établissement de paiement.
2. Cohorte de 50 commerçants instrumentée, avec DVR mesuré.
3. Un partenaire agréé (EP, EME ou SFD) engagé par lettre d'intention.
4. Décision go / no-go documentée, avec le résultat de chaque critère de mort.

---

## 18. Ce que le document v0.1 doit conserver, et ce qu'il doit abandonner

### À conserver — c'est du savoir-faire réel et différenciant

| point | Élément | Pourquoi |
|---|---|---|
| Point 8 | Symétrie payeur / encaisseur | Juste et structurante ; un commerçant est aussi un payeur fournisseur — c'est précisément le pont vers l'Actif C |
| Point 15 | Modèle d'états transactionnels, statut `UNKNOWN` | Excellent. C'est une source de fiabilité opérationnelle et un différenciateur d'ingénierie face aux agrégateurs qui traitent le paiement en booléen |
| Point 16 | Idempotence, identifiant d'intention, double paiement | Idem. La confiance d'un commerçant se perd sur un double débit, pas sur deux secondes de latence |
| Point 18 | Réconciliation | C'est le vrai cœur de valeur — mais **côté commerçant**, pas côté payeur |
| Point 35 | Discipline fait / hypothèse / proposition / décision / validation | À conserver absolument. C'est ce qui a permis à cette étude d'être possible |
| Point 22 | Liste des non-suppositions | Discipline rare et saine |

### À abandonner

| point | Élément | Raison |
|---|---|---|
| Point 6, point 21 | « Rendre le rail secondaire dans l'expérience » comme proposition de valeur centrale | Livré gratuitement par PI-SPI |
| Point 2, point 37 | Ambition de « couche universelle d'expérience transactionnelle » | Position non défendable, prise en tenaille |
| Point 11, point 31 | TTTP comme métrique centrale | Mesure le geste, pas l'actif. Rétrogradé en métrique d'hygiène |
| Point 17 | Traçabilité présentée comme bénéfice utilisateur | Pour 96,5 % du parc, c'est un coût |
| Point 7 | Hypothèse V0 (un moyen de paiement / un moyen d'encaissement configurés) | Devenue sans objet : PI-SPI rend l'abstraction du rail native |
| Point 26 | « Timing : favorable » | À corriger en **« timing : favorable pour l'usage, défavorable pour la couche »** |

### À reformuler

| point | Élément | Reformulation |
|---|---|---|
| Point 26 | Secret | Non plus « la rareté se déplace vers la simplicité d'usage », mais **« la rareté se déplace vers la relation marchande et la donnée de flux, parce que le rail devient gratuit »** |
| Point 27 | Actif indétrônable | Non plus « réseau d'intégrations », mais **« graphe transactionnel du commerce informel »** |
| Point 28 | Valeur réelle | Non plus « moins d'étapes, moins d'erreurs », mais **« accès à un encaissement sans condition administrative, et à un crédit auparavant inaccessible »** |

---

## 19. Réponses préliminaires aux dix critères d'entrée en DDD stratégique (point 36)

| # | Question | Réponse préliminaire | Statut |
|---|---|---|---|
| 1 | Quelle transaction fondamentale optimiser ? | **L'encaissement d'un commerçant de proximité, et la non-sortie en cash de la valeur encaissée** | Reformulé |
| 2 | Quels acteurs en ont réellement besoin ? | Les ~193 000 commerces exclus de l'acceptation numérique (205 000 − 12 370) | À confirmer par H1 |
| 3 | Quelles parties de l'expérience restent non couvertes ? | L'éligibilité administrative, le coût fixe, le délai de règlement, le circuit fournisseur | **[FAIT]** |
| 4 | Quelles capacités restent chez les prestataires financiers ? | Détention des fonds, authentification, exécution, conformité LBC/FT, portage du crédit | **[FAIT]** |
| 5 | Quel Core Domain ? | **Rétention de valeur + graphe transactionnel marchand.** Pas l'orchestration de paiement | Proposition |
| 6 | Quel actif défendable ? | Actif A (graphe transactionnel), soutenu par l'Actif B (réseau terrain) | Hypothèse |
| 7 | Quelle valeur réellement mesurée ? | DVR, rétention marchande, taux d'acceptation du crédit | À produire |
| 8 | Quelle voie réglementaire réaliste ? | Voie 2 : partenariat avec un agréé, puis agrément agrégation + initiation (30 M FCFA) | Recommandation |
| 9 | Quel premier marché ? | Une zone dense de Ouagadougou, 50 puis 500 commerçants — **jamais le national d'emblée** | Recommandation |
| 10 | **Pourquoi un nouvel acteur alors que PI-SPI et les agrégateurs existent ?** | **Parce qu'aucun d'eux n'a intérêt à servir un commerçant sans IFU sur des paniers de 2 000 FCFA. Les EME veulent le cash-in/cash-out. Les agrégateurs veulent l'e-commerce formel. Les banques veulent les personnes morales. PI-SPI ne fait pas d'acquisition marchande — ce n'est pas son rôle. Le segment est vide parce qu'il est peu rentable en paiement — et il ne devient rentable qu'en crédit.** | **C'est la réponse à défendre** |

---

## 20. Décision recommandée

**Ne pas entrer en DDD stratégique maintenant.**

Le document v0.1 fixait lui-même la règle : ne pas entrer en DDD stratégique avant d'avoir répondu aux dix questions du point 36. Neuf sur dix ont désormais une réponse préliminaire. La dixième — celle qui compte, la valeur réellement mesurée — n'en a aucune, et ne peut pas en avoir une sans terrain.

**Séquence recommandée :**

1. **Semaines 1–3 — Lever les trois inconnues bloquantes.** Tarification PI-SPI côté bénéficiaire commerçant ; KYC marchand minimal admissible ; régime d'origination de crédit pour un établissement de paiement. Ces trois réponses peuvent tuer ou débloquer le projet, et elles coûtent trois rendez-vous, pas trois mois de développement.
2. **Semaines 2–6 — Sécuriser un partenaire agréé** (EP, EME ou SFD) pour opérer sous son couvert pendant la phase de test.
3. **Semaines 4–14 — Exécuter H1, H2, H3** sur 50 commerçants. Aucune ligne de code d'infrastructure durable avant la fin de cette phase : ce qui est construit doit être jetable.
4. **Semaine 15 — Décision go / no-go** documentée contre les critères de mort.
5. **Si go — alors seulement, DDD stratégique**, avec un Core Domain qui aura été trouvé par le terrain et non postulé au bureau.

**[ANALYSE] Ce que cette séquence protège.** Le principal risque de ce projet n'est pas de se tromper de technologie. C'est d'investir dix-huit mois d'ingénierie remarquable — DDD, hexagonal, saga, outbox — dans un domaine métier dont l'hypothèse centrale n'a jamais été confrontée à un commerçant du marché de Rood-Woko. Le document v0.1 s'en défend explicitement, et c'est à son honneur. Cette étude propose simplement de tenir cet engagement de manière littérale : **le terrain avant l'architecture, et le critère de mort avant l'enthousiasme.**

---

## 21. Inconnues restantes, par ordre de criticité

| # | Inconnue | Qui peut répondre | Bloquant ? |
|---|---|---|---|
| 1 | Tarification PI-SPI applicable au bénéficiaire commerçant | BCEAO / participant agréé | **Oui** |
| 2 | KYC minimal pour un compte marchand de faible valeur | BCEAO / EME agréé | **Oui** |
| 3 | Origination de crédit possible pour un EP, et sous quelle forme | Conseil réglementaire / BCEAO | **Oui** |
| 4 | Coût et exigences techniques réels de raccordement à PI-SPI pour un EP | BCEAO / participant raccordé | Non, mais structurant |
| 5 | Ventilation exacte de la ligne « Paiements » du rapport BCEAO 2024 (crédit téléphonique inclus ou non) | BCEAO, rapport intégral | Non |
| 6 | Volumes et rentabilité réels des agrégateurs opérant au Burkina | Entretiens sectoriels | Non |
| 7 | Périmètre futur de Faso Arzeka au-delà des paiements publics | DGTCP | Non, mais à surveiller |
| 8 | Seuil auquel un commerçant informel accepte la visibilité contre du crédit | **Terrain — H3** | Non, c'est l'objet du test |

---

## Sources

**Réglementation et infrastructure BCEAO**
- [Instruction n°001-01-2024 du 23 janvier 2024 relative aux services de paiement dans l'UMOA — BCEAO](https://www.bceao.int/fr/reglementations/instruction-ndeg001-01-2024-du-23-janvier-2024-relative-aux-services-de-paiement)
- [Texte intégral de l'Instruction n°001-01-2024 (PDF)](https://www.bceao.int/sites/default/files/2024-02/Instruction%20N%C2%B0001-01-2024%20relative%20aux%20services%20de%20paiement%20dans%20l'UMOA%20%20ok.pdf)
- [Avis n°006-05-2025 relatif à la période transitoire de mise en conformité — BCEAO](https://www.bceao.int/fr/reglementations/avis-ndeg-006-05-2025-relatif-la-periode-transitoire-de-mise-en-conformite-aux)
- [UMOA : la BCEAO encadre les fintechs de paiement — Droit Médias Finance](https://droitmediasfinance.com/index.php/actualites/droit-tech-fintech/714-umoa-la-bceao-encadre-les-fintechs-de-paiement-par-linstruction-n-001-01-2024-relative-aux-services-de-paiement)
- [Entrée en vigueur de l'Instruction n°001-01-2024 — Cabinet Houda](https://www.avocatshouda.com/uemoa-entree-en-vigueur-de-linstruction-n001-01-2024-relative-aux-services-depaiement-dans-les-etats-membres-de-lumoa/)
- [Liste des établissements de paiement agréés dans l'UMOA au 15 septembre 2025 — BCEAO](https://www.bceao.int/fr/communique-presse/liste-des-etablissements-de-paiement-agrees-dans-lumoa-au-15-septembre-2025)

**PI-SPI**
- [PI-SPI — Accueil (BCEAO)](https://pispi.bceao.int/accueil)
- [PI-SPI — À propos](https://pispi.bceao.int/propos)
- [PI-SPI — Foire aux questions](https://pispi.bceao.int/foire-aux-questions)
- [Lancement officiel de la plateforme PI-SPI — BCEAO](https://www.bceao.int/fr/content/lancement-officiel-de-la-plateforme-interoperable-du-systeme-de-paiement-instantane-pi-spi)
- [PI-SPI : 30 millions de personnes connectées et 190 millions $ de transactions en moins d'un an — Agence Ecofin](https://www.agenceecofin.com/actualites-finance/2407-140469-pi-spi-30-millions-de-personnes-connectees-et-190-millions-de-transactions-en-moins-dun-an)
- [La BCEAO repousse les échéances de connexion au PI-SPI — Financial Afrik](https://www.financialafrik.com/2026/06/25/breaking-news-uemoa-la-bceao-repousse-les-echeances-de-connexion-au-systeme-de-paiement-instantane-pi-spi/)
- [Gueye Fatou Dieng (PI-SPI) : « Ne sont connectées au système d'interopérabilité que les institutions régulées par la BCEAO » — Digital Mag CI](https://digitalmag.ci/gueye-fatou-dieng-pi-spi-ne-sont-connectees-au-systeme-dinteroperabilite-que-les-institutions-regulees-par-la-bceao/)
- [PI-SPI : liste actualisée des établissements autorisés — Financial Afrik](https://www.financialafrik.com/2026/03/05/paiements-instantanes-pi-spi-dans-luemoa-liste-actualisee-des-etablissements-autorises-par-la-bceao/)

**Marché et statistiques**
- [Rapport annuel sur les services financiers numériques dans l'UEMOA 2024 (PDF) — BCEAO](https://www.bceao.int/sites/default/files/2026-03/Rapport%20annuel%20sur%20les%20services%20financiers%20num%C3%A9riques%20dans%20l'UEMOA%20-%202024.pdf)
- [UEMOA : en 2024, la monnaie électronique a atteint 248 millions de comptes — La Nouvelle Tribune](https://lanouvelletribune.info/2026/03/uemoa-en-2024-la-monnaie-electronique-a-atteint-248-millions-de-comptes/)
- [Volume des transactions électroniques : le Sénégal leader de l'UEMOA — allAfrica](https://fr.allafrica.com/stories/202603230291.html)
- [Burkina Faso : 96,5 % des entreprises évoluent encore dans l'informel (RGE 2024, INSD) — Burkina24](https://burkina24.com/?p=451251)
- [Peak MoMo? What Five Years of GSMA Data Actually Shows — Frontier Fintech](https://frontierfintech.substack.com/p/115-peak-momo-what-five-years-of)
- [Transformation digitale à la portée des acteurs de l'économie informelle au Burkina — PNUD](https://www.undp.org/fr/burkina-faso/blog/transformation-digitale-la-portee-des-acteurs-de-leconomie-informelle-au-burkina)
- [Challenges Hindering Mobile Money Adoption in Burkina Faso — DigiPay.guru](https://www.digipay.guru/blog/mobile-money-adoption-challenges-burkina-faso/)

**Concurrence et économie du marchand**
- [Ouvrir un compte marchand Orange Money Burkina Faso 2026 — Simiz](https://simiz.io/blog/ouvrir-compte-marchand-orange-money-burkina-faso)
- [Paiement marchand Orange Money Burkina Faso — Orange Business](https://www.orange.bf/business/fr/orange-money-paiement-marchand.html)
- [Encaisser par QR code mobile money : comment ça marche pour un commerçant — Kkiapay](https://kkiapay.me/encaisser-qr-code-mobile-money/)
- [Les agrégateurs de paiement au Burkina Faso : comment choisir en 2026 — Kreezus](https://kreezus.com/blog/agregateurs-paiement-burkina-faso)
- [UEMOA : la BCEAO agrée 9 nouveaux établissements de paiement — Financial Afrik](https://www.financialafrik.com/2025/09/02/uemoa-la-bceao-agree-9-nouveaux-etablissements-de-paiement/)
- [FASO ARZEKA — plateforme nationale de paiements numériques](https://fasoarzeka.bf/)
- [Wave Mobile Money réduit ses effectifs au Mali et au Burkina Faso — CIO Mag](https://cio-mag.com/wave-mobile-money-reduit-ses-effectifs-au-mali-et-au-burkina-faso/)
- [SIPEN-UEMOA 2026 : le Burkina Faso détaille ses 12 chantiers pour bâtir un État connecté, souverain et sans cash — Digital Business Africa](https://www.digitalbusiness.africa/sipen-uemoa-2026-le-burkina-faso-detaille-ses-12-chantiers-pour-batir-un-etat-connecte-souverain-et-sans-cash/)

**Benchmarks internationaux**
- [What is the State of UPI in 2026? How India Won Digital Payments and Now Faces a Revenue Gap — Digital in Asia](https://digitalinasia.com/upi-revenue-problem-india-digital-payments/)
- [India Opens Door to UPI Merchant Fees as Parliament Amends Six-Year Zero-MDR Law — TechTimes](https://www.techtimes.com/articles/322958/20260804/india-opens-door-upi-merchant-fees-parliament-amends-six-year-zero-mdr-law.htm)
- [Brazil: The $346 Billion Opportunity That PIX Built — Dwayne Gefferie](https://dwaynegefferie.substack.com/p/brazil-the-346-billion-opportunity)

---

**Fin — Étude stratégique v1.0**
