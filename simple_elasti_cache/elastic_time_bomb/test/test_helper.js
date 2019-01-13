const { cache, initialize } = require('../config/initialize.js');
const server = initialize(3000);

server.on('close', () => {
  console.log('Closing Tests');
  cache.quit();
});

module.exports = server;
