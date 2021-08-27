docker stop prometheus
docker rm prometheus
docker run -d \
  --name prometheus \
  -v "$(pwd)/prometheus-data":/prometheus-data \
  -p 9090:9090 \
  prom/prometheus \
  --config.file=/prometheus-data/prometheus.yml
docker logs -f prometheus