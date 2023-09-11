const db = require("../db/dbConfig.js");

const getAllSellers = async () => {
    try {
        const allSellers = await db.any("SELECT * FROM users WHERE users.type='seller'");
        return allSellers;
    } catch (error) {
        return {error: error};
    };
}; 

module.exports = {
    getAllSellers
}