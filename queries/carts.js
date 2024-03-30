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
            "INSERT INTO cart (user_id, products, quantity, total, created_at) VALUES($1, $2, $3, $4, $5) RETURNING *",
            [ cart.user_id, cart.products, cart.quantity, cart.total, cart.created_at ]
        );
        return newCart;
    } catch (error) {
        return {error: error};
    };
};

const updateCart = async (cart_id, cart) => {
    try {
        const updatedCart = await db.one(
            "UPDATE carts SET products=$1, quantity=$2, total=$3, WHERE id=$4 RETURNING *",
            [cart.products, cart.quantity, cart.total, cart_id]
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