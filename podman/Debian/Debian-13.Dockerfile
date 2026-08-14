#Debian-13.Dockerfile
FROM debian:13

# install Debian Core + debian-minimal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl adduser apt && \
    apt-get install -y bsdutils chrony console-setup && \
    apt-get install -y debconf debconf-i18n dhcpcd-base e2fsprogs eject && \
    apt-get install -y iproute2 iputils-ping kbd kmod less locales login && \
    apt-get install -y lsb-release mawk mount netbase netcat-openbsd netplan.io && \
    apt-get install -y passwd python3 procps sensible-utils sudo sudo-rs tzdata && \
    apt-get install -y debian-keyring udev vim-tiny && \
    apt-get -y install vim-tiny whiptail rsyslog ssh net-tools && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

# c'est les mêmepacquet ubuntu-minimal juste ont remplace ubuntu-keyrring par debian-keyring et ont enlévé ubuntu-pro-client

# https://packages.ubuntu.com/resolute/ubuntu-minimal
