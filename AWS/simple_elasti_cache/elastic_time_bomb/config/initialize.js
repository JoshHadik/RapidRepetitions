global.appRoot = require('path').resolve(__dirname, '../');

const Router = require(`${appRoot}/web/router.js`);
const app = require('./app.js')
const cache = require(`${appRoot}/interfaces/cache/main.js`)

const initialize = (port) => {
  const server = app.listen(port);

  const router = new Router(app, cache);
  router.drawRoutes();

  return server;
}

module.exports = { app, cache, initialize };
