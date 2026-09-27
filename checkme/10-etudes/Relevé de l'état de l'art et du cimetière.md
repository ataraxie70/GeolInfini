---
projet: "checkme"
type: "releve-de-lot"
phase: "10-etudes"
lot: "L1"
vague: 0
objet: "Pour chaque catégorie de publication nominative, existe-t-il déjà un moyen d'obtenir sa situation individuelle à partir d'un identifiant ?"
monde: "Monde observé — relevé documentaire et examen du code public des dispositifs ; aucune donnée personnelle collectée"
niveau_de_preuve: "N1 — sources publiques datées, et observation directe des dispositifs"
date_du_releve: 2026-09-10
statut: "Relevé clos — seuils appliqués tels que pré-enregistrés"
document_parent: "[[checkme/10-etudes/Programme d'études|Programme d'études]]"
tags:
  - checkme
  - etudes
  - vague-0
  - etat-de-l-art
---

# Relevé de l'état de l'art et du cimetière — lot `L1`

Exécution du lot `L1` du [[checkme/10-etudes/Programme d'études|Programme d'études]], premier travail de la vague 0 lancée par `DEC-C-086`. Conduit à distance le **2026-09-10**.

> [!warning] Ce relevé établit l'existence et les fonctions des dispositifs, non leur usage
> Toutes les sources sont des publications officielles, des articles de presse, des fiches de publication d'applications et le **code public** des plateformes, lu tel que tout navigateur le reçoit. Elles établissent ce qui est offert. Elles n'établissent ni la fréquentation, ni la fiabilité, ni la satisfaction des personnes concernées.

---

## 1. Résultat en une phrase

**Sur les six catégories pré-enregistrées, aucune n'est entièrement servie ; deux procédures le sont — le certificat d'études primaires et l'orientation post-baccalauréat —, et la première l'est par une plateforme que l'État a lui-même mise en service en juin 2026.**

---

## 2. Méthode

### 2.1. Règles de vérification

1. **Tout énoncé est vérifié à sa source primaire.** Les résumés produits par les moteurs de recherche ne sont jamais tenus pour source. Trois d'entre eux se sont révélés faux à la vérification et sont écartés au point 2.3.
2. **Les plateformes qui ne restituent leur contenu qu'à un navigateur** sont examinées par leur code public — routes, libellés d'écran, adresses d'interfaces de programmation publiques. Aucune authentification n'est tentée, aucun formulaire n'est soumis, aucune donnée n'est demandée à un dispositif.
3. **Aucune liste nominative n'est ouverte ni copiée**, conformément au point 3.3 du programme.

### 2.2. Règle d'application des classements aux catégories composées

Deux catégories pré-enregistrées nomment explicitement plusieurs éléments : *« 3. Examens scolaires nationaux — certificat d'études primaires, brevet d'études du premier cycle, baccalauréat »* et *« 4. Orientation post-baccalauréat et bourses nationales »*. Le classement du programme est appliqué **à chaque élément nommé**. Une catégorie n'est classée **servie** que si tous ses éléments le sont, et le seuil `L1-b` retire du périmètre les seuls éléments servis.

Motif : c'est la lecture qui correspond à l'objet du seuil `L1-b` — ne plus investiguer là où le besoin est servi, et seulement là. La règle n'ajoute aucun seuil et n'en modifie aucune valeur.

### 2.3. Énoncés écartés à la vérification

| Énoncé circulant | Vérification | Sort |
| --- | --- | --- |
| Le service « DIET SMS » d'Orange Burkina servirait à consulter des résultats d'examen | La page de l'opérateur décrit un service de *« conseils et astuces de bien-être »*, à 27 francs CFA le message | Écarté |
| Le site `men-deco.org` permettrait de consulter les résultats du brevet d'études du premier cycle au Burkina Faso | L'article source traite exclusivement de la **Côte d'Ivoire** | Écarté du relevé burkinabè ; retenu comme comparable, point 8 |
| La plateforme `defense.ciconcours.net` serait celle du ministère de la Défense du Burkina Faso | Le domaine `ciconcours.net` est exploité par SONEC AFRICA pour des ministères de **Côte d'Ivoire** ; l'Agence ivoirienne de presse y rattache le concours de l'Académie des forces armées de Zambakro | Écarté du relevé burkinabè ; retenu comme comparable, point 8 |
| `e-concours` permettrait de *« consulter leurs résultats »* avec le numéro de récépissé | L'article cité renvoie seulement vers une publication du ministère sur un réseau social ; la phrase n'y figure pas | Écarté — voir le point 4 |

---

## 3. Matrice catégorie × moyen d'accès

| Catégorie pré-enregistrée | Élément | Émetteur | Identifiant | Moyen individuel officiel | Classement |
| --- | --- | --- | --- | --- | --- |
| **1. Concours directs de la fonction publique** | — | Agence générale de recrutement de l'État (AGRE), ministère chargé de la fonction publique | Numéro de récépissé ; numéro de la carte nationale d'identité burkinabè (CNIB) à l'inscription | **Aucun.** `e-concours` sert l'inscription, le paiement et le récépissé. Les résultats sont publiés en communiqués et en listes — *« Résultats de présélection après l'écrit par centre et par ordre de numéro récépissé »* | **Non servie** |
| **2. Concours professionnels** | — | Même émetteur | Idem | **Aucun.** `e-concours-pro` présente les mêmes fonctions qu'`e-concours`. Les résultats d'admission de quinze concours professionnels 2026 ont été publiés le 2026-06-04 par une publication du ministère sur un réseau social | **Non servie** |
| **3. Examens scolaires nationaux** | Certificat d'études primaires | Ministère chargé de l'enseignement de base | Numéro de procès-verbal **et** date de naissance, session de 2023 à 2026 | **Oui** — `resultats.examens.gov.bf`, mise en service annoncée le 2026-06-13. Gratuit. Détail au point 5 | **Servie** |
| | Brevet d'études du premier cycle | Ministère chargé de l'enseignement secondaire | Non établi | **Aucun trouvé.** Résultats proclamés par jury dans les centres ; statistiques nationales publiées par l'Agence d'information du Burkina | **Non servie** |
| | Baccalauréat | Idem ; Office du baccalauréat | Non établi | **Aucun trouvé.** Résultats proclamés dans les centres. Le site `officedubac.bf` ne répondait pas le 2026-09-10 | **Non servie** |
| | *Catégorie 3 dans son ensemble* | | | | **Non servie**, au sens du point 2.2 |
| **4. Orientation post-baccalauréat et bourses nationales** | Orientation post-baccalauréat | Direction générale de l'enseignement supérieur, `campusfaso.bf` | Identifiant national d'étudiant (INE) et mot de passe | **Oui** — *« tout bachelier orienté devra se rendre sur la plateforme […] dans "mon compte" en remplissant les champs "N°INE" et "mot de passe" »*. Résultats de la session 2026-2027 annoncés du 10 au 13 septembre 2026 | **Servie** |
| | Bourses nationales | Direction générale du Conseil à l'orientation universitaire et des bourses, ancien CIOSPB | Non établi | **Aucun.** Résultats publiés en fichiers PDF sur `ciospb.gov.bf`, sans recherche nominative | **Non servie** |
| | *Catégorie 4 dans son ensemble* | | | | **Non servie**, au sens du point 2.2 |
| **5. Concours des forces de défense et de sécurité** | — | Gendarmerie nationale, Police nationale | Non établi | **Aucun trouvé.** Résultats publiés en communiqués sur les sites institutionnels — *« Communiqué Résultats d'admissibilité concours ESO session 2025 »* | **Non servie** |
| **6. Résultats universitaires** | — | Universités publiques | Non établi | **Aucun trouvé.** Le relevé du 2026-09-08 sur la plateforme universitaire nationale ne décrit aucune consultation par l'étudiant — [[Relevé du périmètre CampusFaso]] | **Non servie** |

> [!note] Une procédure hors des catégories pré-enregistrées, relevée sans être comptée
> La même plateforme officielle sert aussi les résultats de l'**entrée en sixième** 2026, par numéro de table et date de naissance — annonce du 2026-07-22. Cette procédure ne figure pas dans la liste fixée d'avance ; elle est consignée ici et n'entre dans aucun seuil.

---

## 4. Examen de la déclaration `S2` — la plateforme `e-concours`

Déclaration du porteur du 2026-09-10 : *la plateforme permet seulement de postuler à un concours et de recevoir son récépissé*. Trois examens indépendants.

| Examen | Constat |
| --- | --- |
| **Code public du site** | Quarante routes, dont `inscription`, `espace-candidat`, `mes-concours`, `paiement`, `recapitulatif`, `verif_ins`, `liste_concours`, `mes-sms`. Libellés publics : *« Liste des candidats »*, *« Vérifier une inscription »*, *« Consulter la liste des candidatures »*. **Aucune route, aucun libellé** ne porte sur un résultat, une admission ou une convocation : les mots *admis* et *convocation* n'apparaissent pas ; le mot *résultat* n'apparaît qu'une fois, dans le compteur de la recherche de la foire aux questions |
| **Foire aux questions officielle** | Vingt-neuf entrées actives, lues sur l'interface publique de la plateforme. **Aucune** ne traite de la consultation d'un résultat |
| **Fiche de l'application mobile** | *« eConcoursBF est une application mobile qui permettra aux candidats aux concours directs de la fonction publique de s'inscrire à partir de leur smartphone et tablette android »* — éditeur MFPTPS, **plus de 500 000 installations**, mise à jour du 2026-05-16 |

**Conclusion** : la déclaration `S2` est **confirmée**, grade `N1`, par l'observation du dispositif lui-même. Le seuil `L1-c` n'est pas réalisé.

---

## 5. Le fait majeur du lot — l'État a lui-même construit une consultation individuelle

Le ministère chargé de l'enseignement de base a mis en service en 2026 une plateforme de consultation individuelle des résultats d'examen.

| Élément | Constat | Source |
| --- | --- | --- |
| Annonce | *« Le MEBAPLN innove avec la mise en place d'une plateforme numérique dédiée à la consultation des résultats du Certificat d'Études Primaires (CEP), session 2026 »* — 2026-06-13 | Site du ministère ; leFaso.net ; Agence de presse africaine |
| Mode d'accès | *« Pour consulter son résultat, le candidat devra simplement renseigner son numéro de PV, sa date de naissance ainsi que la session concernée »* | Idem |
| Motif affiché | *« un accès rapide, sécurisé et simplifié aux résultats du CEP, depuis un téléphone portable, une tablette ou un ordinateur »* ; *« renforcer la transparence, la disponibilité de l'information et la qualité du service public éducatif »* | Idem |
| Extension | Entrée en sixième 2026, par numéro de table et date de naissance — 2026-07-22 | Site du ministère |
| Fonctions, d'après le code public | Titre applicatif *SIGEC-CEP*. Sessions 2023 à 2026 consultables. Affichage de la décision — admis, ajourné, absent —, de la mention, du jury, du centre ; impression du résultat ; statistiques nationales, régionales et provinciales. Message d'échec : *« Aucun résultat trouvé pour ces informations. Vérifiez le numéro PV et la date de naissance. »* | `resultats.examens.gov.bf` |
| Ce qui n'y figure pas | Ni brevet, ni baccalauréat, ni concours ; aucun canal par message SMS ou code USSD | Idem |

**Ce que ce fait établit** : une autorité publique burkinabè a jugé l'accès individuel aux résultats assez utile pour le construire, le mettre en service et le promouvoir comme une innovation de service public. Pour cette autorité et pour cette procédure, la place est prise **par l'autorité elle-même**.

**Ce qu'il n'établit pas** : la fréquentation de la plateforme, sa tenue lors des pics de publication, et la satisfaction des familles.

---

## 6. Acteurs privés — seuil `L1-d`

| Application | Objet | Installations publiées | Portée |
| --- | --- | --- | --- |
| *Réussir mon ConcoursBF* | Préparation aux concours de la fonction publique | 100 000 et plus | **Ne couvre pas le besoin** : aucun résultat |
| *Resultats Concours – Examens* | Agrégateur de résultats, national et international, sans pays déclaré | 5 000 et plus | Sous le seuil |
| *Résultat Bac 2025* | Baccalauréat français, avec avertissement de non-affiliation | 5 000 et plus | Hors territoire |
| Site `resultats-en-ligne.com` | Page d'information sur le baccalauréat burkinabè, sans formulaire de recherche : *« Les résultats officiels sont publiés par les autorités éducatives de chaque pays »* | — | Ne couvre pas le besoin |

Aucun acteur privé ne couvre le besoin au Burkina Faso avec plus de 10 000 installations. **Le seuil `L1-d` n'est pas réalisé.** Des sites d'information republient des listes de candidatures — publication du 2026-06-28 sur un site éducatif, par exemple — sans consultation individuelle ; ils relèvent du code `D` du lot `L3`, non du présent lot.

---

## 7. Cimetière — seuil `L1-e`

**Aucun dispositif arrêté n'a été trouvé** : ni service de résultats par message SMS documenté puis abandonné, ni application retirée, ni site disparu identifiable. Deux adresses institutionnelles ne répondaient pas le 2026-09-10 — `officedubac.bf` et `ciospb.bf` — ; la seconde a été remplacée par `ciospb.gov.bf`, qui répond. Une absence de réponse n'est pas un arrêt documenté.

**Le seuil `L1-e` n'est pas réalisé.** Réserve de méthode : un relevé documentaire est aveugle aux dispositifs qui n'ont laissé ni publication ni fiche d'application.

---

## 8. Comparables hors du Burkina Faso

Analogies, grade `N1`, **qui n'entrent dans aucun seuil**. Elles sont versées au socle des lots `L6` et `L7`.

| Pays | Dispositif | Constat |
| --- | --- | --- |
| Côte d'Ivoire | Résultats des concours administratifs 2026 du ministère de la Fonction publique, `ciconcours.net/result-mfpdc-2026` | *« Veuillez entrer votre numéro d'inscription. Pour le numéro d'inscription, voir votre convocation »* — conçu et exploité par un prestataire privé, SONEC AFRICA |
| Côte d'Ivoire | Résultats du brevet d'études du premier cycle 2026, `men-deco.org` | Consultation par numéro matricule, selon la presse |
| République du Congo | Application *digiDEC*, résultats du baccalauréat, du brevet et du certificat d'études | Plus de 500 000 installations, selon sa fiche de publication |

---

## 9. Application des seuils pré-enregistrés

| Seuil | Constat | Réalisé | Conséquence pré-écrite appliquée |
| --- | --- | --- | --- |
| `L1-a` — six catégories servies | Aucune catégorie n'est entièrement servie | **Non** | — |
| `L1-b` — une catégorie servie sort du périmètre | Deux éléments sont servis : le certificat d'études primaires ; l'orientation post-baccalauréat | **Oui, pour ces deux éléments** | Ils sortent du périmètre des vagues suivantes |
| `L1-c` — `e-concours` offre la consultation du résultat | Non — point 4 | **Non** | La déclaration `S2` est confirmée |
| `L1-d` — acteur privé de plus de 10 000 installations | Aucun | **Non** | — |
| `L1-e` — deux dispositifs arrêtés faute d'usage | Aucun dispositif arrêté documenté | **Non** | — |

**Périmètre transmis aux lots `L2` et `L3`** — éléments non servis : concours directs de la fonction publique ; concours professionnels ; brevet d'études du premier cycle ; baccalauréat ; bourses nationales ; concours des forces de défense et de sécurité ; résultats universitaires.

---

## 10. Comptage des infirmations

L'hypothèse testée par le lot est la condition de fausseté 2 prise à l'envers : *il n'existe pas de moyen individuel d'accès*.

**Deux infirmations** dans le périmètre pré-enregistré : le certificat d'études primaires et l'orientation post-baccalauréat, tous deux servis par un dispositif officiel. Une troisième, l'entrée en sixième, est hors périmètre et n'est pas comptée. Le lot n'est donc pas un lot sans infirmation.

---

## 11. Observations utiles aux autres lots

Consignées sans conclusion ; chacune relève du lot indiqué.

| Observation | Lot concerné |
| --- | --- |
| La foire aux questions d'`e-concours` prévoit le cas du *« candidat ayant un récépissé et dont le nom ne figure pas sur la liste »* : il doit *« prendre attache avec l'AGRE à Ouagadougou ou les directions régionales de la Fonction publique en régions »*. Elle prévoit aussi que *« la plateforme devient inaccessible à certains moments »* | `L3` — trace d'une difficulté ; `L8` — coût porté par la personne et par l'émetteur |
| Les résultats d'affectation et de permutation des personnels de l'enseignement de base 2026 sont publiés en fichiers PDF, dont l'un de **18 Mo**, sur un espace de stockage en ligne et une chaîne de messagerie, et affichés à la direction des ressources humaines | Hors catégories pré-enregistrées. Indice pour `L2`, non compté |
| Les fichiers de résultats de bourses portent des noms du type `…_compressed_compressed.pdf` | `L2` — la taille des fichiers est un sujet pour l'émetteur lui-même |
| L'application d'inscription aux concours dépasse **500 000 installations** | `L8` et cadrage — ordre de grandeur de la population équipée |
| Volumes 2026 : **213 437 présents** au premier tour du brevet, selon l'Agence d'information du Burkina ; **105 984 candidats** au baccalauréat, selon leFaso.net citant le ministère | `L2` — constat `C2` |
| La plateforme officielle identifie le candidat par **un numéro et sa date de naissance** : c'est le principe de l'identifiant jamais seul du point 6 du document fondateur, appliqué par l'État | Architecture, après le cadrage |
| Une autorité a construit elle-même, en une session, la consultation individuelle d'une procédure | `L6-a` pour cette autorité ; **`L7`, test de reproductibilité** |

---

## 12. Ce que ce relevé ne dit pas

Il ne dit pas que les éléments non servis présentent un coût d'accès : c'est l'objet de `L2` et de `L3`. Il ne dit pas que la plateforme officielle du certificat d'études fonctionne bien, ni qu'elle est utilisée. Il ne tranche aucune catégorie de premier marché, et il n'anticipe pas la note du jalon 1, qui seule applique la table du point 5.1 du programme.

---

## Sources — consultées le 2026-09-10

**Plateformes examinées directement**
- [`e-concours`](https://www.econcours.gov.bf/) — code public `main.1c75744fd2d0c4d2.js` ; foire aux questions, interface publique `econcours/api/faq/faqAll`
- [`e-concours-pro`](https://www.econcours-pro.gov.bf/) — code public `main.4f9dd9f6e2946a2c.js`
- [`resultats.examens.gov.bf`](https://www.resultats.examens.gov.bf/) — code public `main-P2IDG2Y3.js`
- [`campusfaso.bf`](https://www.campusfaso.bf/) — page d'accueil
- [`ciospb.gov.bf` — résultats de bourses](https://www.ciospb.gov.bf/bourses/resultats-de-bourses)
- [Portail de l'AGRE, `concours.gov.bf`](https://www.concours.gov.bf)

**Publications officielles et presse**
- [Ministère chargé de l'enseignement de base — résultats du CEP 2026 en ligne, 2026-06-13](https://www.education.gov.bf/informations/actualites/articles?tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=News&tx_news_pi1%5Bnews%5D=1367&cHash=f34a481279dc81c22134fddb28d17318)
- [Idem — résultats de l'entrée en sixième 2026 en ligne, 2026-07-22](https://www.education.gov.bf/informations/actualites/articles?tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=News&tx_news_pi1%5Bnews%5D=1391&cHash=8700204e2fd46e9e4a21fb4116243e60)
- [Idem — affectations 2026, 2026-08-14](https://www.education.gov.bf/informations/actualites/articles?tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=News&tx_news_pi1%5Bnews%5D=1406&cHash=8356513f67edf984af936f40bb8365b5)
- [leFaso.net — les résultats du CEP 2026 publiés sur la plateforme](https://lefaso.net/spip.php?article147117=)
- [Agence de presse africaine — résultats du CEP 2026 en ligne](https://fr.apanews.net/technologies/burkina-les-resultats-du-cep-2026-desormais-consultables-en-ligne/)
- [leFaso.net — baccalauréat 2026, 2026-07-05](https://lefaso.net/spip.php?article147604=)
- [Agence d'information du Burkina — résultats provisoires du BEPC 2026](https://www.aib.media/les-resultats-provisoires-du-premier-tour-du-brevet-detudes-du-premier-cycle-bepc-session-2026-font-etat-de-88-601-candidats-admis-sur-213-437-presents-soit-un-taux-national-de-reussite/)
- [YOP L-FRII — résultats d'admission de 15 concours professionnels 2026](https://yop.l-frii.com/formations/burkina-faso-resultats-dadmission-de-15-concours-professionnels-session-2026/)
- [Gendarmerie nationale — communiqué de résultats d'admissibilité 2025](https://gendarmerienationale.bf/communique-resultats-dadmissibilite-concours-eso-session2025/)

**Fiches d'applications**
- [eConcoursBF](https://play.google.com/store/apps/details?id=bf.mfptps.econcoursbf) · [Réussir mon ConcoursBF](https://play.google.com/store/apps/details?id=com.ismo24.ReConcoursBF) · [Resultats Concours – Examens](https://play.google.com/store/apps/details?id=com.resultats.resultatexpress) · [digiDEC](https://play.google.com/store/apps/details?id=com.krmservices.digidec.mepsa)

**Comparables et énoncés écartés**
- [Côte d'Ivoire — résultats des concours administratifs 2026](https://ciconcours.net/result-mfpdc-2026) · [Agence ivoirienne de presse — concours de l'AFA de Zambakro](https://www.aip.ci/329502/cote-divoire-aip-le-ministere-de-la-defense-ouvre-le-concours-dentree-a-lafa-de-zambakro-pour-la-session-2026/) · [Nouvelle Afrique — BEPC 2026 en Côte d'Ivoire](https://www.nouvelle-afrique.net/BEPC-2026-comment-consulter-les-resultats-et-retirer-son-attestation-de-reussite_a1590.html)
- [Orange Burkina — service DIET SMS](https://www.orange.bf/fr/services/education-developpement/diet-sms.html)
