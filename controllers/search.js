const express = require("express");
const search = express.Router();
const { getAllProducts } = require("../queries/products.js")

search.get("/:key",async (req, res) => {
    const {key} = req.params
    const products = await getAllProducts();
    let data = await getAllProducts()
    const data2 = data.filter((product) => product.name === key)
    res.send(data2);
})

module.exports = search;