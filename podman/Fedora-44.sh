#!/bin/bash
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

# Compiler l'image depuis le template Fedora 44
podman build -t test-fedora44 -f Fedora-44.Dockerfile .

# Démarrer directement Bash
podman run --rm -it test-fedora44 /bin/bash
