# Fedora 42 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 42
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 42
fi)"

```


# Fedora 43 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 43
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 43
fi)"


```


# Fedora 44 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 44
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/COMMIT/podman/build-podman.sh" | bash -s -- --distribution Fedora --version 44
fi)"


```


# AlmaLinux-10 podman command

```

eval "$(if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/build-podman.sh" | bash -s -- --distribution AlmaLinux --version 10
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/COMMIT/podman/build-podman.sh" | bash -s -- --distribution AlmaLinux --version 10
fi)"

```

# Almalinux-9 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-9.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-9.sh"
fi)"

```



# Almalinux-8 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-8.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/AlmaLinux/AlmaLinux-8.sh"
fi)"

```





# Debian-11 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-11.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-11.sh"
fi)"

```

# Debian-12 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-12.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-12.sh"
fi)"

```



# Debian-13 podman command

```
eval "$(if command -v curl >/dev/null 2>&1; then
    curl -L -sS "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-13.sh"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/refs/heads/main/podman/Debian/Debian-13.sh"
fi)"

```
