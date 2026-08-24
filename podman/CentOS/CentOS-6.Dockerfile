# CentOS-6.Dockerfile
FROM CentOS:6
RUN find /etc/yum.repos.d/ -type f -name "*CentOS.repo" -exec sed -i \
    -e 's|mirrorlist|#mirrorlist|g' \
    -e 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' \
    {} +
RUN yum -y update && \
    yum -y install bash curl wget @core && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y install update && \
    yum -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm && \
    yum -y install update && \
    yum install -y https://rpms.remirepo.net/enterprise/remi-release-6.rpm && \
    yum clean all

CMD ["/bin/bash"]
