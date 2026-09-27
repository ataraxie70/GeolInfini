---
projet: "checkme"
type: "document-de-conception"
phase: "40-ddd-tactique"
objet: "Classification des identifiants, modes de recherche, contrat de résultat et normalisation"
statut_documentaire: "Baseline canonique — intervention P0-2"
designation_historique: "Document P0-2 — Stratégie de recherche et matching"
provenance: "documents_corriges/Document_P0_2_Strategie_Recherche_Matching.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - ddd
  - tactique
  - recherche
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

# Document P0-2 — Stratégie de Recherche et Matching

Version : 0.1
Statut : En revue
Intervention corrigée : P0-2 — Corriger la stratégie de recherche
Date : 2026-08-02

Sources historiques consultées :

- `documents_corriges/Document_0_Vision_Principes_Fondateurs.md`
- `files/Document_1_DDD_Strategique.md`
- `files/Document_3_DDD_Tactique.md`
- `files/Document_4_Architecture_Logicielle.md`
- `files/Document_5_API_Contrats.md`
- `files/Document_6_Securite.md`
- `files/Document_7_Base_De_Donnees.md`
- `files/Document_8_UX_UI.md`
- `files/checkme_backoffice.html`
- `files/Audit_Complet_CheckMe.md`

Règle de périmètre :

- ce document corrige uniquement P0-2 ;
- il ne traite pas la fiabilité de l'outbox, du replay d'index ou des statuts d'indexation, qui relèvent de P0-3 ;
- il ne traite pas la conformité juridique globale, qui relève de P0-5 ;
- il ne modifie pas les fichiers historiques du dossier `files/`.

---

## 1. Problème corrigé

Les documents historiques posent correctement que la Consultation est le coeur de checkMe : un citoyen cherche sa situation dans une publication précise, à partir d'identifiants définis et priorisés par l'organisme.

Mais la stratégie technique mélange deux besoins différents :

- la correspondance exacte pour des identifiants forts : CNIB, numéro de récépissé, numéro candidat, matricule, numéro de dossier ;
- la correspondance tolérante pour des identifiants faibles : nom + prénom, variantes orthographiques, accents, ordre des mots.

Le risque identifié par l'audit est critique : si un moteur tolérant aux fautes est appliqué à des identifiants forts, une valeur légèrement différente peut retourner la situation d'une autre personne. Pour des données nominatives, ce faux positif est une fuite de données.

Décision P0-2 :

> La recherche exacte devient le comportement par défaut et obligatoire. La recherche floue n'est autorisée que pour les identifiants explicitement déclarés faibles et uniquement selon des règles de non-divulgation strictes.

---

## 2. Exigences métier conservées

Cette correction respecte les principes fondateurs suivants :

- la recherche reste toujours contextualisée dans une publication précise ;
- les identifiants restent définis par l'organisme ;
- les identifiants gardent un ordre de confiance ;
- checkMe ne crée aucun identifiant national ;
- checkMe ne décide jamais du contenu restitué ;
- un résultat ambigu ne révèle jamais de donnée partielle.

---

## 3. Nouvelle classification des identifiants

Chaque identifiant défini dans le `Modele` d'une publication doit être classé selon son mode de correspondance.

### 3.1 Identifiant exact

Un identifiant exact est une valeur qui doit correspondre strictement après normalisation déterministe.

Exemples :

- CNIB ;
- numéro de récépissé ;
- numéro candidat ;
- matricule ;
- numéro de dossier ;
- identifiant de paiement ou de dépôt.

Règles :

- aucune tolérance aux fautes ;
- aucune distance de Levenshtein ;
- aucune recherche phonétique ;
- aucune complétion partielle ;
- aucune similarité approximative ;
- une différence d'un seul caractère donne `aucun`, sauf si la normalisation configurée rend les deux valeurs strictement identiques.

### 3.2 Identifiant faible

Un identifiant faible est une valeur ou combinaison de valeurs dont la correspondance peut être naturellement ambiguë.

Exemples :

- nom + prénom ;
- nom + prénom + date de naissance ;
- nom + prénom + localité ;
- toute variante textuelle que l'organisme accepte comme critère de recherche.

Règles :

- la recherche floue est interdite par défaut ;
- elle doit être activée explicitement sur l'identifiant ;
- elle ne doit jamais s'appliquer aux identifiants exacts ;
- elle doit retourner `ambigu` dès que l'unicité n'est pas fortement établie ;
- elle ne révèle jamais le nombre de correspondances ni les données des candidats.

---

## 4. Modèle corrigé de définition d'identifiant

Les documents historiques utilisent `IdentifiantDefinition{type, libellé, niveauConfiance, obligatoire}`.

La stratégie corrigée remplace cette définition implicite par une définition explicite.

```json
{
  "type": "cnib",
  "libelle": "Numéro CNIB",
  "rangConfiance": 1,
  "obligatoire": true,
  "modeCorrespondance": "exacte",
  "normalisation": "code_alphanumerique",
  "autoriseResultatDirect": true
}
```

Champs :

| Champ | Obligatoire | Description |
|---|---:|---|
| `type` | Oui | Identifiant stable dans la publication, ex. `cnib`, `numero_recepisse`, `nom_prenom`. |
| `libelle` | Oui | Libellé affiché au citoyen. |
| `rangConfiance` | Oui | Priorité de confiance. `1` est le plus fiable. Les rangs sont uniques dans une publication. |
| `obligatoire` | Oui | Indique si l'identifiant est requis à l'ingestion, pas nécessairement dans l'UI citoyen. |
| `modeCorrespondance` | Oui | `exacte` ou `floue_controlee`. |
| `normalisation` | Oui | Stratégie de normalisation avant comparaison. |
| `autoriseResultatDirect` | Oui | Indique si cet identifiant peut, seul, conduire à `trouve`. |

Compatibilité avec les documents historiques :

- `niveauConfiance` doit être remplacé progressivement par `rangConfiance` dans les documents corrigés ;
- si une donnée historique contient encore `niveauConfiance`, l'implémentation doit la migrer explicitement vers `rangConfiance` ;
- l'ordre corrigé est : plus le `rangConfiance` est petit, plus l'identifiant est fiable.

---

## 5. Normalisation

La normalisation transforme une valeur brute en valeur comparable.

Elle ne doit jamais deviner une donnée manquante.

Elle ne doit jamais corriger silencieusement une donnée officielle.

### 5.1 Normalisation pour identifiants exacts

Normalisations autorisées :

| Normalisation | Usage | Exemple |
|---|---|---|
| `code_alphanumerique` | CNIB, matricule, numéro candidat | trim, majuscules, suppression espaces internes si explicitement autorisée |
| `numero_reference` | récépissé, dossier | trim, majuscules, conservation ou normalisation des séparateurs selon modèle |
| `texte_strict` | valeur textuelle qui doit rester exacte | trim et normalisation Unicode minimale |

Exemple :

- valeur brute : ` b01234567 `
- normalisation `code_alphanumerique` : `B01234567`
- comparaison : égalité stricte uniquement.

Non autorisé :

- transformer `B01234567` en `B01234568` ;
- considérer `B01234567` proche de `B01234577` ;
- rechercher par préfixe `B0123` ;
- retourner un résultat sur faute de frappe.

### 5.2 Normalisation pour identifiants faibles

Normalisations autorisées :

| Normalisation | Usage |
|---|---|
| `nom_personne` | casse, accents, espaces multiples, apostrophes et tirets selon règles documentées |
| `nom_personne_date` | combinaison nom/prénom avec date de naissance exacte |
| `texte_faible` | texte court explicitement marqué faible |

La normalisation faible peut produire des tokens de recherche, mais elle ne suffit jamais à garantir l'identité d'une personne.

---

## 6. Stockage de recherche recommandé

### 6.1 Index exact obligatoire

Les identifiants exacts doivent être indexés dans un index exact.

Clé logique :

```text
(publicationId, typeIdentifiant, valeurNormaliseeHash)
```

Règles :

- la valeur brute n'est pas nécessaire dans l'index Consultation ;
- la valeur normalisée peut être transformée en HMAC avec une clé applicative ;
- la comparaison se fait par égalité du HMAC ;
- le moteur de recherche floue ne doit pas être utilisé pour ces champs.

Structure indicative :

```json
{
  "publicationId": "pub_...",
  "enregistrementId": "enr_...",
  "identifiantsExacts": [
    {
      "type": "cnib",
      "valeurHash": "hmac_sha256:..."
    }
  ]
}
```

### 6.2 Index flou optionnel

Les identifiants faibles peuvent être indexés dans un index flou séparé.

Règles :

- l'index flou est optionnel pour le MVP ;
- il ne contient que des identifiants `modeCorrespondance = floue_controlee` ;
- il ne contient jamais de CNIB, récépissé, matricule ou autre identifiant exact ;
- il filtre toujours par `publicationId` et par `typeIdentifiant` avant toute recherche textuelle ;
- il ne doit jamais chercher dans `situation.champs`.

Structure indicative :

```json
{
  "publicationId": "pub_...",
  "enregistrementId": "enr_...",
  "identifiantsFaibles": [
    {
      "type": "nom_prenom",
      "tokensNormalises": "ouedraogo aicha"
    }
  ]
}
```

### 6.3 Décision pour le MVP

Le MVP doit commencer par la recherche exacte.

La recherche floue avancée peut être reportée tant que les règles de seuil, de marge, d'ambiguïté et de tests anti-faux-positifs ne sont pas prêtes.

---

## 7. Algorithme de résolution corrigé

Entrée :

- `publicationId` ;
- liste de critères `{type, valeur}` saisis par le citoyen ;
- définition des identifiants attendus pour la publication ;
- projection de consultation disponible.

Sortie :

- `trouve` avec `situation` ;
- `ambigu` sans détail ;
- `aucun` sans détail ;
- erreur de validation si les critères sont invalides.

### 7.1 Étapes communes

1. Rejeter les critères dont le `type` n'existe pas dans le modèle de la publication.
2. Ignorer les critères vides.
3. Normaliser chaque critère selon sa définition.
4. Rejeter un critère si sa valeur ne respecte pas le format minimal attendu.
5. Choisir le critère utilisable ayant le meilleur `rangConfiance`.
6. Appliquer le resolver correspondant à son `modeCorrespondance`.

Si aucun critère utilisable ne reste après validation, retourner une erreur de validation, pas un résultat métier.

### 7.2 Résolution exacte

Pour un identifiant `modeCorrespondance = exacte` :

1. Calculer la valeur normalisée.
2. Calculer le HMAC ou la clé exacte de recherche.
3. Chercher les enregistrements ayant exactement la même clé.
4. Retourner :
   - `aucun` si aucune correspondance ;
   - `trouve` si une seule correspondance ;
   - `ambigu` si plusieurs correspondances.

Règle impérative :

> Une valeur exacte légèrement différente retourne `aucun`, jamais une valeur "proche".

### 7.3 Résolution floue contrôlée

Pour un identifiant `modeCorrespondance = floue_controlee` :

1. Normaliser la valeur en tokens.
2. Rechercher uniquement dans l'index flou de la publication et du type concerné.
3. Calculer un score de similarité.
4. Appliquer les seuils configurés.
5. Retourner :
   - `aucun` si aucun candidat ne dépasse le seuil minimal ;
   - `ambigu` si plusieurs candidats dépassent le seuil d'ambiguïté ;
   - `ambigu` si l'écart entre le premier et le second candidat est insuffisant ;
   - `ambigu` si `autoriseResultatDirect = false` ;
   - `trouve` uniquement si un seul candidat est nettement au-dessus des seuils et si l'identifiant autorise un résultat direct.

Règle impérative :

> La recherche floue doit préférer `ambigu` à un `trouve` incertain.

### 7.4 Pseudo-code

```text
resoudre(publicationId, criteres):
    definitions = chargerDefinitionsIdentifiants(publicationId)
    criteresUtilisables = []

    pour chaque critere dans criteres:
        definition = definitions[critere.type]
        si definition absente:
            retourner erreur CRITERE_INVALIDE
        si critere.valeur vide:
            continuer
        valeurNormalisee = normaliser(critere.valeur, definition.normalisation)
        si valeurNormalisee invalide:
            retourner erreur CRITERE_INVALIDE
        ajouter (definition, valeurNormalisee) a criteresUtilisables

    si criteresUtilisables est vide:
        retourner erreur AUCUN_CRITERE_UTILISABLE

    critereChoisi = critere avec plus petit rangConfiance

    si critereChoisi.modeCorrespondance == "exacte":
        retourner resoudreExactement(publicationId, critereChoisi)

    si critereChoisi.modeCorrespondance == "floue_controlee":
        retourner resoudreFlouControle(publicationId, critereChoisi)
```

---

## 8. Contrat API conservé

Le contrat externe de `POST /v1/publications/{publicationId}/recherche` reste compatible avec le Document 5.

Requête :

```json
{
  "criteres": [
    { "type": "cnib", "valeur": "B01234567" },
    { "type": "nom_prenom", "valeur": "Ouedraogo Aicha" }
  ]
}
```

Réponses métier :

| Cas | HTTP | Corps |
|---|---:|---|
| Trouvé | 200 | `{ "resultat": "trouve", "situation": { ... } }` |
| Ambigu | 200 | `{ "resultat": "ambigu" }` |
| Aucun résultat | 200 | `{ "resultat": "aucun" }` |

Erreurs de validation recommandées :

| Cas | HTTP | Code |
|---|---:|---|
| Type inconnu pour cette publication | 422 | `CRITERE_INVALIDE` |
| Aucun critère non vide | 422 | `AUCUN_CRITERE_UTILISABLE` |
| Format invalide pour un critère connu | 422 | `CRITERE_INVALIDE` |

Règles anti-fuite :

- `aucun`, `ambigu` et `trouve` restent en HTTP 200 ;
- `ambigu` ne contient jamais de nombre de correspondances ;
- `aucun` ne dit jamais si le type était rare ou proche ;
- `CRITERE_INVALIDE` ne doit pas révéler l'existence d'une personne.

---

## 9. Impacts sur le modèle de publication

Le back-office doit permettre à l'administrateur d'organisme de définir, pour chaque identifiant :

- le libellé ;
- le rang de confiance ;
- le caractère obligatoire à l'ingestion ;
- le mode de correspondance ;
- la normalisation ;
- l'autorisation ou non d'un résultat direct.

Valeurs par défaut recommandées :

| Type d'identifiant | Mode par défaut | Résultat direct | Remarque |
|---|---|---:|---|
| CNIB | `exacte` | Oui | Aucun fuzzy autorisé. |
| Numéro de récépissé | `exacte` | Oui | Aucun fuzzy autorisé. |
| Numéro candidat | `exacte` | Oui | Aucun fuzzy autorisé. |
| Matricule | `exacte` | Oui | Aucun fuzzy autorisé. |
| Nom + prénom | `floue_controlee` | Non par défaut | Peut guider, mais doit souvent demander un second identifiant. |
| Nom + prénom + date de naissance | `floue_controlee` ou `exacte` selon choix organisme | En revue | À décider selon le niveau de risque de la publication. |

---

## 10. Impacts sur l'UX citoyen

L'UX existante reste valide : un citoyen peut saisir un ou plusieurs identifiants, et le système choisit le plus fiable.

Corrections nécessaires :

- les champs d'identifiants forts ne doivent pas promettre de tolérance aux fautes ;
- les messages d'erreur de format doivent aider sans révéler de donnée ;
- en cas d'identifiant faible ambigu, l'interface doit proposer d'ajouter un identifiant plus fiable ;
- l'interface ne doit jamais afficher "résultat proche" ou "correspondance probable".

Message recommandé pour ambiguïté faible :

> Plusieurs situations peuvent correspondre à cette information. Ajoutez un identifiant plus précis pour continuer.

---

## 11. Invariants de sécurité

1. Une recherche ne sort jamais du `publicationId`.
2. Un identifiant exact ne passe jamais par un moteur flou.
3. Un identifiant flou ne cherche jamais dans les champs de situation.
4. Un résultat ambigu ne révèle jamais de détail.
5. Une valeur proche d'un identifiant exact retourne `aucun`.
6. Les identifiants exacts peuvent être indexés par HMAC plutôt qu'en clair.
7. Le système préfère un faux négatif à un faux positif sur données nominatives.

---

## 12. Tests d'acceptation obligatoires

### 12.1 Identifiants exacts

| Cas | Donnée indexée | Recherche | Résultat attendu |
|---|---|---|---|
| CNIB identique | `B01234567` | `B01234567` | `trouve` |
| CNIB casse différente | `B01234567` | `b01234567` | `trouve` si normalisation majuscule activée |
| CNIB avec espaces autour | `B01234567` | ` B01234567 ` | `trouve` si trim activé |
| CNIB un caractère différent | `B01234567` | `B01234568` | `aucun` |
| CNIB préfixe partiel | `B01234567` | `B0123` | `CRITERE_INVALIDE` ou `aucun`, jamais `trouve` |
| Récépissé proche | `2026-004521` | `2026-004522` | `aucun` |

### 12.2 Ambiguïté exacte

| Cas | Donnée indexée | Recherche | Résultat attendu |
|---|---|---|---|
| Deux enregistrements avec même récépissé | 2 correspondances exactes | même récépissé | `ambigu` sans nombre |

### 12.3 Identifiants faibles

| Cas | Donnée indexée | Recherche | Résultat attendu |
|---|---|---|---|
| Nom exact unique mais résultat direct interdit | `Ouedraogo Aicha` | `Ouedraogo Aicha` | `ambigu` |
| Nom avec accents différents | `Ouédraogo Aïcha` | `Ouedraogo Aicha` | Selon seuil, jamais si autre candidat proche |
| Deux noms proches | `Ouedraogo Aicha`, `Ouedraogo Awa` | `Ouedraogo Aicha` | `ambigu` si marge insuffisante |
| Nom trop court | `Ali` | `Ali` | `CRITERE_INVALIDE` ou `ambigu`, jamais divulgation |

### 12.4 Sélection du critère

| Cas | Critères fournis | Résultat attendu |
|---|---|---|
| CNIB et nom fournis | CNIB rang 1, nom rang 4 | CNIB utilisé |
| Récépissé vide, nom rempli | récépissé rang 1 vide, nom rang 4 rempli | nom utilisé |
| Type inconnu | `telephone` absent du modèle | `CRITERE_INVALIDE` |

### 12.5 Non-divulgation

| Cas | Attendu |
|---|---|
| `ambigu` | aucun nom, aucune situation, aucun nombre |
| `aucun` | aucun indice de proximité |
| identifiant exact faux d'un caractère | aucun résultat, aucune suggestion de correction |

---

## 13. Décisions à reporter

Les sujets suivants ne sont pas traités dans P0-2 :

- fiabilité de reconstruction de l'index Consultation ;
- statut `indexation_en_cours` ;
- cache Redis des résultats ;
- rate limiting par identifiant fort/faible ;
- migrations SQL définitives ;
- OpenAPI complet ;
- conformité juridique détaillée.

Ils restent dans les interventions suivantes prévues par `HISTORIQUE_INTERVENTION.md`.

---

## 14. Validation de l'intervention P0-2

Critères de validation :

- les identifiants exacts et faibles sont séparés ;
- le fuzzy matching est interdit pour les identifiants exacts ;
- la recherche exacte est définie comme comportement MVP ;
- les règles d'ambiguïté et de non-divulgation sont explicites ;
- le contrat API externe reste compatible avec le Document 5 ;
- les tests anti-faux-positifs sont listés ;
- le dossier `files/` n'a pas été modifié ;
- la prochaine intervention peut être P0-3.
