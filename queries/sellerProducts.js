const db = require("../db/dbConfig.js");

const getAllProductsBySeller = async (id) => {
    try {
        const allProductsBySeller = await db.any("SELECT * FROM (users JOIN products ON users.id = products.seller) WHERE users.id=$1", id)
    } catch (error) {
        throw error;
    };
};

module.exports = {
    getAllProductsBySeller,
}