# CentOS-6.Dockerfile
FROM docker.io/i386/centos:6
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|mirrorlist|#mirrorlist|g' -e 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' {} +
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|$basearch|i386|g' {} +
RUN yum -y update
RUN yum -y install bash curl wget @core
RUN yum -y install epel-release
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|$basearch|i386|g' {} +
RUN yum -y update
RUN yum -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|$basearch|i386|g' {} +
RUN yum -y update
RUN yum install -y https://rpms.remirepo.net/archives/enterprise/6/remi/x86_64/remi-release-6.10-2.el6.remi.noarch.rpm
RUN find /etc/yum.repos.d/ -type f -name "*.repo" -exec sed -i -e 's|$basearch|i386|g' {} +
RUN yum -y update
RUN cp /bin/uname /bin/uname.org
RUN cat > /bin/uname <<EOF
#!/bin/bash
if [[ "$1" == "-m" ]]; then
echo "i686"
exit 0
else
/bin/uname.org '$@"
exit 0
fi
EOF
RUN chmod +x /bin/uname 
RUN yum clean all
CMD ["/bin/bash"]
