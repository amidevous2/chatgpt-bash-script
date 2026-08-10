#!/bin/bash

# ============================================================
# ensure_os.sh
#
# Détection étendue des systèmes d'exploitation
#
# Compatible avec :
#   - Linux modernes
#   - Linux anciens / obsolètes
#   - distributions dérivées
#   - BSD
#   - macOS / Darwin
#   - Cygwin
#   - MSYS
#   - MinGW
#
# IMPORTANT :
#   Ce script doit rester compatible avec le Bash ancien
#   présent sur CentOS 6.
#
# ============================================================
#
#        Créé avec Amour par ChatGPT
#        GPT-5.6 Luna - OpenAI
#
# ============================================================


OS=""
OS_ID=""
OS_VERSION=""
OS_MAJOR=""
OS_MINOR=""
OS_PATCH=""
OS_FAMILY=""
OS_KERNEL=""
OS_KERNEL_VERSION=""
OS_ARCH=""
OS_ENVIRONMENT=""


# ============================================================
# KERNEL
# ============================================================

OS_KERNEL="$(uname -s 2>/dev/null)"
OS_KERNEL_VERSION="$(uname -r 2>/dev/null)"
OS_ARCH="$(uname -m 2>/dev/null)"


# ============================================================
# WINDOWS / CYGWIN / MSYS / MINGW
# ============================================================

case "$OS_KERNEL" in

    CYGWIN_NT-*)

        OS="Windows"
        OS_ID="windows"
        OS_FAMILY="windows"
        OS_ENVIRONMENT="cygwin"

        ;;

    MSYS_NT-*)

        OS="Windows"
        OS_ID="windows"
        OS_FAMILY="windows"
        OS_ENVIRONMENT="msys"

        ;;

    MINGW*)

        OS="Windows"
        OS_ID="windows"
        OS_FAMILY="windows"
        OS_ENVIRONMENT="mingw"

        ;;

esac


# ============================================================
# WINDOWS VERSION
# ============================================================

if [ "$OS_FAMILY" = "windows" ]; then

    if command -v cmd.exe >/dev/null 2>&1; then

        WINDOWS_VERSION="$(cmd.exe /c ver 2>/dev/null | tr -d '\r')"

        case "$WINDOWS_VERSION" in

            *"Windows 11"*)
                OS="Windows 11"
                ;;

            *"Windows 10"*)
                OS="Windows 10"
                ;;

            *"Windows Server 2025"*)
                OS="Windows Server 2025"
                ;;

            *"Windows Server 2022"*)
                OS="Windows Server 2022"
                ;;

            *"Windows Server 2019"*)
                OS="Windows Server 2019"
                ;;

            *"Windows Server 2016"*)
                OS="Windows Server 2016"
                ;;

            *"Windows Server 2012 R2"*)
                OS="Windows Server 2012 R2"
                ;;

            *"Windows Server 2012"*)
                OS="Windows Server 2012"
                ;;

            *"Windows Server 2008 R2"*)
                OS="Windows Server 2008 R2"
                ;;

            *"Windows Server 2008"*)
                OS="Windows Server 2008"
                ;;

            *"Windows Server 2003"*)
                OS="Windows Server 2003"
                ;;

            *"Windows 8.1"*)
                OS="Windows 8.1"
                ;;

            *"Windows 8"*)
                OS="Windows 8"
                ;;

            *"Windows 7"*)
                OS="Windows 7"
                ;;

            *"Windows Vista"*)
                OS="Windows Vista"
                ;;

            *"Windows XP"*)
                OS="Windows XP"
                ;;

            *"Windows 2000"*)
                OS="Windows 2000"
                ;;

            *"Windows NT"*)
                OS="Windows NT"
                ;;

        esac

        OS_VERSION="$(echo "$WINDOWS_VERSION" | sed -n 's/.*Version \([^)]*\).*/\1/p')"

    fi

fi


# ============================================================
# MACOS / DARWIN
# ============================================================

if [ -z "$OS" ] && [ "$OS_KERNEL" = "Darwin" ]; then

    OS="macOS"
    OS_ID="darwin"
    OS_FAMILY="darwin"
    OS_ENVIRONMENT="macos"

    if [ -x /usr/bin/sw_vers ]; then

        OS_VERSION="$(/usr/bin/sw_vers -productVersion 2>/dev/null)"

    fi

fi


# ============================================================
# BSD
# ============================================================

if [ -z "$OS" ]; then

    case "$OS_KERNEL" in

        FreeBSD)

            OS="FreeBSD"
            OS_ID="freebsd"
            OS_FAMILY="bsd"
            OS_ENVIRONMENT="bsd"
            OS_VERSION="$OS_KERNEL_VERSION"

            ;;

        OpenBSD)

            OS="OpenBSD"
            OS_ID="openbsd"
            OS_FAMILY="bsd"
            OS_ENVIRONMENT="bsd"
            OS_VERSION="$OS_KERNEL_VERSION"

            ;;

        NetBSD)

            OS="NetBSD"
            OS_ID="netbsd"
            OS_FAMILY="bsd"
            OS_ENVIRONMENT="bsd"
            OS_VERSION="$OS_KERNEL_VERSION"

            ;;

        DragonFly)

            OS="DragonFly BSD"
            OS_ID="dragonfly"
            OS_FAMILY="bsd"
            OS_ENVIRONMENT="bsd"
            OS_VERSION="$OS_KERNEL_VERSION"

            ;;

    esac

fi


# ============================================================
# LINUX
# ============================================================

if [ -z "$OS" ] && [ "$OS_KERNEL" = "Linux" ]; then

    OS_ENVIRONMENT="linux"


    # ========================================================
    # /etc/os-release
    # ========================================================

    if [ -s /etc/os-release ] && \
       grep -q '^ID=' /etc/os-release 2>/dev/null; then

        . /etc/os-release

        OS_ID="$ID"
        OS="${NAME:-$ID}"
        OS_VERSION="$VERSION_ID"


        case "$OS_ID" in

            # ------------------------------------------------
            # RED HAT / CENTOS / RHEL
            # ------------------------------------------------

            rhel|redhat|redhatlinux|centos|almalinux|rocky|ol|oracle|oraclelinux|eurolinux|miraclelinux|springdale|scientific|scientificlinux|scientificsl|navy|circle)

                OS_FAMILY="rhel"

                ;;

            # ------------------------------------------------
            # AMAZON
            # ------------------------------------------------

            amzn|amazon|amazonlinux|amazon-linux)

                OS_FAMILY="rhel"

                ;;

            # ------------------------------------------------
            # FEDORA
            # ------------------------------------------------

            fedora|nobara|ultramarine|qubes)

                OS_FAMILY="fedora"

                ;;

            # ------------------------------------------------
            # ARCH
            # ------------------------------------------------

            arch|archlinux|blackarch|artix|manjaro|endeavouros|garuda|cachyos|parabola|rebornos|arcolinux|blendos|rebornos|archcraft|archlabs|anarchy)

                OS_FAMILY="arch"

                ;;

            # ------------------------------------------------
            # DEBIAN
            # ------------------------------------------------

            debian|ubuntu|linuxmint|mint|elementary|pop|pop_os|kali|parrot|mx|deepin|neurodebian|trisquel|pureos|devuan|antix|bodhi|lxle|peppermint|zorin|kubuntu|xubuntu|lubuntu|edubuntu|ubuntustudio|ubuntu-mate|ubuntu-budgie|ubuntu-unity|ubuntu-cinnamon|ubuntu-kylin|raspbian|dietpi|knoppix|gnewsense|musix|osmc|caelinux|vanilla|vanillaos|pardus|endless|endlessos|steamos|crankshaft|librem)

                OS_FAMILY="debian"

                ;;

            # ------------------------------------------------
            # SUSE
            # ------------------------------------------------

            opensuse|opensuse-leap|opensuse-tumbleweed|opensuse-slowroll|sles|sled|suse|aeon|kalpa)

                OS_FAMILY="suse"

                ;;

            # ------------------------------------------------
            # GENTOO
            # ------------------------------------------------

            gentoo|funtoo|calculate|pentoo|redcore|sabayon|ututo)

                OS_FAMILY="gentoo"

                ;;

            # ------------------------------------------------
            # ALPINE
            # ------------------------------------------------

            alpine|wolfi|chainguard)

                OS_FAMILY="alpine"

                ;;

            # ------------------------------------------------
            # SLACKWARE
            # ------------------------------------------------

            slackware|salix|slackel|zenwalk|vectorlinux|absolute)

                OS_FAMILY="slackware"

                ;;

            # ------------------------------------------------
            # VOID
            # ------------------------------------------------

            void|voidlinux)

                OS_FAMILY="void"

                ;;

            # ------------------------------------------------
            # MANDRIVA / MAGEIA
            # ------------------------------------------------

            mageia|mandriva|mandrake|rosa|openmandriva)

                OS_FAMILY="mandriva"

                ;;

            # ------------------------------------------------
            # PCLINUXOS
            # ------------------------------------------------

            pclinuxos)

                OS_FAMILY="pclinuxos"

                ;;

            # ------------------------------------------------
            # NIXOS
            # ------------------------------------------------

            nixos|nix)

                OS_FAMILY="nixos"

                ;;

            # ------------------------------------------------
            # GUIX
            # ------------------------------------------------

            guix)

                OS_FAMILY="guix"

                ;;

            # ------------------------------------------------
            # CLEAR LINUX
            # ------------------------------------------------

            clear-linux-os|clearlinux)

                OS_FAMILY="clearlinux"

                ;;

            # ------------------------------------------------
            # PUPPY
            # ------------------------------------------------

            puppy|puppylinux)

                OS_FAMILY="puppy"

                ;;

            # ------------------------------------------------
            # TINY CORE
            # ------------------------------------------------

            tinycore|tinycorelinux)

                OS_FAMILY="tinycore"

                ;;

            # ------------------------------------------------
            # CRUX
            # ------------------------------------------------

            crux)

                OS_FAMILY="crux"

                ;;

            # ------------------------------------------------
            # KAOS
            # ------------------------------------------------

            kaos)

                OS_FAMILY="kaos"

                ;;

            # ------------------------------------------------
            # CHIMERA
            # ------------------------------------------------

            chimera|chimera-linux)

                OS_FAMILY="chimera"

                ;;

            # ------------------------------------------------
            # CHROME OS
            # ------------------------------------------------

            chromeos|chromiumos|chromium)

                OS_FAMILY="chromeos"

                ;;

            # ------------------------------------------------
            # BAZZITE / UBLUE
            # ------------------------------------------------

            bazzite|ublue|bazzite-arch)

                OS_FAMILY="fedora"

                ;;

            # ------------------------------------------------
            # STEAMOS
            # ------------------------------------------------

            steamos)

                OS_FAMILY="debian"

                ;;

            # ------------------------------------------------
            # GOBOLINUX
            # ------------------------------------------------

            gobo|gobolinux)

                OS_FAMILY="gobo"

                ;;

            # ------------------------------------------------
            # BEDROCK
            # ------------------------------------------------

            bedrock)

                OS_FAMILY="bedrock"

                ;;

            # ------------------------------------------------
            # DRAGORA
            # ------------------------------------------------

            dragora)

                OS_FAMILY="dragora"

                ;;

            # ------------------------------------------------
            # 4MLINUX
            # ------------------------------------------------

            4mlinux)

                OS_FAMILY="4mlinux"

                ;;

            # ------------------------------------------------
            # SLITAZ
            # ------------------------------------------------

            slitaz)

                OS_FAMILY="slitaz"

                ;;

            # ------------------------------------------------
            # FRUGALWARE
            # ------------------------------------------------

            frugalware)

                OS_FAMILY="frugalware"

                ;;

            # ------------------------------------------------
            # OPENWRT / LEDE
            # ------------------------------------------------

            openwrt|lede)

                OS_FAMILY="openwrt"

                ;;

            # ------------------------------------------------
            # PARDUS
            # ------------------------------------------------

            pardus)

                OS_FAMILY="debian"

                ;;

            # ------------------------------------------------
            # 0LINUX
            # ------------------------------------------------

            0linux)

                OS_FAMILY="0linux"

                ;;

            # ------------------------------------------------
            # ALT LINUX
            # ------------------------------------------------

            altlinux|alt)

                OS_FAMILY="altlinux"

                ;;

            # ------------------------------------------------
            # HANNA MONTANA
            # ------------------------------------------------

            hanthana)

                OS_FAMILY="fedora"

                ;;

            # ------------------------------------------------
            # PHRONIX / SPECIAL
            # ------------------------------------------------

            *)

                if [ -n "$ID_LIKE" ]; then

                    case " $ID_LIKE " in

                        *" rhel "*|*" centos "*|*" fedora "*")

                            OS_FAMILY="rhel"

                            ;;

                        *" debian "*|*" ubuntu "*")

                            OS_FAMILY="debian"

                            ;;

                        *" arch "*)

                            OS_FAMILY="arch"

                            ;;

                        *" suse "*)

                            OS_FAMILY="suse"

                            ;;

                        *" gentoo "*)

                            OS_FAMILY="gentoo"

                            ;;

                        *" alpine "*)

                            OS_FAMILY="alpine"

                            ;;

                        *)

                            OS_FAMILY="$OS_ID"

                            ;;

                    esac

                else

                    OS_FAMILY="$OS_ID"

                fi

                ;;

        esac

    fi


    # ========================================================
    # /usr/lib/os-release
    # ========================================================

    if [ -z "$OS_ID" ] && \
       [ -s /usr/lib/os-release ] && \
       grep -q '^ID=' /usr/lib/os-release 2>/dev/null; then

        . /usr/lib/os-release

        OS_ID="$ID"
        OS="${NAME:-$ID}"
        OS_VERSION="$VERSION_ID"

        if [ -n "$ID_LIKE" ]; then

            case " $ID_LIKE " in

                *" rhel "*|*" centos "*|*" fedora "*")
                    OS_FAMILY="rhel"
                    ;;

                *" debian "*|*" ubuntu "*")
                    OS_FAMILY="debian"
                    ;;

                *" arch "*)
                    OS_FAMILY="arch"
                    ;;

                *" suse "*)
                    OS_FAMILY="suse"
                    ;;

                *" gentoo "*)
                    OS_FAMILY="gentoo"
                    ;;

                *)
                    OS_FAMILY="$OS_ID"
                    ;;

            esac

        else

            OS_FAMILY="$OS_ID"

        fi

    fi


    # ========================================================
    # AMAZON LINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/system-release ]; then

        RELEASE="$(cat /etc/system-release 2>/dev/null)"

        case "$RELEASE" in

            Amazon\ Linux*)

                OS="Amazon Linux"
                OS_ID="amzn"
                OS_FAMILY="rhel"

                OS_VERSION="$(echo "$RELEASE" | \
                    sed 's/^.*release //;s/ (.*$//')"

                ;;

        esac

    fi


    # ========================================================
    # CENTOS
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/centos-release ]; then

        RELEASE_FILE="$(readlink -f /etc/centos-release 2>/dev/null)"

        if [ -n "$RELEASE_FILE" ] && [ -f "$RELEASE_FILE" ]; then

            RELEASE="$(cat "$RELEASE_FILE" 2>/dev/null)"

            case "$RELEASE" in

                CentOS*)

                    OS="CentOS"
                    OS_ID="centos"
                    OS_FAMILY="rhel"

                    OS_VERSION="$(echo "$RELEASE" | \
                        sed 's/^.*release //;s/ (.*$//')"

                    ;;

            esac

        fi

    fi


    # ========================================================
    # RHEL
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/redhat-release ]; then

        RELEASE="$(cat /etc/redhat-release 2>/dev/null)"

        case "$RELEASE" in

            Red\ Hat\ Enterprise\ Linux*)

                OS="Red Hat Enterprise Linux"
                OS_ID="rhel"
                OS_FAMILY="rhel"

                OS_VERSION="$(echo "$RELEASE" | \
                    sed 's/^.*release //;s/ (.*$//')"

                ;;

        esac

    fi


    # ========================================================
    # ALMALINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/almalinux-release ]; then

        OS="AlmaLinux"
        OS_ID="almalinux"
        OS_FAMILY="rhel"

        OS_VERSION="$(cat /etc/almalinux-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # ROCKY
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/rocky-release ]; then

        OS="Rocky Linux"
        OS_ID="rocky"
        OS_FAMILY="rhel"

        OS_VERSION="$(cat /etc/rocky-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # ORACLE LINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/oracle-release ]; then

        OS="Oracle Linux"
        OS_ID="ol"
        OS_FAMILY="rhel"

        OS_VERSION="$(cat /etc/oracle-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # SCIENTIFIC LINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/sl-release ]; then

        OS="Scientific Linux"
        OS_ID="scientific"
        OS_FAMILY="rhel"

        OS_VERSION="$(cat /etc/sl-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # DEBIAN
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/debian_version ]; then

        OS="Debian"
        OS_ID="debian"
        OS_FAMILY="debian"

        OS_VERSION="$(cat /etc/debian_version 2>/dev/null)"

    fi


    # ========================================================
    # LSB
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/lsb-release ]; then

        LSB_ID="$(sed -n 's/^DISTRIB_ID=//p' /etc/lsb-release)"
        LSB_VERSION="$(sed -n 's/^DISTRIB_RELEASE=//p' /etc/lsb-release)"

        if [ -n "$LSB_ID" ]; then

            OS="$LSB_ID"
            OS_ID="$(echo "$LSB_ID" | \
                tr '[:upper:]' '[:lower:]' | tr ' ' '-')"

            OS_VERSION="$LSB_VERSION"
            OS_FAMILY="debian"

        fi

    fi


    # ========================================================
    # FEDORA
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/fedora-release ]; then

        OS="Fedora"
        OS_ID="fedora"
        OS_FAMILY="fedora"

        OS_VERSION="$(cat /etc/fedora-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # ALPINE
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/alpine-release ]; then

        OS="Alpine Linux"
        OS_ID="alpine"
        OS_FAMILY="alpine"

        OS_VERSION="$(cat /etc/alpine-release 2>/dev/null)"

    fi


    # ========================================================
    # ARCH
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/arch-release ]; then

        OS="Arch Linux"
        OS_ID="arch"
        OS_FAMILY="arch"
        OS_VERSION="rolling"

    fi


    # ========================================================
    # GENTOO
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/gentoo-release ]; then

        OS="Gentoo"
        OS_ID="gentoo"
        OS_FAMILY="gentoo"

        OS_VERSION="$(cat /etc/gentoo-release 2>/dev/null | \
            sed 's/^.*release //')"

    fi


    # ========================================================
    # FUNTOO
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/funtoo-release ]; then

        OS="Funtoo"
        OS_ID="funtoo"
        OS_FAMILY="gentoo"

        OS_VERSION="$(cat /etc/funtoo-release 2>/dev/null)"

    fi


    # ========================================================
    # SLACKWARE
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/slackware-version ]; then

        OS="Slackware"
        OS_ID="slackware"
        OS_FAMILY="slackware"

        OS_VERSION="$(cat /etc/slackware-version 2>/dev/null | \
            sed 's/^Slackware //')"

    fi


    # ========================================================
    # SUSE ANCIEN
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/SuSE-release ]; then

        OS="SUSE"
        OS_ID="suse"
        OS_FAMILY="suse"

        OS_VERSION="$(sed -n 's/^VERSION = //p' \
            /etc/SuSE-release | head -n 1)"

    fi


    # ========================================================
    # MAGEIA
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/mageia-release ]; then

        OS="Mageia"
        OS_ID="mageia"
        OS_FAMILY="mandriva"

        OS_VERSION="$(cat /etc/mageia-release 2>/dev/null | \
            sed 's/^.*release //;s/ (.*$//')"

    fi


    # ========================================================
    # VOID
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/void-release ]; then

        OS="Void Linux"
        OS_ID="void"
        OS_FAMILY="void"
        OS_VERSION="rolling"

    fi


    # ========================================================
    # PUPPY LINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/DISTRO_SPECS ]; then

        if grep -q '^DISTRO_NAME=' /etc/DISTRO_SPECS 2>/dev/null; then

            OS="$(sed -n 's/^DISTRO_NAME=//p' /etc/DISTRO_SPECS)"
            OS_ID="puppy"
            OS_FAMILY="puppy"

            OS_VERSION="$(sed -n \
                's/^DISTRO_VERSION=//p' /etc/DISTRO_SPECS)"

        fi

    fi


    # ========================================================
    # TINY CORE
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/tc-version ]; then

        OS="Tiny Core Linux"
        OS_ID="tinycore"
        OS_FAMILY="tinycore"

        OS_VERSION="$(cat /etc/tc-version 2>/dev/null)"

    fi


    # ========================================================
    # NIXOS
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/NIXOS ]; then

        OS="NixOS"
        OS_ID="nixos"
        OS_FAMILY="nixos"

    fi


    # ========================================================
    # 0LINUX
    # ========================================================

    if [ -z "$OS_ID" ]; then

        if [ -f /etc/0linux-release ] || \
           [ -f /etc/0linux-version ] || \
           [ -f /etc/0linux_version ] || \
           [ -d /etc/0linux ]; then

            OS="0Linux"
            OS_ID="0linux"
            OS_FAMILY="0linux"

            if [ -f /etc/0linux-release ]; then

                OS_VERSION="$(cat /etc/0linux-release 2>/dev/null)"

            elif [ -f /etc/0linux-version ]; then

                OS_VERSION="$(cat /etc/0linux-version 2>/dev/null)"

            elif [ -f /etc/0linux_version ]; then

                OS_VERSION="$(cat /etc/0linux_version 2>/dev/null)"

            fi

        fi

    fi


    # ========================================================
    # OPENWRT
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/openwrt_release ]; then

        OS="OpenWrt"
        OS_ID="openwrt"
        OS_FAMILY="openwrt"

        OS_VERSION="$(sed -n \
            "s/^DISTRIB_RELEASE='\(.*\)'/\1/p" \
            /etc/openwrt_release)"

    fi


    # ========================================================
    # CRUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/issue ]; then

        if grep -qi '^CRUX' /etc/issue 2>/dev/null; then

            OS="CRUX"
            OS_ID="crux"
            OS_FAMILY="crux"

            OS_VERSION="$(sed -n \
                's/^CRUX *//Ip' /etc/issue | head -n 1)"

        fi

    fi


    # ========================================================
    # SLITAZ
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/slitaz-release ]; then

        OS="SliTaz"
        OS_ID="slitaz"
        OS_FAMILY="slitaz"

        OS_VERSION="$(cat /etc/slitaz-release 2>/dev/null)"

    fi


    # ========================================================
    # FRUGALWARE
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/frugalware-release ]; then

        OS="Frugalware"
        OS_ID="frugalware"
        OS_FAMILY="frugalware"

        OS_VERSION="$(cat /etc/frugalware-release 2>/dev/null)"

    fi


    # ========================================================
    # KNOPPIX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/knoppix_version ]; then

        OS="KNOPPIX"
        OS_ID="knoppix"
        OS_FAMILY="debian"

        OS_VERSION="$(cat /etc/knoppix_version 2>/dev/null)"

    fi


    # ========================================================
    # RASPBIAN
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /etc/rpi-issue ]; then

        OS="Raspbian"
        OS_ID="raspbian"
        OS_FAMILY="debian"

        OS_VERSION="$(cat /etc/rpi-issue 2>/dev/null)"

    fi


    # ========================================================
    # DIETPI
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /boot/dietpi/.version ]; then

        OS="DietPi"
        OS_ID="dietpi"
        OS_FAMILY="debian"

        OS_VERSION="$(sed -n \
            's/^VER=\(.*\)/\1/p' /boot/dietpi/.version)"

    fi


    # ========================================================
    # BEDROCK
    # ========================================================

    if [ -z "$OS_ID" ] && \
       [ -f /bedrock/etc/bedrock-release ]; then

        OS="Bedrock Linux"
        OS_ID="bedrock"
        OS_FAMILY="bedrock"

        OS_VERSION="$(cat \
            /bedrock/etc/bedrock-release 2>/dev/null)"

    fi


    # ========================================================
    # GOBOLINUX
    # ========================================================

    if [ -z "$OS_ID" ] && [ -f /System/Settings/Version ]; then

        OS="GoboLinux"
        OS_ID="gobo"
        OS_FAMILY="gobo"

        OS_VERSION="$(cat \
            /System/Settings/Version 2>/dev/null)"

    fi


    # ========================================================
    # GENERIC RELEASE FILE
    #
    # Dernier filet de sécurité pour les distributions
    # historiques qui ne sont pas encore présentes dans
    # notre table de signatures.
    # ========================================================

    if [ -z "$OS_ID" ]; then

        for RELEASE_FILE in \
            /etc/*-release \
            /etc/*_release \
            /etc/*-version \
            /etc/*_version
        do

            if [ ! -f "$RELEASE_FILE" ]; then
                continue
            fi

            case "$RELEASE_FILE" in

                /etc/os-release)
                    continue
                    ;;

                /etc/system-release)
                    continue
                    ;;

                /etc/redhat-release)
                    continue
                    ;;

                /etc/centos-release)
                    continue
                    ;;

                /etc/almalinux-release)
                    continue
                    ;;

                /etc/rocky-release)
                    continue
                    ;;

                /etc/oracle-release)
                    continue
                    ;;

                /etc/sl-release)
                    continue
                    ;;

                /etc/fedora-release)
                    continue
                    ;;

                /etc/debian_version)
                    continue
                    ;;

                /etc/lsb-release)
                    continue
                    ;;

                /etc/alpine-release)
                    continue
                    ;;

                /etc/arch-release)
                    continue
                    ;;

                /etc/gentoo-release)
                    continue
                    ;;

                /etc/funtoo-release)
                    continue
                    ;;

                /etc/slackware-version)
                    continue
                    ;;

                /etc/SuSE-release)
                    continue
                    ;;

                /etc/mageia-release)
                    continue
                    ;;

                /etc/void-release)
                    continue
                    ;;

            esac


            RELEASE_TEXT="$(head -n 1 "$RELEASE_FILE" 2>/dev/null)"

            if [ -n "$RELEASE_TEXT" ]; then

                OS="Linux"
                OS_ID="$(basename "$RELEASE_FILE")"

                OS_ID="${OS_ID%-release}"
                OS_ID="${OS_ID%_release}"
                OS_ID="${OS_ID%-version}"
                OS_ID="${OS_ID%_version}"

                OS_FAMILY="linux"
                OS_VERSION="$RELEASE_TEXT"

                break

            fi

        done

    fi


    # ========================================================
    # FALLBACK
    # ========================================================

    if [ -z "$OS_ID" ]; then

        OS="Linux"
        OS_ID="linux"
        OS_FAMILY="linux"

    fi

fi


# ============================================================
# VERSION PARSING
# ============================================================

if [ -n "$OS_VERSION" ] && \
   [ "$OS_VERSION" != "rolling" ]; then

    OS_MAJOR="${OS_VERSION%%.*}"

    OS_TMP="${OS_VERSION#*.}"

    if [ "$OS_TMP" != "$OS_VERSION" ]; then

        OS_MINOR="${OS_TMP%%.*}"

    fi

    OS_TMP="${OS_TMP#*.}"

    if [ -n "$OS_TMP" ] && \
       [ "$OS_TMP" != "$OS_VERSION" ]; then

        OS_PATCH="${OS_TMP%%.*}"

    fi

fi


# ============================================================
# UNKNOWN
# ============================================================

if [ -z "$OS" ]; then

    OS="Unknown"
    OS_ID="unknown"
    OS_FAMILY="unknown"
    OS_ENVIRONMENT="unknown"

fi


# ============================================================
# EXPORT
# ============================================================

export OS
export OS_ID
export OS_VERSION
export OS_MAJOR
export OS_MINOR
export OS_PATCH
export OS_FAMILY
export OS_KERNEL
export OS_KERNEL_VERSION
export OS_ARCH
export OS_ENVIRONMENT
