const db = require("../db/dbConfig.js");


const getProducts = async ({ q, category, cost }) => {
  try {
    let queryString = "SELECT * FROM products";
    let values = [];
    let conditions = [];

    if (q) {
      conditions.push(`name ILIKE $${conditions.length + 1}`);
      values.push(`%${q}%`);
    }

    if (category) {
      conditions.push(`category ILIKE $${conditions.length + 1}`);
      values.push(`%${category}%`);
    }

    if (cost) {
      conditions.push(`cost <= $${conditions.length + 1}`);
      values.push(parseFloat(cost));
    }

    if (conditions.length > 0) {
      queryString += " WHERE " + conditions.join(" AND ");
    }

    const results = await db.any(queryString, values);

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

const createProduct = async (product) => {
  //
  try {
    const newProduct = await db.one(
      "INSERT INTO products(id, seller_id, name, image, cost, weight, unit_measurement, category, description, stock) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
      [
        product.id,
        product.seller_id,
        product.name,
        product.image,
        product.cost,
        product.weight,
        product.unit_measurement,
        product.category,
        product.description,
        product.stock,
      ]
    );
    return newProduct;
  } catch (error) {
    return { error: error };
  }
};

const updateProduct = async (id, products) => {
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
