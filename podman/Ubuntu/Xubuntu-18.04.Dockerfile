#Xubuntu-18.04.Dockerfile
FROM ubuntu:18.04

# install Xubuntu Desktop 18.04

# met les autre Xubuntu aussi

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install xubuntu-desktop x2goserver ssh net-tools && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
