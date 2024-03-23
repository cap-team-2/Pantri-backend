const pgp = require("pg-promise")();
require("dotenv").config();

const { DATABASE_URL, PG_HOST, PG_PORT, PG_DATABASE, PG_USER } = process.env;

const db = pgp({
  connectionString: DATABASE_URL 
});



module.exports = db;

