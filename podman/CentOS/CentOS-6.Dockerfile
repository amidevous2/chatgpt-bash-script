# CentOS-6.Dockerfile
FROM centos:6
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|mirrorlist|#mirrorlist|g' -e 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' {} +
RUN yum -y update
RUN yum -y install bash curl wget @core
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install update
RUN yum -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm
RUN yum -y install update
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-6.rpm
RUN yum clean all

CMD ["/bin/bash"]



