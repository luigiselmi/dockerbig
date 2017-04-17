DockerBig
=========

A Big Data pipeline built on Docker.
 
### Zookeeper


### Kafka
#### Environment variables set in the docker-compose file
broker.id (unique server identifier, default value: broker.id=0)
advertised.listeners (server name or ip address and port, defualt value: none)
log.dirs (where the log files are stored, defualt value: /tmp/kafka-logs)
num.partitions (number of partitions per topic, default value: num.partitions=1)
zookeeper.connect (zookeeper server name or ip address and port, default value: localhost:2181)

