# Analyse de Conception - Vol. 4 : Résolutions de la Conception Conjointe
**Projet :** MaSecure — Infrastructure de Règlement Social Automatisé
**Auteur :** Antigravity AI
**Date :** Juin 2026

---

## 1. Synthèse des Résolutions Validées

Ce document compile les arbitrages fonctionnels et techniques arrêtés d'un commun accord lors de notre phase d'alignement. Ces résolutions annulent et remplacent les interrogations précédentes, figeant les spécifications métier de la plateforme pour la Phase 3 (Gouvernance) et la Phase 4 (Résilience).

---

## 2. Tableau Récapitulatif des Décisions Métier

| Axe de Conception | Problématique Initiale | Règle Métier Validée | Impact d'Implémentation |
| :--- | :--- | :--- | :--- |
| **Financement du Fonds** | Le pré-financement total peut pénaliser les revenus modestes. | Optionnel. Si activé, finançable d'un coup OU en tranches (progressif). Doit être complet avant le versement n°1. | Notification d'alerte et blocage du premier payout si le fonds est incomplet à la clôture du premier cycle. |
| **Décès du Membre (Débiteur)** | Comment épurer la dette d'un membre décédé ayant déjà reçu le pot ? | Succession par un proche possible. Sinon, le fonds de recouvrement éponge la perte (limite de 1 à 3 échéances). | Inscription de la perte dans le ledger comme `advance_issued` avec motif "décès_membre". |
| **Décès du Membre (Créditeur)** | Restituer l'épargne d'un membre décédé sans rompre le cycle. | Succession par un proche possible. Sinon, payout anticipé immédiat du cumul de ses cotisations passées + exclusion. | Recalage automatique en cascade des tours du cycle courant. |
| **Droit de vote & Suspension** | Risque de sabotage des votes par des membres en défaut. | Exclusion totale des membres en statut `SUSPENDU` ou `QUARANTINE` de tout vote influençant la finance. | Filtrage des votants éligibles au niveau du `Vote Engine` (RBAC strict). |
| **Frais Mobile Money** | La déduction des frais de transfert altère le montant attendu. | Si fonds actif : frais payés par le fonds commun. Si fonds inactif : frais déduits de la cagnotte reçue par le membre. | Ajout du coût de payout dans le calcul du transfert vers l'opérateur MM en fonction de la config groupe. |
| **Workflow de Retard** | Flou sur l'enchaînement des statuts et pénalités. | Retard $\rightarrow$ comblé par fonds. Cycle suivant non payé $\rightarrow$ `QUARANTINE` (délai < 1 sem) $\rightarrow$ `SUSPENDU` $\rightarrow$ `EXCLUSION` (à 3 défauts). | Automate d'état piloté par le Kernel avec application de pénalités définies à la réintégration. |

---

## 3. Workflow Précis des Défauts et de la Réintégration

Le diagramme d'états ci-dessous fige la logique de transition appliquée par le système lors d'un retard de paiement :

```
[ACTIF]
   │
   ▼ (Échéance non honorée)
[Fonds de recouvrement utilisé pour payer le bénéficiaire à temps]
   │
   ▼ (Ouverture du cycle suivant)
[Vérification du remboursement de l'avance du fonds]
   ├── Oui ──> [Retour à l'état ACTIF]
   └── Non ──> [Statut = QUARANTINE] (Délai de grâce ouvert)
                 │
                 ├── Régularisé sous le délai ──> [Retour à l'état ACTIF]
                 └── Non régularisé ──> [Statut = SUSPENDU]
                                          │
                                          ├─> 1. Perte du droit de vote
                                          ├─> 2. Payer : Avance + Pénalité + Cotisations cumulées
                                          │
                                          ▼ (3 cycles consécutifs sans régularisation)
                                      [EXCLUSION DÉFINITIVE]
```

---

## 4. Conclusion
Ces résolutions fournissent au projet MaSecure un modèle d'automate d'états et de flux de trésorerie d'une rigueur absolue. L'architecture logicielle peut désormais être développée en toute sécurité en traduisant ces règles en tests d'intégration et en contraintes de base de données.
