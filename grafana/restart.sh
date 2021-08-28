docker stop grafana
docker rm grafana
docker run -d \
  --name grafana \
  --link prometheus \
  -v "$(pwd)/data/grafana.ini":/etc/grafana/grafana.ini \
  -p 3000:3000 \
  grafana/grafana
docker logs -f grafana