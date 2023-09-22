const express = require("express");
const products = express.Router();
const { getProducts,filterProducts, getProduct, createProduct, updateProduct, deleteProduct} = require("../queries/products.js");

products.get("/", async (req, res) => {
    const { q } = req.query;
    const results = await getProducts(q)
    if (results.length) {
        res.status(200).json(results)
    } else {
        res.status(404).json({ error: "No Products Found"})
    }
});

products.get("/", async (req, res) => {
    const { q } = req.query;
    const results = await filterProducts(q)
    if (results.length) {
        res.status(200).json(results)
    } else {
        res.status(404).json({ error: "No Products Found"})
    }
});

products.get("/:id", async (req, res) => {
    const { id } = req.params;
    const oneProduct = await getProduct(id);
    if (oneProduct) {
        res.status(200).json(oneProduct);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

products.post("/", async (req, res) =>{
    try {
        const newProduct = await createProduct(req.body);
        res.status(200).json(newProduct);
    } catch (error) {
        res.status(400).json({ error: error})
    };
});

products.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedProduct = await updateProduct(id, req.body);
    res.status(200).json(updatedProduct);
});

products.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedProduct = await deleteProduct(id);
    if (deletedProduct.id) {
        res.status(200).json(deletedProduct);
    } else {
        res.status(404).json("Product Not Found!")
    };
});

module.exports = products;