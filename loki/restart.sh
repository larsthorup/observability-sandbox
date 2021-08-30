echo -e "\e]2;loki\a"
docker stop loki
docker rm loki
docker run -d \
  --name loki \
  -v "$(pwd)/data":/data \
  --log-opt "tag={{.Name}}" \
  -p 3100:3100 \
  grafana/loki:2.3.0 \
  --config.file=/data/loki-config.yml
docker logs -f loki