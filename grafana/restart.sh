echo -e "\e]2;grafana\a"
docker stop grafana
docker rm grafana
docker run -d \
  --name grafana \
  --link prometheus \
  --link loki \
  -v "$(pwd)/data":/etc/grafana \
  -p 3000:3000 \
  grafana/grafana
docker logs -f grafana