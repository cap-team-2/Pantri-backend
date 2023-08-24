const express = require("express");
const orders_products = express.Router();
const { getAllOrderProduct, getOrderProduct, createOrderProduct, updateOrderProduct, deleteOrderProduct} = require("../queries/orderProduct.js");

orders_products.get("/", async (req, res) => {
    const allOrderProduct = await getAllOrderProduct();
    if (!allOrderProduct.error) {
        res.status(200).json(allOrderProduct);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
})

orders_products.get("/:id", async (req, res) => {
    const {id} = req.params;
    const orders_Products = await getOrderProduct(id);
    if (orders) {
        res.status(200).json(orders_Products);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

orders_products.post("/", async (req, res) =>{
    try {
        const orders_Products = await createOrderProduct(req.body);
        res.status(200).json(orders_Products);
    } catch (error) {
        res.status(400).json({ error: error})
    };
}); 

orders_products.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedOrderProducts = await updateOrderProduct(id, req.body);
    res.status(200).json(updatedOrderProducts);
});

orders_products.delete("/:id", async(req, res) => {
    const {id} = req.params;
    const deletedOrderProducts = await deleteOrderProduct(id)
    if (deletedOrderProducts.id) {
        res.status(200).json(deletedOrderProducts);
    } else {
        res.status(404).json("Order Not Found!")
    };
}) 

module.exports = orders_products