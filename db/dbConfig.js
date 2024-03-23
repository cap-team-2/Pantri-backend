const pgp = require("pg-promise")();
require("dotenv").config();

const { DATABASE_URL, PG_HOST, PG_PORT, PG_DATABASE, PG_USER } = process.env;

const cn = DATABASE_URL
?{
    connectionString: DATABASE_URL,
    max: 30,
}
: {
    host: PG_HOST || "localhost",
    port: PG_PORT,
    database: PG_DATABASE,
    user: PG_USER,
};
console.log(process.env.DATABASE_URL);
console.log(process.env.PG_HOST);
const db = pgp(cn);

module.exports = db;

