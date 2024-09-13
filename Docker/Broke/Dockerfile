# Usando uma imagem oficial do Kafka
FROM confluentinc/cp-kafka:latest

# Copiando a pasta 'broken' para dentro do container Kafka
COPY ./create-topics.sh /tmp/create-topics.sh
COPY ./entrypoint.sh /tmp/entrypoint.sh
COPY ./setup-kafka-elasticsearch.sh /tmp/setup-kafka-elasticsearch.sh

# Definindo variáveis de ambiente
ENV KAFKA_BROKER_ID=1 \
    KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
    KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://broker:9092 \
    KAFKA_DEFAULT_REPLICATION_FACTOR=1 \
    KAFKA_AUTO_CREATE_TOPICS_ENABLE=true
# KAFKA_INTER_BROKER_LISTENER_NAME=INTERNAL\
# KAFKA_LISTENERS=INTERNAL://:9092,OUTSIDE://:9094\
# KAFKA_ADVERTISED_LISTENERS=INTERNAL://kafka:9092,OUTSIDE://host.docker.internal:9094\
# KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=INTERNAL:PLAINTEXT,OUTSIDE:PLAINTEXT




# Expondo a porta Kafka
EXPOSE 9092
USER root

RUN chmod +x /tmp/create-topics.sh
RUN chmod +x /tmp/entrypoint.sh
RUN chmod +x /tmp/setup-kafka-elasticsearch.sh

# Comando para iniciar o Kafka
# CMD ["bash", "-c", "kafka-server-start /etc/kafka/server.properties"]
