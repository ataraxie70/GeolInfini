# D4 — RÉSEAUX ET TÉLÉCOMS (CCNA)
## Roadmap de maîtrise — Commutation → Routage → Sécurité & Administration réseau

> **Domaine d'appui et spécialisation.** S'appuie sur D2 (Administration système) et s'associe à D3 (DevOps).
> Ce parcours prépare aux compétences exigées par la certification CCNA et au-delà pour les infrastructures télécoms.

---

## Table des matières

1. [Fondations des réseaux & Modèle OSI](#1-fondations-des-réseaux--modèle-osi)
2. [Liaison de données & Commutation Ethernet](#2-liaison-de-données--commutation-ethernet)
3. [Adressage IP & Protocoles de la couche réseau](#3-adressage-ip--protocoles-de-la-couche-réseau)
4. [Routage IP, VLANs & Inter-VLAN](#4-routage-ip-vlans--inter-vlan)
5. [Sécurité réseau, Services & WAN](#5-sécurité-réseau-services--wan)
6. [Automatisation, SDN & Diagnostic avancé](#6-automatisation-sdn--diagnostic-avancé)

---

## 1. Fondations des réseaux & Modèle OSI

### Prérequis
- Aucun (point d'entrée pour la spécialisation réseau)

### 1.1 Modèles de référence OSI et TCP/IP
**Grands points :**
- Les 7 couches du modèle OSI (Physique, Liaison, Réseau, Transport, Session, Présentation, Application)
- Les 4 couches du modèle TCP/IP et correspondance avec OSI
- Processus d'encapsulation et de décapsulation des données (Data, Segment, Paquet, Trame, Bit)
- Rôle des en-têtes (headers) à chaque couche
- Protocoles associés à chaque couche (HTTP, TCP, UDP, IP, Ethernet)

**Critères de maîtrise N4 :**
- [ ] Décrire le parcours complet d'une requête HTTP depuis le clic sur un lien jusqu'au média physique
- [ ] Identifier la couche OSI responsable d'un problème donné (ex: erreur de checksum TCP vs câble débranché)
- [ ] Expliquer la différence d'encapsulation entre TCP (orienté connexion) et UDP (non connecté)

---

### 1.2 Média physique et Câblage
**Grands points :**
- Câbles en cuivre (paires torsadées UTP/STP, catégories Cat5e/Cat6/Cat6a)
- Connecteurs RJ-45, normes de câblage T568A et T568B (câbles droits vs croisés)
- Fibres optiques : Monomode (SMF) vs Multimode (MMF), caractéristiques et distances
- Atténuation, interférences électromagnétiques (EMI), bruit
- Équipements de couche 1 : répéteurs, hubs (concentrateurs)

**Critères de maîtrise N4 :**
- [ ] Choisir le type de fibre ou cuivre approprié pour interconnecter deux bâtiments distants de 2 km
- [ ] Diagnostiquer un problème de couche physique (bruit, collisions tardives) à l'aide des compteurs d'interface
- [ ] Expliquer la différence de propagation de la lumière entre fibre monomode et multimode

---

## 2. Liaison de données & Commutation Ethernet

### Prérequis
- Section 1 (Modèle OSI)

### 2.1 Commutation Ethernet et Adresses MAC
**Grands points :**
- Trame Ethernet II : structure (Préambule, MAC Destination, MAC Source, Type, Données, FCS)
- Rôle et structure d'une adresse MAC (48 bits, OUI, identifiant unique)
- Fonctionnement d'un commutateur (Switch) : apprentissage, inondation (flooding), transfert (forwarding), filtrage
- Table d'adresses MAC (CAM table) et son cycle de vie (aging time)
- Concepts de domaine de collision (micro-segmentation) et de domaine de diffusion (broadcast domain)

**Critères de maîtrise N4 :**
- [ ] Expliquer comment un switch remplit et met à jour sa table CAM lors de la réception d'une trame inconnue
- [ ] Configurer le vieillissement (aging time) et la sécurité des ports (Port Security) sur un switch Cisco ou générique
- [ ] Résoudre un incident lié à la saturation de la table MAC (MAC address flooding attack)

---

### 2.2 VLANs et Liaisons Trunk
**Grands points :**
- Concept de VLAN (Virtual LAN) pour diviser les domaines de diffusion
- Configuration de VLANs d'accès (Access ports)
- Liaisons Trunk pour transporter plusieurs VLANs sur un seul lien physique
- Protocole d'encapsulation IEEE 802.1Q (VLAN Tagging, Native VLAN)
- DTP (Dynamic Trunking Protocol) et VTP (VLAN Trunking Protocol) : fonctionnement et risques de sécurité

**Critères de maîtrise N4 :**
- [ ] Configurer un commutateur avec 3 VLANs distincts et une liaison Trunk vers un autre commutateur
- [ ] Expliquer l'importance du concept de VLAN natif et les risques liés au double marquage (VLAN hopping)
- [ ] Diagnostiquer un défaut de concordance de VLAN natif (Native VLAN mismatch) à partir des logs de switch

---

## 3. Adressage IP & Protocoles de la couche réseau

### Prérequis
- Modèle OSI (couche 3)

### 3.1 Adressage IPv4 et Sous-réseaux (VLSM)
**Grands points :**
- Structure d'une adresse IPv4 (32 bits, notation décimale pointée)
- Classes d'adresses historiques (A, B, C, D, E) et adresses privées (RFC 1918)
- Masque de sous-réseau et calcul de l'adresse réseau, adresse de broadcast, et plage d'hôtes valides
- CIDR (Classless Inter-Domain Routing) et VLSM (Variable Length Subnet Masking)
- Découpage réseau : maximiser l'efficacité de l'adressage en fonction des besoins réels en hôtes

**Critères de maîtrise N4 :**
- [ ] Diviser le bloc `192.168.1.0/24` pour fournir des sous-réseaux de 100, 50, 25 et 2 hôtes avec le moins de perte possible
- [ ] Identifier instantanément si deux hôtes avec des masques différents peuvent communiquer sans routeur
- [ ] Calculer des routes agrégées (supernetting/summarization) pour optimiser les tables de routage

---

### 3.2 Adressage IPv6
**Grands points :**
- Structure d'une adresse IPv6 (128 bits, notation hexadécimale, règles de compression)
- Types d'adresses IPv6 : Global Unicast (GUA), Link-Local (LLA), Unique Local (ULA), Multicast, Loopback
- Mécanismes d'attribution d'adresses : Statique, SLAAC (Stateless Address Autoconfiguration), EUI-64
- DHCPv6 avec état (stateful) vs sans état (stateless)
- Protocole NDP (Neighbor Discovery Protocol) : RS, RA, NS, NA (remplaçant ARP en IPv6)

**Critères de maîtrise N4 :**
- [ ] Configurer des adresses IPv6 Link-Local et Global Unicast sur un routeur et vérifier la connectivité
- [ ] Calculer l'identifiant d'interface IPv6 d'une carte réseau à partir de son adresse MAC en utilisant la méthode EUI-64
- [ ] Expliquer la différence fonctionnelle entre NDP et ARP

---

### 3.3 Protocoles de support (ARP, ICMP, DHCP, DNS)
**Grands points :**
- Protocole ARP (Address Resolution Protocol) : requêtes, réponses, cache ARP, ARP gratuit
- ICMP (Internet Control Message Protocol) : messages Echo, Destination Unreachable, Time Exceeded (TTL)
- DHCP (Dynamic Host Configuration Protocol) : processus DORA (Discover, Offer, Request, Acknowledge), relais DHCP (ip helper-address)
- DNS (Domain Name System) : requêtes récursives/itération, serveurs racines, résolveurs, enregistrements A, AAAA, CNAME, MX

**Critères de maîtrise N4 :**
- [ ] Analyser une capture de paquets Wireshark et identifier les étapes DORA d'une attribution DHCP
- [ ] Configurer un agent de relais DHCP (DHCP Relay) sur un routeur pour servir des clients situés dans un autre VLAN
- [ ] Diagnostiquer un problème de résolution DNS en utilisant les outils de terminal `nslookup` et `dig`

---

## 4. Routage IP, VLANs & Inter-VLAN

### Prérequis
- Adressage IP (Section 3)

### 4.1 Concepts de Routage & Routage Statique
**Grands points :**
- Fonctionnement d'un routeur : table de routage, processus de décision du chemin (longest prefix match, métrique, distance administrative)
- Configuration de routes statiques (IPv4 et IPv6)
- Route statique par défaut (Gateway of last resort)
- Route statique flottante (Floating static route pour la redondance)
- Routage inter-VLAN : Router-on-a-Stick (sous-interfaces 802.1Q) vs Switch multicouche (SVI - Switch Virtual Interface)

**Critères de maîtrise N4 :**
- [ ] Configurer une architecture inter-VLAN complète en mode Router-on-a-Stick et valider le ping entre VLANs
- [ ] Configurer une route statique de secours (floating route) qui s'active uniquement lorsque le lien principal tombe
- [ ] Expliquer comment la distance administrative influence le choix de la route active dans la table de routage

---

### 4.2 Routage Dynamique avec OSPF
**Grands points :**
- Protocoles de routage à vecteur de distance (RIP, EIGRP) vs état de lien (OSPF, IS-IS)
- OSPFv2 (IPv4) et OSPFv3 (IPv6) : principes fondamentaux
- Algorithme de Dijkstra (Shortest Path First - SPF) et calcul du coût
- Aire OSPF unique (Area 0) vs OSPF multi-aires
- Établissement des adjacences : états d'OSPF, rôles de DR (Designated Router) et BDR (Backup Designated Router)

**Critères de maîtrise N4 :**
- [ ] Configurer OSPFv2 sur 3 routeurs dans l'Area 0 et vérifier la convergence complète de la topologie
- [ ] Ajuster manuellement la bande passante de référence ou le coût d'une interface pour dévier le trafic réseau
- [ ] Résoudre un problème d'établissement d'adjacence OSPF lié à des masques de sous-réseau ou des timers incompatibles

---

## 5. Sécurité réseau, Services & WAN

### Prérequis
- Routage IP (Section 4)

### 5.1 Access Control Lists (ACLs)
**Grands points :**
- Rôle des ACLs dans le filtrage et la sécurité du trafic
- ACLs standards (filtrage sur IP source uniquement, placement proche de la destination)
- ACLs étendues (filtrage sur IP source/destination, ports TCP/UDP, protocoles, placement proche de la source)
- ACLs nommées vs ACLs numérotées
- Règle implicite de rejet de fin d'ACL (implicit deny all) et masque générique (wildcard mask)

**Critères de maîtrise N4 :**
- [ ] Écrire et appliquer une ACL étendue pour bloquer le trafic HTTP/HTTPS d'un sous-réseau vers un serveur spécifique tout en autorisant le ping
- [ ] Expliquer le fonctionnement et calculer un masque générique (wildcard mask) pour filtrer des plages d'adresses complexes
- [ ] Diagnostiquer un blocage involontaire de trafic légitime dû à l'ordre des règles d'une ACL

---

### 5.2 Network Address Translation (NAT/PAT)
**Grands points :**
- Rôle du NAT dans la préservation des adresses IPv4 publiques
- NAT Statique (mapping 1:1 pour serveurs internes)
- NAT Dynamique (mapping depuis un pool d'adresses publiques)
- PAT (Port Address Translation / NAT Overload, partage d'une adresse publique unique)
- Configuration des interfaces NAT : Inside (interne) vs Outside (externe)

**Critères de maîtrise N4 :**
- [ ] Configurer le NAT de type PAT (Overload) sur un routeur de bordure pour permettre à tout le réseau interne d'accéder à Internet
- [ ] Configurer une redirection de port (Port Forwarding) pour rendre un serveur SSH interne accessible depuis l'extérieur
- [ ] Analyser la table des translations NAT (`show ip nat translations`) pour identifier un hôte générant des connexions suspectes

---

### 5.3 Protocoles de redondance et de boucle (STP & Etherchannel)
**Grands points :**
- Boucles réseau de couche 2 et tempêtes de diffusion (broadcast storms)
- Protocole STP (Spanning Tree Protocol, 802.1D) et RSTP (Rapid STP, 802.1w)
- Rôles STP : Root Bridge, Root Port, Designated Port, Blocked Port
- Élection du Root Bridge (Bridge ID, Priorité, Adresse MAC)
- Agrégation de ports physiques (Etherchannel/Link Aggregation) : protocoles LACP (802.3ad) et PAgP

**Critères de maîtrise N4 :**
- [ ] Configurer manuellement l'élection d'un Switch comme Root Bridge principal et un autre comme Root Bridge secondaire (Primary/Secondary)
- [ ] Configurer un Etherchannel LACP actif entre deux switches et valider la tolérance aux pannes en coupant des câbles physiques
- [ ] Interpréter le statut STP d'un commutateur pour déterminer quel port bloque une boucle de couche 2

---

## 6. Automatisation, SDN & Diagnostic avancé

### Prérequis
- Parcours Réseau complet (Sections 1 à 5)

### 6.1 Supervision & Administration réseau
**Grands points :**
- Protocole NTP (Network Time Protocol) pour la synchronisation temporelle
- Protocole Syslog : niveaux de sévérité (0-7), serveurs de logs centralisés
- Protocole SNMP (Simple Network Management Protocol) : MIBs, OIDs, Get/Set, Traps
- Protocole SSH : sécurisation des accès CLI par rapport à Telnet, clés cryptographiques
- Sauvegarde et restauration des fichiers de configuration (TFTP, SCP)

**Critères de maîtrise N4 :**
- [ ] Configurer SSHv2 sur un commutateur Cisco, générer des clés RSA de 2048 bits et désactiver Telnet
- [ ] Configurer le logging Syslog vers un serveur externe pour enregistrer uniquement les alertes et urgences (niveaux 0-4)
- [ ] Effectuer une sauvegarde automatique de la configuration en cours (running-config) vers un serveur TFTP distant

---

### 6.2 SDN, Architectures Cloud & Programmation Réseau
**Grands points :**
- Comparaison des architectures traditionnelles et SDN (Software-Defined Networking)
- Séparation des plans de contrôle (Control Plane) et de transfert (Data Plane)
- Architectures de datacenters modernes : Spine-Leaf (Clos network)
- Contrôleurs SDN : Cisco DNA Center, API REST, formats de données JSON/YAML
- Outils d'automatisation d'infrastructure réseau : Ansible, Python (Netmiko, Paramiko)

**Critères de maîtrise N4 :**
- [ ] Expliquer les avantages fonctionnels d'une topologie Spine-Leaf par rapport à une architecture à 3 couches classique
- [ ] Écrire un script Python simple ou un playbook Ansible pour récupérer la configuration ou modifier le VLAN de 10 switches simultanément
- [ ] Interpréter un payload JSON représentant le statut d'une interface réseau renvoyé par une API REST de contrôleur

---

### 6.3 Diagnostic de bas niveau (Dépannage système)
**Grands points :**
- Utilisation de `ping` et de `traceroute` (ICMP vs UDP traceroute)
- Analyse de tables d'adresses ARP et MAC sur les routeurs/switches et sur les serveurs
- Capture de paquets en ligne de commande : `tcpdump` et filtres complexes
- Analyse avec Wireshark : filtres d'affichage, flux TCP, re-construction de sessions applicatives
- Analyse de la bande passante et de la gigue (Iperf)

**Critères de maîtrise N4 :**
- [ ] Isoler la localisation exacte d'une perte de paquets intermittente sur un chemin routé multi-sauts
- [ ] Utiliser `tcpdump` sur un serveur Linux pour capturer uniquement les trames ICMP provenant d'un sous-réseau particulier
- [ ] Utiliser Wireshark pour extraire un fichier transféré via un protocole non chiffré (HTTP/FTP) au sein d'une capture de paquets
