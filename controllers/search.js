const express = require("express");
const search = express.Router();
const { getAllProducts } = require("../queries/products.js")

search.get("/:key",async (req, res) => {
    const { key } = req.params
    let data = await getAllProducts();
    const lowerCaseKey = key.toLowerCase();
    const filteredProducts = data.filter((product) => {
        const productName= product.name.split(' ');
        const productNameArr = productName.map((ele) => {
            return ele.toLowerCase()
        })

        return productNameArr.some((name) => name.includes(lowerCaseKey) || lowerCaseKey.includes(name)) || product.category.toLowerCase().includes(lowerCaseKey) || lowerCaseKey.includes(product.category.toLowerCase())
    }) 

    res.send(filteredProducts);
})

module.exports = search;