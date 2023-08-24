const db = require("../db/dbConfig.js");

const getAllOrders = async () => {
    try {
        const allOrders = await db.any("SELECT * FROM orders");
        return allOrders;
    } catch (error) {
        return { error: error };
    };
};

const getOrders = async (id) => {
    try {
        const oneOrder = await db.oneOrNone("SELECT * FROM orders WHERE id=$1", id);
        return oneOrder;
    } catch (error) {
        return { error: error };
    };
};

const createOrders = async () => {
    try {
        const newOrder = await db.one( 
            "INSERT INTO orders(user_id, order_placed_at) VALUES ($1, $ 2) RETURNING *",
            [orders.user_id, orders.order_placed_at]
        );
        return newOrder;
    } catch (error) {
        console.error(error);
    };
};

const updateOrders = async (id) => {
    try {
        const updatedOrders = await db.one (
            "UPDATE orders SET user_id=$1, order_placed_at=$2, RETURNING *",
            [orders.user_id, orders.order_placed_at, id]
        );
        return updatedOrders;
    } catch (error) {
        console.error(error);
    };
};

const deleteOrders = async (id) => {
    try {
        const deletedOrders = await db.one("DELETE FROM orders WHERE id=$1 RETURNING *", [id]);
        return deletedOrders;
    } catch (error) {
        console.error(error);
    };
};

module.exports = {
    getAllOrders,
    getOrders,
    createOrders,
    updateOrders,
    deleteOrders,
};