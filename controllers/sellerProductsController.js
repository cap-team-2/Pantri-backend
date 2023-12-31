const express = require("express");
const sellerProducts = express.Router();
const { getAllProductsBySeller } = require("../queries/sellerProducts.js");

sellerProducts.get("/:id", async (req, res) => {
    const {id} = req.params;
    const getProductsBySeller = await getAllProductsBySeller(id);

    if (getProductsBySeller) {
        res.status(200).json(getProductsBySeller);
    } else {
        res.status(500).json({ error: error });
    };
});

module.exports = sellerProducts;