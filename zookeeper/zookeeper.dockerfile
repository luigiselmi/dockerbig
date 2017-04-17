# Zookeeper Dockerfile
#
# 1) Build an image using this docker file. Run the following docker command
#
#    $ docker build -f zookeeper.dockerfile -t bde2020/pilot-sc4-zookeeper:v0.0.1 .
#
# 2) Start a container
#
#    $ docker run -it --network pilot-sc4 --name zookeeper bde2020/pilot-sc4-zookeeper:v0.0.1


FROM java:8

MAINTAINER Luigi Selmi <luigiselmi@gmail.com>

ENV ZOO_VERSION=3.4.9 \
    ZOO_PORT=2181 \
    ZOO_PEERS_PORT=2888 \
    ZOO_LEADER_PORT=3888 \
    ZOO_HOME=/opt/zookeeper \
    ZOO_DATA_DIR=/opt/data/zookeeper

EXPOSE $ZOO_PORT $ZOO_PEERS_PORT $ZOO_LEADER_PORT

RUN apt-get update && apt-get install -y vim && \
    wget http://apache.mirror.iphh.net/zookeeper/zookeeper-$ZOO_VERSION/zookeeper-$ZOO_VERSION.tar.gz && \
    tar xvf zookeeper-$ZOO_VERSION.tar.gz && \
    rm zookeeper-$ZOO_VERSION.tar.gz && \
    mv zookeeper-$ZOO_VERSION $ZOO_HOME

ADD ./frameworks/zookeeper/conf/zoo.cfg $ZOO_HOME/conf/zoo.cfg

ADD zookeeper_entrypoint.sh $ZOO_HOME
RUN chmod +x $ZOO_HOME/zookeeper_entrypoint.sh

ENV PATH=$PATH:$ZOO_HOME/bin 
    
ENTRYPOINT ["zookeeper_entrypoint.sh"]

#WORKDIR /usr/local/zookeeper


