# observability-sandbox

Open Source monitoring, logging and tracing with Prometheus and Grafana for:

- Host (CPU, memory, storage)
- Database
- Web API
- Front-end

Prerequisites

- Docker
- Bash

Terminal 1:

```
(cd node && ./restart.sh)
```

Terminal 2:

```
(cd prometheus && ./restart.sh)
```

Note: on Windows, use Docker Desktop with WSL2 back-end, and run from Ubuntu
