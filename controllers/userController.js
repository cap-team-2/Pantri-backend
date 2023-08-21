const express = require("express");
const user = express.Router();
const { getAllUser, getUser, createUser, updateUser, deleteUser} = require("../queries/user.js");

user.get("/", async (req, res) => {
    const allUser = await getAllUser();
    if (!allUser.error) {
        res.status(200).json(allUser);
    } else {
        res.status(500).json({ error: "Server Error"});
    };
});

user.get("/:id", async (req, res) => {
    const {id} = req.params;
    const cart = await getUser(id);
    if (user) {
        res.status(200).json(user);
    } else {
        res.status(404).json({ error: "Not Found"})
    };
});

user.post("/", async (req, res) => {
    try {
        const user = await createUser(req.body);
        res.status(200).json(cart);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

user.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedUser = updateUser(id, req.body);
    res.status(200).json(updatedUser);
});

user.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedUser = await deleteUser(id);
    if (deletedUser.id) {
        res.status(200).json(deletedUser);
    } else {
        res.status(404).json("User Was Not Found!");
    };
});

module.exports = user;