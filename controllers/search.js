const express = require("express");
const search = express.Router();
const { getAllProducts } = require("../queries/products.js")

search.get("/dairy/:key",async (req, res) => {
    const {key} = req.params;
    // const {id} = req.params;
    let data = await getAllProducts();
    const filteredProducts = data.filter((product) => product.name.includes(key) && product.category.includes("dairy"));
    res.send(filteredProducts);
});

search.get("/meat/:key",async (req, res) => {
    const {key} = req.params;
    // const {id} = req.params;
    let data = await getAllProducts();
    const filteredProducts = data.filter((product) => product.name.includes(key) && product.category.includes("meat"));
    res.send(filteredProducts);
});

search.get("/dairy",async (req, res) => {
    const {key} = req.params;
    // const {id} = req.params;
    let data = await getAllProducts();
    const filteredProducts = data.filter((product) => product.category.includes("dairy"));
    res.send(filteredProducts);
});

search.get("/vegan",async (req, res) => {
    const {key} = req.params;
    // const {id} = req.params;
    let data = await getAllProducts();
    const filteredProducts = data.filter((product) => product.category.includes("vegan"));
    res.send(filteredProducts);
});

// search.get("/seller:key",async (req, res) => {
//     const {key} = req.params;
//     let data = await getAllProducts();
//     const filteredProducts = data.filter((product) => product.seller.includes(key));
//     res.send(filteredProducts);
// })

module.exports = search;