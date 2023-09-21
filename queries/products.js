const db = require("../db/dbConfig.js");

// getProducts to getProducts
const getProducts = async (query = undefined) => {

  try {
    let queryString = "SELECT * FROM products";
    let values = [];
    if (query) {
      queryString += " WHERE name ILIKE $1";
      values.push(`%${query}%`);
    }
    const results = await db.query(queryString, values);
    return results;
  } catch (error) {
    console.error("Error while executing the query:", error);
    return { error: "An error occurred while fetching the products." };
  }

};

const getProduct = async (id) => {
  try {
    const oneProduct = await db.oneOrNone(
      "SELECT * FROM products WHERE id=$1",
      id
    );
    return oneProduct;
  } catch (error) {
    return { error: error };
  }
};

const createProduct = async (productData) => {
  //
  try {
    const newProduct = await db.one(
      "INSERT INTO products(id, seller_id, name, image, cost, weight, unit_measurement, category, description, stock) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
      [
        products.id,
        products.seller_id,
        products.name,
        products.image,
        products.cost,
        products.weight,
        products.unit_measurement,
        products.category,
        products.description,
        products.stock,
      ]
    );
    return newProduct;
  } catch (error) {
    return { error: error };
  }
};

const updateProduct = async (id) => {
  try {
    const updatedProduct = await db.one(
      "UPDATE products SET seller_id=$1, name=$2, image=$3, cost=$4, weight=$5, unit_measurement=$6, category=$7, description=$8, stock=$9 WHERE id=$10 RETURNING *",
      [
        products.seller_id,
        products.name,
        products.image,
        products.cost,
        products.weight,
        products.unit_measurement,
        products.category,
        products.description,
        products.stock,
        id,
      ]
    );
    return updatedProduct;
  } catch (error) {
    return { error: error };
  }
};

const deleteProduct = async (id) => {
  try {
    const deletedProduct = await db.one(
      "DELETE FROM product WHERE id=$1 RETURNING *",
      [id]
    );
    return deletedProduct;
  } catch (error) {
    return { error: error };
  }
};

module.exports = {
  getProducts,
  getProduct,
  createProduct,
  updateProduct,
  deleteProduct,
};
