# observability-sandbox

Open Source monitoring, logging and tracing with Prometheus and Grafana for:

- Host (CPU, memory, storage)
- Database
- Web API
- Front-end

Prerequisites

- Docker
- Bash

Note: on Windows, use Docker Desktop with WSL2 back-end, and run from Ubuntu

## Terminal 1: Web API

```
(cd node && ./restart.sh)
```

http://localhost:8080/

## Terminal 2: Prometheus

```
(cd prometheus && ./restart.sh)
```

http://localhost:9090/graph

## Terminal 3: Grafana

```
(cd grafana && ./restart.sh)
```

http://localhost:3000/

Username/password: lars/lars

![Sample display](./media/grafana-dashboard.png)
