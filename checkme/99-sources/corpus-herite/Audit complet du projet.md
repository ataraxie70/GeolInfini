---
projet: "checkme"
type: "audit"
phase: "10-etudes"
objet: "Audit de conception et d'état du dépôt — origine de la série d'interventions P0, P1 et P2"
statut_documentaire: "Historique — audit de référence du 2026-08-02"
designation_historique: "Audit complet du projet checkMe"
provenance: "files/Audit_Complet_CheckMe.md"
remise_en_cause: true
mise_en_conformite: 2026-09-06
tags:
  - checkme
  - etudes
  - audit
---

> [!danger] Document sous réexamen intégral — 2026-09-06
> Le porteur a décidé de **reprendre la conception depuis l'intention**. Aucun énoncé de ce document ne vaut engagement, y compris ceux qu'il présente comme tranchés, canonisés ou terminés. Il est conservé comme **état de travail antérieur**, pas comme référence opposable — `DEC-C-016` au [[checkme/90-pilotage/Journal des décisions|Journal des décisions]].

# Audit complet du projet checkMe

Date : 2026-08-02
Statut : audit de conception et d'etat du workspace

---

## 1. Synthese executive

checkMe est concu comme une plateforme de publication et de consultation d'informations nominatives officielles : un organisme publie une liste ou un resultat, puis un citoyen retrouve uniquement sa propre situation dans le perimetre d'une publication precise, sans compte obligatoire.

Le coeur de valeur n'est pas le back-office, ni l'import de fichiers en soi. Le coeur est la Consultation : recherche rapide, contextualisee, fiable, prudente face aux identifiants faibles, et suffisamment frugale pour fonctionner en contexte mobile/reseau limite.

Etat reel du projet dans ce workspace :

- Le projet est au stade conception avancee.
- Il existe 8 documents de conception principaux dans `files/`, plus une vision fondatrice, une maquette HTML citoyen et un fichier `SKILL.md` de design.
- Il n'existe pas encore de code applicatif, migrations SQL executables, OpenAPI, tests, Dockerfile, `docker-compose.yml`, README operationnel ou CI.
- La racine contient un dossier `.git`, mais il ne s'agit pas d'un depot Git valide exploitable dans ce workspace.
- Le Document 0 existe sous `files/Vision_et_Principes_Fondateurs.md`, mais le fichier est pollue par un export de conversation avant le contenu canonique.
- Le Document UX/UI existe (`files/Document_8_UX_UI.md`) et une premiere maquette citoyen existe (`files/checkme_ecran_citoyen.html`).

Verdict :

- Qualite de conception metier : bonne a tres bonne.
- Coherence DDD generale : bonne.
- Readiness pour demarrer une implementation : moyenne, car plusieurs choix doivent etre rendus executables et testes.
- Readiness production : faible, normal a ce stade, car il manque l'application, les tests, l'exploitation, les controles de securite detailles et la conformite operationnelle.

Score indicatif :

- Vision produit : 8/10
- Architecture cible : 7/10
- Securite conceptuelle : 6.5/10
- Specification implementable : 5.5/10
- Etat logiciel reel : 1.5/10

---

## 2. Ce que le projet est

checkMe repond a un probleme concret : des organismes publient des resultats, convocations, listes ou situations administratives ; les citoyens doivent pouvoir verifier rapidement s'ils sont concernes, sans parcourir des PDF ou listes massives.

Les invariants produit qui ressortent fortement :

- Une recherche se fait toujours dans une publication precise.
- Le citoyen n'a pas besoin de compte.
- checkMe ne decide pas du contenu ; il restitue ce que l'organisme a publie.
- Les organismes sont isoles entre eux.
- Les identifiants de recherche sont definis et priorises par l'organisme.
- Les imports doivent etre absorbes sans exposer leur complexite a la consultation.
- La traçabilite est une valeur centrale, pas un ajout secondaire.

La decomposition strategique est la suivante :

- Core : Consultation.
- Support : Gestion des Publications, Integration des Donnees, Audit.
- Generic : Gestion des Organismes, IAM Organismes, Compte Citoyen optionnel.

Cette lecture est coherente : le projet evite de faire du compte citoyen une barriere, et isole bien la consultation de l'administration interne.

---

## 3. Ce qui existe dans le workspace

Fichiers trouves :

- `files/Vision_et_Principes_Fondateurs.md`
- `files/Document_1_DDD_Strategique.md`
- `files/Document_2_Vision_Architecture.md`
- `files/Document_3_DDD_Tactique.md`
- `files/Document_4_Architecture_Logicielle.md`
- `files/Document_5_API_Contrats.md`
- `files/Document_6_Securite.md`
- `files/Document_7_Base_De_Donnees.md`
- `files/Document_8_UX_UI.md`
- `files/checkme_ecran_citoyen.html`
- `files/SKILL.md`

Ce qui manque pour parler d'un projet logiciel executable :

- Pas de `go.mod`.
- Pas de code Go.
- Pas d'app Next.js.
- Pas de schema SQL executable sous forme de migrations.
- Pas de fichier OpenAPI.
- Pas de tests unitaires ou integration.
- Pas de `deploy/docker-compose.yml` malgre sa mention dans la conception.
- Pas de CI.
- Pas de README d'installation.
- Pas de Document 0 proprement isole et nomme comme les autres documents.
- Pas de maquettes back-office ni de prototype relie a une API.

Conclusion d'etat : le projet n'est pas encore en phase implementation. Il est en fin de phase architecture/specification, avec plusieurs decisions solides mais encore insuffisamment transformees en artefacts verifiables.

---

## 4. Points forts

### 4.1 Frontieres DDD bien posees

La distinction Consultation / Publications / Integration / Audit / IAM / Organismes est saine. Elle evite de melanger recherche citoyenne, ingestion de donnees et administration.

Le choix de garder Compte Citoyen optionnel et separe de IAM Organismes est tres bon. Les deux populations n'ont ni le meme risque, ni le meme volume, ni la meme logique de cycle de vie.

### 4.2 Monolithe modulaire pragmatique

Le choix d'un monolithe modulaire est adapte a une equipe d'une personne. Eviter les microservices au demarrage est une bonne decision.

La conception garde toutefois une porte de sortie pour extraire Consultation plus tard, ce qui est le bon module candidat a l'echelle independante.

### 4.3 CQRS leger pour Consultation

La separation entre modele d'ecriture PostgreSQL et vue de lecture Consultation est pertinente. Les besoins sont vraiment differents :

- Publications : validation, import, historisation, correction.
- Consultation : recherche rapide et pic de charge.

Le principe est bon, mais l'implementation doit etre beaucoup plus precise sur l'indexation, les faux positifs et la relecture d'evenements.

### 4.4 Publication et Enregistrement comme agregats separes

Tres bon choix. Une publication peut contenir des centaines de milliers de lignes ; l'agregat Publication ne doit pas contenir tous les Enregistrements.

Cette decision evite :

- les verrous transactionnels massifs ;
- les chargements memoire absurdes ;
- les imports impossibles a traiter proprement.

### 4.5 Securite deja prise au serieux

Les bonnes idees deja presentes :

- pas de compte citoyen obligatoire ;
- sessions opaques pour les administrateurs plutot que JWT auto-porteurs ;
- rate-limit par couple IP/publication ;
- journal de recherche avec HMAC du critere au lieu de valeur brute ;
- scoping `organismeId` au niveau repository ;
- separation audit metier / journal securite.

Ces choix montrent une bonne intuition produit/securite.

---

## 5. Problemes critiques ou bloquants

### P0-1. Le Document 0 existe, mais il n'est pas encore un artefact propre

Les documents 1 a 8 dependent explicitement du Document 0. Le contenu existe dans `files/Vision_et_Principes_Fondateurs.md`, mais le fichier commence par environ 78 lignes de texte de conversation/export avant le vrai titre "Document 0 — Vision et Principes Fondateurs".

Impact : le document fondateur n'est pas encore proprement exploitable comme source canonique. Cela peut creer de la confusion dans une revue, une transmission ou une future automatisation documentaire.

Action recommandee :

- extraire uniquement le contenu canonique a partir du titre `Document 0 — Vision et Principes Fondateurs` ;
- le renommer `files/Document_0_Vision_Principes_Fondateurs.md` pour suivre la convention des autres documents ;
- supprimer ou archiver le texte de conversation ;
- faire une passe d'alignement entre Document 0 et les documents 1 a 8.

### P0-2. La strategie de recherche melange identifiants exacts et fuzzy matching

La conception choisit Meilisearch pour la tolerance aux fautes, utile pour l'identifiant faible "nom + prenom". Mais les exemples incluent aussi des identifiants forts comme CNIB ou numero de recepisse.

Risque : une recherche tolerante aux fautes sur des identifiants forts peut retourner un faux positif ou creer une ambiguite artificielle. Pour des donnees nominatives, un faux positif est une fuite de donnees.

Action recommandee :

- definir deux familles d'identifiants :
  - identifiants exacts : CNIB, recepisse, matricule, numero dossier ;
  - identifiants faibles/fuzzy : nom + prenom, date de naissance, variantes orthographiques.
- interdire le fuzzy matching pour les identifiants forts ;
- utiliser une normalisation deterministe + hash/index exact pour les identifiants forts ;
- reserver Meilisearch ou un algorithme dedie uniquement aux identifiants faibles ;
- ajouter des tests de non-regression sur faux positifs.

Critere d'acceptation : une recherche CNIB legerement differente ne doit jamais retourner la situation d'une autre personne.

### P0-3. La projection Consultation n'a pas encore de modele de fiabilite suffisant

La Transactional Outbox est une bonne direction, mais la specification ne ferme pas encore les cas importants :

- livraison at-least-once ou exactly-once ?
- projecteurs idempotents ?
- verrouillage concurrent des lignes outbox ?
- retries exponentiels ?
- dead-letter queue ?
- versionnement des schemas d'evenements ?
- replay complet d'une projection Meilisearch depuis PostgreSQL ?
- detection de divergence entre PostgreSQL et l'index ?

Risque : une publication peut etre visible comme "publiee" mais partiellement indexee, ou rester indexee apres correction/suppression/archive.

Action recommandee :

- considerer l'outbox comme at-least-once ;
- rendre tous les consommateurs idempotents ;
- ajouter `event_version`, `aggregate_id`, `aggregate_version`, `correlation_id`;
- definir un job de replay/rebuild de l'index Consultation ;
- ne marquer un evenement `publie` qu'apres persistance reussie cote consommateur ;
- ajouter un statut d'indexation par publication : `non_indexee`, `indexation_en_cours`, `indexee`, `indexation_en_erreur`.

### P0-4. L'etat actuel n'est pas implementable sans specifications executables

Les documents de conception sont riches, mais il manque les artefacts qui empechent les interpretations divergentes :

- OpenAPI pour les APIs citoyen et organisme ;
- migrations SQL versionnees ;
- schemas JSON pour `modele`, `mapping`, `valeurs`, `identifiants_valeurs`;
- fixtures d'exemple ;
- tests d'acceptation metier ;
- ADRs individuels ;
- matrice roles/actions ;
- contrats d'evenements versionnes.

Action recommandee : avant de coder large, produire une vertical slice executable :

1. creer une publication ;
2. definir un modele avec un identifiant exact ;
3. importer 5 enregistrements ;
4. publier ;
5. indexer ;
6. rechercher cote citoyen ;
7. modifier un enregistrement ;
8. verifier la reindexation ;
9. archiver ;
10. verifier que la consultation est bloquee.

### P0-5. La conformite donnees personnelles est encore trop conceptuelle

Le Document 6 cite correctement la loi burkinabe n°001-2021/AN. Verification externe : l'Assemblee nationale reference bien la Loi n°001-2021/AN portant protection des personnes a l'egard du traitement des donnees a caractere personnel, et les sources juridiques consultables indiquent qu'elle a ete adoptee le 30 mars 2021 et remplace la loi de 2004.

Mais la conception ne couvre pas encore assez :

- base legale du traitement selon les cas d'usage ;
- repartition responsable de traitement / sous-traitant entre checkMe et les organismes ;
- formalites ou autorisations CIL ;
- notice d'information citoyen ;
- durees de conservation par type de donnees ;
- procedure d'exercice des droits ;
- procedure de violation de donnees ;
- localisation des donnees et sauvegardes ;
- purge effective des donnees personnelles ;
- registre des traitements ;
- minimisation des champs `affichable`.

Action recommandee : creer un document separe, par exemple `Document_9_Conformite_Gouvernance_Donnees.md`, distinct de la securite technique.

---

## 6. Problemes majeurs

### P1-1. Le choix "Go protege les frontieres de module" est surestime

Le Document 4 dit que Go applique nativement la discipline de frontiere de module. C'est partiellement vrai, mais insuffisant.

En Go :

- les identifiants non exportes protegent au niveau package ;
- le dossier `internal/` empeche les imports depuis l'exterieur de l'arbre parent ;
- mais il n'empeche pas automatiquement un package sibling dans `internal/` d'importer un autre sous-package `internal/<contexte>/infrastructure` si celui-ci expose des symboles.

Risque : la discipline modulaire peut deriver sans que le compilateur bloque tout.

Action recommandee :

- ajouter des tests d'architecture automatises avec `go list`;
- interdire par CI les imports croises vers `*/infrastructure`;
- exposer des interfaces dans les packages racines de modules ;
- garder `shared/kernel` minimal et audite ;
- documenter les dependances autorisees sous forme de matrice.

### P1-2. Le cache Redis peut stocker des situations personnelles

Le Document 7 evite les donnees nominatives dans les cles Redis, mais `cache:situation:{publicationId}:{critereHash}` peut stocker la reponse elle-meme, donc potentiellement une situation personnelle.

Risque : une fuite Redis expose des resultats, meme si les cles sont hachees.

Action recommandee :

- TTL tres court pour les resultats positifs ;
- envisager de ne cacher que les resultats "aucun" et "ambigu", ou de chiffrer les valeurs du cache ;
- invalider sur `EnregistrementModifie`, `EnregistrementSupprime`, `PublicationArchivee`, `PublicationModeleEtendu`, et rebuild d'index ;
- isoler Redis reseau + auth + TLS si deploiement distribue.

### P1-3. La securite admin manque de details critiques

Le choix des sessions opaques est bon, mais il manque :

- hash du token de session cote Redis, pas token brut ;
- politique de mot de passe ;
- stockage de mot de passe avec Argon2id ou bcrypt correctement parametre ;
- invitation initiale des admins ;
- reset password ;
- MFA au moins pour administrateur national ;
- journalisation des connexions reussies, pas seulement echouees ;
- detection de session concurrente suspecte ;
- gestion des comptes inactifs ;
- rotation et revocation des roles.

Action recommandee : specifier IAM Organismes comme un module complet, meme si generique.

### P1-4. Les webhooks HMAC n'ont pas de protection anti-rejeu specifiee

Signer une requete ne suffit pas si un attaquant peut rejouer une requete capturee.

Action recommandee :

- inclure timestamp ;
- inclure nonce ou identifiant d'evenement externe ;
- imposer une fenetre de validite courte ;
- stocker les nonces recents ;
- signer la methode, le chemin, le body canonique, le timestamp et le nonce ;
- gerer la rotation des secrets.

### P1-5. Le rate limiting par IP/publication sera fragile en contexte mobile

Le choix est bon comme base, mais en Afrique de l'Ouest, plusieurs utilisateurs legitimes peuvent partager des IP operateur/NAT.

Risque : bloquer des citoyens legitimes pendant un pic.

Action recommandee :

- garder IP/publication comme signal, pas seule decision ;
- prendre en compte User-Agent grossier, empreinte non intrusive, vitesse de saisie, taux d'echec ;
- definir un seuil different selon identifiant fort/faible ;
- prevoir une degradation douce : delai progressif avant CAPTCHA/preuve de travail ;
- journaliser les faux positifs de rate-limit.

### P1-6. La base de donnees manque de contraintes et tables operationnelles

Manques notables :

- table d'idempotence pour `Idempotency-Key`;
- schema pour utilisateurs IAM, roles, invitations ;
- schema organismes ;
- schema compte citoyen si squelette maintenu ;
- cles HMAC avec version (`key_id`) pour `critere_hash`;
- retention/purge ;
- contrainte ou index de duplication par identifiant exact selon publication ;
- table de statut d'indexation ;
- table dead-letter outbox ;
- horodatage de suppression/purge distinct de `deleted_at`.

Action recommandee : transformer Document 7 en migrations MVP minimales, pas seulement en exemples SQL.

### P1-7. Les imports massifs ne sont pas encore assez specifies

Le DDD de `LotImport` est bon, mais la conception ne dit pas encore :

- formats acceptes CSV/XLSX/JSON ;
- encodage ;
- taille maximale ;
- streaming vs chargement memoire ;
- detection de colonnes ;
- preview avant application ;
- rollback logique d'un lot applique ;
- strategie sur doublons ;
- controle de l'ordre des corrections ;
- reprise apres crash ;
- stockage du fichier brut dans MinIO avec retention.

Action recommandee : commencer avec CSV strict + mapping explicite + streaming + rapport d'erreurs pagine.

### P1-8. L'UX existe, mais reste incomplete et partiellement contradictoire avec la frugalite reseau

Le Document 8 UX/UI existe et couvre correctement le parcours citoyen, les grands etats de resultat et les premiers ecrans back-office. Une maquette statique citoyen existe aussi dans `files/checkme_ecran_citoyen.html`.

Mais l'ensemble reste incomplet :

Exemples :

- la maquette couvre surtout le citoyen, pas le back-office ;
- elle n'est pas reliee a une API ;
- elle contient une barre de demonstration qui devra disparaitre du produit ;
- elle charge Google Fonts, alors que le Document 8 recommande des polices systeme pour limiter le poids reseau ;
- les parcours de creation de publication, mapping, suivi d'import, invitation admin et indexation en cours ne sont pas encore maquettes.

Action recommandee :

- garder la maquette HTML comme prototype exploratoire ;
- produire les maquettes back-office minimales ;
- remplacer les fontes distantes par polices systeme ou assets auto-heberges ;
- ajouter les etats d'erreur/retry/rate-limit ;
- verifier mobile et accessibilite avant implementation Next.js.

---

## 7. Problemes mineurs ou clarifications

### P2-1. Etat `mise_a_jour` peu clair

Les documents mentionnent `Publiée -> MiseAJour -> Archivée`, mais l'API parle surtout de `publiee`. Il faut clarifier si `mise_a_jour` est un etat stable, un evenement, ou un statut d'indexation.

Recommandation : eviter de confondre etat metier de publication et etat technique d'indexation.

### P2-2. Nommage des evenements avec accents vs sans accents

Les documents alternent entre `PublicationPubliée`, `PublicationPubliee`, `EnregistrementAjouté`, `EnregistrementAjoute`.

Recommandation : dans le code et les contrats, utiliser ASCII stable : `PublicationPubliee`, `EnregistrementAjoute`, etc.

### P2-3. API publique et enumeration de publication

L'API distingue `404 PUBLICATION_INTROUVABLE` et `410 PUBLICATION_NON_PUBLIQUE`. Si les identifiants de publication sont opaques et non devinables, le risque est faible. Mais une difference de statut peut quand meme reveler l'existence d'une publication non publique.

Recommandation : pour l'API citoyen, considerer une reponse uniforme pour publication introuvable/non publique, ou n'exposer que des `public_slug` explicitement publies.

### P2-4. ADRs non separes

Les decisions sont presentes dans les documents, mais pas sous forme d'ADRs individuels.

Recommandation : creer un dossier `files/adr/` avec les decisions majeures.

### P2-5. `files/SKILL.md` semble etre un artefact d'outillage, pas un document produit

Le fichier `files/SKILL.md` contient des consignes de design frontend generiques. Il peut etre utile comme guide de style pour produire des maquettes, mais il ne semble pas appartenir au corpus de conception metier checkMe.

Recommandation : le deplacer dans un dossier d'outillage (`.codex/`, `docs/process/`, ou equivalent) ou le renommer clairement pour eviter de le confondre avec les specifications produit.

---

## 8. Audit par domaine

### Domaine metier

Evaluation : solide.

La conception comprend bien que la "Publication" est l'unite centrale et que la "Recherche" n'est jamais globale. C'est important pour eviter de construire une base citoyen transverse qui deviendrait vite intrusive et juridiquement plus risquee.

Point a renforcer : definir les types de publications MVP. Par exemple :

- resultats de concours ;
- convocations ;
- listes d'admission ;
- bourses ;
- recrutements.

Un MVP doit choisir 1 ou 2 cas seulement.

### Architecture applicative

Evaluation : bonne direction, mais manque de garde-fous executables.

Le monolithe modulaire Go + frontends separes est pragmatique. Mais la separation de modules ne doit pas rester une intention. Elle doit etre testee par CI.

Priorite : vertical slice Go avec packages reels, tests et interdictions d'import.

### Donnees

Evaluation : bonne structure, manque de contraintes operationnelles.

PostgreSQL + schemas par module est coherent. JSONB pour `modele` et `valeurs` est acceptable au demarrage, a condition de valider par JSON Schema ou equivalent cote application.

Priorites :

- schema JSON versionne ;
- indexes utiles sur identifiants exacts ;
- table idempotence ;
- retention/purge ;
- rebuild index.

### Recherche

Evaluation : zone de risque principale.

Le projet repose sur une recherche fiable. Toute erreur ici touche directement la confiance.

La conception doit separer fermement :

- resolution exacte ;
- resolution fuzzy ;
- ambiguite ;
- absence de resultat ;
- non-divulgation.

Priorite : tests de recherche avant UI.

### Securite

Evaluation : bonnes intuitions, specification incomplete.

Le modele de menace identifie les bons actifs. Les decisions HMAC/rate-limit/session opaque sont bonnes. Mais les details IAM, webhook, cache, retention et exploitation doivent etre precises.

Priorite : Document securite v0.2 avec controles implementables.

### Conformite

Evaluation : insuffisante pour production.

La loi applicable est identifiee, mais les obligations operationnelles ne sont pas encore transformees en exigences produit et processus.

Priorite : cadrage juridique avec un professionnel local avant toute mise en production avec donnees reelles.

### Exploitation

Evaluation : trop legere.

Il manque :

- sauvegardes ;
- restauration testee ;
- monitoring ;
- alerting ;
- logs structures ;
- runbooks ;
- rotation secrets ;
- procedure incident ;
- capacite de rebuild Meilisearch ;
- estimation couts.

Priorite : Document "Exploitation MVP".

---

## 9. Plan d'action recommande

### Etape 1 - Stabiliser les documents source

1. Nettoyer et renommer Document 0.
2. Completer Document UX/UI avec les maquettes back-office.
3. Ajouter Document Conformite & Gouvernance des Donnees.
4. Ajouter Document Exploitation MVP.
5. Convertir les decisions majeures en ADRs.

### Etape 2 - Rendre les contrats executables

1. Ecrire OpenAPI `api-citoyen`.
2. Ecrire OpenAPI `api-organisme`.
3. Ecrire JSON Schema pour `modele`.
4. Ecrire JSON Schema pour `mapping`.
5. Ecrire schemas d'evenements outbox versionnes.
6. Ecrire migrations SQL initiales.

### Etape 3 - Construire une vertical slice

Objectif : prouver l'architecture de bout en bout.

Perimetre :

- un organisme ;
- un admin organisme ;
- une publication ;
- un modele simple ;
- import CSV ;
- publication ;
- indexation ;
- recherche citoyenne exacte ;
- audit minimal.

Ne pas inclure au depart :

- compte citoyen ;
- connecteurs ;
- synchronisation ;
- notifications ;
- recherche fuzzy avancee ;
- multi-front back-office complet.

### Etape 4 - Durcir Consultation

1. Exact match pour identifiants forts.
2. Fuzzy uniquement pour identifiants faibles.
3. Tests de faux positifs.
4. Rate-limit progressif.
5. Cache court et invalide correctement.
6. Rebuild index.
7. Monitoring de divergence index/base.

### Etape 5 - Preparer une premiere production pilote

1. Donnees non sensibles ou organisme pilote.
2. Convention de responsabilite avec l'organisme.
3. Notice citoyen.
4. Sauvegardes/restauration.
5. Journalisation securite.
6. Runbook incident.
7. Revue de securite avant donnees reelles.

---

## 10. MVP conseille

MVP tres serre :

- Back-office minimal :
  - login admin organisme ;
  - creer publication ;
  - definir modele ;
  - importer CSV ;
  - voir erreurs ;
  - publier ;
  - voir statut indexation.
- Interface citoyen :
  - ouvrir une publication publique ;
  - saisir un identifiant exact ;
  - voir trouve / aucun / ambigu ;
  - aucune creation de compte.
- Backend :
  - Go monolithe modulaire ;
  - PostgreSQL ;
  - Redis pour sessions/rate-limit ;
  - index exact interne ou Meilisearch configure strictement ;
  - outbox minimale ;
  - audit minimal.

Reporter apres MVP :

- compte citoyen ;
- notifications ;
- connecteurs ;
- synchronisation ;
- recherche fuzzy avancee ;
- catalogue complexe categories/sessions ;
- extraction microservice Consultation.

---

## 11. Verdict final

checkMe est un projet avec une vraie colonne vertebrale conceptuelle. La vision est lisible, les frontieres DDD sont plutot bien pensees, et les choix d'architecture evitent plusieurs pieges classiques : microservices trop tot, compte citoyen obligatoire, recherche globale intrusive, import couple a la consultation.

Le principal danger maintenant est de rester trop longtemps dans la sophistication documentaire, ou de coder sans transformer les decisions critiques en contrats testables. Le point le plus sensible est la Consultation : matching, indexation, cache, ambiguite et non-divulgation doivent etre prouves par tests avant d'elargir le produit.

Decision recommandee : ne pas ajouter de nouveaux grands modules pour l'instant. Nettoyer Document 0, completer UX back-office, produire conformite/exploitation minimal, puis construire une vertical slice complete et testee.
