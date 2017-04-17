# Kafka Dockerfile
#
# 1) Build an image using this docker file. Run the following docker command
#
#    $ docker build -f kafka.dockerfile -t bde2020/pilot-sc4-kafka:v0.0.1 .
#
# 2) Start a container
#
#    $ docker run -it --network pilot-sc4-net --name kafka bde2020/pilot-sc4-kafka:v0.0.1


FROM java:8

MAINTAINER Luigi Selmi <luigiselmi@gmail.com>

ENV SCALA_VERSION=2.12 \
    KAFKA_VERSION=0.10.2.0 \
    KAFKA_BROKER_PORT=9092 \
    KAFKA_HOME=/opt/kafka \
    KAFKA_LOGS=/opt/data/kafka

EXPOSE $KAFKA_BROKER_PORT

RUN apt-get update && apt-get install -y vim && \
    wget http://mirror.23media.de/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
    tar xvf kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
    rm kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
    mv kafka_$SCALA_VERSION-$KAFKA_VERSION $KAFKA_HOME

