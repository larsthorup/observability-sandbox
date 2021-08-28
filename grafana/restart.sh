docker stop grafana
docker rm grafana
docker run -d \
  --name grafana \
  --link prometheus \
  -v "$(pwd)/data":/etc/grafana \
  -p 3000:3000 \
  grafana/grafana
docker logs -f grafana