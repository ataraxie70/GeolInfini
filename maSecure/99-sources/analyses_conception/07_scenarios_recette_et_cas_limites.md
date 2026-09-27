# Analyse de Conception - Vol. 7 : Scénarios de Recette & Cas Limites
**Projet :** MaSecure — Infrastructure de Règlement Social Automatisé
**Auteur :** Antigravity AI
**Date :** Juin 2026

---

## 1. Introduction
Ce volume formalise les parcours de test de bout en bout pour guider l'implémentation de la Phase 4 (recette et validation). Ces scénarios testent les cas limites financiers les plus risqués.

---

## 2. Fiches de Scénarios Métier

### Scénario A : Financement Progressif Incomplet avant le Premier Payout
* **Description :** Un groupe choisit le financement progressif de son fonds de recouvrement sur 4 versements. À la clôture du premier cycle, le fonds n'est pas rempli à 100%.
* **Déroulement :**
  1. Le cycle 1 se termine. Tous les membres ont payé leur cotisation standard, mais certains n'ont pas versé leur quote-part progressive du fonds de recouvrement.
  2. Le `Tontine Engine` initie l'évaluation de paiement du bénéficiaire n°1.
  3. Le système vérifie la règle d'intégrité : `fonds_montant_actuel_minor < fonds_montant_cible_minor` alors que `cycle_number = 1`.
  4. **Résultat Attendu :** Le trigger SQL bloque la mise à jour à `payout_state = 'pending'`. Le paiement n'est pas envoyé vers la banque. Le système envoie une notification d'urgence sur WhatsApp à tout le groupe : « Le premier versement est gelé car le fonds de recouvrement n'est pas entièrement constitué. »

---

### Scénario B : Décès d'un Membre Débiteur (Ayant déjà reçu la cagnotte)
* **Description :** Marie a reçu le pot de 200 000 FCFA lors du cycle 2. Elle décède au cycle 4.
* **Déroulement :**
  1. Les membres du groupe déclarent le décès via `POST /v1/groups/:id/members/:id/disaster`.
  2. Le système vérifie la table `members` pour trouver son `successor_identity_id`.
  3. **Cas B1 (Successeur présent) :** 
     * Son fils Jean (le successeur désigné) accepte le transfert.
     * Le système transfère l'identité du membre à Jean. Jean continue de cotiser à partir du cycle 4.
  4. **Cas B2 (Aucun successeur) :**
     * Le fonds de recouvrement intervient à chaque échéance suivante pour injecter la part manquante (Marie étant définitivement incapable de payer).
     * Si la tontine se poursuit sur 5 cycles supplémentaires et que le fonds ne couvrait que 2 cycles, la tontine s'arrête (ou est suspendue) dès que le fonds est épuisé, nécessitant un vote d'ajustement.

---

### Scénario C : Décès d'un Membre Créditeur (N'ayant pas encore reçu la cagnotte)
* **Description :** Moussa cotise 10 000 FCFA par semaine. Il décède à la semaine 5 sans avoir encore bénéficié du pot. Aucun successeur n'est disponible.
* **Déroulement :**
  1. Le décès est signalé et validé par le système.
  2. Le `Tontine Engine` constate que Moussa n'a reçu aucun versement et a accumulé 50 000 FCFA de cotisations passées.
  3. Le système exclut immédiatement Moussa du groupe pour bloquer les cotisations futures.
  4. **Résultat Attendu :** Le système ordonne un versement automatique anticipé de **50 000 FCFA** vers le compte de Moussa (la famille récupère l'argent). L'ordre des tours restants du cycle est recalculé en décalant tous les bénéficiaires suivants d'une place vers le haut.

---

### Scénario D : Expiration de la Quarantaine et Transition en Suspension
* **Description :** Adama manque sa cotisation au cycle 1. Le fonds de recouvrement comble le manque.
* **Déroulement :**
  1. Au cycle 2, Adama est marqué au statut `QUARANTINE`.
  2. Le système lui donne un délai de grâce de 5 jours (cycle hebdomadaire) pour rembourser l'avance du fonds. Le jour 6 arrive sans remboursement.
  3. **Transition Automatique :** Le système bascule Adama au statut `SUSPENDED`. Ses droits de vote sont immédiatement gelés.
  4. Au cycle 3, Adama veut régulariser sa situation.
  5. **Résultat Attendu :** Le système exige le paiement de :
     * 10 000 FCFA (remboursement de l'avance du cycle 1) ;
     * 5 000 FCFA (pénalité de retard paramétrée à la création) ;
     * 10 000 FCFA (cotisation due pour le cycle 2) ;
     * 10 000 FCFA (cotisation due pour le cycle 3 en cours).
     * Total exigé : 35 000 FCFA. Tant que la transaction globale de 35 000 FCFA n'est pas validée, il reste `SUSPENDED`.

---

### Scénario E : Mode de Déduction des Frais Mobile Money
* **Description :** Le groupe doit verser une cagnotte de 200 000 FCFA. Les frais de transfert de l'opérateur s'élèvent à 2 000 FCFA (1%).
* **Déroulement :**
  1. **Option E1 (Avec fonds de recouvrement actif) :**
     * Le `Tontine Engine` ordonne à la banque d'envoyer 200 000 FCFA nets au bénéficiaire.
     * Les 2 000 FCFA de frais sont prélevés directement sur la table `group_configs.fonds_montant_actuel_minor`. Le bénéficiaire reçoit **200 000 FCFA**.
  2. **Option E2 (Sans fonds de recouvrement ou inactif) :**
     * Le `Tontine Engine` déduit les frais de la cagnotte.
     * Le versement émis est de 198 000 FCFA. Le bénéficiaire reçoit **198 000 FCFA**.
