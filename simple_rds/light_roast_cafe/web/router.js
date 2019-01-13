const CafeRouter = require(`${appRoot}/lightroast/cafe_router.js`);
const LyricController = require('./controllers/lyric_controller.js');
const DataController = require('./controllers/data_controller.js');

class Router extends CafeRouter {
  drawRoutes() {
    this.root(LyricController, 'index');

    this.get('/lyrics', LyricController, 'index');

    this.get('/create', DataController, 'create');
    this.get('/seed', DataController, 'seed');
    this.get('/drop', DataController, 'drop');
  }
}

module.exports = Router;
