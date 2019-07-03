# Dockerfile for running EOS node from binary packages under docker
# Jetcrypto

FROM ubuntu:18.04

# Latest versions at: https://github.com/EOSIO/eos/releases/latest
ARG EOS_DEB_URI=https://github.com/EOSIO/eos/releases/download/v1.8.0/eosio_1.8.0-1-ubuntu-18.04_amd64.deb
ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget \
	&& wget -qO eosio.deb "$EOS_DEB_URI" \
	&& apt-get -y install --no-install-recommends ./eosio.deb \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge -y --auto-remove ca-certificates wget

ENV EOSIO_ROOT=/opt/eosio
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH /opt/eosio/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY ./bin /usr/local/bin

VOLUME /opt/eosio/config
VOLUME /opt/eosio/data

EXPOSE 8888
EXPOSE 9876

ENTRYPOINT ["entrypoint.sh"]