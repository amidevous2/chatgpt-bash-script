#!/bin/bash
# Fedora-42.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Fedora-42.Dockerfile
chmod 777 Fedora-42.Dockerfile
# Compiler l'image depuis le template Fedora 42
podman build -t test-fedora42 -f Fedora-42.Dockerfile .
rm -f Fedora-42.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-fedora42 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
