#!/bin/bash

echo 'Broker list '$1
echo 'Workers list '$2


brokers = 's/localhost:9092'$1'/g'

rm -rf benchmark

mkdir -p benchmark/drivers
mkdir -p benchmark/output

cp drivers-kafka/*.yaml benchmark/drivers

sed -i .bak $brokers benchmark/drivers/*.yaml
rm benchmark/drivers/*.bak

docker pull klimenkoiv/openmessaging-benchmark:latest

docker run --rm -v ./benchmark/drivers:/drivers -v ./benchmark/output:/output \
klimenkoiv/openmessaging-benchmark:latest bin/benchmark -o /output/ \
--drivers /drivers/kafka-big-batches-gzip.yaml,/drivers/kafka-big-batches-lz4.yaml,/drivers/kafka-big-batches-snappy.yaml,\
/drivers/kafka-big-batches-zstd.yaml,/drivers/kafka-big-batches.yaml,/drivers/kafka-compression-gzip.yaml,/drivers/kafka-compression-lz4.yaml,\
/drivers/kafka-compression-snappy.yaml,/drivers/kafka-compression-zstd.yaml,/drivers/kafka-exactly-once.yaml,/drivers/kafka-latency.yaml,\
/drivers/kafka-no-linger.yaml,/drivers/kafka-sync.yaml,/drivers/kafka-throughput.yaml \
--workers $2 \
workloads/1-topic-1-partition-1kb.yaml workloads/500-topic-1kb-4p-4c-500k.yaml \
workloads/1k-topic-1kb-4p-4c-2000k.yaml workloads/max-rate-1-topic-30-partitions-30p-30c-100b.yaml \
workloads/1m-topic-1kb-4p-4c-500k.yaml workloads/max-rate-1-topic-100-partitions-1kb.yaml \
workloads/max-rate-1-topic-20-partitions-20p-20c-64kb.yaml workloads/1m-10-topics-6-partitions-100b.yaml \
workloads/max-rate-1-topic-1-partition-1p-1c-1kb.yaml workloads/1m-topic-1kb-4p-4c-2000k.yaml \ 
workloads/max-rate-100-topics-1-partition-1kb.yaml workloads/max-rate-1-topic-50-partitions-50p-50c-1kb.yaml \
workloads/900k-topic-1kb-4p-4c-2000k.yaml workloads/10k-topic-1kb-4p-4c-100k.yaml \
workloads/1-topic-100-partitions-1kb-4p-4c-1000k.yaml workloads/max-rate-100-topics-1-partition-64kb.yaml \
workloads/max-rate-1-topic-10-partitions-1p-1c-100b.yaml workloads/1-topic-10000-partitions-1kb-4p-4c-200k.yaml \
workloads/max-rate-70-topics-1-partition-100b.yaml workloads/1-topic-10000-partitions-1kb-4p-4c-2000k.yaml \
workloads/500k-topic-1kb-4p-4c-2000k.yaml workloads/100k-topic-1kb-4p-4c-500k.yaml \
workloads/max-rate-80-topics-1-partition-100b.yaml workloads/max-rate-1-topic-30-partitions-30p-30c-1kb.yaml \
workloads/max-rate-1-topic-1-partition-1p-1c-100b.yaml workloads/max-rate-1-topic-70-partitions-70p-70c-100b.yaml \
workloads/1-topic-100-partitions-1kb-4p-4c-200k-backlog.yaml workloads/max-rate-90-topics-1-partition-1kb.yaml \
workloads/max-rate-80-topics-1-partition-64kb.yaml workloads/max-rate-1-topic-60-partitions-60p-60c-64kb.yaml \
workloads/200k-topic-1kb-4p-4c-500k.yaml workloads/max-rate-1-topic-50-partitions-50p-50c-100b.yaml \
workloads/max-rate-1-topic-100-partitions-100p-100c-64kb.yaml workloads/max-rate-1-topic-10-partitions-1p-1c-64kb.yaml \
workloads/max-rate-1-topic-40-partitions-40p-40c-1kb.yaml workloads/max-rate-1-topic-40-partitions-40p-40c-64kb.yaml \
workloads/max-rate-1-topic-10-partitions-10p-10c-1kb.yaml workloads/5k-topic-1kb-4p-4c-500k.yaml \
workloads/1-topic-100-partitions-1kb-4p-4c-2000k.yaml workloads/1-topic-10000-partitions-1kb-4p-4c-1000k.yaml \
workloads/100-topics-1-partitions-1kb.yaml workloads/300k-topic-1kb-4p-4c-500k.yaml \
workloads/300k-topic-1kb-4p-4c-2000k.yaml workloads/1-topic-16-partition-100b.yaml \
workloads/max-rate-40-topics-1-partition-100b.yaml workloads/max-rate-20-topics-1-partition-1kb.yaml \
workloads/100-topic-1kb-4p-4c-2000k.yaml workloads/max-rate-80-topics-1-partition-1kb.yaml \
workloads/max-rate-50-topics-1-partition-100b.yaml workloads/1-topic-100-partitions-1kb.yaml \
workloads/700k-topic-1kb-4p-4c-500k.yaml workloads/10k-topic-1kb-4p-4c-2000k.yaml \
workloads/50k-topic-1kb-4p-4c-100k.yaml workloads/max-rate-1-topic-20-partitions-20p-20c-1kb.yaml \
workloads/max-rate-1-topic-10-partitions-1p-1c-1kb.yaml workloads/max-rate-60-topics-1-partition-100b.yaml \
workloads/500-topic-1kb-4p-4c-2000k.yaml workloads/max-rate-1-topic-20-partitions-20p-20c-100b.yaml \ 
workloads/400k-topic-1kb-4p-4c-500k.yaml  workloads/max-rate-1-topic-10-partitions-10p-10c-64kb.yaml \ 
workloads/50k-topic-1kb-4p-4c-2000k.yaml  workloads/100-topic-1kb-4p-4c-500k.yaml \ 
workloads/800k-topic-1kb-4p-4c-500k.yaml  workloads/max-rate-1-topic-1-partition-1p-1c-64kb.yaml \
workloads/max-rate-60-topics-1-partition-64kb.yaml  workloads/max-rate-10-topics-1-partition-1kb.yaml \
workloads/1m-10-topics-9-partitions-100b.yaml  workloads/max-rate-1-topic-90-partitions-90p-90c-100b.yaml \
workloads/1m-10-topics-2-partitions-100b.yaml  workloads/max-rate-70-topics-1-partition-1kb.yaml \
workloads/max-rate-1-topic-100-partitions-100p-100c-100b.yaml workloads/500k-topic-1kb-4p-4c-500k.yaml \
workloads/max-rate-1-topic-80-partitions-80p-80c-64kb.yaml  workloads/10k-topic-1kb-4p-4c-500k.yaml \
workloads/max-rate-100-topics-1-partition-100b.yaml  workloads/100k-topic-1kb-4p-4c-2000k.yaml \
workloads/5k-topic-1kb-4p-4c-100k.yaml workloads/max-rate-10-topics-1-partition-100b.yaml \
workloads/100k-topic-1kb-4p-4c-100k.yaml  workloads/900k-topic-1kb-4p-4c-500k.yaml \
workloads/800k-topic-1kb-4p-4c-2000k.yaml  workloads/max-rate-20-topics-1-partition-100b.yaml \
workloads/max-rate-1-topic-16-partitions-1kb.yaml workloads/5k-topic-1kb-4p-4c-2000k.yaml \
workloads/1-topic-16-partitions-1kb.yaml  workloads/max-rate-1-topic-100-partitions-1p-1c-1kb.yaml \
workloads/max-rate-30-topics-1-partition-100b.yaml workloads/max-rate-60-topics-1-partition-1kb.yaml \
workloads/backlog-1-topic-1-partition-1kb.yaml workloads/1m-10-topics-3-partitions-100b.yaml \
workloads/200k-topic-1kb-4p-4c-100k.yaml workloads/max-rate-1-topic-100-partitions-100p-100c-1kb.yaml \
workloads/1-topic-6-partition-100b.yaml workloads/max-rate-1-topic-40-partitions-40p-40c-100b.yaml \
workloads/1k-topic-1kb-4p-4c-500k.yaml  workloads/max-rate-40-topics-1-partition-64kb.yaml \
workloads/1-topic-100-partitions-1kb-4p-4c-200k.yaml  workloads/600k-topic-1kb-4p-4c-600k.yaml \
workloads/600k-topic-1kb-4p-4c-2000k.yaml  workloads/max-rate-50-topics-1-partition-1kb.yaml \
workloads/max-rate-1-topic-100-partitions-1p-1c-100b.yaml workloads/1m-10-topics-16-partitions-100b.yaml \
workloads/1m-10-topics-4-partitions-100b.yaml workloads/1-topic-100-partitions-1kb-4p-4c-500k.yaml \
workloads/1-topic-1-partition-100b.yaml workloads/50k-topic-1kb-4p-4c-500k.yaml \
workloads/max-rate-1-topic-10-partitions-10p-10c-100b.yaml workloads/max-rate-1-topic-80-partitions-80p-80c-1kb.yaml \
workloads/200k-topic-1kb-4p-4c-2000k.yaml  workloads/1-topic-3-partition-100b-3producers.yaml \
workloads/backlog-1-topic-16-partitions-1kb.yaml workloads/max-rate-40-topics-1-partition-1kb.yaml \
workloads/1-topic-10000-partitions-1kb-4p-4c-500k.yaml workloads/max-rate-1-topic-80-partitions-80p-80c-100b.yaml \ 
workloads/max-rate-1-topic-90-partitions-90p-90c-1kb.yaml workloads/max-rate-10-topics-1-partition-64kb.yaml \
workloads/1k-topic-1kb-4p-4c-100k.yaml  workloads/max-rate-1-topic-60-partitions-60p-60c-100b.yaml \
workloads/max-rate-1-topic-60-partitions-60p-60c-1kb.yaml workloads/max-rate-1-topic-100-partitions-100b.yaml \
workloads/max-rate-1-topic-16-partitions-100b.yaml  workloads/max-rate-20-topics-1-partition-64kb.yaml \
workloads/max-rate-1-topic-1-partition-4p-1c-1kb.yaml workloads/400k-topic-1kb-4p-4c-2000k.yaml \
workloads/max-rate-90-topics-1-partition-100b.yaml workloads/max-rate-30-topics-1-partition-1kb.yaml \
workloads/1m-10-topics-1-partition-100b.yaml  workloads/max-rate-1-topic-70-partitions-70p-70c-1kb.yaml \
workloads/700k-topic-1kb-4p-4c-2000k.yaml




