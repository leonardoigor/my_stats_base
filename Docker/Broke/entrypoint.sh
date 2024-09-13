#!/bin/bash

# Wait for Kafka to be available
until nc -z broker 9092; do
  echo "Waiting for Kafka to be available..."
  sleep 3
done

# Execute the setup scripts
./create-topics.sh
# exec ./setup-kafka-elasticsearch.sh
