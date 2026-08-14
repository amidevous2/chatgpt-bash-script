#!/bin/bash
# Almalinux-10.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-10.Dockerfile
chmod 777 Almalinux-10
podman build -t test-almalinux-10 -f Almalinux-10.Dockerfile .
rm -f Almalinux-10.Dockerfile

# Démarrer directement Bash
podman run --rm -it test-almalinux-10 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
