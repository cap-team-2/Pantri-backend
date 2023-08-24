const express = require("express");
const orders = express.Router();
const { getAllOrders, getOrders, createOrders, updateOrders, deleteOrders} = require("../queries/orders.js");

orders.get("/", async (req, res) => {
    const allOrders = await getAllOrders();
    if (!allOrders.error) {
        res.status(200).json(allOrders);
    } else {
        res.status(500).json({ error: "Server Error "});
    };
})

orders.get("/:id", async (req, res) => {
    const {id} = req.params;
    const orders = await getOrders(id);
    if (orders) {
        res.status(200).json(orders);
    } else {
        res.status(404).json({ error: "Not Found" });
    };
});

orders.post("/", async (req, res) =>{
    try {
        const orders = await createOrders(req.body);
        res.status(200).json(orders);
    } catch (error) {
        res.status(400).json({ error: error})
    };
}); 

orders.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedOrders = await updateOrders(id, req.body);
    res.status(200).json(updatedOrders);
});

orders.delete("/:id", async(req, res) => {
    const {id} = req.params;
    const deletedOrders = await deleteOrders(id)
    if (deletedOrders.id) {
        res.status(200).json(deletedOrders);
    } else {
        res.status(404).json("Order Not Found!")
    };
}) 

module.exports = order