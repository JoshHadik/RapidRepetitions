const { Pool } = require('pg');

class DB {
  constructor() {
    this.dbKeys = null;
  }

  use_keys_for(environment) {
    this.dbKeys = require(`./keys/${environment}.js`);
  }

  newPool() {
    const pool = new Pool({
      host: this.dbKeys.pgHost,
      user: this.dbKeys.pgUser,
      database: this.dbKeys.pgDatabase,
      password: this.dbKeys.pgPassword,
      port: this.dbKeys.pgPort
    })

    pool.on('connect', () => console.log('Connected to Database.'));
    pool.on('err', () => console.log('Lost connection with database.'));
    pool.on('remove', () => console.log('Database connection removed.'));

    return pool;
  }

  async createTables() {
    const pool = this.newPool();
    const queryText =
      `CREATE TABLE IF NOT EXISTS lyrics(
        position INT,
        body TEXT
      )`;

    await pool.query(queryText);
    pool.end();
  }

  async clearTables() {
    const pool = this.newPool();
    const queryText = `DELETE FROM lyrics`;

    await pool.query(queryText);
    pool.end();
  }

  async dropTables() {
    const pool = this.newPool();
    const queryText = `DROP TABLE lyrics`;

    await pool.query(queryText);
    pool.end();
  }

  async createLyric(position, body) {
    const pool = this.newPool();
    const queryText = `INSERT INTO lyrics(position, body) VALUES($1, $2)`;

    await pool.query(queryText, [position, body]);
    pool.end();
  }

  all(tableName) {
    const pool = this.newPool();
    const queryText = `SELECT * FROM ${tableName} ORDER BY position`;

    return new Promise ((resolve, reject) => {
      pool
        .query(queryText)
        .then((res) => {
          pool.end();
          return resolve(res);
        })
        .catch((err) => {
          pool.end();
          return reject(err);
        });
    })
  }
}


module.exports = new DB();
