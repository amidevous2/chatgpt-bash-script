#!/bin/bash
commit=master
# Almalinux-9.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://github.com/amidevous2/chatgpt-bash-script/raw/refs/heads/main/podman/AlmaLinux/AlmaLinux-9.Dockerfile -O AlmaLinux-9.Dockerfile
chmod 777 AlmaLinux-9.Dockerfile
podman build -t almalinux9 -f AlmaLinux-9.Dockerfile .
rm -f AlmaLinux-9.Dockerfile

# Démarrer directement Bash
podman run --rm -it almalinux9 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
