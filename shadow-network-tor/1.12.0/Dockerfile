FROM unibgseclab/shadow-network:1.12.1

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && \
    apt-get install -y gcc automake autoconf zlib1g zlib1g-dev liblzma5 liblzma-dev

RUN mkdir shadow-plugin-tor && \
    curl -sfL 'https://github.com/shadow/shadow-plugin-tor/archive/v1.12.0.tar.gz' | \
        tar xvz -C shadow-plugin-tor --strip-components 1

RUN cd shadow-plugin-tor && \
    ./setup dependencies -y

COPY tor-0.3.0.10.tar.gz /root/shadow-plugin-tor/build/

RUN cd shadow-plugin-tor && \
    ./setup build && \
    ./setup install
