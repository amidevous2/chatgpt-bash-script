#AlmaLinux-10.Dockerfile
#commit=8e309e83a8ce8a1f750c122e8b9fcce4925461f5
FROM almalinux/10-minimal:10.2 


RUN dnf -y remove coreutils-single
RUN dnf -y update
RUN dnf -y install bash curl wget @core
RUN dnf -y install epel-release
RUN dnf -y install update
RUN /usr/bin/crb enable
RUN dnf -y install update
RUN dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm
RUN dnf -y install update
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-10.rpm
RUN dnf clean all


CMD ["/bin/bash"] 
####
