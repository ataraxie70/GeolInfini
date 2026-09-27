# 01 — Vision et périmètre

## 1. Finalité du projet

Sell Computing vise à transformer l’acte d’achat informatique en processus de décision assistée.  
La plateforme ne se limite pas à exposer des produits ; elle :

- identifie le besoin réel ;
- traduit ce besoin en critères techniques ;
- recommande des configurations adaptées ;
- compare les options ;
- accompagne l’achat ;
- prolonge la relation par les services techniques.

## 2. Problème résolu

Le marché informatique impose souvent :

- une terminologie technique opaque ;
- une surcharge de choix ;
- une faible lisibilité du rapport besoin / configuration ;
- une méfiance forte vis-à-vis du reconditionné ;
- une difficulté à relier achat matériel et maintenance.

La plateforme doit réduire ces frictions.

## 3. Proposition de valeur

| Axe | Valeur fournie |
|---|---|
| Conseil | Traduction du besoin en critères compréhensibles |
| Recommandation | Sélection explicable de produits adaptés |
| Comparaison | Différenciation lisible entre options |
| Confiance | Mise en avant de contrôles, garanties et états |
| Service | Demande de maintenance et d’accessoires |
| Éducation | Guides courts, utiles et accessibles |

## 4. Positionnement

Le positionnement est celui d’une plateforme de conseil et de vente à dominante pédagogique.

Le parcours prioritaire est :

```text
Besoin → Recommandation → Comparaison → Décision → Commande → Suivi
```

Le catalogue brut n’est pas le centre de gravité fonctionnel.

## 5. Périmètre fonctionnel initial

### Inclus

- recommandation d’ordinateurs ;
- catalogue de produits ;
- comparaison de produits ;
- filtrage avancé ;
- fiches produits détaillées ;
- gestion du reconditionné ;
- demande d’accessoires non affichés ;
- demande de maintenance ;
- contenus de conseil ;
- administration du catalogue et du contenu ;
- authentification et rôles ;
- suivi des commandes si la vente est active dans le MVP.

### Exclu au départ

- marketplace multi-vendeurs ;
- enchères ;
- chat temps réel complexe ;
- intelligence artificielle générative embarquée dans la décision ;
- application mobile native ;
- automatisation logistique avancée ;
- personnalisation temps réel par tracking comportemental lourd.

## 6. Invariants du système

1. Toute recommandation doit être explicable.  
2. Toute fiche produit doit afficher les éléments de confiance essentiels.  
3. Toute action sensible doit être auditée.  
4. Toute donnée de référence doit avoir un propriétaire métier clair.  
5. Toute suppression logique doit conserver la traçabilité.  
6. Tout contenu public doit être administrable.  

## 7. Hypothèses de départ

- opérateur unique ou équipe centrale ;
- base produit initiale limitée mais propre ;
- priorité au web ;
- monorepo cohérent ;
- architecture modulaire ;
- données relationnelles comme source principale de vérité.

## 8. Critère de succès

Le projet est cohérent si un utilisateur non expert peut :

- exprimer un besoin ;
- recevoir une recommandation lisible ;
- comprendre la justification ;
- comparer sans ambiguïté ;
- acheter ou demander assistance avec confiance.
