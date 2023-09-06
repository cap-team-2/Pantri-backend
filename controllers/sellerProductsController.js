const express = require("express");
const sellerProducts = express.Router();
const { getAllProductsBySeller } = require("../queries/sellerProducts.js");

sellerProducts.get("/:id", async (req, res) => {
    const {id} = req.params;
    const getProductsFromSeller = await getAllProductsBySeller(id);
    if (getProductsFromSeller[0]) {
        res.status(200).json(getProductsFromSeller);
    } else {
        res.status(500).json({ error: error });
    };
});

module.exports = sellerProducts;