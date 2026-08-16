# Fedora 42 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Fedora --version 42


```


# Fedora 43 podman command

```

if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Fedora --version 43
```


# Fedora 44 podman command

```

if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Fedora --version 44

```


# AlmaLinux-10 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution AlmaLinux --version 10
```

# Almalinux-9 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution AlmaLinux --version 9
```



# Almalinux-8 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution AlmaLinux --version 8
```





# Debian-11 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Debian --version 11
```

# Debian-12 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Debian --version 12
```



# Debian-13 podman command

```
if command -v curl >/dev/null 2>&1; then
    COMMIT=$(curl -fsSL "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(curl -fsSL "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
elif command -v wget >/dev/null 2>&1; then
    COMMIT=$(wget -qO- "https://api.github.com/repos/amidevous2/chatgpt-bash-script/commits/main" | jq -r '.sha')
    SCRIPT=$(wget -qO- "https://raw.githubusercontent.com/amidevous2/chatgpt-bash-script/$COMMIT/podman/podman-build.sh")
fi
bash -c "$SCRIPT" -- --distribution Debian --version 13

```
