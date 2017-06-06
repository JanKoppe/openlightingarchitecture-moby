FROM alpine:3.5
LABEL MAINTAINER J. Koppe <post@jankoppe.de>
RUN apk add --no-cache --virtual .build-deps\
      automake \
      autoconf \
      bison \
      ccache \
      cppunit \
      cppunit-dev \
      g++ \
      git \
      libtool \
      libmicrohttpd-dev \
      linux-headers \
      make \
      ncurses-dev \
      protobuf-dev \
      py-pip \
      util-linux-dev \
      && apk add --no-cache --virtual .runtime-deps \
      flex \
      libmicrohttpd \
      ncurses \
      protobuf \
      util-linux \
      && pip install --no-cache-dir protobuf==3.1.0 \
      && git clone https://github.com/OpenLightingProject/ola.git --depth 1 -b 0.10.4 ola \
      && cd ola \
      && autoreconf -i \
      && ./configure \
      && make && make install \
      && cd / \
      && rm -rf /ola \
      && apk del .build-deps

EXPOSE 9090
EXPOSE 9010
RUN adduser -S olad
USER olad
CMD ["olad"]
