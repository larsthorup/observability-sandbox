echo -e "\e]2;cdn\a"
docker stop cdn
docker rm cdn
docker build static -t larsthorup/observability-sandbox-cdn
docker run -d \
  --name cdn \
  -p 8081:8081 \
  larsthorup/observability-sandbox-cdn
docker logs -f cdn