const express = require('express');
const client = require('prom-client')
const collectDefaultMetrics = client.collectDefaultMetrics
collectDefaultMetrics({ timeout: 1000 })

const port = 3000;
const host = '0.0.0.0';

const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType)
  res.end(await client.register.metrics())
})

app.listen(port, host);
console.log(`Running on http://${host}:${port}`);