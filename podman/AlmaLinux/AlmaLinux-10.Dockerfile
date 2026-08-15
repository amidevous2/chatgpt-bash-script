#AlmaLinux-10.Dockerfile
FROM almalinux/10-minimal:10.2

# install AlmaLinux Core + activate repo EPEL and Remi (for php)

RUN dnf -y update && \
    dnf -y install bash curl wget @core && \
    dnf -y install epel-release && \
    dnf -y install update && \
    /usr/bin/crb enable && \
    dnf -y install update && \
    dnf -y remove coreutils-single && \
    dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm && \
    dnf -y install update && \
    dnf install -y https://rpms.remirepo.net/enterprise/remi-release-10.rpm && \
    dnf clean all

CMD ["/bin/bash"] 
###
