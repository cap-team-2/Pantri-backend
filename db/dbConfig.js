const pgp = require("pg-promise")();
require("dotenv").config()

const db = pgp(process.env.DATABASE_URL);
console.log(process.env.DATABASE_URL, 'TEST')

module.exports = db;


