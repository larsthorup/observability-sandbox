echo -e "\e]2;promtail\a"
DOCKER_ROOT=/mnt/docker/version-pack-data/community # on Windows
# DOCKER_ROOT=/var/lib # on Linux
docker stop promtail
docker rm promtail
docker run -d \
  --name promtail \
  --link loki \
  -v "$(pwd)/data":/data \
  -v "${DOCKER_ROOT}/docker/containers":/var/lib/docker/containers \
  -p 9080:9080 \
  grafana/promtail \
  --config.file=/data/promtail.yml
docker logs -f promtail