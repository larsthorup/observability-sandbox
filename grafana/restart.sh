docker stop grafana
docker rm grafana
docker run -d \
  --name grafana \
  --link prometheus \
  -p 3000:3000 \
  grafana/grafana
docker logs -f grafana