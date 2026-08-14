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

echo OS: $OS
echo OS_ID: $OS_ID
echo OS_VERSION: $OS_VERSION
echo OS_MAJOR: $OS_MAJOR
echo OS_MINOR: $OS_MINOR
echo OS_PATCH: $OS_PATCH
echo OS_FAMILY: $OS_FAMILY
echo OS_KERNEL: $OS_KERNEL
echo OS_KERNEL_VERSION: $OS_KERNEL_VERSION
echo OS_ARCH: $OS_ARCH
echo OS_ENVIRONMENT: $OS_ENVIRONMENT
```
