const CafeRouter = require(`${appRoot}/lightroast/cafe_router.js`);

const LyricController = require('./controllers/lyric_controller.js');

class Router extends CafeRouter {
  drawRoutes() {
    this.root(LyricController, 'index');

    this.get('/lyrics', LyricController, 'index');
    this.post('/lyrics', LyricController, 'create');
    this.post('/lyrics/seed', LyricController, 'seed');
    this.post('/lyrics/clear', LyricController, 'clear');
  }
}

module.exports = Router;
