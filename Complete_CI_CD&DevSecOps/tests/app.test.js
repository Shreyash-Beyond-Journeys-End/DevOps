const request = require('supertest');
const app = require('../src/app');

describe('Calculator API', () => {
  test('GET / should return running message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe('Calculator API is running');
  });

  test('GET /health should return ok', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe('ok');
  });

  test('GET /add/:a/:b should add two numbers', async () => {
    const res = await request(app).get('/add/5/3');
    expect(res.statusCode).toBe(200);
    expect(res.body.result).toBe(8);
  });

  test('GET /subtract/:a/:b should subtract two numbers', async () => {
    const res = await request(app).get('/subtract/5/3');
    expect(res.statusCode).toBe(200);
    expect(res.body.result).toBe(2);
  });

  test('GET /multiply/:a/:b should multiply two numbers', async () => {
    const res = await request(app).get('/multiply/5/3');
    expect(res.statusCode).toBe(200);
    expect(res.body.result).toBe(15);
  });

  test('GET /divide/:a/:b should divide two numbers', async () => {
    const res = await request(app).get('/divide/6/3');
    expect(res.statusCode).toBe(200);
    expect(res.body.result).toBe(2);
  });

  test('GET /divide/:a/:b should not allow divide by zero', async () => {
    const res = await request(app).get('/divide/6/0');
    expect(res.statusCode).toBe(400);
    expect(res.body.error).toBe('cannot divide by zero');
  });
});
