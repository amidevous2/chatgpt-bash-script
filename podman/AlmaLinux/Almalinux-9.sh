#!/bin/bash
# Almalinux-9.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Almalinux/Almalinux-9.Dockerfile
chmod 777 Almalinux-9
podman build -t test-almalinux-9 -f Almalinux-9.Dockerfile .
rm -f Almalinux-9.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-almalinux-9 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
