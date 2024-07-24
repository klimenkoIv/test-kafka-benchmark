# test-kafka-benchmark

## Clients

client1 - used to run test and collent results

client2 - clientn - used to run worker service

## Start service

Clients count >1

On each client install Docker.

```bash
./scripts/start-workers.sh
```

## Start testing

On test client mashine (exlude clients with service workers) run script

```bash
./script/start-test.sh broker1:9092,broker2:9092,broker3:9092 http://client2:8080,http://client3:8080....http://clientN:8080
```

## Collect results

All results saves at ./benchmark/output

