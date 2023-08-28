const db = require("../db/dbConfig.js");

const getAllOrderProduct = async () => {
    try {
        const allOrderProduct = await db.any("SELECT * FROM orders_products");
        return allOrderProduct;
    } catch (error) {
        throw  error;
    };
};

const getOrderProduct = async (id) => {
    try {
        const oneOrderProduct = await db.oneOrNone("SELECT * FROM orders_products WHERE id=$1", id);
        return oneOrderProduct;
    } catch (error) {
        throw  error;
    };
};

const createOrderProduct = async () => {
    try {
        const newOrderProduct = await db.one( 
            "INSERT INTO orders_products(order_id, product_id, quantity) VALUES ($1, $2, $3) RETURNING *",
            [orders_products.order_id, orders_products.product_id, orders_products.quanitiy]
        );
        return newOrderProduct;
    } catch (error) {
        throw  error;
    };
};

const updateOrderProduct = async (id) => {
    try {
        const updatedOrderProduct = await db.one (
            "UPDATE orders_products SET order_id=$1, product_id=$2, quantity=$3, RETURNING *",
            [orders_products.order_id, orders_products.product_id, quantity, id]
        );
        return updatedOrderProduct;
    } catch (error) {
        throw  error;
    };
};

const deleteOrderProduct = async (id) => {
    try {
        const deletedOrderProduct = await db.one("DELETE FROM orders_products WHERE id=$1 RETURNING *", [id]);
        return deletedOrderProduct;
    } catch (error) {
        throw  error;
    };
};

module.exports = {
    getAllOrderProduct,
    getOrderProduct,
    createOrderProduct,
    updateOrderProduct,
    deleteOrderProduct,
};