const db = require("../db/dbConfig.js");

const getAllProductsBySeller = async (id) => {
    try {
        const getProductsBySeller = await db.any("SELECT * FROM (users JOIN products ON users.id = products.seller_id) WHERE users.id=$1", [id])
        return getProductsBySeller;
    } catch (error) {
        return { error: error };
    };
};

module.exports = {
    getAllProductsBySeller,
}