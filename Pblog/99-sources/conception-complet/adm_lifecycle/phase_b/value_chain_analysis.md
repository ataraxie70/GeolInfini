# Value Chain Analysis & Business Requirements

Ce document analyse les points de friction des flux de valeur et traduit ces analyses en exigences métier strictes pour garantir l'alignement avec les objectifs stratégiques.

## 1. Analyse des Points de Friction (Friction Points)

L'analyse des flux de valeur identifiés en B.1 révèle des zones de risque où la valeur pourrait être perdue.

### Flux de Validation (Recruteurs)
- **Friction :** "L'effet labyrinthe". Si le visiteur doit cliquer plus de 3 fois pour atteindre la preuve, il abandonne.
- **Risque :** Perte de crédibilité due à une UX frustrante.
- **Exigence :** Accès direct et profond (Deep Linking) depuis la page d'accueil vers les preuves.

### Flux de Confiance (Clients)
- **Friction :** "Le fossé cognitif". L'écart entre un article technique et la preuve concrète du projet.
- **Risque :** Le visiteur admire le raisonnement mais doute de la capacité d'implémentation.
- **Exigence :** Maillage bidirectionnel systématique (Article $\leftrightarrow$ Projet).

### Flux de Production (Propriétaire)
- **Friction :** "L'effort de documentation". La rédaction d'une rétrospective est chronophage.
- **Risque :** Le propriétaire cesse de mettre à jour le site, rendant le portfolio obsolète.
- **Exigence :** Saisie progressive (Atomic updates). Possibilité de publier un projet "Squelette" (Preuve seule) et de l'enrichir en narration plus tard.

## 2. Exigences Métier Strictes (Business Requirements)

Ces exigences sont intangibles technologiquement mais obligatoires pour le succès du produit.

| ID | Exigence | Priorité | Justification |
| :--- | :--- | :--- | :--- |
| **BR-01** | **Time-to-Proof $\le$ 30s** | Critique | Garantir la capture de l'attention des recruteurs. |
| **BR-02** | **Liaison Obligatoire** | Haute | Tout projet doit être lié à au moins une preuve externe pour être publié. |
| **BR-03** | **Saisie Découplée** | Haute | Permettre la mise à jour des faits techniques sans nécessiter la rédaction complète d'un article. |
| **BR-04** | **Navigation Transversale** | Moyenne | Permettre de passer d'un projet à un article connexe sans repasser par le menu principal. |
| **BR-05** | **Disponibilité 24/7** | Critique | La crédibilité professionnelle ne peut souffrir d'une interruption de service. |

## 3. Matrice de Traçabilité : Personas $\rightarrow$ Processus

Ce tableau valide que chaque persona trouve sa valeur dans les processus définis.

| Persona | Processus de Valeur Associé | Résultat Attendu | Validation |
| :--- | :--- | :--- | :--- |
| **Recruteur** | Flux de Validation | Certitude technique rapide. | ✅ |
| **Client** | Flux de Confiance | Conviction de la méthodologie. | ✅ |
| **Collaborateur** | Flux de Validation / Production | Identification de points d'entrée. | ✅ |
| **Apprenant** | Flux de Confiance | Acquisition de savoirs pratiques. | ✅ |
| **Propriétaire** | Flux de Production | Actif numérique à jour sans effort. | ✅ |

## 4. Conclusion de la Phase B

La logique métier est désormais stabilisée. Nous avons :
1. Modélisé les flux de valeur.
2. Identifié et mitigé les points de friction.
3. Établi des exigences métier strictes.
4. Validé l'alignement avec les personas.

**L'architecture métier est complète. Nous avons maintenant une base solide pour définir la structure des données (Phase C - Data) et l'architecture logicielle (Phase C - Application).**
