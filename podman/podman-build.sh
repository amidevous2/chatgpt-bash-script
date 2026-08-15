#!/bin/bash
# podman-build.sh
if ! command -v jq >/dev/null 2>&1; then
    echo "Erreur : jq n'est pas installé."
    echo "Installez jq puis relancez le script."
    exit 1
fi
if command -v curl >/dev/null 2>&1; then
COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
elif command -v wget >/dev/null 2>&1; then
COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
fi

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
        --architecture)
            ARCHITECTURE="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 --distribution <distribution> --version <version> [--architecture <architecture>]"
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


if [ -z "$ARCHITECTURE" ]; then
    DOCKERFILE="$DISTRIBUTION-$VERSION.Dockerfile"
    TEMPLATE="$DISTRIBUTION-$VERSION.tar.xz"
    IMAGE_NAME="${DISTRIBUTION,,}${VERSION}"
else
    DOCKERFILE="$DISTRIBUTION-$VERSION-$ARCHITECTURE.Dockerfile"
    TEMPLATE="$DISTRIBUTION-$VERSION-$ARCHITECTURE.tar.xz"
    IMAGE_NAME="${DISTRIBUTION,,}${VERSION}${ARCHITECTURE}"
fi


# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
if [ -f "$HOME/podman-template/$TEMPLATE" ]; then
xz -dc "$HOME/podman-template/$TEMPLATE" | podman load
podman run --rm -it localhost/$DISTRIBUTION:$VERSION /bin/bash
else
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/$DISTRIBUTION/$DOCKERFILE" -o "$DOCKERFILE"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$DISTRIBUTION-$VERSION.Dockerfile" "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/$DISTRIBUTION/$DOCKERFILE"
fi
chmod 777 "$DOCKERFILE"
podman build -t $IMAGE_NAME -f "$DOCKERFILE" .
mkdir -p "$HOME/podman-template/"
podman save localhost/$IMAGE_NAME | xz -T0 -9 > "$HOME/podman-template/$TEMPLATE"
rm -f "$DOCKERFILE"
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
xz -dc "$HOME/podman-template/$TEMPLATE" | podman load
podman run --rm -it localhost/$IMAGE_NAME:latest /bin/bash
fi

# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
