const WebController = require('./web_controller.js')

class DataController extends WebController {
  async drop(req, res) {
    await this.db.dropTables();
    res.send('DROPPED <a href="/create">create</a>');
  }

  async create(req, res) {
    await this.db.createTables();
    res.send('CREATED <a href="/seed">seed</a>');
  }

  async seed(req, res) {
    await this.db.createLyric(0, "Slowly slowly we");
    await this.db.createLyric(1, "become the secrets that we keep");
    await this.db.createLyric(2, "yeah it's only you it's only me");
    await this.db.createLyric(3, "it's only love and it's only fair");
    await this.db.createLyric(4, "that you find your peace!");
    await this.db.createLyric(5, "that you find your peace!");
    await this.db.createLyric(6, "Slowly slowyly we");
    await this.db.createLyric(7, "become the secrets that we keep.");
    res.send('SEEDED <a href="/">home</a>');
  }
}

module.exports = DataController;
