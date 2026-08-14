#!/bin/bash
# Almalinux-10.sh
commit=4335e9796a0521db7fc5a0374ed908fb6cc4fb09
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes

wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$commit/podman/AlmaLinux/AlmaLinux-10.Dockerfile -O lmaLinux-10.Dockerfile
chmod 777 Almalinux-10
podman build -t Almalinux-10 -f Almalinux-10.Dockerfile .
rm -f Almalinux-10.Dockerfile

# Démarrer directement Bash
podman run --rm -it Almalinux-10 /bin/bash

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
