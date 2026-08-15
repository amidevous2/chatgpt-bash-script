#!/bin/bash
# podman-build.sh
COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')

DISTRIBUTION=""
VERSION=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --distribution)
            DISTRIBUTION="$2"
            shift 2
            ;;
        --version)
            VERSION="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 --distribution <distribution> --version <version>"
            exit 0
            ;;
        *)
            echo "Option inconnue : $1"
            exit 1
            ;;
    esac
done

if [ -z "$DISTRIBUTION" ] || [ -z "$VERSION" ]; then
    echo "Erreur : --distribution et --version sont obligatoires."
    exit 1
fi

echo "Distribution : $DISTRIBUTION"
echo "Version      : $VERSION"



# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
if [ -f "$HOME/podman-template/$DISTRIBUTION-$VERSION.tar.xz" ]; then
xz -dc "$HOME/podman-template/$DISTRIBUTION-$VERSION.tar.xz" | podman load
podman run --rm -it localhost/$DISTRIBUTION:$VERSION /bin/bash
else
wget https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/$DISTRIBUTION/$DISTRIBUTION-$VERSION.Dockerfile
chmod 777 "$DISTRIBUTION-$VERSION.Dockerfile"
podman build -t $DISTRIBUTION:$VERSION -f $DISTRIBUTION-$VERSION.Dockerfile .
mkdir -p "$HOME/podman-template/"
podman save localhost/$DISTRIBUTION:$VERSION | xz -T0 -9 > "$HOME/podman-template/$DISTRIBUTION-$VERSION.tar.xz"
rm -f $DISTRIBUTION-$VERSION.Dockerfile
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
xz -dc "$HOME/podman-template/$DISTRIBUTION-$VERSION.tar.xz" | podman load
podman run --rm -it localhost/$DISTRIBUTION:$VERSION /bin/bash
fi

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
