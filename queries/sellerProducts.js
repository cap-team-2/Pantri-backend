const db = require("../db/dbConfig.js");

const getAllUserWithProducts = async () => {
    try {
        const allUserWithProducts = await db.any("SELECT * FROM (users JOIN products ON users.is = products.seller)")
    } catch (error) {
        return {error: error};
    };
};

const getAllProductsBySeller = async (id) => {
    try {
        const allProductsBySeller = await db.any("SELECT * FROM (users JOIN products ON users.id = products.seller) WHERE users.id=$1", id)
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllProductsBySeller,
}