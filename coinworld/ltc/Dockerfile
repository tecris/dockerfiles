# docker build --no-cache -t casadocker/ltc:18.01.06 .
# docker run --name ltc -d casadocker/ltc:18.01.06
# docker run -d --name ltc --rm casadocker/ltc:18.01.06 litecoind -rpcpassword=bar -rpcuser=foo
# docker run -d --name ltc --rm casadocker/ltc:18.01.06 litecoind -regtest=1 -rpcpassword=bar -rpcuser=foo
# docker deploy --compose-file docker-compose.yml


FROM ubuntu:16.04

ENV LITECOIN_VERSION=0.14.2

RUN useradd -r litecoin \
  && apt-get update -y \
  && apt-get install -y curl gnupg \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && set -ex \
  && for key in \
    B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    FE3348877809386C \
  ; do \
    gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
    gpg --keyserver keyserver.pgp.com --recv-keys "$key" || \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ; \
done

RUN curl -O https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
      && curl https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-linux-signatures.asc | gpg --verify - \
      && tar --strip=2 -xzf *.tar.gz -C /usr/local/bin \
      && rm *.tar.gz

EXPOSE 9332 9333 19332 19333 19444

CMD ["litecoind"]
