FROM ubuntu:20.04

ENV BUILD_PREFIX /usr/local/src
ENV COTURN_VERSION 4.5.2-2

# Install build dependencies for Coturn & checkinstall
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
    apt-get install -y build-essential git debhelper dpkg-dev pkg-config libssl-dev libevent-dev sqlite3 libsqlite3-dev postgresql-client libpq-dev default-mysql-client default-libmysqlclient-dev libhiredis-dev libmongoc-dev libbson-dev libsystemd-dev \
    checkinstall automake autoconf libtool libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev

# Copy Coturn
WORKDIR ${BUILD_PREFIX}
COPY coturn-debian-${COTURN_VERSION} /${BUILD_PREFIX}/coturn

# Build Coturn
WORKDIR ${BUILD_PREFIX}/coturn
RUN ./configure
RUN make
RUN checkinstall -y --pkgversion ${COTURN_VERSION} -D
RUN ls -la
