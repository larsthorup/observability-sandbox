docker stop grafana
docker rm grafana
docker run -d \
  --name grafana \
  --link prometheus \
  -p 3000:3000 \
  -e "GF_SECURITY_ADMIN_USER=lars" \
  -e "GF_SECURITY_ADMIN_PASSWORD=lars" \
  grafana/grafana
docker logs -f grafana