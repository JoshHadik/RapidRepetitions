const WebController = require('./web_controller.js');

class LyricController extends WebController {
  async index(req, res) {
    this.cache.getRecentLyrics(10, (err, lyrics) => {
      this.render(res, 'lyric/index', { lyrics: lyrics });
    });
  }

  async create(req, res) {
    const lyric = req.body.lyric;
    this.cache.addLyric(lyric);
    this.redirect(res, '/');
  }

  async seed(req, res) {
    this.cache.seedLyrics();
    this.redirect(res, '/');
  }

  async clear(req, res) {
    this.cache.clearLyrics();
    this.redirect(res, '/');
  }
}

module.exports = LyricController;
