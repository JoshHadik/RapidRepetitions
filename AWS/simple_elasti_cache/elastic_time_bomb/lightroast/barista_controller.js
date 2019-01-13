class BaristaController {
  constructor(app, cache) {
    this.app = app;
    this.cache = cache;
  }

  redirect(res, path) {
    res.redirect(path);
  }

  render(res, viewPath, props) {
    const viewClass = require(`${appRoot}/web/views/${viewPath}`);
    const view = new viewClass(props);
    res.send(view.render());
  }
}

module.exports = BaristaController;
