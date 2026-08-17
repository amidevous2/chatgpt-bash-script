# chatgpt-bash-script
script bash générer a l'aide de chatgpt

ensure_os.sh usage

```
#!/bin/bash
eif command -v curl >/dev/null 2>&1; then DL="curl --insecure -fsSL"; else DL="wget --no-check-certificate -qO-"; fi
if ! command -v jq >/dev/null 2>&1; then JQ_VERSION=1.6; $DL "https://github.com/jqlang/jq/releases/download/jq-$JQ_VERSION/jq-$([ "$ARCH" = x86_64 ] && echo linux64 || echo linux32)" > "$PREFIX/bin/jq"; chmod 755 "$PREFIX/bin/jq"; fi
COMMIT=$($DL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r .sha)
eval "$($DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/ensure_os.sh")"


eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" | bash -s -- --distribution Fedora --version 42
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" | bash -s -- --distribution Fedora --version 42
fi)"



```
