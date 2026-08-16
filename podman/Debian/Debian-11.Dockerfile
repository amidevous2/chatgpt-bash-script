#Debian-11.Dockerfile
FROM debian:11

# install Debian Core + debian-minimal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y curl adduser apt 
RUN apt-get install -y bsdutils chrony console-setup 
RUN apt-get install -y debconf debconf-i18n dhcpcd-base e2fsprogs eject 
RUN apt-get install -y iproute2 iputils-ping kbd kmod less locales login 
RUN apt-get install -y lsb-release mawk mount netbase netcat-openbsd netplan.io 
RUN apt-get install -y passwd python3 procps sensible-utils sudo sudo-rs tzdata 
RUN apt-get install -y debian-keyring udev vim-tiny 
RUN apt-get -y install vim-tiny whiptail rsyslog ssh net-tools 
RUN apt-get dist-upgrade -y 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

# c'est les mêmepacquet ubuntu-minimal juste ont remplace ubuntu-keyrring par debian-keyring et ont enlévé ubuntu-pro-client

# https://packages.ubuntu.com/resolute/ubuntu-minimal
