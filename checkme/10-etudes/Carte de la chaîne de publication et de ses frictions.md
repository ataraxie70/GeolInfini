---
projet: "checkme"
type: "carte-de-chaine"
phase: "10-etudes"
objet: "La chaîne de publication telle qu'elle est déclarée aujourd'hui, ses acteurs, ses actes et ses frictions localisées"
monde: "Monde déclaré — aucune observation de terrain. Chaque friction porte son grade et l'observation qui l'établirait"
niveau_de_preuve: "N2 au mieux — déclarations datées du porteur, non mesurées"
statut: "proposed — carte d'hypothèses, à confirmer par L2 et L3"
cree_le: 2026-09-27
tags: [checkme, etudes, chaine, frictions]
---

# Carte de la chaîne de publication et de ses frictions

> [!warning] Cette carte décrit ce qui est déclaré, pas ce qui est observé
> Tout ce qui suit provient des déclarations du porteur des 26 et 27 septembre, faits `F18` à `F21` du [[checkme/90-pilotage/Registre des statuts|registre des statuts]], au grade `N2`. Aucune étape n'a été chronométrée, aucun volume mesuré, aucune personne concernée interrogée. La carte sert à **dire quoi mesurer et où**, ce qui manquait aux lots `L2` et `L3`. Elle ne fonde aucune décision.

---

## 1. Pourquoi cette carte avant toute conception

Vous demandez la structure et l'ordonnancement des tâches de la plateforme, pour résoudre les frictions. Deux raisons de produire d'abord cette carte.

La première est méthodologique et bloquante : aucune option numérique n'a franchi le gate de la valeur. Concevoir maintenant reviendrait à résoudre un problème supposé, ce qui est le mode d'échec le plus coûteux parce qu'il ne se révèle qu'après le déploiement.

La seconde est pratique, et c'est la vraie : **on ne peut pas ordonner des tâches qui résolvent des frictions tant que les frictions ne sont pas localisées.** Une friction se situe chez un acteur précis, à un acte précis, avec un coût porté par quelqu'un de précis. Cette carte produit cette localisation. Elle est le préalable direct de ce que vous demandez, et elle survit au gate de la valeur quel qu'en soit le verdict.

---

## 2. Les acteurs

| Acteur | Ce qu'il fait aujourd'hui | Ce qu'il porte comme coût |
| --- | --- | --- |
| **Service organisateur** — ministère, université, jury | organise, délibère, arrête la liste, la fait imprimer et tamponner | production du document et de son cachet |
| **Agent de publication** — au sein du service | photocopie, photographie, publie sur un réseau social ou affiche au tableau | le geste de numérisation, déjà effectué |
| **Personne concernée** — candidat, étudiant | cherche sa ligne dans ce qui a été publié | déplacement, temps, données mobiles, incertitude |
| **Relais** — proche, cybercafé, page de réseau social | consulte à la place de la personne, republie, parfois contre paiement | assume le coût de la personne, parfois le monétise |
| **Opérateur du dispositif** — n'existe pas encore | vérifierait, habiliterait, indexerait | fonction de confiance, voir `CR-03` |

Le **relais** est l'acteur que le corpus hérité ne nomme pas. C'est pourtant lui qui prouve le mieux l'existence du coût : si quelqu'un consulte pour un autre, c'est que l'accès direct a un prix. Le lot `L3` doit le chercher explicitement.

---

## 3. La chaîne, acte par acte

Deux chaînes distinctes, et c'est le fait que le corpus confondait.

### 3.1. Concours de la fonction publique

    délibération
      → liste arrêtée, imprimée, tamponnée
      → photocopie
      → photographie du papier par l'agent
      → publication sur un réseau social
      → diffusion par partages successifs
      → la personne cherche sa ligne dans une image

**Aucun lieu physique de consultation n'existe pour cette catégorie.** Le site officiel ne sert pas les résultats.

### 3.2. Recrutement en master et résultats universitaires

    délibération
      → liste arrêtée, imprimée, tamponnée
      → affichage au tableau de l'établissement
      → la personne se déplace
      → elle cherche sa ligne sur le papier affiché
      → parfois : photographie par un tiers, puis republication

---

## 4. Les frictions localisées

Chaque friction porte l'acte où elle naît, qui en supporte le coût, son grade, et **l'observation qui l'établirait ou l'infirmerait**. C'est cette dernière colonne qui rend la carte utile aux lots.

| # | Friction | Acte d'origine | Qui la supporte | Grade | Ce qui l'établirait |
| --- | --- | --- | --- | --- | --- |
| `FR-01` | **Aucune publication n'est en texte cherchable** : 0 % sur vingt publications relevées | photocopie et photographie | la personne, qui ne peut pas faire de recherche | **`N1` — établi par `L2`** | établi. Reste `N0` : le fichier d'origine existait-il en texte avant impression ? |
| `FR-02` | La recherche visuelle dans une image est lente et sujette à l'erreur | lecture par la personne | la personne | `N0` sur l'erreur, **`N1` sur la cause** — les listes sont en image et « par ordre de numéro récépissé », donc parcourables à l'œil seulement | `L3` : erreurs rapportées |
| `FR-02 bis` | Les résultats d'un même concours sont **répartis en plusieurs fichiers selon les quotas** | publication | la personne, qui doit ouvrir plusieurs fichiers lourds pour un seul concours | **`N1` — établi par `L2`** | établi |
| `FR-03` | Le déplacement physique est obligatoire pour l'université | affichage au tableau | la personne | `N2` | `L3` : déplacements rapportés, distance, coût |
| `FR-04` | La diffusion dépend d'un réseau social : portée non maîtrisée, recherche impossible, republications non datées | publication | la personne, et le service qui perd la maîtrise de sa diffusion | `N2`, **renforcée** : les résultats de septembre 2026 comptent 0 à 24 téléchargements sur le canal officiel contre 1 629 pour des listes de candidatures | `L3` : la demande passe-t-elle par les relais, ou est-elle faible ? |
| `FR-11` | Pour quatre des sept éléments non servis, **aucune publication nominative officielle n'est accessible en ligne** | publication | la personne, privée de tout accès distant | **`N1` — établi par `L2`** | établi |
| `FR-12` | **La publication expose le numéro de CNIB et la date de naissance de tous les candidats**, admis comme non admis, sur un canal ouvert | publication | **la personne, sans qu'elle le sache, et l'administration, qui en porte la responsabilité juridique** | `N2` — fait `F22` | lecture de la structure d'une publication, sans ouvrir aucune liste |
| `FR-05` | L'authenticité n'est pas vérifiable par la personne : une image republiée ne porte pas de preuve d'origine | diffusion | la personne, et le service dont l'autorité est usurpable | `N0` | `L3` : traces de doute, de démenti, de fausse liste |
| `FR-06` | Le volume de données mobiles nécessaire au téléchargement : **taille médiane de 4,75 Mo par publication**, et plusieurs fichiers par concours | lecture | la personne | **`N1` sur le poids** | reste à chiffrer en francs CFA : mesure du porteur |
| `FR-07` | Le recours à un tiers, parfois payant | lecture | la personne, financièrement | `N0` | `L3` : intermédiaires proposant une vérification |
| `FR-08` | Le geste de numérisation est effectué manuellement, sans outil | photocopie et photographie | l'agent de publication | `N2` | `L2` : temps que l'agent y consacre |
| `FR-09` | Aucune trace de qui a publié quoi, ni quand | publication | le service, en cas de contestation | `N0` | `L4` : obligation de traçabilité applicable |
| `FR-10` | La personne ne sait pas quand consulter : aucune annonce individuelle | attente | la personne | `N0` | `L3` : attente rapportée, vérifications répétées |

---

## 5. Ce que cette carte dit à la conception, sans la faire

Trois enseignements se dégagent, et ils orientent sans décider.

**La friction `FR-01` est produite par la chaîne elle-même.** Si le document part d'un traitement de texte ou d'un tableur, la chaîne actuelle détruit volontairement un texte cherchable pour le remplacer par une image. Dans ce cas, le coût d'accès n'est pas une fatalité du papier : c'est un effet de bord d'une pratique. C'est l'hypothèse la plus prometteuse du dossier, et la moins chère à vérifier. **`L2` doit la traiter en premier.**

**La friction `FR-08` désigne le point d'entrée d'adoption.** L'agent de publication effectue déjà un geste de numérisation, sans outil. Un dispositif qui remplace ce geste plutôt que d'en ajouter un se présente comme un allègement, non comme une charge. C'est l'argument d'adoption le plus solide identifié à ce jour.

**La friction `FR-12` est celle qui change la nature du projet.** Elle n'est pas supportée par la personne qui cherche, mais par toutes les personnes de la liste, à leur insu, et par l'administration qui en répond. C'est la seule friction du tableau dont la suppression intéresse l'administration pour son propre compte. Voir le point 3 bis de la [[checkme/90-pilotage/Synthèse de la vague 0|synthèse de la vague 0]].

**Les frictions `FR-05` et `FR-09` sont symétriques et souvent oubliées.** La personne ne peut pas vérifier l'authenticité, et le service ne peut pas prouver ce qu'il a publié. Une même fonction les traite ensemble. C'est ce qui donne sa valeur à la page à cachet retenue comme principe candidat.

**Ce que la carte ne dit pas.** Elle ne classe pas les frictions par importance : cinq sont désormais au grade `N1` grâce au lot `L2`, les autres restent déclaratives. Elle ne dit pas laquelle mérite d'être résolue en premier — c'est le gate de la valeur qui le dira, une fois le coût **vécu** établi par `L3`.

**Ce qui a changé le 27 septembre.** Cinq frictions passent du déclaratif à l'établi grâce au relevé `L2` du 10 septembre, que la première version de cette carte ignorait : absence totale de texte cherchable, poids médian, éclatement par quotas, faiblesse des téléchargements officiels, et absence de toute publication en ligne pour quatre éléments. **Le coût d'accès n'est plus une hypothèse au niveau de l'objet. Il reste une hypothèse au niveau du vécu.**

---

## 6. Ce qui reste bloqué, et ce qui le débloque

| Ce que vous demandez | État | Ce qui le débloque |
| --- | --- | --- |
| structure et ordonnancement des tâches de la plateforme | **bloqué** | le gate de la valeur, qui suppose `L2`, `L3` et `L4` conduits |
| modèle des acteurs et des actes | **produit ci-dessus**, au grade déclaré | `L2` et `L3` le confirment ou l'infirment |
| localisation des frictions | **produite ci-dessus**, à confirmer | idem |
| exigences de fluidité, sécurité, simplicité | recevables comme **critères d'évaluation** des options, pas comme spécifications | elles servent dès le gate de la valeur, pour comparer |
| tranche de faisabilité sur l'énumération | **active dès maintenant** | rien : c'est une question de faisabilité, elle se traite tout de suite |

**Une précision de vocabulaire à confirmer.** Vous parlez des « différents caches et métiers qui seront exécutés sur la plateforme ». J'ai lu *tâches et métiers*, ce qui correspond au reste de votre phrase sur les frictions et la fluidité. S'il s'agissait réellement de **caches**, au sens de mémoires intermédiaires, c'est une question d'architecture et elle est bloquée au même titre que le reste.

---

## 7. Points ouverts

**Quelle observation modifierait cette carte ?**

- **Le fichier d'origine n'existe pas en texte** : `FR-01` tombe, et le coût d'accès redevient une conséquence du support papier plutôt qu'une pratique corrigeable. L'argument du dispositif s'affaiblit nettement.
- **L'agent de publication ne fait pas lui-même la photographie** : `FR-08` tombe, et l'argument d'adoption fondé sur le remplacement d'un geste disparaît.
- **Aucun relais n'est trouvé** : `FR-07` et une partie de `FR-03` perdent leur fondement, et le seuil `L3-b` s'applique.
- **Les publications sont déjà en texte cherchable dans la majorité des cas** : le seuil `L2-a` déclare le contournement suffisant, et l'issue « ne pas construire » passe en première position.
- **Un dispositif officiel annonce l'extension de la consultation individuelle aux concours** : la carte reste juste, et le projet perd son objet.

**Inconnues non instruites**

| Inconnue | Pourquoi non instruite | Ce qui l'instruirait |
| --- | --- | --- |
| combien de temps la personne met aujourd'hui, de l'annonce à la certitude | aucune mesure | `L3`, entretiens, seuil de 30 minutes déjà pré-enregistré |
| si le service perçoit `FR-04` et `FR-09` comme des problèmes | aucun contact avec un service | `L6`, réceptivité des autorités |
| ce que l'index doit contenir | dépend de `MEN-01` et de `L4` | tranche de faisabilité, puis cadre juridique |
| si une catégorie porte un coût nettement supérieur aux autres | les deux chaînes ne sont pas comparées | `L2` sur les deux chaînes séparément |
