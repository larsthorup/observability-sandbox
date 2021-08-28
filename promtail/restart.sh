echo -e "\e]2;promtail\a"
if [ "${WSL_DISTRO_NAME}" = "Ubuntu" ]; then
  DOCKER_ROOT=/mnt/docker/version-pack-data/community # on Windows, se README.md
else
  DOCKER_ROOT=/var/lib # on Linux
fi
API_CONTAINERID=$(docker ps --format {{.ID}} --filter "name=api")
GRAFANA_CONTAINERID=$(docker ps --format {{.ID}} --filter "name=grafana")
LOKI_CONTAINERID=$(docker ps --format {{.ID}} --filter "name=loki")
PROMETHEUS_CONTAINERID=$(docker ps --format {{.ID}} --filter "name=prometheus")

docker stop promtail
docker rm promtail
docker run -d \
  --name promtail \
  --link loki \
  -v "$(pwd)/data":/data \
  -v "${DOCKER_ROOT}/docker/containers":/var/lib/docker/containers \
  -p 9080:9080 \
  -e "API_CONTAINERID=${API_CONTAINERID}" \
  -e "GRAFANA_CONTAINERID=${GRAFANA_CONTAINERID}" \
  -e "LOKI_CONTAINERID=${LOKI_CONTAINERID}" \
  -e "PROMETHEUS_CONTAINERID=${PROMETHEUS_CONTAINERID}" \
  grafana/promtail \
  -config.file=/data/promtail.yml \
  -config.expand-env=true 
docker logs -f promtail