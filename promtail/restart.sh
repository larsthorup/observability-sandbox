echo -e "\e]2;promtail\a"
export $(egrep -v '^#' ../.env |  tr -d '\r' | xargs)

docker stop promtail
docker rm promtail
docker run -d \
  --name promtail \
  --link loki \
  -v "$(pwd)/data":/data \
  -v "${DOCKER_ROOT}/docker/containers":/var/lib/docker/containers \
  --log-opt "tag={{.Name}}" \
  -p 9080:9080 \
  grafana/promtail \
  -config.file=/data/promtail.yml
docker logs -f promtail