# RabbitMQ
#
# VERSION               0.1

FROM ubuntu:latest
MAINTAINER Werner R. Mendizabal "werner.mendizabal@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y wget

RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN apt-key add rabbitmq-signing-key-public.asc

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y rabbitmq-server

EXPOSE 4369 5672 15672

CMD rabbitmq-server
