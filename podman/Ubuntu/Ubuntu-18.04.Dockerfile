FROM ubuntu:18.04

# install Ubuntu Core + ubuntu-minimal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl ubuntu-minimal net-tools ssh && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
