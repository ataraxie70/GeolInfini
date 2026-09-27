chaque ressource avec un type clair : `standard`, `manpage`, `vendor-doc`, `manual`, `project-doc`. Le noyau de ta base doit rester composé de sources officielles et primaires.

## 1) Domaine : Développement système en C

### Architecture machine / OS / cycle d’exécution

Sources à privilégier : Intel SDM pour l’architecture x86/x86-64, AMD64 APM pour l’architecture AMD64, et les pages `syscalls(2)` / `strace(1)` du projet man-pages pour relier programme, syscalls et noyau. ([intel.com][1])

### Fondations du C / compilation / organisation de projet

Sources à privilégier : les pages publiques de WG14 pour le standard C, la documentation GCC pour la compilation, et le manuel GNU Make pour l’ordonnancement des builds. ([open-std.org][2])

### Mémoire / pointeurs / allocation dynamique

Sources à privilégier : WG14 pour la sémantique du langage, `mmap(2)` / `munmap(3p)` pour le lien avec la mémoire virtuelle, et Valgrind pour les erreurs mémoire et les fuites. ([open-std.org][2])

### Fichiers / E/S

Sources à privilégier : `open(2)`, `read(2)`, `write(2)`, `pread(2)` et `select(2)` dans les man pages Linux. ([man7.org][3])

### Processus / exécution / signaux

Sources à privilégier : `fork(2)`, `execve(2)`, `wait(2)`, `signal(7)`, `signal(2)` et `signal-safety(7)`. ([man7.org][4])

### Débogage / inspection / erreurs mémoire

Sources à privilégier : GDB, `ptrace(2)` et Valgrind. ([sourceware.org][5])

### Concurrence / threads

Sources à privilégier : `pthread_create(3)`, `pthread_join(3)`, `pthread_detach(3)`, `pthread_attr_init(3)` et `futex(2)` pour comprendre la concurrence côté Linux. ([man7.org][6])

### Réseau bas niveau

Sources à privilégier : `socket(2)`, `connect(2)`, `accept(2)`, `socket(7)`, puis RFC 9293 pour TCP et RFC 9499 pour la terminologie DNS. ([man7.org][7])

---

## 2) Domaine : Administration système

### Shell / commandes / manipulation de base

Sources à privilégier : le Bash Reference Manual, GNU Coreutils, et les pages man du projet man-pages pour le comportement système. ([gnu.org][8])

### Démarrage / services / systemd

Sources à privilégier : `systemd(1)`, `systemctl(1)`, `systemd.service(5)`, `systemd-journald.service(8)`, `journalctl(1)`, `bootup(7)` et `systemd-fstab-generator(8)`. ([freedesktop.org][9])

### Journalisation / diagnostic

Sources à privilégier : `systemd-journald.service(8)`, `journalctl(1)` et `systemd.journal-fields(7)`. ([freedesktop.org][10])

### Stockage / partitions / montage

Sources à privilégier : `mount(8)`, `umount(8)`, `fstab(5)`, `lsblk(8)` et `findmnt(8)`. ([man7.org][11])

### Réseau système

Sources à privilégier : `systemd.network(5)`, `systemd-networkd.service(8)`, `systemd.netdev(5)`, `socket(7)` et les RFC TCP/DNS. ([freedesktop.org][12])

### Sécurité / pare-feu / durcissement

Sources à privilégier : le projet nftables, la documentation Netfilter, et le NIST Cybersecurity Framework 2.0 pour la structure de gouvernance de sécurité. ([netfilter.org][13])

---

## 3) Domaine : DevOps / DevSecOps

### Git / versioning

Sources à privilégier : la documentation officielle Git, le manuel `git`, et les pages d’apprentissage Git. ([git-scm.com][14])

### Automatisation / scripts / build

Sources à privilégier : Bash Reference Manual, GNU Make Manual, et GNU Coreutils. ([gnu.org][8])

### Conteneurs

Sources à privilégier : Docker Docs pour la construction et l’usage des images/containeurs, puis Kubernetes pour l’orchestration et la gestion de workloads conteneurisés. ([Docker Documentation][15])

### CI/CD

Sources à privilégier : GitHub Actions documentation, surtout la syntaxe des workflows et les références de contexte/secrets. ([GitHub Docs][16])

### Observabilité

Sources à privilégier : Prometheus pour les métriques et l’alerting, OpenTelemetry pour traces/metrics/logs et le Collector pour l’export. ([prometheus.io][17])

### Sécurité d’infrastructure

Sources à privilégier : NIST CSF 2.0 pour les objectifs de sécurité, GitHub Actions secrets/contexts pour les secrets de pipeline, et systemd journald pour la traçabilité locale. ([NIST][18])

---

## 4) Règle de remplissage de la base

Pour chaque sujet, conserve au minimum :

* **1 source primaire** ;
* **1 source opérationnelle** ;
* **1 source de vérification**.

Pour C, la priorité doit aller à : WG14, GCC, man-pages, Valgrind, GDB. Pour l’infrastructure, la priorité doit aller à : systemd, Git, Docker, Kubernetes, GitHub Actions, Prometheus, OpenTelemetry, NIST. ([open-std.org][2])


[1]: https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html?utm_source=chatgpt.com "Manuals for Intel® 64 and IA-32 Architectures"
[2]: https://www.open-std.org/jtc1/sc22/wg14/www/standards?utm_source=chatgpt.com "ISO/IEC JTC1/SC22/WG14 - C: Approved standards"
[3]: https://man7.org/linux/man-pages/man2/open.2.html?utm_source=chatgpt.com "open(2) - Linux manual page"
[4]: https://man7.org/linux/man-pages/man2/fork.2.html?utm_source=chatgpt.com "fork(2) - Linux manual page"
[5]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/?utm_source=chatgpt.com "Top (Debugging with GDB)"
[6]: https://man7.org/linux/man-pages/man3/pthread_create.3.html?utm_source=chatgpt.com "pthread_create(3) - Linux manual page"
[7]: https://man7.org/linux/man-pages/man2/socket.2.html?utm_source=chatgpt.com "socket(2) - Linux manual page"
[8]: https://www.gnu.org/software/bash/manual/bash.html?utm_source=chatgpt.com "Bash Reference Manual"
[9]: https://www.freedesktop.org/software/systemd/man/systemd.html?utm_source=chatgpt.com "systemd"
[10]: https://www.freedesktop.org/software/systemd/man/systemd-journald.service.html?utm_source=chatgpt.com "systemd-journald.service"
[11]: https://man7.org/linux/man-pages/man8/mount.8.html?utm_source=chatgpt.com "mount(8) - Linux manual page"
[12]: https://www.freedesktop.org/software/systemd/man/systemd.network.html?utm_source=chatgpt.com "SystemD Networkd"
[13]: https://www.netfilter.org/projects/nftables/index.html?utm_source=chatgpt.com "The netfilter.org \"nftables\" project"
[14]: https://git-scm.com/docs?utm_source=chatgpt.com "Git - Reference"
[15]: https://docs.docker.com/?utm_source=chatgpt.com "Docker Docs"
[16]: https://docs.github.com/actions?utm_source=chatgpt.com "GitHub Actions documentation"
[17]: https://prometheus.io/?utm_source=chatgpt.com "Prometheus - Monitoring system & time series database"
[18]: https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20?utm_source=chatgpt.com "The NIST Cybersecurity Framework (CSF) 2.0"
