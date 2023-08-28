const express = require("express");
const products = express.Router();
const { getAllProducts, getProduct, createProduct, updateProduct, deleteProduct} = require("../queries/products.js");

products.get("/", async (req, res) => {
    const allProducts = await getAllProducts();
    if (allProducts[0]) {
        res.status(200).json(allProducts);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
});

products.get("/:id", async (req, res) => {
    const {id} = req.params;
    const product = await getProduct(id);
    if (product) {
        res.status(200).json(product);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

products.post("/", async (req, res) =>{
    try {
        const product = await createProduct(req.body);
        res.status(200).json(product);
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