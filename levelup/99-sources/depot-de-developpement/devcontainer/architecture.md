# Architecture Decision Record (ADR) — Dev Container Environment

**Version :** 1.0  
**Statut :** Approved  
**Axiome Pivot :** Strict Minimalism & Safety  

---

## 1. Modèle d'Évaluation de l'Image de Base

Pour éviter le gaspillage de ressources (bloat) des images microsoft universelles de 10 Go+, nous avons évalué et écarté les alternatives suivantes au profit de **Debian Bookworm Slim** :

| Image alternative | Score | Justification |
| :--- | :--- | :--- |
| `mcr.microsoft.com/devcontainers/universal` | 1 / 5 | Rejetée. Contient des giga-octets d'outils inutilisés, augmentant la surface d'attaque et ralentissant le téléchargement. |
| `alpine:3.20` | 2.5 / 5 | Rejetée. L'utilisation de `musl` libc provoque des incompatibilités majeures de performances lors de la compilation dynamique de Rust et de l'exécution de paquets C-Python. |
| **`debian:bookworm-slim`** | **5 / 5** | **Sélectionnée.** Image de confiance ultra-légère (~30 Mo brute), conforme à `glibc`, disposant d'un gestionnaire `apt` mature pour installer nos dépendances spécifiques de manière déterministe. |

---

## 2. Registre de Gouvernance des Versions (Pinned Toolchains)

Chaque brique logicielle installée dans l'environnement est verrouillée sur une version d'API ou d'exécutable spécifique pour éviter les dérives de comportement :

*   **OCI Base Distribution :** Debian 12 (Bookworm) Slim (`debian:bookworm-slim`).
*   **Rust Toolchain :** `1.95.0` (Stabilité garantie, alignée sur le compilateur hôte pour le support des éditions récentes de crates.io).
*   **Node.js Runtime :** `24.0.0` (Active LTS pour notre client web React).
*   **Python Runtime :** `3.11` (Support stable de l'écosystème d'agents socratiques).
*   **PostgreSQL Client :** Client v15 (Correspondance parfaite avec l'instance de données local PostgreSQL v15).
*   **Open Policy Agent (OPA) CLI :** `0.65.0` (Moteur d'autorisation).
*   **NATS CLI :** `0.1.5` (Outil de manipulation du bus d'événements).
*   **Flutter SDK :** `3.19.0` (SDK stable pour le client mobile).

---

## 3. Durcissement de la Sécurité (Hardening)

1.  **Exécution sans privilèges root (`USER developer`) :** Le conteneur s'exécute sous l'identité `developer` (UID 1000 / GID 1000) pour interdire toute pollution de droits sur le système hôte.
2.  **Hygiène APT :** Suppression immédiate des index et caches temporaires après installation (`rm -rf /var/lib/apt/lists/*`) pour réduire la taille des couches de l'image.
3.  **Authentification Découplée :** Les clés privées SSH et secrets d'API ne sont pas copiés dans le conteneur ; ils transitent via SSH Agent Forwarding et des fichiers `.env` ignorés par git.
