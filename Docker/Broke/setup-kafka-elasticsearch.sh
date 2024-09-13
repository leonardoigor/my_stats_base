#!/bin/bash

# Aguardar o Kafka estar pronto
echo "Aguardando o Kafka iniciar..."
# sleep 30

# Criar o tópico kafka-connect-offsets
# echo "Criando o tópico kafka-connect-offsets..."
# kafka-topics --create --topic kafka-connect-offsets --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1 --config cleanup.policy=compact


# Criar o conector Elasticsearch
echo "Criando o conector Elasticsearch..."
# Execute the setup script
curl -X POST http://kafkaConnect:8083/connectors -H "Content-Type: application/json" -d '{
  "name": "elasticsearch-sink",
  "config": {
    "connector.class": "org.apache.kafka.connect.elasticsearch.ElasticsearchSinkConnector",
    "tasks.max": "1",
    "topics": "my-topic",
    "connection.url": "elasticsearch:9200",
    "type.name": "_doc",
    "key.ignore": "true"
  }
}'

echo "Configuração concluída. Os tópicos e o conector estão prontos."