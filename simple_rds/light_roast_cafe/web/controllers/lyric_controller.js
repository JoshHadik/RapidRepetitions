const WebController = require('./web_controller.js')

class LyricController extends WebController {
  index(req, res) {
    this.db.all('lyrics')
      .then((lyrics) => this.render(res, 'lyric/index.js', { lyrics: lyrics }))
      .catch(() => res.send('<a href="/create">SETUP</a>'));
  }
}

module.exports = LyricController;
