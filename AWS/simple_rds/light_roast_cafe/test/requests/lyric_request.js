var request = require('supertest');

describe('loading express', function () {
  var server;

  before(function () {
    server = require('../test_helper.js');
  });

  after(function (done) {
    server.close(done);
  });

  it('responds to /lyrics', function testSlash(done) {
    request(server)
      .get('/lyrics')
      .expect(200, done);
  });
});
