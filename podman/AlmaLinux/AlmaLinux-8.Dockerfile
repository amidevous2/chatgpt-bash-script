# AlmaLinux-8.Dockerfile
FROM almalinux:8

# install AlmaLinux Core + activate repo EPEL and Remi (for php)

RUN yum -y update && \
    yum -y install bash curl wget @core && \
    yum -y install epel-release && \
    yum -y update && \
    /usr/bin/crb enable" && \
    yum -y update && \
    yum install dnf dnf-plugins-core -y && \
    yum config-manager --set-enabled powertools && \
    yum config-manager --set-enabled PowerTools && \    dnf -y install update && \
    dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm && \
    dnf -y install update && \
    dnf install -y https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm && \
    dnf clean all

CMD ["/bin/bash"]
