-- Seed SQL - Resources (tous domaines)
-- Table cible: resources(id, subject_id, type, title, author, reference, url, is_primary_source)

BEGIN TRANSACTION;

-- =============================
-- C SYSTEM PROGRAMMING
-- =============================

-- Architecture
INSERT INTO resources VALUES
(1001, 1, 'manual', 'Intel 64 and IA-32 Architectures SDM', 'Intel', 'Intel SDM', 'https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html', 1),
(1002, 1, 'book', 'Computer Systems: A Programmer''s Perspective', 'Bryant & O’Hallaron', 'CSAPP', NULL, 1);

-- OS / syscalls
INSERT INTO resources VALUES
(1003, 2, 'manpage', 'syscalls(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/syscalls.2.html', 1),
(1004, 2, 'manpage', 'proc(5)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man5/proc.5.html', 1);

-- Compilation
INSERT INTO resources VALUES
(1005, 3, 'manual', 'GCC Documentation', 'GNU Project', 'gcc docs', 'https://gcc.gnu.org/onlinedocs/', 1),
(1006, 3, 'book', 'Linkers and Loaders', 'John Levine', 'Morgan Kaufmann', NULL, 1);

-- C standard
INSERT INTO resources VALUES
(1007, 4, 'standard', 'ISO/IEC 9899 (C Standard)', 'ISO', 'WG14', 'https://www.open-std.org/jtc1/sc22/wg14/', 1),
(1008, 4, 'book', 'The C Programming Language', 'Kernighan & Ritchie', 'K&R', NULL, 1);

-- Pointers
INSERT INTO resources VALUES
(1009, 6, 'standard', 'C Pointer Semantics', 'ISO', 'WG14', 'https://www.open-std.org/jtc1/sc22/wg14/', 1),
(1010, 6, 'manual', 'man pointer usage', 'Linux man-pages', 'man7', NULL, 0);

-- Memory
INSERT INTO resources VALUES
(1011, 7, 'manpage', 'malloc(3)', 'Linux man-pages', 'glibc', 'https://man7.org/linux/man-pages/man3/malloc.3.html', 1),
(1012, 7, 'manual', 'Valgrind Manual', 'Valgrind', 'valgrind docs', 'https://valgrind.org/docs/manual/', 1);

-- I/O
INSERT INTO resources VALUES
(1013, 9, 'manpage', 'open(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/open.2.html', 1),
(1014, 9, 'manpage', 'read(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/read.2.html', 1),
(1015, 9, 'manpage', 'write(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/write.2.html', 1);

-- Processes
INSERT INTO resources VALUES
(1016, 12, 'manpage', 'fork(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/fork.2.html', 1),
(1017, 12, 'manpage', 'execve(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/execve.2.html', 1),
(1018, 12, 'manpage', 'wait(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/wait.2.html', 1);

-- Debugging
INSERT INTO resources VALUES
(1019, 13, 'manual', 'GDB Manual', 'GNU Project', 'gdb docs', 'https://sourceware.org/gdb/current/onlinedocs/gdb/', 1);

-- Threads
INSERT INTO resources VALUES
(1020, 15, 'manpage', 'pthread_create(3)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man3/pthread_create.3.html', 1),
(1021, 15, 'manpage', 'futex(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/futex.2.html', 1);

-- Networking
INSERT INTO resources VALUES
(1022, 16, 'manpage', 'socket(2)', 'Linux man-pages', 'man7', 'https://man7.org/linux/man-pages/man2/socket.2.html', 1),
(1023, 16, 'rfc', 'RFC 9293 - TCP', 'IETF', 'RFC 9293', 'https://datatracker.ietf.org/doc/html/rfc9293', 1);

-- =============================
-- SYSTEM ADMINISTRATION
-- =============================

INSERT INTO resources VALUES
(2001, NULL, 'manual', 'Bash Reference Manual', 'GNU', 'bash docs', 'https://www.gnu.org/software/bash/manual/bash.html', 1),
(2002, NULL, 'manual', 'systemd Documentation', 'freedesktop.org', 'systemd', 'https://www.freedesktop.org/software/systemd/man/systemd.html', 1),
(2003, NULL, 'manpage', 'journalctl(1)', 'systemd', 'man', NULL, 1),
(2004, NULL, 'manpage', 'mount(8)', 'Linux', 'man7', 'https://man7.org/linux/man-pages/man8/mount.8.html', 1),
(2005, NULL, 'manual', 'nftables Documentation', 'Netfilter', 'nftables', 'https://www.netfilter.org/projects/nftables/', 1);

-- =============================
-- DEVOPS / DEVSECOPS
-- =============================

INSERT INTO resources VALUES
(3001, NULL, 'manual', 'Git Documentation', 'Git SCM', 'git docs', 'https://git-scm.com/docs', 1),
(3002, NULL, 'manual', 'Docker Documentation', 'Docker', 'docker docs', 'https://docs.docker.com/', 1),
(3003, NULL, 'manual', 'Kubernetes Documentation', 'CNCF', 'k8s docs', 'https://kubernetes.io/docs/', 1),
(3004, NULL, 'manual', 'GitHub Actions Documentation', 'GitHub', 'actions docs', 'https://docs.github.com/actions', 1),
(3005, NULL, 'manual', 'Prometheus Documentation', 'Prometheus', 'prometheus docs', 'https://prometheus.io/docs/', 1),
(3006, NULL, 'manual', 'OpenTelemetry Docs', 'CNCF', 'otel docs', 'https://opentelemetry.io/docs/', 1),
(3007, NULL, 'standard', 'NIST CSF 2.0', 'NIST', 'CSF', 'https://www.nist.gov/cyberframework', 1);

COMMIT;
