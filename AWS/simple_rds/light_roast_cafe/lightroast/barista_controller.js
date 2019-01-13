class BaristaController {
  constructor(app, db) {
    this.app = app;
    this.db = db;
  }

  render(res, viewPath, props) {
    const viewClass = require(`${appRoot}/web/views/${viewPath}`);
    const view = new viewClass(props);
    res.send(view.render());
  }
}

module.exports = BaristaController;
