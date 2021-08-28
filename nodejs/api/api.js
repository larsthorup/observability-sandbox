const express = require('express');
const client = require('prom-client');
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics({ timeout: 1000 });
const apiRootRequestsTotalCounter = new client.Counter({
  name: 'api_root_requests_total',
  help: 'Total number of requests to http://api/',
});
const apiRootRequestDurationSeconds = new client.Histogram({
  name: 'api_root_request_duration_seconds',
  help: 'Total number of requests to http://api/',
  buckets: [0.001, 0.05, 0.15, 0.50, 1.00, 5.00],
});
const port = 8080;
const host = '0.0.0.0';

const app = express();
app.get('/', async (req, res) => {
  const timer = apiRootRequestDurationSeconds.startTimer();
  apiRootRequestsTotalCounter.inc();
  try {
    const delay = Math.random() * 1000;
    await new Promise(resolve => setTimeout(resolve, delay));
    const shouldError = Math.random() < 0.1;
    if (shouldError) throw new Error('Uh, oh, random fluke!')
    const message = 'Hello World';
    console.log(message);
    res.send(message);
  } catch (err) {
    console.error(err.message);
    res.status(500).send(err.message);
  } finally {
    apiRootRequestDurationSeconds.observe(timer());
  }
});
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType)
  res.end(await client.register.metrics())
})

app.listen(port, host);
console.log(`Running on http://${host}:${port}`);