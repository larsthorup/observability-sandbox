echo -e "\e]2;prometheus\a"
docker stop prometheus
docker rm prometheus
docker run -d \
  --name prometheus \
  --link api \
  -v "$(pwd)/data":/data \
  -p 9090:9090 \
  prom/prometheus \
  --config.file=/data/prometheus.yml
docker logs -f prometheus