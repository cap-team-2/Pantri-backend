const db = require("../db/dbConfig.js");

const getAllCarts = async () => {
    try {
        const allCarts = await db.any("SELECT * FROM carts");
        return allCarts;
    } catch (error) {
        return {error: error};
    };
};

const getCart = async (cart_id) => {
    try {
        const cart = await db.oneOrNone("SELECT * FROM carts WHERE id=$1", cart_id);
        return cart;
    } catch (error) {
        return {error: error};
    };
};


const createCart = async (cart) => {
    try {
        const newCart = await db.one(
            "INSERT INTO cart (user_id, products, quantity) VALUES($1, $2, $3) RETURNING *",
            [ cartProduct.session_id, cartProduct.product_id, cartProduct.quantity ]
        );
        return newCart;
    } catch (error) {
        return {error: error};
    };
};

const updateCart = async (cart_id, cart) => {
    try {
        const updatedCart = await db.one(
            "UPDATE carts SET quantity=$1 WHERE id=$2 RETURNING *",
            [cartProduct.quantity, cart_id]
        );
        return updatedCart;
    } catch (error) {
        return {error: error};
    };
};

const deleteCart = async (cart_id) => {
    try {
        const deletedCart = await db.one("DELETE FROM carts WHERE id=$1 RETURNING *", [cart_id]);
        return deletedCart;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllCarts,
    getCart,
    createCart,
    updateCart,
    deleteCart
}