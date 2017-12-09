# docker build --no-cache -t casadocker/chc-mn:17.12.09 .
# chaincoind -daemon

FROM ubuntu:16.04

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
