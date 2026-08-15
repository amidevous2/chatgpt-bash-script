#!/bin/bash
# podman-build.sh
# Fedora-42.sh
# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
if [ -f $HOME/podman-template/Fedora-42.tar.xz ]; then
xz -dc "$HOME/podman-template/Fedora-42.tar.xz" | podman load
podman run --rm -it localhost/fedora42:latest /bin/bash
else
wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Fedora/Fedora-42.Dockerfile
chmod 777 Fedora-42.Dockerfile
# Compiler l'image depuis le template Fedora 42
podman build -t fedora42 -f Fedora-42.Dockerfile .
mkdir -p $HOME/podman-template/
podman save localhost/fedora42:latest | xz -T0 -9 > $HOME/podman-template/Fedora-42.tar.xz
rm -f Fedora-42.Dockerfile
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
xz -dc "$HOME/podman-template/Fedora-42.tar.xz" | podman load
podman run --rm -it localhost/fedora42:latest /bin/bash
fi

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
