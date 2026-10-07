const express = require('express');

const app = express();
app.use(express.json());

// basic health check, useful to test if the server is running
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.get('/', (req, res) => {
  res.status(200).json({ message: 'Calculator API is running' });
});

// simple calculator routes
app.get('/add/:a/:b', (req, res) => {
  const a = Number(req.params.a);
  const b = Number(req.params.b);
  res.status(200).json({ result: a + b });
});

app.get('/subtract/:a/:b', (req, res) => {
  const a = Number(req.params.a);
  const b = Number(req.params.b);
  res.status(200).json({ result: a - b });
});

app.get('/multiply/:a/:b', (req, res) => {
  const a = Number(req.params.a);
  const b = Number(req.params.b);
  res.status(200).json({ result: a * b });
});

app.get('/divide/:a/:b', (req, res) => {
  const a = Number(req.params.a);
  const b = Number(req.params.b);

  if (b === 0) {
    return res.status(400).json({ error: 'cannot divide by zero' });
  }

  return res.status(200).json({ result: a / b });
});

module.exports = app;
