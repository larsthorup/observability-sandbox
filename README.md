# observability-sandbox

Open Source monitoring, logging and tracing with Prometheus, Loki and Grafana for:

- Host (CPU, memory, storage)
- Database
- Web API
- Front-end

## Prerequisites

- Docker
- Bash

## Prerequisites (Windows)

In Windows Command Prompt:

```
net use h: \\wsl$\docker-desktop-data
```

For the remaining steps use Docker Desktop with WSL2 back-end, and run from Ubuntu

```
sudo mkdir /mnt/docker
sudo mount -t drvfs h: /mnt/docker
```

## Terminal: Prometheus (observation store)

```
(cd prometheus && ./restart.sh)
```

http://localhost:9090/graph

## Terminal: Loki (log store)

```
(cd loki && ./restart.sh)
```

http://localhost:3100/metrics

## Terminal: Grafana (observability visualization)

```
(cd grafana && ./restart.sh)
```

http://localhost:3000/

Username/password: lars/lars

## Terminal: Web API (our code)

```
(cd nodejs && ./restart.sh)
```

http://localhost:8080/

## Terminal: Promtail (log collector)

```
(cd promtail && ./restart.sh)
```

http://localhost:9080/

## Sample display

http://localhost:3000/d/api/node-js

![Sample display](./media/grafana-dashboard.png)
