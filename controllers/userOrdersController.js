const express = require("express");
const userOrders = express.Router();
const { getAllUserOrders, getUserOrder, createUserOrder, updateUserOrder, deleteUserOrder} = require("../queries/userOrders");
// const { deleteUser } = require("../queries/users"); Do we need this here? -jn

userOrders.get("/", async (req, res) => {
    const allUserOrders = await getAllUserOrders();
    if (allUserOrders[0]) {
        res.status(200).json(allUserOrders);
    } else {
        res.status(500).json({ error: "Server Error" });
    };
});

userOrders.get("/:id", async (req, res) => {
    const {id} = req.params;
    const userOrder = await getUserOrder(id);
    if (userOrder) {
        res.status(200).json(userOrder);
    } else {
        res.status(404).json({ error: "Not Found"});
    };
});

userOrders.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedUserOrder = await updateUserOrder(id, req.body);
    res.status(200).json(updatedUserOrder);
});

userOrders.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedUserOrder = await deleteUserOrder(id);
    if (deletedUserOrder.id) {
        res.status(200).json(deletedUserOrder);
    } else {
        res.status(404).json("userOrder Not Found!");
    };
});

module.exports = userOrders;