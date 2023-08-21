const express = require("express");
const product = express.Router();
const { getAllProduct, getProduct, createProduct, updateProduct, deleteProduct} = require("../queries/products.js");

product.get("/", async (req, res) => {
    const allProduct = await getAllProduct();
    if (!allProduct.error) {
        res.status(200).json(allProduct);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
});

product.get("/:id", async (req, res) => {
    const {id} = req.params;
    const product = await getProduct(id);
    if (product) {
        res.status(200).json(product);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

product.post("/", async (req, res) =>{
    try {
        const product = await createProduct(req.body);
        res.status(200).json(product);
    } catch (error) {
        res.status(400).json({ error: error})
    };
});

product.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedProduct = await updateProduct(id, req.body);
    res.status(200).json(updatedProduct);
});

product.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedProduct = await deleteProduct(id);
    if (deletedProduct.id) {
        res.status(200).json(deletedProduct);
    } else {
        res.status(404).json("Product Not Found!")
    };
});

module.exports = product;