# docker build --no-cache -t casadocker/ltc:18.01.06 .
# docker run --name ltc -d casadocker/ltc:18.01.06

FROM ubuntu:16.04

ENV LITECOIN_VERSION=0.14.2
RUN curl -O https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
      && curl https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-linux-signatures.asc | gpg --verify - \
      && tar --strip=2 -xzf *.tar.gz -C /usr/local/bin \
      && rm *.tar.gz

EXPOSE 9332 9333 19332 19333 19444

CMD ["litecoind"]
