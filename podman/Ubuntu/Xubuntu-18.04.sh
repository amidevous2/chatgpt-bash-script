#!/bin/bash
# Xubuntu-18.04.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Ubuntu/Xubuntu-18.04.Dockerfile
chmod 777 Xubuntu-18.04.Dockerfile
podman build -t test-xubuntu-18.04 -f Xubuntu-18.04.Dockerfile .
rm -f Xubuntu-18.04.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-xubuntu-18.04 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
