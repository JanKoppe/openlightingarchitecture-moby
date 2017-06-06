FROM alpine:3.5
LABEL MAINTAINER J. Koppe <post@jankoppe.de>
RUN apk add --no-cache \
      automake \
      autoconf \
      bison \
      ccache \
      cppunit \
      cppunit-dev \
      flex \
      g++ \
      git \
      libtool \
      libmicrohttpd \
      libmicrohttpd-dev \
      linux-headers \
      make \
      ncurses \
      ncurses-dev \
      protobuf \
      protobuf-dev \
      py-pip \
      util-linux \
      util-linux-dev \
      && pip install protobuf==3.1.0 \
      && git clone https://github.com/OpenLightingProject/ola.git --depth 1 -b 0.10.4 ola \
      && cd ola \
      && autoreconf -i \
      && ./configure \
      && make && make install

EXPOSE 9090
EXPOSE 9010
RUN adduser -S olad
USER olad
CMD ["olad"]
