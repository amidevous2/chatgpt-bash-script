#!/bin/bash
# podman-build.sh
if [ -z "$CBSCOMMIT" ]; then
if command -v curl >/dev/null 2>&1; then DL="curl --insecure -fsSL"; else DL="wget --no-check-certificate -qO-"; fi
JQ_VERSION=1.6; $DL "https://github.com/jqlang/jq/releases/download/jq-$JQ_VERSION/jq-$([ "$ARCH" = x86_64 ] && echo linux64 || echo linux32)" > "./jq"; chmod 755 "./jq"
COMMIT=$($DL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | ./jq -r .sha && rm -f ./jq)
else
COMMIT="$CBSCOMMIT"
fi
eval "$($DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/ensure_os.sh")"


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
    ARCH=--platform=linux/amd64
    DOCKERFILE="$DISTRIBUTION-$VERSION.Dockerfile"
    TEMPLATE="$DISTRIBUTION-$VERSION.tar.xz"
    IMAGE_NAME="${DISTRIBUTION,,}${VERSION}"
else
    DOCKERFILE="$DISTRIBUTION-$VERSION-$ARCHITECTURE.Dockerfile"
    TEMPLATE="$DISTRIBUTION-$VERSION-$ARCHITECTURE.tar.xz"
    IMAGE_NAME="${DISTRIBUTION,,}${VERSION}${ARCHITECTURE}"
    ARCH=--platform=linux/i386
fi


# Purge Podman avant utilisation
podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes




if [ -f "$HOME/podman-template/$TEMPLATE" ]; then
    echo "Template trouvé : $TEMPLATE"
    echo "Chargement du template..."
    xz -dc "$HOME/podman-template/$TEMPLATE" | podman load
    echo "Template chargé."
    echo "Lancement de $IMAGE_NAME..."
    podman $ARCH run --rm -it "localhost/$IMAGE_NAME:latest" /bin/bash < /dev/tty
else
    echo "Template absent : $TEMPLATE"
    echo "Téléchargement du Dockerfile..."

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/$DISTRIBUTION/$DOCKERFILE" -o "$DOCKERFILE"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO "$DOCKERFILE" "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/$DISTRIBUTION/$DOCKERFILE"
    fi

    chmod 777 "$DOCKERFILE"

    echo "Construction de $IMAGE_NAME..."
    podman $ARCH  build -t "$IMAGE_NAME" -f "$DOCKERFILE" . </dev/tty
    echo "BUILD TERMINÉ"

    mkdir -p "$HOME/podman-template/"

    echo "Sauvegarde de l'image..."
    podman save --output "/tmp/${TEMPLATE%.xz}" "localhost/$IMAGE_NAME"
    xz -T0 -9 "/tmp/${TEMPLATE%.xz}"
    mv "/tmp/$TEMPLATE" "$HOME/podman-template/$TEMPLATE"
    echo "sauvegarde TERMINÉ"

    rm -f "$DOCKERFILE"

    echo "Purge de l'image de travail..."
    podman stop -a 2>/dev/null || true
    podman rm -a -f 2>/dev/null || true
    podman rmi -a -f 2>/dev/null || true
    podman volume rm -a -f 2>/dev/null || true
    podman system prune -a -f --volumes

    echo "Rechargement du template..."
    xz -dc "$HOME/podman-template/$TEMPLATE" | podman load

    echo "Template rechargé."
    echo "Lancement de $IMAGE_NAME..."
    podman $ARCH run --rm -it "localhost/$IMAGE_NAME:latest" /bin/bash < /dev/tty
fi


podman stop -a 2>/dev/null || true
podman rm -a -f 2>/dev/null || true
podman rmi -a -f 2>/dev/null || true
podman volume rm -a -f 2>/dev/null || true
podman system prune -a -f --volumes
