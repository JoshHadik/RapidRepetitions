module.exports = {
  pgHost: process.env.RDS_HOSTNAME,
  pgUser: process.env.RDS_USERNAME,
  pgDatabase: process.env.RDS_DB_NAME,
  pgPassword: process.env.RDS_PASSWORD,
  pgPort: process.env.RDS_PORT
}
