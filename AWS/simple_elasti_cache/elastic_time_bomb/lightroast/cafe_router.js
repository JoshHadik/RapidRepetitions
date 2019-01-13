class CafeRouter {
  constructor(app, cache) {
    this.app = app;
    this.cache = cache;
  }

  get(path, controllerName, actionName) {
    const action = this.getAction(controllerName, actionName)
    this.app.get(path, action);
  }

  post(path, controllerName, actionName) {
    const action = this.getAction(controllerName, actionName)
    this.app.post(path, action);
  }

  root(controllerName, actionName) {
    this.get('/', controllerName, actionName);
  }

  getAction(controllerName, actionName) {
    const controller = new controllerName(this.app, this.cache);
    const action = controller[actionName].bind(controller);
    return action;
  }
}

module.exports = CafeRouter;
