# AlmaLinux-8.Dockerfile
FROM CentOS:7
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i \
    -e 's|mirrorlist|#mirrorlist|g' \
    -e 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' \
    {} +
RUN yum -y update && \
    yum -y install bash curl wget @core && \
    yum -y install epel-release && \
    yum -y update && \
    /usr/bin/crb enable" && \
    yum -y update && \
    yum install dnf dnf-plugins-core -y && \
    yum config-manager --set-enabled powertools && \
    yum config-manager --set-enabled PowerTools && \    dnf -y install update && \
    dnf -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm && \
    dnf -y install update && \
    dnf install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    dnf clean all

CMD ["/bin/bash"]
