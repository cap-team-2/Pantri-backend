const pgp = require('pg-promise')();
require('dotenv').config();

const { DATABASE_URL, PG_HOST, PG_PORT, PG_DATABASE, PG_USER, PG_PASSWORD } = process.env;

const cn = DATABASE_URL
  ? {
      connectionString: DATABASE_URL,
      max: 30,
    }
  : {
      host: PG_HOST,
      port: PG_PORT,
      database: PG_DATABASE,
      user: PG_USER,
      password: PG_PASSWORD
    };


const db = pgp(cn);

module.exports = db;
// const pgp = require("pg-promise")();

// let db;

// if (process.env.DATABASE_URL) {
//     db = pgp({
//         connectionString: process.env.DATABASE_URL,
//         ssl: {
//             rejectUnauthorized: false
//         }
//     });
// } else {
//     db = pgp({
//         host: process.env.PG_HOST,
//         port: process.env.PG_PORT,
//         database: process.env.PG_DATABASE,
//         user: process.env.PG_USER,
//         password: process.env.PG_PASSWORD 
//     });
// }

// module.exports = db;