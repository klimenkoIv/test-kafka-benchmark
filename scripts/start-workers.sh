#!/bin/bash

echo 'Download image'
docker pull klimenkoiv/openmessaging-benchmark:latest

echo 'Start service'
docker run -p 8080:8080 --name benchmark -d klimenkoiv/openmessaging-benchmark:2024-07-23 bin/benchmark-worker
