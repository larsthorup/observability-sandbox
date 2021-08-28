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

## Terminal 1: Prometheus (observation store)

```
(cd prometheus && ./restart.sh)
```

http://localhost:9090/graph

## Terminal 2: Loki (log store)

```
(cd loki && ./restart.sh)
```

http://localhost:3100/metrics

## Terminal 3: Promtail (log collector)

```
(cd promtail && ./restart.sh)
```

http://localhost:9080/

## Terminal 4: Grafana (observability visualization)

```
(cd grafana && ./restart.sh)
```

http://localhost:3000/

Username/password: lars/lars

## Terminal 5: Web API (our code)

```
(cd nodejs && ./restart.sh)
```

http://localhost:8080/

![Sample display](./media/grafana-dashboard.png)
