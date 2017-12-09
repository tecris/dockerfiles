# docker build --no-cache -t casadocker/chc:17.12.10 .
# docker run --name chc -d casadocker/chc:17.12.10

FROM ubuntu:16.04

# supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && \
    apt-get install -y automake libdb++-dev build-essential libtool \
    autotools-dev autoconf pkg-config libssl-dev libboost-all-dev  \
    libminiupnpc-dev git software-properties-common  \
    python-software-properties g++ bsdmainutils libevent-dev && \
    apt-add-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y libdb4.8-dev libdb4.8++-dev -y

RUN git clone https://github.com/chaincoin/chaincoin.git

RUN cd chaincoin && \
  ./autogen.sh && \
  ./configure -without-gui && \
  make && \
  make install

RUN mkdir /root/.chaincoin/
RUN echo rpcuser=chaincoinrpc >> /root/.chaincoin/chaincoin.conf
RUN echo rpcpassword=GpqCe3D8MBub8HNANVrqprfAMFBkmYW35t2faExoj16o >> /root/.chaincoin/chaincoin.conf

CMD ["/usr/bin/supervisord"]
