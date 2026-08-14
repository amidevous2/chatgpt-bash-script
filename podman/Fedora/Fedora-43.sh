#!/bin/bash
# Fedora-43.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Fedora/Fedora-43.Dockerfile
chmod 777 Fedora-43.Dockerfile
# Compiler l'image depuis le template Fedora 434
podman build -t test-fedora43 -f Fedora-43.Dockerfile .
rm -f Fedora-43.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-fedora43 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
