#AlmaLinux-9.Dockerfile
FROM docker.io/library/almalinux:9

RUN dnf -y swap coreutils-single coreutils
RUN dnf -y swap curl-minimal curl
RUN dnf -y update
RUN dnf -y install bash curl wget @core
RUN dnf -y install epel-release
RUN dnf -y update
RUN /usr/bin/crb enable
RUN dnf -y update
RUN dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-9.noarch.rpm
RUN dnf -y install update
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
RUN dnf clean all

CMD ["/bin/bash"]
