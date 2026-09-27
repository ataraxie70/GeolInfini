# LEVELUP — Backlog technique exécutif

## 0. Objectif du backlog
Transformer le corpus documentaire existant en plan de réalisation exploitable par un développeur ou une équipe de développement, sans ambiguïté sur :
- le périmètre initial ;
- les dépendances ;
- les priorités ;
- les critères d’acceptation ;
- le découpage backend / administration / données / tests.

---

## 1. Résultat attendu du produit

### 1.1 Nature du système
Plateforme de pilotage de formation personnelle structurée comme un système de contrainte intelligente.

### 1.2 Fonction principale
Le système impose un chemin d’apprentissage, enregistre les écarts, gère la reprise et permet l’administration de nouveaux programmes indépendants.

### 1.3 Propriétés non négociables
- un programme n’est jamais confondu avec un autre ;
- un plan appartient à un seul programme ;
- un sujet peut être verrouillé par ses prérequis ;
- une séance possède une date, un état et un résultat ;
- toute interruption doit pouvoir être reprise selon un protocole ;
- toute pénalité doit être historisée ;
- toute action d’administration doit laisser une trace.

---

## 2. Découpage fonctionnel

### 2.1 Domaines métier
1. **Programme**
   - cadre global de formation.
2. **Plan**
   - séquence temporelle et pédagogique rattachée à un programme.
3. **Module**
   - bloc logique d’apprentissage.
4. **Sujet**
   - unité atomique de travail.
5. **Pré-requis**
   - dépendance obligatoire avant accès.
6. **Séance**
   - exécution quotidienne ou ponctuelle.
7. **Validation**
   - preuve d’acquisition.
8. **Révision**
   - rappel différé.
9. **Pénalité**
   - conséquence d’un non-respect.
10. **Reprise**
    - recalage après interruption.
11. **Administration**
    - création et pilotage des structures.
12. **Journal**
    - audit, historique, traçabilité.

### 2.2 Acteurs fonctionnels
- apprenant unique ;
- administrateur ;
- moteur de planification ;
- moteur de progression ;
- moteur de reprise ;
- moteur de discipline.

---

## 3. Périmètre MVP

### 3.1 Inclus
- création d’un programme ;
- création d’un plan ;
- ajout de modules ;
- ajout de sujets ;
- définition des prérequis ;
- génération d’un calendrier ;
- marquage d’une séance comme faite / non faite ;
- déclenchement d’une pénalité ;
- reprise après interruption ;
- tableau de bord d’administration minimal ;
- historique des actions.

### 3.2 Exclu du MVP
- marketplace de ressources ;
- multi-utilisateur complet ;
- collaboration en temps réel ;
- système de paiement ;
- intelligence artificielle avancée ;
- intégrations externes complexes ;
- mobile natif.

---

## 4. Architecture cible

### 4.1 Couches
1. **Présentation**
   - dashboard apprenant ;
   - dashboard administration.
2. **API**
   - REST ou équivalent.
3. **Application**
   - orchestration des cas d’usage.
4. **Domaine**
   - règles métier pures.
5. **Infrastructure**
   - base de données, journalisation, stockage.
6. **Batch / jobs**
   - rappels, recalculs, révisions.

### 4.2 Règle de séparation
- aucune règle métier ne doit dépendre de l’interface ;
- aucune requête SQL brute ne doit vivre dans la logique de domaine ;
- aucun état critique ne doit être déduit uniquement du frontend.

---

## 5. Schéma de données minimal

### 5.1 Entités
- users
- programs
- study_plans
- modules
- topics
- prerequisites
- sessions
- completions
- revisions
- penalties
- interruptions
- admin_actions
- activity_logs
- attachments
- settings

### 5.2 Contraintes
- `programs.id` unique ;
- `study_plans.program_id` obligatoire ;
- `topics.module_id` obligatoire ;
- `prerequisites.topic_id` et `prerequisites.required_topic_id` obligatoires ;
- une session ne peut avoir qu’un statut valide ;
- une pénalité doit référencer un événement source ;
- tout changement administratif doit être historisé.

### 5.3 États recommandés
#### Session
- planned
- done
- missed
- postponed
- interrupted
- resumed
- cancelled

#### Topic
- locked
- available
- in_progress
- validated
- archived

#### Plan
- draft
- active
- paused
- completed
- archived

---

## 6. Backlog par épics

### EPIC A — Cadrage fonctionnel
**But :** figer la vérité du produit.

#### A1. Dictionnaire métier
- définir programme, plan, module, sujet, séance, reprise, pénalité ;
- éliminer les synonymes concurrents ;
- valider les états et transitions.

**Critère d’acceptation :**
- un glossaire unique existe ;
- aucun terme n’a deux définitions.

#### A2. Périmètre MVP
- lister le strict minimum livrable ;
- séparer MVP et extensions.

**Critère d’acceptation :**
- une frontière nette entre v1 et futur existe.

---

### EPIC B — Modèle de données
**But :** rendre les règles persistables.

#### B1. Modélisation relationnelle
- produire l’ERD ;
- fixer cardinalités ;
- définir les clés et contraintes.

**Critère d’acceptation :**
- le schéma permet de reconstruire l’état métier sans ambiguïté.

#### B2. Historique et audit
- créer journal des actions ;
- historiser pénalités, reprises, modifications admin.

**Critère d’acceptation :**
- chaque action critique laisse une trace exploitable.

#### B3. Seeds minimaux
- créer un premier programme ;
- créer un premier plan ;
- créer quelques modules et sujets de démonstration.

**Critère d’acceptation :**
- la plateforme démarre avec des données de test cohérentes.

---

### EPIC C — Moteur de progression ✅ [COMPLÉTÉ]
**But :** contrôler l’avancement.

#### C1. Vérification des prérequis
- empêcher l’accès prématuré ;
- exposer la raison du verrouillage.

**Critère d’acceptation :**
- un sujet verrouillé reste inaccessible tant que les conditions ne sont pas remplies.

#### C2. Validation de sujet
- marquer un sujet comme acquis ;
- déclencher l’ouverture des sujets dépendants.

**Critère d’acceptation :**
- la validation produit une mise à jour cohérente du graphe de dépendances.

#### C3. Révisions différées
- programmer un rappel après validation ;
- replanifier les sujets à revoir.

**Critère d’acceptation :**
- une validation peut générer une révision automatique.

---

### EPIC D — Moteur de séance ✅ [COMPLÉTÉ]
**But :** transformer la théorie en exécution quotidienne.

#### D1. Génération de séance
- sélectionner la tâche du jour ;
- fixer durée et priorité ;
- associer la séance à un plan.

**Critère d’acceptation :**
- une séance du jour est produite selon le plan actif.

#### D2. Clôture de séance
- marquer fait, partiellement fait, ou manqué ;
- enregistrer le résultat.

**Critère d’acceptation :**
- aucune séance n’est clôturée sans état final.

#### D3. Interruption
- suspendre une séance ;
- mémoriser le contexte ;
- autoriser la reprise conditionnelle.

**Critère d’acceptation :**
- une interruption n’efface jamais le contexte de travail.

---

### EPIC E — Moteur disciplinaire ✅ [COMPLÉTÉ]
**But :** rendre la plateforme contraignante.

#### E1. Détection de manquement
- identifier les tâches non réalisées ;
- déclencher une règle de pénalité.

**Critère d’acceptation :**
- tout manquement génère un événement traçable.

#### E2. Application de pénalité
- définir type, sévérité, motif, durée ;
- affecter une conséquence au planning.

**Critère d’acceptation :**
- la pénalité modifie le comportement du plan.

#### E3. Reprise contrôlée
- recalculer le planning ;
- proposer une séance de rattrapage ;
- redémarrer depuis un point cohérent.

**Critère d’acceptation :**
- une interruption ne casse pas l’ensemble du programme.

---

### EPIC F — Administration
**But :** permettre l’ajout de programmes indépendants.

#### F1. Création de programme
- nom ;
- description ;
- statut ;
- objectif ;
- niveau ;
- catégorie.

**Critère d’acceptation :**
- un nouveau programme peut exister sans dépendre d’un autre.

#### F2. Création de plan
- rattachement à un programme ;
- durée ;
- cadence ;
- objectifs ;
- règles de progression.

**Critère d’acceptation :**
- un plan appartient à un seul programme.

#### F3. Édition du contenu
- ajout de modules ;
- ajout de sujets ;
- ajout de ressources ;
- ordre pédagogique ;
- prérequis.

**Critère d’acceptation :**
- le contenu est modifiable sans casser le schéma global.

#### F4. Gestion temporelle
- calendrier ;
- report ;
- suspension ;
- reprise ;
- replanification.

**Critère d’acceptation :**
- le planning se recalcule proprement après une modification.

#### F5. Gestion des pénalités
- définition des règles ;
- activation / désactivation ;
- liaison au calendrier ;
- historique.

**Critère d’acceptation :**
- toute pénalité est administrable depuis le dashboard.

---

### EPIC G — API backend
**But :** exposer les opérations du domaine.

#### G1. Lecture
- récupérer programmes ;
- récupérer plans ;
- récupérer progression ;
- récupérer séances ;
- récupérer historique.

#### G2. Écriture
- créer programme ;
- créer plan ;
- créer module ;
- créer sujet ;
- valider sujet ;
- clôturer séance ;
- appliquer pénalité ;
- reprendre une session.

**Critère d’acceptation :**
- chaque endpoint correspond à un cas d’usage métier précis.

---

### EPIC H — Qualité et tests
**But :** empêcher la régression.

#### H1. Tests métier
- progression ;
- verrouillage ;
- reprise ;
- pénalité ;
- validation.

#### H2. Tests d’intégrité
- contraintes de base ;
- cohérence des relations ;
- états autorisés.

#### H3. Tests d’interface
- formulaires ;
- navigation ;
- administration ;
- édition.

#### H4. Tests de reprise
- interruption ;
- redémarrage ;
- recalcul de planning.

**Critère d’acceptation :**
- les scénarios critiques sont couverts.

---

## 7. Priorisation réelle

### P0 — indispensable
- glossaire ;
- modèle métier ;
- schéma de données ;
- API de base ;
- création de programme ;
- création de plan ;
- séance du jour ;
- validation ;
- reprise ;
- historique.

### P1 — très important
- dashboard administration ;
- règles de pénalité ;
- révisions automatiques ;
- replanification.

### P2 — extension
- statistiques avancées ;
- moteur de recommandations enrichi ;
- import/export ;
- multi-programmes complets ;
- observabilité avancée.

---

## 8. Ordre recommandé d’implémentation

### Étape 1
- figer le vocabulaire ;
- figer les états ;
- figer les transitions.

### Étape 2
- produire l’ERD final ;
- produire les migrations ;
- produire les seeds.

### Étape 3
- implémenter les entités de domaine ;
- implémenter le moteur de progression ;
- implémenter le moteur de séance.

### Étape 4
- exposer l’API ;
- brancher la persistance ;
- sécuriser les écritures.

### Étape 5
- développer le dashboard admin ;
- ajouter l’édition du programme ;
- ajouter les règles de planning.

### Étape 6
- ajouter le moteur de pénalité ;
- ajouter la reprise ;
- ajouter les révisions.

### Étape 7
- tester ;
- corriger ;
- stabiliser ;
- documenter la version 1.

---

## 9. Critères de sortie de version 1

La version 1 est considérée comme acceptable lorsque :
- un programme peut être créé de bout en bout ;
- un plan peut être rattaché à un programme ;
- un sujet peut être verrouillé par prérequis ;
- une séance quotidienne peut être générée ;
- une séance peut être marquée comme faite ou manquée ;
- une pénalité peut être appliquée ;
- une interruption peut être reprise ;
- le dashboard admin permet d’ajouter un programme totalement nouveau ;
- toutes les actions critiques sont historisées.

---

## 10. Risques techniques principaux

### 10.1 Mélange des couches
Risque : métier, stockage et interface restent entremêlés.  
Mesure : séparation stricte domaine / application / infrastructure / UI.

### 10.2 Explosion du périmètre
Risque : la plateforme devient trop ambitieuse trop tôt.  
Mesure : gel du MVP et rejet des extensions non essentielles.

### 10.3 Contradictions métier
Risque : plusieurs documents imposent des règles divergentes.  
Mesure : un unique glossaire et un unique référentiel de décision.

### 10.4 Reprise fragile
Risque : une interruption casse le planning.  
Mesure : état de session explicite + snapshot du contexte.

---

## 11. Livrables de suite recommandés
1. spécification fonctionnelle consolidée ;
2. modèle conceptuel de données ;
3. architecture technique détaillée ;
4. contrats API ;
5. cahier de tests ;
6. plan de migration ;
7. backlog d’implémentation sprint par sprint.

