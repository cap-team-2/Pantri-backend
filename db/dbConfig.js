const pgp = require("pg-promise")();

const db = pgp({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});



// Add error handling
db.any('SELECT 1')
  .then(() => {
    console.log('Database connection successful');
  })
  .catch(error => {
    console.error('Error connecting to the database:', error);
  });

module.exports = db;


