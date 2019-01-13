const redis = require('redis');
const redisKeys = require('./keys');

class Cache {
  constructor() {
    this.client = redis.createClient({
      host: redisKeys.host,
      port: redisKeys.port
    })
  }

  async getRecentLyrics(length, callback) {
    this.client.lrange('lyrics', -length, -1, callback);
  }

  async addLyric(lyric) {
    this.client.rpush('lyrics', lyric);
  }

  async seedLyrics() {
    this.addLyric("Hi hey there hello.");
    this.addLyric("and have you got some place to go?");
    this.addLyric("Well I've got some time and I would love to take you out.");
  }

  async clearLyrics() {
    this.client.del('lyrics');
  }

  async quit() {
    this.client.quit();
  }
}

module.exports = new Cache();
