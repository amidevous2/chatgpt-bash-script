#Fedora-44.Dockerfile
FROM fedora:44
RUN dnf -y update && \
    dnf -y install bash curl wget @core && \
    dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-44.noarch.rpm \
                   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-44.noarch.rpm && \
    dnf install -y https://rpms.remirepo.net/fedora/remi-release-44.rpm && \
    dnf clean all

CMD ["/bin/bash"]
