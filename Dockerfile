FROM ubuntu:20.04

ENV BUILD_PREFIX /usr/local/src

# Install build dependencies for Coturn & checkinstall
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
    apt-get install -y build-essential git debhelper dpkg-dev pkg-config libssl-dev libevent-dev sqlite3 libsqlite3-dev postgresql-client libpq-dev default-mysql-client default-libmysqlclient-dev libhiredis-dev libmongoc-dev libbson-dev libsystemd-dev \
    checkinstall automake autoconf libtool libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev

# Copy Coturn
WORKDIR ${BUILD_PREFIX}
COPY coturn-4.5.2 /${BUILD_PREFIX}/coturn

# Build Coturn
WORKDIR ${BUILD_PREFIX}/coturn
RUN ./configure
RUN make

