#!/bin/bash
# Debian-11.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-11.Dockerfile
chmod 777 Debian-11
podman build -t test-debian-11 -f Debian-11.Dockerfile .
rm -f Debian-11.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-debian-11 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
