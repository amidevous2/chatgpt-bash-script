#Fedora-43.Dockerfile
FROM fedora:43
RUN dnf -y update && \
    dnf -y install bash curl wget @core && \
    dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-43.noarch.rpm \
                   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-43.noarch.rpm && \
    dnf install -y https://rpms.remirepo.net/fedora/remi-release-43.rpm && \
    dnf clean all

CMD ["/bin/bash"]
