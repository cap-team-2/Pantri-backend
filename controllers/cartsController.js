const express = require("express");
const carts = express.Router();
const { getAllCarts, getCart, createCart, updateCart, deleteCart } = require("../queries/carts");

carts.get("/", async (req, res) => {
    const allCarts = await getAllCarts();
    if (allCarts.error) {
        res.status(500).json({ error: "Sever Error" })
    } else if (allCarts[0]) {
        res.status(200).json(allCarts)
    } else {
        res.status(404).json('No products in Cart')
    }
})

carts.get("/:id", async (req, res) => {
    const {id} = req.params;
    const cart = await getCart(id);
    if (cart) {
        res.status(200).json(cart);
    } else {
        res.status(404).json({ error: "User Not Found!"})
    };
});

carts.post("/", async (req, res) => {
    try  {
        const newCart = await createCart(req.body);
        res.status(200).json(newCart);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

carts.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedCart = updateCart(id, req.body);
    res.status(200).json(updatedCart);
});

carts.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedCart = await deleteCart(id);
    if (deletedCart.cart_id) {
        res.status(200).json(deletedCart);
    } else {
        res.status(404).json("Cart Was Not Found!");
    };
});

module.exports = carts;