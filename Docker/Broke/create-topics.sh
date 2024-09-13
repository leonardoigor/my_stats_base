#!/bin/bash
echo "Waiting for Kafka to be available..."
# Aguardar o Kafka estar pronto
# sleep 15
echo "Start to create containers"


# Defina o número de partições e o fator de replicação
PARTITIONS=1
REPLICATION_FACTOR=1

# Tópicos padrão do Kafka Connect
TOPICS=(
  "__consumer_offsets"
  "connect-offsets"
  "connect-configs"
  "connect-status"
)

# Crie os tópicos
for TOPIC in "${TOPICS[@]}"; do
  echo "Criando o tópico $TOPIC"
  kafka-topics --create  --bootstrap-server broker:9092 \
    --replication-factor $REPLICATION_FACTOR \
    --partitions $PARTITIONS \
    --topic $TOPIC
done

echo "Todos os tópicos padrão foram criados."

# Criar um exemplo de tópico
echo "Criando o tópico my-topic..."
kafka-topics --create --topic my-topic --bootstrap-server broker:9092 --partitions 1 --replication-factor 1 --config cleanup.policy=compact
kafka-topics --create --topic record-entry --bootstrap-server broker:9092 --partitions 1 --replication-factor 1 --config cleanup.policy=compact

# Criar outros tópicos conforme necessário
# kafka-topics --create --topic another-topic --bootstrap-server broker:9092 --partitions 1 --replication-factor 1