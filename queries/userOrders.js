const db = require("../db/dbConfig");

const getAllUserOrders = async () => {
    try {
        const allUserOrders = await db.any("SELECT * FROM (users JOIN orders ON users.id = orders.user_id)");
        return allUserOrders;
    } catch (error) {
        return {error: error};
    };
};

const getUserOrder = async (id) => {
    try {
        const userOrders = await db.one("SELECT * FROM (users JOIN orders ON users.id = orders.users_id) WHERE orders.id=$1", id);
        return userOrders;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllUserOrders,
    getUserOrder,
}