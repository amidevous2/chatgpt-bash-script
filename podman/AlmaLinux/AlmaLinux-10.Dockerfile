#AlmaLinux-10.Dockerfile
#commit=8e309e83a8ce8a1f750c122e8b9fcce4925461f5
FROM almalinux/10-minimal:10.2 


RUN dnf -y remove coreutils-single
RUN dnf -y update
    dnf -y update && \
    dnf -y install bash curl wget @core && \
    dnf -y install epel-release && \
    dnf -y install update && \
    /usr/bin/crb enable && \
    dnf -y install update && \
    dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm && \
    dnf -y install update && \
    dnf install -y https://rpms.remirepo.net/enterprise/remi-release-10.rpm && \
    dnf clean all

CMD ["/bin/bash"] 
####
