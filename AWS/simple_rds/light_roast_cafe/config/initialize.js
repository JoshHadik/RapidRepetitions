global.appRoot = require('path').resolve(__dirname, '../');

const Router = require(`${appRoot}/web/router.js`);
const app = require('./app.js')
const db = require(`${appRoot}/db/interface.js`);

const initialize = (port) => {
  const server = app.listen(port);
  db.use_keys_for(app.settings.env);

  const router = new Router(app, db);
  router.drawRoutes();

  return server;
}

module.exports = { app, db, initialize };
