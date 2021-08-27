docker stop api
docker rm api
docker build api -t larsthorup/observability-sandbox-api
docker run -d \
  --name api \
  -p 8080:8080 larsthorup/observability-sandbox-api
docker logs -f api