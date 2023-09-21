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
        const getSeller = await db.one("SELECT * FROM users WHERE id=$1 AND type=$2", [id, users.type]);
        return getSeller;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllSellers, 
    getSeller
};