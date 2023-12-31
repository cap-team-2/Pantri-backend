const db = require("../db/dbConfig.js");

const getAllOrders = async () => {
    try {
        const allOrders = await db.any("SELECT * FROM orders");
        return allOrders;
    } catch (error) {
        return {error: error};
    };
};

const getOrder = async (id) => {
    try {
        const order = await db.oneOrNone("SELECT * FROM orders WHERE id=$1", id);
        return order;
    } catch (error) {
        return {error: error};
    };
};

const createOrder = async (orders) => {
    try {
        const newOrder = await db.one( 
            "INSERT INTO orders(total, order_placed_at) VALUES ($1, $2) RETURNING *",
            [ total, orders.order_placed_at ]
        );
        return newOrder;
    } catch (error) {
        return {error: error};
    };
};

const updateOrder = async (id, orders) => {
    try {
        const updatedOrder = await db.one (
            "UPDATE orders SET total=$1, order_placed_at=$2, RETURNING *",
            [ total, orders.order_placed_at, id]
        );
        return updatedOrder;
    } catch (error) {
        return {error: error};
    };
};

const deleteOrder = async (id) => {
    try {
        const deletedOrder = await db.one("DELETE FROM orders WHERE id=$1 RETURNING *", [id]);
        return deletedOrder;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllOrders,
    getOrder,
    createOrder,
    updateOrder,
    deleteOrder,
};