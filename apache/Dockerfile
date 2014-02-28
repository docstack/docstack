# apache
#
# VERSION               0.1

FROM ubuntu:12.04
MAINTAINER Werner R. Mendizabal "werner.mendizabal@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y apache2

CMD service apache2 start && tail -F /var/log/apache2/access.log -F /var/log/apache2/error.log
