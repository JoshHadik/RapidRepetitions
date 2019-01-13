const { db } = require(`../config/initialize.js`);

async function createTables(callback) {
  await db.createTables();
  callback();
}

async function seedData(callback) {
  await db.createLyric(0, "Slowly slowly we");
  await db.createLyric(1, "become the secrets that we keep");
  await db.createLyric(2, "yeah it's only you it's only me");
  await db.createLyric(3, "it's only love and it's only fair");
  await db.createLyric(4, "that you find your peace!");
  await db.createLyric(5, "that you find your peace!");
  await db.createLyric(6, "Slowly slowyly we");
  await db.createLyric(7, "become the secrets that we keep.");
  callback();
}

async function clearTables(callback) {
  await db.clearTables();
  callback();
}

async function dropTables(callback) {
  await db.dropTables();
  callback();
}

const functionTable = {
  "dropTables": dropTables,
  "clearTables": clearTables,
  "seed": seedData,
  "createTables": createTables
}


const task = functionTable[process.argv[2]];
task(() => process.exit(0));
