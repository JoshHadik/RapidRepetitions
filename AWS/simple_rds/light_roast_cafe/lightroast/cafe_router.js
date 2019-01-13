class CafeRouter {
  constructor(app, db) {
    this.app = app;
    this.db = db;
  }

  get(path, controllerName, actionName) {
    const action = this.getAction(controllerName, actionName)
    this.app.get(path, action);
  }

  root(controllerName, actionName) {
    this.get('/', controllerName, actionName);
  }

  getAction(controllerName, actionName) {
    const controller = new controllerName(this.app, this.db);
    const action = controller[actionName].bind(controller);
    return action;
  }
}

module.exports = CafeRouter;
