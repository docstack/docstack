# postgres
#
# VERSION               1.0

FROM ubuntu:latest
MAINTAINER Werner R. Mendizabal "werner.mendizabal@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y postgresql postgresql-client

RUN sed -i "s/#listen_addresses.*/listen_addresses = '*'/g" /etc/postgresql/9.1/main/postgresql.conf

RUN echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.1/main/pg_hba.conf

EXPOSE 5432

ONBUILD ADD data.sql data.sql
ONBUILD RUN service postgresql start && su -c "psql -f data.sql" -s /bin/sh postgres
ONBUILD CMD service postgresql start && tail -f /var/log/postgresql/postgresql-9.1-main.log
