# chatgpt-bash-script
script bash générer a l'aide de chatgpt

ensure_os.sh usage

```
#!/bin/bash
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/ensure_os.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/ensure_os.sh"
fi)"


eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" | bash -s -- --distribution Fedora --version 42
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" | bash -s -- --distribution Fedora --version 42
fi)"



```
