# chatgpt-bash-script
script bash générer a l'aide de chatgpt

ensure_os.sh usage

```
#!/bin/bash
if command -v curl >/dev/null 2>&1; then DL="curl --insecure -fsSL"; else DL="wget --no-check-certificate -qO-"; fi
JQ_VERSION=1.6; $DL "https://github.com/jqlang/jq/releases/download/jq-$JQ_VERSION/jq-$([ "$ARCH" = x86_64 ] && echo linux64 || echo linux32)" > "./jq"; chmod 755 "./jq"
COMMIT=$($DL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | ./jq -r .sha && rm -f ./jq)
CBSCOMMIT="c35023459b95db217b59b935e22546cff16ac782"
eval "$($DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/ensure_os.sh")"





$DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" > podman-build.sh && chmod +x podman-build.sh && ./podman-build.sh --distribution Fedora --version 42

$DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" > podman-build.sh && chmod +x podman-build.sh && ./podman-build.sh --distribution Fedora --version 43

$DL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh" > podman-build.sh && chmod +x podman-build.sh && ./podman-build.sh --distribution CentOS --version 6

```
