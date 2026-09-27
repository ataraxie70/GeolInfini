---
projet: "checkme"
type: "note-d-entree-projet"
objet: "Publication d'informations nominatives par les institutions ; permettre à une personne de retrouver l'information officielle qui la concerne"
statut_projet: "Études ouvertes — programme versé le 2026-09-10, vague 0 non lancée ; verdict du premier maillon : non instruit, jalon 1 au plus tard le 2026-10-31 — aucun document hérité n'est opposable"
nom_de_produit: "NON DÉCIDÉ — checkme est un nom de code interne"
territoire: "Burkina Faso"
issue_visee: "Produit minimal sur toute la chaîne métier, démontré sur données fictives et sur données réelles à la demande de l'autorité, présenté à une autorité publique en vue d'une cession complète — intention déclarée le 2026-09-10"
mise_en_conformite: 2026-09-06
mis_a_jour_le: 2026-09-10
tags:
  - checkme
  - moc
---

# checkme

Permettre à une personne de retrouver, en quelques secondes et sans intermédiaire, **l'information officielle nominative qui la concerne** — résultat de concours ou d'examen, convocation, affectation, bourse — à partir de l'identifiant que l'organisme émetteur lui a attribué.

Le système ne produit aucune décision administrative. Il en facilite la consultation.

> [!important] La conception est reprise depuis l'intention
> Le porteur a remis en cause l'intégralité de la documentation existante le 2026-09-06 — `DEC-C-016`. La reprise est engagée depuis le 2026-09-10 par le [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]] — `DEC-C-083`.
> Le corpus hérité — quatorze documents de conception, un registre d'interventions, cinq migrations SQL — est versé en `99-sources/corpus-herite/` comme **matériau de référence non opposable** — `DEC-C-082`.

---

## État actuel

| Élément | Valeur |
| --- | --- |
| Maturité | **Études ouvertes, non commencées.** Intention réécrite, programme d'études versé ; aucune donnée d'observation, aucune décision de projet — voir [[checkme/90-pilotage/Carte des phases\|Carte des phases]] |
| Verdict du premier maillon | **Non instruit.** Jalon 1 de l'étude au plus tard le **2026-10-31** ; à cette date, l'absence de preuve sur la place disponible et sur le coût d'accès vaut réponse négative. Le jalon 3 rend un nouveau verdict |
| Issue visée par le porteur | Produit fonctionnel sur toute la chaîne métier, présenté à une autorité publique ; **cession complète** en cas de reprise. Démonstration livrée sur données fictives, et sur données réelles si l'autorité le demande. Intentions, non décisions |
| Décisions de projet prises | **Aucune** — voir [[checkme/90-pilotage/Journal des décisions\|Journal des décisions]] |
| Dossiers de phase ouverts | `00-intention` · `10-etudes` · `90-pilotage` · `99-sources` |
| Artefacts exécutables | **Aucun** — pas de code, pas de contrat d'interface, pas de test. Les cinq migrations héritées n'ont jamais été exécutées |
| Fait nouveau le plus structurant | **L'État a lui-même mis en service en 2026 une consultation individuelle des résultats** — certificat d'études primaires et entrée en sixième, par numéro et date de naissance, sur `resultats.examens.gov.bf`. Pour les concours de l'État, en revanche, le dispositif officiel s'arrête à l'inscription et au récépissé : **la consultation individuelle du résultat n'y est pas servie** — faits `F13`, `F15` et `F16` du [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]] |

---

## Le problème traité

Les organismes publient leurs résultats sous forme de **listes** — PDF, images, communiqués —, diffusées sur plusieurs canaux. Le problème visé n'est pas la publication, mais **l'accès individuel** : retrouver sa propre situation dans ce qui a été publié.

**Statut : hypothèse.** Le coût de cet accès, supporté par la personne et non par l'organisme, n'a jamais été observé. La thèse du projet et ses trois conditions de fausseté sont au point 5 du [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]].

---

## La reprise

### `00-intention`

- [[checkme/00-intention/Document fondateur d'intention|Document fondateur d'intention]] — version 0.2 du 2026-09-10. L'intention réécrite, l'intention stratégique du porteur, les principes hérités, l'analyse des dépendances au regard de la règle `D1`, les conséquences de la cession complète, et le verdict du premier maillon

### `10-etudes`

- [[checkme/10-etudes/Programme d'études|Programme d'études]] — version 0.1 du 2026-09-10. Neuf lots, dont un facultatif ; trois jalons plafonnés ; seuils pré-enregistrés avant toute collecte ; issue *« ne pas construire »* atteignable à chaque jalon. **Aucune liste nominative n'entre dans le coffre**

- [[Relevé de l'état de l'art et du cimetière]] — lot `L1`, conduit le 2026-09-10. Aucune catégorie entièrement servie ; deux procédures servies, dont une par une plateforme construite par l'État ; déclaration du porteur sur `e-concours` confirmée

### Vague 0 — en cours

Lancée le 2026-09-10 par `DEC-C-086`, seuils validés et programme gelé. `L1` conduit ; restent `L2` — relevé des listes publiées et mesure du coût —, `L3` — traces publiques du coût d'accès — et la première partie de `L4` — cadre juridique. Jalon 1 au plus tard le **2026-10-31**.

---

## Le corpus hérité, en `99-sources/corpus-herite/`

Consultable, citable, **opposable en rien**. La propriété `statut_documentaire` de chaque note conserve la distinction que portait l'ancienne gouvernance documentaire : `Historique` pour dix documents — les huit documents de conception antérieurs à l'audit du 2026-08-02, l'audit lui-même et l'analyse approfondie —, `Baseline canonique` pour les quatre documents issus des interventions `P0`, `Registre du porteur` pour l'historique des interventions.

| Sujet | Documents | Statut documentaire |
| --- | --- | --- |
| Intention | [[Vision et principes fondateurs]] | Baseline canonique — `P0-1` |
| Études du corpus | [[Audit complet du projet]] · [[Analyse approfondie du projet]] | Historique |
| DDD stratégique | [[DDD stratégique]] | Historique |
| DDD tactique | [[DDD tactique]] | Historique |
| Recherche et correspondance | [[Stratégie de recherche et de correspondance]] | Baseline canonique — `P0-2` |
| Architecture | [[Vision d'architecture]] · [[Architecture logicielle]] · [[Contrats d'API]] · [[Sécurité]] · [[Base de données]] · [[Parcours utilisateur et interfaces]] | Historique |
| Fiabilité de la consultation | [[Fiabilité de la projection Consultation]] | Baseline canonique — `P0-3` |
| Données | [[Modèle de données et migrations]], et ses cinq migrations en `corpus-herite/migrations/` | Baseline canonique — `P0-4` |
| Pilotage de l'ancienne gouvernance | [[checkme/99-sources/corpus-herite/Historique des interventions\|Historique des interventions]] — registre des interventions `P0`, `P1` et `P2` | Registre du porteur |

> [!note] Ces documents portent sur le corpus, jamais sur le terrain
> L'audit et l'analyse approfondie examinent **les documents du projet**. Aucun document hérité n'apporte d'entretien, de test auprès de personnes concernées, de volume observé ni de délai mesuré.

---

## Pilotage

| Note | Objet |
| --- | --- |
| [[checkme/90-pilotage/Carte des phases\|Carte des phases]] | Le chemin complet jusqu'à la cession, l'état de chaque phase, le calibrage, les jalons et ce qui déverrouille l'implémentation |
| [[checkme/90-pilotage/Journal des décisions\|Journal des décisions]] | `DEC-C-016` à `DEC-C-023`, `DEC-C-042`, `DEC-C-082` à `DEC-C-085` — la reprise, la mise en conformité, les suppressions, le versement du corpus, l'ouverture de la reprise, la version 0.2 du document fondateur et l'ouverture des études |
| [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]] | Faits, propositions, points contestés, écarts relevés, questions ouvertes, hypothèses et intentions de la reprise |
| [[checkme/99-sources/Sources originales\|Sources originales]] | Corpus hérité, empreintes d'intégrité, contrôle des corps, archives conservées, trace des six fichiers supprimés |

---

## Comment lire ce projet

1. **Aucun statut interne à un document ne vaut décision de projet.** « Terminé », « canonique », « baseline », `SEC-01` qualifient l'état d'un texte, jamais celui du projet — `DEC-C-014`.
2. **Le corpus hérité est une référence, non une autorité.** Un élément hérité n'entre dans la reprise que repris explicitement, avec son statut et sa source.
3. **Une intention du porteur n'est pas une décision de projet.** Le produit minimal, la présentation à une autorité et la cession complète orientent la reprise ; aucun ne l'engage tant qu'un jalon ne l'a pas franchi.
4. **Trois documents et trois maquettes ont été supprimés le 2026-09-06.** Empreintes et relevés de contenu en [[checkme/99-sources/Sources originales\|Sources originales]].

---

## Note de positionnement

`checkme` est **un nom de code, pas un nom de produit** : la marque n'est pas décidée.

Le porteur a confirmé que **c'est bien ce projet qui est cité dans `infUb`**, lequel lui pose une frontière explicite : `infUb` répond à « qu'est-ce qui a été publié ? », `checkme` à « quel est mon statut individuel ? ». Le porteur a déclaré le 2026-09-10 que `infUb` relève de la même démarche — produit minimal, puis présentation à une autorité ; les deux projets peuvent donc viser la même autorité.

Le lien entre les projets du coffre n'est **pas instruit ici** : par décision du porteur, chaque projet est travaillé séparément, et les liens seront établis ensuite. Trois recouvrements restent ouverts — voir le point 7 du [[checkme/90-pilotage/Registre des statuts\|Registre des statuts]] et la [[Cartographie du portefeuille]].
