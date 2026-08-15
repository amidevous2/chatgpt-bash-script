#AlmaLinux-10.Dockerfile
#commit=86cbb1facf4dd2de8e27ae856641834cb9cbdc0186cbb1facf4dd2de8e27ae856641834cb9cbdc01
FROM docker.io/library/almalinux:10.2
RUN dnf -y swap coreutils-single coreutils
RUN dnf -y update
RUN dnf -y install bash curl wget @core
RUN dnf -y install epel-release
RUN /usr/bin/crb enable
RUN dnf -y install \
    https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm
RUN dnf -y install \
    https://rpms.remirepo.net/enterprise/remi-release-10.rpm
RUN dnf clean all

CMD ["/bin/bash"]
####
