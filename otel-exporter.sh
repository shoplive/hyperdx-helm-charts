export CLICKHOUSE_ENDPOINT=https://fw9e14z6df.us-east-2.aws.clickhouse.cloud:8443
export CLICKHOUSE_USER=backendDeveloper
export CLICKHOUSE_PASSWORD=Trinity345#$%
export CLICKHOUSE_DATABASE=otel_dev

# osx
docker run --rm -it \
  -p 4317:4317 -p 4318:4318 \
  -v $(pwd)/otel-cloud-config.yaml:/etc/otelcol-contrib/custom.config.yaml \
  -v $(pwd)/logs:/etc/otel/supervisor-data \
  -e CLICKHOUSE_ENDPOINT=${CLICKHOUSE_ENDPOINT} \
  -e CLICKHOUSE_USER=${CLICKHOUSE_USER} \
  -e CLICKHOUSE_PASSWORD=${CLICKHOUSE_PASSWORD} \
  -e CLICKHOUSE_DATABASE=${CLICKHOUSE_DATABASE} \
  -e OPAMP_SERVER_URL=http://host.docker.internal:4320 \
  -e HYPERDX_API_KEY=10dd0541-4631-4b41-981d-2fdff1f68ee5 \
  -e CUSTOM_OTELCOL_CONFIG_FILE=/etc/otelcol-contrib/custom.config.yaml \
  -p 14317:4317 -p 14318:4318 \
  docker.hyperdx.io/hyperdx/hyperdx-otel-collector:2.4.0