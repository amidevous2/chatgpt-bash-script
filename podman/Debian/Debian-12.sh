#!/bin/bash
# Debian-12.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-12.Dockerfile
chmod 777 Debian-12
podman build -t test-debian-12 -f Debian-12.Dockerfile .
rm -f Debian-12.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-debian-12 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
