// searchQuery.js

const db = require("../db/dbConfig.js");

const searchDatabase = async ({ search, filterBy, value }) => {

  try {
    let queryString = "";
    
    if (search === "products") {
      queryString = "SELECT * FROM products";
    } else if (search === "sellers") {
      queryString = "SELECT * FROM sellers";
    } else {
      throw new Error("Invalid search option");
    }

    if (filterBy === "name") {
      queryString += ` WHERE name ILIKE $1`;
    } else if (filterBy === "category") {
      queryString += ` WHERE category = $1`;
    } else if (filterBy === "seller_id") {
      queryString += ` WHERE seller_id = $1`;
    } else if (filterBy === "cost") {
      queryString += ` WHERE cost <= $1`;
    } 

    const results = await db.query(queryString, [value]);
    return results;
  } catch (error) {
    console.error("Error while executing the query:", error);
    return { error: "An error occurred while fetching the data." };
  }
};

module.exports = {
    searchDatabase
};