const express = require("express");
const cartProducts = express.Router();
const { getCartProducts, getCartProduct, createCartProduct, updateCartProduct, deleteCartProduct } = require("../queries/cartProducts");

cartProducts.get("/", async (req, res) => {
    const allCartProducts = await getCartProducts();
    if (allCartProducts[0]) {
        res.status(200).json(allCartProducts)
    } else {
        res.status(500).json({ error: "Sever Error" })
    };
})

cartProducts.get("/:id", async (req, res) => {
    const {id} = req.params;
    const cartProduct = await getCartProduct(id);
    if (cartProduct) {
        res.status(200).json(cartProduct);
    } else {
        res.status(404).json({ error: "User Not Found!"})
    };
});

cartProducts.post("/", async (req, res) => {
    try  {
        const newCartProduct = await createCartProduct(req.body);
        res.status(200).json(newCartProduct);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

cartProducts.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedCartProduct = updateCartProduct(id, req.body);
    res.status(200).json(updatedCartProduct);
});

cartProducts.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedCartProduct = await deleteCartProduct(id);
    if (deletedCartProduct.cart_id) {
        res.status(200).json(deletedCartProduct);
    } else {
        res.status(404).json("cartProducts Was Not Found!");
    };
});

module.exports = cartProducts;