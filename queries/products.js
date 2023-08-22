const db = require("../db/dbConfig.js");

const getAllProduct = async () => {
    try {
        const allProduct = await db.any("SELECT * FROM product");
        return allProduct;
    } catch (error) {
        return { error: error };
    };
};

const getProduct = async (id) => {
    try {
        const oneProduct = await db.oneOrNone("SELECT * FROM product WHERE id=$1", id);
        return oneProduct;
    } catch (error) {
        return { error: error };
    };
};

const createProduct = async () => {
    try {
        const newProduct = await db.one( 
            "INSERT INTO product(product_seller, product_name, product_image, product_cost, product_weigth, product_unit_measurement, product_category, product_description, product_stock) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
            [product.product_seller, product.product_name, product.product_image, product.product_cost, product.product_weigth, product.product_unit_measurement, product.product_category, product.product_description, product.product_stock]
        );
        return newProduct;
    } catch (error) {
        console.error(error);
    };
};

const updateProduct = async (id) => {
    try {
        const updatedProduct = await db.one (
            "UPDATE product SET product_seller=$1, product_name=$2, product_image=$3, product_cost=$4, product_weight=$5, product_unit_measurement=$6, product_category=$7, product_description=$8, product_stock=$9 WHERE id=$10 RETURNING *",
            [product.product_seller, product.product_name, product.product_image, product.product_cost, product.product_weigth, product.product_unit_measurement, product.product_category, product.product_description, product.product_stock, id]
        );
        return updatedProduct;
    } catch (error) {
        console.error(error);
    };
};

const deleteProduct = async (id) => {
    try {
        const deletedProduct = await db.one("DELETE FROM product WHERE id=$1 RETURNING *", [id]);
        return deletedProduct;
    } catch (error) {
        console.error(error);
    };
};

module.exports = {
    getAllProduct,
    getProduct,
    createProduct,
    updateProduct,
    deleteProduct,
};
