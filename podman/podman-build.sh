#!/bin/bash
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Fedora/Fedora-42.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Fedora/Fedora-42.sh"
fi)"
