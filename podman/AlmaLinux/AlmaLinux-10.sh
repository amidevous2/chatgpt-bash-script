#!/bin/bash
# AlmaLinux-10.sh
commit=7f80754c9c89cfb6000c3dba6fc2520bd582150f
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$commit/podman/AlmaLinux/AlmaLinux-10.Dockerfile -O AlmaLinux-10.Dockerfile
chmod 777 AlmaLinux-10.Dockerfile
podman build -t almalinux-10 -f AlmaLinux-10.Dockerfile .
rm -f AlmaLinux-10.Dockerfile

# Démarrer directement Bash
podman run --rm -it almalinux-10 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
