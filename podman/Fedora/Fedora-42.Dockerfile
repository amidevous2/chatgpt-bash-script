#Fedora-42.Dockerfile
FROM fedora:42
RUN dnf -y update && \
    dnf -y install bash curl wget @core && \
    dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf install -y https://rpms.remirepo.net/fedora/remi-release-$(rpm -E %fedora).rpm && \
    dnf clean all

CMD ["/bin/bash"]
