const express = require("express");
const orders = express.Router();
const { getAllOrders, getOrder, createOrder, updateOrder, deleteOrder} = require("../queries/orders.js");

orders.get("/", async (req, res) => {
    const allOrders = await getAllOrders();
    if (allOrders[0]) {
        res.status(200).json(allOrders);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
})

orders.get("/:id", async (req, res) => {
    const {id} = req.params;
    const orders = await getOrder(id);
    if (orders) {
        res.status(200).json(orders);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

orders.post("/", async (req, res) =>{
    try {
        const orders = await createOrder(req.body);
        res.status(200).json(orders);
    } catch (error) {
        res.status(400).json({ error: error})
    };
}); 

orders.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedOrder = await updateOrder(id, req.body);
    res.status(200).json(updatedOrder);
});

orders.delete("/:id", async(req, res) => {
    const {id} = req.params;
    const deletedOrder = await deleteOrder(id)
    if (deletedOrder.id) {
        res.status(200).json(deletedOrder);
    } else {
        res.status(404).json("Order Not Found!")
    };
}) 

module.exports = orders