const db = require("../db/dbConfig.js");

const getCartProducts = async () => {
    try {
        const allCartProducts = await db.any("SELECT * FROM cart_products");
        return allCartProducts;
    } catch (error) {
        return {error: error};
    };
};

const getCartProduct = async (cart_id) => {
    try {
        const cartProduct = await db.oneOrNone("SELECT * FROM cart_products WHERE id=$1", cart_id);
        return cartProduct;
    } catch (error) {
        return {error: error};
    };
};


const createCartProduct = async (cartProduct) => {
    try {
        const newCartProduct = await db.one(
            "INSERT INTO cart_products (session_id, product_id, quantity) VALUES($1, $2, $3) RETURNING *",
            [ cartProduct.session_id, cartProduct.product_id, cartProduct.quantity ]
        );
        return newCartProduct;
    } catch (error) {
        return {error: error};
    };
};

const updateCartProduct = async (cart_id, cartProduct) => {
    try {
        const updatedUser = await db.one(
            "UPDATE cart_products SET quantity=$1 WHERE id=$2 RETURNING *",
            [cartProduct.quantity, cart_id]
        );
        return updatedUser;
    } catch (error) {
        return {error: error};
    };
};

const deleteCartProduct = async (cart_id) => {
    try {
        const deletedUser = await db.one("DELETE FROM cart_products WHERE id=$1 RETURNING *", [cart_id]);
        return deletedUser;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getCartProducts,
    getCartProduct,
    createCartProduct,
    updateCartProduct,
    deleteCartProduct,
}