#!/bin/bash
# Almalinux-8.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-8.Dockerfile
chmod 777 Almalinux-8
podman build -t test-almalinux-8 -f Almalinux-8.Dockerfile .
rm -f Almalinux-8.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-almalinux-8 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
