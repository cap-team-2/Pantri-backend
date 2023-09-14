const express = require("express");
const search = express.Router();
const { getAllProducts } = require("../queries/products.js")

search.get("/:key",async (req, res) => {
    const {key} = req.params;
    let data = await getAllProducts();
    const filteredProducts = data.filter((product) => product.name.includes(key));
    res.send(filteredProducts);
})

module.exports = search;