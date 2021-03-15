FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get install git cmake make build-essential libssl-dev sqlite3 libsqlite3-dev libevent-dev libpq-dev mysql-client libmysqlclient-dev libhiredis-dev pkgconf libsystemd-dev libboost-all-dev gdebi-core -y

RUN mkdir work && cd work && git clone https://github.com/coturn/coturn.git 

RUN ./work/coturn/configure

RUN mv /Makefile /work/coturn/Makefile

RUN cd ./work/coturn/ && cat Makefile.in >> Makefile

RUN cd /work/coturn/ && ls -la

RUN ls -la

RUN cd /work/coturn/ && make install

RUN turnserver

#RUN cat /work/coturn/Makefile.in

