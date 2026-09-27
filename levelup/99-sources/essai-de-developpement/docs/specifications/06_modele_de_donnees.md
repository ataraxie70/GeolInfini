# Modèle de données

## 1. Principes
Le schéma doit :
- normaliser les entités ;
- éviter la duplication ;
- tracer les changements ;
- permettre les révisions ;
- permettre la migration vers PostgreSQL.

## 2. Objets principaux
- users ;
- plans ;
- units ;
- subjects ;
- concepts ;
- prerequisites ;
- sessions ;
- validations ;
- revisions ;
- mistakes / errors ;
- resources ;
- recommendations ;
- audits ;
- settings.

## 3. Contraintes structurantes
- clés primaires stables ;
- relations explicites ;
- indices sur les chemins de lecture fréquents ;
- contraintes d’unicité sur les objets structurants ;
- horodatage systématique ;
- statut des objets versionné ou historisé lorsque nécessaire.

## 4. Exigences de stockage
- un stockage local simple en première version ;
- compatibilité avec un moteur relationnel plus robuste ;
- séparation entre données vivantes, historique et journal d’audit.

## 5. Conséquence technique
Le schéma doit servir à la fois :
- le moteur de progression ;
- le moteur de recommandation ;
- le moteur d’exécution de séance ;
- le moteur de feedback ;
- le tableau de bord ;
- l’administration du contenu.
