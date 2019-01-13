const request = require('supertest');

describe('Lyric Requests', () => {
  var server;

  before(() => {
    server = require('../test_helper.js');
  });

  after((done) => {
    server.close(done);
  });

  it('responds to GET /lyrics', (done) => {
    request(server)
      .get('/lyrics')
      .expect(200, done);
  });

  it('responds to POST /lyrics', (done) => {
    request(server)
      .post('/lyrics')
      .send('lyric=Hi hey there hello')
      .expect(302)
      .expect('Location', '/', done);
  });

  it('responds to POST /lyrics/seed', (done) => {
    request(server)
      .post('/lyrics/seed')
      .expect(302)
      .expect('Location', '/', done);
  });

  it('responds to POST /lyrics/clear', (done) => {
    request(server)
      .post('/lyrics/clear')
      .expect(302)
      .expect('Location', '/', done);
  });
})
