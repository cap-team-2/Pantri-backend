const db = require("../db/dbConfig.js");

const getCartProducts = async () => {
    try {
        const allCartProducts = await db.any("SELECT * FROM cart_products");
        return allCartProducts;
    } catch (error) {
        return {error: error};
    };
};

const getCartProduct = async (id) => {
    try {
        const cartProduct = await db.oneOrNone("SELECT * FROM cart_products WHERE id=$1", id);
        return cartProduct;
    } catch (error) {
        return {error: error};
    };
};


const createCartProduct = async (cartProduct) => {
    try {
        const newCartProduct = await db.one(
            "INSERT INTO cart_products (quantity) VALUES($1) RETURNING *",
            [ cartProduct.quantity ]
        );
        return newCartProduct;
    } catch (error) {
        return {error: error};
    };
};

const updateCartProduct = async (id, cartProduct) => {
    try {
        const updatedUser = await db.one(
            "UPDATE cart_products SET quantity=$1"
            [cartProduct.quantity, id]
        );
        return updatedUser;
    } catch (error) {
        return {error: error};
    };
};

const deleteCartProduct = async (id) => {
    try {
        const deletedUser = await db.one("DELETE FROM cart_products WHERE id=$1 RETURNING *", [id]);
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