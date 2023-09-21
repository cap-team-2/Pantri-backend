const db = require("../db/dbConfig.js");

const getAllSellers = async () => {
    try {
        const allSellers = await db.any("SELECT * FROM users WHERE users.type='seller'");
        return allSellers;
    } catch (error) {
        return {error: error};
    };
}; 

const getSeller = async (id) => {
    try {
        const sellers = await db.any("SELECT * FROM users WHERE users.type='seller' AND id=$1", id);
        return sellers;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllSellers, 
    getSeller
};