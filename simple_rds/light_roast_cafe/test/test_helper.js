const { app, db, initialize } = require('../config/initialize.js');

const server = initialize(3000)

module.exports = server
