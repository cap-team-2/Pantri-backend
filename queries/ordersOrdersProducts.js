const db = require("../db/dbConfig.js");

const getAllOrdersOrdersProducts = async () => {
    try {
        const allOrdersOrdersProducts = await db.any("SELECT * FROM (orders JOIN orders_products ON orders.id = orders_products.order_id JOIN products ON orders_products.product_id = products.id)");
        return allOrdersOrdersProducts;
    } catch {
        throw error;
    };
};

