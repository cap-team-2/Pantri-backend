const db = require("../db/dbConfig.js");

const joinProductsOnCartOnSessionID = async (sessionID) => {
    try {
        const allData = await db.any("SELECT * FROM (shopping_session JOIN cart_products ON shopping_session.id = cart_products.session_id JOIN products ON cart_products.product_id = products.id) WHERE shopping_session.id=$1", sessionID);
        return allData;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    joinProductsOnCartOnSessionID
}