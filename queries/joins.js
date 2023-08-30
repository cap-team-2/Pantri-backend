const db = require("../db/dbConfig.js");

const getAllData = async () => {
    try {
        const allData = await db.any("SELECT * FROM (users JOIN orders ON users.id = orders.user_id JOIN orders_products ON orders.id = orders_products.order_id JOIN products ON orders_products.product_id = products.id)");
        return allData;
    } catch (error) {
        throw error;
    };
};

const getUserWholeOrder = async (id) => {
    try {
        const allDataByUser = await db.any("SELECT * FROM (users JOIN orders ON users.id = orders.user_id JOIN orders_products ON orders.id = orders_products.order_id JOIN products ON orders_products.product_id = products.id) WHERE users.id=$1", id);
        return allDataByUser;
    } catch (error) {
        throw error;
    };
};

module.exports = {
    getAllData,
    getUserWholeOrder
}