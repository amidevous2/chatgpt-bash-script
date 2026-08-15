#!/bin/bash
# AlmaLinux-10.sh
commit=86cbb1facf4dd2de8e27ae856641834cb9cbdc01
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
