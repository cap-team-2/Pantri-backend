const express = require("express");
const orders_products = express.Router();
const { getAllOrdersProducts, getOrderProduct, createOrderProduct, updateOrderProduct, deleteOrderProduct} = require("../queries/ordersProducts.js");

orders_products.get("/", async (req, res) => {
    const allOrderProducts = await getAllOrdersProducts();
    if (allOrderProducts[0]) {
        res.status(200).json(allOrderProducts);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
})

orders_products.get("/:id", async (req, res) => {
    const {id} = req.params;
    const oneOrderProduct = await getOrderProduct(id);
    if (oneOrderProduct) {
        res.status(200).json(oneOrderProduct);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

orders_products.post("/", async (req, res) =>{
    try {
        const newOrderProduct = await createOrderProduct(req.body);
        res.status(200).json(newOrderProduct);
    } catch (error) {
        res.status(400).json({ error: error})
    };
}); 

orders_products.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedOrderProduct = await updateOrderProduct(id, req.body);
    res.status(200).json(updatedOrderProduct);
});

orders_products.delete("/:id", async(req, res) => {
    const {id} = req.params;
    const deletedOrderProduct = await deleteOrderProduct(id)
    if (deletedOrderProduct.id) {
        res.status(200).json(deletedOrderProduct);
    } else {
        res.status(404).json("Order Not Found!")
    };
}) 

module.exports = orders_products