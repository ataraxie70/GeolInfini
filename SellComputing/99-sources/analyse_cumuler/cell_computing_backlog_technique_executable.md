# Sell Computing — Backlog technique exécutable

## 1. Objet du livrable

Ce document transforme la vision consolidée de **Sell Computing** en une séquence d’exécution technique directement exploitable pour le développement.  
Le backlog est organisé pour produire, dans l’ordre, un socle implémentable, puis les capacités métier, puis les raffinements non fonctionnels.

## 2. Hypothèses de cadrage

Le backlog est établi sur les hypothèses suivantes :

- le produit démarre comme une application modulaire avec un cœur métier isolé ;
- une API est exposée pour les clients futurs ;
- la persistance est relationnelle par défaut ;
- l’authentification et l’autorisation sont obligatoires dès le socle ;
- la journalisation, la gestion d’erreur et la validation d’entrée sont présentes dès le premier incrément ;
- les composants doivent rester découplés pour permettre un passage progressif vers une architecture plus distribuée si nécessaire.

## 3. Principes d’exécution

### 3.1 Ordre de construction

1. socle technique ;
2. socle de données ;
3. sécurité et identité ;
4. modèle métier principal ;
5. flux fonctionnels centraux ;
6. observabilité et robustesse ;
7. durcissement et optimisation ;
8. préparation au déploiement.

### 3.2 Règles de priorisation

- **P0** : bloque le démarrage ou la sécurité ;
- **P1** : indispensable au MVP ;
- **P2** : améliore l’usage ou la maintenabilité ;
- **P3** : optimisation ou extension future.

### 3.3 Définition de terminé

Une tâche est considérée terminée uniquement si :

- le code est intégré ;
- les tests associés passent ;
- les erreurs attendues sont gérées ;
- la documentation technique minimale est mise à jour ;
- aucun couplage implicite n’a été introduit.

---

## 4. Découpage en épopées techniques

| ID | Épopée | Priorité | Dépendances | Résultat attendu |
|---|---|---:|---|---|
| E1 | Socle projet et outillage | P0 | aucune | dépôt prêt à développer |
| E2 | Architecture applicative et frontières | P0 | E1 | structure modulaire stable |
| E3 | Modèle de données et persistance | P0 | E1, E2 | base de données initiale |
| E4 | Identité, authentification, autorisation | P0 | E2, E3 | accès sécurisé |
| E5 | Cœur métier principal | P1 | E3, E4 | logique métier usable |
| E6 | API publique/interne | P1 | E4, E5 | contrats d’échange stables |
| E7 | Interface de pilotage minimale | P1 | E6 | exploitation humaine du système |
| E8 | Observabilité et audit | P1 | E5, E6 | traces et diagnostic |
| E9 | Qualité, tests, stabilité | P1 | E1–E8 | base fiable |
| E10 | Déploiement et exploitation | P1 | E1–E9 | mise en production contrôlée |
| E11 | Durcissement et optimisation | P2 | E1–E10 | réduction des risques et coûts |
| E12 | Extensions futures | P3 | socle stabilisé | évolutions non bloquantes |

---

## 5. Backlog détaillé par épopée

### E1 — Socle projet et outillage

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T1.1 | Initialiser le dépôt mono-repo ou multi-repo | P0 | structure de dépôt | arborescence cohérente, conventions fixées |
| T1.2 | Ajouter la gestion de configuration | P0 | fichier de configuration de base | paramètres séparés du code |
| T1.3 | Mettre en place lint, format, analyse statique | P0 | outillage qualité | exécution automatisable |
| T1.4 | Mettre en place le système de build | P0 | build reproductible | compilation ou packaging identique partout |
| T1.5 | Ajouter la chaîne de tests minimale | P0 | tests de base | exécution automatique sans dépendance manuelle |
| T1.6 | Préparer CI locale et CI distante | P1 | pipeline initial | validation automatique à chaque changement |

### E2 — Architecture applicative et frontières

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T2.1 | Définir les couches applicatives | P0 | schéma architectural | séparation claire domaine / application / infra |
| T2.2 | Définir les modules fonctionnels | P0 | carte des modules | aucun module ne dépend du détail d’un autre sans contrat |
| T2.3 | Définir les interfaces internes | P0 | contrats d’interface | entrées/sorties explicitement typées |
| T2.4 | Définir la politique d’erreur globale | P0 | taxonomie d’erreurs | chaque erreur a un code, une cause et un traitement |
| T2.5 | Définir la stratégie de journalisation | P1 | règles de log | logs exploitables et corrélables |
| T2.6 | Définir la stratégie de validation | P1 | règles de validation | aucune entrée non validée n’atteint le domaine |

### E3 — Modèle de données et persistance

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T3.1 | Lister les entités métier fondamentales | P0 | dictionnaire de données | entités stables et nommées |
| T3.2 | Définir les relations et cardinalités | P0 | modèle relationnel | cohérence des dépendances |
| T3.3 | Définir les identifiants techniques | P0 | stratégie d’ID | unicité et non-ambigüité |
| T3.4 | Définir les contraintes d’intégrité | P0 | règles de données | contraintes côté base et côté code |
| T3.5 | Préparer les migrations initiales | P0 | schéma versionné | base reproductible |
| T3.6 | Préparer les accès de persistance | P0 | couche repository/dao | accès isolé du domaine |
| T3.7 | Définir la stratégie de seed | P2 | jeux de données initiaux | environnement de test exploitable |

### E4 — Identité, authentification, autorisation

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T4.1 | Modéliser utilisateur, rôle, permission | P0 | modèle d’accès | rôles lisibles et extensibles |
| T4.2 | Définir l’inscription ou création de compte | P1 | flux de création | parcours sécurisé |
| T4.3 | Mettre en place authentification | P0 | login sécurisé | session ou jeton valide |
| T4.4 | Mettre en place autorisation par rôle | P0 | contrôle d’accès | interdiction des accès non autorisés |
| T4.5 | Mettre en place révocation / expiration | P1 | cycle de vie identité | session ou jeton maîtrisé |
| T4.6 | Journaliser les événements de sécurité | P1 | audit minimal | traçabilité des opérations sensibles |

### E5 — Cœur métier principal

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T5.1 | Formaliser les cas d’usage noyau | P0 | liste des use cases | couverture du besoin principal |
| T5.2 | Implémenter la première entité métier centrale | P1 | agrégat principal | création, lecture, mise à jour, suppression si nécessaire |
| T5.3 | Implémenter les règles d’invariant métier | P1 | garde-fous métier | aucune violation possible par l’API |
| T5.4 | Implémenter les transitions d’état | P1 | machine d’état | transitions explicites et contrôlées |
| T5.5 | Implémenter les calculs métier centraux | P1 | logique métier | résultat déterministe |
| T5.6 | Gérer les cas d’échec métier | P1 | erreurs métier | messages et codes stables |

### E6 — API publique / interne

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T6.1 | Définir les ressources API | P0 | contrat API | endpoints nommés et stables |
| T6.2 | Définir les formats d’échange | P0 | schémas de requête/réponse | sérialisation explicite |
| T6.3 | Implémenter les endpoints de lecture | P1 | consultation des données | réponse conforme au contrat |
| T6.4 | Implémenter les endpoints d’écriture | P1 | création/modification | validation et persistance correctes |
| T6.5 | Implémenter pagination, filtrage, tri | P2 | recherche contrôlée | cohérence de résultat |
| T6.6 | Implémenter la gestion des erreurs API | P0 | réponses normalisées | codes HTTP et codes métier cohérents |
| T6.7 | Générer la documentation API | P1 | spec exploitable | contrat lisible par un client |

### E7 — Interface de pilotage minimale

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T7.1 | Définir le parcours principal utilisateur | P1 | flux UI minimal | tâche principale réalisable |
| T7.2 | Créer les écrans de base | P1 | interface minimale | navigation cohérente |
| T7.3 | Créer les formulaires de saisie | P1 | entrée utilisateur | validation visible |
| T7.4 | Créer les vues de liste et détail | P1 | consultation | données compréhensibles |
| T7.5 | Gérer états de chargement et erreur | P1 | robustesse UI | aucun écran muet |
| T7.6 | Préparer accessibilité minimale | P2 | lisibilité | contraste, navigation et structure corrects |

### E8 — Observabilité et audit

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T8.1 | Définir un schéma de logs structuré | P1 | journalisation standard | analyse machine possible |
| T8.2 | Ajouter des corrélations de requêtes | P1 | identifiants de trace | suivi de bout en bout |
| T8.3 | Exposer métriques de base | P1 | santé système | disponibilité et erreurs mesurables |
| T8.4 | Ajouter audit des actions sensibles | P1 | journal d’audit | traçabilité des opérations critiques |
| T8.5 | Définir alertes minimales | P2 | seuils d’alerte | détection des incidents majeurs |

### E9 — Qualité, tests, stabilité

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T9.1 | Tests unitaires du domaine | P1 | couverture métier | règles métier validées |
| T9.2 | Tests d’intégration persistance | P1 | validation base | lecture/écriture fiables |
| T9.3 | Tests API | P1 | contrat vérifié | code HTTP et payloads corrects |
| T9.4 | Tests de régression | P1 | filet de sécurité | erreurs connues empêchées |
| T9.5 | Tests de sécurité de base | P1 | validation accès | contrôle d’accès et entrées malformées |
| T9.6 | Tests de charge élémentaires | P2 | seuils de fonctionnement | comportement acceptable sous charge initiale |

### E10 — Déploiement et exploitation

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T10.1 | Conteneuriser l’application | P1 | image reproductible | exécution stable |
| T10.2 | Définir la configuration par environnement | P1 | dev/staging/prod | séparation nette des paramètres |
| T10.3 | Définir le déploiement de la base | P1 | migration automatisée | mise à jour contrôlée |
| T10.4 | Préparer les secrets | P0 | gestion sécurisée | aucun secret en clair |
| T10.5 | Définir la procédure de rollback | P1 | retour arrière | restauration possible |
| T10.6 | Définir la supervision d’exploitation | P1 | runbook initial | diagnostic rapide |

### E11 — Durcissement et optimisation

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T11.1 | Réduire la surface d’attaque | P1 | durcissement | suppression des accès inutiles |
| T11.2 | Optimiser les requêtes critiques | P2 | performance | réduction des latences |
| T11.3 | Optimiser les structures mémoire | P2 | efficacité | réduction des allocations inutiles |
| T11.4 | Éliminer les dépendances superflues | P2 | maintenance | moins de risque supply chain |
| T11.5 | Revoir le cycle de vie des ressources | P1 | fermeture propre | pas de fuite de ressources |

### E12 — Extensions futures

| ID | Tâche | Priorité | Livrable | Critère d’acceptation |
|---|---|---:|---|---|
| T12.1 | Ajouter des rôles avancés | P3 | gouvernance fine | autorisations plus granulaires |
| T12.2 | Ajouter export de données | P3 | extraction | formats externes |
| T12.3 | Ajouter notifications | P3 | communication | événements déclenchés |
| T12.4 | Ajouter recherche avancée | P3 | confort d’usage | filtre multi-critères |
| T12.5 | Préparer internationalisation | P3 | langues multiples | chaînes externalisées |

---

## 6. Séquence d’exécution recommandée

### Phase 0 — Mise en place
- T1.1 à T1.6
- T2.1 à T2.6
- T3.1 à T3.6

### Phase 1 — Sécurité et noyau fonctionnel
- T4.1 à T4.6
- T5.1 à T5.6
- T6.1 à T6.7

### Phase 2 — Expérience minimale et robustesse
- T7.1 à T7.6
- T8.1 à T8.5
- T9.1 à T9.6

### Phase 3 — Déploiement et durcissement
- T10.1 à T10.6
- T11.1 à T11.5

### Phase 4 — Extensions
- T12.1 à T12.5

---

## 7. Dépendances critiques

| Dépendance | Conséquence |
|---|---|
| architecture non figée | API et données instables |
| modèle de données incomplet | backlog métier impossible à fermer |
| identité non définie | sécurité incomplète |
| contrats API flous | intégration client fragile |
| absence de tests | régression incontrôlée |
| absence de déploiement reproductible | livraison non fiable |

---

## 8. Risques techniques majeurs

| Risque | Impact | Réduction |
|---|---|---|
| dérive du périmètre | retard et confusion | gel du MVP et arbitrage strict |
| couplage excessif | maintenance coûteuse | interfaces strictes et couches séparées |
| dette de validation | failles d’intégrité | validation en entrée et au domaine |
| absence d’audit | difficulté de diagnostic | logs et traçabilité dès le départ |
| surcharge d’ambition initiale | blocage du démarrage | livraison incrémentale |
| migrations de données mal gérées | perte ou corruption | migrations versionnées et testées |

---

## 9. Définition du MVP exécutable

Le MVP est considéré atteint lorsque les conditions suivantes sont satisfaites :

- authentification opérationnelle ;
- contrôle d’accès opérationnel ;
- cœur métier principal opérationnel ;
- API stable sur les parcours prioritaires ;
- persistance fiable ;
- journalisation et audit minimal ;
- tests de base automatisés ;
- déploiement reproductible.

---

## 10. Ordre de transformation en tickets

Le backlog peut être converti en tickets selon le format suivant :

- **Epic** : grande capacité livrable ;
- **Feature** : sous-capacité métier ou technique ;
- **Story** : besoin observable ;
- **Task** : travail d’implémentation ;
- **Subtask** : opération atomique.

### Modèle de ticket

```text
ID:
Titre:
Type:
Priorité:
Dépendances:
Description:
Critères d’acceptation:
Risques:
Estimation:
Statut:
```

---

## 11. Recommandation opérationnelle immédiate

La prochaine extraction utile consiste à produire, à partir de ce backlog, les trois artefacts suivants :

1. **structure de dépôt cible** ;
2. **plan de sprint 1 à sprint 3** ;
3. **premier schéma de base de données et contrats API**.
