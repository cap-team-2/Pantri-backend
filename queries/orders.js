const db = require("../db/dbConfig.js");

const getAllOrders = async () => {
    try {
        const allOrders = await db.any("SELECT * FROM orders");
        return allOrders;
    } catch (error) {
        throw  error;
    };
};

const getOrder = async (id) => {
    try {
        const order = await db.oneOrNone("SELECT * FROM orders WHERE id=$1", id);
        return order;
    } catch (error) {
        throw  error;
    };
};

const createOrder = async () => {
    try {
        const newOrder = await db.one( 
            "INSERT INTO orders(order_placed_at) VALUES ($1) RETURNING *",
            [orders.order_placed_at]
        );
        return newOrder;
    } catch (error) {
        throw  error;
    };
};

const updateOrder = async (id) => {
    try {
        const updatedOrder = await db.one (
            "UPDATE order_placed_at=$1, RETURNING *",
            [orders.order_placed_at, id]
        );
        return updatedOrder;
    } catch (error) {
        throw  error;
    };
};

const deleteOrder = async (id) => {
    try {
        const deletedOrder = await db.one("DELETE FROM orders WHERE id=$1 RETURNING *", [id]);
        return deletedOrder;
    } catch (error) {
        throw  error;
    };
};

module.exports = {
    getAllOrders,
    getOrder,
    createOrder,
    updateOrder,
    deleteOrder,
};