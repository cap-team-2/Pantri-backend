const db = require("../db/dbConfig.js");

const getAllProducts = async () => {
    try {
        const allProducts = await db.any("SELECT * FROM products");
        return allProducts;
    } catch (error) {
        return {error: error};
    };
};

const getProduct = async (id) => {
    try {
        const oneProduct = await db.oneOrNone("SELECT * FROM products WHERE id=$1", id);
        return oneProduct;
    } catch (error) {
        return {error: error};
    };
};

const createProduct = async () => {
    try {
        const newProduct = await db.one( 
            "INSERT INTO products(seller, name, image, cost, weight, unit_measurement, category, description, stock) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
            [products.seller, products.name, products.image, products.cost, products.weight, products.unit_measurement, products.category, products.description, products.stock]
        );
        return newProduct;
    } catch (error) {
        return {error: error};
    };
};

const updateProduct = async (id) => {
    try {
        const updatedProduct = await db.one (
            "UPDATE products SET seller=$1, name=$2, image=$3, cost=$4, weight=$5, unit_measurement=$6, category=$7, description=$8, stock=$9 WHERE id=$10 RETURNING *",
            [products.seller, products.name, products.image, products.cost, products.weight, products.unit_measurement, products.category, products.description, products.stock, id]
        );
        return updatedProduct;
    } catch (error) {
        return {error: error};
    };
};

const deleteProduct = async (id) => {
    try {
        const deletedProduct = await db.one("DELETE FROM product WHERE id=$1 RETURNING *", [id]);
        return deletedProduct;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllProducts,
    getProduct,
    createProduct,
    updateProduct,
    deleteProduct,
};
