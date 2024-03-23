const pgp = require("pg-promise")();
require("dotenv").config();

const { DATABASE_URL } = process.env;

const db = pgp(DATABASE_URL);

module.exports = db;

