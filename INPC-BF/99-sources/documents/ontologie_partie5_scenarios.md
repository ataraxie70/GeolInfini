Ontologie du Patrimoine Culturel Vivant du Burkina Faso

Partie V — Scénarios de modélisation

Infrastructure Numérique du Patrimoine Culturel Vivant du Burkina Faso (INPC-BF)

Version 0.1 — Document fondateur, neuvième pièce de la série

---

Préambule de cette partie

Les quatre parties précédentes ont construit une théorie : vingt-deux entités, vingt-huit relations, des cardinalités, des contraintes, des héritages, des exceptions. Une théorie qui n'a jamais été confrontée à des cas réels reste une hypothèse. Cette Partie V soumet la théorie à sept situations concrètes, choisies pour solliciter chacune un mécanisme différent de l'ontologie, et vérifie qu'elle tient.

Un scénario qui révèle un manque n'est pas un échec de cette partie : c'est exactement ce qu'elle est faite pour produire. Le premier scénario en apporte immédiatement la preuve.

---

1. Comment lire cette partie

Chaque scénario suit la même structure : le contexte, tel qu'il se présenterait dans la réalité du patrimoine burkinabè ; la modélisation, qui applique pas à pas les entités et relations concernées ; la vérification, qui confronte cette modélisation aux règles de la Partie IV ; et l'enseignement, qui indique si le scénario confirme la théorie ou en révèle une limite.

---

2. Scénario 1 — Le masque conservé dans un musée national

**Contexte.** Un masque rituel, utilisé historiquement par une communauté déterminée dans le cadre d'une tradition de danse cérémonielle, est aujourd'hui conservé dans un musée national. Le musée en assure la garde, sans être lui-même l'auteur de la tradition qu'il incarne.

**Modélisation.** Le masque est un Objet, relié par « incarne » à la Tradition qu'il représente. Cette Tradition est reliée par « appartient à » à la Communauté d'origine, qui en conserve l'autorité coutumière. Le musée est une Institution, reliée à l'Objet par « est détenu par ».

**Vérification.** La cardinalité de « est détenu par » (0..1 détenteur actuel par objet) autorise exactement ce cas : un seul détenteur matériel à la fois, distinct de la ou des communautés auxquelles le patrimoine incarné appartient. Le déplacement futur du masque vers un autre lieu de garde ne modifiera que la relation « est détenu par » ; il ne modifiera jamais l'« appartient à » qui relie la tradition à sa communauté d'origine.

**Enseignement.** Ce scénario est celui qui a révélé, avant même d'être rédigé, l'absence de la relation « est détenu par » dans la version précédente de la Partie III. Cette absence signifiait qu'un objet en garde institutionnelle n'aurait pu être distingué, dans le système, d'un objet resté dans sa communauté d'origine — une perte d'information significative pour tout patrimoine matériel appelé à circuler entre communautés, musées et collections. La relation a été ajoutée en conséquence, et les Parties III et IV mises à jour avant l'écriture de ce scénario.

---

3. Scénario 2 — L'intronisation d'un chef coutumier

**Contexte.** Un royaume procède à l'intronisation de son nouveau chef, selon un rite précis, dans son palais, à une date déterminée.

**Modélisation.** Le Royaume est une Institution. Le Rite d'intronisation est une Tradition spécialisée, reliée par « appartient à » au Royaume, ou selon les cas à la Communauté que ce royaume représente. La cérémonie elle-même est un Événement, relié par « met en œuvre » au Rite, et par « se déroule à » au Lieu que constitue le palais. La personne intronisée et les officiants sont des Personnes, reliées par « représente » au Royaume ou à la Communauté lorsqu'ils y exercent une fonction reconnue.

**Vérification.** La distinction posée en Partie II 3.2 et 3.3 entre Communauté et Institution s'applique ici avec netteté : le royaume comme organisation structurée est une Institution, le peuple qui s'y reconnaît est une Communauté, et les deux peuvent coexister sans se confondre pour cette même tradition, conformément à la propriété essentielle du Rite héritée de la Tradition, établie en Partie IV 5.

**Enseignement.** Ce scénario confirme que la distinction Communauté/Institution, qui aurait pu sembler théorique en Partie II, correspond à un besoin réel dès qu'on modélise une chefferie ou un royaume : les deux entités sont nécessaires simultanément, et aucune des deux ne peut se substituer à l'autre.

---

4. Scénario 3 — Le proverbe partagé par deux peuples voisins

**Contexte.** Un même proverbe, dans une formulation très proche, est attesté chez deux peuples voisins, dont les territoires culturels se chevauchent sans coïncider avec les frontières administratives actuelles.

**Modélisation.** Le proverbe, en tant que patrimoine oral, est relié par « appartient à » aux deux Communautés concernées simultanément, conformément à la cardinalité « 1..n communautés par tradition » établie en Partie IV 3. Si les deux formulations présentent des différences de contenu, chacune est représentée comme une Version distincte de la Connaissance qui documente ce proverbe, sans qu'aucune ne prime sur l'autre.

**Vérification.** Conformément à la section 6.5 de la charte de gouvernance, une connaissance partagée par plusieurs communautés est examinée conjointement par les référents de chacune. Aucune règle de cette ontologie ne force à choisir une communauté d'origine unique.

**Enseignement.** Ce scénario confirme que la modélisation retenue depuis la Partie III pour les patrimoines transfrontaliers fonctionne sans ajustement. C'est un des cas où la théorie, construite par anticipation dès la charte de gouvernance, se vérifie sans reste.

---

5. Scénario 4 — Le rite initiatique réservé

**Contexte.** Une communauté souhaite faire documenter, à des fins de conservation exclusivement, un rite initiatique dont le contenu ne doit être accessible qu'aux personnes initiées.

**Modélisation.** Une Autorisation est enregistrée, émanant de l'autorité coutumière compétente, avec une portée limitée à la conservation, conformément à la section 3.3 de la charte de gouvernance. Le Niveau d'accès attribué à la Connaissance qui documente ce rite est fixé à « Restreint initiatique ou sacré ». Aucune Autorisation de portée « diffusion » n'existe pour cette connaissance.

**Vérification.** La contrainte de portée distincte pour la diffusion publique, posée en Partie IV 4, empêche mécaniquement que cette connaissance atteigne un jour le niveau d'accès « Public » sans qu'une nouvelle autorisation, explicite et distincte, ne soit accordée par cette même autorité coutumière.

**Enseignement.** Ce scénario confirme la solidité de la séparation entre validation et accès posée dès la Partie I. Ce rite peut recevoir, le moment venu, un avis de validation du collège de domaine compétent — confirmant, par exemple, l'authenticité de sa documentation — sans que cet avis n'ouvre le moindre accès public. Validation et diffusion restent deux actes strictement indépendants, exactement comme la théorie le prévoyait.

---

6. Scénario 5 — Deux récits divergents d'un même règne

**Contexte.** Deux détenteurs de savoir, issus de deux lignées différentes au sein d'un même royaume, transmettent des récits divergents sur les circonstances de l'accession au trône d'un roi ancien.

**Modélisation.** Les deux récits sont d'abord enregistrés comme deux Versions distinctes d'une même Connaissance, conformément au principe de coexistence posé en Partie I 3.3 : la divergence, à ce stade, n'est pas encore un désaccord mais une pluralité assumée. Si l'une des deux lignées conteste par la suite la légitimité du récit de l'autre — non pas seulement son contenu, mais son autorité à le transmettre —, une Contestation est créée, reliée par « vise » à la Version concernée.

**Vérification.** La distinction posée en Partie III 3, entre une variation assumée dès l'origine et un désaccord apparu après coup, permet de représenter avec exactitude le passage de l'un à l'autre sans devoir reclasser ni supprimer aucune des deux versions déjà enregistrées. Conformément à la section 7.1 de la charte de gouvernance, cette contestation relève du référent communautaire plutôt que du collège de domaine, puisqu'elle porte sur la légitimité de la transmission et non sur l'exactitude documentaire.

**Enseignement.** Ce scénario confirme que la même situation réelle peut légitimement transiter d'un mécanisme à l'autre — de la Version à la Contestation — sans que cette transition n'exige de règle nouvelle. C'est la preuve que la distinction posée en Partie III entre ces deux relations n'était pas seulement théorique : elle correspond à une évolution réelle et fréquente dans la vie d'un patrimoine oral disputé.

---

7. Scénario 6 — Le témoignage déjà publié dans un ouvrage universitaire ancien

**Contexte.** Un ouvrage de recherche publié plusieurs décennies auparavant documente un témoignage recueilli auprès d'un détenteur de savoir aujourd'hui décédé, dont les ayants droit ne sont pas identifiés.

**Modélisation.** La Connaissance est intégrée avec, pour Source, une référence à l'ouvrage. Conformément à l'exception posée en Partie IV 6.4, elle est admise sans autorisation complète du détenteur d'origine, à condition que ce statut d'origine incomplète soit documenté de façon transparente, par exemple dans le statut épistémique ou dans une note attachée à la Contribution.

**Vérification.** Cette connaissance ne peut recevoir aucun changement de Régime de propriété en faveur d'un tiers autre que ce détenteur d'origine, conformément à la dernière phrase de l'exception 6.4. Si des ayants droit venaient à être identifiés ultérieurement, conformément à la section 9.4 de la charte de gouvernance, ils pourraient alors exercer les droits qui leur reviennent, y compris une demande de retrait au sens de la Partie IV 1.

**Enseignement.** Ce scénario confirme qu'une exception strictement encadrée peut absorber un cas réel fréquent — le patrimoine documentaire ancien, antérieur au projet lui-même — sans qu'il soit nécessaire d'assouplir la règle générale de consentement pour tout le reste du système.

---

8. Scénario 7 — Le retrait d'accès demandé après diffusion publique

**Contexte.** Une connaissance publiée depuis plusieurs années avec un niveau d'accès « Public » fait l'objet d'une demande de restriction de la part de la communauté qui l'avait initialement autorisée, à la suite d'un changement de circonstances au sein de cette communauté.

**Modélisation.** Le Niveau d'accès de la Connaissance passe de « Public » à « Restreint communautaire », conformément à la section 5 de la charte de gouvernance. Ce changement est attribué à la Communauté demanderesse, motivé, et daté, conformément à la Partie II 6.6. L'historique conserve la trace du niveau d'accès antérieur et de la période durant laquelle il s'est appliqué.

**Vérification.** Aucune entité ni relation n'est supprimée : la Connaissance, ses Versions, ses avis de validation et son historique d'accès demeurent intégralement conservés, conformément au principe de non-suppression réaffirmé en Partie IV 2. Seule la consultation future change.

**Enseignement.** Ce scénario confirme que la tension identifiée dès l'audit initial du projet, entre non-suppression et droit de retrait, trouve une résolution opérationnelle complète à travers les mécanismes déjà construits, sans qu'aucun ajustement ne soit nécessaire à ce stade.

---

9. Bilan des scénarios

Sur les sept scénarios soumis à la théorie, six l'ont confirmée sans modification. Un seul — le premier — a révélé un manque réel, corrigé avant que ce document ne soit achevé plutôt que découvert après coup, une fois l'ontologie considérée comme stable.

Ce résultat n'établit pas que l'ontologie est désormais complète : sept scénarios ne couvrent pas l'ensemble des situations qu'un patrimoine aussi vaste que celui du Burkina Faso produira. Il établit seulement que la méthode choisie — construire, puis tester contre des cas réels avant de déclarer une partie stable — a fonctionné une première fois, et qu'elle doit continuer à s'appliquer à mesure que de nouveaux cas se présenteront, conformément au principe d'extensibilité posé en Partie I 3.8.

---

10. Suite du document

La Partie VI, dernière de cette série, fixera les modalités selon lesquelles cette ontologie pourra elle-même évoluer dans le temps sans se contredire — la procédure à suivre pour proposer une entité, une relation ou une règle nouvelle, et les conditions dans lesquelles une version future de ce document pourra succéder à celle-ci.
