FROM ubuntu:18.04

# download dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y \
    gcc g++ python libglib2.0-0 libglib2.0-dev libigraph0v5 libigraph0-dev cmake make xz-utils \
    libc-dbg \
    python-matplotlib python-numpy python-scipy python-networkx python-lxml \
    dstat screen htop \
    curl

# set some configs (for running large simulations)
RUN echo "* soft nofile 25000" >> /etc/security/limits.conf && \
    echo "* hard nofile 25000" >> /etc/security/limits.conf && \
    echo "vm.max_map_count = 262144" >> /etc/sysctl.conf && \
    echo "fs.file-max = 5000000" >> /etc/sysctl.conf

# set path
RUN echo "export PATH=${PATH}:/root/.shadow/bin" >> ~/.bashrc

# download shadow
WORKDIR /root
RUN mkdir shadow && \
    curl -sfL 'https://github.com/shadow/shadow/archive/v1.13.0.tar.gz' | \
        tar xvz -C shadow --strip-components 1

# install shadow
RUN cd shadow && \
    ./setup build --clean --debug --test && \
    ./setup install
