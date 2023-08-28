const express = require("express");
const userOrder = express.Router();
const { getAllUserOrder, getUserOrder, createUserOrder, updateUserOrder, deleteUserOrder} = require("../queries/userOrders");
const { deleteUser } = require("../queries/users");

userOrder.get("/", async (req, res) => {
    const allUserOrder = await getAllUserOrder();
    if (!allUserOrder.error) {
        res.status(200).json(allUserOrder);
    } else {
        res.status(500).json({ error: "Server Error" });
    };
});

userOrder.get("/:id", async (req, res) => {
    const {id} = req.params;
    const userOrder = await getUserOrder();
    if (userOrder) {
        res.status(200).json(userOrder);
    } else {
        res.status(404).json({ error: "Not Found"});
    };
});

userOrder.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedUserOrder = await updateUserOrder(id, req.body);
    res.status(200).json(updatedUserOrder);
});

userOrder.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedUserOrder = await deleteUserOrder(id);
    if (deletedUserOrder.id) {
        res.status(200).json(deletedUserOrder);
    } else {
        res.status(404).json("userOrder Not Found!");
    };
});

module.exports = userOrder;