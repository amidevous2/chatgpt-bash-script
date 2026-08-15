#!/bin/bash
# AlmaLinux-10.sh
commit=916df95f317fcf6b7aa957e8d7e563bd3ae1de94
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

rm -f AlmaLinux-10.Dockerfile
wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$commit/podman/AlmaLinux/AlmaLinux-10.Dockerfile -O AlmaLinux-10.Dockerfile
chmod 777 AlmaLinux-10.Dockerfile
podman build -t almalinux10 -f AlmaLinux-10.Dockerfile .
rm -f AlmaLinux-10.Dockerfile

# Démarrer directement Bash
podman run --rm -it almalinux10 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
